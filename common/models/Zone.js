'use strict';
var dateHelper = require("../shared/dateHelper");

module.exports = function(Zone) {
  /**
   * Operation hook to update timestamps and verified by fields before saving
   */
    Zone.observe('before save', function updateTimestamp(ctx, next) {
        if (ctx.instance) {
          // ctx.instance.updated = new Date();
          if(ctx.instance.isVerified && ctx.options.accessToken) {
            ctx.instance.verifiedBy = ctx.options.accessToken.userId;
            ctx.instance.verifiedOn = dateHelper.getUTCManagedDateTime();
          }
          next();
        } else {
          // ctx.data.updated = new Date();
          if(ctx.data && ctx.data.isVerified && ctx.options.accessToken) {
            Zone.findById(ctx.data.id, function (err, sZone) {
                if(err) {
                    next(err);
                } else {
                    if(!sZone.isVerified) {
                        ctx.data.verifiedBy = ctx.options.accessToken.userId;
                        ctx.data.verifiedOn = dateHelper.getUTCManagedDateTime();
                    }
                    next();
                }
            });
          } else {
            next();
          }
        }
        
      });
      
};
