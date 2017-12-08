-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 192.168.101.22    Database: schoolfeesystem
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

ALTER TABLE `academicyear` AUTO_INCREMENT = 1;
ALTER TABLE `acl` AUTO_INCREMENT = 1;
ALTER TABLE `Adhocfee` AUTO_INCREMENT = 1;
ALTER TABLE `Adhocfeedetails` AUTO_INCREMENT = 1;
ALTER TABLE `board` AUTO_INCREMENT = 1;
ALTER TABLE `category` AUTO_INCREMENT = 1;
ALTER TABLE `class` AUTO_INCREMENT = 1;
ALTER TABLE `division` AUTO_INCREMENT = 1;
ALTER TABLE `feehead` AUTO_INCREMENT = 1;
ALTER TABLE `feeplan` AUTO_INCREMENT = 1;
ALTER TABLE `feeplanassociation` AUTO_INCREMENT = 1;
ALTER TABLE `feeplanheaddetails` AUTO_INCREMENT = 1;
ALTER TABLE `frequency` AUTO_INCREMENT = 1;
ALTER TABLE `institute` AUTO_INCREMENT = 1;
ALTER TABLE `menu` AUTO_INCREMENT = 1;
ALTER TABLE `permission` AUTO_INCREMENT = 1;
ALTER TABLE `role` AUTO_INCREMENT = 1;
ALTER TABLE `rolemapping` AUTO_INCREMENT = 1;
ALTER TABLE `rolemenudetails` AUTO_INCREMENT = 1;
ALTER TABLE `rolepermissiondetails` AUTO_INCREMENT = 1;
ALTER TABLE `roleschooldetails` AUTO_INCREMENT = 1;
ALTER TABLE `school` AUTO_INCREMENT = 1;
ALTER TABLE `schoolmerchant` AUTO_INCREMENT = 1;
ALTER TABLE `student` AUTO_INCREMENT = 1;
ALTER TABLE `user` AUTO_INCREMENT = 1;
ALTER TABLE `userschooldetails` AUTO_INCREMENT = 1;
ALTER TABLE `zone` AUTO_INCREMENT = 1;
ALTER TABLE `zonedetails` AUTO_INCREMENT = 1;


--
-- Dumping data for table `acl`
--

LOCK TABLES `acl` WRITE;
/*!40000 ALTER TABLE `acl` DISABLE KEYS */;

-- Deny
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Adhocfee', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanheaddetails', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanassociation', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zonedetails', '*', '*', 'DENY', 'ROLE', '$everyone');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__get__permission', 'READ', 'ALLOW', 'ROLE', '$authenticated');

-- Authenticate read Access

-- Frequency, Class, Division, Category, AcademicYear
INSERT INTO `schoolfeesystem_int`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'find', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem_int`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'find', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem_int`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'find', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem_int`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'find', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem_int`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'find', 'READ', 'ALLOW', 'ROLE', '$authenticated');

INSERT INTO `schoolfeesystem_int`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'findById', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem_int`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'findById', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem_int`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'findById', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem_int`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'findById', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem_int`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'findById', 'READ', 'ALLOW', 'ROLE', '$authenticated');

-- School Get
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Students', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolYear', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolUsers', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolInstitute', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolDivision', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolClass', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolBoard', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Roles', 'READ', 'ALLOW', 'ROLE', '$authenticated');

-- Scholl Get by Id
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Students', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolYear', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolUsers', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolInstitute', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolDivision', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolClass', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolBoard', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Roles', 'READ', 'ALLOW', 'ROLE', '$authenticated');

-- School Count
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Students', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolYear', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolUsers', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolInstitute', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolDivision', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolClass', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolBoard', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Roles', 'READ', 'ALLOW', 'ROLE', '$authenticated');


-- Sudents GET
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentCategory', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentClass', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentDivision', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentSchool', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'getStudentFeeplanDetails', 'READ', 'ALLOW', 'ROLE', '$authenticated');

-- Classes
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', '__get__ClassSchool', 'READ', 'ALLOW', 'ROLE', '$authenticated');

-- Divisions
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', '__get__DivisionSchool', 'READ', 'ALLOW', 'ROLE', '$authenticated');
--  RoleMenu
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__get__rolemenu', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__findById__rolemenu', 'READ', 'ALLOW', 'ROLE', '$authenticated');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__FeePlans', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__FeePlans', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__FeePlans', 'READ', 'ALLOW', 'ROLE', '$authenticated');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', '__get__associations', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', '__findById__associations', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', '__count__associations', 'READ', 'ALLOW', 'ROLE', '$authenticated');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Adhocfees', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Adhocfees', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Adhocfees', 'READ', 'ALLOW', 'ROLE', '$authenticated');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__zones', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__zones', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__zones', 'READ', 'ALLOW', 'ROLE', '$authenticated');

-- School Category
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Schoolcategories', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Schoolcategories', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Schoolcategories', 'READ', 'ALLOW', 'ROLE', '$authenticated');



-- Allow for  SuperAdmin
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanassociation', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanheaddetails', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zonedetails', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Adhocfee', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Permission', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanassociation', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanheaddetails', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zonedetails', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Adhocfee', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Permission', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanassociation', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanheaddetails', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Adhocfee', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');


INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanassociation', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanheaddetails', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zonedetails', 'updateZonedetails', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Adhocfee', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Adhocfee', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');

-- Count
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanassociation', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanheaddetails', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zonedetails', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Adhocfee', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');

-- Soft Delete
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Adhocfee', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');

-- INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
-- INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
-- INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
-- INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');


INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'createUser', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'updateUser', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanheaddetails', 'updateFeeplanheaddetails', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanassociation', 'updateFeeplanAssociation', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');


-- School Get
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Students', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolYear', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolUsers', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolInstitute', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolDivision', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolClass', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolBoard', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Roles', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');

-- Scholl Get by Id
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Students', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolYear', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolUsers', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolInstitute', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolDivision', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolClass', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolBoard', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Roles', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');

-- School Count
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Students', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolYear', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolUsers', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolInstitute', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolDivision', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolClass', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolBoard', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Roles', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
-- 
-- School Create
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__Students', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolYear', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolUsers', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolInstitute', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolDivision', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolClass', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolBoard', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__Roles', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');

-- School UPDATE
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__Students', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolYear', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolUsers', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolInstitute', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolDivision', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolClass', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolBoard', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__Roles', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');

-- Sudents GET
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentCategory', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentClass', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentDivision', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentSchool', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'getStudentFeeplanDetails', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');

-- Classes
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', '__get__ClassSchool', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');

-- Divisions
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', '__get__DivisionSchool', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
--  RoleMenu
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__get__rolemenu', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__findById__rolemenu', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__updateById__rolemenu', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__FeePlans', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__FeePlans', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__FeePlans', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__FeePlans', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__FeePlans', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', '__get__associations', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', '__findById__associations', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', '__count__associations', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', '__create__associations', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', '__updateById__associations', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Adhocfees', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Adhocfees', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Adhocfees', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__Adhocfees', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__Adhocfees', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__zones', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__zones', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__zones', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__zones', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__zones', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Schoolcategories', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Schoolcategories', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Schoolcategories', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__Schoolcategories', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__Schoolcategories', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');


-- ========================================================== Allow for  SchoolAdmin=============================================================================================

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanassociation', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanheaddetails', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zonedetails', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Adhocfee', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Permission', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency',	'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category',	'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanassociation', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanheaddetails', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zonedetails', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Adhocfee', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Permission', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanassociation', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanheaddetails', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Adhocfee', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanassociation', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanheaddetails', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zonedetails', 'updateZonedetails', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Adhocfee', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Adhocfee', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');


-- Count
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanassociation', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanheaddetails', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zonedetails', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Adhocfee', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Permission', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- Soft Delete
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Adhocfee', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Zone', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- 

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('User', 'createUser', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'updateUser', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanheaddetails', 'updateFeeplanheaddetails', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplanassociation', 'updateFeeplanAssociation', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');


-- School GET
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Students', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolYear', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolUsers', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolInstitute', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolDivision', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolClass', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolBoard', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Roles', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- School GET/{ID}
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Students', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolYear', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolUsers', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolInstitute', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolDivision', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolClass', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolBoard', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Roles', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- School Count
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Students', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolYear', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolUsers', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolInstitute', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolDivision', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolClass', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolBoard', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Roles', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- School Create 
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__Students', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolYear', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolUsers', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolInstitute', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolDivision', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolClass', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolBoard', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__Roles', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- School UPDATE
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__Students', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolYear', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolUsers', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolInstitute', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolDivision', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolClass', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolBoard', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__Roles', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- Sudents GET
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentCategory', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentClass', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentDivision', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentSchool', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'getStudentFeeplanDetails', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- Classes
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', '__get__ClassSchool', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- Divisions
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', '__get__DivisionClass', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
--  RoleMenu

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__get__rolemenu', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__findById__rolemenu', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__updateById__rolemenu', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__FeePlans', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__FeePlans', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__FeePlans', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__FeePlans', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__FeePlans', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', '__get__associations', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', '__findById__associations', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', '__count__associations', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', '__create__associations', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', '__updateById__associations', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Adhocfees', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Adhocfees', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Adhocfees', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__Adhocfees', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__Adhocfees', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__zones', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__zones', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__zones', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__zones', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__zones', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');

INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Schoolcategories', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Schoolcategories', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Schoolcategories', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__Schoolcategories', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `schoolfeesystem`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__Schoolcategories', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
/*!40000 ALTER TABLE `acl` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board`(
`boardName`,
`boardDescription`,
`isDelete`,
`createdBy`,
`createdOn`,
`updatedBy`,
`updatedOn`) VALUES 
('CBSC','CBSC Board',0,1,'2017-11-06 17:58:10',NULL,NULL),
('ICSC','ICSC Board',0,1,'2017-11-06 17:58:10',NULL,NULL),
('SSE','SSE Board',0,1,'2017-11-06 17:58:10',NULL,NULL),
('NA','Not Aaplicatble',0,1,'2017-11-06 17:58:10',NULL,NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `category`
--

-- LOCK TABLES `category` WRITE;
-- /*!40000 ALTER TABLE `category` DISABLE KEYS */;
-- INSERT INTO `category`(
-- `categoryName`,
-- `categoryDescription`,
-- `categoryCode`,
-- `isDelete`,
-- `createdBy`,
-- `createdOn`,
-- `updatedBy`,
-- `updatedOn`) VALUES 
-- ('General','General Category','Genral',0,1,'2017-11-06 12:32:49',NULL,NULL),
-- ('Staff','Staff Category','Staff',0,1,'2017-11-06 12:32:49',NULL,NULL),
-- ('Management','Management Category','Management',0,1,'2017-11-06 12:32:49',NULL,NULL),
-- ('RTE','RTE Category','RTE',0,1,'2017-11-06 12:32:49',NULL,NULL);
-- /*!40000 ALTER TABLE `category` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Dumping data for table `frequency`
--

LOCK TABLES `frequency` WRITE;
/*!40000 ALTER TABLE `frequency` DISABLE KEYS */;
INSERT INTO `frequency` (
`frequencyName`,
`frequencyValue`,
`isDelete`,
`createdBy`,
`createdOn`,
`updatedBy`,
`updatedOn`) VALUES 
('Monthly',12,0,1,'2017-11-06 12:35:41',NULL,NULL),
('Quarterly',4,0,1,'2017-11-06 12:35:41',NULL,NULL),
('Half Yearly',2,0,1,'2017-11-06 12:35:41',NULL,NULL),
('Yearly',1,0,1,'2017-11-06 12:35:41',NULL,NULL),
('OneTime',1,0,1,'2017-11-06 12:35:41',NULL,NULL);
/*!40000 ALTER TABLE `frequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES 
(1,'Institures',0,1,0,1,'2017-11-03 15:12:09',NULL,NULL),
(2,'Board',0,2,0,1,'2017-11-03 15:12:09',NULL,NULL),
(3,'Schools',0,3,0,1,'2017-11-03 15:12:09',NULL,NULL),
(4,'Role And Permissions',0,4,0,1,'2017-11-03 15:12:09',NULL,NULL),
(5,'User Management',0,5,0,1,'2017-11-03 15:12:09',NULL,NULL),
(6,'Frequency',0,6,0,1,'2017-11-03 15:12:09',NULL,NULL),
(7,'Class',0,7,0,1,'2017-11-03 15:12:09',NULL,NULL),
(8,'Division',0,8,0,1,'2017-11-03 15:12:09',NULL,NULL),
(9,'Category',0,9,0,1,'2017-11-03 15:12:09',NULL,NULL),
(10,'Fee Heads',0,10,0,1,'2017-11-03 15:12:09',NULL,NULL),
(11,'Fee Plans',0,11,0,1,'2017-11-03 15:12:09',NULL,NULL),
(12,'Zone',0,12,0,1,'2017-11-03 15:12:09',NULL,NULL),
(13,'AdHoc Fee',0,13,0,1,'2017-11-03 15:12:09',NULL,NULL),
(14,'Student Management',0,14,0,1,'2017-11-03 15:12:09',NULL,NULL),
(15,'Process Fee',0,15,0,1,'2017-11-03 15:12:09',NULL,NULL),
(16,'Reports',0,16,0,1,'2017-11-03 15:12:09',NULL,NULL),
(17,'AcademicYear',0,17,0,1,'2017-11-03 12:49:35',NULL,NULL),
(18,'FeePlanAssociation',0,18,0,1,'2017-11-03 12:49:35',NULL,NULL),
(19,'Invoice',0,19,0,1,'2017-11-03 12:49:35',NULL,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` (
`menuId`,
`roleId`,
`permissionName`,
`modelName`,
`isDelete`,
`createdBy`,
`createdOn`,
`updatedBy`,
`updatedOn`)VALUES 
(1,1,'Institute.Create','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),
(1,1,'Institute.Read','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),
(1,1,'Institute.Update','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),
(1,1,'Institute.Delete','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),
(2,1,'Board.Create','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),
(2,1,'Board.Read','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),
(2,1,'Board.Update','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),
(2,1,'Board.Delete','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),
(3,1,'School.Create','School',0,1,'2017-11-03 15:52:26',NULL,NULL),
(3,1,'School.Read','School',0,1,'2017-11-03 15:52:26',NULL,NULL),
(3,1,'School.Update','School',0,1,'2017-11-03 15:52:26',NULL,NULL),
(3,1,'School.Delete','School',0,1,'2017-11-03 15:52:26',NULL,NULL),
(4,1,'Role.Create','role',0,1,'2017-11-03 15:52:26',NULL,NULL),
(4,1,'Role.Read','role',0,1,'2017-11-03 15:52:26',NULL,NULL),
(4,1,'Role.Update','role',0,1,'2017-11-03 15:52:26',NULL,NULL),
(4,1,'Role.Delete','role',0,1,'2017-11-03 15:52:26',NULL,NULL),
(5,1,'User.Create','user',0,1,'2017-11-03 15:52:26',NULL,NULL),
(5,1,'User.Read','user',0,1,'2017-11-03 15:52:26',NULL,NULL),
(5,1,'User.Update','user',0,1,'2017-11-03 15:52:26',NULL,NULL),
(5,1,'User.Delete','user',0,1,'2017-11-03 15:52:26',NULL,NULL),
(6,1,'Frequency.Create','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),
(6,1,'Frequency.Read','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),
(6,1,'Frequency.Update','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),
(6,1,'Frequency.Delete','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),
(7,1,'Class.Create','Class',0,1,'2017-11-03 15:52:26',NULL,NULL),
(7,1,'Class.Read','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),
(7,1,'Class.Update','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),
(7,1,'Class.Delete','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),
(8,1,'Division.Create','Division',0,1,'2017-11-03 16:11:22',NULL,NULL),
(8,1,'Division.Read','Division',0,1,'2017-11-03 16:11:23',NULL,NULL),
(8,1,'Division.Update','Division',0,1,'2017-11-03 16:11:23',NULL,NULL),
(8,1,'Division.Delete','Division',0,1,'2017-11-03 16:11:23',NULL,NULL),
(9,1,'Category.Create','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),
(9,1,'Category.Read','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),
(9,1,'Category.Update','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),
(9,1,'Category.Delete','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),
(10,1,'Feehead.Create','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),
(10,1,'Feehead.Read','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),
(10,1,'Feehead.Update','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),
(10,1,'Feehead.Delete','Feehead',0,1,'2017-11-03 16:11:24',NULL,NULL),
(11,1,'Feeplan.Create','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),
(11,1,'Feeplan.Read','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),
(11,1,'Feeplan.Update','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),
(11,1,'Feeplan.Delete','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),
(12,1,'Zone.Create','Zone',0,1,'2017-11-03 16:11:24',NULL,NULL),
(12,1,'Zone.Read','Zone',0,1,'2017-11-03 16:11:24',NULL,NULL),
(12,1,'Zone.Update','Zone',0,1,'2017-11-03 16:11:24',NULL,NULL),
(12,1,'Zone.Delete','Zone',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,1,'Adhocfee.Create','Adhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,1,'Adhocfee.Read','Adhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,1,'Adhocfee.Update','Adhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,1,'Adhocfee.Delete','Adhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
(14,1,'Student.Create','Student',0,1,'2017-11-03 16:11:24',NULL,NULL),
(14,1,'Student.Read','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),
(14,1,'Student.Update','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),
(14,1,'Student.Delete','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),
(15,1,'ProcessFee.Create','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),
(15,1,'ProcessFee.Read','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),
(15,1,'ProcessFee.Update','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),
(15,1,'ProcessFee.Delete','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),
(16,1,'Report.Create','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),
(16,1,'Report.Read','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),
(16,1,'Report.Update','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),
(16,1,'Report.Delete','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),
(17,1,'AcademicYear.Create','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),
(17,1,'AcademicYear.Read','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),
(17,1,'AcademicYear.Update','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),
(17,1,'AcademicYear.Delete','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),
(18,1,'Feeplanassociation.Create','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL),
(18,1,'Feeplanassociation.Read','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL),
(18,1,'Feeplanassociation.Update','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL),
(18,1,'Feeplanassociation.Delete','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL),
(19,1,'Invoice.Read','Invoice',0,1,'2017-11-03 12:51:59',NULL,NULL),
(19,1,'Invoice.Update','Invoice',0,1,'2017-11-03 12:51:59',NULL,NULL),
-- (6,2,'Frequency.Create','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),
-- (6,2,'Frequency.Read','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),
-- (6,2,'Frequency.Update','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),
-- (6,2,'Frequency.Delete','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),
(7,2,'Class.Create','Class',0,1,'2017-11-03 15:52:26',NULL,NULL),
(7,2,'Class.Read','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),
(7,2,'Class.Update','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),
(7,2,'Class.Delete','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),
(8,2,'Division.Create','Division',0,1,'2017-11-03 16:11:22',NULL,NULL),
(8,2,'Division.Read','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),
(8,2,'Division.Update','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),
(8,2,'Division.Delete','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),
(9,2,'Category.Create','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),
(9,2,'Category.Read','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),
(9,2,'Category.Update','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),
(9,2,'Category.Delete','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),
(10,2,'Feehead.Create','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),
(10,2,'Feehead.Read','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),
(10,2,'Feehead.Update','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),
(10,2,'Feehead.Delete','Feehead',0,1,'2017-11-03 16:11:24',NULL,NULL),
(11,2,'Feeplan.Create','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),
(11,2,'Feeplan.Read','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),
(11,2,'Feeplan.Update','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),
(11,2,'Feeplan.Delete','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),
(12,2,'Zone.Create','Zone',0,1,'2017-11-03 16:11:24',NULL,NULL),
(12,2,'Zone.Read','Zone',0,1,'2017-11-03 16:11:24',NULL,NULL),
(12,2,'Zone.Update','Zone',0,1,'2017-11-03 16:11:24',NULL,NULL),
(12,2,'Zone.Delete','Zone',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,2,'Adhocfee.Create','Adhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,2,'Adhocfee.Read','Adhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,2,'Adhocfee.Update','Adhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,2,'Adhocfee.Delete','Adhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
(14,2,'Student.Create','Student',0,1,'2017-11-03 16:11:24',NULL,NULL),
(14,2,'Student.Read','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),
(14,2,'Student.Update','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),
(14,2,'Student.Delete','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),
(15,2,'ProcessFee.Create','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),
(15,2,'ProcessFee.Read','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),
(15,2,'ProcessFee.Update','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),
(15,2,'ProcessFee.Delete','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),
(16,2,'Report.Create','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),
(16,2,'Report.Read','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),
(16,2,'Report.Update','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),
(16,2,'Report.Delete','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),
-- (17,2,'AcademicYear.Create','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),
-- (17,2,'AcademicYear.Read','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),
-- (17,2,'AcademicYear.Update','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),
-- (17,2,'AcademicYear.Delete','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),
(18,2,'Feeplanassociation.Create','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL),
(18,2,'Feeplanassociation.Read','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL),
(18,2,'Feeplanassociation.Update','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL),
(18,2,'Feeplanassociation.Delete','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES 
(1,NULL,'SuperAdmin','Super Administration','SuperAdmin',0,1,'2017-11-03 16:14:10',NULL,NULL),
(2,NULL,'SchoolAdmin','School Admin','SchoolAdmin',0,1,'2017-11-03 16:14:10',NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rolemapping`
--

LOCK TABLES `rolemapping` WRITE;
/*!40000 ALTER TABLE `rolemapping` DISABLE KEYS */;
INSERT INTO `rolemapping` VALUES 
(1,'USER',1,1);
/*!40000 ALTER TABLE `rolemapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rolemenudetails`
--

LOCK TABLES `rolemenudetails` WRITE;
/*!40000 ALTER TABLE `rolemenudetails` DISABLE KEYS */;
INSERT INTO `rolemenudetails` (
`roleId`,
`menuId`,
`createdBy`,
`createdOn`,
`updatedBy`,
`updatedOn`) VALUES 
(1,1,1,'2017-11-03 12:20:07',NULL,NULL),
(1,2,1,'2017-11-03 12:20:07',NULL,NULL),
(1,3,1,'2017-11-03 12:20:07',NULL,NULL),
(1,4,1,'2017-11-03 12:20:07',NULL,NULL),
(1,5,1,'2017-11-03 12:20:07',NULL,NULL),
(1,6,1,'2017-11-03 12:20:07',NULL,NULL),
(1,7,1,'2017-11-03 12:20:07',NULL,NULL),
(1,8,1,'2017-11-03 12:20:07',NULL,NULL),
(1,9,1,'2017-11-03 12:20:07',NULL,NULL),
(1,10,1,'2017-11-03 12:20:07',NULL,NULL),
(1,11,1,'2017-11-03 12:20:07',NULL,NULL),
(1,12,1,'2017-11-03 12:20:07',NULL,NULL),
(1,13,1,'2017-11-03 12:20:07',NULL,NULL),
(1,14,1,'2017-11-03 12:20:07',NULL,NULL),
(1,15,1,'2017-11-03 12:20:07',NULL,NULL),
(1,16,1,'2017-11-03 12:20:07',NULL,NULL),
(1,17,1,'2017-11-03 13:16:14',NULL,NULL),
(1,18,1,'2017-11-03 13:16:14',NULL,NULL),
(1,19,1,'2017-11-03 13:16:14',NULL,NULL),
(2,4,1,'2017-11-03 14:03:33',NULL,NULL),
(2,5,1,'2017-11-03 14:03:33',NULL,NULL),
-- (2,6,1,'2017-11-03 14:03:33',NULL,NULL),
(2,7,1,'2017-11-03 14:03:33',NULL,NULL),
(2,8,1,'2017-11-03 14:03:33',NULL,NULL),
(2,9,1,'2017-11-03 14:03:33',NULL,NULL),
(2,10,1,'2017-11-03 14:03:33',NULL,NULL),
(2,11,1,'2017-11-03 14:03:33',NULL,NULL),
(2,12,1,'2017-11-03 14:03:33',NULL,NULL),
(2,13,1,'2017-11-03 14:03:33',NULL,NULL),
(2,14,1,'2017-11-03 14:03:33',NULL,NULL),
(2,15,1,'2017-11-03 14:03:33',NULL,NULL),
(2,16,1,'2017-11-03 14:03:33',NULL,NULL),
-- (2,17,1,'2017-11-03 14:03:33',NULL,NULL),
(2,18,1,'2017-11-03 14:03:33',NULL,NULL),
(2,19,1,'2017-11-03 14:03:33',NULL,NULL);
/*!40000 ALTER TABLE `rolemenudetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rolepermissiondetails`
--

LOCK TABLES `rolepermissiondetails` WRITE;
/*!40000 ALTER TABLE `rolepermissiondetails` DISABLE KEYS */;
INSERT INTO `rolepermissiondetails` (
`roleId`,
`permissionId`,
`permissionName`,
`createdBy`,
`createdOn`,
`updatedBy`,
`updatedOn`)VALUES 
(1,1,'Institute.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,2,'Institute.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,3,'Institute.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,4,'Institute.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,5,'Board.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,6,'Board.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,7,'Board.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,8,'Board.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,9,'School.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,10,'School.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,11,'School.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,12,'School.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,13,'Role.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,14,'Role.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,15,'Role.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,16,'Role.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,17,'User.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,18,'User.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,19,'User.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,20,'User.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,21,'Frequency.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,22,'Frequency.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,23,'Frequency.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,24,'Frequency.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,25,'Class.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,26,'Class.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,27,'Class.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,28,'Class.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,29,'Division.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,30,'Division.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,31,'Division.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,32,'Division.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,33,'Category.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,34,'Category.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,35,'Category.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,36,'Category.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,37,'Feehead.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,38,'Feehead.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,39,'Feehead.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,40,'Feehead.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,41,'Feeplan.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,42,'Feeplan.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,43,'Feeplan.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,44,'Feeplan.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,45,'Zone.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,46,'Zone.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,47,'Zone.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,48,'Zone.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,49,'Adhocfee.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,50,'Adhocfee.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,51,'Adhocfee.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,52,'Adhocfee.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,53,'Student.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,54,'Student.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,55,'Student.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,56,'Student.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,57,'ProcessFee.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,58,'ProcessFee.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,59,'ProcessFee.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,60,'ProcessFee.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,61,'Report.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,62,'Report.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,63,'Report.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,64,'Report.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,65,'AcademicYear.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,66,'AcademicYear.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,67,'AcademicYear.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,68,'AcademicYear.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,69,'Feeplanassociation.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,70,'Feeplanassociation.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,71,'Feeplanassociation.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,72,'Feeplanassociation.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,73,'Invoice.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,74,'Invoice.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(2,13,'Role.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,14,'Role.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,15,'Role.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,16,'Role.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,17,'User.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,18,'User.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,19,'User.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,20,'User.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
-- (2,21,'Frequency.Create',1,'2017-11-03 14:06:07',NULL,NULL),
-- (2,22,'Frequency.Read',1,'2017-11-03 14:06:07',NULL,NULL),
-- (2,23,'Frequency.Update',1,'2017-11-03 14:06:07',NULL,NULL),
-- (2,24,'Frequency.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,25,'Class.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,26,'Class.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,27,'Class.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,28,'Class.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,29,'Division.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,30,'Division.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,31,'Division.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,32,'Division.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,33,'Category.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,34,'Category.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,35,'Category.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,36,'Category.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,37,'Feehead.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,38,'Feehead.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,39,'Feehead.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,40,'Feehead.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,41,'Feeplan.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,42,'Feeplan.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,43,'Feeplan.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,44,'Feeplan.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,45,'Zone.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,46,'Zone.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,47,'Zone.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,48,'Zone.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,49,'Adhocfee.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,50,'Adhocfee.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,51,'Adhocfee.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,52,'Adhocfee.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,53,'Student.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,54,'Student.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,55,'Student.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,56,'Student.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,57,'ProcessFee.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,58,'ProcessFee.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,59,'ProcessFee.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,60,'ProcessFee.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,61,'Report.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,62,'Report.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,63,'Report.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,64,'Report.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
-- (2,65,'AcademicYear.Create',1,'2017-11-03 14:06:07',NULL,NULL),
-- (2,66,'AcademicYear.Read',1,'2017-11-03 14:06:07',NULL,NULL),
-- (2,67,'AcademicYear.Update',1,'2017-11-03 14:06:07',NULL,NULL),
-- (2,68,'AcademicYear.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,69,'Feeplanassociation.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(2,70,'Feeplanassociation.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(2,71,'Feeplanassociation.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(2,72,'Feeplanassociation.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(2,73,'Invoice.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(2,74,'Invoice.Update',1,'2017-11-03 13:56:01',NULL,NULL);
/*!40000 ALTER TABLE `rolepermissiondetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES 
(1,1,'Administrator','$2a$10$E4I8lp4oaHAwbvjG1H7UHuveBSCxtoz78OQVZFl8M9buVENkyOBRK',NULL,'espl@eternussolutions.com',NULL,0,0,1,1,1,NULL,NULL,0,1,'2017-11-06 16:02:16',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping events for database 'schoolfeesystem'
--

--
-- Dumping routines for database 'schoolfeesystem'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-08 12:35:15
