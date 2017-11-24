'use strict';
module.exports = function (Feeplanassociation) {

    Feeplanassociation.updateFeeplanAssociation = function (feeplanassociations, options, cb) {

        if (feeplanassociations && feeplanassociations.length > 0) {

            var searchConditions = [];
            feeplanassociations.map(function (assocn, index) {
                searchConditions.push({ categoryId: assocn.categoryId, classId: assocn.classId, academicYear: assocn.academicYear });
            });
            Feeplanassociation.find({ where: { or: searchConditions }, include: { relation: "FeeplanassociationFeeplan" } }, function (err, duplicateAssoc) {
                if (duplicateAssoc && duplicateAssoc.length > 0) {
                    var errorFeePlans = [];
                    var error = new Error();
                    error.status = 422;
                    error.message = "A combination for class and category already exist for ";
                    duplicateAssoc.map(function (errorRecords, index) {
                        if (errorFeePlans.indexOf(errorRecords.__data.FeeplanassociationFeeplan.feePlanName) == -1) {
                            errorFeePlans.push(errorRecords.__data.FeeplanassociationFeeplan.feePlanName);
                        }
                    });
                    errorFeePlans.map(function (errorPlan, index) {
                        error.message += errorPlan;
                        if (errorFeePlans.length != (index + 1))
                            error.message += ", "
                    });
                    cb(error)
                }
                else {
                    var conditions = [];
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