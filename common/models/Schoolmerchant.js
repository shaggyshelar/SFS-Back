'use strict';
module.exports = function (Schoolmerchant) {

    Schoolmerchant.observe('before save', function updateTimestamp(ctx, next) {
        if (ctx.instance) {
            if (ctx.instance.isDefault && ctx.instance.schoolId != undefined) {
                Schoolmerchant.updateAll({ schoolId: ctx.instance.schoolId, isDefault: true }, { isDefault: false }, function (err, updatedMerchants) {
                    if (err) throw err;
                    next();
                });
            }
            else {
                next();
            }
        }
        else if (ctx.data) {
            if (ctx.data.isDefault && ctx.data.schoolId !== undefined) {
                Schoolmerchant.updateAll({ schoolId: ctx.data.schoolId, isDefault: true }, { isDefault: false }, function (err, updatedMerchants) {
                    if (err) throw err;
                    next();
                });
            }
            else {
                next();
            }
        }
        next();
    });

};