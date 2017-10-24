'use strict';

var dsConfig = require('../datasources.json');
var path = require('path');

module.exports = function(app) {
  var User = app.models.user;

  app.get('/verified', function(req, res) {
    res.render('verified');
  });
};
