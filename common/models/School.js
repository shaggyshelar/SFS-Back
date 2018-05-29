'use strict';
var app = require('../../server/server');
var ds = app.dataSources.mysql;
module.exports = function (School) {
  /**
  * Validate if mentioned properties exist while calling the APIs. 
  */
  School.validatesPresenceOf(
    'instituteId',
    'schoolName',
    'schoolCode',
    'schoolHeader'
  );

  /**
   * Operational hook to set invoiceSequenceNumber before saving the School
   */
  School.observe('before save', function (ctx, next) {
    if (ctx.isNewInstance) {
      ctx.instance.invoiceSequenceNumber = 0;
      next();
    }
    else {
      var itemId = ctx.data.id != undefined ? ctx.data.id : ctx.where.id;
      School.findById(itemId, function (err, _savedSchool) {
        if (err) next(err);
        else {
          if ((_savedSchool != null || _savedSchool != undefined) && _savedSchool.invoiceMnemonic != ctx.data.invoiceMnemonic) {
            ctx.data.invoiceSequenceNumber = 0;
          }
          next();
        }
      });
    }
  });

  /**
   * Operational hook to assign newly created school to super admin
   */
  School.observe('after save', function (ctx, next) {
    if (ctx.isNewInstance) {
      app.models.container.createContainer({
        "name": ctx.instance.id.toString()
      }, function (err, container) {
        if (err) {
          return next(err);
        } else {
          app.models.user.find({ where: { roleId: 1 } }, function(err, userData){
            if (err) {
              next(err);
            } else {
              if (userData && userData.length > 0) {
                var _userSchoolDetails = userData.map(function(uData, index){
                  return {
                    'userId': uData.id,
                    'schoolId': ctx.instance.id,
                  };
                });
                app.models.Userschooldetails.create(_userSchoolDetails, function(err, schoolMapping) {
                  if (err) return next(err);
                  next();
                });
              }
            }
          });


          /*
          var _userSchoolDetails = {
            "userId": ctx.options.accessToken.userId,
            "schoolId": ctx.instance.id
          };
          app.models.Userschooldetails.create(_userSchoolDetails, function (err, schoolMapping) {
            if (err) return next(err);
            next();
          });
          */

        }
      });
    } else {
      next();
    }
  });

  /**
   * Remote method to update zone's academic years 
   * @param schoolId - School whose zone academic years are to be updated.
   * @param academicYearObj - object with frequency and academic year to be updated
   * @param options - optionsFromRequest object to get authentication headers, etc.
   * @param cb - Callback to be executed after this method is executed.
   */
  School.updateZoneAcademicYear = function (schoolId, academicYearObj, options, cb) {
    if (options.accessToken) {
      app.models.Zone.updateAll({ schoolId: schoolId }, { frequencyId: academicYearObj.frequencyId, academicyear: academicYearObj.academicYear }, function (err, _zones) {
        if (err) {
          cb(err);
        }
        else {
          cb(null, _zones);
        }
      });

    }
  }


  /**
   * Remote method to get dashboard data filtered by school Id
   * @param schoolId - school whose dashboard data is required.
   * @param cb - Callback to be executed after this method is executed.
   */
  School.getDashboardDetails = function (schoolId, cb) {
    var sql = "CALL `spDashboard`(" + schoolId + ");";

    ds.connector.query(sql, function (err, data) {
      if (err) {
        console.log("Error:", err);
      }
      if (data.length > 0) {
        data = data[0];
      }
      cb(null, data);
      console.log("data:", data);
    });
  }

  School.remoteMethod(
    'getDashboardDetails', {
      accepts: [{
        arg: 'schoolId',
        type: 'int'
      }],
      http: { path: '/:schoolId/getDashboardDetails', verb: 'get' },
      returns: { arg: 'result', type: 'object' }
    }
  );

  /**
   * Remote method to get all users associated with a particular school.
   * @param schoolId - School whose users are required.
   * @param filter - Additional filter parameters.
   * @param options - optionsFromRequest object to get authentication headers, etc.
   * @param cb - Callback to be executed after this method is executed.
   */
  School.getUserForSchoolAdmin = function (schoolId, filter, options, cb) {
    if (options.accessToken) {
      app.models.Userschooldetails.find({ where: { schoolId: schoolId } }, function (err, _users) {
        if (err) {
          cb(err);
        }
        else {
          var condition = _users.map(function (s, i) {
            return s.userId;
          });
          var custFilter = { where: { and: [{ id: { inq: condition } }, { roleId: { gt: 2 } }] } };
          if(filter&& filter.where) {
            custFilter.where.and.push(filter.where);
          }
          app.models.User.find(custFilter, function (err, _assUserRole) {
            if (err) {
              cb(err);
            }
            else {
              cb(null, _assUserRole);
            }
          });
        }
      });
    }
  }

  /**
   * Remote method to get the count of all users associated with a particular school.
   * @param schoolId - School whose users are required.
   * @param filter - Additional filter parameters.
   * @param options - optionsFromRequest object to get authentication headers, etc.
   * @param cb - Callback to be executed after this method is executed.
   */
  School.getUserCountForSchoolAdmin = function (schoolId, filter, options, cb) {
    if (options.accessToken) {
      app.models.Userschooldetails.find({ where: { schoolId: schoolId } }, function (err, _users) {
        if (err) {
          cb(err);
        }
        else {
          var condition = _users.map(function (s, i) {
            return s.userId;
          });
          var custFilter = { where: { and: [{ id: { inq: condition } }, { roleId: { gt: 2 } }] } };
          if(filter&& filter.where) {
            custFilter.where.and.push(filter.where);
          }
          app.models.User.find(custFilter, function (err, _assUserRole) {
            if (err) {
              cb(err);
            }
            else {
              cb(null, _assUserRole.length);
            }
          });
        }
      });
    }
  }

  School.remoteMethod('updateZoneAcademicYear', {
    accepts: [{
      arg: 'schoolId',
      type: 'Number'
    }, {
      arg: 'academicYear',
      type: 'object',
      http: {
        source: 'body',
      },
    },
    {
      arg: "options",
      type: "object",
      http: "optionsFromRequest"
    }],
    http: { path: '/:schoolId/updateZoneAcademicYear', verb: 'put' },
    returns: { arg: 'zones', type: 'Zone' }
  });

  School.remoteMethod('getUserForSchoolAdmin', {
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
    http: { path: '/:schoolId/getUserForSchoolAdmin', verb: 'get' },
    returns: { arg: 'users', type: 'User' }
  });


  School.remoteMethod('getUserCountForSchoolAdmin', {
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
    http: { path: '/:schoolId/getUserCountForSchoolAdmin', verb: 'get' },
    returns: { arg: 'users', type: 'User' }
  });


};
