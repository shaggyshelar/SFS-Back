'use strict';
var app = require('../../server/server');

module.exports = function (RolepermissionDetails) {
    RolepermissionDetails.afterRemote('create', function (context, permission, next) {

        app.models.role.findById(permission.roleId, function (err, srole) {
            if (err) throw err;
            var modelPermissionArray = permission.permissionName.split('.');
            if (modelPermissionArray != undefined && modelPermissionArray.length == 2) {
                var _model = modelPermissionArray[0];
                var _permission = modelPermissionArray[1];
                var _principalName = srole.name;
                var options = {};
                options.model = _model;
                options.permission = "ALLOW";
                options.principalId = _principalName;
                options.principalType = "ROLE";
                var roptions = [];
                if (_permission == "Create") {
                    if (_model.toLowerCase() == "user") {
                        options.property = "createUser";
                        options.accessType = "EXECUTE";
                    }
                    else {
                        options.property = "create";
                        options.accessType = "WRITE";
                    }
                }
                else if (_permission == "Update") {
                    if (_model.toLowerCase() == "user") {
                        options.property = "updateUser";
                        options.accessType = "EXECUTE";
                    }
                    else {
                        options.property = "updateAttributes";
                        options.accessType = "WRITE";
                    }
                }
                else if (_permission == "Delete") {
                    options.property = "destroyById";
                    options.accessType = "WRITE";
                }
                else if (_permission == "Read") {
                    options.accessType = "READ";
                    options.property = "find";
                    var option1 = JSON.parse(JSON.stringify(options))
                    roptions.push(option1);
                    var option2 = JSON.parse(JSON.stringify(options))
                    option2.property = "findById";
                    roptions.push(option2);
                    var option3 = JSON.parse(JSON.stringify(options))
                    option3.property = "count";
                    roptions.push(option3);
                    options = roptions;
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



    });

    RolepermissionDetails.observe('before delete', function (ctx, next) {

        RolepermissionDetails.findById(ctx.where.and[0].id, function (err, permissionModel) {
            if (permissionModel) {
                app.models.role.findById(permissionModel.roleId, function (err, srole) {
                    if (err) throw err;

                    var permissionStr = permissionModel.permissionName;
                    var modelPermissionArray = permissionStr.split('.');
                    if (modelPermissionArray != undefined && modelPermissionArray.length == 2) {
                        var _model = modelPermissionArray[0];
                        var _permission = modelPermissionArray[1];
                        var _principalName = srole.name;
                        var options = {};
                        var conditions = [];

                        conditions.push({ model: _model });
                        conditions.push({ principalId: _principalName });
                        conditions.push({ principalType: "ROLE" });

                        options.model = _model;
                        options.principalId = _principalName;
                        options.principalType = "ROLE";

                        if (_permission == "Create") {
                            if (_model.toLowerCase() == "user") {
                                conditions.push({ property: "createUser" });
                                conditions.push({ accessType: "EXECUTE" });

                                options.property = "createUser";
                                options.accessType = "EXECUTE";
                            }
                            else {
                                conditions.push({ property: "create" });
                                conditions.push({ accessType: "WRITE" });

                                options.property = "create";
                                options.accessType = "WRITE";
                            }
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
                            next();

                        });
                    }
                    else {
                        next();
                    }
                });



            }
            else {
                next();
            }
        });
        // next();
    });
};