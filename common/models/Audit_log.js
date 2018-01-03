'use strict';
var app = require('../../server/server');
var LoopBackContext = require('loopback-context');

module.exports = function (AuditLog) {
  AuditLog.observe('before save', function (ctx, next) {
    
    // Get the current access token
    var ctx1 = LoopBackContext.getCurrentContext();
    var accessToken = ctx1 && ctx1.get('accessToken');

    // Checkes if userId is not null, sets userId in user
    if(accessToken) {
      ctx.instance.user = accessToken.userId;
    }

    // Get the model name that is created/updated/deleted
    var modelName = ctx.instance.table_name;

    if (ctx.instance.new && ctx.instance.new.schoolId) {
      // sets schoolId
      ctx.instance.schoolId = ctx.instance.new.schoolId;

      app.models[modelName].find({
        "where": {
          "id": ctx.instance.row_id
        },
      }, function (err, result) {
        if (err)
          return next(err);
        else {
            ctx.instance.new = result[0].__data;
            next();
        }
      });
    } else if (ctx.instance.action == 'delete' && ctx.instance.old && ctx.instance.old.schoolId) {
      
      // sets schoolId
      ctx.instance.schoolId = ctx.instance.old.schoolId;

      app.models[modelName].find({
        "where": {
          "id": ctx.instance.row_id
        },
      }, function (err, result) {
        if (err)
          return next(err);
        else {
          ctx.instance.old = result[0].__data;
          next();
        }
      });
    } else {
      next();
    }
  });
};
