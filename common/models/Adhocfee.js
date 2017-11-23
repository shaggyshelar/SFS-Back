'use strict';
module.exports = function (Adhocfee) {
  Adhocfee.validatesPresenceOf(
    'schoolId',
    'adhocfeeName',
    'adhocfeeDescription',
    'dueDate'
  );
};
