'use strict';
var app = require('../../server/server');

var permissionsHelper = function () {

}
permissionsHelper.setPermissions = function (model, roles, callback) {
    var conditions = roles.map(function (r) {
        return { roleId: r.id };
    });

    app.models.RolepermissionDetails.find({ where: { or: conditions } }, function (err, p) {
        if (p != undefined && p.length > 0)
            model.permissions = p.map(function (data, index) { return data.permissionName; });
        callback(model);
    });
}

permissionsHelper.setPermissionByRoleId = function (model, roleId, callback) {
    // var conditions = roles.map(function (r) {
    //     return { roleName: r.name };
    //   });

    app.models.RolepermissionDetails.find({ where: { roleId: roleId } }, function (err, p) {
        if (p != undefined && p.length > 0)
            model.permissions = p.map(function (data, index) { return data.permissionName; });
        callback(model);
    });
}

permissionsHelper.getRelatedAclObjects = function (selectedModel, selectedPermission, role, callback) {
    var propertyAccess = [];
    if (selectedPermission == "Create") {
        if (selectedModel.toLowerCase() == "student") {
            var propertyArr = [{ property: "__create__Students", model: "School" }];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "academicyear") {
            var propertyArr = [
                { property: "__create__SchoolYear", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "user") {
            var propertyArr = [
                { property: "__create__SchoolUsers", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
            propertyAccess.push({ model: selectedModel, property: "createUser", accessType: "EXECUTE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
        }
        else if (selectedModel.toLowerCase() == "institute") {
            var propertyArr = [
                { property: "__create__SchoolInstitute", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "division") {
            var propertyArr = [
                { property: "__create__SchoolDivision", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "class") {
            var propertyArr = [
                { property: "__create__SchoolClass", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "board") {
            var propertyArr = [
                { property: "__create__SchoolBoard", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "role") {
            var propertyArr = [
                { property: "__create__Roles", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "adhocfee") {
            var propertyArr = [
                { property: "__create__Adhocfees", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "feeplanassociation") {
            var propertyArr = [
                { property: "__create__associations", model: "Feeplan", accessType: "WRITE" },
                { property: "updateFeeplanAssociation", model: "Feeplanassociation", accessType: "EXECUTE" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: p.accessType, permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "feeplan") {
            var propertyArr = [
                { property: "__create__FeePlans", model: "School", accessType: "WRITE" },
                { property: "findById", model: "School", accessType: "READ" },
                { property: "create", model: "Feeplan", accessType: "WRITE" },
                { property: "updateFeeplanheaddetails", model: "Feeplanheaddetails", accessType: "EXECUTE" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: p.accessType, permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "zone") {
            var propertyArr = [
                { property: "__create__zones", model: "School", accessType: "WRITE" },
                { property: "updateZonedetails", model: "Zonedetails", accessType: "EXECUTE" },
                { property: "updateZoneAcademicYear", model: "School", accessType: "EXECUTE" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: p.accessType, permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "feeplanheaddetails") {
            var propertyArr = [
                { property: "updateFeeplanheaddetails", model: "Feeplanheaddetails", accessType: "EXECUTE" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: p.accessType, permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else {
            propertyAccess.push({ model: selectedModel, property: "create", accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
        }
    }
    else if (selectedPermission == "Read") {
        // if (selectedModel.toLowerCase() == "class") {
        //     propertyAccess.push({ model: "Class", property: "__get__ClassSchool", accessType: "READ" });
        // }
        if (selectedModel.toLowerCase() == "student") {
            var propertyArr = [
                { property: "__count__Students", model: "School" },
                // { property: "__get__Students", model: "School" },
                { property: "getStudentDetails", model: "Student" },
                { property: "__findById__Students", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "academicyear") {
            var propertyArr = [
                { property: "__count__SchoolYear", model: "School" },
                { property: "__get__SchoolYear", model: "School" },
                { property: "__findById__SchoolYear", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "user") {
            var propertyArr = [
                { property: "__count__SchoolUsers", model: "School" },
                { property: "__get__SchoolUsers", model: "School" },
                { property: "__findById__SchoolUsers", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "institute") {
            var propertyArr = [
                { property: "__count__SchoolInstitute", model: "School" },
                { property: "__get__SchoolInstitute", model: "School" },
                { property: "__findById__SchoolInstitute", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "division") {
            var propertyArr = [
                { property: "__count__SchoolDivision", model: "School" },
                { property: "__get__SchoolDivision", model: "School" },
                { property: "__findById__SchoolDivision", model: "School" },
                { property: "__get__DivisionClass", model: "Division" },
                { property: "__get__DivisionSchool", model: "Division" },
                { property: "__get__StudentDivision", model: "Student" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "class") {
            var propertyArr = [
                { property: "__count__SchoolClass", model: "School" },
                { property: "__get__SchoolClass", model: "School" },
                { property: "__findById__SchoolClass", model: "School" },
                { property: "__get__ClassSchool", model: "Class" },
                { property: "__get__StudentClass", model: "Student" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "board") {
            var propertyArr = [
                { property: "__count__SchoolBoard", model: "School" },
                { property: "__get__SchoolBoard", model: "School" },
                { property: "__findById__SchoolBoard", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "role") {
            var propertyArr = [
                { property: "__count__Roles", model: "School" },
                { property: "__get__Roles", model: "School" },
                { property: "__findById__Roles", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "school") {
            var propertyArr = [
                { property: "__get__StudentSchool", model: "Student" },
                { property: "__get__ClassSchool", model: "Class" },
                { property: "__get__getUserForSchoolAdmin", model: "School", accessType: "EXECUTE" },
                { property: "__get__getUserCountForSchoolAdmin", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "category") {
            var propertyArr = [
                { property: "__get__StudentCategory", model: "Student" },
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "feeplan" || selectedModel.toLowerCase() == "verifyfeeplan") {
            var propertyArr = [
                { property: "__get__FeePlans", model: "School" },
                { property: "__findById__FeePlans", model: "School" },
                { property: "__count__FeePlans", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
            selectedModel = 'Feeplan';
        }
        else if (selectedModel.toLowerCase() == "adhocfee") {
            var propertyArr = [
                { property: "__get__Adhocfees", model: "School" },
                { property: "__findById__Adhocfees", model: "School" },
                { property: "__count__Adhocfees", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "feeplanassociation") {
            var propertyArr = [
                { property: "__get__associations", model: "Feeplan" },
                { property: "__findById__associations", model: "Feeplan" },
                { property: "__count__associations", model: "Feeplan" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "zone" || selectedModel.toLowerCase() == "verifytransport") {
            var propertyArr = [
                { property: "__get__zones", model: "School" },
                { property: "__findById__zones", model: "School" },
                { property: "__count__zones", model: "School" },
                { property: "find", model: "Zonedetails" },
                { property: "findById", model: "Zonedetails" },
                { property: "count", model: "Zonedetails" }

            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
            selectedModel = 'Zone';
        }
        else if (selectedModel.toLowerCase() == "invoice") {
            /**
             * Changed on 3/19/2018 to add filters to view invoice screen start. 
             */
            /*var propertyArr = [
                { property: "__get__SchoolInvoices", model: "School" },
                { property: "__findById__SchoolInvoices", model: "School" },
                { property: "__count__SchoolInvoices", model: "School" }
            ];*/
            var propertyArr = [
                { property: "__get__invoiceReports", model: "School" },
                { property: "__findById__SchoolInvoices", model: "School" },
                { property: "__count__invoiceReports", model: "School" }
            ];
            /**
             * Changes made on 3/19/2018 to add filters to view invoice screen ends.
             */
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "vwinvoicereport") {
            var propertyArr = [
                { property: "__get__invoiceReports", model: "School" },
                { property: "__count__invoiceReports", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
            return callback(propertyAccess);
            
        }
        else if (selectedModel.toLowerCase() == "vwauditlog") {
            var propertyArr = [
                // { property: "__get__getAuditDetails", model: "Vwauditlog" },
                // { property: "__get__getAuditDetailsCount", model: "Vwauditlog" }
                { property: "__get__Vwauditlogs", model: "School" },
                { property: "__count__Vwauditlogs", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
            return callback(propertyAccess);
        }
        else if (selectedModel.toLowerCase() == "feeheadpaymentreport") {
            var propertyArr = [
                { property: "getFeeheadPaymentReport", model: "FeeHeadPaymentReport" },
                { property: "getFeeheadListReport", model: "FeeHeadPaymentReport" }
                
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
            return callback(propertyAccess);
            
        }
        else if (selectedModel.toLowerCase() == "categoryclasspaymentreport") {
            var propertyArr = [
                { property: "getCategoryClassPaymentReport", model: "CategoryClassPaymentReport" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
            return callback(propertyAccess);
        }
        if (selectedModel.toLowerCase() == "studentcategoryreport") {
            var propertyArr = [
                { property: "__count__Students", model: "School" },
                // { property: "__get__Students", model: "School" },
                { property: "getStudentDetails", model: "Student" },
                { property: "__findById__Students", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
            return callback(propertyAccess);
        }
        propertyAccess.push({ model: selectedModel, property: "find", accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
        propertyAccess.push({ model: selectedModel, property: "findById", accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
        propertyAccess.push({ model: selectedModel, property: "count", accessType: "READ", permission: "ALLOW", principalId: role, principalType: "ROLE" });
    }
    else if (selectedPermission == "Update") {
        if (selectedModel.toLowerCase() == "student") {
            var propertyArr = [
                { property: "__updateById__Students", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "academicyear") {
            var propertyArr = [
                { property: "__updateById__SchoolYear", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "user") {
            var propertyArr = [
                { property: "__updateById__SchoolUsers", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
            propertyAccess.push({ model: selectedModel, property: "updateUser", accessType: "EXECUTE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
        }
        else if (selectedModel.toLowerCase() == "institute") {
            var propertyArr = [
                { property: "__updateById__SchoolInstitute", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "division") {
            var propertyArr = [
                { property: "__updateById__SchoolDivision", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "class") {
            var propertyArr = [
                { property: "__updateById__SchoolClass", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "board") {
            var propertyArr = [
                { property: "__updateById__SchoolBoard", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "role") {
            var propertyArr = [
                { property: "__updateById__Roles", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "adhocfee") {
            var propertyArr = [
                { property: "__updateById__Adhocfees    ", model: "School" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "feeplanassociation") {
            var propertyArr = [
                { property: "__updateById__associations", model: "Feeplan", accessType: "WRITE" },
                { property: "updateFeeplanAssociation", model: "Feeplanassociation", accessType: "EXECUTE" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: p.accessType, permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        else if (selectedModel.toLowerCase() == "feeplan" || selectedModel.toLowerCase() == "verifyfeeplan") {
            var propertyArr = [
                { property: "__updateById__FeePlans", model: "School", accessType: "WRITE" },
                { property: "findById", model: "School", accessType: "READ" },
                { property: "updateFeeplanheaddetails", model: "Feeplanheaddetails", accessType: "EXECUTE" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: p.accessType, permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
            selectedModel = 'Feeplan';
        }
        else if (selectedModel.toLowerCase() == "zone" || selectedModel.toLowerCase() == "verifytransport") {
            var propertyArr = [
                { property: "__updateById__zones", model: "School", accessType: "WRITE" },
                { property: "updateZonedetails", model: "Zonedetails", accessType: "EXECUTE" },
                { property: "updateZoneAcademicYear", model: "School", accessType: "EXECUTE" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: p.accessType, permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
            selectedModel = 'Zone';
        }
        else if (selectedModel.toLowerCase() == "feeplanheaddetails") {
            var propertyArr = [
                { property: "updateFeeplanheaddetails", model: "Feeplanheaddetails", accessType: "EXECUTE" }
            ];
            propertyArr.map(function (p, i) {
                propertyAccess.push({ model: p.model, property: p.property, accessType: p.accessType, permission: "ALLOW", principalId: role, principalType: "ROLE" });
            });
        }
        propertyAccess.push({ model: selectedModel, property: "updateAttributes", accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
        propertyAccess.push({ model: selectedModel, property: "updateAttribute", accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
    }
    else if (selectedPermission == "Delete") {

        if (selectedModel.toLowerCase() == "addhocfeedetails" ||
            selectedModel.toLowerCase() == "container" ||
            selectedModel.toLowerCase() == "feeplanheaddetails" ||
            selectedModel.toLowerCase() == "rolemenuDetails" ||
            selectedModel.toLowerCase() == "rolepermissionDetails" ||
            selectedModel.toLowerCase() == "userschooldetails") {
            propertyAccess.push({ model: selectedModel, property: "destroyById", accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });

        }
        else if(selectedModel.toLowerCase() == "feeplanassociation"){
            propertyAccess.push({ model: selectedModel, property: "deleteFeeplanAssociation", accessType: "EXECUTE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
        }
        else {
            propertyAccess.push({ model: selectedModel, property: "deleteRecord", accessType: "WRITE", permission: "ALLOW", principalId: role, principalType: "ROLE" });
        }


    }
    callback(propertyAccess);
};

module.exports = permissionsHelper;