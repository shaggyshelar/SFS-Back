var configFilePath = process.env.NODE_ENV == undefined ?
    '' : '.' + process.env.NODE_ENV;
var config = require('../../server/config' + configFilePath + '.json');

var dateHelper = function () {
};

/**
 * Method to adjust IST and UTC time
 */
dateHelper.getUTCManagedDateTime = function () {
    var localeDate = new Date();
    localeDate.setHours(localeDate.getHours() + config.hourDifferenceUTC);
    localeDate.setMinutes(localeDate.getMinutes() + config.minutesDifferenceUTC);
    return localeDate;
}

module.exports = dateHelper;
