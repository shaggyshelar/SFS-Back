'use strict';
module.exports = function (Feeplanassociation) {

    Feeplanassociation.updateFeeplanAssociation = function (feeplanassociations, options, cb) {
        var conditions = [];

        if (feeplanassociations && feeplanassociations.length > 0) {

            feeplanassociations.map(function (assocn, index) {
                conditions.push({ feeplanId: assocn.feeplanId, academicYear: assocn.academicYear });
            });

            Feeplanassociation.destroyAll({ or: conditions }, function (err, info) {
                if (err) throw err;
                Feeplanassociation.create(feeplanassociations, function (err, savedAssociations) {
                    if (err) throw err;
                    cb(null, savedAssociations);
                });
            });
        }
        else {
            cb(null);
        }
    }

    Feeplanassociation.remoteMethod('updateFeeplanAssociation', {
        accepts: [{
            arg: 'feeplanassociations',
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
        http: { path: '/updateFeeplanAssociation', verb: 'put' },
        returns: { arg: 'feeplanassociations', type: 'Feeplanassociation' }
    });
};