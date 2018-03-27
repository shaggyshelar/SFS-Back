'use strict';

var dsConfig = require('../datasources.json');
var config = require('../config.json');
var path = require('path');
var multer = require('multer');
var upload = multer({ dest: './Uploads/' });
var fs = require('fs');
var csv = require('fast-csv');
var loopback = require('loopback');
var rootlogger = loopback.log;
var async = require('async');
var _ = require('underscore');
var i18next = require('i18next');
var permissionHelper = require('../../common/shared/permissionsHelper');
var utilities = require('../../common/shared/utilities');
var apiHelperObject = require('../../common/shared/apiHelper');
var invoiceHelper = require('../../common/shared/invoiceHelper');
var moment = require('moment');
var dateHelper = require('../../common/shared/dateHelper');
var validator = require('validator');
var emailHelper=require('../../common/shared/emailHelper');

module.exports = function (app) {
  var ds = app.dataSources.mysql;
  var User = app.models.user;
  var Schools = app.models.School;
  var Categories = app.models.Category;
  var Invoice = app.models.Invoice;
  utilities.init(app);

  app.get('/verified', function (req, res) {
    var localizedMessage = i18next.t('key');
    console.log('Localized Message = ' + localizedMessage);

    rootlogger.info('hi');
    rootlogger.warn({ lang: 'fr' }, 'au revoir');
    res.render('verified');
  });

  app.get('/registerStudents', function (req, res) {
    var invHelper = invoiceHelper(app);
    invHelper.registerStudents();
    res.status(200);
    res.json({'Message': 'Student Registration in progress...'});
  });

  app.post('/registerStudent', function(req, res) {
    if (!req.body.studentId) {
      res.status(400);
      res.json({'Message': i18next.t('csv_registerStudentInvalidStudentId')});
      return;
    }

    if (!req.body.schoolId) {
      res.status(400);
      res.json({'Message': i18next.t('csv_registerStudentInvalidSchoolId')});
      return;
    }

    var invHelper = invoiceHelper(app);
    invHelper.registerNewlyCreatedStudent({id: req.body.studentId, schoolId: req.body.schoolId},
      function(err) {
        if (err) {
          res.status(500);
          res.json({'Message': err});
        } else {
          res.status(200);
          res.json({'Message': 'Student Registration completed. Please check your email for more details.'});
        }
      });
  });

  app.post('/apiParamsHelper', function (req, res) {
    var keys = Object.keys(req.body);
    var params = [];
    _.each(keys, function(key) {
      if (req.body[key]) {
        params.push([key, req.body[key]]);
      }
    });

    var apiHelper = apiHelperObject(app);
    var concatenatedParams = apiHelper.getSortedParams(params);
    var hashedKey = apiHelper.getHashedKey(concatenatedParams.concatenatedString);
    var userForm = apiHelper.getForm(params, hashedKey);
    var toReturnObject = {
      'sortedParams': concatenatedParams.sortedParams,
      'concatenatedParams': concatenatedParams.concatenatedString,
      'hashedKey': hashedKey,
      'form': userForm,
    };
    res.status(200);
    res.json(toReturnObject);
  });

  app.get('/registerInvoices', function (req, res) {
    var invHelper = invoiceHelper(app);
    invHelper.registerInvoices();
    res.status(200);
    res.json({'Message': 'Invoice registration in progress...'});
  });

  app.get('/updateInvoices', function (req, res) {
    var invHelper = invoiceHelper(app);
    invHelper.updateInvoices();
    res.status(200);
    res.json({'Message': 'Invoice updation in progress...'});
  });

  app.get('/generateTodaysInvoice', function (req, res) {
    var invHelper = invoiceHelper(app);
    invHelper.generateTodaysInvoice(function(error) {
      res.status(200);
      res.json({'Message': 'Invoice generation completed.'});
    });
  });

  app.post('/api/paymentAdvice', function (req, res) {
    var apiHelper = apiHelperObject(app);

    var keys = Object.keys(req.body);
    var params = [];
    _.each(keys, function(key) {
      if (key != "secureHash") {
        params.push([key, req.body[key]]);
      }
    });

    var concatenatedParams = apiHelper.getConcatenatedParams(params);
    var hashedKey = apiHelper.getHashedKey(concatenatedParams);

    if (req.body.secureHash !== hashedKey) {
      res.status(400);
      res.json({'Message': i18next.t('api_validation_adviceInvalidSecureHash')});
      return;
    }

    var errorMessages = '';
    var userParams = [];
    if (req.body.aggregatorID) {
      userParams.push(['aggregatorId', req.body.aggregatorID]);
    } else {
      errorMessages += i18next.t('api_validation_adviceParameterRequired', {parameterType: 'aggregatorId' });
    }
    if (req.body.merchantId) {
      userParams.push(['merchantId', req.body.merchantId]);
    } else {
      errorMessages += i18next.t('api_validation_adviceParameterRequired', {parameterType: 'merchantId' });
    }
    if (req.body.invoiceNo) {
      userParams.push(['invoiceNo', req.body.invoiceNo]);
    } else {
      errorMessages += i18next.t('api_validation_adviceParameterRequired', {parameterType: 'invoiceNo' });
    }
    if (req.body.userID) {
      userParams.push(['userID', req.body.userID]);
    }
    if (req.body.chargeAmount) {
      userParams.push(['chargeAmount', req.body.chargeAmount]);
    } else {
      errorMessages += i18next.t('api_validation_adviceParameterRequired', {parameterType: 'chargeAmount' });
    }
    if (req.body.txnID) {
      userParams.push(['txnID', req.body.txnID]);
    } else {
      errorMessages += i18next.t('api_validation_adviceParameterRequired', {parameterType: 'txnID' });
    }
    if (req.body.paymentID) {
      userParams.push(['paymentID', req.body.paymentID]);
    } else {
      errorMessages += i18next.t('api_validation_adviceParameterRequired', {parameterType: 'paymentID' });
    }
    if (req.body.paymentDateTime) {
      userParams.push(['paymentDateTime', req.body.paymentDateTime]);
      if (!moment(req.body.paymentDateTime, 'YYYYMMDDHHmmss', true).isValid()) {
        errorMessages += i18next.t('api_validation_adviceInvalidDate');
      }
    } else {
      errorMessages += i18next.t('api_validation_adviceParameterRequired', {parameterType: 'paymentDateTime' });
    }
    if (req.body.optionalChargeHeadsPaid) {
      userParams.push(['optionalChargeHeadsPaid', req.body.optionalChargeHeadsPaid]);
    }
    if (req.body.calculatedLateFees) {
      userParams.push(['calculatedLateFees', req.body.calculatedLateFees]);
    }
    if (!req.body.secureHash) {
      errorMessages += i18next.t('api_validation_adviceParameterRequired', {parameterType: 'secureHash' });
    }

    if (errorMessages != '') {
      res.status(400);
      res.json({'Message': errorMessages});
      return;
    }

    // Commented on 27 Dec 2017 - Moved the same functionality on top
    // var concatenatedParams = apiHelper.getConcatenatedParams(userParams);
    // var hashedKey = apiHelper.getHashedKey(concatenatedParams);

    // if (req.body.secureHash !== hashedKey) {
    //   res.status(400);
    //   res.json({'Message': i18next.t('api_validation_adviceInvalidSecureHash')});
    //   return;
    // }

    async.series([
      function(callback) {
        // merchantId, aggregatorId, userId, invoiceNumber
        var sql = "CALL `spSelectInvoiceByParameter`('" + req.body.merchantId + "','" + req.body.aggregatorID + "','" + req.body.userID + "','" + req.body.invoiceNo + "');";
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
      var data = results[0][0].length > 0 ? results[0][0][0] : {'errorMessage': i18next.t('api_validation_noMatchingInvoiceFound')};
      if (data.errorMessage) {
        res.status(400);
        res.json({'Message': data.errorMessage});
        return;
      }

      var findInvoiceQuery = {
        invoiceNumber: req.body.invoiceNo,
        merchantId: req.body.merchantId,
        aggregatorId: req.body.aggregatorID,
      };

      if (req.body.userID) {
        findInvoiceQuery.userId = req.body.userID;
      }

      Invoice.find({
        where: findInvoiceQuery,
      }, function(err, invoiceList) {
        if (err) {
          res.status(500);
          res.json(err);
        } else {
          if (!invoiceList || invoiceList.length == 0) {
            res.status(400);
            res.json({'Message': i18next.t('api_validation_noMatchingInvoiceFound')});
            return;
          }

          var foundInvoice = invoiceList[0];

          if (foundInvoice.status != 'Processed') {
            res.status(400);
            res.json({'Message': i18next.t('api_validation_invoiceNotInProcessedStatus')});
            return;
          }

          if (foundInvoice.status == 'Paid') {
            res.status(400);
            res.json({'Message': i18next.t('api_validation_invoiceAlreadyPaid')});
            return;
          }

          var updatedInvoice = {
            'totalChargeAmountPaid': req.body.chargeAmount,
            'transactionId': req.body.txnID,
            'paymentId': req.body.paymentID,
            'paymentDate': moment(req.body.paymentDateTime, 'YYYYMMDDHHmmss', true).format('YYYY-MM-DD HH:mm:ss'),
            'status': 'Paid',
            'updatedBy': 1,
            'updatedOn': dateHelper.getUTCManagedDateTime(),
          };
          if (req.body.calculatedLateFees) {
            updatedInvoice.calculatedLateFees = req.body.calculatedLateFees;
          }
          Invoice.updateAll({id: foundInvoice.id}, updatedInvoice, function (err, updatedUser) {
            if (err) {
              res.status(500);
              res.json(err);
            } else {
              res.status(200);
              res.json({'Message': i18next.t('api_paymentAdviceSuccess')});
            }
          });
        }
      });
    });
  });

  app.post('/api/paymentSettlement', function (req, res) {
    var apiHelper = apiHelperObject(app);

    var keys = Object.keys(req.body);
    var params = [];
    _.each(keys, function(key) {
      if (key != "secureHash") {
        params.push([key, req.body[key]]);
      }
    });

    var concatenatedParams = apiHelper.getConcatenatedParams(params);
    var hashedKey = apiHelper.getHashedKey(concatenatedParams);

    if (req.body.secureHash !== hashedKey) {
      res.status(400);
      res.json({'Message': i18next.t('api_validation_adviceInvalidSecureHash')});
      return;
    }

    var errorMessages = '';
    var userParams = [];
    if (req.body.aggregatorID) {
      userParams.push(['aggregatorId', req.body.aggregatorID]);
    } else {
      errorMessages += i18next.t('api_validation_adviceParameterRequired', {parameterType: 'aggregatorId' });
    }
    if (req.body.merchantId) {
      userParams.push(['merchantId', req.body.merchantId]);
    } else {
      errorMessages += i18next.t('api_validation_adviceParameterRequired', {parameterType: 'merchantId' });
    }
    if (req.body.invoiceNo) {
      userParams.push(['invoiceNo', req.body.invoiceNo]);
    } else {
      errorMessages += i18next.t('api_validation_adviceParameterRequired', {parameterType: 'invoiceNo' });
    }
    if (req.body.userID) {
      userParams.push(['userID', req.body.userID]);
    }
    if (req.body.settlementID) {
      userParams.push(['settlementID', req.body.settlementID]);
    } else {
      errorMessages += i18next.t('api_validation_adviceParameterRequired', {parameterType: 'settlementID' });
    }
    if (req.body.settlementDate) {
      userParams.push(['settlementDate', req.body.settlementDate]);
      if (!moment(req.body.settlementDate, 'YYYYMMDD', true).isValid()) {
        errorMessages += i18next.t('api_validation_settlementInvalidDate');
      }
    } else {
      errorMessages += i18next.t('api_validation_adviceParameterRequired', {parameterType: 'settlementDate' });
    }
    if (!req.body.secureHash) {
      errorMessages += i18next.t('api_validation_adviceParameterRequired', {parameterType: 'secureHash' });
    }

    if (errorMessages != '') {
      res.status(400);
      res.json({'Message': errorMessages});
      return;
    }

    // var concatenatedParams = apiHelper.getConcatenatedParams(userParams);
    // var hashedKey = apiHelper.getHashedKey(concatenatedParams);

    // if (req.body.secureHash !== hashedKey) {
    //   res.status(400);
    //   res.json({'Message': i18next.t('api_validation_adviceInvalidSecureHash')});
    //   return;
    // }

    async.series([
      function(callback) {
        // merchantId, aggregatorId, userId, invoiceNumber
        var sql = "CALL `spSelectInvoiceByParameter`('" + req.body.merchantId + "','" + req.body.aggregatorID + "','" + req.body.userID + "','" + req.body.invoiceNo + "');";
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
      var data = results[0][0].length > 0 ? results[0][0][0] : {'errorMessage': i18next.t('api_validation_noMatchingInvoiceFound')};
      if (data.errorMessage) {
        res.status(400);
        res.json({'Message': data.errorMessage});
        return;
      }

      var findInvoiceQuery = {
        invoiceNumber: req.body.invoiceNo,
        merchantId: req.body.merchantId,
        aggregatorId: req.body.aggregatorID,
      };

      if (req.body.userID) {
        findInvoiceQuery.userId = req.body.userID;
      }

      Invoice.find({
        where: findInvoiceQuery,
      }, function(err, invoiceList) {
        if (err) {
          res.status(500);
          res.json(err);
        } else {
          if (!invoiceList || invoiceList.length == 0) {
            res.status(400);
            res.json({'Message': i18next.t('api_validation_noMatchingInvoiceFound')});
            return;
          }

          var foundInvoice = invoiceList[0];

          if (foundInvoice.status != 'Paid') {
            res.status(400);
            res.json({'Message': i18next.t('api_validation_invoiceNotInPaidStatus')});
            return;
          }

          if (foundInvoice.status == 'Settled') {
            res.status(400);
            res.json({'Message': i18next.t('api_validation_invoiceAlreadySettled')});
            return;
          }

          var updatedInvoice = {
            'settlementID': req.body.settlementID,
            'settlementDate': moment(req.body.settlementDate, 'YYYYMMDD', true).format('YYYY-MM-DD'),
            'status': 'Settled',
            'updatedBy': 1,
            'updatedOn': dateHelper.getUTCManagedDateTime(),
          };
          Invoice.updateAll({id: foundInvoice.id}, updatedInvoice, function (err, updatedUser) {
            if (err) {
              res.status(500);
              res.json(err);
            } else {
              res.status(200);
              res.json({'Message': i18next.t('api_paymentSettlementSuccess')});
            }
          });
        }
      });
    });
  });

  app.post('/api/uploadcsv', upload.single('csvdata'), function (req, res) {
    var AccessToken = app.models.AccessToken;
    AccessToken.findForRequest(req, {}, function (aux, accesstoken) {
      if (accesstoken == undefined) {
        res.status(401);
        res.json({
          'error': {
            'statusCode': 401,
            'name': 'Error',
            'message': 'Authorization Required',
            'code': 'AUTHORIZATION_REQUIRED',
            'stack': 'Error: Authorization Required',
          },
        });
      } else {
        var UserModel = app.models.user;
        UserModel.findById(accesstoken.userId, function (err, user) {
          var filepath = req.file.path;
          if (!req.file.originalname.endsWith('.csv')) {
            res.status(400);
            res.json({ 'Message': i18next.t('csv_validation_unsupportedFormat') });
            return;
          }
          var options = {
            objectMode: true,
            headers: true,
            ignoreEmpty: true,
            trim: true,
          };

          async.series([
            function (callback) {
              Schools.find({
                where: {
                  id: req.body.schoolId,
                },
                include: ['SchoolClass', 'SchoolBoard', 'SchoolDivision', 'SchoolYear', 'zones'],
              }, function (err, lists) {
                callback(null, lists);
              });
            },
            function (callback) {
              Categories.find({
                where: {
                  schoolId: req.body.schoolId,
                },
              }, function (err, catLists) {
                callback(null, catLists);
              });
            },
            function (callback) {
              UserModel.getEmails(req.body.schoolId, function(err, user) {
                if(err) callback(err);
                else
                callback(null, user);
              });
            },
          ],
            function (err, results) {
              // app.dataSources.mysql.transaction(models => {  //TODO: Implement transaction
              var counter = 0;
              var stream = fs.createReadStream(filepath);
              var fastCsv = csv.createWriteStream();
              var writeStream = fs.createWriteStream('outputfile.csv');
              fastCsv.pipe(writeStream);

              var failedStudents = [];
              var savedStudents = [];
              var waterfallFunctions = [];
              var schoolDetails = results[0][0];
              if (!schoolDetails) {
                res.status(400);
                res.json({ 'Message': i18next.t('csv_validation_invalidSchoolName') });
                return;
              } else {
                schoolDetails = schoolDetails.toJSON();
              }

              if (!schoolDetails.SchoolClass || schoolDetails.SchoolClass.length == 0){
                res.status(400);
                res.json({ 'Message': i18next.t('csv_validation_noClassesAvailable') });
                return;
              }

              if (!schoolDetails.SchoolDivision || schoolDetails.SchoolDivision.length == 0){
                res.status(400);
                res.json({ 'Message': i18next.t('csv_validation_noDivisionsAvailable') });
                return;
              }

              if (!schoolDetails.SchoolYear || schoolDetails.SchoolYear.length == 0){
                res.status(400);
                res.json({ 'Message': i18next.t('csv_validation_noYearsAvailable') });
                return;
              }

              var categoryList = results[1];
              var csvStream = csv
                .parse()
                .on('data', function (data) {
                  counter++;
                  if (counter > 1) {
                    var validationErrors = '';
                    if (data.length < 31) {
                      validationErrors += i18next.t('csv_validation_invalidNumberOfColumns');
                      failedStudents.push({ 'Row': data, 'Error': validationErrors });
                      data.push(validationErrors);
                      fastCsv.write(data);
                      return;
                    }

                    var studentModel = app.models.Student;

                    var firstName = data[1].trim();
                    if (firstName == '') {
                      validationErrors += i18next.t('csv_validation_studentFirstNameRequired');
                    }

                    // Commented as requested by client team
                    // var middleName = data[2].trim();
                    // if (middleName == '') {
                    //   validationErrors += i18next.t('csv_validation_studentMiddleNameRequired');
                    // }

                    var lastName = data[3].trim();
                    if (lastName == '') {
                      validationErrors += i18next.t('csv_validation_studentLastNameRequired');
                    }

                    if (data[4] != '') {
                      var filteredGender = ['Male', 'Female', 'Other'].filter(function (gender) {
                        if (gender == data[4]) {
                          return gender;
                        }
                      });
                      var matchingGender = filteredGender && filteredGender.length ? filteredGender[0] : null;
                      if (!matchingGender) {
                        validationErrors += i18next.t('csv_validation_invalidGender', { gender: data[4] });
                      }
                    } else {
                      validationErrors += i18next.t('csv_validation_studentGenderRequired');
                    }

                    var studentPhone = data[9].trim();
                    var fathersPhone = data[17].trim();
                    var mothersPhone = data[20].trim();
                    var gaurdianPhone = data[24].trim();

                    if (!studentPhone && !fathersPhone && !mothersPhone && !gaurdianPhone) {
                      validationErrors += i18next.t('csv_validation_studentPhoneRequired');
                    }

                    var emailId = data[25].trim();
                    if (emailId == '') {
                      validationErrors += i18next.t('csv_validation_studentEmailRequired');
                    } else if (!validator.isEmail(emailId)) {
                      validationErrors += i18next.t('csv_validation_studentInvalidEmail', {emailId: emailId});
                    }

                    if (data[26] != '') {
                      var filteredClass = schoolDetails.SchoolClass.filter(function (studentClass) {
                        if (studentClass.className == data[26]) {
                          return studentClass;
                        }
                      });
                      var matchingClass = filteredClass && filteredClass.length ? filteredClass[0] : null;
                      if (!matchingClass) {
                        validationErrors += i18next.t('csv_validation_invalidClass', { className: data[26] });
                      }
                    } else {
                      validationErrors += i18next.t('csv_validation_classRequired');
                    }

                    if (data[27] != '') {
                      var filteredDivision = schoolDetails.SchoolDivision.filter(function (division) {
                        if (division.divisionName == data[27]) {
                          return division;
                        }
                      });
                      var matchingDivision = filteredDivision && filteredDivision.length ? filteredDivision[0] : null;
                      if (!matchingDivision) {
                        validationErrors += i18next.t('csv_validation_invalidDivision', { divisionName: data[27] });
                      }
                    } else {
                      validationErrors += i18next.t('csv_validation_divisionRequired');
                    }

                    if (data[28] != '') {
                      var filteredCategory = categoryList.filter(function (category) {
                        if (category.categoryName == data[28]) {
                          return category;
                        }
                      });
                      var matchingCategory = filteredCategory && filteredCategory.length ? filteredCategory[0] : null;
                      if (!matchingCategory) {
                        validationErrors += i18next.t('csv_validation_invalidCategory', { categoryName: data[28] });
                      }
                    } else {
                      validationErrors += i18next.t('csv_validation_categoryRequired');
                    }

                    if (data[29] != '') {
                      var filteredYear = schoolDetails.SchoolYear.filter(function (studentYear) {
                        if (studentYear.academicYear == data[29]) {
                          return studentYear;
                        }
                      });
                      var matchingYear = filteredYear && filteredYear.length ? filteredYear[0] : null;
                      if (!matchingYear) {
                        validationErrors += i18next.t('csv_validation_invalidYear', { acadYear: data[29] });
                      }
                    } else {
                      validationErrors += i18next.t('csv_validation_yearRequired');
                    }

                    if (data[30] == '') {
                      validationErrors += i18next.t('csv_validation_studentCodeRequired');
                    }
                    if (data[31] != '') {
                      if (!schoolDetails.zones || schoolDetails.zones.length == 0) {
                        validationErrors += i18next.t('csv_validation_invalidZone', { zoneName: data[31] });
                      } else {
                        var filteredZone = schoolDetails.zones.filter(function (zoneDetails) {
                          if (zoneDetails.zoneCode == data[31]) {
                            return zoneDetails;
                          }
                        });
                        var matchingZone = filteredZone && filteredZone.length ? filteredZone[0] : null;
                        if (!matchingZone) {
                          validationErrors += i18next.t('csv_validation_invalidZone', { zoneName: data[31] });
                        }
                      }
                    }

                    var dateOfBirth = data[5] == '' ? '2000/01/01' : data[5];
                    var studentTitle = 'Mr';
                    if (!Date.parse(dateOfBirth)) {
                      validationErrors += i18next.t('csv_validation_invalidDateOfBirth', { birthDate: dateOfBirth });
                    } else if (dateOfBirth) {
                      var birthdate = new Date(dateOfBirth);
                      var cur = new Date();
                      var diff = cur - birthdate;
                      var age = Math.floor(diff / 31557600000);
                      switch (matchingGender) {
                        case 'Male':
                          if (age < 16) {
                            studentTitle = 'Mast';
                          } else {
                            studentTitle = 'Mr';
                          }
                          break;
                        case 'Female':
                          studentTitle = 'Miss';
                          break;
                      }
                    }

                    if (validationErrors != '') {
                      failedStudents.push({ 'Row': data, 'Error': validationErrors });
                      data.push(validationErrors);
                      fastCsv.write(data);
                      return;
                    }

                    var currentDay = cur.getFullYear() + '/' + cur.getMonth() + '/' + cur.getDate();

                    var studentToAdd = {
                      schoolId: req.body.schoolId,
                      categoryId: matchingCategory.id,
                      classId: matchingClass.id,
                      divisionId: matchingDivision.id,
                      zoneId: (data[31] == '') ? null : matchingZone.id,
                      gRNumber: data[7].trim(),
                      studentCode: data[30].trim(),
                      studentFirstName: firstName,
                      studentMiddleName: data[2].trim(),
                      studentLastName: lastName,
                      studentGender: data[4].trim(),
                      fatherFirstName: data[15].trim(),
                      fatherLastName: data[16].trim(),
                      fatherMobile: fathersPhone,
                      motherFirstName: data[18].trim(),
                      motherLastName: data[19].trim(),
                      motherMobile: mothersPhone,
                      guardianFirstName: data[22].trim(),
                      guardianLastName: data[23].trim(),
                      guardianMobile: gaurdianPhone,
                      studentDateOfBirth: dateOfBirth,
                      dateOfJoining: data[6] == currentDay ? null : data[6],
                      address: data[8],
                      title: studentTitle,
                      city: '',  // TODO:
                      state: data[11].trim(),
                      country: data[10].trim(),
                      phone: studentPhone,
                      email: emailId,
                      religion: data[12].trim(),
                      cast: data[13].trim(),
                      bloodGroup: data[14].trim(),
                      academicYear: matchingYear.academicYear,
                      isDelete: false,
                      isRegistered: 0,
                      createdBy: user.id,
                      createdOn: dateHelper.getUTCManagedDateTime(),
                    };
                    waterfallFunctions.push(function (next) {
                      studentModel.create(studentToAdd, function (err, post) {
                        if (err) {
                          if (err.errno == 1062) {
                            validationErrors += i18next.t('error_duplicateEntry');
                          } else {
                            validationErrors += err.message;
                          }
                          failedStudents.push({ 'Row': data, 'Error': validationErrors });
                          data.push(validationErrors);
                          fastCsv.write(data);
                        } else {
                          savedStudents.push({ 'Row': data });
                        }
                        next();
                      });
                    });
                  } else {
                    data.push('Error Message');
                    fastCsv.write(data);
                  }
                })
                .on('end', function () {
                  async.waterfall(waterfallFunctions, function (err) {
                    fastCsv.end();
                    emailHelper.getEmailText('csv_emailReport', {savedStudents: savedStudents.length, failedStudents: failedStudents.length}, function(error, html) {
                      if (failedStudents.length == 0) {
                        app.models.Email.send({
                          to: user.toJSON().email,
                          from: config.supportEmailID,
                          subject: i18next.t('csv_emailReportSubject'),
                          html: html,
                        }, function (err) {
                          if (err) {
                            rootlogger.info('Error sending upload report to email=\'' + user.toJSON().email + '\',\n Error=' + err);
                          }
                          rootlogger.info('Upload report mail sent successfully to ' + user.toJSON().email);
                        });
                      } else {
                        app.models.Email.send({
                          to: user.toJSON().email,
                          from: config.supportEmailID,
                          subject: i18next.t('csv_emailReportSubject'),
                          html: html,
                          attachments: [
                            {
                              filename: 'outputfile.csv',
                              content: fs.createReadStream('outputfile.csv'),
                            }],
                        }, function (err) {
                          if (err) {
                            rootlogger.info('Error sending upload report to email=\'' + user.toJSON().email + '\',\n Error=' + err);
                          }
                          console.log('> upload report mail sent successfully');
                        });
                      }
                    });

                    res.status(200);
                    res.json({
                      'SavedStudents': savedStudents.length,
                      'FailedStudents': failedStudents.length,
                      'Success': failedStudents.length == 0
                    });
                  });
                });
              stream.pipe(csvStream);
              // });
            });
        });
      }
    });
  });

  app.post('/login', function (req, res) {
    User.login({
      username: req.body.username,
      password: req.body.password,
    }, 'user', function (loginErr, token) {
      app.models.user.findOne({
        where: { username: req.body.username }, include: ['school', 'role']
      }, function (err, loggedInUser) {
        if (err) {
          res.status(err.statusCode);
          res.json(err);
        } else if (loggedInUser) {
          if (!loggedInUser.emailVerified) {
            res.status(401);
            res.json({
              'Error': i18next.t('error_authenticationFailed'),
              'Code': i18next.t('error_code_authenticationEmailNotVerified'),
              'Message': i18next.t('error_AuthenticationEmailNotVerified'),
            });
          }
          else if (!loggedInUser.isActivate) {

            res.status(401);
            res.json({
              'Error': i18next.t('error_authenticationFailed'),
              'Code': i18next.t('error_code_authenticationFailedDefault'),
              'Message': i18next.t('error_message_authenticationFailedDefault'),
            });
          }
          else if (loggedInUser.isBolocked) {
            res.status(401);
            res.json({
              'Error': i18next.t('error_authenticationFailed'),
              'Code': i18next.t('error_code_authenticationUserLocked'),
              'Message': i18next.t('error_authenticationUserLocked'),
            });
          }
          else if (loginErr) {
            var updateUserObj = {};
            if (loggedInUser.failedPasswordAttemptCount == 2) {
              updateUserObj.failedPasswordAttemptCount = 3;
              updateUserObj.isBolocked = true;
            }
            else if(loggedInUser.__data && loggedInUser.__data.role && loggedInUser.__data.role.__data.name !='SuperAdmin' ) {
              updateUserObj.failedPasswordAttemptCount = loggedInUser.failedPasswordAttemptCount + 1;
            }

            app.models.user.updateAll({ id: loggedInUser.id }, updateUserObj, function (err, updatedUser) {
              if (err) {
                res.status(err.statusCode);
                res.json(err);
              }
              else {
                if (updateUserObj.failedPasswordAttemptCount == 3) {
                  var emailList = [];
                  emailList.push({ relation: "self", email: loggedInUser.email });

                  if (loggedInUser.roleId == i18next.t('school_admin_role_Id')) {

                    app.models.user.find({ where: { roleId: i18next.t('super_admin_role_Id'), isActivate :true, emailVerified: true }, include: { relation: 'role' } }, function (err, superAdminUsers) {
                      if (err) {
                        res.status(err.statusCode);
                        res.json(err);
                      }
                      else {
                        if (superAdminUsers && superAdminUsers.length > 0) {
                          superAdminUsers.map(function (superadmin, index) {

                            emailHelper.sendEmails('authenticationUserLockedAdmin', superadmin.email,i18next.t('email_subject_authenticationUserLocked'),
                              { username: loggedInUser.username }, function(err, emailData){
                              if(err){
                                res.status(501);
                                res.json(err);
                              }
                              else{
                                console.log('email sent');
                              }
                            });
                          });

                          emailHelper.sendEmails('authenticationUserLocked',
                              loggedInUser.email,
                              i18next.t('email_subject_authenticationUserLocked'),
                              { username: loggedInUser.username },
                              function(err, emailData){
                                if(err){
                                  res.status(501);
                                  res.json(err);
                                }
                                else{
                                  console.log('email sent');
                                }
                            });
                        }
                        res.status(401);
                        res.json({
                          'Error': i18next.t('error_authenticationFailed'),
                          'Code': i18next.t('error_code_authenticationUserLocked'),
                          'Message': i18next.t('error_authenticationUserLocked'),
                        });
                      }
                    });
                  }
                  else if (loggedInUser.roleId == i18next.t('super_admin_role_Id')) {

                    emailHelper.sendEmails('authenticationUserLocked',
                        loggedInUser.email,
                    		i18next.t('email_subject_authenticationUserLocked'),
                    		{ username: loggedInUser.username },
                      function(err, emailData){
                        if(err){
                          res.status(501);
                          res.json(err);
                        }
                        else{
                          console.log('email sent');
                        }
                    });
                    res.status(401);
                    res.json({
                      'Error': i18next.t('error_authenticationFailed'),
                      'Code': i18next.t('error_code_authenticationUserLocked'),
                      'Message': i18next.t('error_authenticationUserLocked'),
                    });
                  }
                  else {
                    var userSchools = loggedInUser.__data.school;
                    if (userSchools && userSchools.length > 0) {

                      var conditions = [];
                      userSchools.map(function (data, index) {
                        conditions.push({ schoolId: data.id });
                      });

                      app.models.role.findOne({ where: { name: i18next.t('school_admin_role_name') } }, function (err, saRole) {
                        if (err) {
                          res.status(err.statusCode);
                          res.json(err);
                        }
                        if (saRole) {
                          app.models.Userschooldetails.find({ where: { or: conditions }, include: { relation: 'UserschoolUser' } },
                            function (err, _userSchoolDetails) {
                              if (err) {
                                res.status(err.statusCode);
                                res.json(err);
                              }
                              else {
                                var adminUsers = _userSchoolDetails.filter(function (data) {
                                  if (data.__data.UserschoolUser)
                                    return (
                                        data.__data.UserschoolUser.roleId == 2
                                        && data.__data.UserschoolUser.isActivate
                                        && data.__data.UserschoolUser.emailVerified) });
                                adminUsers.map(function (userMapping, index) {

                                  emailHelper.sendEmails('authenticationUserLocked',
                                      userMapping.UserschoolUser().email,
                                  		i18next.t('email_subject_authenticationUserLocked'),
                                  		{ username: loggedInUser.username },
                                    function(err, emailData){
                                      if(err){
                                        res.status(501);
                                        res.json(err);
                                      }
                                      else{
                                        console.log('email sent');
                                      }
                                  });
                                });

                                emailHelper.sendEmails('authenticationUserLocked',
                                      loggedInUser.email,
                                  		i18next.t('email_subject_authenticationUserLocked'),
                                  		{ username: loggedInUser.username },
                                    function(err, emailData){
                                      if(err){
                                        res.status(501);
                                        res.json(err);
                                      }
                                      else{
                                        console.log('email sent');
                                      }
                                  });
                                res.status(401);
                                res.json({
                                  'Error': i18next.t('error_authenticationFailed'),
                                  'Code': i18next.t('error_code_authenticationUserLocked'),
                                  'Message': i18next.t('error_authenticationUserLocked'),
                                });
                              }
                            });
                        }
                      });
                    }
                  }
                }
                else {
                  res.status(loginErr.statusCode);
                  res.json({
                    'Error': i18next.t('error_authenticationFailed'),
                    'Code': loginErr.code,
                    'Message': loginErr.message,
                  });
                }
              }
            });
          }
          else if (token) {
            // if (loggedInUser.failedPasswordAttemptCount > 0) {
            var lastLoginDate = dateHelper.getUTCManagedDateTime();
            app.models.user.updateAll({ id: token.userId }, { failedPasswordAttemptCount: 0, lastLogin: lastLoginDate }, function (err, updatedUser) {
              if (err) {
                res.status(err.statusCode);
                res.json(err);
              }
              else {
                app.models.user.createTokenObject(token, function (token) {
                  res.status(200);
                  res.json(token);
                });
              }
            });
          }
        } else {
          res.status(loginErr.statusCode);
          res.json({
            'Error': i18next.t('error_authenticationFailed'),
            'Code': loginErr.code,
            'Message': loginErr.message,
          });
        }
      });
    });
  });

  app.get('/logout', function (req, res, next) {
    if (!req.accessToken) return res.sendStatus(401); // return 401:unauthorized if accessToken is not present
    User.logout(req.accessToken.id, function (err) {
      if (err) return next(err);
      res.redirect('/'); // on successful logout, redirect
    });
  });

  // send an email with instructions to reset an existing user's password
  app.post('/request-password-reset', function (req, res, next) {
    User.resetPassword({
      email: req.body.email
    }, function (err) {
      if (err) return res.status(401).send({
        'Error': i18next.t('error_authenticationFailed'),
        'Code': err.code,
        'Message': err.message,
      });
      res.status(200).send({
        title: i18next.t('resetpassword_response_title'),
        content: i18next.t('resetpassword_response_content'),
        redirectTo: '/',
        redirectToLinkText: 'Log in'
      });
    });
  });

  // show password reset form
  app.get('/reset-password', function (req, res, next) {
    if (!req.accessToken) return res.sendStatus(401);
    res.render('password-reset', {
      redirectUrl: '/api/users/reset-password?access_token=' +
      req.accessToken.id
    });
  });

  app.models.user.createTokenObject = function (token, callBack) {
    var RoleMapping = app.models.RoleMapping;
    var Role = app.models.Role;
    RoleMapping.find({ where: { principalId: token.userId } }, function (err, roleMappings) {
      if (err) {
        callBack(err);
      } else {
        if (roleMappings && roleMappings.length > 0) {
          var roleIds = _.uniq(roleMappings
            .map(function (roleMapping) {
              return roleMapping.roleId;
            }));
          var conditions = roleIds.map(function (roleId) {
            return { id: roleId };
          });
          Role.find({ where: { or: conditions } }, function (err, roles) {
            if (err) {
              callBack(err);
            }
            else {
              token.roles = roles;
              permissionHelper.setPermissions(token, roles, function (token) {

                callBack(token);
              });
            }
          });
        } else {
          callBack(token);
        }
      }
    });
  };
};
