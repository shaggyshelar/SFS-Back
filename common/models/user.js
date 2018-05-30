// Copyright IBM Corp. 2014,2015. All Rights Reserved.
// Node module: loopback-example-user-management
// This file is licensed under the MIT License.
// License text available at https://opensource.org/licenses/MIT

'use strict';

var config = require('../../server/config.json');
// var prodcutionConfig = require('../../server/config.production.json');
var path = require('path');
var permissionHelper = require('../shared/permissionsHelper');
var authHelper = require('../shared/authHelper');
var randomize = require('randomatic');
var app = require('../../server/server');
var g = require('loopback/lib/globalize');
var i18next = require('i18next');
var emailHelper = require('../shared/emailHelper');
var productionConfig = require('../../server/config.production.json');
module.exports = function (User) {
  /**
   * Operational hook to send verification email after registration
   */
  User.afterRemote('create', function (context, user, next) {
    var options = {
      type: 'email',
      to: user.email,
      from: 'noreply@loopback.com',
      subject: i18next.t('email_userRegistrationSubject'),
      template: path.resolve(__dirname, '../../server/views/verify.ejs'),
      redirect: '/verified',
      user: user,
    };

    /**
     * Overrided Remote method to verify the user after registering
     */
    user.verify(options, function (err, response) {
      if (err) {
        User.deleteById(user.id);
        return next(err);
      }
      context.res.render('response', {
        title: 'Signed up successfully',
        content: 'Please check your email and click on the verification link ' +
          'before logging in.',
        redirectTo: productionConfig.baseUrlAppend, //'/SFS/',
        redirectToLinkText: 'Log in',
      });
    });
  });

  /**
   * Overridden remote method to render the content
   */
  User.afterRemote('prototype.verify', function (context, user, next) {
    context.res.render('response', {
      title: 'A Link to reverify your identity has been sent ' +
        'to your email successfully',
      content: 'Please check your email and click on the verification link ' +
        'before logging in',
      redirectTo: productionConfig.baseUrlAppend, //'/SFS/',
      redirectToLinkText: 'Log in',
    });
  });

  /**
   * Remote hook to send password reset link when requested
   */
  User.on('resetPasswordRequest', function (info) {
    var host = productionConfig.productionURL; // app.get("host"); //config.host
    var port = app.get("port"); // config.port
    var url = 'https://' + host +'/reset-password';// ':' + port + 
    // var html = 'Click <a href="' + url + '?access_token=' +
    //   info.accessToken.id + '">here</a> to reset your password';
    // var subject = "SFS: Password reset";
    var subject = i18next.t('email_passwordResetSubject');
    var template = 'passwordReset';

    app.models.user.findOne({ where: { email: info.email } }, function (err, _user) {
      if (err) {
        console.log(err);
      }
      else {
        if (_user.isBolocked) {
          subject = i18next.t('email_unblockAccountSubject');
          template = 'userLocked';
        }
        emailHelper.sendEmails(template, info.email, subject,
          { url: url, tokenId: info.accessToken.id }, function (err, emailData) {
            if (err) {
              res.status(501);
              res.json(err);
            }
            else {
              console.log('email sent');
            }
          });

        // if (_user.isBolocked) {
        //   html = 'Click <a href="' + url + '?access_token=' +
        //     info.accessToken.id + '">here</a> to reset your password and unlock your account.';
        //   subject = "SFS: Unlock account";
        // }

        // User.app.models.Email.send({
        //   to: info.email,
        //   from: info.email,
        //   subject: subject,
        //   html: html,
        // }, function (err) {
        //   if (err) return console.log('> error sending password reset email');
        //   console.log('> sending password reset email to:', info.email);
        // });
      }
    });
  });

  /**
   * Operational hook to render UI page after password change
   */
  User.afterRemote('changePassword', function (context, user, next) {
    var userid = context.args.options.accessToken.userId;
    User.findById(userid, function (err, _user) {
      if (err) return next(err);
      _user.updateAttributes({ isPasswordChanged: true }, function (err, data) {
        context.res.render('response', {
          title: 'Password changed successfully',
          content: 'Please login again with new password',
          redirectTo: productionConfig.baseUrlAppend, //'/SFS/',
          redirectToLinkText: 'Log in',
        });
      });
    });
  });

  /**
   * Operational hook to render UI page after password reset
   */
  User.afterRemote('setPassword', function (context, user, next) {

    var _user = {};
    _user.failedPasswordAttemptCount = 0;
    _user.isBolocked = 0;
    User.updateAll({ id: context.args.id }, _user, function (err, updatedUser) {
      if (err) {
        return next(err);
      }
      context.res.render('response', {
        title: 'Password reset success',
        content: 'Your password has been reset successfully',
        redirectTo: productionConfig.baseUrlAppend, //'/SFS/',
        redirectToLinkText: 'Log in',
      });
    });
  });

  /**
   * Operational hook to be called after confirm method to set isActive as true.
   */
  User.afterRemote('confirm', function (context, user, next) {
    if (context.args) {
      User.updateAll({ id: context.args.uid }, { isActivate: true }, function (err, updatedUser) {
        if (err)
          return next(err);
        else {
          next();
        }
      });
    }
  });

  /**
   * Remote method to create a new user
   * @param user - user which is to be created
   * @param options - optionsFromRequest object to get authentication headers, etc.
   * @param cb - Callback to be executed after this method is executed.
   */
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
              if (err) cb(err);
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
                if (err)
                  cb(err);
                else
                  authHelper.sendVerificationEmail(cUser, password, false, cb);
              });
            }
          }
        }
      });
    }
  }

  /**
   * Remote method to get school admin's emails for a particular schoolId
   * @param id - SchoolId whose school admin's emails are required
   * @param cb - Callback to be executed after this method is executed.
   */
  User.getEmails = function (id, cb) {
    var ds = User.dataSource;
    //var sql = "select u.id,u.email from user u left join userschooldetails usd on u.id = usd.userId where usd.schoolId=? and u.roleId=2";
    var sql = "select u.id,u.email from user u left join userschooldetails usd on u.id = usd.userId where usd.schoolId=? and u.roleId=2 and u.emailVerified=true and isActivate=true and u.isDelete=false";

    ds.connector.query(sql, [id], function (err, User) {
      if (err) console.error(err);
      cb(err, User);
    });
  }

  /**
   * Remote method to update a user
   * @param {*} id - id of user which is to updated
   * @param {*} user - data which is to be updated
   * @param options - optionsFromRequest object to get authentication headers, etc.
   * @param cb - Callback to be executed after this method is executed.
   */
  User.updateUser = function (id, user, options, cb) {
    var updateUser = {
      roleId: user.roleId,
      username: user.username,
      phone: user.phone,
      email: user.email
    };
    User.findOne({ where: { id: id } }, function (err, userInfo) {
      if (err) cb(err);
      User.updateAll({ id: id }, updateUser, function (err, updatedUser) {
        if (err)
          cb(err);
        else {
          if (userInfo.email != user.email) {
            userInfo.email = user.email;
            authHelper.sendVerificationEmail(userInfo, "", true, function () {
              console.log("sent email");
            });
          }
          var rolemapping = {
            principalType: "USER",
            principalId: id
          };
          app.models.RoleMapping.find({ where: { and: [{ principalType: "USER" }, { principalId: id }] } }, function (err, rolemapArr) {
            if (err) cb(err);
            else {
              if (rolemapArr.length > 0) {
                var rolemap = rolemapArr[0];
                if (rolemap.roleId != user.roleId) {
                  rolemap.roleId = user.roleId;

                  app.models.RoleMapping.updateAll({ and: [{ principalType: "USER" }, { principalId: id }] }, { roleId: user.roleId }, function (err, updatedUser) {
                    if (err)
                      cb(err);
                  });
                }
                app.models.Userschooldetails.destroyAll({ userId: id }, function (err, userSchoolInfo) {
                  if (err) cb(err);
                  else {
                    var userSchoolMap = [];
                    user.schoolIds.map(function (sid, index) {
                      userSchoolMap.push({
                        userId: id,
                        schoolId: sid,
                      });
                    });
                    if (userSchoolMap.length > 0) {
                      app.models.Userschooldetails.create(userSchoolMap, function (err, details) {
                        if (err) cb(err);
                        else
                          cb(null, user);
                      });
                    }
                  }
                });

              }
            }
          });
        }
      });
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

  User.remoteMethod('getEmails', {
    accepts: [{
      arg: 'id',
      type: 'string'
    },
    ],
    http: {
      verb: 'get'
    },
    returns: {
      arg: 'user',
      type: 'user'
    }
  });

  /**
   * Overridden method to validate a password. i.e. password validations
   * @param {*} plain 
   */
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
