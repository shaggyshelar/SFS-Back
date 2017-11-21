'use strict';
module.exports = function (Adhocfee) {
  Adhocfee.validatesPresenceOf(
    'schoolId',
    'addhocFeeName',
    'addhocFeeDescription',
    'dueDate'
  );
};
