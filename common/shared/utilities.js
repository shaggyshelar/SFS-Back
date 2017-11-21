'use strict';

var schedule = require('node-schedule');
var fileHelper = require('./fileHelper');

var utilities = function() {
};

utilities.init = function() {
  fileHelper.init();

  // Execute a cron job when the minute is 10 (e.g. 19:10, 20:10, etc.).
  var j = schedule.scheduleJob('10 * * * *', function() {
    fileHelper.clearUploadsDirectory();
  });

  // var myInt = setInterval(function() {
  //   console.log('Hello');
  // }, config.clearUploadTimeout);
};
module.exports = utilities;
