'use strict';
var app = require('../../server/server');
var ds = app.dataSources.mysql;

module.exports = function (Student) {

  // Added by Harnish on 8th Nov 2017
  Student.validatesPresenceOf(
    'schoolId',
    'categoryId',
    'classId',
    'divisionId',
    'studentCode',
    'studentFirstName',
    'studentMiddleName',
    'studentLastName'
  );
  Student.validatesInclusionOf(
    'studentGender', { in: ['Male', 'Female', 'Other']
    });

  Student.getStudentFeeplanDetails = function (filter, options, cb) {

    Student.find(filter, function (err, _students) {
      if (err) {
        cb(err);
      } else {
        var condition = [];
        _students.map(function (s, i) {
          condition.push({
            classId: s.classId,
            categoryId: s.categoryId,
            academicYear: s.academicYear
          });
        });
        app.models.Feeplanassociation.find({
          where: {
            or: {
              condition
            }
          },
          include: "FeeplanassociationFeeplan"
        }, function (err, _assoc) {
          if (err) cb(err);
          else {
            var feePlanCondition = [];
            _assoc.map(function (a, i) {
              feePlanCondition.push({
                id: a.feeplaId
              });
            });
          }
        });
        cb(null, _students);
      }
    });
  }

  Student.remoteMethod('getStudentFeeplanDetails', {
    accepts: [{
        arg: 'filter',
        type: 'object',
        'http': {
          source: 'query'
        }
      },
      {
        arg: "options",
        type: "object",
        http: "optionsFromRequest"
      }
    ],
    http: {
      path: '/getStudentFeeplanDetails',
      verb: 'get'
    },
    returns: {
      arg: '_students',
      type: 'Student'
    }
  });


  Student.spCall = function (schoolId, todayDate, cb) {

    var sql = "CALL `SpFeeplanHeadDetails`(" + schoolId + ",'" + todayDate + "');";

    ds.connector.query(sql, function (err, data) {
      if (err) {
        console.log("Error:", err);
      }
      cb(null, data);
      console.log("data:", data);
    });
  }

  Student.remoteMethod(
    'spCall', {
      accepts: [{
          arg: 'schoolId',
          type: 'int'
        },
        {
          arg: 'todayDate',
          type: 'string'
        }
      ],
      returns: {
        arg: 'result',
        type: 'object'
      },
      http: {
        path: '/spCall',
        verb: 'post'
      }
    }
  );
};
