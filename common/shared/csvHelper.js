'use strict';
var fs = require('fs');
var path = require('path');
var i18next = require('i18next');
var csv = require('fast-csv');
var _ = require('underscore');

var csvHelper = function() {
};

csvHelper.getCSVHeader = function(student) {
  return {
    'Registered': 'Is Registered',
    'gRNumber': 'GR Number',
    'studentCode': 'Student Code',
    'studentFirstName': 'First Name',
    'studentLastName': 'Last Name',
    'studentGender': 'Gender',
    'phone': 'Phone',
    'Response Description': 'Response Description',
  };
};

csvHelper.getRegisteredStudentCSVFormat = function(student) {
  return {
    'Registered': 'Yes',
    'gRNumber': student.gRNumber,
    'studentCode': student.studentCode,
    'studentFirstName': student.studentFirstName,
    'studentLastName': student.studentLastName,
    'studentGender': student.studentGender,
    'phone': student.phone,
    'Response Description': student.ErrorMessage,
  };
};

csvHelper.getFailedStudentCSVFormat = function(student) {
  return {
    'Registered': 'No',
    'gRNumber': student.gRNumber,
    'studentCode': student.studentCode,
    'studentFirstName': student.studentFirstName,
    'studentLastName': student.studentLastName,
    'studentGender': student.studentGender,
    'phone': student.phone,
    'Response Description': student.ErrorMessage,
  };
};

csvHelper.generateStudentRegistrationCSV = function(filepath, registeredStudents, failedStudents) {
  var fastCsv = csv.createWriteStream();
  var writeStream = fs.createWriteStream(filepath);
  writeStream.on('finish', function() {
    console.log('DONE!');
  });
  fastCsv.pipe(writeStream);
  fastCsv.write(csvHelper.getCSVHeader());

  _.each(registeredStudents, function(studentDetails) {
    fastCsv.write(csvHelper.getRegisteredStudentCSVFormat(studentDetails));
  });

  _.each(failedStudents, function(studentDetails) {
    fastCsv.write(csvHelper.getFailedStudentCSVFormat(studentDetails));
  });
  fastCsv.end();
};
module.exports = csvHelper;
