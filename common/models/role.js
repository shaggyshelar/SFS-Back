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

    // role.observe('before save', function updateTimestamp(ctx, next) {
    //     if (ctx.instance) {
    //         ctx.instance.name = ctx.instance.name + ctx.instance.schoolId
    //     }
    //     else if (ctx.data) {
    //         if (!('modified' in ctx.data))
    //             ctx.data.modified = '';
    //     }
    //     next();
    // });

    role.observe('after save', function updateTimestamp(ctx, next) {
        if (ctx.isNewInstance && ctx.instance) {
            var roleName = ctx.instance.name.replace(/\s/g, '');
            ctx.instance.name = roleName + ctx.instance.id;
            role.updateAll({ id: ctx.instance.id }, { name: roleName + ctx.instance.id }, function (err, updatedRole) {
                if (err)
                    throw err;
                else {
                    next();
                }
            });
        }
        else {
            next();
        }
        // next();
    });

    role.observe('before delete', function (ctx, next) {
        var roleId = ctx.where.id;
        app.models.RoleMapping.find({ where: { roleId: roleId } }, function (err, _roleMapping) {
            if (err) throw err;
            if (_roleMapping.length > 0) {
                var error = new Error();
                error.status = 500;
                error.message = "Can not delete role as this role is still assigned to some users.";
                next(error);
            }
            next();
        });
    });

    // role.afterRemote('deleteRecord', function (context, _deletedRole, next) {
    //     var roleId = context.args.id;
    //     role.findById({ id: roleId }, function (err, _role) {
    //         app.models.ACL.destroyAll({ principalId: _role.name }, function (err, info) {
    //             if (err) throw err;
    //             next();
    //         });
    //     });
    //     next();
    // });

    role.beforeRemote('deleteRecord', function (context, _role, next) {
        console.log(_role);
        var roleId = context.args.id;
        app.models.RoleMapping.find({ where: { roleId: roleId } }, function (err, _roleMapping) {
            if (err) throw err;
            if (_roleMapping.length > 0) {
                var error = new Error();
                error.status = 500;
                error.message = "Can not delete role as this role is still assigned to some users.";
                next(error);
            }
            next();
        });
    });

};