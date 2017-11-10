'use strict';
module.exports = function() {
  return function customRaiseUrlNotFoundError(req, res, next) {
    // res.sendFile('index.html', function(err) {
    //   if (err) {
    //     console.error(err);
    //     res.status(err.status).end();
    //   }
    // });
    res.sendFile('index.html', { root: __dirname + '/../../Client/' });
  };
};
