'use strict';
module.exports = function (Vwauditlog) {

    Vwauditlog.getAuditDetails = function (schoolId, filter, cb) {

            Vwauditlog.find({ where: { schoolId: schoolId } }, function (err, data) {
                if (err) {
                    cb(err);
                }
                else {
                    cb(null, data);
                }
            });

    }
    Vwauditlog.remoteMethod(
        'getAuditDetails', {
            accepts: [{
                arg: 'schoolId',
                type: 'int'
            },
            {
                arg: 'filter',
                type: 'object',
                'http': { source: 'query' }
              }],
            http: { path: '/:schoolId/getAuditDetails', verb: 'get' },
            returns: { arg: 'result', type: 'object' }
        }
    );

    Vwauditlog.getAuditDetailsCount = function (schoolId, filter, cb) {

            Vwauditlog.find({ where: { schoolId: schoolId } }, function (err, data) {
                if (err) {
                    cb(err);
                }
                else {
                    cb(null, data.length);
                }
            });
        
    }
    Vwauditlog.remoteMethod(
        'getAuditDetailsCount', {
            accepts: [{
                arg: 'schoolId',
                type: 'int'
            },
            {
                arg: 'filter',
                type: 'object',
                'http': { source: 'query' }
              }],
            http: { path: '/:schoolId/getAuditDetailsCount', verb: 'get' },
            returns: { arg: 'result', type: 'object' }
        }
    );




};
