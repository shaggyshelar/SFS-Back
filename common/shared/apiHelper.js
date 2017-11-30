'use strict';
var fs = require('fs');
var path = require('path');
var i18next = require('i18next');
var loopback = require('loopback');
var rootlogger = loopback.log;
var async = require('async');
var _ = require('underscore');
var request = require('request');
var crypto = require('crypto');
var configFilePath = process.env.NODE_ENV == undefined ?
'' : '.' + process.env.NODE_ENV;
var config = require('../../server/config' + configFilePath + '.json');

module.exports = function(app) {
  var Student = app.models.Student;

  return {
    paymentInvoiceRequest: (postInvoiceForm) => {
      request.post({
        url: config.payPhiServerRoot + config.payPhiPostInvoiceURL,
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
        url: config.payPhiServerRoot + config.payPhiUpdateInvoiceURL,
        form: updateInvoiceForm,
      },
        function(error, response, body) {
          console.log('error:', error);
          console.log('statusCode:', response && response.statusCode);
          console.log('body:', body);
        });
    },
    registerOrUpdateUser: (userForm) => {
      request.post({
        url: config.payPhiServerRoot + config.payPhiRegisterUserURL,
        form: userForm,
      },
        function(error, response, body) {
          if (!error) {
            var responseData = JSON.parse(body);
            if (responseData.responseCode == '0000') {
              Student.updateAll({'studentCode': userForm.studentCode}, {isRegistered: 1},
              function(err, updatedUser) {
                if (err) {
                  rootlogger.error(responseData);
                }
              });
            } else {
              rootlogger.error(responseData);
            }
          } else {
            rootlogger.error('Error while registering student into PayPhi system.');
          }
        });
    },
    getConcatenatedParams: function(params) {
      if (!params) {
        return [];
      }
      var sortedParams = params.sort(function(a, b) {
        var a1 = a[0];
        var b1 = b[0];
        return a1 == b1 ? 0 : (a1 < b1 ? -1 : 1);
        // return a[0].localeCompare(b[0]);
      });

      var concatenatedValues = '';
      _.each(sortedParams, function(param) {
        concatenatedValues += param[1];
      });

      return concatenatedValues;
    },
    getForm: function(params, hashedKey) {
      if (!params) {
        return [];
      }

      var formData = {};
      _.each(params, function(param) {
        formData[param[0]] = param[1];
      });

      formData['secureHash'] = hashedKey;

      return formData;
    },
    getConcatenatedURL: function(params) {
      if (!params) {
        return [];
      }

      var concatenatedURL = '';
      _.each(params, function(param) {
        if (concatenatedURL.endsWith('&')) {
          concatenatedURL += param[0] + '=' + param[1];
        } else {
          if (concatenatedURL != '') {
            concatenatedURL += '&' + param[0] + '=' + param[1];
          } else {
            concatenatedURL += param[0] + '=' + param[1];
          }
        }
      });

      return concatenatedURL;
    },
    getHashedKey: function(concatenatedValues) {
      const secret = config.payPhiHashKey;
      const lowerCaseHash = crypto.createHmac('sha256', secret)
                         .update(concatenatedValues)
                         .digest('hex')
                         .toLowerCase();
      return lowerCaseHash;
    },
  };
};

