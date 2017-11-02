'use strict';
var app = require('../../server/server');

var permissionsHelper = function () {

}
permissionsHelper.setPermissions = function (model,roles, callback) {
    var conditions = roles.map(function (r) {
        return { principalId: r.name };
      });

    app.models.Permission.find({ where: { or: conditions } }, function (err, p) {
        if (p != undefined && p.length > 0)
            model.permissions = p.map(function (data, index) { return data.permission; });
        callback(model);
    });
}
module.exports = permissionsHelper;