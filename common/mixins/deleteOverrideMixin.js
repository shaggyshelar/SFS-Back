var LoopBackContext = require('loopback-context');


module.exports = function (Model, options) {
    'use strict';

    Model.deleteRecord = function (id, options, cb) {

        var defScope = Model.defaultScope;
        Model.defaultScope = function () { };

        Model.updateAll({ id: id }, { isDelete: true }, function (err, updatedRecord) {
            if (err)
                cb(err);
            else {
                Model.defaultScope = defScope;
                cb(null);
            }
        });
    }

    Model.remoteMethod('deleteRecord', {
        accepts: [{
            arg: 'id',
            type: 'Number'
        },
        {
            arg: "options",
            type: "object",
            http: "optionsFromRequest"
        }],
        http: { path: '/deleteRecord/:id', verb: 'delete', status: 204 },
        // returns: { arg: 'user', type: 'user' }
    });
}
