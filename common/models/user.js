// Copyright IBM Corp. 2014,2015. All Rights Reserved.
// Node module: loopback-example-user-management
// This file is licensed under the MIT License.
// License text available at https://opensource.org/licenses/MIT

'use strict';

var config = require('../../server/config.json');
var path = require('path');
var permissionHelper = require('../shared/permissionsHelper');
var authHelper = require('../shared/authHelper');
var randomize = require('randomatic');
var app = require('../../server/server');
var g = require('loopback/lib/globalize');
module.exports = function (User) {
  // send verification email after registration
  User.afterRemote('create', function (context, user, next) {
    var options = {
      type: 'email',
      to: user.email,
      from: 'noreply@loopback.com',
      subject: 'SFS: Thanks for registering.',
      template: path.resolve(__dirname, '../../server/views/verify.ejs'),
      redirect: '/verified',
      user: user,
    };

    user.verify(options, function (err, response) {
      if (err) {
        User.deleteById(user.id);
        return next(err);
      }
      context.res.render('response', {
        title: 'Signed up successfully',
        content: 'Please check your email and click on the verification link ' +
        'before logging in.',
        redirectTo: '/',
        redirectToLinkText: 'Log in',
      });
    });
  });

  // Method to render
  User.afterRemote('prototype.verify', function (context, user, next) {
    context.res.render('response', {
      title: 'A Link to reverify your identity has been sent ' +
      'to your email successfully',
      content: 'Please check your email and click on the verification link ' +
      'before logging in',
      redirectTo: '/',
      redirectToLinkText: 'Log in',
    });
  });

  // send password reset link when requested
  User.on('resetPasswordRequest', function (info) {
    var host = app.get("host"); //config.host
    var port = app.get("port"); // config.port
    var url = 'http://' + host + ':' + port + '/reset-password';
    var html = 'Click <a href="' + url + '?access_token=' +
      info.accessToken.id + '">here</a> to reset your password';
    var subject = "SFS: Password reset";

    app.models.user.findOne({ where: { email: info.email } }, function (err, _user) {
      if (err) throw err;
      if (_user.isBolocked) {
        html = 'Click <a href="' + url + '?access_token=' +
          info.accessToken.id + '">here</a> to reset your password and unlock your account.';
        subject = "SFS: Unlock account";
      }

      User.app.models.Email.send({
        to: info.email,
        from: info.email,
        subject: subject,
        html: html,
      }, function (err) {
        if (err) return console.log('> error sending password reset email');
        console.log('> sending password reset email to:', info.email);
      });
    });
  });

  // render UI page after password change
  User.afterRemote('changePassword', function (context, user, next) {
    var userid = context.args.options.accessToken.userId;
    User.findById(userid, function (err, _user) {
      if (err) return next(err);
      _user.updateAttributes({ isPasswordChanged: true }, function (err, data) {
        context.res.render('response', {
          title: 'Password changed successfully',
          content: 'Please login again with new password',
          redirectTo: '/',
          redirectToLinkText: 'Log in',
        });
      });
    });
  });

  // render UI page after password reset
  User.afterRemote('setPassword', function (context, user, next) {

    var _user = {};
    _user.failedPasswordAttemptCount = 0;
    _user.isBolocked = 0;
    User.updateAll({ id: context.args.id }, _user, function (err, updatedUser) {
      if (err) throw err;
      context.res.render('response', {
        title: 'Password reset success',
        content: 'Your password has been reset successfully',
        redirectTo: '/',
        redirectToLinkText: 'Log in',
      });
    });
  });

  User.afterRemote('confirm', function (context, user, next) {
    if (context.args) {
      User.updateAll({ id: context.args.uid }, { isActivate: true }, function (err, updatedUser) {
        if (err)
          throw err;
        else {
          next();
        }
      });
    }
  });

  User.createUser = function (user, options, cb) {
    if (options.accessToken) {
      var password = randomize('a', 6) + randomize('0', 4) + randomize('?', 2, { chars: '+-*/&^%$#@!' });
      user.password = password;

      User.create(user, function (err, cUser) {
        if (err) cb(err, cUser);
        else {
          if (user.schoolIds && user.schoolIds.length > 0) {

            var rolemapping = {
              principalType: "USER",
              principalId: cUser.id,
              roleId: cUser.roleId
            };
            app.models.RoleMapping.create(rolemapping, function (err, rolemap) {
              if (err) throw err;
            });

            var userSchoolMap = [];
            user.schoolIds.map(function (id, index) {
              userSchoolMap.push({
                id: null,
                userId: cUser.id,
                schoolId: id,
              });
            });
            if (userSchoolMap.length > 0) {
              app.models.Userschooldetails.create(userSchoolMap, function (err, details) {
                if (err) throw err;
                authHelper.sendVerificationEmail(cUser, password, cb);
              });
            }
          }
        }
      });
    }
  }

  User.updateUser = function (id, user, options, cb) {
    var updateUser = {
      roleId: user.roleId,
      username: user.username,
      phone: user.phone,
      email: user.email
    };
    User.updateAll({ id: id }, updateUser, function (err, updatedUser) {
      if (err)
        throw err;
      else {
        var rolemapping = {
          principalType: "USER",
          principalId: id
        };
        app.models.RoleMapping.find({ where: { and: [{ principalType: "USER" }, { principalId: id }] } }, function (err, rolemapArr) {
          if (err) throw err;
          else {
            if (rolemapArr.length > 0) {
              var rolemap = rolemapArr[0];
              if (rolemap.roleId != user.roleId) {
                rolemap.roleId = user.roleId;

                app.models.RoleMapping.updateAll({ and: [{ principalType: "USER" }, { principalId: id }] }, { roleId: user.roleId }, function (err, updatedUser) {
                  if (err)
                    throw err;
                });
              }
              app.models.Userschooldetails.destroyAll({ userId: id }, function (err, userSchoolInfo) {
                if (err) throw err;
                var userSchoolMap = [];
                user.schoolIds.map(function (sid, index) {
                  userSchoolMap.push({
                    userId: id,
                    schoolId: sid,
                  });
                });
                if (userSchoolMap.length > 0) {
                  app.models.Userschooldetails.create(userSchoolMap, function (err, details) {
                    if (err) throw err;
                    cb(null, user);
                  });
                }
              });

            }
          }
        });
      }
    });
  }

  User.remoteMethod('createUser', {
    accepts: [{
      arg: 'user',
      type: 'user',
      http: {
        source: 'body',
      },
    },
    {
      arg: "options",
      type: "object",
      http: "optionsFromRequest"
    }],
    http: { path: '/createUser', verb: 'post' },
    returns: { arg: 'user', type: 'user' }
  });


  User.remoteMethod('updateUser', {
    accepts: [{
      arg: 'id',
      type: 'Number'
    }, {
      arg: 'user',
      type: 'user',
      http: {
        source: 'body',
      },
    },
    {
      arg: "options",
      type: "object",
      http: "optionsFromRequest"
    }],
    http: { path: '/updateUser/:id', verb: 'put' },
    returns: { arg: 'user', type: 'user' }
  });

  User.validatePassword = function (plain) {
    var err,
      passwordProperties = User.definition.properties.password;
    if (plain.length > passwordProperties.length) {
      err = new Error(g.f('Password too long: %s (maximum %d symbols)', passwordProperties.length));
      err.code = 'PASSWORD_TOO_LONG';
    } else if (plain.length < passwordProperties.minLength) {
      err = new Error(g.f('Password too short: %s (minimum %d symbols)', passwordProperties.minLength));
      err.code = 'PASSWORD_TOO_SHORT';
    } else if (!(new RegExp(passwordProperties.pattern, 'g').test(plain))) {
      err = new Error(g.f(passwordProperties.patternError));
      err.code = 'INVALID_PASSWORD';
    } else {
      return true;
    } err.statusCode = 422;
    throw err;
  };
};
