'use strict';
var app = require('../../server/server');

var permissionsHelper = function () {

}
permissionsHelper.setPermissions = function (model, roles, callback) {
    var conditions = roles.map(function (r) {
        return { roleName: r.name };
    });

    app.models.RolepermissionDetails.find({ where: { or: conditions } }, function (err, p) {
        if (p != undefined && p.length > 0)
            model.permissions = p.map(function (data, index) { return data.permissionName; });
        callback(model);
    });
}

permissionsHelper.setPermissionByRoleId = function (model, roleId, callback) {
    // var conditions = roles.map(function (r) {
    //     return { roleName: r.name };
    //   });

    app.models.RolepermissionDetails.find({ where: { roleId: roleId } }, function (err, p) {
        if (p != undefined && p.length > 0)
            model.permissions = p.map(function (data, index) { return data.permissionName; });
        callback(model);
    });
}
module.exports = permissionsHelper;