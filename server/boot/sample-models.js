'use strict';

module.exports = function(app) {
  var User = app.models.user;
  var Role = app.models.Role;
  var RoleMapping = app.models.RoleMapping;

  // User.create([
  //     {username: 'John', email: 'john@doe.com', password: 'opensesame', 'emailVerified': true, 'isPasswordChanged': false},
  //     {username: 'Jane', email: 'jane@doe.com', password: 'opensesame', 'emailVerified': true, 'isPasswordChanged': false},
  //     {username: 'Bob', email: 'bob@projects.com', password: 'opensesame', 'emailVerified': true, 'isPasswordChanged': false},
  //     {username: 'Demo', email: 'demo@demo.com', password: 'demo', 'emailVerified': true, 'isPasswordChanged': true},
  // ], function(err, users) {
  //   if (err) throw err;

  //   console.log('Created users:', users);

  //     // create the admin role
  //   Role.create({
  //     name: 'admin',
  //   }, function(err, role) {
  //     if (err) throw err;

  //     console.log('Created role:', role);

  //       // make bob an admin
  //     role.principals.create({
  //       principalType: RoleMapping.USER,
  //       principalId: users[2].id,
  //     }, function(err, principal) {
  //       if (err) throw err;

  //       console.log('Created principal:', principal);
  //     });
  //   });
  // });
};
