'use strict';

var dsConfig = require('../datasources.json');
var path = require('path');
var multer = require('multer');
var upload = multer({ dest: './Uploads/' });
var fs = require('fs');
var csv = require('fast-csv');
var loopback = require('loopback');
var _ = require('underscore');

var permissionHelper = require('../../common/shared/permissionsHelper');

var rootlog = loopback.log;

module.exports = function (app) {
  var User = app.models.user;

  app.get('/verified', function (req, res) {
    rootlog.info('hi');
    rootlog.warn({ lang: 'fr' }, 'au revoir');
    res.render('verified');
  });

  app.post('/api/uploadcsv', upload.single('csvdata'), function (req, res) {
    var AccessToken = app.models.AccessToken;
    AccessToken.findForRequest(req, {}, function (aux, accesstoken) {
      if (accesstoken == undefined) {
        res.status(401);
        res.send({
          'Error': 'Unauthorized',
          'Message': 'You need to be authenticated to access this endpoint',
        });
      } else {
        var UserModel = app.models.user;
        UserModel.findById(accesstoken.userId, function (err, user) {
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
              .on('data', function (data) {
                users.push({ username: 'Demo' + (++counter), email: 'demo' + (counter) + '@demo.com', password: 'demo', 'emailVerified': true });
              })
              .on('end', function () {
                console.timeEnd('dbsave');
                console.log('Users Length B4 = ' + users.length);
                users.splice(100);
                console.log('Users Length After = ' + users.length);
                User.create(users, function (err, post) {
                  if (err) {
                    console.error(err);
                  } else {
                    console.log(counter);
                  }
                  User.count().then(count => {
                    console.log('UserCount = ' + count); // 1
                  });
                });
                res.status(200);
                res.send('Upload Successfull...');
              });
            stream.pipe(csvStream);
          });
        });
      }
    });
  });

  app.post('/login', function (req, res) {
    User.login({
      email: req.body.email,
      password: req.body.password,
    }, 'user', function (err, token) {
      if (err) {
        res.status(401);
        res.send({
          'Error': 'Failed',
          'Message': 'Login Failed',
        });
      }
      if (token != undefined) {
        var RoleMapping = app.models.RoleMapping;
        var Role = app.models.Role;
        RoleMapping.find({ where: { principalId: token.userId } }, function (err, roleMappings) {
          var roleIds = _.uniq(roleMappings
            .map(function (roleMapping) {
              return roleMapping.roleId;
            }));
          var conditions = roleIds.map(function (roleId) {
            return { id: roleId };
          });
          Role.find({ where: { or: conditions } }, function (err, roles) {
            if (err) throw err;
            token.roles = roles;
            permissionHelper.setPermissions(token, roles, function (token) {
              res.status(200);
              res.send(token);
            });
          });
        });

        // var isPasswordChanged = token.toJSON().user.isPasswordChanged;
        // if (isPasswordChanged) {
        //   res.status(200);
        //   res.send({
        //     'token': token.id,
        //     'ttl': token.ttl,
        //     'created': token.created,
        //     'userId': token.userId,
        //   });
        // } else {
        //   res.status(401);
        //   res.send({
        //     'Error': 'ChangeTemporaryPassword',
        //     'Message': 'Please change password first.',
        //   });
        // }
      }
    });
  });

  app.get('/logout', function (req, res, next) {
    if (!req.accessToken) return res.sendStatus(401); // return 401:unauthorized if accessToken is not present
    User.logout(req.accessToken.id, function (err) {
      if (err) return next(err);
      res.redirect('/'); // on successful logout, redirect
    });
  });
};
