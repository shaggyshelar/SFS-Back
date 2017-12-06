'use strict';
var fs = require('fs');
var path = require('path');
var i18next = require('i18next');
var loopback = require('loopback');
var rootlogger = loopback.log;
var async = require('async');
var _ = require('underscore');
var apiHelperObject = require('./apiHelper');
var configFilePath = process.env.NODE_ENV == undefined ?
'' : '.' + process.env.NODE_ENV;
var config = require('../../server/config' + configFilePath + '.json');

module.exports = function(app) {
  var Feeplan = app.models.Feeplan;
  var Feehead = app.models.Feehead;
  var Frequency = app.models.Frequency;
  var Student = app.models.Student;

  var invoiceHelper =  {
    generateTodaysInvoice: () => {
      async.series([
        function(callback) {
          Feeplan.find({
          }, function(err, lists) {
            callback(null, lists);
          });
        },
        function(callback) {
          Feehead.find({
          }, function(err, lists) {
            callback(null, lists);
          });
        },
        function(callback) {
          Frequency.find({
          }, function(err, lists) {
            callback(null, lists);
          });
        },
      ],
      function(err, results) {
        console.log('Input Data for Invoice =', results);
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
          var failedStudent = [];
          _.each(schoolDetail.students, function(student) {
            waterfallFunctions.push(function(next) {
              invoiceHelper.registerStudent(student, function(error) {
                if (error) {
                  var errorMessage = 'Failed to register student with id =' + student.id +'. Error ='+ error;
                  failedStudent.push(errorMessage);
                }
              });
            });
          });
          async.waterfall(waterfallFunctions, function(err) {
          });
          // invoiceHelper.registerStudent(studentDetails);
        });
      });
    },
  };

  return invoiceHelper;
};

