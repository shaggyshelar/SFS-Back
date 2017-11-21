'use strict';
var fs = require('fs');
var path = require('path');
var i18next = require('i18next');
var loopback = require('loopback');
var rootlogger = loopback.log;
var async = require('async');
var _ = require('underscore');

module.exports = function(app) {
  var Feeplan = app.models.Feeplan;
  var Feehead = app.models.Feehead;
  var Frequency = app.models.Frequency;

  return {
    generateTodaysInvoice: () => {
      async.series([
        function(callback) {
          Feeplan.find({
          }, function(err, lists) {
            callback(null, lists);
          });
        },
        function(callback) {
          Feehead.find({
          }, function(err, lists) {
            callback(null, lists);
          });
        },
        function(callback) {
          Frequency.find({
          }, function(err, lists) {
            callback(null, lists);
          });
        },
      ],
      function(err, results) {
        console.log('Input Data for Invoice =', results);
      });
    },
  };
};

