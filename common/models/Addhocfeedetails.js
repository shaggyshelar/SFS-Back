'use strict';
module.exports = function (Addhocfeedetails) {
  Addhocfeedetails.validatesPresenceOf(
    'addhocFeeId',
    'categoryId',
    'classId',
    'addhocFeeCharges'
  );
};
