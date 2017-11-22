'use strict';
var fs = require('fs');
var path = require('path');
var i18next = require('i18next');
var loopback = require('loopback');
var rootlogger = loopback.log;
var async = require('async');
var _ = require('underscore');
var request = require('request');
var appConfig = require('../../server/appConfig');

module.exports = function(app) {
  return {
    paymentInvoiceRequest: (postInvoiceForm) => {
      request.post({
        url: appConfig.payPhiServerRoot + '/' + appConfig.payPhiPostInvoiceURL,
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
        url: appConfig.payPhiServerRoot + '/' + appConfig.payPhiUpdateInvoiceURL,
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
        url: appConfig.payPhiServerRoot + '/' + appConfig.payPhiRegisterUserURL,
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
        url: appConfig.payPhiServerRoot + '/' + appConfig.payPhiListInvoiceURL,
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
        url: appConfig.payPhiServerRoot + '/' + appConfig.payPhiDownloadReceiptURL,
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

