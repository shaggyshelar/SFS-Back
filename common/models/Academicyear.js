'use strict';
var i18next = require('i18next');

module.exports = function (Academicyear) {
  /**
  * Validate if mentioned properties exist while calling the APIs. 
  */
  Academicyear.validatesPresenceOf(
    'schoolId',
    'startDate',
    'endDate',
    'academicYear'
  );

  /**
  * Before save operational hook for Academicyear model to validate if academic year overlaps 
  * with previously saved academic years.
  */
  Academicyear.observe('before save', function updateTimestamp(ctx, next) {

    var ayObj = {};
    if (ctx.instance) {
      ayObj.schoolId = ctx.instance.schoolId;
      ayObj.isCurrent = ctx.instance.isCurrent;
      ayObj.ayStartDate = new Date(ctx.instance.startDate);
      ayObj.ayEndDate = new Date(ctx.instance.endDate);
      ayObj.isCreate = true;
    }
    else if (ctx.data) {
      ayObj.schoolId = ctx.data.schoolId;
      ayObj.isCurrent = ctx.data.isCurrent;
      ayObj.ayStartDate = new Date(ctx.data.startDate);
      ayObj.ayEndDate = new Date(ctx.data.endDate);
    }
    Academicyear.find({ where: { schoolId: ayObj.schoolId } }, function (err, _academicYears) {
      var itemId = ctx.where ? ctx.where.id : undefined;
      var savedAccYears = _academicYears.filter(function (data) {
        if (data.id != itemId && data.isCurrent)
          return data;
      });
      if (savedAccYears.length == 0 && ayObj.isCreate) {
        ctx.instance.isCurrent = true;
        next();
      }
      else {
        var datesArray = _academicYears.map(function (item, index) {
          return {
            id: item.id,
            startDate: new Date(item.startDate),
            endDate: new Date(item.endDate)
          }
        });
        var dateOverlap = _academicYears.filter(function (item) {
          if (itemId != item.id && ayObj.ayStartDate <= (new Date(item.endDate)) && (new Date(item.startDate)) <= ayObj.ayEndDate) {
            return item;
          }
        });
        if (dateOverlap != undefined && dateOverlap.length > 0) {
          var error = new Error();
          error.status = 422;
          error.message = i18next.t('error_academicDateOverlap');
          return next(error);
        }
        else {
          if (ayObj.isCurrent && savedAccYears.length > 0) {
            Academicyear.resetIsCurrent(ayObj.schoolId, next);
          }
          else if (!ayObj.isCurrent && !ayObj.isCreate && savedAccYears.length == 0) {
            var error = new Error();
            error.status = 422;
            error.message = i18next.t('error_noCurrentAcademicYear');
            return next(error);
          }
          else {
            next();
          }
        }
      }
    });

  });
  
  Academicyear.resetIsCurrent = function (schoolId, next) {
    Academicyear.updateAll({ schoolId: schoolId, isCurrent: true }, { isCurrent: false }, function (err, updatedMerchants) {
      if (err) return next(err);
      next();
    });
  }

};
