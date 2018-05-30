'use strict';
var fs = require('fs');
var path = require('path');
var i18next = require('i18next');
var csv = require('fast-csv');
var _ = require('underscore');

var csvHelper = function() {
};

/**
 * Method to get CSV headers
 */
csvHelper.getCSVHeader = function(student) {
  return {
    'Registered': 'Is Registered',
    'gRNumber': 'GR Number',
    'studentCode': 'Student Code',
    'studentFirstName': 'First Name',
    'studentLastName': 'Last Name',
    'studentGender': 'Gender',
    'phone': 'Phone',
    'Response Description': 'Response Description',
  };
};

/**
 * Method to get headers for CSV used for invoice
 */
csvHelper.getInvoiceCSVHeader = function(student) {
  return {
    'Registered': 'Is Registered',
    'InvoiceNumber': 'Invoice Number',
    'UserID': 'User ID',
    'ChargeAmount': 'Charge Amount',
    'DueDate': 'Due Date',
    'Response Description': 'Response Description',
  };
};

/**
 * Method to get CSV headers for invoice update
 */
csvHelper.getInvoiceUpdateCSVHeader = function(student) {
  return {
    'Updated': 'Is Updated',
    'InvoiceNumber': 'Invoice Number',
    'UserID': 'User ID',
    'ChargeAmount': 'Charge Amount',
    'DueDate': 'Due Date',
    'Response Description': 'Response Description',
  };
};

/**
 * Method to get invoice update format
 */
csvHelper.getUpdateInvoiceFormat = function(invoice) {
  return {
    'Updated': 'Yes',
    'InvoiceNumber': invoice.invoiceNumber,
    'UserID': invoice.userId,
    'ChargeAmount': invoice.totalChargeAmount,
    'DueDate': invoice.dueDate,
    'Response Description': invoice.ErrorMessage,
  };
};

/**
 * Get invoice format when invoice failed to update
 */
csvHelper.getFailedToUpdateInvoiceFormat = function(invoice) {
  return {
    'Updated': 'No',
    'InvoiceNumber': invoice.invoiceNumber,
    'UserID': invoice.userId,
    'ChargeAmount': invoice.totalChargeAmount,
    'DueDate': invoice.dueDate,
    'Response Description': invoice.ErrorMessage,
  };
};

/**
 * Method to get registered invoice format
 */
csvHelper.getRegisteredInvoiceFormat = function(invoice) {
  return {
    'Registered': 'Yes',
    'InvoiceNumber': invoice.invoiceNo,
    'UserID': invoice.userId,
    'ChargeAmount': invoice.totalChargeAmount,
    'DueDate': invoice.dueDate,
    'Response Description': invoice.ErrorMessage,
  };
};

/**
 * Method to get format for dailed invoices
 */
csvHelper.getFailedInvoiceFormat = function(invoice) {
  return {
    'Registered': 'No',
    'InvoiceNumber': invoice.invoiceNo,
    'UserID': invoice.userId,
    'ChargeAmount': invoice.totalChargeAmount,
    'DueDate': invoice.dueDate,
    'Response Description': invoice.ErrorMessage,
  };
};

/**
 * Method to get CSV format for registered students
 */
csvHelper.getRegisteredStudentCSVFormat = function(student) {
  return {
    'Registered': 'Yes',
    'gRNumber': student.gRNumber,
    'studentCode': student.studentCode,
    'studentFirstName': student.studentFirstName,
    'studentLastName': student.studentLastName,
    'studentGender': student.studentGender,
    'phone': student.phone,
    'Response Description': student.ErrorMessage,
  };
};

/**
 * Method to get CSV format for failed student registration
 */
csvHelper.getFailedStudentCSVFormat = function(student) {
  return {
    'Registered': 'No',
    'gRNumber': student.gRNumber,
    'studentCode': student.studentCode,
    'studentFirstName': student.studentFirstName,
    'studentLastName': student.studentLastName,
    'studentGender': student.studentGender,
    'phone': student.phone,
    'Response Description': student.ErrorMessage,
  };
};

/**
 * Method to generate CSV after student registration
 */
csvHelper.generateStudentRegistrationCSV = function(filepath, registeredStudents, failedStudents, callback) {
  var fastCsv = csv.createWriteStream();
  var writeStream = fs.createWriteStream(filepath);
  writeStream.on('finish', function() {
    console.log('Completed generating student registration CSV report generation.');
    callback();
  });
  fastCsv.pipe(writeStream);
  fastCsv.write(csvHelper.getCSVHeader());

  _.each(registeredStudents, function(studentDetails) {
    fastCsv.write(csvHelper.getRegisteredStudentCSVFormat(studentDetails));
  });

  _.each(failedStudents, function(studentDetails) {
    fastCsv.write(csvHelper.getFailedStudentCSVFormat(studentDetails));
  });
  fastCsv.end();
};

/**
 * Method to generate CSV after invoice registration
 */
csvHelper.generateInvoiceRegistrationCSV = function(filepath, registeredInvoices, failedInvoices, callback) {
  var fastCsv = csv.createWriteStream();
  var writeStream = fs.createWriteStream(filepath);
  writeStream.on('finish', function() {
    console.log('Completed invoice CSV report generation.');
    callback();
  });
  fastCsv.pipe(writeStream);
  fastCsv.write(csvHelper.getInvoiceCSVHeader());

  _.each(registeredInvoices, function(invoiceDetails) {
    fastCsv.write(csvHelper.getRegisteredInvoiceFormat(invoiceDetails));
  });

  _.each(failedInvoices, function(invoiceDetails) {
    fastCsv.write(csvHelper.getFailedInvoiceFormat(invoiceDetails));
  });
  fastCsv.end();
};

/**
 * Method to generate invoice update CSV
 */
csvHelper.generateInvoiceUpdateCSV = function(filepath, registeredInvoices, failedInvoices, callback) {
  var fastCsv = csv.createWriteStream();
  var writeStream = fs.createWriteStream(filepath);
  writeStream.on('finish', function() {
    console.log('Completed invoice update CSV report generation.');
    callback();
  });
  fastCsv.pipe(writeStream);
  fastCsv.write(csvHelper.getInvoiceUpdateCSVHeader());

  _.each(registeredInvoices, function(invoiceDetails) {
    fastCsv.write(csvHelper.getUpdateInvoiceFormat(invoiceDetails));
  });

  _.each(failedInvoices, function(invoiceDetails) {
    fastCsv.write(csvHelper.getFailedToUpdateInvoiceFormat(invoiceDetails));
  });
  fastCsv.end();
};
module.exports = csvHelper;
