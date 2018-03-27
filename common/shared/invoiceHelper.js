'use strict';
var fs = require('fs');
var path = require('path');
var i18next = require('i18next');
var loopback = require('loopback');
var rootlogger = loopback.log;
var async = require('async');
var _ = require('underscore');
var apiHelperObject = require('./apiHelper');
var csvHelper = require('./csvHelper');
var moment = require('moment');
var configFilePath = process.env.NODE_ENV == undefined ?
'' : '.' + process.env.NODE_ENV;
var config = require('../../server/config' + configFilePath + '.json');
var emailHelper = require('./emailHelper');

module.exports = function(app) {
  var ds = app.dataSources.mysql;
  var Student = app.models.Student;
  var UserModel = app.models.user;
  var Schools = app.models.School;

  var invoiceHelper =  {
    generateTodaysInvoice: (methodCallback) => {
      rootlogger.info('Starting invoice generation process');
      async.series([
        function(callback) {
          var sql = 'CALL `' + config.invoiceGeneratorSP1 + '`();';
          ds.connector.query(sql, function(err, data) {
            if (err) {
              console.log('Error:', err);
            }
            callback(null, data);
          });
        },
        function(callback) {
          var sql = 'CALL `' + config.invoiceGeneratorSP2 + '`();';
          ds.connector.query(sql, function(err, data) {
            if (err) {
              console.log('Error:', err);
            }
            callback(null, data);
          });
        },
        function(callback) {
          var sql = 'CALL `' + config.invoiceGeneratorSP3 + '`();';
          ds.connector.query(sql, function(err, data) {
            if (err) {
              console.log('Error:', err);
            }
            callback(null, data);
          });
        },
      ],
      function(err, results) {
        methodCallback();
        rootlogger.info('Completed invoice generation process.');
      });
    },
    registerInvoice: (invoiceDetails, callback) => {
      var apiHelper = apiHelperObject(app);
      var invoiceParams = [];
      invoiceParams.push(['merchantId', invoiceDetails.merchantId]);
      invoiceParams.push(['aggregatorId', invoiceDetails.aggregatorId]);
      invoiceParams.push(['userID', invoiceDetails.userId]);
      invoiceParams.push(['invoiceNo', invoiceDetails.invoiceNo]);
      invoiceParams.push(['desc', invoiceDetails.desc]);
      invoiceParams.push(['chargeAmount', invoiceDetails.totalChargeAmount]);
      invoiceParams.push(['currencyCode', '356']); // TO CHECK
      invoiceParams.push(['dueDate', invoiceDetails.dueDate]);
      if (invoiceDetails.ChargeHead1) {
        invoiceParams.push(['chargeHead1', invoiceDetails.ChargeHead1]);
      }
      if (invoiceDetails.ChargeHead2) {
        invoiceParams.push(['chargeHead2', invoiceDetails.ChargeHead2]);
      }
      if (invoiceDetails.ChargeHead3) {
        invoiceParams.push(['chargeHead3', invoiceDetails.ChargeHead3]);
      }
      if (invoiceDetails.ChargeHead4) {
        invoiceParams.push(['chargeHead4', invoiceDetails.ChargeHead4]);
      }
      if (invoiceDetails.ChargeHead5) {
        invoiceParams.push(['chargeHead5', invoiceDetails.ChargeHead5]);
      }
      if (invoiceDetails.ChargeHead6) {
        invoiceParams.push(['chargeHead6', invoiceDetails.ChargeHead6]);
      }
      if (invoiceDetails.ChargeHead7) {
        invoiceParams.push(['chargeHead7', invoiceDetails.ChargeHead7]);
      }
      if (invoiceDetails.ChargeHead8) {
        invoiceParams.push(['chargeHead8', invoiceDetails.ChargeHead8]);
      }
      if (invoiceDetails.ChargeHead9) {
        invoiceParams.push(['chargeHead9', invoiceDetails.ChargeHead9]);
      }
      if (invoiceDetails.ChargeHead10) {
        invoiceParams.push(['chargeHead10', invoiceDetails.ChargeHead10]);
      }
      if (invoiceDetails.ChargeHead11) {
        invoiceParams.push(['chargeHead11', invoiceDetails.ChargeHead11]);
      }
      if (invoiceDetails.ChargeHead12) {
        invoiceParams.push(['chargeHead12', invoiceDetails.ChargeHead12]);
      }
      if (invoiceDetails.AdditionalChargeHeadDetails) {
        invoiceParams.push(['additionalChargeHeadDetails', invoiceDetails.AdditionalChargeHeadDetails]);
      }

      if (!invoiceDetails.ChargeHead1 || invoiceDetails.ChargeHead1 == 0) {
        invoiceParams.push(['chargeHead1', 0]);
      }

      var concatenatedParams = apiHelper.getConcatenatedParams(invoiceParams);
      var hashedKey = apiHelper.getHashedKey(concatenatedParams);
      var userForm = apiHelper.getForm(invoiceParams, hashedKey);
      apiHelper.paymentInvoiceRequest(userForm, callback);
    },
    parseInvoiceDetails: (invoiceDetails) => {
      var firstInvoice = invoiceDetails.values[0];
      var invoiceData = {
        'merchantId': config.payPhiMerchantID,
        'aggregatorId': config.payPhiAggregatorID,
        'userId': firstInvoice.userId,
        'invoiceNo': firstInvoice.invoiceNumber,
        'desc': firstInvoice.desc,
        'totalChargeAmount': firstInvoice.totalChargeAmount,
        'currencyCode': '356',
        'dueDate': firstInvoice.dueDate,
        'merchantId': firstInvoice.merchantId,
        'aggregatorId': firstInvoice.aggregatorId,
      };
      _.each(invoiceDetails.values, function(invoiceRow) {
        switch (invoiceRow.invoiceType) {
          case 'ACD':
            invoiceData[invoiceRow.chargeHeadName] = invoiceRow.chargeAmount;
            break;
          case 'TRN':
            invoiceData['ChargeHead12'] = invoiceRow.chargeAmount;
            break;
          case 'ADH':
            invoiceData['AdditionalChargeHeadDetails'] = invoiceRow.feeHeadName + ': ' + invoiceRow.chargeAmount;
            break;
        }
      });
      return invoiceData;
    },
    updateInvoices: () => {
      rootlogger.info('Starting update invoice process');
      async.series([
        function(callback) {
          app.models.Invoice.find({
            where: {
              'updateField': {'neq': ''},
            },
          }, function(err, lists) {
            callback(null, lists);
          });
        },
      ],
      function(err, results) {
        var invoices = results[0];
        var invoiceListBySchool = [];
        _.each(invoices, function(invoiceDetails) {
          var schoolIndex = invoiceListBySchool.findIndex(x => x.schoolId == invoiceDetails.schoolId);
          if (schoolIndex != -1) {
            invoiceListBySchool[schoolIndex].invoices.push(invoiceDetails);
          } else {
            invoiceListBySchool.push({
              'schoolId': invoiceDetails.schoolId,
              'invoices': [invoiceDetails],
            });
          }
        });
        _.each(invoiceListBySchool, function(schoolDetail) {
          var waterfallFunctions = [];
          var failedInvoices = [];
          var registeredInvoices = [];

          _.each(schoolDetail.invoices, function(invoiceDetail) {
            waterfallFunctions.push(function(next) {
              invoiceHelper.updateInvoice(invoiceDetail, function(error) {
                if (error) {
                  invoiceDetail['ErrorMessage'] = error.respDescription;
                  failedInvoices.push(invoiceDetail);
                } else {
                  invoiceDetail['ErrorMessage'] = 'Invoice updated successfully';
                  registeredInvoices.push(invoiceDetail);
                }
                next();
              });
            });
          });

          async.waterfall(waterfallFunctions, function(err) {
            async.series([
              function(callback) {
                Schools.find({
                  where: {
                    id: schoolDetail.schoolId,
                  },
                }, function(err, schoolsList) {
                  callback(null, schoolsList);
                });
              },
              function(callback) {
                UserModel.getEmails(schoolDetail.schoolId, function(err, emailsList) {
                  callback(null, emailsList);
                });
              },
              function(callback) {
                UserModel.find({
                  where: {
                    roleId: 1,
                  },
                }, function(err, schoolsList) {
                  callback(null, schoolsList);
                });
              },
            ],
            function(err, results) {
              var schoolName = results[0].length > 0 ? results[0][0].schoolName : '';
              var schoolAdminEmails = '';
              var superAdminEmails = '';

              rootlogger.info('Completed invoice updation process for school:' + schoolName);
              var fileName = schoolName + ' Invoice Update Report.csv';
              csvHelper.generateInvoiceUpdateCSV(fileName, registeredInvoices, failedInvoices, function() {
                _.each(results[1], function(schoolAdminEmail) {
                  if (schoolAdminEmails == '') {
                    schoolAdminEmails += schoolAdminEmail.email;
                  } else {
                    schoolAdminEmails += (', ' + schoolAdminEmail.email);
                  }
                });
                _.each(results[2], function(superAdminEmail) {
                  if (superAdminEmails == '') {
                    superAdminEmails += superAdminEmail.email;
                  } else {
                    superAdminEmails += (', ' + superAdminEmail.email);
                  }
                });

                rootlogger.info('Sending email for invoice of school: ' + schoolName);
                emailHelper.getEmailText('csv_updateInvoiceEmailReport', {savedInvoices: registeredInvoices.length, failedInvoices: failedInvoices.length, schoolName: schoolName}, function(error, html) {
                  app.models.Email.send({
                    to: schoolAdminEmails,
                    cc: superAdminEmails,
                    from: config.supportEmailID,
                    subject: i18next.t('csv_invoiceUpdationEmailSubject', {schoolName: schoolName}),
                    html: html,
                    attachments: [
                      {
                        filename: fileName,
                        content: fs.createReadStream(fileName),
                      }],
                  }, function(err) {
                    if (err) {
                      rootlogger.info('Error sending email for invoice for school: ' + schoolName);
                    }
                    rootlogger.info('Sent email for invoice of school: ' + schoolName);
                  });
                });
              });
            });
          });
        });
      });
    },
    registerInvoices: () => {
      rootlogger.info('Starting invoice registration process');
      async.series([
        function(callback) {
          var sql = 'CALL `' + config.invoiceGeneratorSP4 + '`();';
          ds.connector.query(sql, function(err, data) {
            if (err) {
              console.log('Error:', err);
              callback(null, [[]]);
            } else {
              callback(null, data);
            }
          });
        },
      ],
      function(err, results) {
        var invoices = results[0][0];
        var invoiceListBySchool = [];
        _.each(invoices, function(invoiceDetails) {
          var invoiceIndex = invoiceListBySchool.findIndex(x => x.schoolId == invoiceDetails.schoolId);
          if (invoiceIndex != -1) {
            var invoiceArrayIndex = invoiceListBySchool[invoiceIndex].invoices.findIndex(x => x.invoiceNumber == invoiceDetails.invoiceNumber);
            if (invoiceArrayIndex != -1) {
              invoiceListBySchool[invoiceIndex].invoices[invoiceArrayIndex].values.push(invoiceDetails);
            } else {
              invoiceListBySchool[invoiceIndex].invoices.push({'invoiceNumber': invoiceDetails.invoiceNumber, 'values': [invoiceDetails]});
            }
          } else {
            invoiceListBySchool.push({
              'schoolId': invoiceDetails.schoolId,
              'invoices': [{'invoiceNumber': invoiceDetails.invoiceNumber, 'values': [invoiceDetails]}],
            });
          }
        });
        _.each(invoiceListBySchool, function(schoolDetail) {
          var waterfallFunctions = [];
          var failedInvoices = [];
          var registeredInvoices = [];

          _.each(schoolDetail.invoices, function(invoiceDetail) {
            var invoiceData = invoiceHelper.parseInvoiceDetails(invoiceDetail);
            waterfallFunctions.push(function(next) {
              invoiceHelper.registerInvoice(invoiceData, function(error) {
                if (error) {
                  invoiceData['ErrorMessage'] = error.respDescription;
                  failedInvoices.push(invoiceData);
                } else {
                  invoiceData['ErrorMessage'] = 'Invoice created successfully';
                  registeredInvoices.push(invoiceData);
                }
                next();
              });
            });
          });

          async.waterfall(waterfallFunctions, function(err) {
            async.series([
              function(callback) {
                Schools.find({
                  where: {
                    id: schoolDetail.schoolId,
                  },
                }, function(err, schoolsList) {
                  callback(null, schoolsList);
                });
              },
              function(callback) {
                UserModel.getEmails(schoolDetail.schoolId, function(err, emailsList) {
                  callback(null, emailsList);
                });
              },
              function(callback) {
                UserModel.find({
                  where: {
                    roleId: 1,
                  },
                }, function(err, schoolsList) {
                  callback(null, schoolsList);
                });
              },
            ],
            function(err, results) {
              var schoolName = results[0].length > 0 ? results[0][0].schoolName : '';
              var schoolAdminEmails = '';
              var superAdminEmails = '';
              rootlogger.info('Completed invoice registration process for school:' + schoolName);

              var fileName = schoolName + ' Invoice Registration Report.csv';
              csvHelper.generateInvoiceRegistrationCSV(fileName, registeredInvoices, failedInvoices, function() {
                _.each(results[1], function(schoolAdminEmail) {
                  if (schoolAdminEmails == '') {
                    schoolAdminEmails += schoolAdminEmail.email;
                  } else {
                    schoolAdminEmails += (', ' + schoolAdminEmail.email);
                  }
                });
                _.each(results[2], function(superAdminEmail) {
                  if (superAdminEmails == '') {
                    superAdminEmails += superAdminEmail.email;
                  } else {
                    superAdminEmails += (', ' + superAdminEmail.email);
                  }
                });
                rootlogger.info('Sending email for invoice of school: ' + schoolName);
                emailHelper.getEmailText('csv_registerInvoiceEmailReport', {savedInvoices: registeredInvoices.length, failedInvoices: failedInvoices.length, schoolName: schoolName}, function(error, html) {
                  app.models.Email.send({
                    to: schoolAdminEmails,
                    cc: superAdminEmails,
                    from: config.supportEmailID,
                    subject: i18next.t('csv_invoiceRegistrationEmailSubject', {schoolName: schoolName}),
                    html: html,
                    attachments: [
                      {
                        filename: fileName,
                        content: fs.createReadStream(fileName),
                      }],
                  }, function(err) {
                    if (err) {
                      rootlogger.info('Error sending email for invoice for school: ' + schoolName);
                    }
                    rootlogger.info('Sent email for invoice of school: ' + schoolName);
                  });
                });
              });
            });
          });
        });
        rootlogger.info('Completed invoice generation process.');
      });
    },
    updateInvoice: (invoice, callback) => {
      var apiHelper = apiHelperObject(app);
      var invoiceParams = [];
      invoiceParams.push(['merchantId', invoice.merchantId]);
      invoiceParams.push(['aggregatorId', invoice.aggregatorId]);
      invoiceParams.push(['userID', invoice.userId]);
      invoiceParams.push(['invoiceNo', invoice.invoiceNumber]);
      if (invoice.status == 'Paid') {
        invoiceParams.push(['invoiceStatus', 'P']);
      } else if (invoice.status == 'Closed') {
        invoiceParams.push(['invoiceStatus', 'C']);
      } else {
        invoiceParams.push(['invoiceStatus', 'O']);
      }
      if (invoice.updateField == 'S') {
        if (invoice.desc) {
          invoiceParams.push(['desc', invoice.desc]);
        }
      } else if (invoice.updateField == 'D') {
        if (invoice.dueDate) {
          invoiceParams.push(['dueDate', moment(invoice.dueDate).format('DD/MM/YYYY')]);
        }
      }

      var concatenatedParams = apiHelper.getConcatenatedParams(invoiceParams);
      var hashedKey = apiHelper.getHashedKey(concatenatedParams);
      var userForm = apiHelper.getForm(invoiceParams, hashedKey);
      apiHelper.paymentInvoiceUpdate(userForm, callback);
    },
    convertGender: (gender) => {
      switch (gender) {
        case 'Male':
          return 'M';
        case 'Female':
          return 'F';
      }
      return 'N';
    },
    convertDOB: (dob) => {
      if (!dob) {
        return '2000/01/01';
      }
      return dob.getDate() + '/' + dob.getMonth() + '/' + dob.getFullYear();
    },
    convertParentName: (name) => {
      return name != '' ? name : 'NA';
    },
    getStudentMobileNumber: (student) => {
      if (student.fatherMobile) return student.fatherMobile;
      if (student.motherMobile) return student.motherMobile;
      if (student.guardianMobile) return student.guardianMobile;
      return student.phone;
    },
    registerStudent: (studentDetails, callback) => {
      var apiHelper = apiHelperObject(app);
      var userParams = [];
      userParams.push(['merchantId', config.payPhiMerchantID]);
      userParams.push(['aggregatorId', config.payPhiAggregatorID]);
      userParams.push(['userID', studentDetails.studentCode]); // TODO: Confirm if it should be student code
      userParams.push(['actionCode', 'I']);
      userParams.push(['title', studentDetails.title]);
      userParams.push(['fName', studentDetails.studentFirstName]);
      userParams.push(['lName', studentDetails.studentLastName]);
      userParams.push(['gender', invoiceHelper.convertGender(studentDetails.studentGender)]);
      userParams.push(['dob', invoiceHelper.convertDOB(studentDetails.studentDateOfBirth)]);
      userParams.push(['fatherName', invoiceHelper.convertParentName(studentDetails.fatherFirstName)]);
      userParams.push(['motherName', invoiceHelper.convertParentName(studentDetails.motherFirstName)]);
      userParams.push(['mobileNo', invoiceHelper.getStudentMobileNumber(studentDetails)]);
      userParams.push(['emailID', studentDetails.email]);
      userParams.push(['studentCode', studentDetails.studentCode]);
      if (studentDetails.address) {
        userParams.push(['addrLine1', studentDetails.address]);
      }
      if (studentDetails.city) {
        userParams.push(['city', studentDetails.city]);
      }
      if (studentDetails.state) {
        userParams.push(['state', studentDetails.state]);
      }

      var concatenatedParams = apiHelper.getConcatenatedParams(userParams);
      var hashedKey = apiHelper.getHashedKey(concatenatedParams);
      var userForm = apiHelper.getForm(userParams, hashedKey);
      apiHelper.registerOrUpdateUser(userForm, callback);
    },
    registerStudents: () => {
      async.series([
        function(callback) {
          Student.find({
            where: {
              'isRegistered': 0,
            },
          }, function(err, lists) {
            callback(null, lists);
          });
        },
      ],
      function(err, results) {
        var students = results[0];
        var studentListBySchool = [];
        _.each(students, function(studentDetails) {
          var schoolIndex = studentListBySchool.findIndex(x => x.schoolId == studentDetails.schoolId);
          if (schoolIndex != -1) {
            studentListBySchool[schoolIndex].students.push(studentDetails);
          } else {
            studentListBySchool.push({
              'schoolId': studentDetails.schoolId,
              'students': [studentDetails],
            });
          }
        });
        _.each(studentListBySchool, function(schoolDetail) {
          var waterfallFunctions = [];
          var failedStudents = [];
          var registeredStudents = [];
          _.each(schoolDetail.students, function(student) {
            waterfallFunctions.push(function(next) {
              invoiceHelper.registerStudent(student, function(error) {
                if (error) {
                  student['ErrorMessage'] = error.respDescription;
                  failedStudents.push(student);
                } else {
                  student['ErrorMessage'] = 'User created successfully';
                  registeredStudents.push(student);
                }
                next();
              });
            });
          });
          async.waterfall(waterfallFunctions, function(err) {
            async.series([
              function(callback) {
                Schools.find({
                  where: {
                    id: schoolDetail.schoolId,
                  },
                }, function(err, schoolsList) {
                  callback(null, schoolsList);
                });
              },
              function(callback) {
                UserModel.getEmails(schoolDetail.schoolId, function(err, emailsList) {
                  callback(null, emailsList);
                });
              },
              function(callback) {
                UserModel.find({
                  where: {
                    roleId: 1,
                  },
                }, function(err, schoolsList) {
                  callback(null, schoolsList);
                });
              },
            ],
            function(err, results) {
              var schoolName = results[0].length > 0 ? results[0][0].schoolName : '';
              var schoolAdminEmails = '';
              var superAdminEmails = '';

              rootlogger.info('Completed student registration process for school:' + schoolName);
              var fileName = schoolName + 'Registration Report.csv';
              csvHelper.generateStudentRegistrationCSV(fileName, registeredStudents, failedStudents, function() {
                _.each(results[1], function(schoolAdminEmail) {
                  if (schoolAdminEmails == '') {
                    schoolAdminEmails += schoolAdminEmail.email;
                  } else {
                    schoolAdminEmails += (', ' + schoolAdminEmail.email);
                  }
                });
                _.each(results[2], function(superAdminEmail) {
                  if (superAdminEmails == '') {
                    superAdminEmails += superAdminEmail.email;
                  } else {
                    superAdminEmails += (', ' + superAdminEmail.email);
                  }
                });

                rootlogger.info('Sending email for student registration of school: ' + schoolName);
                emailHelper.getEmailText('csv_registerStudentEmailReport', {savedStudents: registeredStudents.length, failedStudents: failedStudents.length, schoolName: schoolName}, function(error, html) {
                  app.models.Email.send({
                    to: schoolAdminEmails,
                    cc: superAdminEmails,
                    from: config.supportEmailID,
                    subject: i18next.t('csv_studentRegistrationEmailSubject', {schoolName: schoolName}),
                    html: html,
                    attachments: [
                      {
                        filename: fileName,
                        content: fs.createReadStream(fileName),
                      }],
                  }, function(err) {
                    if (err) {
                      rootlogger.info('Error sending student registration report to email=\'' + schoolAdminEmails + '\',\n Error=' + err);
                    }
                    rootlogger.info('Sent email for student registration of school: ' + schoolName);
                  });
                });
              });
            });
          });
        });
      });
    },
    generateInvoiceForStudent: (studentDetails, methodCallback) => {
      rootlogger.info('Starting invoice generation process for student ' + studentDetails.id);
      async.series([
        function(callback) {
          var sql = 'CALL `' + config.invoiceGeneratorForSingleStudent + '`("' + studentDetails.schoolId + '","' + studentDetails.id + '");';
          ds.connector.query(sql, function(err, data) {
            if (err) {
              console.log('Error:', err);
              callback(err);
            }
            callback(null);
          });
        },
      ],
      function(err, results) {
        methodCallback();
        rootlogger.info('Completed invoice generation process for student ' + studentDetails.id);
      });
    },
    registerNewlyCreatedStudent: (studentDetails, callback) => {
      async.series([
        function(callback) {
          Student.find({
            where: {
              // 'isRegistered': 0,
              'id': studentDetails.id,
            },
          }, function(err, lists) {
            callback(null, lists);
          });
        },
      ],
      function(err, results) {
        var students = results[0];
        if (students.length == 0) {
          callback('No matching student found.');
          return;
        }

        _.each(students, function(studentDetail) {
          console.log('studentDetail:', studentDetail);

          invoiceHelper.registerStudent(studentDetail, function(error) {
            if (error) {
              callback(error.respDescription);
            } else {
              invoiceHelper.generateInvoiceForStudent(studentDetails, function(error) {
                if (error) {
                  callback(error);
                } else {
                  invoiceHelper.registerInvoicesForSingleStudent(studentDetail.id, function(err, data) {
                    if (err) {
                      callback(err);
                    } else {
                      callback(null);
                    }
                  });
                }
              });
            }
          });
        });
      });
    },
    registerInvoicesForSingleStudent: (studentId, callback) => {
      rootlogger.info('Starting invoice registration process');
      async.series([
        function(callback) {
          var sql = 'CALL `spSelectInoviceForStudent`(' + studentId + ');';
          ds.connector.query(sql, function(err, data) {
            if (err) {
              console.log('Error:', err);
              callback(null, [[]]);
            } else {
              callback(null, data);
            }
          });
        },
      ],
      function(err, results) {
        var invoices = results[0][0];
        var invoiceListBySchool = [];
        _.each(invoices, function(invoiceDetails) {
          var invoiceIndex = invoiceListBySchool.findIndex(x => x.schoolId == invoiceDetails.schoolId);
          if (invoiceIndex != -1) {
            var invoiceArrayIndex = invoiceListBySchool[invoiceIndex].invoices.findIndex(x => x.invoiceNumber == invoiceDetails.invoiceNumber);
            if (invoiceArrayIndex != -1) {
              invoiceListBySchool[invoiceIndex].invoices[invoiceArrayIndex].values.push(invoiceDetails);
            } else {
              invoiceListBySchool[invoiceIndex].invoices.push({'invoiceNumber': invoiceDetails.invoiceNumber, 'values': [invoiceDetails]});
            }
          } else {
            invoiceListBySchool.push({
              'schoolId': invoiceDetails.schoolId,
              'invoices': [{'invoiceNumber': invoiceDetails.invoiceNumber, 'values': [invoiceDetails]}],
            });
          }
        });
        _.each(invoiceListBySchool, function(schoolDetail) {
          var waterfallFunctions = [];
          var failedInvoices = [];
          var registeredInvoices = [];

          _.each(schoolDetail.invoices, function(invoiceDetail) {
            var invoiceData = invoiceHelper.parseInvoiceDetails(invoiceDetail);
            waterfallFunctions.push(function(next) {
              invoiceHelper.registerInvoice(invoiceData, function(error) {
                if (error) {
                  invoiceData['ErrorMessage'] = error.respDescription;
                  failedInvoices.push(invoiceData);
                } else {
                  invoiceData['ErrorMessage'] = 'Invoice created successfully';
                  registeredInvoices.push(invoiceData);
                }
                next();
              });
            });
          });

          async.waterfall(waterfallFunctions, function(err) {
            async.series([
              function(callback) {
                Schools.find({
                  where: {
                    id: schoolDetail.schoolId,
                  },
                }, function(err, schoolsList) {
                  callback(null, schoolsList);
                });
              },
              function(callback) {
                UserModel.getEmails(schoolDetail.schoolId, function(err, emailsList) {
                  callback(null, emailsList);
                });
              },
              function(callback) {
                UserModel.find({
                  where: {
                    roleId: 1,
                  },
                }, function(err, schoolsList) {
                  callback(null, schoolsList);
                });
              },
            ],
            function(err, results) {
              var schoolName = results[0].length > 0 ? results[0][0].schoolName : '';
              var schoolAdminEmails = '';
              var superAdminEmails = '';
              rootlogger.info('Completed invoice registration process for school:' + schoolName);

              var fileName = schoolName + ' Invoice Registration Report.csv';
              csvHelper.generateInvoiceRegistrationCSV(fileName, registeredInvoices, failedInvoices, function() {
                _.each(results[1], function(schoolAdminEmail) {
                  if (schoolAdminEmails == '') {
                    schoolAdminEmails += schoolAdminEmail.email;
                  } else {
                    schoolAdminEmails += (', ' + schoolAdminEmail.email);
                  }
                });
                _.each(results[2], function(superAdminEmail) {
                  if (superAdminEmails == '') {
                    superAdminEmails += superAdminEmail.email;
                  } else {
                    superAdminEmails += (', ' + superAdminEmail.email);
                  }
                });
                rootlogger.info('Sending email for invoice of school: ' + schoolName);
                emailHelper.getEmailText('csv_registerInvoiceEmailReport', {savedInvoices: registeredInvoices.length, failedInvoices: failedInvoices.length, schoolName: schoolName}, function(error, html) {
                  app.models.Email.send({
                    to: schoolAdminEmails,
                    cc: superAdminEmails,
                    from: config.supportEmailID,
                    subject: i18next.t('csv_invoiceRegistrationEmailSubject', {schoolName: schoolName}),
                    html: html,
                    attachments: [
                      {
                        filename: fileName,
                        content: fs.createReadStream(fileName),
                      }],
                  }, function(err) {
                    if (err) {
                      rootlogger.info('Error sending email for invoice for school: ' + schoolName);
                      callback(err, null);
                    }
                    rootlogger.info('Sent email for invoice of school: ' + schoolName);
                    callback();
                  });
                });
              });
            });
          });
        });
        rootlogger.info('Completed invoice generation process.');
      });
    },
  };

  return invoiceHelper;
};

