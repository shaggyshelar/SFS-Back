'use strict';

module.exports = function (Adhocfeedetails) {
  /**
  * Validate if mentioned properties exist while calling the APIs. 
  */
  Adhocfeedetails.validatesPresenceOf(
    'adhocFeeId',
    'categoryId',
    'classId'
  );

  /**
  * Remote method to update Adhocfeedetails.
  * Related Adhocfeedetails are first deleted and then inserted again.
  */
  Adhocfeedetails.updateAdhocfeedetails = function (adhocfeedetails, options, cb) {

    if (adhocfeedetails && adhocfeedetails.length > 0) {

      var conditions = [];
      adhocfeedetails.map(function (assocn, index) {
        conditions.push({ adhocFeeId: assocn.adhocFeeId });
      });

      Adhocfeedetails.destroyAll({ or: conditions }, function (err, info) {
        if (err) cb(err);
        else {
          Adhocfeedetails.create(adhocfeedetails, function (err, savedAssociations) {
            if (err) {
              cb(err);
            }
            else {
              cb(null, savedAssociations);
            }
          });
        }
      });
    }
    else {
      cb(null);
    }
  }

  Adhocfeedetails.remoteMethod('updateAdhocfeedetails', {
    accepts: [{
      arg: 'adhocfeedetails',
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
    http: { path: '/updateAdhocfeedetails', verb: 'put' },
    returns: { arg: 'adhocfeedetails', type: 'Adhocfeedetails' }
  });
};
