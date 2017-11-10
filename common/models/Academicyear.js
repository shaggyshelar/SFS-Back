'use strict';
module.exports = function (Academicyear) {
  Academicyear.validatesPresenceOf(
    'schoolId',
    'startDate',
    'endDate',
    'academicYear'
  );
};
