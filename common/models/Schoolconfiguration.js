'use strict';
var i18next = require('i18next');

module.exports = function (Schoolconfiguration) {
    /**
     * Remote method to update/create the school config. 
     * Related record (if exists) is deleted and then created again.
     * @param {*} _schoolconfiguration - new configuration which will be added/updated
     * @param options - optionsFromRequest object to get authentication headers, etc.
     * @param cb - Callback to be executed after this method is executed.
     */
    Schoolconfiguration.updateSchoolConfig = function (_schoolconfiguration, options, cb) {
        Schoolconfiguration.findOne({ where: { schoolId: _schoolconfiguration.schoolId, keyName: _schoolconfiguration.keyName } }, function (err, _config) {
            if (err) {
                cb(err);
            }
            else {
                if (_config != undefined || _config != null) {
                    Schoolconfiguration.destroyById(_config.id, function (err, info) {
                        if (err) cb(err);
                        else {
                            Schoolconfiguration.create(_schoolconfiguration, function (err, _savedSchoolconfiguration) {
                                if (err) cb(err);
                                else {
                                    cb(null, _savedSchoolconfiguration);
                                }
                            });
                        }
                    });
                }
                else {
                    Schoolconfiguration.create(_schoolconfiguration, function (err, _savedSchoolconfiguration) {
                        if (err) cb(err);
                        else {
                            cb(null, _savedSchoolconfiguration);
                        }
                    });
                    // var error = new Error();
                    // error.status = 404;
                    // error.message = i18next.t('error_noRecordFound');
                    // cb(error);
                }
            }
        });
    }

    Schoolconfiguration.remoteMethod('updateSchoolConfig', {
        accepts: [{
            arg: '_schoolconfiguration',
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
        http: { path: '/updateSchoolConfig', verb: 'put' },
        returns: { arg: 'schoolConfig', type: 'Schoolconfiguration' }
    });

};