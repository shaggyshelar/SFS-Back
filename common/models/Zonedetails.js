'use strict';
var dateHelper = require("../shared/dateHelper");

module.exports = function (Zonedetails) {
    Zonedetails.updateZonedetails = function (_zonedetails, options, cb) {
        if (_zonedetails && _zonedetails.length > 0) {
            var conditions = [];
            _zonedetails.map(function (z, i) {
                conditions.push({ zoneId: z.zoneId });
            });

             Zonedetails.destroyAll({ or: conditions }, function (err, info) {
                if (err) {
                    cb(err);
                }
                else {
                  var accessToken = options.accessToken; 
                    var localeDate = dateHelper.getUTCManagedDateTime();
                    _zonedetails.map(function(_zoneItem, index){
                    	if(!_zoneItem.createdOn && !_zoneItem.createdBy) {
                    		_zoneItem.createdOn = localeDate;
                    		_zoneItem.createdBy = accessToken.userId;
                    	}
                    	else {
                            // _zoneItem.createdOn = _zoneItem.createdOn;
                            // _zoneItem.createdBy = _zoneItem.createdBy;
                            _zoneItem.updatedBy = accessToken.userId;
                    	    _zoneItem.updatedOn = localeDate;
                        }
                        
                    });

                    Zonedetails.create(_zonedetails, function (err, savedZonedetails) {
                        if (err)
                            cb(err);
                        else
                            cb(null, savedZonedetails);
                    });
                }
            });
        }
        else {
            cb(null);
        }
    }

    Zonedetails.remoteMethod('updateZonedetails', {
        accepts: [{
            arg: '_zonedetails',
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
        http: { path: '/updateZonedetails', verb: 'put' },
        returns: { arg: '_zonedetails', type: 'Zonedetails' }
    });
};
