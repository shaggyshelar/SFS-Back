var LoopBackContext = require('loopback-context');


module.exports = function (Model, options) {
    'use strict';
    Model.observe('before save', function event(ctx, next) { //Observe any insert/update event on Model
        var ctx1 = LoopBackContext.getCurrentContext();
        // Get the current access token
        var accessToken = ctx1 && ctx1.get('accessToken');
        if (accessToken) {
            if (ctx.isNewInstance) {
                if ('created' in ctx.instance)
                    ctx.instance.created = new Date();
                else
                    ctx.instance.createdOn = new Date();
                ctx.instance.createdBy = accessToken.userId;
            } else {
                if (ctx.instance) {
                    if ('modified' in ctx.instance)
                        ctx.instance.modified = new Date();
                    else
                        ctx.instance.updatedOn = new Date();
                    ctx.instance.updatedBy = accessToken.userId;
                }
                else if (ctx.data) {
                    if ('modified' in ctx.data)
                        ctx.data.modified = new Date();
                    else
                        ctx.data.updatedOn = new Date();
                    ctx.data.updatedBy = accessToken.userId;
                }
            }
        }
        next();
    });
};
