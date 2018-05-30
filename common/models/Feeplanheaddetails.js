'use strict';
var auditLogHelper = require("../shared/auditLogHelper");

module.exports = function (Feeplanheaddetails) {
    /**
     * Remote method to update fee plan head details
     * @param feeplanheaddetails - Array of feeplanheaddetails which needs to be updated
     * @param options - optionsFromRequest object to get authentication headers, etc.
     * @param cb - Callback to be executed after this method is executed.
     */
    Feeplanheaddetails.updateFeeplanheaddetails = function (feeplanheaddetails, options, cb) {

        if (feeplanheaddetails && feeplanheaddetails.length > 0) {
            var conditions = [];
            feeplanheaddetails.map(function (assocn, index) {
                conditions.push({ feePlanId: assocn.feePlanId, academicYear: assocn.academicYear });
            });

            Feeplanheaddetails.destroyAll({ or: conditions }, function (err, info) {
                if (err) {
                    cb(err);
                } else {
                    var accessToken = options.accessToken; 
                    auditLogHelper.setCreatedBy(feeplanheaddetails, accessToken.userId, function(err, feeplanheaddetailsUpdated) {
                        if(err) {
                            cb(err);
                        }
                        else {
                            Feeplanheaddetails.create(feeplanheaddetailsUpdated, function (err, savedAssociations) {
                                if (err)
                                    cb(err);
                                else
                                    cb(null, savedAssociations);
                            });
                        }
                    });

                    /*Feeplanheaddetails.create(feeplanheaddetails, function (err, savedAssociations) {
                        if (err)
                            cb(err);
                        else
                            cb(null, savedAssociations);
                    });*/
                }
            });
        }
        else {
            cb(null);
        }
    }

    Feeplanheaddetails.remoteMethod('updateFeeplanheaddetails', {
        accepts: [{
            arg: 'feeplanheaddetails',
            type: 'any',
            http: {
                source: 'body',
            },
        },
        {
            arg: "options",
            type: "object",
            http: "optionsFromRequest"
        }],
        http: { path: '/updateFeeplanheaddetails', verb: 'put' },
        returns: { arg: 'feeplanheaddetails', type: 'Feeplanheaddetails' }
    });
};
