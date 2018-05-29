'use strict';
module.exports = function (Vwauditlog) {

    /**
     * Remote method to get Audit logs according to schools.
     * @param schoolId - school id whose audit logs are required.
     * @param filter - Any other filter.
     * @param cb - Callback to be executed after this method is executed.
     */
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

    /**
     * Remote method to get Audit logs count according to schools.
     * @param schoolId - school id whose audit logs are required.
     * @param filter - Any other filter.
     * @param cb - Callback to be executed after this method is executed.
     */
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
