'use strict';
var _ = require("lodash");
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
                    var groupedDuplicateRecords = _.groupBy(duplicateAssoc, function (n) {
                        return n.feeplanId;
                    });
                    error.message += "Combination already exists for ";
                    var assocIndexes = Object.keys(groupedDuplicateRecords);
                    assocIndexes.map(function (item, index) {
                        groupedDuplicateRecords[item].map(function (i, arrIndex) {
                            error.message += i.__data.FeeplanassociationClass.className
                                + " - " + i.__data.FeeplanassociationCategory.categoryName;
                            if (groupedDuplicateRecords[item].length != (arrIndex + 1)) {
                                error.message += ", "
                            } else if (groupedDuplicateRecords[item].length == (arrIndex + 1)) {
                                error.message += " for " + i.__data.FeeplanassociationFeeplan.feePlanName + ".";
                            }
                        });

                    });
                    cb(error)
                }
                else {
                    var conditions = [];
                    feeplanassociations.map(function (assocn, index) {
                        conditions.push({ feeplanId: assocn.feeplanId, academicYear: assocn.academicYear });
                    });

                    Feeplanassociation.destroyAll({ or: conditions }, function (err, info) {
                        if (err) {
                            cb(err);
                        }
                        else {
                            Feeplanassociation.create(feeplanassociations, function (err, savedAssociations) {
                                if (err)
                                    cb(err);
                                else
                                    cb(null, savedAssociations);
                            });
                        }
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