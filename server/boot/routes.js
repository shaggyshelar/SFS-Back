'use strict';

var dsConfig = require('../datasources.json');
var path = require('path');
var multer  = require('multer');
var upload = multer({dest: './Uploads/'});
var fs = require('fs');
var csv = require('fast-csv');

module.exports = function(app) {
  var User = app.models.user;

  app.get('/verified', function(req, res) {
    res.render('verified');
  });

  app.post('/api/uploadcsv', upload.single('csvdata'), function(req, res) {
    console.log(req.file.path);
    console.time('dbsave');
    var filepath = req.file.path;
    var options = {
      objectMode: true,
      headers: true,
      ignoreEmpty: true,
      trim: true,
    };

    app.dataSources.db.transaction(models => {
      var counter = 0;
      var stream = fs.createReadStream(filepath);
      var users = [];
      var csvStream = csv
      .parse()
      .on('data', function(data) {
        users.push({username: 'Demo' + (++counter), email: 'demo' + (++counter) + '@demo.com', password: 'demo', 'emailVerified': true});
      })
      .on('end', function() {
        console.timeEnd('dbsave');
        console.log('Users Length B4 = ' + users.length);
        users.splice(100);
        console.log('Users Length After = ' + users.length);
        User.create(users, function(err, post) {
          if (err) {
            console.error(err);
          } else {
            console.log(counter);
          }
          User.count().then(count =>{
            console.log('UserCount = ' + count); // 1
          });
        });
        res.send('POST =');
      });
      stream.pipe(csvStream);
    });
  });
};
