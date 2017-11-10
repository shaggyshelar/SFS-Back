'use strict';
var app = require('../../server/server');

module.exports = function (role) {
    role.afterRemote('findById', function (context, role, next) {

        app.models.RolepermissionDetails.find({ where: { roleId: role.id } }, function (err, permissionMap) {
            if (permissionMap && permissionMap.length > 0) {
                role.permissions = permissionMap;

                var query = [];
                permissionMap.map(function (p, i) {
                    var permArr = p.permissionName.split('.');
                    if (permArr && permArr.length == 2) {
                        query.push({ modelName: permArr[0] });
                    }
                });
                app.models.Permission.find({ and: query }, function (err, permissions) {

                    permissionMap.map(function (pm, i) {
                        var currentPermission = permissions.find(function (f) {
                            return pm.permissionId == f.id;
                        });
                        if (currentPermission) {
                            pm.menuId = currentPermission.menuId;
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

    role.observe('before save', function updateTimestamp(ctx, next) {
        if (ctx.instance) {
            ctx.instance.name = ctx.instance.name + ctx.instance.schoolId
        }
        else if (ctx.data) {
            if (!('modified' in ctx.data))
                ctx.data.modified = '';
        }
        next();
    });
};