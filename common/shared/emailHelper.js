var fs = require('fs')
var path = require('path');
var i18next = require('i18next');
var app = require('../../server/server');

var emailHelper = function () {};

/**
 * Method to send emails
 * @param {*} templateName - Template name which needs to be used
 * @param {*} toEmailId - email id to whom email needs to be sent
 * @param {*} subject - subject of email
 * @param {*} valueObject - values to be replaced in email template
 * @param {*} next - callback method
 */
emailHelper.sendEmails = function (templateName, toEmailId, subject, valueObject, next) {
  fs.readFile(process.cwd() + '/templates/email/' + templateName + '.html', 'utf8', function (err, data) {
    if (err) {
      next(err);
    }
    if (valueObject) {

      // added as i18next.t was removing first html tag and emails without styles were sent.  
      var keyNames = Object.keys(valueObject);
      for (var i in keyNames) {
           data=data.replace('{{'+keyNames[i]+'}}',valueObject[keyNames[i]]);
      }
      // data = i18next.t(data, valueObject)

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

/**
 * Method to get email text after assigning values in the template
 * @param {*} templateName - template to be used to send emails
 * @param {*} valueObject - values which needs to be replaced in the template
 * @param {*} next - callback method
 */
emailHelper.getEmailText = function (templateName, valueObject, next) {
  fs.readFile(process.cwd() + '/templates/email/' + templateName + '.html', 'utf8', function (err, data) {
    if (err) {
      next(err);
    }
    if (valueObject) {
      // data = i18next.t(data, valueObject)
      // added as i18next.t was removing first html tag and emails without styles were sent.  
      var keyNames = Object.keys(valueObject);
      for (var i in keyNames) {
           data=data.replace('{{'+keyNames[i]+'}}',valueObject[keyNames[i]]);
      }

      next(null, data);
    }
  });
}

module.exports = emailHelper;
