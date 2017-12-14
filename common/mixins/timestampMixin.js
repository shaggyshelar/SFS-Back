var LoopBackContext = require('loopback-context');
var dateHelper = require("../shared/dateHelper");


module.exports = function (Model, options) {
    'use strict';
    Model.observe('before save', function event(ctx, next) { //Observe any insert/update event on Model
        var ctx1 = LoopBackContext.getCurrentContext();
        // Get the current access token
        var localeDate = dateHelper.getUTCManagedDateTime();
        var accessToken = ctx1 && ctx1.get('accessToken');
        if (accessToken) {
            if (ctx.isNewInstance) {
                if ('created' in ctx.instance)
                    ctx.instance.created = localeDate;
                else
                    ctx.instance.createdOn = localeDate;
                ctx.instance.createdBy = accessToken.userId;
            } else {
                if (ctx.instance) {
                    if ('modified' in ctx.instance)
                        ctx.instance.modified = localeDate;
                    else
                        ctx.instance.updatedOn = localeDate;
                    ctx.instance.updatedBy = accessToken.userId;
                }
                else if (ctx.data) {
                    if ('modified' in ctx.data)
                        ctx.data.modified = localeDate;
                    else
                        ctx.data.updatedOn = localeDate;
                    ctx.data.updatedBy = accessToken.userId;
                }
            }
        }
        next();
    });
};
