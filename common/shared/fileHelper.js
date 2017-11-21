'use strict';
var fs = require('fs');
var path = require('path');

var fileHelper = function() {
};

fileHelper.init = function() {
  fs.readdir(path.join(__dirname, '../../Uploads'), function(err, items) {
    // console.log(items);
    var filesToDelete = [];
    for (var i = 0; i < items.length; i++) {
      var filePath = path.join(__dirname, '../../Uploads/' + items[i]);
      // fs.stat(filePath, function(err, stats) {
      //   // console.log(stats); // here we got all information of file in stats variable
      //   if (err) {
      //     return console.error(err);
      //   }

      //   // filesToDelete.push(filePath);

      fs.unlink(filePath, function(err) {
        if (err) return console.log(err);
        console.log('file deleted successfully= ', filePath);
      });
      // });
    }
  });
};
module.exports = fileHelper;
