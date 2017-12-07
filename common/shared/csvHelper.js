'use strict';
var fs = require('fs');
var path = require('path');
var i18next = require('i18next');
var csv = require('fast-csv');

var csvHelper = function() {
};

csvHelper.generateStudentRegistrationCSV = function(filepath, registeredStudents, failedStudents) {
  var fastCsv = csv.createWriteStream();
  var writeStream = fs.createWriteStream(filepath);
  writeStream.on('finish', function() {
    console.log('DONE!');
  });
  fastCsv.pipe(writeStream);

  fastCsv.write({a: 'a0', b: 'b0'});
  fastCsv.write({a: 'a1', b: 'b1'});
  fastCsv.write({a: 'a2', b: 'b2'});
  fastCsv.write({a: 'a3', b: 'b4'});
  fastCsv.write({a: 'a3', b: 'b4'});
  fastCsv.end();
};
module.exports = csvHelper;
