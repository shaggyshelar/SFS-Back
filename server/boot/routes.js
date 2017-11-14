'use strict';

var dsConfig = require('../datasources.json');
var config = require('../config.json');
var path = require('path');
var multer = require('multer');
var upload = multer({dest: './Uploads/'});
var fs = require('fs');
var csv = require('fast-csv');
var loopback = require('loopback');
var rootlog = loopback.log;
var async = require('async');
var _ = require('underscore');
var permissionHelper = require('../../common/shared/permissionsHelper');

module.exports = function(app) {
  var User = app.models.user;
  var Schools = app.models.School;
  var Categories = app.models.Category;

  app.get('/verified', function(req, res) {
    rootlog.info('hi');
    rootlog.warn({lang: 'fr'}, 'au revoir');
    res.render('verified');
  });

  app.post('/api/uploadcsv', upload.single('csvdata'), function(req, res) {
    var AccessToken = app.models.AccessToken;
    AccessToken.findForRequest(req, {}, function(aux, accesstoken) {
      if (accesstoken == undefined) {
        res.status(401);
        res.json({
          'Error': 'Unauthorized',
          'Message': 'You need to be authenticated to access this endpoint',
        });
      } else {
        var UserModel = app.models.user;
        UserModel.findById(accesstoken.userId, function(err, user) {
          console.time('dbsave');
          var filepath = req.file.path;
          // if (req.file.mimetype != 'application/vnd.ms-excel'){
          //   res.status(400);
          //   res.json({'Message': 'Unsupported file format. Please upload .csv files only.'});
          //   return;
          // }
          var options = {
            objectMode: true,
            headers: true,
            ignoreEmpty: true,
            trim: true,
          };

          async.series([
            function(callback) {
              Schools.find({
                where: {
                  id: req.body.schoolId,
                },
                include: ['SchoolClass', 'SchoolBoard', 'SchoolDivision', 'SchoolYear'],
              }, function(err, lists) {
                callback(null, lists);
              });
            },
            function(callback) {
              Categories.find({
              }, function(err, catLists) {
                callback(null, catLists);
              });
            },
          ],
          function(err, results) {
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
              res.json({'Message': 'Invalid School Information'});
              return;
            } else {
              schoolDetails = schoolDetails.toJSON();
            }
            var categoryList = results[1];
            var csvStream = csv
            .parse()
            .on('data', function(data) {
              counter++;
              if (counter > 1) {
                if (data.length < 28) {
                  var invalidNumberOfColumns = 'Invalid number of columns in row.';
                  failedStudents.push({'Row': data, 'Error': invalidNumberOfColumns});
                  data.push(invalidNumberOfColumns);
                  fastCsv.write(data);
                  return;
                }
                var studentModel = app.models.Student;
                var filteredCategory = categoryList.filter(function(category) {
                  if (category.categoryName == data[27]) {
                    return category;
                  }
                });
                var matchingCategory = filteredCategory && filteredCategory.length ? filteredCategory[0] : null;
                if (!matchingCategory) {
                  var errorMessageCategory = 'Invalid category \'' + data[27] + '\'';
                  failedStudents.push({'Row': data, 'Error': errorMessageCategory});
                  data.push(errorMessageCategory);
                  fastCsv.write(data);
                  return;
                }

                var filteredDivision = schoolDetails.SchoolDivision.filter(function(division) {
                  if (division.divisionName == data[26]) {
                    return division;
                  }
                });
                var matchingDivision = filteredDivision && filteredDivision.length ? filteredDivision[0] : null;
                if (!matchingDivision) {
                  var errorMessage = 'Invalid division \'' + data[26] + '\'';
                  failedStudents.push({'Row': data, 'Error': errorMessage});
                  data.push(errorMessage);
                  fastCsv.write(data);
                  return;
                }

                var filteredClass = schoolDetails.SchoolClass.filter(function(studentClass) {
                  if (studentClass.className == data[25]) {
                    return studentClass;
                  }
                });
                var matchingClass = filteredClass && filteredClass.length ? filteredClass[0] : null;
                if (!matchingClass) {
                  var invalidClass = 'Invalid class \'' + data[25] + '\'';
                  failedStudents.push({'Row': data, 'Error': invalidClass});
                  data.push(invalidClass);
                  fastCsv.write(data);
                  return;
                }
                var studentToAdd = {
                  schoolId: req.body.schoolId,
                  categoryId: 3,
                  classId: 1,
                  divisionId: 2,
                  gRNumber: data[7],
                  studentCode: '1111',
                  studentFirstName: data[1],
                  studentMiddleName: data[2],
                  studentLastName: data[3],
                  studentGender: data[4],
                  fatherFirstName: data[15],
                  fatherLastName: data[16],
                  fatherMobile: data[17],
                  motherFirstName: data[18],
                  motherLastName: data[19],
                  motherMobile: data[20],
                  guardianFirstName: data[22],
                  guardianLastName: data[23],
                  guardianMobile: data[24],
                  studentDateOfBirth: '10/10/1987',
                  dateOfJoining: '10/10/2014',
                  address: data[8],
                  city: '111111',
                  state: data[11],
                  country: data[10],
                  phone: data[9],
                  email: 'test@test.com',
                  religion: data[12],
                  cast: data[13],
                  bloodGroup: data[14],
                  academicYear: 2011,
                  isDelete: false,
                  createdBy: 1,
                  createdOn: '11/08/2017',
                };
                waterfallFunctions.push(function(next) {
                  studentModel.create(studentToAdd, function(err, post) {
                    if (err) {
                      failedStudents.push({'Row': data, 'Error': err.message});
                      data.push(err.message);
                      fastCsv.write(data);
                    } else {
                      savedStudents.push({'Row': data});
                    }
                    next();
                  });
                });
              } else {
                data.push('Error Message');
                fastCsv.write(data);
              }
            })
            .on('end', function() {
              async.waterfall(waterfallFunctions, function(err) {
                fastCsv.end();

                var html = '<h2>Below is report of student data upload!</h2>' +
                '<h2>Saved Students: ' + savedStudents.length + '</h2>' +
                '<h2>Failed Students: ' + failedStudents.length + '</h2>' +
                '<p>Please refer to attach file with student information which was ' +
                'not saved due to some error. Please resolve those and try again later.</p>';
                app.models.Email.send({
                  to: user.toJSON().email,
                  from: config.supportEmailID,
                  subject: 'Student Upload Status',
                  html: html,
                  attachments: [
                    {
                      filename: 'outputfile.csv',
                      content: fs.createReadStream('outputfile.csv'),
                    }],
                }, function(err) {
                  if (err) {
                    console.log('> error sending upload report email');
                  }
                  console.log('> upload report mail sent successfully');
                });

                res.status(200);
                res.json({'SavedStudents': savedStudents.length,
                  'FailedStudents': failedStudents.length,
                  'Success': failedStudents.length == 0});
              });
            });
            stream.pipe(csvStream);
            // });
          });
        });
      }
    });
  });

  app.post('/login', function(req, res) {
    User.login({
      username: req.body.username,
      password: req.body.password,
    }, 'user', function(err, token) {
      if (err) {
        res.status(err.statusCode);
        res.json({
          'Error': 'Failed',
          'Code': err.code,
          'Message': err.message,
        });
      }
      if (token != undefined) {
        var RoleMapping = app.models.RoleMapping;
        var Role = app.models.Role;
        RoleMapping.find({where: {principalId: token.userId}}, function(err, roleMappings) {
          if (roleMappings && roleMappings.length > 0) {
            var roleIds = _.uniq(roleMappings
              .map(function(roleMapping) {
                return roleMapping.roleId;
              }));
            var conditions = roleIds.map(function(roleId) {
              return {id: roleId};
            });
            Role.find({where: {or: conditions}}, function(err, roles) {
              if (err) throw err;
              token.roles = roles;
              permissionHelper.setPermissions(token, roles, function(token) {
                res.status(200);
                res.json(token);
              });
            });
          } else {
            res.status(200);
            res.json(token);
          }
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

  app.get('/logout', function(req, res, next) {
    if (!req.accessToken) return res.sendStatus(401); // return 401:unauthorized if accessToken is not present
    User.logout(req.accessToken.id, function(err) {
      if (err) return next(err);
      res.redirect('/'); // on successful logout, redirect
    });
  });
  
  //send an email with instructions to reset an existing user's password
  app.post('/request-password-reset', function (req, res, next) {
    User.resetPassword({
      email: req.body.email
    }, function (err) {
      if (err) return res.status(401).send(err);

      res.render('response', {
        title: 'Password reset requested',
        content: 'Check your email for further instructions',
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
};
