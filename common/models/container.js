module.exports = function (Container) {
  Container.afterRemote('upload', function (ctx, unused, next) {
    var name = ctx.result.result.files[""][0].name;
    var container = ctx.result.result.files[""][0].container;

    var path = '/api/containers/' + container + '/download/' + name;

    ctx.result.result.path = path;
    next();
  }); // works
};
