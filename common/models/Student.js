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
