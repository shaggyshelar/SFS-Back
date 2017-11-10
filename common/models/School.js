'use strict';
module.exports = function(School) {
    School.validatesPresenceOf(
        'instituteId',
        'schoolName',
        'schoolCode',
        'schoolHeader'
    );
};
