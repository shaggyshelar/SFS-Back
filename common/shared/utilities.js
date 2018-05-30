'use strict';

var schedule = require('node-schedule');
var fileHelper = require('./fileHelper');
var invoiceHelper = require('./invoiceHelper');
var csvHelper = require('./csvHelper');
var apiHelperObject = require('./apiHelper');
var configFilePath = process.env.NODE_ENV == undefined ?
'' : '.' + process.env.NODE_ENV;
var config = require('../../server/config' + configFilePath + '.json');

var utilities = function() {
};

/**
 * Method to schedule timer jobs
 */
utilities.init = function(app) {
  fileHelper.init();
  // var invHelper = invoiceHelper(app);
  // invHelper.registerStudents();
  // this.updateUser(app, 'espl1281020171745');
  // csvHelper.generateStudentRegistrationCSV('StudentRegistration.csv');

  // Execute a cron job when the minute is 10 (e.g. 19:10, 20:10, etc.).
  var clearFileScheduler = schedule.scheduleJob(config.fileCleanerSchedulerTime, function() {
    fileHelper.clearUploadsDirectory();
  });

  // Execute a cron job at 1.30 am every day
  var invoiceScheduler = schedule.scheduleJob(config.invoiceSchedulerTime, function() {
    var invHelper = invoiceHelper(app);
    invHelper.generateTodaysInvoice(function(error) {
      invHelper.registerInvoices();
    });
  });

  var updateInvoiceScheduler = schedule.scheduleJob(config.updateInvoiceSchedulerTime, function() {
    var invHelper = invoiceHelper(app);
    invHelper.updateInvoices();
  });

  var registerStudentScheduler = schedule.scheduleJob(config.registerStudentSchedulerTime, function() {
    var invHelper = invoiceHelper(app);
    invHelper.registerStudents();
  });
};

module.exports = utilities;
