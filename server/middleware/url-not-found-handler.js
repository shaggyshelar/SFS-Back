'use strict';
module.exports = function() {
  return function customRaiseUrlNotFoundError(req, res, next) {
    res.sendFile('index.html', {root: __dirname + '/../../client/'});
  };
};
