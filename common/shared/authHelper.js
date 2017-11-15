'use strict';
var app = require('../../server/server');
var path = require('path');

var authHelper = function () {

}
authHelper.sendVerificationEmail = function (user, plainPassword, next) {
    var options = {
        type: 'email',
        to: user.email,
        from: 'noreply@loopback.com',
        subject: 'Thanks for registering.',
        template: path.resolve(__dirname, '../../server/views/verify.ejs'),
        redirect: '/verified',
        user: user,
        text: 'Your username is: ' + user.username + ' and temporary password is: ' + plainPassword + ' Please verify your email by opening this link in a web browser: {href}'
    };

    user.verify(options, function (err, response) {
        if (err) {
            app.models.User.deleteById(user.id);
            return next(err);
        }
        next(null, {
            title: 'Signed up successfully',
            content: 'Please check your email and click on the verification link ' +
            'before logging in.',
            redirectTo: '/',
            redirectToLinkText: 'Log in',
        });
    });
}
module.exports = authHelper;