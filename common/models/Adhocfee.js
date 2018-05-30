'use strict';

module.exports = function (Adhocfee) {
  /**
  * Validate if mentioned properties exist while calling the APIs. 
  */
  Adhocfee.validatesPresenceOf(
    'schoolId',
    'adhocfeeName',
    'dueDate'
  );
};
