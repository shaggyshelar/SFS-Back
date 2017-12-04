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
      // _academicYears.find(function (a) { return a.id == 38; })
    });

  });
  /*
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
  */
  Academicyear.resetIsCurrent = function (schoolId, next) {
    Academicyear.updateAll({ schoolId: schoolId, isCurrent: true }, { isCurrent: false }, function (err, updatedMerchants) {
      if (err) return next(err);
      next();
    });
  }

};
