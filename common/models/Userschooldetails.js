'use strict';
module.exports = function(Userschooldetails) {
    Userschooldetails.afterRemote('find', function (context, _userschooldetails, next) {
        if(_userschooldetails) {
            var _userschooldetails = _userschooldetails.filter(function(item) {
                if(item.__data && item.__data.UserschoolSchool) {
                    return item;
                }
            });
        } 
        context.result = _userschooldetails;
        next();
      });
};
