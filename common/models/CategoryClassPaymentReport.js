'use strict';

var app = require('../../server/server');
var ds = app.dataSources.mysql;
module.exports = function (CategoryClassPaymentReport) {
    /**
     * Remote method to fetch data from stored procedure for Category and Class Payment report.
     * @param schoolId - schoolId to filter CategoryClassPaymentReport
     * @param fromDate - fetch CategoryClassPaymentReport from this date
     * @param toDate - fetch CategoryClassPaymentReport till this date
     * @param classIds - classIds to filter CategoryClassPaymentReport
     * @param categoryIds - categoryIds to filter CategoryClassPaymentReport
     * @param statuses - status to filter CategoryClassPaymentReport.
     * @param cb - callback to be executed after this method is executed.
     */
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
            if (data.length > 0) {
                data = data[0];
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
