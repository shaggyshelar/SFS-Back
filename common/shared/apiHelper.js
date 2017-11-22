'use strict';
var fs = require('fs');
var path = require('path');
var i18next = require('i18next');
var loopback = require('loopback');
var rootlogger = loopback.log;
var async = require('async');
var _ = require('underscore');
var request = require('request');
var configFilePath = process.env.NODE_ENV == undefined ?
'' : '.' + process.env.NODE_ENV;
var config = require('../../server/config' + configFilePath + '.json');

module.exports = function(app) {
  return {
    paymentInvoiceRequest: (postInvoiceForm) => {
      request.post({
        url: config.payPhiServerRoot + '/' + config.payPhiPostInvoiceURL,
        form: postInvoiceForm,
      },
        function(error, response, body) {
          console.log('error:', error);
          console.log('statusCode:', response && response.statusCode);
          console.log('body:', body);
        });
    },
    paymentInvoiceUpdate: (updateInvoiceForm) => {
      request.post({
        url: config.payPhiServerRoot + '/' + config.payPhiUpdateInvoiceURL,
        form: updateInvoiceForm,
      },
        function(error, response, body) {
          console.log('error:', error);
          console.log('statusCode:', response && response.statusCode);
          console.log('body:', body);
        });
    },
    registerUser: (registerUserForm) => {
      request.post({
        url: config.payPhiServerRoot + '/' + config.payPhiRegisterUserURL,
        form: registerUserForm,
      },
        function(error, response, body) {
          console.log('error:', error);
          console.log('statusCode:', response && response.statusCode);
          console.log('body:', body);
        });
    },
    listInvoice: (listInvoiceForm) => {
      request.post({
        url: config.payPhiServerRoot + '/' + config.payPhiListInvoiceURL,
        form: listInvoiceForm,
      },
        function(error, response, body) {
          console.log('error:', error);
          console.log('statusCode:', response && response.statusCode);
          console.log('body:', body);
        });
    },
    downloadReceipt: (downloadReceiptForm) => {
      request.post({
        url: config.payPhiServerRoot + '/' + config.payPhiDownloadReceiptURL,
        form: downloadReceiptForm,
      },
        function(error, response, body) {
          console.log('error:', error);
          console.log('statusCode:', response && response.statusCode);
          console.log('body:', body);
        });
    },
  };
};

