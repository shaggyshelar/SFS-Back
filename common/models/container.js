'use strict';
var app = require('../../server/server');

module.exports = function (Container) {
  Container.afterRemote('upload', function (ctx, unused, next) {
    var name = ctx.result.result.files.image[0].name;
    var container = ctx.result.result.files.image[0].container;

    var path = '/api/containers/' + container + '/download/' + name;

    ctx.result.result.path = path;

    app.models.School.update({
      id: container,
    }, {
        id: container,
        schoolLogo: path
      }, function (err, updateLogo) {
        if (err)
          return next(err);
        else {
          next();
        }
      });
  }); // works
};
