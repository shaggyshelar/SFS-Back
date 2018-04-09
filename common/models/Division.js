'use strict';
module.exports = function(Division) {
   Division.afterRemote('find', function (context, _division, next) {
        if(_division) {
            var _division = _division.filter(function(item) {
                if(item.__data && item.__data.DivisionClass && item.__data.DivisionSchool) {
                    return item;
                }
            });
        } 
        context.result = _division;
        next();
      });
};
