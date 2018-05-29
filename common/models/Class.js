'use strict';
/**
 * Validate the presence of mentioned properties while calling the APIs.
 */
module.exports = function (Class) {
  Class.validatesPresenceOf(
    'schoolId',
    'className',
    'classCode'
  );
};
