CREATE DATABASE  IF NOT EXISTS `schoolfeesystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `schoolfeesystem`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
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

--
-- Table structure for table `addhocfeedetails`
--

DROP TABLE IF EXISTS `addhocfeedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addhocfeedetails` (
  `id` bigint(20) NOT NULL,
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

--
-- Table structure for table `feeplanheaddetails`
--

DROP TABLE IF EXISTS `feeplanheaddetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feeplanheaddetails` (
  `id` bigint(20) NOT NULL,
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

-- Dump completed on 2017-11-17 11:37:10
