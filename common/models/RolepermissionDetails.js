'use strict';
var app = require('../../server/server');
var permissionsHelper = require("../shared/permissionsHelper");

module.exports = function (RolepermissionDetails) {
    /**
     * Operational hook to add necessary ACLs after permissions are assigned to roles.
     */
    RolepermissionDetails.afterRemote('create', function (context, permission, next) {

        app.models.role.findById(permission.roleId, function (err, srole) {
            if (err) return next(err);
            var modelPermissionArray = permission.permissionName.split('.');
            if (modelPermissionArray != undefined && modelPermissionArray.length == 2) {
                var _model = modelPermissionArray[0];
                var _permission = modelPermissionArray[1];
                var _principalName = srole.name;
                permissionsHelper.getRelatedAclObjects(_model, _permission, srole.name, function (aclArray) {
                    app.models.ACL.create(aclArray, function (err, info) {
                        var modelInstance = app.models[_model];
                        if (modelInstance && modelInstance != undefined) {
                            aclArray.map(function (p, i) {
                                modelInstance.settings.acls.push(p);
                            });
                        }
                        next();
                    });
                });


            } else {
                next();
            }
        });

    });

    /**
     * Operational hook to delete ACLs after permissions are deleted from roles.
     */
    RolepermissionDetails.observe('before delete', function (ctx, next) {

        RolepermissionDetails.findById(ctx.where.and[0].id, function (err, permissionModel) {
            if (permissionModel) {
                app.models.role.findById(permissionModel.roleId, function (err, srole) {
                    if (err) return next(err);

                    var permissionStr = permissionModel.permissionName;
                    var modelPermissionArray = permissionStr.split('.');
                    if (modelPermissionArray != undefined && modelPermissionArray.length == 2) {
                        var _model = modelPermissionArray[0];
                        var _permission = modelPermissionArray[1];
                        var _principalName = srole.name;
                        var options = {};
                        var conditions = [];

                        permissionsHelper.getRelatedAclObjects(_model, _permission, srole.name, function (aclArray) {
                            aclArray.map(function (perm, index) {
                                conditions.push({ model: perm.model, principalId: perm.principalId, principalType: perm.principalType, property: perm.property, accessType: perm.accessType });
                            });
                            app.models.ACL.destroyAll({ or: conditions }, function (err, info) {
                                if (err) return next(err);

                                aclArray.map(function (perm, index) {
                                    var modelInstance = app.models[perm.model];
                                    if (modelInstance && modelInstance != undefined) {
                                        // modelInstance.settings.acls.push(options);
                                        var aclIndex = modelInstance.settings.acls.findIndex(function (d) {
                                            return (d.model == perm.model &&
                                                d.principalId == perm.principalId &&
                                                d.principalType == perm.principalType &&
                                                d.property == perm.property &&
                                                d.accessType == perm.accessType);
                                        });
                                        modelInstance.settings.acls.splice(aclIndex, 1);
                                    }
                                });

                                next();

                            });
                        });


                        // conditions.push({ model: _model });
                        // conditions.push({ principalId: _principalName });
                        // conditions.push({ principalType: "ROLE" });

                        // options.model = _model;
                        // options.principalId = _principalName;
                        // options.principalType = "ROLE";

                        // if (_permission == "Create") {
                        //     if (_model.toLowerCase() == "user") {
                        //         conditions.push({ property: "createUser" });
                        //         conditions.push({ accessType: "EXECUTE" });

                        //         options.property = "createUser";
                        //         options.accessType = "EXECUTE";
                        //     }
                        //     else {
                        //         conditions.push({ property: "create" });
                        //         conditions.push({ accessType: "WRITE" });

                        //         options.property = "create";
                        //         options.accessType = "WRITE";
                        //     }
                        // }
                        // else if (_permission == "Update") {
                        //     conditions.push({ property: "updateAttributes" });
                        //     conditions.push({ accessType: "WRITE" });

                        //     options.property = "updateAttributes";
                        //     options.accessType = "WRITE";
                        // }
                        // else if (_permission == "Delete") {

                        //     if (_model.toLowerCase() == "addhocfeedetails" ||
                        //         _model.toLowerCase() == "container" ||
                        //         _model.toLowerCase() == "feeplanheaddetails" ||
                        //         _model.toLowerCase() == "role" ||
                        //         _model.toLowerCase() == "rolemenuDetails" ||
                        //         _model.toLowerCase() == "rolepermissionDetails" ||
                        //         _model.toLowerCase() == "userschooldetails") {

                        //         conditions.push({ property: "destroyById" });
                        //         conditions.push({ accessType: "WRITE" });

                        //         options.property = "destroyById";
                        //         options.accessType = "WRITE";
                        //     }
                        //     else {
                        //         conditions.push({ property: "deleteRecord" });
                        //         conditions.push({ accessType: "EXECUTE" });

                        //         options.property = "deleteRecord";
                        //         options.accessType = "EXECUTE";
                        //     }


                        // }
                        // else if (_permission == "Read") {
                        //     conditions.push({ accessType: "READ" });

                        //     options.accessType = "READ";
                        // }

                        // app.models.ACL.destroyAll({ and: conditions }, function (err, info) {
                        //     if (err) return next(err);
                        //     var modelInstance = app.models[_model];
                        //     if (modelInstance && modelInstance != undefined) {
                        //         // modelInstance.settings.acls.push(options);
                        //         var aclIndex = modelInstance.settings.acls.findIndex(function (d) {
                        //             return (d.model == options.model &&
                        //                 d.principalId == options.principalId &&
                        //                 d.principalType == options.principalType &&
                        //                 d.property == options.property &&
                        //                 d.accessType == options.accessType &&
                        //                 d.property == options.property &&
                        //                 d.accessType == options.accessType &&
                        //                 d.property == options.property &&
                        //                 d.accessType == options.accessType);
                        //         });
                        //         modelInstance.settings.acls.splice(aclIndex, 1);
                        //     }
                        //     next();

                        // });
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