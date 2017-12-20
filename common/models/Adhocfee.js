'use strict';
module.exports = function (Adhocfee) {
  Adhocfee.validatesPresenceOf(
    'schoolId',
    'adhocfeeName',
    'dueDate'
  );
};
