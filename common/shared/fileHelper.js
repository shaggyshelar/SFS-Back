'use strict';
var fs = require('fs');
var path = require('path');
var i18next = require('i18next');

var fileHelper = function() {
};

fileHelper.init = function() {
};

fileHelper.clearUploadsDirectory = function() {
  var loopback = require('loopback');
  var rootlogger = loopback.log;
  fs.readdir(path.join(__dirname, '../../Uploads'), function(err, items) {
    // console.log(items);
    var filesToDelete = [];
    for (var i = 0; i < items.length; i++) {
      var filePath = path.join(__dirname, '../../Uploads/' + items[i]);
      fs.unlink(filePath, function(err) {
        if (err) {
          rootlogger.info(i18next.t('log_errFileDelete', {filePath: filePath}));
        } else {
          rootlogger.info(i18next.t('log_fileDeleted', {filePath: filePath}));
        }
      });
    }
  });
};
module.exports = fileHelper;
