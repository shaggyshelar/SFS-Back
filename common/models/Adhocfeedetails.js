'use strict';
module.exports = function (Adhocfeedetails) {
  Adhocfeedetails.validatesPresenceOf(
    'addhocFeeId',
    'categoryId',
    'classId',
    'addhocFeeCharges'
  );
};
