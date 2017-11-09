'use strict';

var dsConfig = require('../datasources.json');
var path = require('path');
var multer = require('multer');
var upload = multer({ dest: './Uploads/' });
var fs = require('fs');
var csv = require('fast-csv');
var loopback = require('loopback');
var rootlog = loopback.log;
var _ = require('underscore');
var permissionHelper = require('../../common/shared/permissionsHelper');

module.exports = function (app) {
  var User = app.models.user;

  // Added by Harnish for validation starts
  var Schools = app.models.School;
  Schools.find({
    where: {
      id: 22 // Need to change it to school id as variable
    },
    include: ['SchoolClass', 'SchoolBoard', 'SchoolDivision', 'SchoolYear']
  }, function (err, lists) {
    var schoolData = lists;
  });

  var Categories = app.models.Category;
  
  Categories.find({
  },function(err, catLists){
    var categoryList = catLists;
  });
  // Added by Harnish for validation ends

  app.get('/verified', function (req, res) {
    rootlog.info('hi');
    rootlog.warn({ lang: 'fr' }, 'au revoir');
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
          var options = {
            objectMode: true,
            headers: true,
            ignoreEmpty: true,
            trim: true,
          };

          app.dataSources.mysql.transaction(models => {
            var counter = 0;
            var stream = fs.createReadStream(filepath);
            var users = [];
            var failedStudents = [];
            var savedStudents = [];
            var csvStream = csv
            .parse()
            .on('data', function(data) {
              counter++;
              if (counter > 1) {
                var studentModel = app.models.Student;
                var studentToAdd = {
                  schoolId: 22,
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
                studentModel.create(studentToAdd, function(err, post) {
                  if (err) {
                    console.error('Error while creating student', err);
                    failedStudents.push({'Row': data, 'Error': err.message});
                  } else {
                    savedStudents.push({'Row': data});
                  }
                });
                
                // var newStuden = {srNo: data[0], firstName: data[1], middleName: data[2],
                //   lastName: data[3], gender: data[4], dob: data[5],
                //   doj: data[6], grNumber: data[7], address: data[8],
                //   phoneNumber: data[9], country: data[10], state: data[11],
                //   religion: data[12], cast: data[13], bloodGroup: data[14],
                //   fathersFirstName: data[15], fathersLastName: data[16],
                //   fathersMobileNumber: data[17], mothersFirstName: data[18],
                //   mothersLastName: data[19], mothersMobileNumber: data[20],
                //   guardian: data[21], guardianFirstName: data[22], guardianLastName: data[23],
                //   guardianMobileNumber: data[24], class: data[25], division: data[26],
                //   catergory: data[27], acadYear: data[28]
                // };
                // console.log('Student', newStuden);
              }
            })
            .on('end', function() {
              // console.timeEnd('dbsave');
              res.status(200);
              res.json({'SavedStudents': savedStudents.length, 'FailedStudents': failedStudents.length, 'Success': failedStudents.length == 0});
            });
            stream.pipe(csvStream);
          });
        });
      }
    });
  });

  app.post('/login', function (req, res) {
    User.login({
      username: req.body.username,
      password: req.body.password,
    }, 'user', function (err, token) {
      if (err) {
        res.status(401);
        res.json({
          'Error': 'Failed',
          'Code': err.code,
          'Message': err.message,
        });
      }
      if (token != undefined) {
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

  app.get('/logout', function (req, res, next) {
    if (!req.accessToken) return res.sendStatus(401); // return 401:unauthorized if accessToken is not present
    User.logout(req.accessToken.id, function (err) {
      if (err) return next(err);
      res.redirect('/'); // on successful logout, redirect
    });
  });
};
