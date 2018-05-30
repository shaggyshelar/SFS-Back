'use strict';
/**
 * Handle URL not found cases.
 */
module.exports = function() {
  return function customRaiseUrlNotFoundError(req, res, next) {
    res.sendFile('index.html', {root: __dirname + '/../../client/'});
  };
};
