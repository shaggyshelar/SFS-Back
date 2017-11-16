'use strict';
var i18next = require('i18next');

module.exports = function (Model, options) {
    Model.afterRemoteError('**', function (ctx, next) {
        if (ctx.error.errno == 1062) {
          var error = new Error();
          error.status = 422;
          error.message = i18next.t('er_dup_entry');
          next(error);
        }
        else
          next();
      });
    
};
