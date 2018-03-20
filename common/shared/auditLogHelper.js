'use strict';

var dateHelper = require("../shared/dateHelper");

var auditLogHelper = function() {

};

auditLogHelper.setCreatedBy = function(itemList, userId, next) {
    var localeDate = dateHelper.getUTCManagedDateTime();
    if(itemList && itemList.length > 0) {
        itemList.map(function(_item, index){
            if(!_item.createdOn && !_item.createdBy) {
                _item.createdOn = localeDate;
                _item.createdBy = userId;
            }
            else {
                _item.updatedBy = userId;
                _item.updatedOn = localeDate;
            }
        });
    }
    next(null, itemList);
}

module.exports = auditLogHelper;