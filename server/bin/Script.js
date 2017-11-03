'use strict';
//
// WARNING: THIS FILE WILL NOT RUN UNTIL YOU INSTALL, ADD, AND CONFIGURE A
// MYSQL DATA SOURCE, FOLLOWING INSTRUCTIONS IN "Getting Started with LoopBack"
// See http://docs.strongloop.com/display/LB2/Connect+an+API+to+a+datasource
//
var fs = require('fs');
var loopback = require('loopback');
var appDir = './';

var app = require('../server');
var dataSource = app.dataSources.mysql;
// console.log(dataSource);
var db = 'schoolfeesystem';

function capitaliseFirstLetter(tableName) {
  return tableName.charAt(0).toUpperCase() + tableName.slice(1);
}

function jsFileString(modelName) {
  return '' +
  '\'use strict\';' + '\nmodule.exports = function(' + capitaliseFirstLetter(modelName) + ') {\n' +
      '\t\n' +
    '};';
}

function autoGenerateModelFiles() {
  dataSource.discoverModelDefinitions({schema: db}, function(err, models) {
    models.forEach(function(model) {
      dataSource.discoverSchema(model.name, {associations: true}, function(err, schema) {
        if (schema.options.mysql.schema !== db) {
          console.log('options.mysql.schema !== db', schema);
        }
        fs.writeFile(appDir + 'common/models/' + capitaliseFirstLetter(model.name) + '.json', JSON.stringify(schema, null, '  '), function(err) {
          if (err) throw err;
          //console.log(schema);
        });
        fs.writeFile(appDir + 'common/models/' + capitaliseFirstLetter(model.name) + '.js', jsFileString(model.name), function(err) {
          if (err) throw err;
          console.log('Created ' + model.name + '.json file');
        });
      });
    });
  });
}

autoGenerateModelFiles();
