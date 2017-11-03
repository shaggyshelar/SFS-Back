'use strict';

module.exports = function (app) {
  var User = app.models.user;
  var Role = app.models.Role;
  var RoleMapping = app.models.RoleMapping;

  var Permission = app.models.Permission;
  var TempModel = app.models.TempModel;
  var Acl = app.models.ACL;
  var FeatureList = app.models.FeatureList;

  User.create([
    { username: 'John', email: 'john@doe.com', password: 'opensesame', 'emailVerified': true, 'isPasswordChanged': false },
    { username: 'Jane', email: 'jane@doe.com', password: 'opensesame', 'emailVerified': true, 'isPasswordChanged': false },
    { username: 'Bob', email: 'bob@projects.com', password: 'opensesame', 'emailVerified': true, 'isPasswordChanged': false },
    { username: 'Demo', email: 'demo@demo.com', password: 'demo', 'emailVerified': true, 'isPasswordChanged': true },
    { username: 'Tom', email: 'tom@projects.com', password: 'opensesame', 'emailVerified': true, 'isPasswordChanged': false },
    { username: 'Steve', email: 'steve@projects.com', password: 'opensesame', 'emailVerified': true, 'isPasswordChanged': false },
  ], function (err, users) {
    if (err) throw err;

    console.log('Created users:', users);

    // create the admin role
    Role.create({
      name: 'admin',
      displayName: 'admin'
    }, function (err, role) {
      if (err) throw err;

      console.log('Created role:', role);

      // make bob an admin
      role.principals.create({
        principalType: RoleMapping.USER,
        principalId: users[2].id,
      }, function (err, principal) {
        if (err) throw err;

        console.log('Created principal:', principal);
      });
    });

    // create school admin role
    Role.create({
      name: 'SchoolAdmin',
      displayName: 'SchoolAdmin'
    }, function (err, role) {
      if (err) throw err;

      console.log('Created role:', role);

      // make bob an admin
      role.principals.create({
        principalType: RoleMapping.USER,
        principalId: users[4].id,
      }, function (err, principal) {
        if (err) throw err;

        console.log('Created principal:', principal);
      });
    });

    //Add default permissions
    var aclOptions = {
      "model": "TempModel",
      "accessType": "*",
      "principalType": "ROLE",
      "principalId": "$everyone",
      "permission": "DENY"
    };
    Acl.create(aclOptions, function () {
      TempModel.settings.acls.push(aclOptions);
      console.log("Acl added to deny TempModel access all");
    });

    var features = [{
      "FeatureName": "User",
      "ModelName": "user"
    }, {
      "FeatureName": "Role",
      "ModelName": "role"
    }, {
      "FeatureName": "Fee",
      "ModelName": "Fee"
    }, {
      "FeatureName": "Student",
      "ModelName": "Student"
    }, {
      "FeatureName": "Temp",
      "ModelName": "TempModel"
    }];
    features.map(function (f, i) {
      FeatureList.create(f, function () {
        console.log("Added feature " + f.FeatureName);
      });
    });

  });
};
