'use strict';
module.exports = function(Invoice) {
  /**
   * Operational hook to set appropriate status to invoice.
   */
  Invoice.observe('before save', function(ctx, next) {
    if (!ctx.currentInstance) {
      next();
      return;
    }

    var currentInstance = ctx.currentInstance;
    if (currentInstance.status != 'Processed') {
      next();
      return;
    }

    var isUpdateRequired = false;
    if (ctx.data.dueDate) {
      if (currentInstance.dueDate != ctx.data.dueDate) {
        ctx.data['updateField'] = 'D';
      }
    }

    if (ctx.data.status) {
      if (currentInstance.status != ctx.data.status) {
        if (ctx.data.status == 'Paid' || ctx.data.status == 'Closed') {
          ctx.data['updateField'] = 'S';
        }
      }
    }
    next();
  });
};
