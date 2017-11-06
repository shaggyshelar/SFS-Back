'use strict';
var app = require('../../server/server');

module.exports = function (role) {
    role.afterRemote('findById', function (context, role, next) {

        app.models.RolepermissionDetails.find({ where: { roleId: role.id } }, function (err, permissions) {
            if (permissions && permissions.length > 0) {
                role.permissions = permissions;

                var query = [];
                permissions.map(function (p, i) {
                    var permArr = p.permissionName.split('.');
                    if (permArr && permArr.length == 2) {
                        query.push({ modelName: permArr[0] });
                    }
                });
                app.models.Permission.find({ and: query }, function (err, features) {
                    permissions.map(function (p, i) {
                        var permArr = p.permissionName.split('.');
                        if (permArr && permArr.length == 2) {
                            var fo = features.find(function (f) {
                                return permArr[0] == f.modelName;
                            });
                            if (fo) {
                                p.featureName = fo.permissionName;
                            }
                        }

                    });

                    next();

                });
            }
            else {
                next();
            }
        });
    });
};