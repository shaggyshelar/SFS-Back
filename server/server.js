'use strict';

var loopback = require('loopback');
var boot = require('loopback-boot');
var path = require('path');
var bodyParser = require('body-parser');
var i18next = require('i18next');
var Backend = require('i18next-node-fs-backend');
process.env.NODE_ENV = 'staging';

var configFilePath = process.env.NODE_ENV == undefined ?
                          '' : '.' + process.env.NODE_ENV;
var config = require('./config' + configFilePath + '.json');

var app = module.exports = loopback();

// configure view handler
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
app.use(bodyParser.json());
process.env.NODE_ENV = 'staging';
app.use(bodyParser.urlencoded({ extended: true }));

app.use(loopback.token());
app.use(function(req, res, next) {
  var token = req.accessToken;
  if (!token) {
    return next();
  }
  var now = new Date();
  if (now.getTime() - token.created.getTime() < 1000) {
    return next();
  }
  // Sliding Window Token Implementation
  req.accessToken.created = now;
  req.accessToken.ttl = config.sessionTimoutIntervalInSeconds;
  req.accessToken.save(next);
});

app.start = function() {
  // start the web server
  return app.listen(function() {
    app.emit('started');
    var baseUrl = app.get('url').replace(/\/$/, '');
    console.log('Web server listening at: %s', baseUrl);
    if (app.get('loopback-component-explorer')) {
      var explorerPath = app.get('loopback-component-explorer').mountPath;
      console.log('Browse your REST API at %s%s', baseUrl, explorerPath);
    }
  });
};

// Bootstrap the application, configure models, datasources and middleware.
// Sub-apps like REST API are mounted via boot scripts.
boot(app, __dirname, function(err) {
  if (err) throw err;

  // start the server if `$ node server.js`
  if (require.main === module) {
    // app.start();
    app.io = require('socket.io')(app.start());
    require('socketio-auth')(app.io, {
      authenticate: function(socket, value, callback) {
        var AccessToken = app.models.AccessToken;
          // get credentials sent by the client
        var token = AccessToken.find({
          where: {
            and: [{userId: value.userId}, {id: value.id}],
          },
        }, function(err, tokenDetail) {
          if (err) throw err;
          if (tokenDetail.length) {
            callback(null, true);
          } else {
            callback(null, false);
          }
        }); // find function..
      }, // authenticate function..
    });

    app.io.on('connection', function(socket) {
      console.log('a user connected');
      socket.on('disconnect', function() {
        console.log('user disconnected');
      });
    });
  }
});

i18next
.use(Backend)
.init({
  lng: 'en',
  ns: ['common'],
  fallbackLng: 'en',
  debug: false,
  defaultNS: 'common',
  backend: {
    // path where resources get loaded from
    loadPath: path.join(__dirname, '/locales/{{lng}}/{{ns}}.json'),
    // jsonIndent to use when storing json files
    jsonIndent: 2,
  },
}, function(err, t) {
});
