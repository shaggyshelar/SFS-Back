var LoopBackContext = require('loopback-context');


module.exports = function (Model, options) {
    'use strict';
    // Model.deleteById = function (id, cb) {
    //     Model.update({ id: id }, { isDelete: true }, cb);
    // }

    Model.deleteRecord = function (id, options, cb) {

        Model.updateAll({ id: id }, { isDelete: true }, function (err, updatedRecord) {
            if (err)
                throw err;
            else {
                Model.find({ where: { id: id } }, function (err, updatedRecord) {
                    if (err)
                        throw err;
                    else {
                        console.log(updatedRecord);

                    }
                });
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
