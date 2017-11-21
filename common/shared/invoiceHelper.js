'use strict';
var fs = require('fs');
var path = require('path');
var i18next = require('i18next');
var loopback = require('loopback');
var rootlogger = loopback.log;
var async = require('async');
var _ = require('underscore');

var invoiceHelper = function () {
};

invoiceHelper.generateTodaysInvoice = function () {
  async.series([
    function(callback) {
      Schools.find({
        where: {
          id: req.body.schoolId,
        },
        include: ['SchoolClass', 'SchoolBoard', 'SchoolDivision', 'SchoolYear'],
      }, function (err, lists) {
        callback(null, lists);
      });
    },
    function(callback) {
      Categories.find({
      }, function (err, catLists) {
        callback(null, catLists);
      });
    },
  ],
  function(err, results) {
  });
};

module.exports = invoiceHelper;
