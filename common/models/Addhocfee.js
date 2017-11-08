'use strict';
module.exports = function (Addhocfee) {
  Addhocfee.validatesPresenceOf(
    'schoolId',
    'addhocFeeName',
    'addhocFeeDescription',
    'dueDate'
  );
};
