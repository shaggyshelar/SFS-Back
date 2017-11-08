'use strict';
module.exports = function (Student) {
  // Added by Harnish on 8th Nov 2017
  Student.validatesPresenceOf(
    'schoolId',
    'categoryId',
    'classId',
    'divisionId',
    'studentCode',
    'studentFirstName',
    'studentMiddleName',
    'studentLastName'
  );
  Student.validatesInclusionOf(
    'studentGender', { in: ['male', 'female', 'other']
    });

};
