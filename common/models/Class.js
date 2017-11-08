'use strict';
module.exports = function (Class) {
  Class.validatesPresenceOf(
    'schoolId',
    'className',
    'classCode'
  );
};
