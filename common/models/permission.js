'use strict';
var app = require('../../server/server');

module.exports = function (Permission) {
    Permission.afterRemote('create', function (context, permission, next) {
        console.log(permission);
        var modelPermissionArray = permission.permission.split('.');
        if (modelPermissionArray != undefined && modelPermissionArray.length > 0) {
            var _model = modelPermissionArray[0];
            var _permission = modelPermissionArray[1];
            var _principalId = permission.principalId;
            var options = {};
            options.model = _model;
            options.principalId = _principalId;
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
            app.models.ACL.create(options, function () {
                var modelInstance = app.models[options.model];
                if (modelInstance && modelInstance != undefined) {
                    modelInstance.settings.acls.push(options);
                }
                next();
            });
        }
    });



};
