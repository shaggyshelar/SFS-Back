'use strict';
var app = require('../../server/server');
module.exports = function (School) {
  School.validatesPresenceOf(
    'instituteId',
    'schoolName',
    'schoolCode',
    'schoolHeader'
  );

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

  School.observe('after save', function (ctx, next) {
    if (ctx.isNewInstance) {
      app.models.container.createContainer({
        "name": ctx.instance.id.toString()
      }, function (err, container) {
        if (err) {
          return next(err);
        } else {
          var _userSchoolDetails = {
            "userId": ctx.options.accessToken.userId,
            "schoolId": ctx.instance.id
          };
          app.models.Userschooldetails.create(_userSchoolDetails, function (err, schoolMapping) {
            if (err) return next(err);
            next();
          });

        }
      });
    } else {
      next();
    }
  });

  School.updateZoneAcademicYear = function (schoolId, academicYearObj, options, cb) {
    if (options.accessToken) {
      app.models.Zone.updateAll({ schoolId: schoolId }, { academicyear: academicYearObj.academicYear }, function (err, _zones) {
        if (err) {
          cb(err);
        }
        else {
          cb(null, _zones);
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
};
