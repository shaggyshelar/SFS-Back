'use strict';

var dsConfig = require('../datasources.json');
var config = require('../config.json');
var path = require('path');
var multer = require('multer');
var upload = multer({ dest: './Uploads/' });
var fs = require('fs');
var csv = require('fast-csv');
var loopback = require('loopback');
var rootlogger = loopback.log;
var async = require('async');
var _ = require('underscore');
var i18next = require('i18next');
var permissionHelper = require('../../common/shared/permissionsHelper');
var utilities = require('../../common/shared/utilities');

module.exports = function (app) {
  var User = app.models.user;
  var Schools = app.models.School;
  var Categories = app.models.Category;
  utilities.init(app);

  app.get('/verified', function (req, res) {
    var localizedMessage = i18next.t('key');
    console.log('Localized Message = ' + localizedMessage);

    rootlogger.info('hi');
    rootlogger.warn({ lang: 'fr' }, 'au revoir');
    res.render('verified');
  });

  app.post('/api/uploadcsv', upload.single('csvdata'), function (req, res) {
    var AccessToken = app.models.AccessToken;
    AccessToken.findForRequest(req, {}, function (aux, accesstoken) {
      if (accesstoken == undefined) {
        res.status(401);
        res.json({
          'error': {
            'statusCode': 401,
            'name': 'Error',
            'message': 'Authorization Required',
            'code': 'AUTHORIZATION_REQUIRED',
            'stack': 'Error: Authorization Required',
          },
        });
      } else {
        var UserModel = app.models.user;
        UserModel.findById(accesstoken.userId, function (err, user) {
          var filepath = req.file.path;
          if (!req.file.originalname.endsWith('.csv')) {
            res.status(400);
            res.json({ 'Message': i18next.t('csv_validation_unsupportedFormat') });
            return;
          }
          var options = {
            objectMode: true,
            headers: true,
            ignoreEmpty: true,
            trim: true,
          };

          async.series([
            function (callback) {
              Schools.find({
                where: {
                  id: req.body.schoolId,
                },
                include: ['SchoolClass', 'SchoolBoard', 'SchoolDivision', 'SchoolYear'],
              }, function (err, lists) {
                callback(null, lists);
              });
            },
            function (callback) {
              Categories.find({
              }, function (err, catLists) {
                callback(null, catLists);
              });
            },
          ],
            function (err, results) {
              // app.dataSources.mysql.transaction(models => {  //TODO: Implement transaction
              var counter = 0;
              var stream = fs.createReadStream(filepath);
              var fastCsv = csv.createWriteStream();
              var writeStream = fs.createWriteStream('outputfile.csv');
              fastCsv.pipe(writeStream);

              var failedStudents = [];
              var savedStudents = [];
              var waterfallFunctions = [];
              var schoolDetails = results[0][0];
              if (!schoolDetails) {
                res.status(400);
                res.json({ 'Message': i18next.t('csv_validation_invalidSchoolName') });
                return;
              } else {
                schoolDetails = schoolDetails.toJSON();
              }
              var categoryList = results[1];
              var csvStream = csv
                .parse()
                .on('data', function (data) {
                  counter++;
                  if (counter > 1) {
                    var validationErrors = '';
                    if (data.length < 30) {
                      validationErrors += i18next.t('csv_validation_invalidNumberOfColumns');
                      failedStudents.push({ 'Row': data, 'Error': validationErrors });
                      data.push(validationErrors);
                      fastCsv.write(data);
                      return;
                    }

                    var studentModel = app.models.Student;

                    var firstName = data[1].trim();
                    if (firstName == '') {
                      validationErrors += i18next.t('csv_validation_studentFirstNameRequired');
                    }

                    var middleName = data[2].trim();
                    if (middleName == '') {
                      validationErrors += i18next.t('csv_validation_studentMiddleNameRequired');
                    }

                    var lastName = data[3].trim();
                    if (lastName == '') {
                      validationErrors += i18next.t('csv_validation_studentLastNameRequired');
                    }

                    if (data[4] != '') {
                      var filteredGender = ['Male', 'Female', 'Other'].filter(function (gender) {
                        if (gender == data[4]) {
                          return gender;
                        }
                      });
                      var matchingGender = filteredGender && filteredGender.length ? filteredGender[0] : null;
                      if (!matchingGender) {
                        validationErrors += i18next.t('csv_validation_invalidGender', { gender: data[4] });
                      }
                    } else {
                      validationErrors += i18next.t('csv_validation_studentGenderRequired');
                    }

                    if (data[25] != '') {
                      var filteredClass = schoolDetails.SchoolClass.filter(function (studentClass) {
                        if (studentClass.className == data[25]) {
                          return studentClass;
                        }
                      });
                      var matchingClass = filteredClass && filteredClass.length ? filteredClass[0] : null;
                      if (!matchingClass) {
                        validationErrors += i18next.t('csv_validation_invalidClass', { className: data[25] });
                      }
                    } else {
                      validationErrors += i18next.t('csv_validation_classRequired');
                    }

                    if (data[26] != '') {
                      var filteredDivision = schoolDetails.SchoolDivision.filter(function (division) {
                        if (division.divisionName == data[26]) {
                          return division;
                        }
                      });
                      var matchingDivision = filteredDivision && filteredDivision.length ? filteredDivision[0] : null;
                      if (!matchingDivision) {
                        validationErrors += i18next.t('csv_validation_invalidDivision', { divisionName: data[26] });
                      }
                    } else {
                      validationErrors += i18next.t('csv_validation_divisionRequired');
                    }

                    if (data[27] != '') {
                      var filteredCategory = categoryList.filter(function (category) {
                        if (category.categoryName == data[27]) {
                          return category;
                        }
                      });
                      var matchingCategory = filteredCategory && filteredCategory.length ? filteredCategory[0] : null;
                      if (!matchingCategory) {
                        validationErrors += i18next.t('csv_validation_invalidCategory', { categoryName: data[27] });
                      }
                    } else {
                      validationErrors += i18next.t('csv_validation_categoryRequired');
                    }

                    if (data[28] != '') {
                      var filteredYear = schoolDetails.SchoolYear.filter(function (studentYear) {
                        if (studentYear.academicYear == data[28]) {
                          return studentYear;
                        }
                      });
                      var matchingYear = filteredYear && filteredYear.length ? filteredYear[0] : null;
                      if (!matchingYear) {
                        validationErrors += i18next.t('csv_validation_invalidYear', { acadYear: data[28] });
                      }
                    } else {
                      validationErrors += i18next.t('csv_validation_yearRequired');
                    }

                    if (data[29] == '') {
                      validationErrors += i18next.t('csv_validation_studentCodeRequired');
                    }

                    var dateOfBirth = data[5] == '' ? null : data[5];
                    if (dateOfBirth != null && !Date.parse(dateOfBirth)) {
                      validationErrors += i18next.t('csv_validation_invalidDateOfBirth', {birthDate: dateOfBirth});
                    } else if (dateOfBirth) {
                      var birthdate = new Date(dateOfBirth);
                      var cur = new Date();
                      var diff = cur - birthdate;
                      var age = Math.floor(diff / 31557600000);
                    }

                    if (validationErrors != '') {
                      failedStudents.push({ 'Row': data, 'Error': validationErrors });
                      data.push(validationErrors);
                      fastCsv.write(data);
                      return;
                    }

                    var studentToAdd = {
                      schoolId: req.body.schoolId,
                      categoryId: matchingCategory.id,
                      classId: matchingClass.id,
                      divisionId: matchingDivision.id,
                      gRNumber: data[7].trim(),
                      studentCode: data[29].trim(),
                      studentFirstName: firstName,
                      studentMiddleName: middleName,
                      studentLastName: lastName,
                      studentGender: data[4].trim(),
                      fatherFirstName: data[15].trim(),
                      fatherLastName: data[16].trim(),
                      fatherMobile: data[17].trim(),
                      motherFirstName: data[18].trim(),
                      motherLastName: data[19].trim(),
                      motherMobile: data[20].trim(),
                      guardianFirstName: data[22].trim(),
                      guardianLastName: data[23].trim(),
                      guardianMobile: data[24].trim(),
                      studentDateOfBirth: dateOfBirth,
                      dateOfJoining: data[6] == '' ? null : data[6],
                      address: data[8],
                      city: '',  // TODO:
                      state: data[11],
                      country: data[10],
                      phone: data[9],
                      email: '', // TODO:
                      religion: data[12].trim(),
                      cast: data[13].trim(),
                      bloodGroup: data[14].trim(),
                      academicYear: matchingYear.academicYear,
                      isDelete: false,
                      createdBy: 1,
                      createdOn: '11/14/2017', // TODO:
                    };
                    waterfallFunctions.push(function (next) {
                      studentModel.create(studentToAdd, function (err, post) {
                        if (err) {
                          if (err.errno == 1062) {
                            validationErrors += i18next.t('er_dup_entry');
                          } else {
                            validationErrors += err.message;
                          }
                          failedStudents.push({ 'Row': data, 'Error': validationErrors });
                          data.push(validationErrors);
                          fastCsv.write(data);
                        } else {
                          savedStudents.push({ 'Row': data });
                        }
                        next();
                      });
                    });
                  } else {
                    data.push('Error Message');
                    fastCsv.write(data);
                  }
                })
                .on('end', function () {
                  async.waterfall(waterfallFunctions, function (err) {
                    fastCsv.end();
                    var html = i18next.t('csv_emailReportHTMLContent', { savedStudents: savedStudents.length, failedStudents: failedStudents.length });
                    if (failedStudents.length == 0) {
                      app.models.Email.send({
                        to: user.toJSON().email,
                        from: config.supportEmailID,
                        subject: i18next.t('csv_emailReportSubject'),
                        html: html,
                      }, function (err) {
                        if (err) {
                          rootlogger.log('Error sending upload report to email=\'' + user.toJSON().email + '\',\n Error=' + err);
                        }
                        rootlogger.log('Upload report mail sent successfully to ' + user.toJSON().email);
                      });
                    } else {
                      app.models.Email.send({
                        to: user.toJSON().email,
                        from: config.supportEmailID,
                        subject: i18next.t('csv_emailReportSubject'),
                        html: html,
                        attachments: [
                          {
                            filename: 'outputfile.csv',
                            content: fs.createReadStream('outputfile.csv'),
                          }],
                      }, function (err) {
                        if (err) {
                          rootlogger.log('Error sending upload report to email=\'' + user.toJSON().email + '\',\n Error=' + err);
                        }
                        console.log('> upload report mail sent successfully');
                      });
                    }

                    res.status(200);
                    res.json({
                      'SavedStudents': savedStudents.length,
                      'FailedStudents': failedStudents.length,
                      'Success': failedStudents.length == 0
                    });
                  });
                });
              stream.pipe(csvStream);
              // });
            });
        });
      }
    });
  });

  app.post('/login', function (req, res) {
    User.login({
      username: req.body.username,
      password: req.body.password,
    }, 'user', function (loginErr, token) {
      app.models.user.findOne({
        where: { username: req.body.username }, include: ['school', 'role']
      }, function (err, loggedInUser) {
        if (err) {
          throw err;
        } else if (loggedInUser) {
          if (!loggedInUser.emailVerified) {
            res.status(401);
            res.json({
              'Error': i18next.t('authentication_failed'),
              'Code': i18next.t('authentication_email_not_verified_code'),
              'Message': i18next.t('authentication_email_not_verified_message'),
            });
          }
          else if (!loggedInUser.isActivate) {

            res.status(401);
            res.json({
              'Error': i18next.t('authentication_failed'),
              'Code': i18next.t('authentication_failed_default_code'),
              'Message': i18next.t('authentication_failed_default_message'),
            });
          }
          else if (loggedInUser.isBolocked) {
            res.status(401);
            res.json({
              'Error': i18next.t('authentication_failed'),
              'Code': i18next.t('authentication_user_locked_code'),
              'Message': i18next.t('authentication_user_locked_message'),
            });
          }
          else if (loginErr) {
            var updateUserObj = {};
            if (loggedInUser.failedPasswordAttemptCount == 2) {
              updateUserObj.failedPasswordAttemptCount = 3;
              updateUserObj.isBolocked = true;
            }
            else {
              updateUserObj.failedPasswordAttemptCount = loggedInUser.failedPasswordAttemptCount + 1;
            }

            app.models.user.updateAll({ id: loggedInUser.id }, updateUserObj, function (err, updatedUser) {
              if (err) throw err;
              else {
                if (updateUserObj.failedPasswordAttemptCount == 3) {
                  var emailList = [];
                  emailList.push({ relation: "self", email: loggedInUser.email });

                  if (loggedInUser.roleId == i18next.t('school_admin_role_Id')) {

                    app.models.user.find({ where: { roleId: i18next.t('super_admin_role_Id') }, include: { relation: 'role' } }, function (err, superAdminUsers) {
                      if (err) throw err;
                      if (superAdminUsers && superAdminUsers.length > 0) {
                        superAdminUsers.map(function (superadmin, index) {
                          User.app.models.Email.send({
                            to: superadmin.email,
                            from: superadmin.email,
                            subject: i18next.t('authentication_user_locked_subject'),
                            html: i18next.t('authentication_user_locked_email_admin', { username: loggedInUser.username }),
                          }, function (err) {
                            if (err) return console.log('> error sending user locked email');
                            console.log('> sending user locked email to:', superadmin.email);
                          });
                        });
                        User.app.models.Email.send({
                          to: loggedInUser.email,
                          from: loggedInUser.email,
                          subject: i18next.t('authentication_user_locked_subject'),
                          html: i18next.t('authentication_user_locked_email', { username: loggedInUser.username }),
                        }, function (err) {
                          if (err) return console.log('> error sending user locked email');
                          console.log('> sending user locked email to:', loggedInUser.email);
                        });
                      }
                      res.status(401);
                      res.json({
                        'Error': i18next.t('authentication_failed'),
                        'Code': i18next.t('authentication_user_locked_code'),
                        'Message': i18next.t('authentication_user_locked_message'),
                      });
                    });
                  }
                  else if (loggedInUser.roleId == i18next.t('super_admin_role_Id')) {
                    User.app.models.Email.send({
                      to: loggedInUser.email,
                      from: loggedInUser.email,
                      subject: i18next.t('authentication_user_locked_subject'),
                      html: i18next.t('authentication_superadmin_locked_email', { username: loggedInUser.username }),
                    }, function (err) {
                      if (err) return console.log('> error sending user locked email');
                      console.log('> sending user locked email to:', loggedInUser.email);
                    });
                    res.status(401);
                    res.json({
                      'Error': i18next.t('authentication_failed'),
                      'Code': i18next.t('authentication_user_locked_code'),
                      'Message': i18next.t('authentication_user_locked_message'),
                    });
                  }
                  else {
                    var userSchools = loggedInUser.__data.school;
                    if (userSchools && userSchools.length > 0) {

                      var conditions = [];
                      userSchools.map(function (data, index) {
                        conditions.push({ schoolId: data.id });
                      });

                      app.models.role.findOne({ where: { name: i18next.t('school_admin_role_name') } }, function (err, saRole) {
                        if (err) throw err;
                        if (saRole) {


                          app.models.Userschooldetails.find({ where: { or: conditions }, include: { relation: 'UserschoolUser' } },
                            function (err, _userSchoolDetails) {
                              if (err) throw err;
                              var adminUsers = _userSchoolDetails.filter(function (data) { if (data.__data.UserschoolUser) return data.__data.UserschoolUser.roleId == 2 });
                              adminUsers.map(function (userMapping, index) {
                                User.app.models.Email.send({
                                  to: userMapping.UserschoolUser().email,
                                  from: userMapping.UserschoolUser().email,
                                  subject: i18next.t('authentication_user_locked_subject'),
                                  html: i18next.t('authentication_user_locked_email', { username: loggedInUser.username }),
                                }, function (err) {
                                  if (err) return console.log('> error sending user locked email');
                                  console.log('> sending user locked email to:', userMapping.UserschoolUser().email);
                                });
                              });
                              User.app.models.Email.send({
                                to: loggedInUser.email,
                                from: loggedInUser.email,
                                subject: i18next.t('authentication_user_locked_subject'),
                                html: i18next.t('authentication_user_locked_email', { username: loggedInUser.username }),
                              }, function (err) {
                                if (err) return console.log('> error sending user locked email');
                                console.log('> sending user locked email to:', loggedInUser.email);
                              });
                              res.status(401);
                              res.json({
                                'Error': i18next.t('authentication_failed'),
                                'Code': i18next.t('authentication_user_locked_code'),
                                'Message': i18next.t('authentication_user_locked_message'),
                              });
                            });
                        }
                      });
                    }
                  }
                }
                else {
                  res.status(loginErr.statusCode);
                  res.json({
                    'Error': i18next.t('authentication_failed'),
                    'Code': loginErr.code,
                    'Message': loginErr.message,
                  });
                }
              }
            });
          }
          else if (token) {
            // if (loggedInUser.failedPasswordAttemptCount > 0) {
            app.models.user.updateAll({ id: token.userId }, { failedPasswordAttemptCount: 0, lastLogin: new Date() }, function (err, updatedUser) {
              if (err) throw err;
              else {
                app.models.user.createTokenObject(token, function (token) {
                  res.status(200);
                  res.json(token);
                });
              }
            });
          }
        } else {
          res.status(loginErr.statusCode);
          res.json({
            'Error': i18next.t('authentication_failed'),
            'Code': loginErr.code,
            'Message': loginErr.message,
          });
        }
      });
    });
  });
  // app.post('/login', function(req, res) {
  //   User.login({
  //     username: req.body.username,
  //     password: req.body.password,
  //   }, 'user', function(err, token) {
  // if (err) {
  //   res.status(err.statusCode);
  //   res.json({
  //     'Error': 'Failed',
  //     'Code': err.code,
  //     'Message': err.message,
  //   });
  // }
  // if (token != undefined) {
  //   var RoleMapping = app.models.RoleMapping;
  //   var Role = app.models.Role;
  //   RoleMapping.find({where: {principalId: token.userId}}, function(err, roleMappings) {
  //     if (roleMappings && roleMappings.length > 0) {
  //       var roleIds = _.uniq(roleMappings
  //         .map(function(roleMapping) {
  //           return roleMapping.roleId;
  //         }));
  //       var conditions = roleIds.map(function(roleId) {
  //         return {id: roleId};
  //       });
  //       Role.find({where: {or: conditions}}, function(err, roles) {
  //         if (err) throw err;
  //         token.roles = roles;
  //         permissionHelper.setPermissions(token, roles, function(token) {
  //           res.status(200);
  //           res.json(token);
  //         });
  //       });
  //     } else {
  //       res.status(200);
  //       res.json(token);
  //     }
  //   });

  //   // var isPasswordChanged = token.toJSON().user.isPasswordChanged;
  //   // if (isPasswordChanged) {
  //   //   res.status(200);
  //   //   res.send({
  //   //     'token': token.id,
  //   //     'ttl': token.ttl,
  //   //     'created': token.created,
  //   //     'userId': token.userId,
  //   //   });
  //   // } else {
  //   //   res.status(401);
  //   //   res.send({
  //   //     'Error': 'ChangeTemporaryPassword',
  //   //     'Message': 'Please change password first.',
  //   //   });
  //   // }
  // }
  //   });
  // });

  app.get('/logout', function (req, res, next) {
    if (!req.accessToken) return res.sendStatus(401); // return 401:unauthorized if accessToken is not present
    User.logout(req.accessToken.id, function (err) {
      if (err) return next(err);
      res.redirect('/'); // on successful logout, redirect
    });
  });

  //send an email with instructions to reset an existing user's password
  app.post('/request-password-reset', function (req, res, next) {
    User.resetPassword({
      email: req.body.email
    }, function (err) {
      if (err) return res.status(401).send({
        'Error': i18next.t('authentication_failed'),
        'Code': err.code,
        'Message': err.message,
      });
      res.status(200).send({
        title: i18next.t('resetpassword_response_title'),
        content: i18next.t('resetpassword_response_content'),
        redirectTo: '/',
        redirectToLinkText: 'Log in'
      });
    });
  });

  //show password reset form
  app.get('/reset-password', function (req, res, next) {
    if (!req.accessToken) return res.sendStatus(401);
    res.render('password-reset', {
      redirectUrl: '/api/users/reset-password?access_token=' +
      req.accessToken.id
    });
  });

  app.models.user.createTokenObject = function (token, callBack) {
    var RoleMapping = app.models.RoleMapping;
    var Role = app.models.Role;
    RoleMapping.find({ where: { principalId: token.userId } }, function (err, roleMappings) {
      if (roleMappings && roleMappings.length > 0) {
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

            callBack(token);
          });
        });
      } else {
        callBack(token);
      }
    });
  }
};
