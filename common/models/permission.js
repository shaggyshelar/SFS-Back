'use strict';
var app = require('../../server/server');

module.exports = function (Permission) {
    Permission.afterRemote('create', function (context, permission, next) {
        var modelPermissionArray = permission.permission.split('.');
        if (modelPermissionArray != undefined && modelPermissionArray.length == 2) {
            var _model = modelPermissionArray[0];
            var _permission = modelPermissionArray[1];
            var _principalName = permission.principalName;
            var options = {};
            options.model = _model;
            options.principalId = _principalName;
            options.principalType = "ROLE";
            if (_permission == "Create") {
                options.property = "create";
                options.accessType = "WRITE";
            }
            else if (_permission == "Update") {
                options.property = "updateAttributes";
                options.accessType = "WRITE";
            }
            else if (_permission == "Delete") {
                options.property = "destroyById";
                options.accessType = "WRITE";
            }
            else if (_permission == "Read") {
                options.accessType = "READ";
            }
            app.models.ACL.create(options, function (err, info) {
                var modelInstance = app.models[options.model];
                if (modelInstance && modelInstance != undefined) {
                    modelInstance.settings.acls.push(options);
                }
                next();
            });
        } else {
            next();
        }
    });

    Permission.observe('before delete', function (ctx, next) {

        Permission.findById(ctx.where.id, function (err, permissionModel) {
            if (permissionModel) {
                var permissionStr = permissionModel.permission;
                var modelPermissionArray = permissionStr.split('.');
                if (modelPermissionArray != undefined && modelPermissionArray.length == 2) {
                    var _model = modelPermissionArray[0];
                    var _permission = modelPermissionArray[1];
                    var _principalName = permissionModel.principalName;
                    var options = {};
                    var conditions = [];

                    conditions.push({ model: _model });
                    conditions.push({ principalId: _principalName });
                    conditions.push({ principalType: "ROLE" });

                    options.model = _model;
                    options.principalId = _principalName;
                    options.principalType = "ROLE";

                    if (_permission == "Create") {
                        conditions.push({ property: "create" });
                        conditions.push({ accessType: "WRITE" });

                        options.property = "create";
                        options.accessType = "WRITE";
                    }
                    else if (_permission == "Update") {
                        conditions.push({ property: "updateAttributes" });
                        conditions.push({ accessType: "WRITE" });

                        options.property = "updateAttributes";
                        options.accessType = "WRITE";
                    }
                    else if (_permission == "Delete") {
                        conditions.push({ property: "destroyById" });
                        conditions.push({ accessType: "WRITE" });

                        options.property = "destroyById";
                        options.accessType = "WRITE";
                    }
                    else if (_permission == "Read") {
                        conditions.push({ accessType: "READ" });

                        options.accessType = "READ";
                    }

                    app.models.ACL.destroyAll({ and: conditions }, function (err, info) {
                        if (err) throw err;
                        var modelInstance = app.models[_model];
                        if (modelInstance && modelInstance != undefined) {
                            // modelInstance.settings.acls.push(options);
                            var aclIndex = modelInstance.settings.acls.findIndex(function (d) {
                                return (d.model == options.model &&
                                    d.principalId == options.principalId &&
                                    d.principalType == options.principalType &&
                                    d.property == options.property &&
                                    d.accessType == options.accessType &&
                                    d.property == options.property &&
                                    d.accessType == options.accessType &&
                                    d.property == options.property &&
                                    d.accessType == options.accessType);
                            });
                            modelInstance.settings.acls.splice(aclIndex, 1);
                        }
                        else {
                            next();
                        }
                    });
                }
                else {
                    next();
                }

            }
            else {
                next();
            }
        });
        // next();
    });
};
