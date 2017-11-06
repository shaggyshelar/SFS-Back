'use strict';

module.exports = function (app) {
  var User = app.models.user;
  var Role = app.models.Role;
  var RoleMapping = app.models.RoleMapping;

  var Permission = app.models.Permission;
  var TempModel = app.models.TempModel;
  var Acl = app.models.ACL;
  var FeatureList = app.models.FeatureList;
  var Menu = app.models.Menu;
  var PermissionList = app.models.PermissionList;

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
        var permissionOptions = [
          {
            "permission": "Institute.Read",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Institute.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Institute.Update",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Institute.Delete",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Board.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Board.Read",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Board.Update",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Board.Delete",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "School.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "School.Read",
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
          },
          {
            "permission": "Role.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Role.Read",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Role.Update",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Role.Delete",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "user.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "user.Read",
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
          },
          {
            "permission": "Frequency.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Frequency.Read",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Frequency.Update",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Frequency.Delete",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Class.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Class.Read",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Class.Update",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Class.Delete",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Division.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Division.Read",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Division.Update",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Division.Delete",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Category.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Category.Read",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Category.Update",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Category.Delete",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Feehead.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Feehead.Read",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Feehead.Update",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Feehead.Delete",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Feeplan.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Feeplan.Read",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Feeplan.Update",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Feeplan.Delete",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Transport.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Transport.Read",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Transport.Update",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Transport.Delete",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Addhocfee.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Addhocfee.Read",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Addhocfee.Update",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Addhocfee.Delete",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Stutdent.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Stutdent.Read",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Stutdent.Update",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Stutdent.Delete",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "ProcessFee.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "ProcessFee.Read",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "ProcessFee.Update",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "ProcessFee.Delete",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Report.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Report.Read",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Report.Update",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "Report.Delete",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "AcademicYear.Create",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "AcademicYear.Read",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "AcademicYear.Update",
            "principalName": "admin",
            "principalId": "1"
          },
          {
            "permission": "AcademicYear.Delete",
            "principalName": "admin",
            "principalId": "1"
          },
          {
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
          },
          {
            "permission": "Role.Create",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Role.Read",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Role.Update",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Role.Delete",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "user.Create",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "user.Read",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "user.Update",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "user.Delete",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Frequency.Create",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Frequency.Read",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Frequency.Update",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Frequency.Delete",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Class.Create",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Class.Read",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Class.Update",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Class.Delete",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Division.Create",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Division.Read",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Division.Update",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Division.Delete",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Category.Create",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Category.Read",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Category.Update",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Category.Delete",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Feehead.Create",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Feehead.Read",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Feehead.Update",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Feehead.Delete",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Feeplan.Create",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Feeplan.Read",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Feeplan.Update",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Feeplan.Delete",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Transport.Create",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Transport.Read",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Transport.Update",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Transport.Delete",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Addhocfee.Create",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Addhocfee.Read",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Addhocfee.Update",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Addhocfee.Delete",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Stutdent.Create",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Stutdent.Read",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Stutdent.Update",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Stutdent.Delete",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "ProcessFee.Create",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "ProcessFee.Read",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "ProcessFee.Update",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "ProcessFee.Delete",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Report.Create",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Report.Read",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Report.Update",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "Report.Delete",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "AcademicYear.Create",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "AcademicYear.Read",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "AcademicYear.Update",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "AcademicYear.Delete",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "TempModel.Read",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          }, {
            "permission": "TempModel.Create",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "TempModel.Update",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          },
          {
            "permission": "TempModel.Delete",
            "principalName": "SchoolAdmin",
            "principalId": "2"
          }];
        Permission.create(permissionOptions, function (err, per) {
          if (err) throw err;
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
        "model": "Institute",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Institute",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Institute",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Institute",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Board",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Board",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Board",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Board",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "School",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "School",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "School",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "School",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Role",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Role",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Role",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Role",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "User",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "User",
        "property": "createUser",
        "accessType": "EXECUTE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "User",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "User",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "User",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Frequency",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Frequency",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Frequency",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Frequency",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Class",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Class",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Class",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Class",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Division",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Division",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Division",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Division",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Category",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Category",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Category",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Category",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Feehead",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Feehead",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Feehead",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Feehead",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Feeplan",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Feeplan",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Feeplan",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Feeplan",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Transport",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Transport",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Transport",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Transport",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Addhocfee",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Addhocfee",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Addhocfee",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Addhocfee",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Stutdent",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Stutdent",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Stutdent",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Stutdent",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "ProcessFee",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "ProcessFee",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "ProcessFee",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "ProcessFee",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Report",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Report",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Report",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "Report",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "AcademicYear",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "AcademicYear",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "AcademicYear",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      },
      {
        "model": "AcademicYear",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "admin",

      }, {
        "model": "TempModel",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "TempModel",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "TempModel",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "TempModel",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      }, {
        "model": "Role",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Role",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Role",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Role",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "User",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "User",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "User",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "User",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Frequency",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Frequency",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Frequency",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Frequency",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Class",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Class",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Class",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Class",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Division",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Division",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Division",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Division",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Category",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Category",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Category",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Category",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Feehead",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Feehead",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Feehead",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Feehead",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Feeplan",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Feeplan",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Feeplan",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Feeplan",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Transport",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Transport",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Transport",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Transport",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Addhocfee",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Addhocfee",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Addhocfee",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Addhocfee",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Stutdent",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Stutdent",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Stutdent",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Stutdent",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "ProcessFee",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "ProcessFee",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "ProcessFee",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "ProcessFee",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Report",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Report",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Report",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "Report",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "AcademicYear",
        "accessType": "READ",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "AcademicYear",
        "property": "updateAttributes",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "AcademicYear",
        "property": "destroyById",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },
      {
        "model": "AcademicYear",
        "property": "create",
        "accessType": "WRITE",
        "principalType": "ROLE",
        "principalId": "SchoolAdmin",

      },

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

    var features = [
      {
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

    var menus = [
      {
        "menuName": "Institute",
        "menuParentId": 0,
        "logicalSequence": 1,
        "isDelete": false
      },
      {
        "menuName": "Board",
        "menuParentId": 0,
        "logicalSequence": 2,
        "isDelete": false
      },
      {
        "menuName": "Schools",
        "menuParentId": 0,
        "logicalSequence": 3,
        "isDelete": false
      },
      {
        "menuName": "Role And Permissions",
        "menuParentId": 0,
        "logicalSequence": 4,
        "isDelete": false
      },
      {
        "menuName": "User Management",
        "menuParentId": 0,
        "logicalSequence": 5,
        "isDelete": false
      },
      {
        "menuName": "Payment Frequey",
        "menuParentId": 0,
        "logicalSequence": 6,
        "isDelete": false
      },
      {
        "menuName": "Class",
        "menuParentId": 0,
        "logicalSequence": 7,
        "isDelete": false
      },
      {
        "menuName": "Division",
        "menuParentId": 0,
        "logicalSequence": 8,
        "isDelete": false
      },
      {
        "menuName": "Category",
        "menuParentId": 0,
        "logicalSequence": 9,
        "isDelete": false
      },
      {
        "menuName": "Fee Heads",
        "menuParentId": 0,
        "logicalSequence": 10,
        "isDelete": false
      },
      {
        "menuName": "Fee Plans",
        "menuParentId": 0,
        "logicalSequence": 11,
        "isDelete": false
      },
      {
        "menuName": "Transports",
        "menuParentId": 0,
        "logicalSequence": 12,
        "isDelete": false
      },
      {
        "menuName": "AddHoc Fee",
        "menuParentId": 0,
        "logicalSequence": 13,
        "isDelete": false
      },
      {
        "menuName": "Student Management",
        "menuParentId": 0,
        "logicalSequence": 14,
        "isDelete": false
      },
      {
        "menuName": "Process Fee",
        "menuParentId": 0,
        "logicalSequence": 15,
        "isDelete": false
      },
      {
        "menuName": "Reports",
        "menuParentId": 0,
        "logicalSequence": 16,
        "isDelete": false
      },
      {
        "menuName": "AcademicYear",
        "menuParentId": 0,
        "logicalSequence": 17,
        "isDelete": false
      },

    ];
    var menuPermissions = [
      {
        "menuId": 1,
        "permissionName": "Institute.Read",
        "isDelete": false
      },
      {
        "menuId": 1,
        "permissionName": "Institute.Create",
        "isDelete": false
      },
      {
        "menuId": 1,
        "permissionName": "Institute.Update",
        "isDelete": false
      },
      {
        "menuId": 1,
        "permissionName": "Institute.Delete",
        "isDelete": false
      },
      {
        "menuId": 2,
        "permissionName": "Board.Create",
        "isDelete": false
      },
      {
        "menuId": 2,
        "permissionName": "Board.Read",
        "isDelete": false
      },
      {
        "menuId": 2,
        "permissionName": "Board.Update",
        "isDelete": false
      },
      {
        "menuId": 2,
        "permissionName": "Board.Delete",
        "isDelete": false
      },
      {
        "menuId": 3,
        "permissionName": "School.Create",
        "isDelete": false
      },
      {
        "menuId": 3,
        "permissionName": "School.Read",
        "isDelete": false
      },
      {
        "menuId": 3,
        "permissionName": "School.Update",
        "isDelete": false
      },
      {
        "menuId": 3,
        "permissionName": "School.Delete",
        "isDelete": false
      },
      {
        "menuId": 4,
        "permissionName": "Role.Create",
        "isDelete": false
      },
      {
        "menuId": 4,
        "permissionName": "Role.Read",
        "isDelete": false
      },
      {
        "menuId": 4,
        "permissionName": "Role.Update",
        "isDelete": false
      },
      {
        "menuId": 4,
        "permissionName": "Role.Delete",
        "isDelete": false
      },
      {
        "menuId": 5,
        "permissionName": "User.Create",
        "isDelete": false
      },
      {
        "menuId": 5,
        "permissionName": "User.Read",
        "isDelete": false
      },
      {
        "menuId": 5,
        "permissionName": "User.Update",
        "isDelete": false
      },
      {
        "menuId": 5,
        "permissionName": "User.Delete",
        "isDelete": false
      },
      {
        "menuId": 6,
        "permissionName": "Frequency.Create",
        "isDelete": false
      },
      {
        "menuId": 6,
        "permissionName": "Frequency.Read",
        "isDelete": false
      },
      {
        "menuId": 6,
        "permissionName": "Frequency.Update",
        "isDelete": false
      },
      {
        "menuId": 6,
        "permissionName": "Frequency.Delete",
        "isDelete": false
      },
      {
        "menuId": 7,
        "permissionName": "Class.Create",
        "isDelete": false
      },
      {
        "menuId": 7,
        "permissionName": "Class.Read",
        "isDelete": false
      },
      {
        "menuId": 7,
        "permissionName": "Class.Update",
        "isDelete": false
      },
      {
        "menuId": 7,
        "permissionName": "Class.Delete",
        "isDelete": false
      },
      {
        "menuId": 8,
        "permissionName": "Division.Create",
        "isDelete": false
      },
      {
        "menuId": 8,
        "permissionName": "Division.Read",
        "isDelete": false
      },
      {
        "menuId": 8,
        "permissionName": "Division.Update",
        "isDelete": false
      },
      {
        "menuId": 8,
        "permissionName": "Division.Delete",
        "isDelete": false
      },
      {
        "menuId": 9,
        "permissionName": "Category.Create",
        "isDelete": false
      },
      {
        "menuId": 9,
        "permissionName": "Category.Read",
        "isDelete": false
      },
      {
        "menuId": 9,
        "permissionName": "Category.Update",
        "isDelete": false
      },
      {
        "menuId": 9,
        "permissionName": "Category.Delete",
        "isDelete": false
      },
      {
        "menuId": 10,
        "permissionName": "Feehead.Create",
        "isDelete": false
      },
      {
        "menuId": 10,
        "permissionName": "Feehead.Read",
        "isDelete": false
      },
      {
        "menuId": 10,
        "permissionName": "Feehead.Update",
        "isDelete": false
      },
      {
        "menuId": 10,
        "permissionName": "Feehead.Delete",
        "isDelete": false
      },
      {
        "menuId": 11,
        "permissionName": "Feeplan.Create",
        "isDelete": false
      },
      {
        "menuId": 11,
        "permissionName": "Feeplan.Read",
        "isDelete": false
      },
      {
        "menuId": 11,
        "permissionName": "Feeplan.Update",
        "isDelete": false
      },
      {
        "menuId": 11,
        "permissionName": "Feeplan.Delete",
        "isDelete": false
      },
      {
        "menuId": 12,
        "permissionName": "Transport.Create",
        "isDelete": false
      },
      {
        "menuId": 12,
        "permissionName": "Transport.Read",
        "isDelete": false
      },
      {
        "menuId": 12,
        "permissionName": "Transport.Update",
        "isDelete": false
      },
      {
        "menuId": 12,
        "permissionName": "Transport.Delete",
        "isDelete": false
      },
      {
        "menuId": 13,
        "permissionName": "Addhocfee.Create",
        "isDelete": false
      },
      {
        "menuId": 13,
        "permissionName": "Addhocfee.Read",
        "isDelete": false
      },
      {
        "menuId": 13,
        "permissionName": "Addhocfee.Update",
        "isDelete": false
      },
      {
        "menuId": 13,
        "permissionName": "Addhocfee.Delete",
        "isDelete": false
      },
      {
        "menuId": 14,
        "permissionName": "Stutdent.Create",
        "isDelete": false
      },
      {
        "menuId": 14,
        "permissionName": "Stutdent.Read",
        "isDelete": false
      },
      {
        "menuId": 14,
        "permissionName": "Stutdent.Update",
        "isDelete": false
      },
      {
        "menuId": 14,
        "permissionName": "Stutdent.Delete",
        "isDelete": false
      },
      {
        "menuId": 15,
        "permissionName": "ProcessFee.Create",
        "isDelete": false
      },
      {
        "menuId": 15,
        "permissionName": "ProcessFee.Read",
        "isDelete": false
      },
      {
        "menuId": 15,
        "permissionName": "ProcessFee.Update",
        "isDelete": false
      },
      {
        "menuId": 15,
        "permissionName": "ProcessFee.Delete",
        "isDelete": false
      },
      {
        "menuId": 16,
        "permissionName": "Report.Create",
        "isDelete": false
      },
      {
        "menuId": 16,
        "permissionName": "Report.Read",
        "isDelete": false
      },
      {
        "menuId": 16,
        "permissionName": "Report.Update",
        "isDelete": false
      },
      {
        "menuId": 16,
        "permissionName": "Report.Delete",
        "isDelete": false
      },
      {
        "menuId": 17,
        "permissionName": "AcademicYear.Create",
        "isDelete": false
      },
      {
        "menuId": 17,
        "permissionName": "AcademicYear.Read",
        "isDelete": false
      },
      {
        "menuId": 17,
        "permissionName": "AcademicYear.Update",
        "isDelete": false
      },
      {
        "menuId": 17,
        "permissionName": "AcademicYear.Delete",
        "isDelete": false
      }];
    Menu.create(menus, function (err, data) {
      if (err) throw err;
      PermissionList.create(menuPermissions, function (err, per) {
        if (err) throw err;
      });
    });


  });
};