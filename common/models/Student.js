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
    'studentGender', {
      in: ['Male', 'Female', 'Other']
    });

    Student.getStudentDetails = function (schoolId, filter, options, cb) {

      if(!filter) {
        filter={};
        filter.where={};
      }
      else if(filter && !filter.where) {
        filter.where={};
      }
      filter.where.schoolId=schoolId;
      Student.find(filter, function (err, _students) {
        if (err) {
          cb(err);
        }
        else {
          var condition = _students.map(function (s, i) {
            s.isFeePlanVerified=false;
            return { classId: s.classId, categoryId: s.categoryId, academicYear: s.academicYear };
          });
          app.models.Feeplanassociation.find({ where: { or: condition }, include: "FeeplanassociationFeeplan" }, function (err, _assoc) {
            if (err) {
              cb(err);
            }
            else {
              _assoc.map(function (mapping, index) {
                if (mapping.__data && mapping.__data.FeeplanassociationFeeplan) {
                  _students.map(function (s, i) {
                    if (s.classId == mapping.classId && s.categoryId == mapping.categoryId && s.academicYear == mapping.academicYear) {
                      s.isFeePlanVerified = mapping.__data.FeeplanassociationFeeplan.isVerified;
                    }
                  });
                }
              });
              cb(null, _students);
            }
          });
        }
      });
    }

    Student.remoteMethod('getStudentDetails', {
      accepts: [{
          arg: 'schoolId',
          type: 'Number'
        },
        {
          arg: 'filter',
          type: 'object',
          'http': { source: 'query' }
        },
        {
          arg: "options",
          type: "object",
          http: "optionsFromRequest"
        }],
      http: { path: '/:schoolId/getStudentDetails', verb: 'get' },
      returns: { arg: '_students', type: 'Student' }
    });

  Student.getStudentFeeplanDetails = function (filter, options, cb) {

    Student.find(filter, function (err, _students) {
      if (err) {
        cb(err);
      }
      else {
        var condition = _students.map(function (s, i) {
          return { classId: s.classId, categoryId: s.categoryId, academicYear: s.academicYear };
        });
        app.models.Feeplanassociation.find({ where: { or: condition }, include: "FeeplanassociationFeeplan" }, function (err, _assoc) {
          if (err) {
            cb(err);
          }
          else {
            _assoc.map(function (mapping, index) {
              if (mapping.__data && mapping.__data.FeeplanassociationFeeplan) {
                _students.map(function (s, i) {
                  if (s.classId == mapping.classId && s.categoryId == mapping.categoryId && s.academicYear == mapping.academicYear) {
                    s.feePlan = {};
                    s.feePlan.id = mapping.__data.FeeplanassociationFeeplan.id;
                    s.feePlan.schoolId = mapping.__data.FeeplanassociationFeeplan.schoolId;
                    s.feePlan.feePlanName = mapping.__data.FeeplanassociationFeeplan.feePlanName;
                    s.feePlan.feePlanDescription = mapping.__data.FeeplanassociationFeeplan.feePlanDescription;
                    s.feePlan.academicYear = mapping.__data.FeeplanassociationFeeplan.academicYear;
                    s.feePlan.isTransactionProcessed = mapping.__data.FeeplanassociationFeeplan.isTransactionProcessed;
                    s.feePlan.isDelete = mapping.__data.FeeplanassociationFeeplan.isDelete;
                    s.feePlan.createdBy = mapping.__data.FeeplanassociationFeeplan.createdBy;
                    s.feePlan.createdOn = mapping.__data.FeeplanassociationFeeplan.createdOn;
                    s.feePlan.updatedBy = mapping.__data.FeeplanassociationFeeplan.updatedBy;
                    s.feePlan.updatedOn = mapping.__data.FeeplanassociationFeeplan.updatedOn;
                    s.feePlan.isFeePlanVerified = mapping.__data.FeeplanassociationFeeplan.isVerified;
                  }
                });
              }
            });
            cb(null, _students);
          }
        });
      }
    });
  }

  Student.remoteMethod('getStudentFeeplanDetails', {
    accepts: [
      {
        arg: 'filter',
        type: 'object',
        'http': { source: 'query' }
      },
      {
        arg: "options",
        type: "object",
        http: "optionsFromRequest"
      }],
    http: { path: '/getStudentFeeplanDetails', verb: 'get' },
    returns: { arg: '_students', type: 'Student' }
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
