'use strict';

var schedule = require('node-schedule');
var fileHelper = require('./fileHelper');
var invoiceHelper = require('./invoiceHelper');
var configFilePath = process.env.NODE_ENV == undefined ?
'' : '.' + process.env.NODE_ENV;
var config = require('../../server/config' + configFilePath + '.json');

var utilities = function() {
};

utilities.init = function(app) {
  fileHelper.init();

  // Execute a cron job when the minute is 10 (e.g. 19:10, 20:10, etc.).
  var clearFileScheduler = schedule.scheduleJob(config.fileCleanerSchedulerTime, function() {
    fileHelper.clearUploadsDirectory();
  });

  // Execute a cron job at 1.30 am every day
  var invoiceScheduler = schedule.scheduleJob(config.invoiceSchedulerTime, function() {
    var invHelper = invoiceHelper(app);
    invHelper.generateTodaysInvoice();
  });

  // var myInt = setInterval(function() {
  //   console.log('Hello');
  // }, config.clearUploadTimeout);
};
module.exports = utilities;
