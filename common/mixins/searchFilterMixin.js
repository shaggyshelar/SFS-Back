'use strict';

module.exports = function (Model, options) {
    Model.observe('access', function (ctx, next) {
        if (ctx.query && ctx.query.where) {
            var stringQuery = JSON.stringify(ctx.query.where);
            stringQuery = stringQuery.replace(/%20/g, " ");
            ctx.query.where = JSON.parse(stringQuery);
        }
        next();
    });
};
