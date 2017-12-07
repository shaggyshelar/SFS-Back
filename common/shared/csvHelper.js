'use strict';
var fs = require('fs');
var path = require('path');
var i18next = require('i18next');
var csv = require('fast-csv');

var csvHelper = function() {
};

csvHelper.generateStudentRegistrationCSV = function(filepath) {
  var fastCsv = csv.createWriteStream();
  var writeStream = fs.createWriteStream(filepath);
  fastCsv.pipe(writeStream);

  fastCsv.write({});
  fastCsv.end();
  // attachments: [
  //   {
  //     filename: 'outputfile.csv',
  //     content: fs.createReadStream('outputfile.csv'),
  //   }],
};
module.exports = csvHelper;
