'use strict';
module.exports = function (Academicyear) {
  Academicyear.validatesPresenceOf(
    'schoolId',
    'startDate',
    'endDate',
    'academicYear'
  );

  Academicyear.observe('before save', function updateTimestamp(ctx, next) {
    var schoolId, isCurrent = false;
    if (ctx.instance) {
      if (ctx.instance.isCurrent && ctx.instance.schoolId != undefined) {
        schoolId = ctx.instance.schoolId;
        isCurrent = ctx.instance.isCurrent;
      }
    }
    else if (ctx.data) {
      if (ctx.data.isCurrent && ctx.data.schoolId != undefined) {
        schoolId = ctx.data.schoolId;
        isCurrent = ctx.data.isCurrent;
      }
      // else if (ctx.data.isCurrent && ctx.data.schoolId == undefined) {
      //   var error = new Error();
      //   error.status = 422;
      //   error.message = i18next.t('error_schoolIdIsRequired');
      //   next(error);
      // }
      // else {
      //   next();
      // }
    }
    if (isCurrent) {
      Academicyear.updateAll({ schoolId: ctx.data.schoolId, isCurrent: true }, { isCurrent: false }, function (err, updatedMerchants) {
        if (err) return next(err);
        next();
      });
    }
    else {
      next();
    }


  });

};
