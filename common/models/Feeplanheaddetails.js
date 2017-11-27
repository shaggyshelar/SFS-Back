'use strict';
module.exports = function (Feeplanheaddetails) {
    Feeplanheaddetails.updateFeeplanheaddetails = function (feeplanheaddetails, options, cb) {

        if (feeplanheaddetails && feeplanheaddetails.length > 0) {
            var conditions = [];
            feeplanheaddetails.map(function (assocn, index) {
                conditions.push({ feePlanId: assocn.feePlanId, academicYear: assocn.academicYear });
            });

            Feeplanheaddetails.destroyAll({ or: conditions }, function (err, info) {
                if (err) throw err;
                Feeplanheaddetails.create(feeplanheaddetails, function (err, savedAssociations) {
                    if (err) throw err;
                    cb(null, savedAssociations);
                });
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
