'use strict';
var i18next = require('i18next');

module.exports = function (Sfsconfiguration) {
    Sfsconfiguration.updateSFSConfig = function (_sfsConfiguration, options, cb) {
        Sfsconfiguration.findOne({ where: { keyName: _sfsConfiguration.keyName } }, function (err, _config) {
            if (err) {
                cb(err);
            }
            else {
                if (_config != undefined || _config != null) {
                    Sfsconfiguration.destroyById(_config.id, function (err, info) {
                        if (err) cb(err);
                        else {
                            Sfsconfiguration.create(_sfsConfiguration, function (err, _savedSFSconfiguration) {
                                if (err) cb(err);
                                else {
                                    cb(null, _savedSFSconfiguration);
                                }
                            });
                        }
                    });
                }
                else {
                    var error = new Error();
                    error.status = 404;
                    error.message = i18next.t('error_noRecordFound');
                    cb(error);
                }
            }
        });
    }

    Sfsconfiguration.remoteMethod('updateSFSConfig', {
        accepts: [{
            arg: '_sfsConfiguration',
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
        http: { path: '/updateSFSConfig', verb: 'put' },
        returns: { arg: 'schoolConfig', type: 'Sfsconfiguration' }
    });

};