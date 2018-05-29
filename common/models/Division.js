'use strict';
module.exports = function(Division) {
   /**
    * Operational hook to return divisions which has class and school
    */ 
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
