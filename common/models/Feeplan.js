'use strict';
var dateHelper = require("../shared/dateHelper");

module.exports = function(Feeplan) {
    /**
     * Operational hook to update timestamps while creating and updating fee plans
     */
    Feeplan.observe('before save', function updateTimestamp(ctx, next) {
        if (ctx.instance) {
            if(ctx.instance.isVerified && ctx.options.accessToken) {
                ctx.instance.verifiedBy = ctx.options.accessToken.userId;
                ctx.instance.verifiedOn = dateHelper.getUTCManagedDateTime();
              }
              next();
        } else {
          if(ctx.data && ctx.data.isVerified && ctx.options.accessToken) {
            Feeplan.findById(ctx.data.id, function (err, sFeeplan) {
                if(err) {
                    next(err);
                } else {
                    if(!sFeeplan.isVerified) {
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
