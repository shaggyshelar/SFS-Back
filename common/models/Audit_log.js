'use strict';
var app = require('../../server/server');

module.exports = function (AuditLog) {
  AuditLog.observe('before save', function (ctx, next) {
    var modelName = ctx.instance.table_name;

    // var updatedValue = app.models[modelName].findById({
    //   id: ctx.instance.row_id
    // });

    if (ctx.instance.new && ctx.instance.new.schoolId) {
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
    }
  });
};
