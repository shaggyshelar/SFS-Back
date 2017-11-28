'use strict';

var schedule = require('node-schedule');
var fileHelper = require('./fileHelper');
var invoiceHelper = require('./invoiceHelper');
var apiHelperObject = require('./apiHelper');
var configFilePath = process.env.NODE_ENV == undefined ?
'' : '.' + process.env.NODE_ENV;
var config = require('../../server/config' + configFilePath + '.json');

var utilities = function() {
};

utilities.registerUser = function(app) {
  var apiHelper = apiHelperObject(app);
  var userParams = [];
  var cur = new Date();
  var newUserId = 'espl1' + cur.getDate() + '' + cur.getMonth() + '' + cur.getFullYear() + cur.getHours() + cur.getSeconds();
  var currentDay = cur.getDate() + '/' + cur.getMonth() + '/' + cur.getFullYear();
  userParams.push(['merchantId', config.payPhiMerchantID]);
  userParams.push(['aggregatorId', config.payPhiAggregatorID]);
  userParams.push(['userID', newUserId]);
  userParams.push(['actionCode', 'I']);
  userParams.push(['title', 'Mr']);
  userParams.push(['fName', 'Sagar']);
  userParams.push(['lName', 'Shelar']);
  userParams.push(['gender', 'M']);
  userParams.push(['dob', '21/06/1987']);
  userParams.push(['fatherName', 'NA']);
  userParams.push(['motherName', 'NA']);
  userParams.push(['mobileNo', '9899999999']);
  userParams.push(['emailID', newUserId + '@test.com']);
  userParams.push(['countryCode', 'IND']);

  var concatenatedParams = apiHelper.getConcatenatedParams(userParams);
  var hashedKey = apiHelper.getHashedKey(concatenatedParams);
  var userForm = apiHelper.getForm(userParams, hashedKey);
  apiHelper.registerUser(userForm);
};

utilities.listInvoiceEnquiry = function(app) {
  var apiHelper = apiHelperObject(app);
  var userParams = [];
  var cur = new Date();
  var currentDay = cur.getDate() + '/' + cur.getMonth() + '/' + cur.getFullYear();
  userParams.push(['merchantId', config.payPhiMerchantID]);
  userParams.push(['aggregatorId', config.payPhiAggregatorID]);
  userParams.push(['userID', '008']);
  userParams.push(['status', 'O']);

  var concatenatedParams = apiHelper.getConcatenatedParams(userParams);
  var hashedKey = apiHelper.getHashedKey(concatenatedParams);
  var userForm = apiHelper.getForm(userParams, hashedKey);
  // apiHelper.registerUser(userForm);
};

utilities.createInvoice = function(app) {
  var apiHelper = apiHelperObject(app);
  var invoiceParams = [];
  var cur = new Date();
  var newUserId = 'espl1' + cur.getDate() + '' + cur.getMonth() + '' + cur.getFullYear() + cur.getHours() + cur.getSeconds();
  invoiceParams.push(['merchantId', config.payPhiMerchantID]);
  invoiceParams.push(['aggregatorId', config.payPhiAggregatorID]);
  invoiceParams.push(['userID', newUserId]);
  invoiceParams.push(['invoiceNo', 'SOMEUNIQUEINVOICENUMBER']);
  invoiceParams.push(['desc', 'SOME DESCRIPTION RELATED TO INVOICE']);
  invoiceParams.push(['chargeAmount', '10000.00']);
  invoiceParams.push(['currencyCode', 'INR']); // TO CHECK
  invoiceParams.push(['dueDate', '30/05/2018']);
  invoiceParams.push(['chargeHead1', '3000.00']);
  invoiceParams.push(['chargeHead2', '3000.00']);
  invoiceParams.push(['chargeHead3', '4000.00']);

  var concatenatedParams = apiHelper.getConcatenatedParams(invoiceParams);
  var hashedKey = apiHelper.getHashedKey(concatenatedParams);
  var userForm = apiHelper.getForm(invoiceParams, hashedKey);
  apiHelper.paymentInvoiceRequest(userForm);
};

utilities.updateInvoice = function(app) {
  var apiHelper = apiHelperObject(app);
  var invoiceParams = [];
  var cur = new Date();
  var newUserId = 'espl1' + cur.getDate() + '' + cur.getMonth() + '' + cur.getFullYear() + cur.getHours() + cur.getSeconds();
  invoiceParams.push(['merchantId', config.payPhiMerchantID]);
  invoiceParams.push(['aggregatorId', config.payPhiAggregatorID]);
  invoiceParams.push(['userID', newUserId]);
  invoiceParams.push(['invoiceNo', 'SOMEUNIQUEINVOICENUMBER']);
  invoiceParams.push(['invoiceStatus', 'O']);

  var concatenatedParams = apiHelper.getConcatenatedParams(invoiceParams);
  var hashedKey = apiHelper.getHashedKey(concatenatedParams);
  var userForm = apiHelper.getForm(invoiceParams, hashedKey);
  apiHelper.paymentInvoiceUpdate(userForm);
};

utilities.init = function(app) {
  fileHelper.init();
  // this.registerUser(app);
  // this.listInvoiceEnquiry(app);

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
