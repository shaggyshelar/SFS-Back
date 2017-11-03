'use strict';
var app = require('../../server/server');

module.exports = function (Role) {

    Role.afterRemote('findById', function (context, role, next) {
        app.models.Permission.find({ where: { principalId: role.id } }, function (err, permissions) {
            if (permissions && permissions.length > 0) {
                role.permissions = permissions;

                var query = [];
                permissions.map(function (p, i) {
                    var permArr = p.permission.split('.');
                    if (permArr && permArr.length == 2) {
                        query.push({ ModelName: permArr[0] });
                    }
                });
                app.models.FeatureList.find({ and: query }, function (err, features) {
                    permissions.map(function (p, i) {
                        var permArr = p.permission.split('.');
                        if (permArr && permArr.length == 2) {
                            var fo = features.find(function (f) {
                                return permArr[0] == f.ModelName;
                            });
                            if (fo) {
                                p.featureName = fo.FeatureName;
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
