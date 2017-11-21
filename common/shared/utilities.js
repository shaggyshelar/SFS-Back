'use strict';

var schedule = require('node-schedule');
var fileHelper = require('./fileHelper');
var invoiceHelper = require('./invoiceHelper');

var utilities = function() {
};

utilities.init = function() {
  fileHelper.init();

  // Execute a cron job when the minute is 10 (e.g. 19:10, 20:10, etc.).
  var clearFileScheduler = schedule.scheduleJob('10 * * * *', function() {
    fileHelper.clearUploadsDirectory();
  });

  // Execute a cron job at 1.30 am every day
  // var invoiceScheduler = schedule.scheduleJob('30 1 * * *', function() {
  var invoiceScheduler = schedule.scheduleJob('35 15 * * *', function() {
    // var invHelper = invoiceHelper();
    // invHelper.generateTodaysInvoice();
  });

  // var myInt = setInterval(function() {
  //   console.log('Hello');
  // }, config.clearUploadTimeout);
};
module.exports = utilities;
