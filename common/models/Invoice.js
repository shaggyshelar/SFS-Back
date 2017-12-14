'use strict';
module.exports = function(Invoice) {
  Invoice.observe('before save', function(ctx, next) {
    if (!ctx.currentInstance) next();

    var currentInstance = ctx.currentInstance.toJSON();
    var isUpdateRequired = false;
    if (ctx.data.status) {
      if (currentInstance.status != ctx.data.status) {
        if (currentInstance.status == 'Processed') {
          if (ctx.data.status == 'Paid' || ctx.data.status == 'Closed') {
            currentInstance.updateField = 'S';
          }
        }
      }
    } else if (ctx.data.dueDate) {
      if (currentInstance.dueDate != ctx.data.dueDate) {
        currentInstance.updateField = 'D';
      }
    }
    next();
  });
};
