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

        //assign permissions to bob
        var permissionOptions = [{
          "permission": "School.Read",
          "principalName": "admin",
          "principalId": "1"
        }, {
          "permission": "School.Create",
          "principalName": "admin",
          "principalId": "1"
        },
        {
          "permission": "School.Update",
          "principalName": "admin",
          "principalId": "1"
        },
        {
          "permission": "School.Delete",
          "principalName": "admin",
          "principalId": "1"
        }, {
          "permission": "user.Read",
          "principalName": "admin",
          "principalId": "1"
        }, {
          "permission": "user.Create",
          "principalName": "admin",
          "principalId": "1"
        },
        {
          "permission": "user.Update",
          "principalName": "admin",
          "principalId": "1"
        },
        {
          "permission": "user.Delete",
          "principalName": "admin",
          "principalId": "1"
        }, {
          "permission": "TempModel.Read",
          "principalName": "admin",
          "principalId": "1"
        }, {
          "permission": "TempModel.Create",
          "principalName": "admin",
          "principalId": "1"
        },
        {
          "permission": "TempModel.Update",
          "principalName": "admin",
          "principalId": "1"
        },
        {
          "permission": "TempModel.Delete",
          "principalName": "admin",
          "principalId": "1"
        }];
        Permission.create(permissionOptions, function (err, per) {
          if(err) throw err;
          console.log('permissions added');
        });
      });
    });

    //Add default permissions
    var aclOptions = [
      {
        "model": "TempModel",
        "accessType": "*",
        "permission": "DENY",
        "principalType": "ROLE",
        "principalId": "$everyone",
      }, 
      {
        "model": "user",
        "accessType": "*",
        "permission": "DENY",
        "principalType": "ROLE",
        "principalId": "$everyone",
      },
      {
        "model": "TempModel",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",
      },
      {
        "model": "TempModel",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",
      },
      {
        "model": "TempModel",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",
      },
      {
        "model": "TempModel",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",
      },
      {
        "model": "Student",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",
      },
      {
        "model": "Student",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",
      },
      {
        "model": "Student",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",
      },
      {
        "model": "Student",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",
      },
      {
        "model": "Student",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",
      },
      {
        "model": "user",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",
      },
      {
        "model": "user",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",
      },
      {
        "model": "user",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",
      },
      {
        "model": "user",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",
      }
    ];


    Acl.create(aclOptions, function (err, newAcls) {
      newAcls.map(function (acl, i) {
        var modelInstance = app.models[acl.model];
        if (modelInstance && modelInstance != undefined) {
          modelInstance.settings.acls.push(acl);
        }
      });
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
