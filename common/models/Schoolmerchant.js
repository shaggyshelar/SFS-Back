'use strict';
var i18next = require('i18next');

module.exports = function (Schoolmerchant) {

    Schoolmerchant.observe('before save', function updateTimestamp(ctx, next) {
        if (ctx.instance) {
            if (ctx.instance.isDefault && ctx.instance.schoolId != undefined) {
                Schoolmerchant.updateAll({ schoolId: ctx.instance.schoolId, isDefault: true }, { isDefault: false }, function (err, updatedMerchants) {
                    if (err) return next(err);
                    next();
                });
            }
            else {
                next();
            }
        }
        else if (ctx.data) {
            if (ctx.data.isDefault && ctx.data.schoolId != undefined) {
                Schoolmerchant.updateAll({ schoolId: ctx.data.schoolId, isDefault: true }, { isDefault: false }, function (err, updatedMerchants) {
                    if (err) return next(err);
                    next();
                });
            }
            else if (ctx.data.isDefault && ctx.data.schoolId == undefined) {
                var error = new Error();
                error.status = 422;
                error.message = i18next.t('error_schoolIdIsRequired');
                return next(error);
            }
            else {
                next();
            }
        }
        else {
            next();
        }
    });

};