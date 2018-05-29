'use strict';
var app = require('../../server/server');
var path = require('path');
var i18next = require('i18next');
var productionConfig = require('../../server/config.production.json');

var authHelper = function () {

}
authHelper.sendVerificationEmail = function (user, plainPassword, isUpdate, next) {
    var options = {
        type: 'email',
        to: user.email,
        from: 'noreply@loopback.com',
        subject: i18next.t('email_userRegistrationSubject'),
        template: path.resolve(__dirname, '../../templates/email/verify.html'),
        redirect: productionConfig.baseUrlAppend + 'verified', //'/SFS/verified',
        user: user,
        text: '{href}',
        validationUrl: '{href}',
        username: user.username,
        password: plainPassword,
        isUpdate: isUpdate,
        host: productionConfig.productionURL,
    };
    if (isUpdate) {
        options.subject = i18next.t('email_verify_subject');
    }
    //text: 'Your username is: ' + user.username + ' and temporary password is: ' + plainPassword + ' Please verify your email by opening this link in a web browser: {href}',

    user.verify(options, function (err, response) {
        if (err) {
            app.models.User.deleteById(user.id);
            return next(err);
        }
        next(null, {
            title: 'Signed up successfully',
            content: 'Please check your email and click on the verification link ' +
            'before logging in.',
            redirectTo: productionConfig.baseUrlAppend, //'/SFS/',
            redirectToLinkText: 'Log in',
        });
    });
}
module.exports = authHelper;
