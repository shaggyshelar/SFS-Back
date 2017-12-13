'use strict';
var app = require('../../server/server');
var i18next = require('i18next');

module.exports = function (Feehead) {
    Feehead.observe('before save', function updateTimestamp(ctx, next) {
        if (!ctx.isNewInstance) {

            app.models.Academicyear.findOne({
                where: { schoolId: ctx.data.schoolId, isCurrent: true }
            }, function (err, _academicYear) {
                if (err)
                    return next(err);
                else {
                    app.models.Invoice.find({
                        "where": {
                            "schoolId": ctx.data.schoolId, "type": "ACD", "feeDate": { gt: _academicYear.startDate }, "feeDate": { lt: _academicYear.endDate }
                        },
                        "include": {
                            "relation": "invoiceDetails",
                            "scope": {
                                "where": {
                                    "feeHeadId": ctx.data.id
                                }
                            }
                        }
                    }, function (err, _invoice) {
                        if (err)
                            return next(err);
                        else {
                            if (_invoice && _invoice.length > 0) {
                                var processedInvoice = _invoice.filter(function (t) {
                                    return (t.__data.invoiceDetails && t.__data.invoiceDetails.length > 0);
                                })
                                if (processedInvoice && processedInvoice.length > 0) {
                                    var error = new Error();
                                    error.status = 422;
                                    error.message = i18next.t('error_cannotUpdateFeeHead');
                                    return next(error);
                                }
                            }
                            next();
                        }
                    });
                }
            });
        }
        else {
            next();
        }
    });
};
