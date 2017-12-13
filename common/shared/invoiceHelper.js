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
var configFilePath = process.env.NODE_ENV == undefined ?
'' : '.' + process.env.NODE_ENV;
var config = require('../../server/config' + configFilePath + '.json');

module.exports = function(app) {
  var ds = app.dataSources.mysql;
  var Student = app.models.Student;
  var UserModel = app.models.user;
  var Schools = app.models.School;

  var invoiceHelper =  {
    generateTodaysInvoice: () => {
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
        rootlogger.info('Completed invoice generation process.');
      });
    },
    registerInvoice: (invoiceDetails, callback) => {
      var apiHelper = apiHelperObject(app);
      var invoiceParams = [];
      invoiceParams.push(['merchantId', config.payPhiMerchantID]);
      invoiceParams.push(['aggregatorId', config.payPhiAggregatorID]);
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
      };
      _.each(invoiceDetails.values, function(invoiceRow) {
        switch (invoiceRow.invoiceType) {
          case 'ACD':
            invoiceData[invoiceRow.chargeHeadName] = invoiceRow.chargeAmount;
            break;
          case 'ADH':
            invoiceData['AdditionalChargeHeadDetails'] = invoiceRow.feeHeadName + ': ' + invoiceRow.chargeAmount;
            break;
        }
      });
      return invoiceData;
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

              var fileName = schoolName + ' Invoice Registration Report.csv';
              csvHelper.generateInvoiceRegistrationCSV(fileName, registeredInvoices, failedInvoices);

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
              var html = i18next.t('csv_registerInvoiceEmailReportHTMLContent', {savedInvoices: registeredInvoices.length, failedInvoices: failedInvoices.length, schoolName: schoolName});
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
                  rootlogger.info('Error sending upload report to email=\'' + schoolAdminEmails + '\',\n Error=' + err);
                }
                console.log('> upload report mail sent successfully');
              });
            });
          });
        });
        rootlogger.info('Completed invoice generation process.');
      });
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
      return dob.getDate() + '/' + dob.getMonth() + '/' + dob.getFullYear();
    },
    convertParentName: (name) => {
      return name != '' ? name : 'NA';
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
      userParams.push(['mobileNo', studentDetails.phone]);
      userParams.push(['emailID', studentDetails.email]);
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

              var fileName = schoolName + 'Registration Report.csv';
              csvHelper.generateStudentRegistrationCSV(fileName, registeredStudents, failedStudents);

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
              var html = i18next.t('csv_registerStudentEmailReportHTMLContent', {savedStudents: registeredStudents.length, failedStudents: failedStudents.length, schoolName: schoolName});
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
                  rootlogger.info('Error sending upload report to email=\'' + schoolAdminEmails + '\',\n Error=' + err);
                }
                console.log('> upload report mail sent successfully');
              });
            });
          });
        });
      });
    },
  };

  return invoiceHelper;
};

