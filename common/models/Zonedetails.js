'use strict';
module.exports = function (Zonedetails) {
    Zonedetails.updateZonedetails = function (_zonedetails, options, cb) {
        var conditions = [];
        _zonedetails.map(function (z, i) {
            conditions.push({ zoneId: z.zoneId });
        });

        Zonedetails.destroyAll({ or: conditions }, function (err, info) {
            if (err) {
                cb(err);
            }
            else {
                Zonedetails.create(_zonedetails, function (err, savedZonedetails) {
                    if (err)
                        cb(err);
                    else
                        cb(null, savedZonedetails);
                });
            }
        });
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
