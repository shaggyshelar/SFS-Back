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
    registerInvoices: () => {
      rootlogger.info('Starting invoice registration process');
      async.series([
        function(callback) {
          var sql = 'CALL `' + config.invoiceGeneratorSP4 + '`();';
          ds.connector.query(sql, function(err, data) {
            if (err) {
              console.log('Error:', err);
            }
            callback(null, data);
          });
        },
      ],
      function(err, results) {
        var invoices = results[0];
        var invoiceListBySchool = [];
        _.each(invoices, function(invoiceDetails) {
          var invoiceIndex = invoiceListBySchool.findIndex(x => x.schoolId == invoiceDetails.schoolId);
          if (invoiceIndex != -1) {
            invoiceListBySchool[invoiceIndex].invoices.push(invoiceDetails);
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
          _.each(schoolDetail.invoices, function(student) {
            waterfallFunctions.push(function(next) {
              invoiceHelper.registerStudent(student, function(error) {
                if (error) {
                  student['ErrorMessage'] = error.respDescription;
                  failedInvoices.push(student);
                } else {
                  student['ErrorMessage'] = 'Invoice created successfully';
                  registeredInvoices.push(student);
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
              csvHelper.generateStudentRegistrationCSV(fileName, registeredInvoices, failedInvoices);

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
              var html = i18next.t('csv_registerInvoiceEmailReportHTMLContent', {savedInvoices: registeredInvoices.length, failedInvoices: failedInvoices.length});
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
              var html = i18next.t('csv_registerStudentEmailReportHTMLContent', {savedStudents: registeredStudents.length, failedStudents: failedStudents.length});
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

