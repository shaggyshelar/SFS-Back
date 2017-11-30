'use strict';
var i18next = require('i18next');

module.exports = function (Academicyear) {
  Academicyear.validatesPresenceOf(
    'schoolId',
    'startDate',
    'endDate',
    'academicYear'
  );

  Academicyear.observe('before save', function updateTimestamp(ctx, next) {
    var schoolId, isCurrent = false, isCreate = false;;
    if (ctx.instance) {
      schoolId = ctx.instance.schoolId;
      isCurrent = ctx.instance.isCurrent;
      isCreate = true;
    }
    else if (ctx.data) {
      schoolId = ctx.data.schoolId;
      isCurrent = ctx.data.isCurrent;
    }
    if (!isCurrent && schoolId != undefined) {
      var condn = { schoolId: schoolId, isCurrent: true };
      if (ctx.where !== undefined) {
        condn.id = ctx.where.id;
      }
      Academicyear.find({ where: condn }, function (err, _academicYear) {
        if (err) return next(err);
        if (_academicYear.length == 0) {
          if (isCreate) {
            ctx.instance.isCurrent = true;
            next();
          } else {
            var error = new Error();
            error.status = 422;
            error.message = i18next.t('error_noCurrentAcademicYear');
            return next(error);
          }
        }
        else {
          next();
        }
      });
    }
    else if (isCurrent) {
      Academicyear.resetIsCurrent(schoolId, next);
    }
    else {
      next();
    }


  });

  Academicyear.resetIsCurrent = function (schoolId, next) {
    Academicyear.updateAll({ schoolId: schoolId, isCurrent: true }, { isCurrent: false }, function (err, updatedMerchants) {
      if (err) return next(err);
      next();
    });
  }

};
