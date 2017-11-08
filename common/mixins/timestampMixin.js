var LoopBackContext = require('loopback-context');


module.exports = function (Model, options) {
    'use strict';
    Model.observe('before save', function event(ctx, next) { //Observe any insert/update event on Model
        var ctx1 = LoopBackContext.getCurrentContext();
        // Get the current access token
        var accessToken = ctx1 && ctx1.get('accessToken');

        if (ctx.instance) {
            if (ctx.instance.created)
                ctx.instance.created = new Date();
            else
                ctx.instance.createdOn = new Date();
            ctx.instance.createdBy = accessToken.userId;
        } else {

            if (ctx.instance.updated)
                ctx.instance.updated = new Date();
            else
                ctx.instance.updatedOn = new Date();
            ctx.instance.updatedBy = accessToken.userId;
        }
        next();
    });
};
