-- CREATE DATABASE  IF NOT EXISTS `feemgmt` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `feemgmt`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--

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

--
-- Table structure for table `academicyear`
--

DROP TABLE IF EXISTS `academicyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academicyear` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `schoolId` bigint(20) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `academicYear` varchar(50) NOT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schoolId_startDate_endDate_UNIQUE` (`schoolId`,`startDate`,`endDate`),
  KEY `FK_AcademicYear_School_idx` (`schoolId`),
  CONSTRAINT `FK_AcademicYear_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `academicyear` AUTO_INCREMENT = 1;
--
-- Table structure for table `accesstoken`
--

DROP TABLE IF EXISTS `accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesstoken` (
  `id` varchar(255) NOT NULL,
  `ttl` int(11) DEFAULT NULL,
  `scopes` text,
  `created` datetime DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acl`
--

DROP TABLE IF EXISTS `acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `model` varchar(45) NOT NULL,
  `property` varchar(45) DEFAULT NULL,
  `accessType` varchar(45) NOT NULL,
  `permission` varchar(45) NOT NULL,
  `principalType` varchar(45) NOT NULL,
  `principalId` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=712 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `acl` AUTO_INCREMENT = 1;
--
-- Table structure for table `addhocfee`
--

DROP TABLE IF EXISTS `addhocfee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addhocfee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `schoolId` bigint(20) NOT NULL,
  `addhocFeeName` varchar(50) NOT NULL,
  `addhocFeeDescription` varchar(100) DEFAULT NULL,
  `dueDate` datetime NOT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schoolId_addhocFeeName` (`schoolId`,`addhocFeeName`),
  KEY `FK_AddhocFee_School_idx` (`schoolId`),
  CONSTRAINT `FK_AddhocFee_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `addhocfee` AUTO_INCREMENT = 1;
--
-- Table structure for table `addhocfeedetails`
--

DROP TABLE IF EXISTS `addhocfeedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addhocfeedetails` (
  `id` bigint(20) NOT NULL  AUTO_INCREMENT,
  `addhocFeeId` bigint(20) NOT NULL,
  `categoryId` bigint(20) NOT NULL,
  `classId` bigint(20) NOT NULL,
  `divisionId` bigint(20) DEFAULT NULL,
  `addhocFeeCharges` decimal(18,2) NOT NULL,
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addHocFee_category_class_division` (`addhocFeeId`,`categoryId`,`classId`,`divisionId`),
  KEY `FK_AddhockFeeDetails_AddhocFee_idx` (`addhocFeeId`),
  KEY `FK_AddhockFeeDetails_Category_idx` (`categoryId`),
  KEY `FK_AddhockFeeDetails_Class_idx` (`classId`),
  KEY `FK_AddhockFeeDetails_Dvision_idx` (`divisionId`),
  CONSTRAINT `FK_AddhockFeeDetails_AddhocFee` FOREIGN KEY (`addhocFeeId`) REFERENCES `addhocfee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_AddhockFeeDetails_Category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_AddhockFeeDetails_Class` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_AddhockFeeDetails_Dvision` FOREIGN KEY (`divisionId`) REFERENCES `division` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `addhocfeedetails` AUTO_INCREMENT = 1;
--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `boardName` varchar(50) NOT NULL,
  `boardDescription` varchar(100) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `boardName_UNIQUE` (`boardName`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `board` AUTO_INCREMENT = 1;
--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(50) NOT NULL,
  `categoryDescription` varchar(50) DEFAULT NULL,
  `categoryCode` varchar(24) NOT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categoryName_UNIQUE` (`categoryName`),
  UNIQUE KEY `categoryCode_UNIQUE` (`categoryCode`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `category` AUTO_INCREMENT = 1;
--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `schoolId` bigint(20) DEFAULT NULL,
  `className` varchar(50) DEFAULT NULL,
  `classCode` varchar(24) NOT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_className` (`schoolId`,`className`),
  UNIQUE KEY `school_classCode` (`schoolId`,`classCode`),
  KEY `FK_Class_School_idx` (`schoolId`),
  CONSTRAINT `FK_Class_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `class` AUTO_INCREMENT = 1;
--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `division` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `classId` bigint(20) NOT NULL,
  `schoolId` bigint(20) NOT NULL,
  `divisionName` varchar(50) NOT NULL,
  `divisionCode` varchar(24) NOT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_class_divisionName` (`schoolId`,`classId`,`divisionName`),
  UNIQUE KEY `school_class_divisionCode_UNIQUE` (`schoolId`,`classId`,`divisionCode`),
  KEY `FK_Division_Class_idx` (`classId`),
  KEY `FK_Division_School_idx` (`schoolId`),
  CONSTRAINT `FK_Division_Class` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Division_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `division` AUTO_INCREMENT = 1;
--
-- Table structure for table `feehead`
--

DROP TABLE IF EXISTS `feehead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feehead` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `schoolId` bigint(20) NOT NULL,
  `frequencyId` bigint(20) NOT NULL,
  `feeHeadName` varchar(50) NOT NULL,
  `feeHeadDescription` varchar(100) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_feeHeadName` (`schoolId`,`feeHeadName`),
  KEY `FK_FeeHeads_Frequency_idx` (`frequencyId`),
  KEY `FK_FeeHeads_School_idx` (`schoolId`),
  CONSTRAINT `FK_FeeHeads_Frequency` FOREIGN KEY (`frequencyId`) REFERENCES `frequency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_FeeHeads_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `feehead` AUTO_INCREMENT = 1;
--
-- Table structure for table `feeplan`
--

DROP TABLE IF EXISTS `feeplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feeplan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `schoolId` bigint(20) NOT NULL,
  `classId` bigint(20) NOT NULL,
  `categoryId` bigint(20) NOT NULL,
  `feePlanName` varchar(50) NOT NULL,
  `feePlanDescription` varchar(100) DEFAULT NULL,
  `effectiveFrom` datetime NOT NULL,
  `effectiveTo` datetime NOT NULL,
  `academicYear` varchar(50) NOT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_school_feePlan` (`schoolId`,`feePlanName`),
  KEY `FK_FeePlan_School_idx` (`schoolId`),
  KEY `FK_FeePlan_Class_idx` (`classId`),
  KEY `FK_FeePlan_Category_idx` (`categoryId`),
  CONSTRAINT `FK_FeePlan_Category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_FeePlan_Class` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_FeePlan_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `feeplan` AUTO_INCREMENT = 1;
--
-- Table structure for table `feeplanheaddetails`
--

DROP TABLE IF EXISTS `feeplanheaddetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feeplanheaddetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `feePlanId` bigint(20) NOT NULL,
  `feeHeadId` bigint(20) NOT NULL,
  `feeCharges` decimal(18,2) NOT NULL,
  `dueDate` datetime NOT NULL,
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `feePlan_feeHead` (`feePlanId`,`feeHeadId`),
  KEY `FK_FeePlanDetails_FeePlan_idx` (`feePlanId`),
  KEY `FK_FeePlanDetails_FeeHead_idx` (`feeHeadId`),
  CONSTRAINT `FK_FeePlanDetails_FeeHead` FOREIGN KEY (`feeHeadId`) REFERENCES `feehead` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_FeePlanDetails_FeePlan` FOREIGN KEY (`feePlanId`) REFERENCES `feeplan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `feeplanheaddetails` AUTO_INCREMENT = 1;
--
-- Table structure for table `frequency`
--

DROP TABLE IF EXISTS `frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `frequencyName` varchar(50) NOT NULL,
  `frequencyValue` int(11) NOT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `frequencyName_UNIQUE` (`frequencyName`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `frequency` AUTO_INCREMENT = 1;
--
-- Table structure for table `institute`
--

DROP TABLE IF EXISTS `institute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `instituteName` varchar(100) NOT NULL,
  `instituteDescription` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instituteName_UNIQUE` (`instituteName`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `institute` AUTO_INCREMENT = 1;
--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(50) NOT NULL,
  `menuParentId` bigint(20) DEFAULT NULL,
  `logicalSequence` int(11) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menuName_UNIQUE` (`menuName`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `menu` AUTO_INCREMENT = 1;
--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menuId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  `permissionName` varchar(50) NOT NULL,
  `modelName` varchar(50) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleId_permissionName_UNIQE` (`roleId`,`permissionName`),
  KEY `FK_Permission_Menu_idx` (`menuId`),
  KEY `FK_Permission_Menu_idx1` (`roleId`),
  CONSTRAINT `FK_Permission_Menu` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Permission_Role` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `permission` AUTO_INCREMENT = 1;
--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `schoolId` bigint(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `displayName` varchar(50) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_role_UNIQUE` (`schoolId`,`name`),
  KEY `FK_Role_School_idx` (`schoolId`),
  CONSTRAINT `FK_Role_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `role` AUTO_INCREMENT = 1;
--
-- Table structure for table `rolemapping`
--

DROP TABLE IF EXISTS `rolemapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolemapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principalType` varchar(45) NOT NULL DEFAULT 'USER',
  `principalId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usermapping_idx` (`principalId`),
  KEY `roleMapping_idx` (`roleId`),
  CONSTRAINT `roleMapping` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usermapping` FOREIGN KEY (`principalId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `rolemapping` AUTO_INCREMENT = 1;
--
-- Table structure for table `rolemenudetails`
--

DROP TABLE IF EXISTS `rolemenudetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolemenudetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleId` bigint(20) NOT NULL,
  `menuId` bigint(20) NOT NULL,
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_menu_UNIQUE` (`roleId`,`menuId`),
  KEY `FK_RoleMenuAction_Role_idx` (`roleId`),
  KEY `FK_RoleMenuAction_Menu_idx` (`menuId`),
  CONSTRAINT `FK_RoleMenuAction_Menu` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_RoleMenuAction_Role` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `rolemenudetails` AUTO_INCREMENT = 1;
--
-- Table structure for table `rolepermissiondetails`
--

DROP TABLE IF EXISTS `rolepermissiondetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolepermissiondetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleId` bigint(20) NOT NULL,
  `permissionId` bigint(20) NOT NULL,
  `permissionName` varchar(50) NOT NULL,
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_permission_UNIQUE` (`roleId`,`permissionId`),
  KEY `FK_RolePermission_Role_idx` (`roleId`),
  KEY `FK_RolePermission_Permission_idx` (`permissionId`),
  CONSTRAINT `FK_RolePermission_Permission` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_RolePermission_Role` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1651 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `rolepermissiondetails` AUTO_INCREMENT = 1;
--
-- Table structure for table `roleschooldetails`
--

DROP TABLE IF EXISTS `roleschooldetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleschooldetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleId` bigint(20) NOT NULL,
  `schoolId` bigint(20) NOT NULL,
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_school_UNIQUE` (`roleId`,`schoolId`),
  KEY `FK_UserSchoolDetails_School_idx` (`schoolId`),
  KEY `FK_UserSchoolDetails_User_idx` (`roleId`),
  CONSTRAINT `FK_RoleSchoolDetails_Role` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_RoleSchoolDetails_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `roleschooldetails` AUTO_INCREMENT = 1;
--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `instituteId` bigint(20) NOT NULL,
  `boardId` bigint(20) NOT NULL,
  `schoolName` varchar(100) NOT NULL,
  `schoolCode` varchar(50) NOT NULL,
  `schoolEmail` varchar(20) DEFAULT NULL,
  `schoolPhone` varchar(20) DEFAULT NULL,
  `schoolAddress` varchar(500) DEFAULT NULL,
  `schoolCity` varchar(50) DEFAULT NULL,
  `schoolState` varchar(50) DEFAULT NULL,
  `schoolCountry` varchar(50) DEFAULT NULL,
  `schoolLogo` varchar(50) DEFAULT NULL,
  `schoolHeader` varchar(50) NOT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schoolName_UNIQUE` (`schoolName`),
  UNIQUE KEY `schoolCode_UNIQUE` (`schoolCode`),
  KEY `FK_School_Institute_idx` (`instituteId`),
  KEY `FK_School_Board_idx` (`boardId`),
  CONSTRAINT `FK_School_Board` FOREIGN KEY (`boardId`) REFERENCES `board` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_School_Institute` FOREIGN KEY (`instituteId`) REFERENCES `institute` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `school` AUTO_INCREMENT = 1;
--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `schoolId` bigint(20) NOT NULL,
  `categoryId` bigint(20) NOT NULL,
  `classId` bigint(20) NOT NULL,
  `divisionId` bigint(20) DEFAULT NULL,
  `zoneId` bigint(20) DEFAULT NULL,
  `gRNumber` varchar(50) DEFAULT NULL,
  `studentCode` varchar(24) NOT NULL,
  `studentFirstName` varchar(50) NOT NULL,
  `studentMiddleName` varchar(50) NOT NULL,
  `studentLastName` varchar(50) NOT NULL,
  `studentGender` varchar(10) NOT NULL,
  `fatherFirstName` varchar(50) DEFAULT NULL,
  `fatherLastName` varchar(50) DEFAULT NULL,
  `fatherMobile` varchar(20) DEFAULT NULL,
  `motherFirstName` varchar(50) DEFAULT NULL,
  `motherLastName` varchar(50) DEFAULT NULL,
  `motherMobile` varchar(20) DEFAULT NULL,
  `guardianFirstName` varchar(50) DEFAULT NULL,
  `guardianLastName` varchar(50) DEFAULT NULL,
  `guardianMobile` varchar(20) DEFAULT NULL,
  `studentDateOfBirth` date DEFAULT NULL,
  `dateOfJoining` date DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `cast` varchar(50) DEFAULT NULL,
  `bloodGroup` varchar(20) DEFAULT NULL,
  `academicYear` varchar(20) NOT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_studentCode_UNIQUE` (`schoolId`,`studentCode`),
  KEY `FK_Student_School_idx` (`schoolId`),
  KEY `FK_Student_Category_idx` (`categoryId`),
  KEY `FK_Student_Class_idx` (`classId`),
  KEY `FK_Student_Division_idx` (`divisionId`),
  KEY `FK_Student_Zone_idx` (`zoneId`),
  CONSTRAINT `FK_Student_Category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_Class` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_Division` FOREIGN KEY (`divisionId`) REFERENCES `division` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_Zone` FOREIGN KEY (`zoneId`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `student` AUTO_INCREMENT = 1;
--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleId` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `failedPasswordAttemptCount` int(11) DEFAULT '0',
  `isBolocked` tinyint(1) DEFAULT '0',
  `isActivate` tinyint(1) DEFAULT '0',
  `isPasswordChanged` tinyint(1) DEFAULT '0',
  `emailVerified` tinyint(1) DEFAULT '0',
  `verificationToken` varchar(140) DEFAULT NULL,
  `realm` varchar(50) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UserName_UNIQUE` (`username`),
  KEY `FK_User_Role_idx` (`roleId`),
  CONSTRAINT `FK_User_Role` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `user` AUTO_INCREMENT = 1;
--
-- Table structure for table `userschooldetails`
--

DROP TABLE IF EXISTS `userschooldetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userschooldetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `schoolId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_school_UNIQUE` (`userId`,`schoolId`),
  KEY `FK_UserSchool_School_idx` (`schoolId`),
  KEY `FK_UserSchool_User_idx` (`userId`),
  CONSTRAINT `FK_UserSchool_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_UserSchool_User` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `userschooldetails` AUTO_INCREMENT = 1;
--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `schoolId` bigint(20) NOT NULL,
  `frequencyId` bigint(20) NOT NULL,
  `zoneCode` varchar(24) NOT NULL,
  `zoneDescription` varchar(100) DEFAULT NULL,
  `zoneCost` decimal(18,2) NOT NULL,
  `dueDate` date NOT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_zoneCode_UNIQUE` (`schoolId`,`zoneCode`),
  KEY `FK_TransportZone_School_idx` (`schoolId`),
  KEY `FK_Zone_Frequency_idx` (`frequencyId`),
  CONSTRAINT `FK_Zone_Frequency` FOREIGN KEY (`frequencyId`) REFERENCES `frequency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Zone_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE `zone` AUTO_INCREMENT = 1;


-- ======================= Default Data===============================================

--
-- Dumping data for table `acl`
--

LOCK TABLES `acl` WRITE;
/*!40000 ALTER TABLE `acl` DISABLE KEYS */;

-- Deny
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Transport', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Addhocfee', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', '*', '*', 'DENY', 'ROLE', '$everyone');

INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Userschooldetails', '*', '*', 'DENY', 'ROLE', '$everyone');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__get__permission', 'READ', 'ALLOW', 'ROLE', '$authenticated');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Userschooldetails', '*', '*', 'ALLOW', 'ROLE', '$authenticated');

-- Allow for  SuperAdmin
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Transport', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Addhocfee', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Permission', 'find', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');

INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Transport', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Addhocfee', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Permission', 'findById', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');

INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Transport', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Addhocfee', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');


INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Transport', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Addhocfee', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');

INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Transport', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Addhocfee', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');

INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'createUser', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'updateUser', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');

-- Count
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Transport', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Addhocfee', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Permission', 'count', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');

-- Soft Delete
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Institute', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Board', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Transport', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Addhocfee', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SuperAdmin');

-- School Get
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Students', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolYear', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolUsers', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolInstitute', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolDivision', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolClass', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolBoard', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Roles', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');

-- Scholl Get by Id
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Students', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolYear', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolUsers', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolInstitute', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolDivision', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolClass', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolBoard', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Roles', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');

-- School Count
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Students', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolYear', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolUsers', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolInstitute', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolDivision', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolClass', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolBoard', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Roles', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');

-- School Create
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__Students', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolYear', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolUsers', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolInstitute', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolDivision', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolClass', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolBoard', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__Roles', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');

-- School UPDATE
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__Students', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolYear', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolUsers', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolInstitute', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolDivision', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolClass', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolBoard', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__Roles', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');

-- Sudents GET
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentCategory', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentClass', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentDivision', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentSchool', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');

-- Classes
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', '__get__ClassSchool', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');

-- Divisions
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', '__get__DivisionSchool', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
--  RoleMenu
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__get__rolemenu', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__findById__rolemenu', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__findById__rolemenu', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__updateById__rolemenu', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- ========================================================== Allow for  SchoolAdmin=============================================================================================

INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Transport', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Addhocfee', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Permission', 'find', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Transport', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Addhocfee', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Permission', 'findById', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Transport', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Addhocfee', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'create', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');

INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Transport', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Addhocfee', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'updateAttributes', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');

INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Transport', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Addhocfee', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'destroyById', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');

INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('User', 'createUser', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'updateUser', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- Count
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Transport', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Addhocfee', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Permission', 'count', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- Soft Delete
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('user', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Frequency', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
-- INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Category', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feehead', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Feeplan', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Transport', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Addhocfee', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('ProcessFee', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Report', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Academicyear', 'deleteRecord', 'EXECUTE', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- School GET
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Students', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolYear', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolUsers', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolInstitute', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolDivision', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolClass', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__SchoolBoard', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__get__Roles', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- School GET/{ID}
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Students', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolYear', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolUsers', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolInstitute', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolDivision', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolClass', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__SchoolBoard', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__findById__Roles', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- School Count
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Students', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolYear', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolUsers', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolInstitute', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolDivision', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolClass', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__SchoolBoard', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__count__Roles', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- School Create 
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__Students', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolYear', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolUsers', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolInstitute', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolDivision', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolClass', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__SchoolBoard', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__create__Roles', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- School UPDATE
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__Students', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolYear', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolUsers', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolInstitute', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolDivision', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolClass', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__SchoolBoard', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('School', '__updateById__Roles', 'WRITE', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- Sudents GET
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentCategory', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentClass', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentDivision', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Student', '__get__StudentSchool', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- Classes
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Class', '__get__ClassSchool', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');

-- Divisions
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('Division', '__get__DivisionClass', 'READ', 'ALLOW', 'ROLE', 'SchoolAdmin');
--  RoleMenu
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__get__rolemenu', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__findById__rolemenu', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__findById__rolemenu', 'READ', 'ALLOW', 'ROLE', 'SuperAdmin');
INSERT INTO `feemgmt`.`acl` (`model`, `property`, `accessType`, `permission`, `principalType`, `principalId`) VALUES ('role', '__updateById__rolemenu', 'WRITE', 'ALLOW', 'ROLE', 'SuperAdmin');
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

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category`(
`categoryName`,
`categoryDescription`,
`categoryCode`,
`isDelete`,
`createdBy`,
`createdOn`,
`updatedBy`,
`updatedOn`) VALUES 
('General','General Category','Genral',0,1,'2017-11-06 12:32:49',NULL,NULL),
('Staff','Staff Category','Staff',0,1,'2017-11-06 12:32:49',NULL,NULL),
('Management','Management Category','Management',0,1,'2017-11-06 12:32:49',NULL,NULL),
('RTE','RTE Category','RTE',0,1,'2017-11-06 12:32:49',NULL,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

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
('Quarterly',3,0,1,'2017-11-06 12:35:41',NULL,NULL),
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
(13,'AddHoc Fee',0,13,0,1,'2017-11-03 15:12:09',NULL,NULL),
(14,'Student Management',0,14,0,1,'2017-11-03 15:12:09',NULL,NULL),
(15,'Process Fee',0,15,0,1,'2017-11-03 15:12:09',NULL,NULL),
(16,'Reports',0,16,0,1,'2017-11-03 15:12:09',NULL,NULL),
(17,'AcademicYear',0,17,0,1,'2017-11-03 12:49:35',NULL,NULL),
(18,'Permission',0,18,0,1,'2017-11-03 12:49:35',NULL,NULL);
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
(12,1,'Transport.Create','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),
(12,1,'Transport.Read','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),
(12,1,'Transport.Update','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),
(12,1,'Transport.Delete','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,1,'Addhocfee.Create','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,1,'Addhocfee.Read','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,1,'Addhocfee.Update','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,1,'Addhocfee.Delete','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
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
-- (9,2,'Category.Create','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),
-- (9,2,'Category.Read','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),
-- (9,2,'Category.Update','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),
-- (9,2,'Category.Delete','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),
(10,2,'Feehead.Create','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),
(10,2,'Feehead.Read','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),
(10,2,'Feehead.Update','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),
(10,2,'Feehead.Delete','Feehead',0,1,'2017-11-03 16:11:24',NULL,NULL),
(11,2,'Feeplan.Create','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),
(11,2,'Feeplan.Read','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),
(11,2,'Feeplan.Update','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),
(11,2,'Feeplan.Delete','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),
(12,2,'Transport.Create','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),
(12,2,'Transport.Read','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),
(12,2,'Transport.Update','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),
(12,2,'Transport.Delete','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,2,'Addhocfee.Create','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,2,'Addhocfee.Read','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,2,'Addhocfee.Update','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
(13,2,'Addhocfee.Delete','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),
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
(17,2,'AcademicYear.Create','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),
(17,2,'AcademicYear.Read','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),
(17,2,'AcademicYear.Update','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),
(17,2,'AcademicYear.Delete','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL);

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
(2,4,1,'2017-11-03 14:03:33',NULL,NULL),
(2,5,1,'2017-11-03 14:03:33',NULL,NULL),
-- (2,6,1,'2017-11-03 14:03:33',NULL,NULL),
(2,7,1,'2017-11-03 14:03:33',NULL,NULL),
(2,8,1,'2017-11-03 14:03:33',NULL,NULL),
-- (2,9,1,'2017-11-03 14:03:33',NULL,NULL),
(2,10,1,'2017-11-03 14:03:33',NULL,NULL),
(2,11,1,'2017-11-03 14:03:33',NULL,NULL),
(2,12,1,'2017-11-03 14:03:33',NULL,NULL),
(2,13,1,'2017-11-03 14:03:33',NULL,NULL),
(2,14,1,'2017-11-03 14:03:33',NULL,NULL),
(2,15,1,'2017-11-03 14:03:33',NULL,NULL),
(2,16,1,'2017-11-03 14:03:33',NULL,NULL),
(2,17,1,'2017-11-03 14:03:33',NULL,NULL);
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
(1,45,'Transport.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,46,'Transport.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,47,'Transport.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,48,'Transport.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
(1,49,'Addhocfee.Create',1,'2017-11-03 13:56:01',NULL,NULL),
(1,50,'Addhocfee.Read',1,'2017-11-03 13:56:01',NULL,NULL),
(1,51,'Addhocfee.Update',1,'2017-11-03 13:56:01',NULL,NULL),
(1,52,'Addhocfee.Delete',1,'2017-11-03 13:56:01',NULL,NULL),
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
-- (2,33,'Category.Create',1,'2017-11-03 14:06:07',NULL,NULL),
-- (2,34,'Category.Read',1,'2017-11-03 14:06:07',NULL,NULL),
-- (2,35,'Category.Update',1,'2017-11-03 14:06:07',NULL,NULL),
-- (2,36,'Category.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,37,'Feehead.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,38,'Feehead.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,39,'Feehead.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,40,'Feehead.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,41,'Feeplan.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,42,'Feeplan.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,43,'Feeplan.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,44,'Feeplan.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,45,'Transport.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,46,'Transport.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,47,'Transport.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,48,'Transport.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
(2,49,'Addhocfee.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,50,'Addhocfee.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,51,'Addhocfee.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,52,'Addhocfee.Delete',1,'2017-11-03 14:06:07',NULL,NULL),
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
(2,65,'AcademicYear.Create',1,'2017-11-03 14:06:07',NULL,NULL),
(2,66,'AcademicYear.Read',1,'2017-11-03 14:06:07',NULL,NULL),
(2,67,'AcademicYear.Update',1,'2017-11-03 14:06:07',NULL,NULL),
(2,68,'AcademicYear.Delete',1,'2017-11-03 14:06:07',NULL,NULL);
/*!40000 ALTER TABLE `rolepermissiondetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES 
(1,1,'Administrator','$2a$10$E4I8lp4oaHAwbvjG1H7UHuveBSCxtoz78OQVZFl8M9buVENkyOBRK',NULL,'sharmabarkha973@gmail.com',NULL,0,0,1,1,1,NULL,NULL,0,1,'2017-11-06 16:02:16',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'feemgmt'
--

--
-- Dumping routines for database 'feemgmt'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-17 11:37:10
