'use strict';
var fs = require('fs');
var path = require('path');
var i18next = require('i18next');
var loopback = require('loopback');
var rootlogger = loopback.log;
var async = require('async');
var _ = require('underscore');

module.exports = function(app) {
  var Schools = app.models.School;

  return {
    generateTodaysInvoice: () => {
      async.series([
        function(callback) {
          Schools.find({
            where: {
              id: 22,
            },
            include: ['SchoolClass', 'SchoolBoard', 'SchoolDivision', 'SchoolYear'],
          }, function (err, lists) {
            callback(null, lists);
          });
        },
        function(callback) {
          console.log('second');
        },
      ],
      function(err, results) {
      });
    },
  };
};

