var fs = require('fs')
var path = require('path');
var i18next = require('i18next');
var app = require('../../server/server');

var emailHelper = function () {};

emailHelper.sendEmails = function (templateName, toEmailId, subject, valueObject, next) {
  fs.readFile(process.cwd() + '/templates/email/' + templateName + '.html', 'utf8', function (err, data) {
    if (err) {
      next(err);
    }
    if (valueObject) {
      data = i18next.t(data, valueObject)

      app.models.User.app.models.Email.send({
        to: toEmailId,
        from: toEmailId,
        subject: subject,
        html: data,
      }, function (err) {
        if (err) return console.log('> error sending user locked email');
        console.log('> sending user locked email to:', toEmailId);
      });

      next(null, data);
    }
  });
}

emailHelper.getEmailText = function (templateName, valueObject, next) {
  fs.readFile(process.cwd() + '/templates/email/' + templateName + '.html', 'utf8', function (err, data) {
    if (err) {
      next(err);
    }
    if (valueObject) {
      data = i18next.t(data, valueObject)
      next(null, data);
    }
  });
}

module.exports = emailHelper;
