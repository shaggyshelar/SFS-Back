'use strict';
var app = require('../../server/server');
var ds = app.dataSources.mysql;
module.exports = function (FeeheadPaymentReport) {
    FeeheadPaymentReport.getFeeheadPaymentReport = function (schoolId, fromDate, toDate, feeHeadNames, statuses, cb) {

        var sql = "CALL `spRptPaymentDetailsByFeeHeads`(" + schoolId + ",'" + fromDate + "','" + toDate;
        if (feeHeadNames)
            sql = sql + "','" + classIds;
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


    FeeheadPaymentReport.getFeeheadListReport = function (schoolId, cb) {
        var sql = "CALL `spSelectFeeheads`(" + schoolId + ");";

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



    FeeheadPaymentReport.remoteMethod(
        'getFeeheadPaymentReport', {
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
                arg: 'feeHeadNames',
                type: 'string'
            },
            {
                arg: 'statuses',
                type: 'string'
            }],
            http: { path: '/getFeeheadPaymentReport', verb: 'get' },
            returns: { arg: 'result', type: 'object' }
        }
    );
    FeeheadPaymentReport.remoteMethod(
        'getFeeheadListReport', {
            accepts: [{
                arg: 'schoolId',
                type: 'int'
            }],
            http: { path: '/getFeeheadListReport', verb: 'get' },
            returns: { arg: 'result', type: 'object' }
        }
    );

};