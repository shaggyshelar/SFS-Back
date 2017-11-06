// Copyright IBM Corp. 2014,2015. All Rights Reserved.
// Node module: loopback-example-user-management
// This file is licensed under the MIT License.
// License text available at https://opensource.org/licenses/MIT

'use strict';

var config = require('../../server/config.json');
var path = require('path');
var permissionHelper = require('../shared/permissionsHelper');
var randomstring = require("randomstring");

module.exports = function (User) {
  // send verification email after registration
  User.afterRemote('create', function (context, user, next) {
    var options = {
      type: 'email',
      to: user.email,
      from: 'noreply@loopback.com',
      subject: 'Thanks for registering.',
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
    var url = 'http://' + config.host + ':' + config.port + '/reset-password';
    var html = 'Click <a href="' + url + '?access_token=' +
      info.accessToken.id + '">here</a> to reset your password';

    User.app.models.Email.send({
      to: info.email,
      from: info.email,
      subject: 'Password reset',
      html: html,
    }, function (err) {
      if (err) return console.log('> error sending password reset email');
      console.log('> sending password reset email to:', info.email);
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
    context.res.render('response', {
      title: 'Password reset success',
      content: 'Your password has been reset successfully',
      redirectTo: '/',
      redirectToLinkText: 'Log in',
    });
  });

  User.afterRemote('findById', function (context, user, next) {
    var role = user.roles();
    if (role != undefined && role.length > 0) {
      var permissions = [];
      permissionHelper.setPermissions(user, role, function (updatedUser) {
        user = updatedUser;
        next();
      });
    }
    else {
      next();
    }
  });

  User.createUser = function (user, cb) {
    user.password = randomstring.generate(12);
    User.create(user, function (err, cUser) {
      if (err) cb(err, cUser);

      cb(null, cUser);
    });

  }

  User.remoteMethod('createUser', {
    accepts: {
      // arg: 'user', type: 'object',
      // default: { "username": "string", "password": "string", "email": "string" },
      // http: {
      //   source: 'body'
      // }
      arg: 'user',
      type: 'user',
      http: {
        source: 'body'
      }
    },
    http: { path: '/createUser', verb: 'post' },
    returns: { arg: 'user', type: 'user' }
  });
};
