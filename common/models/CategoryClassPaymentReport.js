'use strict';
var app = require('../../server/server');
var ds = app.dataSources.mysql;
module.exports = function (CategoryClassPaymentReport) {
    CategoryClassPaymentReport.getCategoryClassPaymentReport = function (schoolId, fromDate, toDate, classIds, categoryIds, statuses, cb) {

        var sql = "CALL `spRptPaymentDetailsByClassAndCategory`(" + schoolId + ",'" + fromDate + "','" + toDate;
        if (classIds)
            sql = sql + "','" + classIds;
        else
            sql = sql + "','";

        if (categoryIds)
            sql = sql + "','" + categoryIds;
        else
            sql = sql + "','";
        if (statuses)
            sql = sql + "','" + statuses;
        else
            sql = sql + "','";

            sql = sql + "');";

        ds.connector.query(sql, function (err, data) {
            if (err) {
                console.log("Error:", err);
            }
            cb(null, data);
            console.log("data:", data);
        });
    }

    CategoryClassPaymentReport.remoteMethod(
        'getCategoryClassPaymentReport', {
            accepts: [{
                arg: 'schoolId',
                type: 'int'
            },
            {
                arg: 'fromDate',
                type: 'string'
            },
            {
                arg: 'toDate',
                type: 'string'
            },
            {
                arg: 'classIds',
                type: 'string'
            },
            {
                arg: 'categoryIds',
                type: 'string'
            },
            {
                arg: 'statuses',
                type: 'string'
            }],
            http: { path: '/getCategoryClassPaymentReport', verb: 'get' },
            returns: { arg: 'result', type: 'object' }
        }
    );
};
