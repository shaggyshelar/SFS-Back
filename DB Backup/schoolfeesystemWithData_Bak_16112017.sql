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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academicyear`
--

LOCK TABLES `academicyear` WRITE;
/*!40000 ALTER TABLE `academicyear` DISABLE KEYS */;
INSERT INTO `academicyear` VALUES (1,22,'2017-11-08','2018-11-07','2017-18',0,1,'2017-11-08 10:16:07',0,'2017-11-08 10:16:07'),(2,22,'2018-11-08','2019-11-07','2018-19',0,1,'2017-11-08 10:16:07',0,'2017-11-08 10:16:07'),(3,22,'2019-11-08','2020-11-07','2019-20',1,1,'2017-11-08 10:16:07',2,'2017-11-16 08:03:54'),(4,22,'2021-11-08','2022-11-07','2021-22',0,1,'2017-11-12 09:45:00',1,'2017-11-12 10:37:27'),(11,70,'2041-11-12','2042-11-21','2042',0,1,'2017-11-13 10:39:14',1,'2017-11-13 10:43:32'),(18,22,'2017-11-14','2017-11-28','2017',1,1,'2017-11-13 11:24:45',1,'2017-11-13 14:17:48'),(22,22,'2017-11-08','2018-09-08','2017 - 18',0,2,'2017-11-15 11:43:11',NULL,NULL),(23,24,'2017-11-15','2018-11-15','2017 - 18',1,4,'2017-11-15 13:36:06',4,'2017-11-15 13:36:15'),(24,22,'2017-11-18','2018-11-29','2017 - 18',0,2,'2017-11-16 08:03:47',NULL,NULL),(25,24,'2017-11-16','2018-11-14','2017-18',1,40,'2017-11-16 12:33:12',40,'2017-11-16 12:46:46'),(26,24,'2017-11-30','2018-11-29','2017-18',0,40,'2017-11-16 12:38:22',40,'2017-11-16 12:41:41'),(27,24,'2017-12-04','2018-12-04','2017-18',0,40,'2017-11-16 12:38:40',NULL,NULL),(28,24,'2018-11-29','2019-12-30','2018-19',0,40,'2017-11-16 12:42:54',40,'2017-11-16 12:43:38');
/*!40000 ALTER TABLE `academicyear` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `accesstoken`
--

LOCK TABLES `accesstoken` WRITE;
/*!40000 ALTER TABLE `accesstoken` DISABLE KEYS */;
INSERT INTO `accesstoken` VALUES ('2MGUIGDP8lxpwz1IXLijLuz6bKyTZyLSI6Kx66dX0qWVrzpfODn6XMciuxPRZ9hp',1209600,NULL,'2017-11-16 12:45:19',1),('5F2HW1O5eTYhhxzyD1wF7UgtAbK5r9DhkoFPJ1pD0CG9wG8pG1BUSVxR8CGmsxTQ',1209600,NULL,'2017-11-16 10:19:53',1),('5iBJvWMQZs3SOf2O57eMWMCKl609DEFWq1P8bbJERfOxBR00WSO2vJigEFNiMpCg',1209600,NULL,'2017-11-16 12:42:42',1),('6KxmOwRO2GcP1MdAkVZipOswjU6Kp9iKD6FomxnNdgMX9RnDwsRuEizt3uSbsPUq',1209600,NULL,'2017-11-16 09:38:38',20),('6Lz5CSwjCc1Chr3BvMLIxOLSt21rhstOINABzrYfe95pClzKz49Nh1yyWCSGmBO8',1209600,NULL,'2017-11-16 10:22:54',20),('7J1g9iMOyB78VshnzG7wldiSuqbmFNmiQppjEdKgK3mMpQcsBgukyvDmwfCoVIGN',1209600,NULL,'2017-11-16 09:56:05',1),('92cY97gAcNvWWlsZOGtabqWfG8FPtznD0FhkhnE0gisRfCTHy1mzJDkBie4HjJUe',1209600,NULL,'2017-11-16 11:53:23',20),('AcwFDfe6Bb0zHCWH8DpQ6RNhZrkJzLo0CTrd5ivaKxKwl9tCAINgAZijY8xxaFio',1209600,NULL,'2017-11-16 08:47:04',44),('ANKzbEHZSmczve9cf2zvTKMvI8Y9Ifvumj5KxI9wNGPF1R9XhHHeGE4lvpeKHRg0',1209600,NULL,'2017-11-16 10:54:31',1),('bGlxehDSBKKBadRSEsZbyWHxMRqeKxbmRBMNSf3Fab4s3L7N0PzcqqFOq81Vp1eH',1209600,NULL,'2017-11-16 09:58:46',20),('CNorJxJccHD97GYUjb2wLXXGnOfe1AGenPPZZWCiOMpOi9BwUz6Mqs3V1fUDpLQz',1209600,NULL,'2017-11-16 08:49:12',44),('Dhrf91SOdKo07R6VrKG6130dMr9mwTUq7SUQYl1ADtiOElBzWnoWKPhVKPdOO4yr',1209600,NULL,'2017-11-16 06:53:01',1),('drHfztAXgDxftSmRwH2KBDUovssBxZLOEcfdCMPHvo5tztQAj6FpPo4NMlVf74MZ',1209600,NULL,'2017-11-16 10:22:04',2),('eLX6Vsf8ObiItBm1c4TKFqEjEy8lQnOGnZEsmpOYPqwOcCCq6AJkek9EjObKGdX4',1209600,NULL,'2017-11-16 13:22:00',2),('EYLAie69SFSZflLJ7vtk8WwyenAcOk1ES0OWKIqrevPp3toBCV4yCxlcrtHWzP8W',1209600,NULL,'2017-11-16 09:43:45',2),('EZDIFVwzZQ8NMrKQCj7h1kKZNoHC5uYUclk15Tcqu2L1vRb6HENcwMMwLWXSyY37',1209600,NULL,'2017-11-16 11:46:27',20),('fYTPKsPII5GtCcK6mMXtAjj4RUb0BmfeXfRWpH4F2QolLA7OFaHqToGMBJw7WiOB',1209600,NULL,'2017-11-16 09:23:32',1),('gABRctHQ4HdzK3dDhiySxIwRyTEXwdbuBquxGgnh0tvVP7NiblR3a5mLcDeVS2OX',1209600,NULL,'2017-11-16 09:38:42',1),('H069P34wdyIByus7vRpueLce2oqmAAfYdvtYTE7TU6MrJ1JOdIKikDknqQomDZgD',1209600,NULL,'2017-11-16 12:09:51',1),('HGid3izXk2ByFG8q5mc9YZQzhKtASpkJ3rguekf15l64sFySQAQevO6KwtgH65U4',1209600,NULL,'2017-11-16 12:31:44',1),('JMpCjIMtyOTp3X9EX6QCgPCnig2DRDggE8vfr1mDmKLpe5D61ojNcx3K22nldkxC',1209600,NULL,'2017-11-16 09:44:24',1),('oGomkRC3hn8fjyqbEFNApLXscVDA0896igcdxYyIw6iNErED3oXPi45UqucEd41o',1209600,NULL,'2017-11-16 09:42:46',1),('pKCCoh7sCX1lcgncdtqgHwXQCbwNA3A5MMa3pPZ5kMGbkWk8uRslvXBKl4Tg4VQz',1209600,NULL,'2017-11-16 09:42:56',2),('QMDkRsCXrt26FEgAqKYm4ERcZnY4zIOn35vkwdAlbr5q6IMoPCQiM7vCKBNRjp8j',1209600,NULL,'2017-11-16 10:03:20',2),('qMTIHCs0SdQiG2bIFgzlOSWMfGYeEGHQWmLEyuaBhS0ENneRjsBs00id8XhYEkME',1209600,NULL,'2017-11-16 12:09:02',1),('RLiEFF3r6gL4FRm0b8LDIBQLuRIfTW2bchwPmoOE7ro026BzXeNxoigHcUdyrs3x',1209600,NULL,'2017-11-16 13:33:55',1),('rxCUoc4W9ubJEyy7ZFYWrtDOJtFD2I955TnVlrWgqNiIbRnp0N9y41a6hP8TlLVW',1209600,NULL,'2017-11-16 11:52:51',1),('S3bAERKW7xTGM8Ab6xvix1D627Wa9A1718GOHgaQBoTYhZUaFLoBmFosWC4W73Qb',1209600,NULL,'2017-11-16 08:50:52',44),('sBLTPOW4G4hGQxiUojLuuAKnM9nKJzETH4GMhRx7BmGbc0uaGB7liDEa2nvO3kHZ',1209600,NULL,'2017-11-16 08:48:25',1),('usODliymYX45G5BdNBK2ukDgfOPUmq9aBgDCWrCRNalEJUxVzKlBqiLANC9nhvLj',1209600,NULL,'2017-11-16 09:59:44',1),('UXHeMBCkmqRDJ0YflNbLJTeJ22mvCF3wb8kLYidhxEm9FxUhV9KDN3fMc5FiwFyJ',1209600,NULL,'2017-11-16 09:24:09',20),('WCwRyf1D0mJ6sZiwfVWt2DlIDMKr8AkD9MBEq1LjPX69BPGED51kXUKmTraFgl7c',1209600,NULL,'2017-11-16 08:46:17',44),('wPonQIp01Yf3y5F817GadJ7v4yso52IVfLD57aGlspXSYdKfapTmUrFlaxQ5XxrE',1209600,NULL,'2017-11-16 09:59:04',1);
/*!40000 ALTER TABLE `accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=676 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl`
--

LOCK TABLES `acl` WRITE;
/*!40000 ALTER TABLE `acl` DISABLE KEYS */;
INSERT INTO `acl` VALUES (13,'Institute','find','READ','DENY','ROLE','$everyone'),(14,'Board','find','READ','DENY','ROLE','$everyone'),(15,'School','find','READ','DENY','ROLE','$everyone'),(16,'role','find','READ','DENY','ROLE','$everyone'),(17,'user','find','READ','DENY','ROLE','$everyone'),(18,'Frequency','find','READ','DENY','ROLE','$everyone'),(19,'Class','find','READ','DENY','ROLE','$everyone'),(20,'Division','find','READ','DENY','ROLE','$everyone'),(21,'Category','find','READ','DENY','ROLE','$everyone'),(22,'Feehead','find','READ','DENY','ROLE','$everyone'),(23,'Feeplan','find','READ','DENY','ROLE','$everyone'),(24,'Transport','find','READ','DENY','ROLE','$everyone'),(25,'Addhocfee','find','READ','DENY','ROLE','$everyone'),(26,'Student','find','READ','DENY','ROLE','$everyone'),(27,'ProcessFee','find','READ','DENY','ROLE','$everyone'),(28,'Report','find','READ','DENY','ROLE','$everyone'),(29,'Academicyear','find','READ','DENY','ROLE','$everyone'),(30,'Institute','findById','READ','DENY','ROLE','$everyone'),(31,'Board','findById','READ','DENY','ROLE','$everyone'),(32,'School','findById','READ','DENY','ROLE','$everyone'),(33,'role','findById','READ','DENY','ROLE','$everyone'),(34,'user','findById','READ','DENY','ROLE','$everyone'),(35,'Frequency','findById','READ','DENY','ROLE','$everyone'),(36,'Class','findById','READ','DENY','ROLE','$everyone'),(37,'Division','findById','READ','DENY','ROLE','$everyone'),(38,'Category','findById','READ','DENY','ROLE','$everyone'),(39,'Feehead','findById','READ','DENY','ROLE','$everyone'),(40,'Feeplan','findById','READ','DENY','ROLE','$everyone'),(41,'Transport','findById','READ','DENY','ROLE','$everyone'),(42,'Addhocfee','findById','READ','DENY','ROLE','$everyone'),(43,'Student','findById','READ','DENY','ROLE','$everyone'),(44,'ProcessFee','findById','READ','DENY','ROLE','$everyone'),(45,'Report','findById','READ','DENY','ROLE','$everyone'),(46,'Academicyear','findById','READ','DENY','ROLE','$everyone'),(47,'Institute','create','WRITE','DENY','ROLE','$everyone'),(48,'Board','create','WRITE','DENY','ROLE','$everyone'),(49,'School','create','WRITE','DENY','ROLE','$everyone'),(50,'role','create','WRITE','DENY','ROLE','$everyone'),(51,'user','create','WRITE','DENY','ROLE','$everyone'),(52,'Frequency','create','WRITE','DENY','ROLE','$everyone'),(53,'Class','create','WRITE','DENY','ROLE','$everyone'),(54,'Division','create','WRITE','DENY','ROLE','$everyone'),(55,'Category','create','WRITE','DENY','ROLE','$everyone'),(56,'Feehead','create','WRITE','DENY','ROLE','$everyone'),(57,'Feeplan','create','WRITE','DENY','ROLE','$everyone'),(58,'Transport','create','WRITE','DENY','ROLE','$everyone'),(59,'Addhocfee','create','WRITE','DENY','ROLE','$everyone'),(60,'Student','create','WRITE','DENY','ROLE','$everyone'),(61,'ProcessFee','create','WRITE','DENY','ROLE','$everyone'),(62,'Report','create','WRITE','DENY','ROLE','$everyone'),(63,'Academicyear','create','WRITE','DENY','ROLE','$everyone'),(64,'Institute','updateAttributes','WRITE','DENY','ROLE','$everyone'),(65,'Board','updateAttributes','WRITE','DENY','ROLE','$everyone'),(66,'School','updateAttributes','WRITE','DENY','ROLE','$everyone'),(67,'role','updateAttributes','WRITE','DENY','ROLE','$everyone'),(68,'user','updateAttributes','WRITE','DENY','ROLE','$everyone'),(69,'Frequency','updateAttributes','WRITE','DENY','ROLE','$everyone'),(70,'Class','updateAttributes','WRITE','DENY','ROLE','$everyone'),(71,'Division','updateAttributes','WRITE','DENY','ROLE','$everyone'),(72,'Category','updateAttributes','WRITE','DENY','ROLE','$everyone'),(73,'Feehead','updateAttributes','WRITE','DENY','ROLE','$everyone'),(74,'Feeplan','updateAttributes','WRITE','DENY','ROLE','$everyone'),(75,'Transport','updateAttributes','WRITE','DENY','ROLE','$everyone'),(76,'Addhocfee','updateAttributes','WRITE','DENY','ROLE','$everyone'),(77,'Student','updateAttributes','WRITE','DENY','ROLE','$everyone'),(78,'ProcessFee','updateAttributes','WRITE','DENY','ROLE','$everyone'),(79,'Report','updateAttributes','WRITE','DENY','ROLE','$everyone'),(80,'Academicyear','updateAttributes','WRITE','DENY','ROLE','$everyone'),(81,'Institute','destroyById','WRITE','DENY','ROLE','$everyone'),(82,'Board','destroyById','WRITE','DENY','ROLE','$everyone'),(83,'School','destroyById','WRITE','DENY','ROLE','$everyone'),(84,'role','destroyById','WRITE','DENY','ROLE','$everyone'),(85,'user','destroyById','WRITE','DENY','ROLE','$everyone'),(86,'Frequency','destroyById','WRITE','DENY','ROLE','$everyone'),(87,'Class','destroyById','WRITE','DENY','ROLE','$everyone'),(88,'Division','destroyById','WRITE','DENY','ROLE','$everyone'),(89,'Category','destroyById','WRITE','DENY','ROLE','$everyone'),(90,'Feehead','destroyById','WRITE','DENY','ROLE','$everyone'),(91,'Feeplan','destroyById','WRITE','DENY','ROLE','$everyone'),(92,'Transport','destroyById','WRITE','DENY','ROLE','$everyone'),(93,'Addhocfee','destroyById','WRITE','DENY','ROLE','$everyone'),(94,'Student','destroyById','WRITE','DENY','ROLE','$everyone'),(95,'ProcessFee','destroyById','WRITE','DENY','ROLE','$everyone'),(96,'Report','destroyById','WRITE','DENY','ROLE','$everyone'),(97,'Academicyear','destroyById','WRITE','DENY','ROLE','$everyone'),(98,'user','createUser','EXECUTE','DENY','ROLE','$everyone'),(99,'Institute','find','READ','ALLOW','ROLE','SuperAdmin'),(100,'Board','find','READ','ALLOW','ROLE','SuperAdmin'),(101,'School','find','READ','ALLOW','ROLE','SuperAdmin'),(102,'role','find','READ','ALLOW','ROLE','SuperAdmin'),(103,'user','find','READ','ALLOW','ROLE','SuperAdmin'),(104,'Frequency','find','READ','ALLOW','ROLE','SuperAdmin'),(105,'Class','find','READ','ALLOW','ROLE','SuperAdmin'),(106,'Division','find','READ','ALLOW','ROLE','SuperAdmin'),(107,'Category','find','READ','ALLOW','ROLE','SuperAdmin'),(108,'Feehead','find','READ','ALLOW','ROLE','SuperAdmin'),(109,'Feeplan','find','READ','ALLOW','ROLE','SuperAdmin'),(110,'Transport','find','READ','ALLOW','ROLE','SuperAdmin'),(111,'Addhocfee','find','READ','ALLOW','ROLE','SuperAdmin'),(112,'Student','find','READ','ALLOW','ROLE','SuperAdmin'),(113,'ProcessFee','find','READ','ALLOW','ROLE','SuperAdmin'),(114,'Report','find','READ','ALLOW','ROLE','SuperAdmin'),(115,'Academicyear','find','READ','ALLOW','ROLE','SuperAdmin'),(116,'Institute','findById','READ','ALLOW','ROLE','SuperAdmin'),(117,'Board','findById','READ','ALLOW','ROLE','SuperAdmin'),(118,'School','findById','READ','ALLOW','ROLE','SuperAdmin'),(119,'role','findById','READ','ALLOW','ROLE','SuperAdmin'),(120,'user','findById','READ','ALLOW','ROLE','SuperAdmin'),(121,'Frequency','findById','READ','ALLOW','ROLE','SuperAdmin'),(122,'Class','findById','READ','ALLOW','ROLE','SuperAdmin'),(123,'Division','findById','READ','ALLOW','ROLE','SuperAdmin'),(124,'Category','findById','READ','ALLOW','ROLE','SuperAdmin'),(125,'Feehead','findById','READ','ALLOW','ROLE','SuperAdmin'),(126,'Feeplan','findById','READ','ALLOW','ROLE','SuperAdmin'),(127,'Transport','findById','READ','ALLOW','ROLE','SuperAdmin'),(128,'Addhocfee','findById','READ','ALLOW','ROLE','SuperAdmin'),(129,'Student','findById','READ','ALLOW','ROLE','SuperAdmin'),(130,'ProcessFee','findById','READ','ALLOW','ROLE','SuperAdmin'),(131,'Report','findById','READ','ALLOW','ROLE','SuperAdmin'),(132,'Academicyear','findById','READ','ALLOW','ROLE','SuperAdmin'),(133,'Institute','create','WRITE','ALLOW','ROLE','SuperAdmin'),(134,'Board','create','WRITE','ALLOW','ROLE','SuperAdmin'),(135,'School','create','WRITE','ALLOW','ROLE','SuperAdmin'),(136,'role','create','WRITE','ALLOW','ROLE','SuperAdmin'),(137,'user','create','WRITE','ALLOW','ROLE','SuperAdmin'),(138,'Frequency','create','WRITE','ALLOW','ROLE','SuperAdmin'),(139,'Class','create','WRITE','ALLOW','ROLE','SuperAdmin'),(140,'Division','create','WRITE','ALLOW','ROLE','SuperAdmin'),(141,'Category','create','WRITE','ALLOW','ROLE','SuperAdmin'),(142,'Feehead','create','WRITE','ALLOW','ROLE','SuperAdmin'),(143,'Feeplan','create','WRITE','ALLOW','ROLE','SuperAdmin'),(144,'Transport','create','WRITE','ALLOW','ROLE','SuperAdmin'),(145,'Addhocfee','create','WRITE','ALLOW','ROLE','SuperAdmin'),(146,'Student','create','WRITE','ALLOW','ROLE','SuperAdmin'),(147,'ProcessFee','create','WRITE','ALLOW','ROLE','SuperAdmin'),(148,'Report','create','WRITE','ALLOW','ROLE','SuperAdmin'),(149,'Academicyear','create','WRITE','ALLOW','ROLE','SuperAdmin'),(150,'Institute','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(151,'Board','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(152,'School','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(153,'role','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(154,'user','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(155,'Frequency','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(156,'Class','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(157,'Division','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(158,'Category','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(159,'Feehead','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(160,'Feeplan','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(161,'Transport','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(162,'Addhocfee','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(163,'Student','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(164,'ProcessFee','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(165,'Report','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(166,'Academicyear','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(167,'Institute','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(168,'Board','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(169,'School','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(170,'role','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(171,'user','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(172,'Frequency','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(173,'Class','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(174,'Division','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(175,'Category','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(176,'Feehead','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(177,'Feeplan','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(178,'Transport','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(179,'Addhocfee','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(180,'Student','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(181,'ProcessFee','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(182,'Report','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(183,'Academicyear','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(184,'user','createUser','EXECUTE','ALLOW','ROLE','SuperAdmin'),(185,'role','find','READ','ALLOW','ROLE','SchoolAdmin'),(186,'user','find','READ','ALLOW','ROLE','SchoolAdmin'),(187,'Frequency','find','READ','ALLOW','ROLE','SchoolAdmin'),(188,'Class','find','READ','ALLOW','ROLE','SchoolAdmin'),(189,'Division','find','READ','ALLOW','ROLE','SchoolAdmin'),(190,'Category','find','READ','ALLOW','ROLE','SchoolAdmin'),(191,'Feehead','find','READ','ALLOW','ROLE','SchoolAdmin'),(192,'Feeplan','find','READ','ALLOW','ROLE','SchoolAdmin'),(193,'Transport','find','READ','ALLOW','ROLE','SchoolAdmin'),(194,'Addhocfee','find','READ','ALLOW','ROLE','SchoolAdmin'),(195,'Student','find','READ','ALLOW','ROLE','SchoolAdmin'),(196,'ProcessFee','find','READ','ALLOW','ROLE','SchoolAdmin'),(197,'Report','find','READ','ALLOW','ROLE','SchoolAdmin'),(198,'Academicyear','find','READ','ALLOW','ROLE','SchoolAdmin'),(199,'role','findById','READ','ALLOW','ROLE','SchoolAdmin'),(200,'user','findById','READ','ALLOW','ROLE','SchoolAdmin'),(201,'Frequency','findById','READ','ALLOW','ROLE','SchoolAdmin'),(202,'Class','findById','READ','ALLOW','ROLE','SchoolAdmin'),(203,'Division','findById','READ','ALLOW','ROLE','SchoolAdmin'),(204,'Category','findById','READ','ALLOW','ROLE','SchoolAdmin'),(205,'Feehead','findById','READ','ALLOW','ROLE','SchoolAdmin'),(206,'Feeplan','findById','READ','ALLOW','ROLE','SchoolAdmin'),(207,'Transport','findById','READ','ALLOW','ROLE','SchoolAdmin'),(208,'Addhocfee','findById','READ','ALLOW','ROLE','SchoolAdmin'),(209,'Student','findById','READ','ALLOW','ROLE','SchoolAdmin'),(210,'ProcessFee','findById','READ','ALLOW','ROLE','SchoolAdmin'),(211,'Report','findById','READ','ALLOW','ROLE','SchoolAdmin'),(212,'Academicyear','findById','READ','ALLOW','ROLE','SchoolAdmin'),(213,'role','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(214,'user','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(215,'Frequency','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(216,'Class','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(217,'Division','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(218,'Category','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(219,'Feehead','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(220,'Feeplan','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(221,'Transport','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(222,'Addhocfee','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(223,'Student','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(224,'ProcessFee','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(225,'Report','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(226,'Academicyear','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(227,'role','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(228,'user','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(229,'Frequency','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(230,'Class','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(231,'Division','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(232,'Category','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(233,'Feehead','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(234,'Feeplan','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(235,'Transport','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(236,'Addhocfee','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(237,'Student','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(238,'ProcessFee','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(239,'Report','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(240,'Academicyear','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(241,'role','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(242,'user','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(243,'Frequency','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(244,'Class','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(245,'Division','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(246,'Category','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(247,'Feehead','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(248,'Feeplan','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(249,'Transport','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(250,'Addhocfee','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(251,'Student','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(252,'ProcessFee','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(253,'Report','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(254,'Academicyear','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(256,'user','find','READ','ALLOW','ROLE','SchoolAdmin'),(257,'user','findById','READ','ALLOW','ROLE','SchoolAdmin'),(260,'user','createUser','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(261,'Student','find','READ','ALLOW','ROLE','Staff22'),(262,'Student','findById','READ','ALLOW','ROLE','Staff22'),(273,'Student','find','READ','ALLOW','ROLE','devRole122'),(274,'Student','findById','READ','ALLOW','ROLE','devRole122'),(275,'user','updateUser','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(276,'role','count','EXECUTE','ALLOW','ROLE','SuperAdmin'),(283,'Student','create','WRITE','ALLOW','ROLE','devRole0122'),(284,'Student','find','READ','ALLOW','ROLE','devRole0122'),(285,'Student','findById','READ','ALLOW','ROLE','devRole0122'),(286,'Student','updateAttributes','WRITE','ALLOW','ROLE','devRole0122'),(288,'Student','destroyById','WRITE','ALLOW','ROLE','devRole0122'),(289,'user','count','READ','ALLOW','ROLE','SuperAdmin'),(290,'user','count','READ','ALLOW','ROLE','SchoolAdmin'),(291,'Student','find','READ','ALLOW','ROLE','devStaff22'),(292,'Student','findById','READ','ALLOW','ROLE','devStaff22'),(293,'user','updateUser','EXECUTE','ALLOW','ROLE','SuperAdmin'),(294,'School','find','READ','ALLOW','ROLE','Suyash_School125'),(295,'School','findById','READ','ALLOW','ROLE','Suyash_School125'),(296,'School','create','WRITE','ALLOW','ROLE','Suyash_School125'),(297,'Student','create','WRITE','ALLOW','ROLE','devStaff22'),(300,'Institute','find','READ','ALLOW','ROLE','Suyash_School125'),(301,'Institute','findById','READ','ALLOW','ROLE','Suyash_School125'),(302,'Board','find','READ','ALLOW','ROLE','Suyash_School125'),(303,'Board','findById','READ','ALLOW','ROLE','Suyash_School125'),(304,'Student','updateAttributes','WRITE','ALLOW','ROLE','devStaff22'),(310,'user','updateUser','EXECUTE','ALLOW','ROLE','devRole22'),(316,'Userschooldetails','count','READ','ALLOW','ROLE','SchoolAdmin'),(317,'user','__count__schools','READ','ALLOW','ROLE','SchoolAdmin'),(318,'Institute','count','READ','ALLOW','ROLE','devStaff22'),(330,'Institute','count','READ','DENY','ROLE','$everyone'),(331,'Board','count','READ','DENY','ROLE','$everyone'),(332,'School','count','READ','DENY','ROLE','$everyone'),(333,'Role','count','READ','DENY','ROLE','$everyone'),(334,'user','count','READ','DENY','ROLE','$everyone'),(335,'Frequency','count','READ','DENY','ROLE','$everyone'),(336,'Class','count','READ','DENY','ROLE','$everyone'),(337,'Division','count','READ','DENY','ROLE','$everyone'),(338,'Category','count','READ','DENY','ROLE','$everyone'),(339,'Feehead','count','READ','DENY','ROLE','$everyone'),(340,'Feeplan','count','READ','DENY','ROLE','$everyone'),(341,'Transport','count','READ','DENY','ROLE','$everyone'),(342,'Addhocfee','count','READ','DENY','ROLE','$everyone'),(343,'Student','count','READ','DENY','ROLE','$everyone'),(344,'ProcessFee','count','READ','DENY','ROLE','$everyone'),(345,'Report','count','READ','DENY','ROLE','$everyone'),(346,'Academicyear','count','READ','DENY','ROLE','$everyone'),(347,'Institute','count','READ','ALLOW','ROLE','SuperAdmin'),(348,'Board','count','READ','ALLOW','ROLE','SuperAdmin'),(349,'School','count','READ','ALLOW','ROLE','SuperAdmin'),(350,'Role','count','READ','ALLOW','ROLE','SuperAdmin'),(351,'user','count','READ','ALLOW','ROLE','SuperAdmin'),(352,'Frequency','count','READ','ALLOW','ROLE','SuperAdmin'),(353,'Class','count','READ','ALLOW','ROLE','SuperAdmin'),(354,'Division','count','READ','ALLOW','ROLE','SuperAdmin'),(355,'Category','count','READ','ALLOW','ROLE','SuperAdmin'),(356,'Feehead','count','READ','ALLOW','ROLE','SuperAdmin'),(357,'Feeplan','count','READ','ALLOW','ROLE','SuperAdmin'),(358,'Transport','count','READ','ALLOW','ROLE','SuperAdmin'),(359,'Addhocfee','count','READ','ALLOW','ROLE','SuperAdmin'),(360,'Student','count','READ','ALLOW','ROLE','SuperAdmin'),(361,'ProcessFee','count','READ','ALLOW','ROLE','SuperAdmin'),(362,'Report','count','READ','ALLOW','ROLE','SuperAdmin'),(363,'Academicyear','count','READ','ALLOW','ROLE','SuperAdmin'),(364,'Institute','count','READ','ALLOW','ROLE','SchoolAdmin'),(365,'Board','count','READ','ALLOW','ROLE','SchoolAdmin'),(366,'School','count','READ','ALLOW','ROLE','SchoolAdmin'),(367,'role','count','READ','ALLOW','ROLE','SchoolAdmin'),(368,'user','count','READ','ALLOW','ROLE','SchoolAdmin'),(369,'Frequency','count','READ','ALLOW','ROLE','SchoolAdmin'),(370,'Class','count','READ','ALLOW','ROLE','SchoolAdmin'),(371,'Division','count','READ','ALLOW','ROLE','SchoolAdmin'),(372,'Category','count','READ','ALLOW','ROLE','SchoolAdmin'),(373,'Feehead','count','READ','ALLOW','ROLE','SchoolAdmin'),(374,'Feeplan','count','READ','ALLOW','ROLE','SchoolAdmin'),(375,'Transport','count','READ','ALLOW','ROLE','SchoolAdmin'),(376,'Addhocfee','count','READ','ALLOW','ROLE','SchoolAdmin'),(377,'Student','count','READ','ALLOW','ROLE','SchoolAdmin'),(378,'ProcessFee','count','READ','ALLOW','ROLE','SchoolAdmin'),(379,'Report','count','READ','ALLOW','ROLE','SchoolAdmin'),(380,'Academicyear','count','READ','ALLOW','ROLE','SchoolAdmin'),(387,'AcademicYear','find','READ','ALLOW','ROLE','devRole0122'),(388,'AcademicYear','findById','READ','ALLOW','ROLE','devRole0122'),(389,'AcademicYear','count','READ','ALLOW','ROLE','devRole0122'),(390,'Permission','find','READ','DENY','ROLE','$everyone'),(391,'Menu','find','READ','DENY','ROLE','$everyone'),(392,'Permission','findById','READ','DENY','ROLE','$everyone'),(393,'Menu','findById','READ','DENY','ROLE','$everyone'),(394,'Permission','create','WRITE','DENY','ROLE','$everyone'),(395,'Menu','create','WRITE','DENY','ROLE','$everyone'),(396,'Permission','updateAttributes','WRITE','DENY','ROLE','$everyone'),(397,'Menu','updateAttributes','WRITE','DENY','ROLE','$everyone'),(398,'Permission','destroyById','WRITE','DENY','ROLE','$everyone'),(399,'Menu','destroyById','WRITE','DENY','ROLE','$everyone'),(400,'Permission','count','READ','DENY','ROLE','$everyone'),(401,'Menu','count','READ','DENY','ROLE','$everyone'),(402,'Permission','find','READ','ALLOW','ROLE','SuperAdmin'),(403,'Permission','findById','READ','ALLOW','ROLE','SuperAdmin'),(404,'Permission','find','READ','ALLOW','ROLE','SchoolAdmin'),(405,'Permission','findById','READ','ALLOW','ROLE','SchoolAdmin'),(406,'Permission','count','READ','ALLOW','ROLE','SuperAdmin'),(407,'Permission','count','READ','ALLOW','ROLE','SchoolAdmin'),(410,'Institute','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(411,'Board','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(412,'School','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(413,'role','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(414,'user','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(415,'Frequency','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(416,'Class','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(417,'Division','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(418,'Category','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(419,'Feehead','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(420,'Feeplan','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(421,'Transport','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(422,'Addhocfee','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(423,'Student','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(424,'ProcessFee','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(425,'Report','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(426,'Academicyear','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(427,'Institute','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(428,'Board','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(429,'School','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(430,'role','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(431,'user','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(432,'Frequency','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(433,'Class','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(434,'Division','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(435,'Category','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(436,'Feehead','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(437,'Feeplan','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(438,'Transport','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(439,'Addhocfee','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(440,'Student','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(441,'ProcessFee','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(442,'Report','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(443,'Academicyear','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(444,'role','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(445,'user','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(446,'Frequency','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(447,'Class','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(448,'Division','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(449,'Category','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(450,'Feehead','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(451,'Feeplan','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(452,'Transport','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(453,'Addhocfee','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(454,'Student','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(455,'ProcessFee','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(456,'Report','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(457,'Academicyear','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(458,'Role','destroyById','WRITE','ALLOW','ROLE','Staff22'),(460,'Frequency','count','READ','ALLOW','ROLE','test12345'),(461,'Class','count','READ','ALLOW','ROLE','test12345'),(462,'Division','count','READ','ALLOW','ROLE','test12345'),(493,'role','__get__permission','READ','DENY','ROLE','$everyone'),(494,'role','__get__permission','READ','ALLOW','ROLE','$authenticated'),(501,'Feehead','find','READ','ALLOW','ROLE','devRole0124'),(502,'Feehead','findById','READ','ALLOW','ROLE','devRole0124'),(503,'Feehead','count','READ','ALLOW','ROLE','devRole0124'),(504,'Student','find','READ','ALLOW','ROLE','devRole0124'),(505,'Student','findById','READ','ALLOW','ROLE','devRole0124'),(506,'Student','count','READ','ALLOW','ROLE','devRole0124'),(511,'Feehead','create','WRITE','ALLOW','ROLE','devRole0124'),(512,'Feehead','updateAttributes','WRITE','ALLOW','ROLE','devRole0124'),(522,'School','__get__Students','READ','DENY','ROLE','$everyone'),(523,'School','__get__SchoolYear','READ','DENY','ROLE','$everyone'),(524,'School','__get__SchoolUsers','READ','DENY','ROLE','$everyone'),(525,'School','__get__SchoolInstitute','READ','DENY','ROLE','$everyone'),(526,'School','__get__SchoolDivision','READ','DENY','ROLE','$everyone'),(527,'School','__get__SchoolClass','READ','DENY','ROLE','$everyone'),(528,'School','__get__SchoolBoard','READ','DENY','ROLE','$everyone'),(529,'School','__get__Roles','READ','DENY','ROLE','$everyone'),(530,'School','__get__Students','READ','ALLOW','ROLE','SchoolAdmin'),(531,'School','__get__SchoolYear','READ','ALLOW','ROLE','SchoolAdmin'),(532,'School','__get__SchoolUsers','READ','ALLOW','ROLE','SchoolAdmin'),(533,'School','__get__SchoolInstitute','READ','ALLOW','ROLE','SchoolAdmin'),(534,'School','__get__SchoolDivision','READ','ALLOW','ROLE','SchoolAdmin'),(535,'School','__get__SchoolClass','READ','ALLOW','ROLE','SchoolAdmin'),(536,'School','__get__SchoolBoard','READ','ALLOW','ROLE','SchoolAdmin'),(537,'School','__get__Roles','READ','ALLOW','ROLE','SchoolAdmin'),(538,'School','__get__Students','READ','ALLOW','ROLE','SuperAdmin'),(539,'School','__get__SchoolYear','READ','ALLOW','ROLE','SuperAdmin'),(540,'School','__get__SchoolUsers','READ','ALLOW','ROLE','SuperAdmin'),(541,'School','__get__SchoolInstitute','READ','ALLOW','ROLE','SuperAdmin'),(542,'School','__get__SchoolDivision','READ','ALLOW','ROLE','SuperAdmin'),(543,'School','__get__SchoolClass','READ','ALLOW','ROLE','SuperAdmin'),(544,'School','__get__SchoolBoard','READ','ALLOW','ROLE','SuperAdmin'),(545,'School','__get__Roles','READ','ALLOW','ROLE','SuperAdmin'),(546,'School','__findById__Students','READ','DENY','ROLE','$everyone'),(547,'School','__findById__SchoolYear','READ','DENY','ROLE','$everyone'),(548,'School','__findById__SchoolUsers','READ','DENY','ROLE','$everyone'),(549,'School','__findById__SchoolInstitute','READ','DENY','ROLE','$everyone'),(550,'School','__findById__SchoolDivision','READ','DENY','ROLE','$everyone'),(551,'School','__findById__SchoolClass','READ','DENY','ROLE','$everyone'),(552,'School','__findById__SchoolBoard','READ','DENY','ROLE','$everyone'),(553,'School','__findById__Roles','READ','DENY','ROLE','$everyone'),(554,'School','__findById__Students','READ','ALLOW','ROLE','SchoolAdmin'),(555,'School','__findById__SchoolYear','READ','ALLOW','ROLE','SchoolAdmin'),(556,'School','__findById__SchoolUsers','READ','ALLOW','ROLE','SchoolAdmin'),(557,'School','__findById__SchoolInstitute','READ','ALLOW','ROLE','SchoolAdmin'),(558,'School','__findById__SchoolDivision','READ','ALLOW','ROLE','SchoolAdmin'),(559,'School','__findById__SchoolClass','READ','ALLOW','ROLE','SchoolAdmin'),(560,'School','__findById__SchoolBoard','READ','ALLOW','ROLE','SchoolAdmin'),(561,'School','__findById__Roles','READ','ALLOW','ROLE','SchoolAdmin'),(562,'School','__findById__Students','READ','ALLOW','ROLE','SuperAdmin'),(563,'School','__findById__SchoolYear','READ','ALLOW','ROLE','SuperAdmin'),(564,'School','__findById__SchoolUsers','READ','ALLOW','ROLE','SuperAdmin'),(565,'School','__findById__SchoolInstitute','READ','ALLOW','ROLE','SuperAdmin'),(566,'School','__findById__SchoolDivision','READ','ALLOW','ROLE','SuperAdmin'),(567,'School','__findById__SchoolClass','READ','ALLOW','ROLE','SuperAdmin'),(568,'School','__findById__SchoolBoard','READ','ALLOW','ROLE','SuperAdmin'),(569,'School','__findById__Roles','READ','ALLOW','ROLE','SuperAdmin'),(570,'School','__count__Students','READ','DENY','ROLE','$everyone'),(571,'School','__count__SchoolYear','READ','DENY','ROLE','$everyone'),(572,'School','__count__SchoolUsers','READ','DENY','ROLE','$everyone'),(573,'School','__count__SchoolInstitute','READ','DENY','ROLE','$everyone'),(574,'School','__count__SchoolDivision','READ','DENY','ROLE','$everyone'),(575,'School','__count__SchoolClass','READ','DENY','ROLE','$everyone'),(576,'School','__count__SchoolBoard','READ','DENY','ROLE','$everyone'),(577,'School','__count__Roles','READ','DENY','ROLE','$everyone'),(578,'School','__count__Students','READ','ALLOW','ROLE','SchoolAdmin'),(579,'School','__count__SchoolYear','READ','ALLOW','ROLE','SchoolAdmin'),(580,'School','__count__SchoolUsers','READ','ALLOW','ROLE','SchoolAdmin'),(581,'School','__count__SchoolInstitute','READ','ALLOW','ROLE','SchoolAdmin'),(582,'School','__count__SchoolDivision','READ','ALLOW','ROLE','SchoolAdmin'),(583,'School','__count__SchoolClass','READ','ALLOW','ROLE','SchoolAdmin'),(584,'School','__count__SchoolBoard','READ','ALLOW','ROLE','SchoolAdmin'),(585,'School','__count__Roles','READ','ALLOW','ROLE','SchoolAdmin'),(586,'School','__count__Students','READ','ALLOW','ROLE','SuperAdmin'),(587,'School','__count__SchoolYear','READ','ALLOW','ROLE','SuperAdmin'),(588,'School','__count__SchoolUsers','READ','ALLOW','ROLE','SuperAdmin'),(589,'School','__count__SchoolInstitute','READ','ALLOW','ROLE','SuperAdmin'),(590,'School','__count__SchoolDivision','READ','ALLOW','ROLE','SuperAdmin'),(591,'School','__count__SchoolClass','READ','ALLOW','ROLE','SuperAdmin'),(592,'School','__count__SchoolBoard','READ','ALLOW','ROLE','SuperAdmin'),(593,'School','__count__Roles','READ','ALLOW','ROLE','SuperAdmin'),(594,'School','__create__Students','WRITE','DENY','ROLE','$everyone'),(595,'School','__create__SchoolYear','WRITE','DENY','ROLE','$everyone'),(596,'School','__create__SchoolUsers','WRITE','DENY','ROLE','$everyone'),(597,'School','__create__SchoolInstitute','WRITE','DENY','ROLE','$everyone'),(598,'School','__create__SchoolDivision','WRITE','DENY','ROLE','$everyone'),(599,'School','__create__SchoolClass','WRITE','DENY','ROLE','$everyone'),(600,'School','__create__SchoolBoard','WRITE','DENY','ROLE','$everyone'),(601,'School','__create__Roles','WRITE','DENY','ROLE','$everyone'),(602,'School','__create__Students','WRITE','ALLOW','ROLE','SchoolAdmin'),(603,'School','__create__SchoolYear','WRITE','ALLOW','ROLE','SchoolAdmin'),(604,'School','__create__SchoolUsers','WRITE','ALLOW','ROLE','SchoolAdmin'),(605,'School','__create__SchoolInstitute','WRITE','ALLOW','ROLE','SchoolAdmin'),(606,'School','__create__SchoolDivision','WRITE','ALLOW','ROLE','SchoolAdmin'),(607,'School','__create__SchoolClass','WRITE','ALLOW','ROLE','SchoolAdmin'),(608,'School','__create__SchoolBoard','WRITE','ALLOW','ROLE','SchoolAdmin'),(609,'School','__create__Roles','WRITE','ALLOW','ROLE','SchoolAdmin'),(610,'School','__create__Students','WRITE','ALLOW','ROLE','SuperAdmin'),(611,'School','__create__SchoolYear','WRITE','ALLOW','ROLE','SuperAdmin'),(612,'School','__create__SchoolUsers','WRITE','ALLOW','ROLE','SuperAdmin'),(613,'School','__create__SchoolInstitute','WRITE','ALLOW','ROLE','SuperAdmin'),(614,'School','__create__SchoolDivision','WRITE','ALLOW','ROLE','SuperAdmin'),(615,'School','__create__SchoolClass','WRITE','ALLOW','ROLE','SuperAdmin'),(616,'School','__create__SchoolBoard','WRITE','ALLOW','ROLE','SuperAdmin'),(617,'School','__create__Roles','WRITE','ALLOW','ROLE','SuperAdmin'),(618,'School','__updateById__Students','WRITE','DENY','ROLE','$everyone'),(619,'School','__updateById__SchoolYear','WRITE','DENY','ROLE','$everyone'),(620,'School','__updateById__SchoolUsers','WRITE','DENY','ROLE','$everyone'),(621,'School','__updateById__SchoolInstitute','WRITE','DENY','ROLE','$everyone'),(622,'School','__updateById__SchoolDivision','WRITE','DENY','ROLE','$everyone'),(623,'School','__updateById__SchoolClass','WRITE','DENY','ROLE','$everyone'),(624,'School','__updateById__SchoolBoard','WRITE','DENY','ROLE','$everyone'),(625,'School','__updateById__Roles','WRITE','DENY','ROLE','$everyone'),(626,'School','__updateById__Students','WRITE','ALLOW','ROLE','SchoolAdmin'),(627,'School','__updateById__SchoolYear','WRITE','ALLOW','ROLE','SchoolAdmin'),(628,'School','__updateById__SchoolUsers','WRITE','ALLOW','ROLE','SchoolAdmin'),(629,'School','__updateById__SchoolInstitute','WRITE','ALLOW','ROLE','SchoolAdmin'),(630,'School','__updateById__SchoolDivision','WRITE','ALLOW','ROLE','SchoolAdmin'),(631,'School','__updateById__SchoolClass','WRITE','ALLOW','ROLE','SchoolAdmin'),(632,'School','__updateById__SchoolBoard','WRITE','ALLOW','ROLE','SchoolAdmin'),(633,'School','__updateById__Roles','WRITE','ALLOW','ROLE','SchoolAdmin'),(634,'School','__updateById__Students','WRITE','ALLOW','ROLE','SuperAdmin'),(635,'School','__updateById__SchoolYear','WRITE','ALLOW','ROLE','SuperAdmin'),(636,'School','__updateById__SchoolUsers','WRITE','ALLOW','ROLE','SuperAdmin'),(637,'School','__updateById__SchoolInstitute','WRITE','ALLOW','ROLE','SuperAdmin'),(638,'School','__updateById__SchoolDivision','WRITE','ALLOW','ROLE','SuperAdmin'),(639,'School','__updateById__SchoolClass','WRITE','ALLOW','ROLE','SuperAdmin'),(640,'School','__updateById__SchoolBoard','WRITE','ALLOW','ROLE','SuperAdmin'),(641,'School','__updateById__Roles','WRITE','ALLOW','ROLE','SuperAdmin'),(642,'School','__delete__Students','WRITE','DENY','ROLE','$everyone'),(643,'School','__delete__SchoolYear','WRITE','DENY','ROLE','$everyone'),(644,'School','__delete__SchoolUsers','WRITE','DENY','ROLE','$everyone'),(645,'School','__delete__SchoolInstitute','WRITE','DENY','ROLE','$everyone'),(646,'School','__delete__SchoolDivision','WRITE','DENY','ROLE','$everyone'),(647,'School','__delete__SchoolClass','WRITE','DENY','ROLE','$everyone'),(648,'School','__delete__SchoolBoard','WRITE','DENY','ROLE','$everyone'),(649,'School','__delete__Roles','WRITE','DENY','ROLE','$everyone'),(650,'School','__destroyById__Students','WRITE','DENY','ROLE','$everyone'),(651,'School','__destroyById__SchoolYear','WRITE','DENY','ROLE','$everyone'),(652,'School','__destroyById__SchoolUsers','WRITE','DENY','ROLE','$everyone'),(653,'School','__destroyById__SchoolInstitute','WRITE','DENY','ROLE','$everyone'),(654,'School','__destroyById__SchoolDivision','WRITE','DENY','ROLE','$everyone'),(655,'School','__destroyById__SchoolClass','WRITE','DENY','ROLE','$everyone'),(656,'School','__destroyById__SchoolBoard','WRITE','DENY','ROLE','$everyone'),(657,'School','__destroyById__Roles','WRITE','DENY','ROLE','$everyone'),(658,'Student','__get__StudentCategory','READ','DENY','ROLE','$everyone'),(659,'Student','__get__StudentClass','READ','DENY','ROLE','$everyone'),(660,'Student','__get__StudentDivision','READ','DENY','ROLE','$everyone'),(661,'Student','__get__StudentSchool','READ','DENY','ROLE','$everyone'),(662,'School','__get__StudentCategory','READ','ALLOW','ROLE','SchoolAdmin'),(663,'School','__get__StudentClass','READ','ALLOW','ROLE','SchoolAdmin'),(664,'School','__get__StudentDivision','READ','ALLOW','ROLE','SchoolAdmin'),(665,'School','__get__StudentSchool','READ','ALLOW','ROLE','SchoolAdmin'),(666,'School','__get__StudentCategory','READ','ALLOW','ROLE','SuperAdmin'),(667,'School','__get__StudentClass','READ','ALLOW','ROLE','SuperAdmin'),(668,'School','__get__StudentDivision','READ','ALLOW','ROLE','SuperAdmin'),(669,'School','__get__StudentSchool','READ','ALLOW','ROLE','SuperAdmin'),(670,'Class','*','*','DENY','ROLE','$everyone'),(671,'Class','__get__ClassSchool','READ','ALLOW','ROLE','SchoolAdmin'),(672,'Class','__get__ClassSchool','READ','ALLOW','ROLE','SuperAdmin'),(673,'Division','*','*','DENY','ROLE','$everyone'),(674,'Division','__get__DivisionClass','READ','ALLOW','ROLE','SchoolAdmin'),(675,'Division','__get__DivisionSchool','READ','ALLOW','ROLE','SuperAdmin');
/*!40000 ALTER TABLE `acl` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `addhocfee`
--

LOCK TABLES `addhocfee` WRITE;
/*!40000 ALTER TABLE `addhocfee` DISABLE KEYS */;
/*!40000 ALTER TABLE `addhocfee` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `addhocfeedetails`
--

LOCK TABLES `addhocfeedetails` WRITE;
/*!40000 ALTER TABLE `addhocfeedetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `addhocfeedetails` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'CBSC','CBSC Board',0,1,'2017-11-06 17:58:10',NULL,NULL),(2,'ICSC','ICSC Board',0,1,'2017-11-06 17:58:10',NULL,NULL),(3,'SSE','SSE Board',0,1,'2017-11-06 17:58:10',NULL,NULL),(4,'NA','Not Aaplicatble',0,1,'2017-11-06 17:58:10',NULL,NULL),(7,'Board1','Boarddesaa',1,1,'2017-11-10 12:17:52',1,'2017-11-13 07:16:58'),(8,'TestBoard','test',1,1,'2017-11-13 14:18:26',1,'2017-11-13 14:20:32'),(9,'TestBoard01','',1,1,'2017-11-13 14:38:06',1,'2017-11-13 14:38:17'),(12,'TestBoard02','test',0,1,'2017-11-14 08:50:02',NULL,NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'General','General Category','Genral',0,1,'2017-11-06 12:32:49',NULL,NULL),(2,'Staff','Staff Category','Staff',0,1,'2017-11-06 12:32:49',NULL,NULL),(3,'Management','Management Category','Management',0,1,'2017-11-06 12:32:49',NULL,NULL),(4,'RTE','RTE Category','RTE',0,1,'2017-11-06 12:32:49',NULL,NULL),(9,'Tewtr','test22','tst123',1,1,'2017-11-14 06:20:43',1,'2017-11-14 08:44:32'),(10,'test','test','test',0,1,'2017-11-16 07:24:44',NULL,NULL),(11,'t','t','t',1,1,'2017-11-16 07:24:53',1,'2017-11-16 07:25:00'),(12,'Open','Open','Open',0,1,'2017-11-16 12:09:21',NULL,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,22,'Class 1','C1',0,2,'2017-11-06 13:44:49',NULL,NULL),(2,22,'Class 2','C2',0,2,'2017-11-06 13:44:49',NULL,NULL),(3,22,'Class 3','C3',0,2,'2017-11-06 13:44:49',NULL,NULL),(4,22,'Class 4','C4',0,2,'2017-11-06 13:44:49',NULL,NULL),(5,22,'Class 5','C5',0,2,'2017-11-06 13:44:49',NULL,NULL),(6,22,'Class 6','C6',0,2,'2017-11-06 13:44:49',NULL,NULL),(7,22,'Class 7','C7',0,2,'2017-11-06 13:44:49',NULL,NULL),(8,22,'Class 8','C8',0,2,'2017-11-06 13:44:49',NULL,NULL),(9,22,'Class 9','C9',0,2,'2017-11-06 13:44:49',NULL,NULL),(10,22,'Class 10','C10',0,2,'2017-11-06 13:44:49',1,'2017-11-13 09:45:51'),(15,71,'test2','test2',1,1,'2017-11-13 09:43:27',1,'2017-11-13 10:13:40'),(18,23,'Class 1','Class 1',1,3,'2017-11-14 06:56:20',3,'2017-11-14 09:21:57'),(19,23,'test','test',1,3,'2017-11-14 10:50:28',3,'2017-11-14 10:54:19'),(24,23,'T1','Test1',0,3,'2017-11-15 05:11:49',NULL,NULL),(25,23,'T2','Test2',0,3,'2017-11-15 05:11:58',NULL,NULL);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,1,22,'Division A','D-A',0,2,'2017-11-06 13:44:49',NULL,NULL),(2,1,22,'Division B','D-B',0,2,'2017-11-06 13:44:49',NULL,NULL),(3,1,22,'Division C','D-C',0,2,'2017-11-06 13:44:49',NULL,NULL),(4,2,22,'Division A','D-A',0,2,'2017-11-06 13:44:49',NULL,NULL),(5,2,22,'Division B','D-B',0,2,'2017-11-06 13:44:49',NULL,NULL),(6,2,22,'Division C','D-C',0,2,'2017-11-06 13:44:49',NULL,NULL),(7,3,22,'Division A','D-A',0,2,'2017-11-06 13:44:49',NULL,NULL),(8,3,22,'Division B','D-B',0,2,'2017-11-06 13:44:49',NULL,NULL),(9,3,22,'Division C','D-C',0,2,'2017-11-06 13:44:49',NULL,NULL),(10,4,22,'Division A','D-A',0,2,'2017-11-06 13:44:49',NULL,NULL),(11,4,22,'Division B','D-B',0,2,'2017-11-06 13:44:49',NULL,NULL),(12,4,22,'Division C','D-C',0,2,'2017-11-06 13:44:49',NULL,NULL),(13,5,22,'Division A','D-A',0,2,'2017-11-06 13:44:49',NULL,NULL),(14,5,22,'Division B','D-B',0,2,'2017-11-06 13:44:49',NULL,NULL),(15,5,22,'Division C','D-C',0,2,'2017-11-06 13:44:49',NULL,NULL),(16,6,22,'Division A','D-A',0,2,'2017-11-06 13:44:49',NULL,NULL),(17,6,22,'Division B','D-B',0,2,'2017-11-06 13:44:49',NULL,NULL),(18,6,22,'Division C','D-C',0,2,'2017-11-06 13:44:49',NULL,NULL),(19,7,22,'Division A','D-A',0,2,'2017-11-06 13:44:49',NULL,NULL),(20,7,22,'Division B','D-B',0,2,'2017-11-06 13:44:49',NULL,NULL),(22,8,22,'Division A','D-A',0,2,'2017-11-06 13:44:49',NULL,NULL),(23,8,22,'Division B','D-B',0,2,'2017-11-06 13:44:49',NULL,NULL),(24,8,22,'Division C','D-C',0,2,'2017-11-06 13:44:49',NULL,NULL),(25,9,22,'Division A','D-A',0,2,'2017-11-06 13:44:49',NULL,NULL),(26,1,22,'Division BC','D-BC',0,2,'2017-11-06 13:44:49',1,'2017-11-10 15:08:14'),(27,9,22,'Division C','D-C',0,2,'2017-11-06 13:44:49',NULL,NULL),(28,10,22,'Division A','D-A',0,2,'2017-11-06 13:44:49',NULL,NULL),(29,10,22,'Division B','D-B',0,2,'2017-11-06 13:44:49',NULL,NULL),(30,10,22,'Division C','D-C',0,2,'2017-11-06 13:44:49',NULL,NULL),(32,19,23,'test','test',1,3,'2017-11-14 06:56:36',3,'2017-11-14 10:54:35'),(33,24,23,'D1','Division 1',0,3,'2017-11-15 05:12:23',NULL,NULL),(34,24,23,'D2','Division 2',0,3,'2017-11-15 05:12:39',NULL,NULL),(35,25,23,'D1','Division 3',0,3,'2017-11-15 05:12:55',NULL,NULL),(36,25,23,'Division ABC','Divi2',0,3,'2017-11-15 05:37:32',3,'2017-11-15 05:45:19'),(37,24,23,'test','test',1,3,'2017-11-15 05:37:46',3,'2017-11-15 05:38:30'),(38,25,23,'test1','test1',1,3,'2017-11-15 05:37:58',1,'2017-11-16 12:44:41');
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `feehead`
--

LOCK TABLES `feehead` WRITE;
/*!40000 ALTER TABLE `feehead` DISABLE KEYS */;
/*!40000 ALTER TABLE `feehead` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `feeplan`
--

LOCK TABLES `feeplan` WRITE;
/*!40000 ALTER TABLE `feeplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `feeplan` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `feeplanheaddetails`
--

LOCK TABLES `feeplanheaddetails` WRITE;
/*!40000 ALTER TABLE `feeplanheaddetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `feeplanheaddetails` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `frequency`
--

LOCK TABLES `frequency` WRITE;
/*!40000 ALTER TABLE `frequency` DISABLE KEYS */;
INSERT INTO `frequency` VALUES (1,'Monthly',12,0,1,'2017-11-06 12:35:41',1,'2017-11-13 11:52:12'),(2,'Quarterly',3,0,1,'2017-11-06 12:35:41',NULL,NULL),(3,'Half Yearly',2,0,1,'2017-11-06 12:35:41',NULL,NULL),(4,'Yearly',1,0,1,'2017-11-06 12:35:41',NULL,NULL),(5,'OneTime',1,0,1,'2017-11-06 12:35:41',1,'2017-11-14 08:56:28'),(7,'WWW',1,1,1,'2017-11-13 04:21:23',1,'2017-11-14 09:05:56'),(9,'r',17,1,1,'2017-11-14 05:48:34',1,'2017-11-14 08:43:06'),(10,'test',6,1,1,'2017-11-16 07:27:03',1,'2017-11-16 07:33:11'),(12,'test1',5,1,1,'2017-11-16 07:33:58',1,'2017-11-16 07:34:04');
/*!40000 ALTER TABLE `frequency` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `institute`
--

LOCK TABLES `institute` WRITE;
/*!40000 ALTER TABLE `institute` DISABLE KEYS */;
INSERT INTO `institute` VALUES (19,'Symbiosis Schools','Symbiosis Schools','9999999999','symbiosis@school.com','Pune',0,1,'2017-11-06 10:52:42',1,'2017-11-16 07:12:33'),(20,'Ryan International Schools','Ryan International Schools','9999999999','rayaninternational@schools.com','Pune',0,1,'2017-11-06 10:52:42',1,'2017-11-16 07:11:25'),(21,'Dayanand Anglo Vedic Public Schools','Dayanand Anglo Vedic Public Schools','9874563210','dayanand@schools.com','Pune',0,1,'2017-11-06 18:08:04',NULL,NULL),(25,'Tes','eee','123222222','','asdasdasd',1,1,'2017-11-09 13:22:05',1,'2017-11-14 08:50:53'),(26,'WWW Test123','WW','9175160232','abc@123.com','a\na',1,1,'2017-11-10 11:16:27',1,'2017-11-14 08:45:06'),(27,'St.Xaviers education ','Great campus, infrastructure, huge area availability, football turf, basketball courts','9762982700','xaviers@eml.com','3, Narveer Tanaji Malusare Rd, Vittalvadi, Narveer Tanaji Malusare Rd, Vittalvadi, Hingne Khurd, Pune, Maharashtra 411051',0,1,'2017-11-10 11:23:52',1,'2017-11-12 09:51:21'),(30,'asds','asds s','7894561321','asds@123.com','AASasdasd 1',0,1,'2017-11-10 11:39:19',1,'2017-11-12 12:19:24'),(31,'test123',NULL,'','abc@123.com','',0,1,'2017-11-12 12:27:41',1,'2017-11-16 10:16:47'),(32,'test12345',NULL,NULL,'123@123.com',NULL,0,1,'2017-11-12 12:29:55',1,'2017-11-16 10:17:30'),(33,'Test','tt','7894561230','asd@123.com','asda',0,1,'2017-11-13 09:58:43',NULL,NULL);
/*!40000 ALTER TABLE `institute` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Institures',0,1,0,1,'2017-11-03 15:12:09',NULL,NULL),(2,'Board',0,2,0,1,'2017-11-03 15:12:09',NULL,NULL),(3,'Schools',0,3,0,1,'2017-11-03 15:12:09',NULL,NULL),(4,'Role And Permissions',0,4,0,1,'2017-11-03 15:12:09',NULL,NULL),(5,'User Management',0,5,0,1,'2017-11-03 15:12:09',NULL,NULL),(6,'Frequency',0,6,0,1,'2017-11-03 15:12:09',NULL,NULL),(7,'Class',0,7,0,1,'2017-11-03 15:12:09',NULL,NULL),(8,'Division',0,8,0,1,'2017-11-03 15:12:09',NULL,NULL),(9,'Category',0,9,0,1,'2017-11-03 15:12:09',NULL,NULL),(10,'Fee Heads',0,10,0,1,'2017-11-03 15:12:09',NULL,NULL),(11,'Fee Plans',0,11,0,1,'2017-11-03 15:12:09',NULL,NULL),(12,'Zone',0,12,0,1,'2017-11-03 15:12:09',NULL,NULL),(13,'AddHoc Fee',0,13,0,1,'2017-11-03 15:12:09',NULL,NULL),(14,'Student Management',0,14,0,1,'2017-11-03 15:12:09',NULL,NULL),(15,'Process Fee',0,15,0,1,'2017-11-03 15:12:09',NULL,NULL),(16,'Reports',0,16,0,1,'2017-11-03 15:12:09',NULL,NULL),(17,'AcademicYear',0,17,0,1,'2017-11-03 12:49:35',NULL,NULL),(18,'Permission',0,18,0,1,'2017-11-13 12:22:49',NULL,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,1,1,'Institute.Create','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),(2,1,1,'Institute.Read','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),(3,1,1,'Institute.Update','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),(4,1,1,'Institute.Delete','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),(5,2,1,'Board.Create','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),(6,2,1,'Board.Read','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),(7,2,1,'Board.Update','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),(8,2,1,'Board.Delete','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),(9,3,1,'School.Create','School',0,1,'2017-11-03 15:52:26',NULL,NULL),(10,3,1,'School.Read','School',0,1,'2017-11-03 15:52:26',NULL,NULL),(11,3,1,'School.Update','School',0,1,'2017-11-03 15:52:26',NULL,NULL),(12,3,1,'School.Delete','School',0,1,'2017-11-03 15:52:26',NULL,NULL),(13,4,1,'Role.Create','role',0,1,'2017-11-03 15:52:26',NULL,NULL),(14,4,1,'Role.Read','role',0,1,'2017-11-03 15:52:26',NULL,NULL),(15,4,1,'Role.Update','role',0,1,'2017-11-03 15:52:26',NULL,NULL),(16,4,1,'Role.Delete','role',0,1,'2017-11-03 15:52:26',NULL,NULL),(17,5,1,'User.Create','user',0,1,'2017-11-03 15:52:26',NULL,NULL),(18,5,1,'User.Read','user',0,1,'2017-11-03 15:52:26',NULL,NULL),(19,5,1,'User.Update','user',0,1,'2017-11-03 15:52:26',NULL,NULL),(20,5,1,'User.Delete','user',0,1,'2017-11-03 15:52:26',NULL,NULL),(21,6,1,'Frequency.Create','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),(22,6,1,'Frequency.Read','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),(23,6,1,'Frequency.Update','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),(24,6,1,'Frequency.Delete','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),(25,7,1,'Class.Create','Class',0,1,'2017-11-03 15:52:26',NULL,NULL),(26,7,1,'Class.Read','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(27,7,1,'Class.Update','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(28,7,1,'Class.Delete','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(29,8,1,'Division.Create','Division',0,1,'2017-11-03 16:11:22',NULL,NULL),(30,8,1,'Division.Read','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),(31,8,1,'Division.Update','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),(32,8,1,'Division.Delete','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),(33,9,1,'Category.Create','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),(34,9,1,'Category.Read','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),(35,9,1,'Category.Update','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),(36,9,1,'Category.Delete','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),(37,10,1,'Feehead.Create','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(38,10,1,'Feehead.Read','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(39,10,1,'Feehead.Update','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(40,10,1,'Feehead.Delete','Feehead',0,1,'2017-11-03 16:11:24',NULL,NULL),(41,11,1,'Feeplan.Create','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(42,11,1,'Feeplan.Read','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(43,11,1,'Feeplan.Update','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(44,11,1,'Feeplan.Delete','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(45,12,1,'Transport.Create','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(46,12,1,'Transport.Read','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(47,12,1,'Transport.Update','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(48,12,1,'Transport.Delete','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(49,13,1,'Addhocfee.Create','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(50,13,1,'Addhocfee.Read','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(51,13,1,'Addhocfee.Update','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(52,13,1,'Addhocfee.Delete','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(53,14,1,'Student.Create','Student',0,1,'2017-11-03 16:11:24',NULL,NULL),(54,14,1,'Student.Read','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(55,14,1,'Student.Update','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(56,14,1,'Student.Delete','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(57,15,1,'ProcessFee.Create','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(58,15,1,'ProcessFee.Read','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(59,15,1,'ProcessFee.Update','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(60,15,1,'ProcessFee.Delete','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(61,16,1,'Report.Create','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(62,16,1,'Report.Read','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(63,16,1,'Report.Update','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(64,16,1,'Report.Delete','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(65,17,1,'AcademicYear.Create','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(66,17,1,'AcademicYear.Read','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(67,17,1,'AcademicYear.Update','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(68,17,1,'AcademicYear.Delete','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(73,7,2,'Class.Create','Class',0,1,'2017-11-03 15:52:26',NULL,NULL),(74,7,2,'Class.Read','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(75,7,2,'Class.Update','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(76,7,2,'Class.Delete','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(77,8,2,'Division.Create','Division',0,1,'2017-11-03 16:11:22',NULL,NULL),(78,8,2,'Division.Read','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),(79,8,2,'Division.Update','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),(80,8,2,'Division.Delete','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),(85,10,2,'Feehead.Create','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(86,10,2,'Feehead.Read','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(87,10,2,'Feehead.Update','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(88,10,2,'Feehead.Delete','Feehead',0,1,'2017-11-03 16:11:24',NULL,NULL),(89,11,2,'Feeplan.Create','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(90,11,2,'Feeplan.Read','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(91,11,2,'Feeplan.Update','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(92,11,2,'Feeplan.Delete','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(93,12,2,'Transport.Create','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(94,12,2,'Transport.Read','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(95,12,2,'Transport.Update','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(96,12,2,'Transport.Delete','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(97,13,2,'Addhocfee.Create','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(98,13,2,'Addhocfee.Read','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(99,13,2,'Addhocfee.Update','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(100,13,2,'Addhocfee.Delete','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(101,14,2,'Student.Create','Student',0,1,'2017-11-03 16:11:24',NULL,NULL),(102,14,2,'Student.Read','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(103,14,2,'Student.Update','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(104,14,2,'Student.Delete','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(105,15,2,'ProcessFee.Create','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(106,15,2,'ProcessFee.Read','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(107,15,2,'ProcessFee.Update','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(108,15,2,'ProcessFee.Delete','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(109,16,2,'Report.Create','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(110,16,2,'Report.Read','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(111,16,2,'Report.Update','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(112,16,2,'Report.Delete','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(113,17,2,'AcademicYear.Create','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(114,17,2,'AcademicYear.Read','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(115,17,2,'AcademicYear.Update','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(116,17,2,'AcademicYear.Delete','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,NULL,'SuperAdmin','Super Administration','SuperAdmin',0,1,'2017-11-03 16:14:10',NULL,NULL),(2,NULL,'SchoolAdmin','School Admin','SchoolAdmin',0,1,'2017-11-03 16:14:10',NULL,NULL),(8,22,'Staff22','Staff Role for Symbiosis  International  School, Pune','Staff',0,1,'2017-11-08 12:12:53',NULL,NULL),(9,22,'devRole22','dev','devRole',0,1,'2017-11-08 07:13:37',NULL,NULL),(10,22,'devRole1221','role','devRole11',0,1,'2017-11-08 12:03:13',20,'2017-11-09 15:05:32'),(11,22,'devRole0122','dev','devRole01',0,2,'2017-11-08 14:22:35',NULL,NULL),(12,22,'Staff_temp22','Staff_temp description','Staff_temp',0,20,'2017-11-09 12:06:43',NULL,NULL),(14,22,'devStaff22','dev1','devStaff',0,40,'2017-11-09 19:48:25',2,'2017-11-10 05:50:36'),(15,22,'devRole1_1_3','role description for devRole1_1_2','devRole11_1',0,20,'2017-11-09 15:07:22',20,'2017-11-09 15:47:29'),(16,25,'Suyash_School125','Role For School 1','Suyash_School1',0,42,'2017-11-10 11:53:49',NULL,NULL),(17,24,'devRole0124','dev','devRole01',0,40,'2017-11-10 12:28:33',40,'2017-11-10 12:28:39'),(18,24,'test12345','dev','test12345',1,40,'2017-11-10 12:28:33',1,NULL),(19,22,'Instructor_test22','Instructor_test description','Instructor_test',0,1,'2017-11-13 12:05:41',NULL,NULL),(26,22,'Manish526','Manish description','Manish 5',0,1,'2017-11-14 13:23:25',1,NULL),(27,22,'Manish627','Manish description','Manish 6',1,1,'2017-11-14 13:24:23',1,NULL),(28,22,'Manish628','Manish description','Manish 6',1,1,'2017-11-14 13:27:21',1,NULL),(29,22,'testRole0129','','testRole01',1,2,'2017-11-15 07:18:09',2,NULL),(30,22,'testRole0330','','testRole03',1,2,'2017-11-16 03:29:33',2,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `rolemapping`
--

LOCK TABLES `rolemapping` WRITE;
/*!40000 ALTER TABLE `rolemapping` DISABLE KEYS */;
INSERT INTO `rolemapping` VALUES (3,'USER',1,1),(4,'USER',2,2),(5,'USER',3,2),(6,'USER',4,2),(8,'USER',20,2),(9,'USER',23,8),(10,'USER',21,8),(12,'USER',28,8),(13,'USER',29,2),(14,'USER',30,8),(15,'USER',31,11),(16,'USER',32,2),(22,'USER',38,15),(23,'USER',39,2),(24,'USER',40,2),(25,'USER',41,14),(26,'USER',42,2),(27,'USER',43,16),(28,'USER',44,17),(29,'USER',45,2),(30,'USER',47,8),(31,'USER',48,8),(32,'USER',49,8),(34,'USER',52,8),(35,'USER',53,2),(36,'USER',54,8),(37,'USER',55,8),(38,'USER',58,8),(39,'USER',59,8),(40,'USER',60,8),(41,'USER',61,8),(42,'USER',62,8),(43,'USER',63,8),(44,'USER',64,2);
/*!40000 ALTER TABLE `rolemapping` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `rolemenudetails`
--

LOCK TABLES `rolemenudetails` WRITE;
/*!40000 ALTER TABLE `rolemenudetails` DISABLE KEYS */;
INSERT INTO `rolemenudetails` VALUES (1,1,1,1,'2017-11-03 12:20:07',NULL,NULL),(2,1,2,1,'2017-11-03 12:20:07',NULL,NULL),(3,1,3,1,'2017-11-03 12:20:07',NULL,NULL),(4,1,4,1,'2017-11-03 12:20:07',NULL,NULL),(5,1,5,1,'2017-11-03 12:20:07',NULL,NULL),(6,1,6,1,'2017-11-03 12:20:07',NULL,NULL),(7,1,7,1,'2017-11-03 12:20:07',NULL,NULL),(8,1,8,1,'2017-11-03 12:20:07',NULL,NULL),(9,1,9,1,'2017-11-03 12:20:07',NULL,NULL),(10,1,10,1,'2017-11-03 12:20:07',NULL,NULL),(11,1,11,1,'2017-11-03 12:20:07',NULL,NULL),(12,1,12,1,'2017-11-03 12:20:07',NULL,NULL),(13,1,13,1,'2017-11-03 12:20:07',NULL,NULL),(14,1,14,1,'2017-11-03 12:20:07',NULL,NULL),(15,1,15,1,'2017-11-03 12:20:07',NULL,NULL),(16,1,16,1,'2017-11-03 12:20:07',NULL,NULL),(17,1,17,1,'2017-11-03 13:16:14',NULL,NULL),(18,2,4,1,'2017-11-03 14:03:33',NULL,NULL),(19,2,5,1,'2017-11-03 14:03:33',NULL,NULL),(21,2,7,1,'2017-11-03 14:03:33',NULL,NULL),(22,2,8,1,'2017-11-03 14:03:33',NULL,NULL),(24,2,10,1,'2017-11-03 14:03:33',NULL,NULL),(25,2,11,1,'2017-11-03 14:03:33',NULL,NULL),(26,2,12,1,'2017-11-03 14:03:33',NULL,NULL),(27,2,13,1,'2017-11-03 14:03:33',NULL,NULL),(28,2,14,1,'2017-11-03 14:03:33',NULL,NULL),(29,2,15,1,'2017-11-03 14:03:33',NULL,NULL),(30,2,16,1,'2017-11-03 14:03:33',NULL,NULL),(31,2,17,1,'2017-11-03 14:03:33',NULL,NULL),(32,8,14,1,'2017-11-08 15:26:55',NULL,NULL),(33,18,14,1,'2017-11-08 15:26:55',NULL,NULL);
/*!40000 ALTER TABLE `rolemenudetails` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=1639 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolepermissiondetails`
--

LOCK TABLES `rolepermissiondetails` WRITE;
/*!40000 ALTER TABLE `rolepermissiondetails` DISABLE KEYS */;
INSERT INTO `rolepermissiondetails` VALUES (1,1,1,'Institute.Create',1,'2017-11-03 13:56:01',NULL,NULL),(2,1,2,'Institute.Read',1,'2017-11-03 13:56:01',NULL,NULL),(3,1,3,'Institute.Update',1,'2017-11-03 13:56:01',NULL,NULL),(4,1,4,'Institute.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(5,1,5,'Board.Create',1,'2017-11-03 13:56:01',NULL,NULL),(6,1,6,'Board.Read',1,'2017-11-03 13:56:01',NULL,NULL),(7,1,7,'Board.Update',1,'2017-11-03 13:56:01',NULL,NULL),(8,1,8,'Board.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(9,1,9,'School.Create',1,'2017-11-03 13:56:01',NULL,NULL),(10,1,10,'School.Read',1,'2017-11-03 13:56:01',NULL,NULL),(11,1,11,'School.Update',1,'2017-11-03 13:56:01',NULL,NULL),(12,1,12,'School.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(13,1,13,'Role.Create',1,'2017-11-03 13:56:01',NULL,NULL),(14,1,14,'Role.Read',1,'2017-11-03 13:56:01',NULL,NULL),(15,1,15,'Role.Update',1,'2017-11-03 13:56:01',NULL,NULL),(16,1,16,'Role.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(17,1,17,'User.Create',1,'2017-11-03 13:56:01',NULL,NULL),(18,1,18,'User.Read',1,'2017-11-03 13:56:01',NULL,NULL),(19,1,19,'User.Update',1,'2017-11-03 13:56:01',NULL,NULL),(20,1,20,'User.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(21,1,21,'Frequency.Create',1,'2017-11-03 13:56:01',NULL,NULL),(22,1,22,'Frequency.Read',1,'2017-11-03 13:56:01',NULL,NULL),(23,1,23,'Frequency.Update',1,'2017-11-03 13:56:01',NULL,NULL),(24,1,24,'Frequency.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(25,1,25,'Class.Create',1,'2017-11-03 13:56:01',NULL,NULL),(26,1,26,'Class.Read',1,'2017-11-03 13:56:01',NULL,NULL),(27,1,27,'Class.Update',1,'2017-11-03 13:56:01',NULL,NULL),(28,1,28,'Class.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(29,1,29,'Division.Create',1,'2017-11-03 13:56:01',NULL,NULL),(30,1,30,'Division.Read',1,'2017-11-03 13:56:01',NULL,NULL),(31,1,31,'Division.Update',1,'2017-11-03 13:56:01',NULL,NULL),(32,1,32,'Division.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(33,1,33,'Category.Create',1,'2017-11-03 13:56:01',NULL,NULL),(34,1,34,'Category.Read',1,'2017-11-03 13:56:01',NULL,NULL),(35,1,35,'Category.Update',1,'2017-11-03 13:56:01',NULL,NULL),(36,1,36,'Category.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(37,1,37,'Feehead.Create',1,'2017-11-03 13:56:01',NULL,NULL),(38,1,38,'Feehead.Read',1,'2017-11-03 13:56:01',NULL,NULL),(39,1,39,'Feehead.Update',1,'2017-11-03 13:56:01',NULL,NULL),(40,1,40,'Feehead.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(41,1,41,'Feeplan.Create',1,'2017-11-03 13:56:01',NULL,NULL),(42,1,42,'Feeplan.Read',1,'2017-11-03 13:56:01',NULL,NULL),(43,1,43,'Feeplan.Update',1,'2017-11-03 13:56:01',NULL,NULL),(44,1,44,'Feeplan.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(45,1,45,'Transport.Create',1,'2017-11-03 13:56:01',NULL,NULL),(46,1,46,'Transport.Read',1,'2017-11-03 13:56:01',NULL,NULL),(47,1,47,'Transport.Update',1,'2017-11-03 13:56:01',NULL,NULL),(48,1,48,'Transport.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(49,1,49,'Addhocfee.Create',1,'2017-11-03 13:56:01',NULL,NULL),(50,1,50,'Addhocfee.Read',1,'2017-11-03 13:56:01',NULL,NULL),(51,1,51,'Addhocfee.Update',1,'2017-11-03 13:56:01',NULL,NULL),(52,1,52,'Addhocfee.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(53,1,53,'Student.Create',1,'2017-11-03 13:56:01',NULL,NULL),(54,1,54,'Student.Read',1,'2017-11-03 13:56:01',NULL,NULL),(55,1,55,'Student.Update',1,'2017-11-03 13:56:01',NULL,NULL),(56,1,56,'Student.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(57,1,57,'ProcessFee.Create',1,'2017-11-03 13:56:01',NULL,NULL),(58,1,58,'ProcessFee.Read',1,'2017-11-03 13:56:01',NULL,NULL),(59,1,59,'ProcessFee.Update',1,'2017-11-03 13:56:01',NULL,NULL),(60,1,60,'ProcessFee.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(61,1,61,'Report.Create',1,'2017-11-03 13:56:01',NULL,NULL),(62,1,62,'Report.Read',1,'2017-11-03 13:56:01',NULL,NULL),(63,1,63,'Report.Update',1,'2017-11-03 13:56:01',NULL,NULL),(64,1,64,'Report.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(65,1,65,'AcademicYear.Create',1,'2017-11-03 13:56:01',NULL,NULL),(66,1,66,'AcademicYear.Read',1,'2017-11-03 13:56:01',NULL,NULL),(67,1,67,'AcademicYear.Update',1,'2017-11-03 13:56:01',NULL,NULL),(68,1,68,'AcademicYear.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(69,2,13,'Role.Create',1,'2017-11-03 14:06:07',NULL,NULL),(70,2,14,'Role.Read',1,'2017-11-03 14:06:07',NULL,NULL),(71,2,15,'Role.Update',1,'2017-11-03 14:06:07',NULL,NULL),(72,2,16,'Role.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(73,2,17,'User.Create',1,'2017-11-03 14:06:07',NULL,NULL),(74,2,18,'User.Read',1,'2017-11-03 14:06:07',NULL,NULL),(75,2,19,'User.Update',1,'2017-11-03 14:06:07',NULL,NULL),(76,2,20,'User.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(81,2,25,'Class.Create',1,'2017-11-03 14:06:07',NULL,NULL),(82,2,26,'Class.Read',1,'2017-11-03 14:06:07',NULL,NULL),(83,2,27,'Class.Update',1,'2017-11-03 14:06:07',NULL,NULL),(84,2,28,'Class.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(85,2,29,'Division.Create',1,'2017-11-03 14:06:07',NULL,NULL),(86,2,30,'Division.Read',1,'2017-11-03 14:06:07',NULL,NULL),(87,2,31,'Division.Update',1,'2017-11-03 14:06:07',NULL,NULL),(88,2,32,'Division.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(93,2,37,'Feehead.Create',1,'2017-11-03 14:06:07',NULL,NULL),(94,2,38,'Feehead.Read',1,'2017-11-03 14:06:07',NULL,NULL),(95,2,39,'Feehead.Update',1,'2017-11-03 14:06:07',NULL,NULL),(96,2,40,'Feehead.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(97,2,41,'Feeplan.Create',1,'2017-11-03 14:06:07',NULL,NULL),(98,2,42,'Feeplan.Read',1,'2017-11-03 14:06:07',NULL,NULL),(99,2,43,'Feeplan.Update',1,'2017-11-03 14:06:07',NULL,NULL),(100,2,44,'Feeplan.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(101,2,45,'Transport.Create',1,'2017-11-03 14:06:07',NULL,NULL),(102,2,46,'Transport.Read',1,'2017-11-03 14:06:07',NULL,NULL),(103,2,47,'Transport.Update',1,'2017-11-03 14:06:07',NULL,NULL),(104,2,48,'Transport.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(105,2,49,'Addhocfee.Create',1,'2017-11-03 14:06:07',NULL,NULL),(106,2,50,'Addhocfee.Read',1,'2017-11-03 14:06:07',NULL,NULL),(107,2,51,'Addhocfee.Update',1,'2017-11-03 14:06:07',NULL,NULL),(108,2,52,'Addhocfee.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(109,2,53,'Student.Create',1,'2017-11-03 14:06:07',NULL,NULL),(110,2,54,'Student.Read',1,'2017-11-03 14:06:07',NULL,NULL),(111,2,55,'Student.Update',1,'2017-11-03 14:06:07',NULL,NULL),(112,2,56,'Student.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(113,2,57,'ProcessFee.Create',1,'2017-11-03 14:06:07',NULL,NULL),(114,2,58,'ProcessFee.Read',1,'2017-11-03 14:06:07',NULL,NULL),(115,2,59,'ProcessFee.Update',1,'2017-11-03 14:06:07',NULL,NULL),(116,2,60,'ProcessFee.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(117,2,61,'Report.Create',1,'2017-11-03 14:06:07',NULL,NULL),(118,2,62,'Report.Read',1,'2017-11-03 14:06:07',NULL,NULL),(119,2,63,'Report.Update',1,'2017-11-03 14:06:07',NULL,NULL),(120,2,64,'Report.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(121,2,65,'AcademicYear.Create',1,'2017-11-03 14:06:07',NULL,NULL),(122,2,66,'AcademicYear.Read',1,'2017-11-03 14:06:07',NULL,NULL),(123,2,67,'AcademicYear.Update',1,'2017-11-03 14:06:07',NULL,NULL),(124,2,68,'AcademicYear.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(1558,8,54,'Student.Read',1,'2017-11-08 12:14:48',NULL,NULL),(1567,10,54,'Student.Read',2,'2017-11-08 14:36:26',NULL,NULL),(1573,11,53,'Student.Create',1,'2017-11-09 11:15:03',NULL,NULL),(1574,11,54,'Student.Read',1,'2017-11-09 11:15:07',NULL,NULL),(1575,11,55,'Student.Update',1,'2017-11-09 11:15:11',NULL,NULL),(1577,11,56,'Student.Delete',1,'2017-11-09 11:15:41',NULL,NULL),(1578,14,54,'Student.Read',40,'2017-11-09 14:14:23',NULL,NULL),(1580,16,10,'School.Read',42,'2017-11-10 06:18:11',NULL,NULL),(1581,16,9,'School.Create',42,'2017-11-10 06:18:23',NULL,NULL),(1582,14,53,'Student.Create',2,'2017-11-10 06:24:41',NULL,NULL),(1585,16,2,'Institute.Read',42,'2017-11-10 06:29:13',NULL,NULL),(1586,16,6,'Board.Read',42,'2017-11-10 06:29:24',NULL,NULL),(1587,14,55,'Student.Update',2,'2017-11-10 06:35:41',NULL,NULL),(1593,9,19,'User.Update',20,'2017-11-10 07:36:35',NULL,NULL),(1598,14,1,'Institute.Read',20,'2017-11-10 11:03:06',NULL,NULL),(1612,11,66,'Academicyear.Read',1,'2017-11-13 12:19:28',NULL,NULL),(1613,8,41,'FeePlan.Create',1,'2017-11-13 15:56:56',NULL,NULL),(1632,17,86,'Feehead.Read',40,'2017-11-16 07:23:04',NULL,NULL),(1633,17,102,'Student.Read',40,'2017-11-16 08:54:49',NULL,NULL),(1634,17,85,'Feehead.Create',40,'2017-11-16 10:00:25',NULL,NULL),(1635,17,87,'Feehead.Update',40,'2017-11-16 10:00:28',NULL,NULL);
/*!40000 ALTER TABLE `rolepermissiondetails` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `roleschooldetails`
--

LOCK TABLES `roleschooldetails` WRITE;
/*!40000 ALTER TABLE `roleschooldetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `roleschooldetails` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (22,21,2,'Symbiosis  International  School','SS','sisp@symbiosis.com','9999999999','Pune','Pune','Maharashtra',NULL,'logoImg.jpg','Symbiosis  International  School, Pune',0,1,'2017-11-09 05:26:43',1,'2017-11-14 08:40:02'),(23,19,3,'Symbiosis School, Nashik(SSE)','SSP','SSP@symbiosis.com','9999999999','Pune','Pune','Maharashtra',NULL,'logo.png','Symbiosis School, Nashik',0,1,'2017-11-06 10:52:42',1,'2017-11-14 08:44:59'),(24,19,4,'Symbiosis Nursery School, Pune','SNSP','SNSP@symbiosis.com','12345678990','Pune','Pune','Maharashtra','India','SNSP.jpg','Symbiosis Nursery School, Pune',0,1,'2017-11-06 10:52:42',1,NULL),(25,19,1,'Symbiosis School, Nashik(CBSC)','SSN','SSN@symbiosis.com','12345678990','Pune','Pune','Maharashtra','India','SSN.jpg','Symbiosis School, Nashik',0,1,'2017-11-06 10:52:42',1,NULL),(26,21,1,'DAV Public School, Airoli','DAVAIR','davAir@dav.com','12345678990','Airoli','Airoli','Maharashtra','India','DAVAIR.jpg','DAV Public School, Airoli',0,1,'2017-11-06 10:52:42',1,NULL),(27,21,1,'DAV Public School, Nerul','DAVNER','davner@dav.com','12345678990','Nerul','Nerul','Maharashtra','India','DAVNER.jpg','DAV Public School, Nerul',0,1,'2017-11-06 10:52:42',1,NULL),(28,21,3,'DAV Public School, Thane','DAVTHAN','davthan@dav.com','12345678990','Thane','Thane','Maharashtra','India','DAVNER.jpg','DAV Public School, Thane',0,1,'2017-11-06 10:52:42',1,NULL),(29,21,2,'DAV International School, Kharghar','DAVKHAR','davkhar@dav.com','12345678990','Kharghar','Kharghar','Maharashtra','India','DAVKHAR.jpg','DAV Public School, Kharghar',0,1,'2017-11-06 10:52:42',1,NULL),(35,19,2,'string1','string1','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(36,19,2,'string2','string2','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(37,19,2,'string3','string3','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(38,19,2,'string4','string4','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(39,19,2,'string5','string5','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(40,19,2,'string6','string6','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(43,19,2,'string7','string7','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(44,19,2,'string8','string8','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(45,19,2,'string9','string9','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(46,19,2,'string10','string10','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(47,19,2,'string11','string11','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(48,19,2,'string12','string12','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(49,19,2,'string13','string13','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(50,19,2,'string14','string14','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(51,19,2,'string15','string15','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(52,19,2,'string16','string16','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(53,19,2,'string17','string17','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(54,19,2,'string18','string18','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(55,19,2,'string19','string19','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(56,19,2,'string20','string20','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(57,19,2,'string21','string21','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(58,19,2,'string22','string22','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(59,19,2,'string23','string23','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(60,19,2,'string24','string24','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(61,19,2,'string25','string25','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(62,19,2,'string26','string26','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(63,19,2,'string27','string27','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(64,19,2,'string28','string28','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(65,19,2,'string29','string29','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(66,19,2,'string30','string30','string','string','string','string','string','string','string','string',0,1,'2017-11-07 09:21:48',1,'2017-11-07 09:21:48'),(70,19,1,'Suyash_School1_School1','SS1S1','asd@adas.com','4545454545','Nashik','Nashik','Maharashtra',NULL,'logo.png','SS1S1',0,43,'2017-11-10 06:39:42',NULL,NULL),(71,19,1,'ijk','kj','','','','','',NULL,'logo.png','kj',0,1,'2017-11-13 06:48:26',1,'2017-11-13 10:14:15'),(72,19,1,'test','test','test@test.com','9999999999','test','test','test',NULL,'logo.png','test',0,1,'2017-11-13 10:38:22',NULL,NULL),(81,19,1,'test1','test1','asd@adas.com','9999999999','aa\naa','Nashik','Maharashtra',NULL,NULL,'test1',0,1,'2017-11-13 14:19:32',NULL,NULL),(82,20,1,'tttt','tttt','test@test.com','9999999999','tttt','tttt','tttt',NULL,NULL,'tttt',0,1,'2017-11-13 14:24:36',NULL,NULL),(83,19,1,'ioio','ioio','asd@adas.com','9999999999','ioio','ioio','ioio',NULL,NULL,'ioio',0,1,'2017-11-13 14:27:52',NULL,NULL),(84,20,2,'popop','opopop','asd@adas.com','9999999999','p[opop','opop','opop',NULL,NULL,'opopop',0,1,'2017-11-13 14:45:29',NULL,NULL),(86,19,2,'ui','uiuiui','asd@adas.com','9999999999','opo','popop','opop',NULL,NULL,'uiuiui',0,1,'2017-11-13 14:47:55',NULL,NULL),(88,20,2,'test2','test2','asd@adas.com','9999999999','test','test','test',NULL,NULL,'test2',0,1,'2017-11-13 14:51:33',NULL,NULL),(89,19,2,'one','one','asd@adas.com','9999999999','test','test','test',NULL,NULL,'one',0,1,'2017-11-13 14:53:03',NULL,NULL),(90,19,1,'Harnish','HPadia','string','string','string','string','string','string','string','string',0,1,'2017-11-14 15:48:51',0,'2017-11-14 14:52:29'),(92,19,1,'Harnish1','HPadia1','string','string','string','string','string','string','string','string',0,1,'2017-11-14 15:50:54',0,'2017-11-14 14:52:29'),(93,21,2,'Test School - 1','TS1','test@testschool.com','9999999999','Pune','Pune','Maharashtra',NULL,'logoImg.jpg','Test School - 1',0,1,'2017-11-16 09:42:29',NULL,NULL),(94,21,2,'Test School - 2','TS2','test2@testschool.com','9999999999','Pune','Pune','Maharashtra',NULL,'logoImg.jpg','Test School - 2',0,1,'2017-11-16 09:47:27',NULL,NULL),(97,19,1,'test123','test123','test@test.com','9999999999','test','test','test',NULL,NULL,'test',0,1,'2017-11-16 09:45:19',1,'2017-11-16 10:06:48'),(98,20,2,'Ryan IS','Ryan IS','asd@adas.com','9999999999','Pune','Pune','Maharashtra',NULL,NULL,'Ryan IS',1,1,'2017-11-16 09:49:14',1,'2017-11-16 10:20:09'),(99,21,2,'Test School - 3','TS3','test3@testschool.com','9999999999','Pune','Pune','Maharashtra',NULL,'logoImg.jpg','Test School - 3',0,1,'2017-11-16 10:07:36',NULL,NULL);
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,22,1,1,1,NULL,NULL,'10010','Ramesh','Ramdev','Pande','Male','Ramdev','Pande','9800900120','Asha','Pande','9999999999','s','s','','2015-02-01','2018-01-01',NULL,'Pune','Maharashtra',NULL,'9999999999','test@test.com',NULL,NULL,'B+','1',0,1,'2017-11-09 08:23:11',2,'2017-11-16 04:28:03'),(3,22,2,1,1,NULL,NULL,'10012','Tushar_10012','Somnath_10012','Dave_10012','Female','Somnath_10012','Dave_10012','9800900141','Nisha_10012','Dave_10012','9999999999','r','r','9999999999','2006-03-12','2006-03-17',NULL,'Pune','Maharashtra',NULL,'9999999999','Somnath_10012@gmail.com',NULL,NULL,'O+','1',0,1,'2006-01-17 00:00:00',1,'2017-11-09 14:23:48'),(4,22,3,1,2,NULL,NULL,'10013','Tushar_10013','Somnath_10013','Dave_10013','Male','Somnath_10013','Dave_10013','9800900142','Nisha_10013','Dave_10013','9999999999','','','','2006-03-12','2006-04-17',NULL,'Pune','Maharashtra',NULL,'9999999999','Somnath_10013@gmail.com',NULL,NULL,'A+','1',0,1,'2006-01-17 00:00:00',1,'2017-11-09 14:37:36'),(5,22,3,1,2,NULL,'F10005','10014','Tushar_10014','Somnath_10014','Dave_10014','Male','Somnath_10014','Dave_10014','9800900143','Nisha_10014','Dave_10014','','','','','2006-04-12','2006-05-17','Aundh','Pune','Maharashtra','India','25422203','Somnath_10014@gmail.com','Hindu','','O+','1',0,1,'2006-01-17 00:00:00',1,'2006-01-17 00:00:00'),(6,22,4,1,3,NULL,'F10006','10015','Tushar_10015','Somnath_10015','Dave_10015','Male','Somnath_10015','Dave_10015','9800900144','Nisha_10015','Dave_10015','','','','','2006-04-12','2006-06-17','Baner','Pune','Maharashtra','India','25422204','Somnath_10015@gmail.com','Hindu','','A+','1',0,1,'2006-01-17 00:00:00',1,'2006-01-17 00:00:00'),(7,22,4,1,3,NULL,'F10007','10016','Tushar_10016','Somnath_10016','Dave_10016','Female','Somnath_10016','Dave_10016','9800900145','Nisha_10016','Dave_10016','','','','','2006-05-12','2006-07-17','Swargate','Pune','Maharashtra','India','9999999999','Somnath_10016@gmail.com','Hindu','','O+','1',0,1,'2006-01-17 00:00:00',2,'2017-11-15 15:18:32'),(8,22,1,2,1,NULL,'F10008','10017','Tushar_10017','Somnath_10017','Dave_10017','Female','Somnath_10017','Dave_10017','9800900146','Nisha_10017','Dave_10017','','','','','2006-05-12','2006-08-17','Aundh','Pune','Maharashtra','India','25422206','Somnath_10017@gmail.com','Hindu','','A+','1',0,1,'2006-01-17 00:00:00',1,'2006-01-17 00:00:00'),(9,22,2,2,1,NULL,'F10009','10018','Tushar_10018','Somnath_10018','Dave_10018','Male','Somnath_10018','Dave_10018','9800900147','Nisha_10018','Dave_10018','','','','','2006-06-12','2006-09-17','Baner','Pune','Maharashtra','India','25422207','Somnath_10018@gmail.com','Hindu','','O+','1',0,1,'2006-01-17 00:00:00',1,'2006-01-17 00:00:00'),(10,22,2,2,1,NULL,'F10010','10019','Tushar_10019','Somnath_10019','Dave_10019','Male','Somnath_10019','Dave_10019','9800900148','Nisha_10019','Dave_10019','','','','','2006-06-12','2006-10-17','Swargate','Pune','Maharashtra','India','25422208','Somnath_10019@gmail.com','Hindu','','A+','1',0,1,'2006-01-17 00:00:00',1,'2006-01-17 00:00:00'),(11,22,3,2,2,NULL,NULL,'10020','Tushar_10020','Somnath_10020','Dave_10020','Female','Somnath_10020','Dave_10020','9800900149','Nisha_10020','Dave_10020','9999999999','TEst','test','','2006-07-12','2006-11-17',NULL,'Pune','Maharashtra',NULL,'9999999999','Somnath_10020@gmail.com',NULL,NULL,'O+','1',0,1,'2017-11-09 08:23:59',NULL,NULL),(12,22,3,2,2,NULL,'F10012','10021','Tushar_10021','Somnath_10021','Dave_10021','Female','Somnath_10021','Dave_10021','9800900150','Nisha_10021','Dave_10021','','','','','2006-07-12','2006-12-17','Baner','Pune','Maharashtra','India','25422210','Somnath_10021@gmail.com','Hindu','','A+','1',0,1,'2006-01-17 00:00:00',1,'2006-01-17 00:00:00'),(13,22,4,2,3,NULL,'F10013','10022','Tushar_10022','Somnath_10022','Dave_10022','Male','Somnath_10022','Dave_10022','9800900151','Nisha_10022','Dave_10022','','','','','2006-08-12','2006-12-17','Aundh','Pune','Maharashtra','India','25422211','Somnath_10022@gmail.com','Hindu','','O+','1',0,1,'2006-01-17 00:00:00',1,'2006-01-17 00:00:00'),(14,22,4,2,3,NULL,'F10014','10023','Tushar_10023','Somnath_10023','Dave_10023','Male','Somnath_10023','Dave_10023','9800900152','Nisha_10023','Dave_10023','','','','','2006-08-12','2006-12-17','Aundh','Pune','Maharashtra','India','25422212','Somnath_10023@gmail.com','Christian','','A+','1',0,1,'2006-01-17 00:00:00',1,'2006-01-17 00:00:00'),(15,23,1,1,1,NULL,'F10015','10024','Tushar_10024','Somnath_10024','Dave_10024','Female','Somnath_10024','Dave_10024','9800900153','Nisha_10024','Dave_10024','','','','','2006-08-12','2006-12-17','Swargate','Pune','Maharashtra','India','25422213','Somnath_10022@gmail.com','Hindu','','A+','2',1,2,'2006-01-17 00:00:01',1,'2006-01-17 00:00:01'),(16,23,2,1,1,NULL,'F10016','10025','Tushar_10025','Somnath_10025','Dave_10025','Female','Somnath_10025','Dave_10025','9800900154','Nisha_10025','Dave_10025','','','','','2006-08-12','2006-12-17','Aundh','Pune','Maharashtra','India','25422214','Somnath_10023@gmail.com','Hindu','','O+','3',2,3,'2006-01-17 00:00:02',1,'2006-01-17 00:00:02'),(17,23,2,1,1,NULL,'F10017','10026','Tushar_10026','Somnath_10026','Dave_10026','Male','Somnath_10026','Dave_10026','9800900155','Nisha_10026','Dave_10026','','','','','2006-08-12','2006-12-17','Baner','Pune','Maharashtra','India','25422215','Somnath_10022@gmail.com','Hindu','','A+','4',3,4,'2006-01-17 00:00:03',1,'2006-01-17 00:00:03'),(18,23,3,1,2,NULL,'F10018','10027','Tushar_10027','Somnath_10027','Dave_10027','Male','Somnath_10027','Dave_10027','9800900156','Nisha_10027','Dave_10027','','','','','2006-08-12','2006-12-17','Swargate','Pune','Maharashtra','India','25422216','Somnath_10023@gmail.com','Hindu','','A+','5',4,5,'2006-01-17 00:00:04',1,'2006-01-17 00:00:04'),(19,23,3,1,2,NULL,'F10019','10028','Tushar_10028','Somnath_10028','Dave_10028','Female','Somnath_10028','Dave_10028','9800900157','Nisha_10028','Dave_10028','','','','','2006-08-12','2006-12-17','Aundh','Pune','Maharashtra','India','25422217','Somnath_10022@gmail.com','Hindu','','O+','6',5,6,'2006-01-17 00:00:05',1,'2006-01-17 00:00:05'),(20,23,4,1,3,NULL,'F10020','10029','Tushar_10029','Somnath_10029','Dave_10029','Female','Somnath_10029','Dave_10029','9800900158','Nisha_10029','Dave_10029','','','','','2006-08-12','2006-12-17','Baner','Pune','Maharashtra','India','25422218','Somnath_10023@gmail.com','Hindu','','A+','7',6,7,'2006-01-17 00:00:06',1,'2006-01-17 00:00:06'),(21,23,4,1,3,NULL,'F10021','10030','Tushar_10030','Somnath_10030','Dave_10030','Male','Somnath_10030','Dave_10030','9800900159','Nisha_10030','Dave_10030','','','','','2006-08-12','2006-12-17','Swargate','Pune','Maharashtra','India','25422219','Somnath_10022@gmail.com','Hindu','','A+','8',7,8,'2006-01-17 00:00:07',1,'2006-01-17 00:00:07'),(22,23,1,2,1,NULL,'F10022','10031','Tushar_10031','Somnath_10031','Dave_10031','Male','Somnath_10031','Dave_10031','9800900160','Nisha_10031','Dave_10031','','','','','2006-08-12','2006-12-17','Aundh','Pune','Maharashtra','India','25422220','Somnath_10023@gmail.com','Hindu','','O+','9',8,9,'2006-01-17 00:00:08',1,'2006-01-17 00:00:08'),(23,23,2,2,1,NULL,'F10023','10032','Tushar_10032','Somnath_10032','Dave_10032','Female','Somnath_10032','Dave_10032','9800900161','Nisha_10032','Dave_10032','','','','','2006-08-12','2006-12-17','Baner','Pune','Maharashtra','India','25422221','Somnath_10022@gmail.com','Hindu','','A+','10',9,10,'2006-01-17 00:00:09',1,'2006-01-17 00:00:09'),(24,23,2,2,1,NULL,'F10024','10033','Tushar_10033','Somnath_10033','Dave_10033','Female','Somnath_10033','Dave_10033','9800900162','Nisha_10033','Dave_10033','','','','','2006-08-12','2006-12-17','Swargate','Pune','Maharashtra','India','25422222','Somnath_10023@gmail.com','Hindu','','A+','11',10,11,'2006-01-17 00:00:10',1,'2006-01-17 00:00:10'),(25,23,3,2,2,NULL,'F10025','10034','Tushar_10034','Somnath_10034','Dave_10034','Male','Somnath_10034','Dave_10034','9800900163','Nisha_10034','Dave_10034','','','','','2006-08-12','2006-12-17','Aundh','Pune','Maharashtra','India','25422223','Somnath_10022@gmail.com','Muslim','','A+','12',11,12,'2006-01-17 00:00:11',1,'2006-01-17 00:00:11'),(26,23,3,2,2,NULL,'F10026','10035','Tushar_10035','Somnath_10035','Dave_10035','Male','Somnath_10035','Dave_10035','9800900164','Nisha_10035','Dave_10035','','','','','2006-08-12','2006-12-17','Baner','Pune','Maharashtra','India','25422224','Somnath_10023@gmail.com','Hindu','','O+','13',12,13,'2006-01-17 00:00:12',1,'2006-01-17 00:00:12'),(27,23,4,2,3,NULL,'F10027','10036','Tushar_10036','Somnath_10036','Dave_10036','Female','Somnath_10036','Dave_10036','9800900165','Nisha_10036','Dave_10036','','','','','2006-08-12','2006-12-17','Aundh','Pune','Maharashtra','India','25422225','Somnath_10022@gmail.com','Hindu','','A+','14',13,14,'2006-01-17 00:00:13',1,'2006-01-17 00:00:13'),(28,23,4,2,3,NULL,'F10028','10037','Tushar_10037','Somnath_10037','Dave_10037','Female','Somnath_10037','Dave_10037','9800900166','Nisha_10037','Dave_10037','','','','','2006-08-12','2006-12-17','Aundh','Pune','Maharashtra','India','25422226','Somnath_10023@gmail.com','Christian','','A+','15',14,15,'2006-01-17 00:00:14',1,'2006-01-17 00:00:14'),(39,22,3,1,2,NULL,'1268','1110','Anushree','Somnathan','Vishwanathan','Female','Somnathan','Vishwanathan','9833451810','Latha','Vishwanathan','9987579428','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(40,22,3,1,2,NULL,'1267','1111','Riya','Satish','Anam','Female','Satish','Anam','9833368007','Kajal','Anam','9619650762','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(41,22,3,1,2,NULL,'1267','1112','Riya','Satish','Anam','Female','Satish','Anam','9833368007','Kajal','Anam','9619650762','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(42,22,3,1,2,NULL,'1268','1113','Anushree','Somnathan','Vishwanathan','Female','Somnathan','Vishwanathan','9833451810','Latha','Vishwanathan','9987579428','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(43,22,3,1,2,NULL,'1267','1114','Riya','Satish','Anam','Female','Satish','Anam','9833368007','Kajal','Anam','9619650762','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(44,22,3,1,2,NULL,'1268','1115','Anushree','Somnathan','Vishwanathan','Female','Somnathan','Vishwanathan','9833451810','Latha','Vishwanathan','9987579428','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(45,22,3,1,2,NULL,'1268','1116','Anushree','Somnathan','Vishwanathan','Female','Somnathan','Vishwanathan','9833451810','Latha','Vishwanathan','9987579428','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(46,22,3,1,2,NULL,'1267','1117','Riya','Satish','Anam','Female','Satish','Anam','9833368007','Kajal','Anam','9619650762','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(47,22,3,1,2,NULL,'1267','1118','Riya','Satish','Anam','Female','Satish','Anam','9833368007','Kajal','Anam','9619650762','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(48,22,3,1,2,NULL,'1268','1119','Anushree','Somnathan','Vishwanathan','Female','Somnathan','Vishwanathan','9833451810','Latha','Vishwanathan','9987579428','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(49,22,3,1,2,NULL,'1268','11110','Anushree','Somnathan','Vishwanathan','Female','Somnathan','Vishwanathan','9833451810','Latha','Vishwanathan','9987579428','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(50,22,3,1,2,NULL,'1267','11111','Riya','Satish','Anam','Female','Satish','Anam','9833368007','Kajal','Anam','9619650762','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(51,22,3,1,2,NULL,'1267','11112','Riya','Satish','Anam','Female','Satish','Anam','9833368007','Kajal','Anam','9619650762','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(52,22,3,1,2,NULL,'1268','11113','Anushree','Somnathan','Vishwanathan','Female','Somnathan','Vishwanathan','9833451810','Latha','Vishwanathan','9987579428','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(53,22,3,1,2,NULL,'1267','11114','Riya','Satish','Anam','Female','Satish','Anam','9833368007','Kajal','Anam','9619650762','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(54,22,3,1,2,NULL,'1268','11115','Anushree','Somnathan','Vishwanathan','Female','Somnathan','Vishwanathan','9833451810','Latha','Vishwanathan','9987579428','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(55,22,3,1,2,NULL,'1267','11116','Riya','Satish','Anam','Female','Satish','Anam','9833368007','Kajal','Anam','9619650762','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(56,22,3,1,2,NULL,'1268','11117','Anushree','Somnathan','Vishwanathan','Female','Somnathan','Vishwanathan','9833451810','Latha','Vishwanathan','9987579428','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(57,22,3,1,2,NULL,'1267','11118','Riya','Satish','Anam','Female','Satish','Anam','9833368007','Kajal','Anam','9619650762','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(58,22,3,1,2,NULL,'1268','11119','Anushree','Somnathan','Vishwanathan','Female','Somnathan','Vishwanathan','9833451810','Latha','Vishwanathan','9987579428','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(59,22,3,1,2,NULL,'1267','11120','Riya','Satish','Anam','Female','Satish','Anam','9833368007','Kajal','Anam','9619650762','.','.','0','1987-10-09','2014-10-09','.','111111','Maharashtra','India','0','test@test.com','hindu','general','not known','2011',0,1,'2017-11-07 18:30:00',NULL,NULL),(112,22,1,1,1,NULL,'9874','90010','Suresh','Ramdev','Pande','Male','Ramdev','Pande','9800900121','Lata','Pande','9999999998','Ss','Ss','','2015-02-01','2018-01-01',NULL,'Pune','Maharashtra',NULL,'9999999999','test@test.com',NULL,NULL,'B+','1',0,20,'2017-11-16 10:32:40',20,'2017-11-16 10:40:08');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'Administrator','$2a$10$txwgt5DoJ1K.cieu7tniguDTX9sZr9DzWYa24.BFOr6A3BDM/bHwC','1234567890','espl@eternussolutions.com','2017-11-16 13:46:01',0,0,1,1,1,NULL,NULL,0,1,'2017-11-06 16:02:16',NULL,NULL),(2,2,'sa@sysmboisis.com','$2a$10$txwgt5DoJ1K.cieu7tniguDTX9sZr9DzWYa24.BFOr6A3BDM/bHwC','7894568712','sa@symbiosis.com','2017-11-16 13:47:21',0,0,1,1,1,NULL,NULL,0,1,'2017-11-06 18:55:18',NULL,NULL),(3,2,'sa@dav.com','$2a$10$txwgt5DoJ1K.cieu7tniguDTX9sZr9DzWYa24.BFOr6A3BDM/bHwC','7894567891','sa@dav.com',NULL,0,0,1,1,1,NULL,NULL,0,1,'2017-11-06 18:57:55',NULL,NULL),(4,2,'sa2@dav.com','$2a$10$txwgt5DoJ1K.cieu7tniguDTX9sZr9DzWYa24.BFOr6A3BDM/bHwC','7845123658','sa2@dav.com',NULL,0,0,1,1,1,NULL,NULL,0,1,'2017-11-06 19:00:47',NULL,NULL),(20,2,'amol','$2a$10$qHewmE1JjNlE4/57ATeYxuBX5AfgMsDUWn5tYtp5hi7Uul/iAiTge','9876543210','amol.patil@eternussolutions.com','2017-11-16 11:53:23',0,0,0,1,1,NULL,NULL,0,1,'2017-11-08 05:54:59',20,'2017-11-15 14:01:10'),(21,8,'Tom','$2a$10$txwgt5DoJ1K.cieu7tniguDTX9sZr9DzWYa24.BFOr6A3BDM/bHwC','9876543210','tom@eternussolutions.com','2017-11-15 06:37:32',0,0,0,1,1,NULL,NULL,0,1,'2017-11-08 06:01:44',NULL,NULL),(22,2,'dev','$2a$10$txwgt5DoJ1K.cieu7tniguDTX9sZr9DzWYa24.BFOr6A3BDM/bHwC','7890567890','dev@dev.com',NULL,0,0,0,1,0,'2891b53bc26d459f2e84df8a62a73d4ed1e57df3d4d6d9f124e703960f277059d144a582dea877a1038386dd2b17f132a925650d9a83a010ae345992b940808a',NULL,0,1,'2017-11-08 05:58:27',NULL,NULL),(23,8,'tom1@eternussolutions.com','$2a$10$UpWkVfJliLArv1sexr0hj.s/9fxTiDCUz7DYtVC209/hpLt.R1Gh.','9876543210','tom1@eternussolutions.com',NULL,0,0,0,1,1,NULL,NULL,0,20,'2017-11-08 06:27:32',23,'2017-11-14 12:16:26'),(28,8,'Tom111','$2a$10$B/GCqfBy21qef3qaG.6ms.4SSpcPH9AC5VhICrAy3znPmUiL.FvwO','9876543210','tom1111@eternussolutions.com',NULL,0,0,0,1,0,'2f49cb3e1ab22b3fe3649a232ff3a1143ed303082bc7d835a12b342f03c668c9e658d0bc7d1916995805f7bcadbbf20b654021b04747a1329689232121fd550d',NULL,0,20,'2017-11-08 12:26:06',NULL,NULL),(29,2,'dev4','$2a$10$b2jGBIUs4BUCvog3iMy6ye5sCCLYLFmDQ9MT8RbGG1J4U0678YhjO','7898778967','dev4@dev.com',NULL,0,0,0,1,1,NULL,NULL,0,1,'2017-11-08 12:26:29',NULL,NULL),(30,8,'Tom1112','$2a$10$OVOZScPuL38BO2tYJp1LXefF7jzEMx2LSLTBk16Hhu2iSM7hVIM6e','9876543210','tom11112@eternussolutions.com',NULL,0,0,0,1,0,'12388f9176fc33820ee65abfd2d767fba5fc97ee5cb1da1c4d4ad721ce29c1cf25d0a241d45e1a8da07cf6484474dc3ef725a8bd420976d066c8ac89285e967b',NULL,0,20,'2017-11-08 12:34:27',NULL,NULL),(31,11,'devUser01','$2a$10$od23.I77QHJFaEEB2KGGJOULp39/5NA8kjNm4uDROJdszHQlrDS0m','7898797899','devUser01@dev.com',NULL,0,0,0,0,0,'08087d7f293d0f731ef75264b5bbd673ba9c9445affbe3be96475467923d27e171563695d966f3626aa57d47692e4472fb062f7cdb4e67a75ab48ea88a9a7e58',NULL,0,2,'2017-11-08 14:39:56',NULL,NULL),(32,2,'devUser02','$2a$10$4NEy9aZBhlAlgUhkF5WWI.1QbO52Wj3G1cavLOd.1TKAxl.keFKAe','7897807856','devUser02@dev.com',NULL,0,0,0,0,1,NULL,NULL,0,1,'2017-11-08 14:48:22',NULL,NULL),(38,9,'amol123465_8','$2a$10$txwgt5DoJ1K.cieu7tniguDTX9sZr9DzWYa24.BFOr6A3BDM/bHwC','9876543218','amol123645_8@test.com',NULL,0,0,0,0,1,NULL,NULL,0,20,'2017-11-09 10:17:01',1,'2017-11-10 07:24:42'),(39,2,'sdfsa','$2a$10$UA0hLi8SDBz9bNU9iW0Y/.n2eei5natdutQJURVoETNhsPO.cI2Rm','7897809878','dsadf@sdfas',NULL,0,0,0,0,0,'366d1e12fe795043ca26dab9d3db92a78cbb0c1af88955fc41d853d9235325191c6d6d818c73c78bc9516ec6c443388b775481ac0ce8ec259ba68a12ac03dd5f',NULL,0,1,'2017-11-09 12:16:58',1,'2017-11-09 12:17:00'),(40,2,'devUser','$2a$10$KslvWgqd/XQ5UauXMKlPDOjyjyg4YYyLOLYeqlFyGft5OTLuMZzvO','9789087080','sachin.sarse@eternussolutions.com','2017-11-16 09:54:33',0,0,0,1,1,NULL,NULL,0,1,'2017-11-09 13:55:14',1,'2017-11-10 09:18:17'),(41,14,'devUser_Staff','$2a$10$iVZO0JpqQBo6s.vhK1PSLOgVjlEv1UmbI4WNtq1/gDg41UQhLGY.K','7897967609','devUser@staff.com','2017-11-16 07:23:33',0,0,0,1,1,NULL,NULL,0,40,'2017-11-09 14:18:08',40,'2017-11-09 14:18:08'),(42,2,'Suyash','$2a$10$0vCFeHYPWhe.Rz58dUXwIuijKkwP..OcqfWjE07b2ubR9S281HaFS','9168775522','suyashssc6000@gmail.com',NULL,0,0,0,1,1,NULL,NULL,0,1,'2017-11-10 05:16:41',1,'2017-11-10 05:16:42'),(43,16,'Suyash_SChool1','$2a$10$8lqDc/cP5MOqvTDwTEla1.oOuZqyJ4Tdpld9.VTIkRthkRS0DTbtW','9168775522','suyash.chiplunkar@eternussolutions.com',NULL,0,0,0,1,1,NULL,NULL,0,42,'2017-11-10 06:18:56',42,'2017-11-10 06:18:56'),(44,17,'devUserStaff','$2a$10$3smODzt5kOLHK6RdiVgy7.cEU6x3Atu7s4xpi7nPVw77XERNpkSBa','7807806789','devuserstaff@staff.com','2017-11-16 08:55:16',0,0,0,1,1,NULL,NULL,0,40,'2017-11-10 12:29:46',40,'2017-11-10 12:29:46'),(45,2,'amolTest','$2a$10$K22cZfEauDh/FNin0Q5viOprlrjqZ4aG2U9FrL8loxsjmqUdNSseq','9175160232','apatil.855@gmail.com',NULL,0,0,0,1,1,NULL,NULL,0,1,'2017-11-10 13:26:51',45,'2017-11-10 13:29:08'),(47,8,'devManish','$2a$10$x1fYcn4r0NRei4K9HL/VBOinemZaj.BZZrHuZaff.FQj5JZTXMd4a','9876543210','manish.patil@eternussolutions.com','2017-11-15 07:25:33',0,0,1,0,1,NULL,NULL,0,1,'2017-11-10 14:19:18',47,'2017-11-15 14:12:08'),(48,8,'devManish1','$2a$10$51EmMCQ/3/cJ8TiKrSf36uNoKfWmjvgGLLI7wZ4FhMd9AXUuqKmc2','9876543210','manish.patil1@eternussolutions.com',NULL,1,0,1,0,1,NULL,NULL,0,1,'2017-11-10 14:32:48',1,'2017-11-10 14:32:53'),(49,8,'amol1temp','$2a$10$bUnMwrS5oei1H/T1UnsCyO7mZx9QkdZgc/XDgeB.O2s0czCkWw2L6','9876543210','amol1temp@test.com',NULL,0,0,1,0,1,NULL,NULL,0,1,'2017-11-13 12:27:30',1,'2017-11-13 12:27:34'),(51,8,'amol1temp1','$2a$10$3vYYoCdadcqHRAqj0QjJhejYsKHv3Tc2Ly8N3aD309U6bb2fEYpVm','9876543210','amol11temp@test.com',NULL,0,0,0,0,1,NULL,NULL,0,1,'2017-11-13 12:30:08',NULL,NULL),(52,8,'amol1temp11','$2a$10$4y7Wa9v7ua89VFVnvwOsrOIDpkA7IDU1XnoHWhtwVvCoXZFdxZz96','9876543210','amol111temp@test.com',NULL,0,0,1,0,1,NULL,NULL,0,1,'2017-11-13 13:34:05',1,'2017-11-13 13:34:05'),(53,2,'testUser','$2a$10$3.H9X.tG/cvMl2biRTwizuW9lBanqNsYs1vwjsIv11kpIHRIHXQq2','8907808902','test@test.com',NULL,0,0,0,0,1,'14884a8f30f625da7e5e022db9755561de71ff4f495c180bfcf2cd834d2d14e708239a647214f95f2123a4dddf8982d6ccebf204d1fd55b3c3e9f50499eab562',NULL,1,1,'2017-11-13 13:40:55',1,'2017-11-13 14:20:54'),(54,8,'amol111','$2a$10$soCpzEL3eCri2.XyX2DH6OIOrj5rtV6BL4N42RmjrKOuzOHiHwQgW','9876543210','amol111@test.com',NULL,0,0,1,0,1,NULL,NULL,0,20,'2017-11-14 14:15:34',20,'2017-11-14 14:15:34'),(55,8,'amol112','$2a$10$zTQfHeMGKtvshKVgkGDq9eaiYpmiCvLcWcZsE5cSe8vo7UDDiKZ0q','9876543210','amol112@test.com',NULL,0,0,0,0,1,'4f5f19e2a1811b15e35820f257d918fc005ec88e387ad315788a71cd920793512d308e80d2779f6006bed61eca6244d05d871e9695f4082ecd5cd48a7d693d74',NULL,0,20,'2017-11-14 14:41:31',20,'2017-11-14 14:41:31'),(56,8,'manish.patil','$2a$10$fJgy4iUKHzKYyxy.oOphoeqTYvyT4/RLXBMwMeXqj/.cY.QJ09D76','9876543210','manish.patil@test.com',NULL,0,0,0,0,0,NULL,NULL,0,20,'2017-11-15 12:41:57',NULL,NULL),(57,8,'manish.patil1','$2a$10$t84kyBKz3Tq5TS1JeePY4.azviq0TB7EI0MmA9mBhIdZP/cyCWv9i','9876543210','manish.patil1@test.com',NULL,0,0,0,0,0,NULL,NULL,0,20,'2017-11-15 12:44:23',NULL,NULL),(58,8,'manish.patil2','$2a$10$rSV9Z0QUlZibAZ3nVOyq3esfc4vn61hC9SIhFahq0Ih2.YgI8LqL.','9876543210','manish.patil2@test.com',NULL,0,0,1,0,1,NULL,NULL,0,20,'2017-11-15 12:45:37',20,'2017-11-15 12:45:40'),(59,8,'manish.patil3','$2a$10$JYMVDthZBzugU4eUXAHqn.in2L8teLjGebxCCGXEGHFP..X8CWE/G','9876543210','manish.patil3@test.com',NULL,0,0,1,0,1,NULL,NULL,0,20,'2017-11-15 14:13:26',20,'2017-11-15 14:13:26'),(60,8,'amol19','$2a$10$gwszNzI5UgHX2XEBegfJK.Nva2/LOQjtk/EJuaDXOZqYMrhrAHABK','9876543210','amol19@test.com',NULL,0,0,0,0,0,'c439da3a8787576385375e8ddf928a26feb6270e09c9fa7485b638470a64b8b757a9679c682c4ba827a6cec716615d331e0bcce2e91efabcc90fd6295e9bd09c',NULL,0,20,'2017-11-15 14:59:59',20,'2017-11-15 14:59:59'),(61,8,'amol199','$2a$10$DHws4CO6vA/ihXs6ZZSkOurDub9qmk5KM009dwugBxZww75dMC/Mm','9876543210','amol199@test.com',NULL,0,0,1,0,1,NULL,NULL,0,20,'2017-11-15 15:08:28',20,'2017-11-15 15:08:29'),(62,8,'amol198','$2a$10$sPDLQ9ZsA2WLRjxZTFlMYOTaK5ARosK4FInLJIBWGdRZhyoGwzx/S','9876543210','amol198@test.com',NULL,0,0,0,0,0,'06b033efc085a968b4cd755ab415628b87ccac2804e2b5831acb81d60a550edc4eefaa3258de00d5cc3ebccbe8855bd645cb2f85393ab1139afd9f07e3907af1',NULL,0,20,'2017-11-15 15:09:46',20,'2017-11-15 15:09:46'),(63,8,'amol1989','$2a$10$fKpd2u5/s.Zu3nCOlnVT5OFAlQZiL8BsjEaeI.hOx2UsP6Xo56K7y','9876543210','amol1989@test.com',NULL,0,0,0,0,0,'ab18c45743e18317c7d3a17f1a9d00458fd8cee3b5719025154d1d5a4b044a31a2bd87bcf0fca9771ad5e1d99c1ee11bce1f244d579ad32548ec0da5c77701a8',NULL,0,20,'2017-11-15 15:10:23',20,'2017-11-15 15:10:23'),(64,2,'suyashAdmin','$2a$10$wuka7PLjrJjFHhDQ2vA6HugV5sL7c1rSnHC5s6i3z54yD/Z/V9x.W','','suyashoffice1@gmail.com',NULL,0,0,0,0,0,'2eb87e7d5ee20204d45e6b62ffd0275f46898c0f2eae8b0a55e46c9a549af0dea760b1ef9ca8269fc201249fe817ae1eb1bf7f43a1725a4be3aa9f685b887ff2',NULL,1,1,'2017-11-16 12:08:21',1,'2017-11-16 12:10:01');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `userschooldetails`
--

LOCK TABLES `userschooldetails` WRITE;
/*!40000 ALTER TABLE `userschooldetails` DISABLE KEYS */;
INSERT INTO `userschooldetails` VALUES (72,2,22,1,'2017-11-10 07:05:54',NULL,NULL),(73,3,23,1,'2017-11-10 07:05:54',NULL,NULL),(74,4,24,1,'2017-11-10 07:05:54',NULL,NULL),(75,20,25,1,'2017-11-10 07:05:54',NULL,NULL),(76,21,22,2,'2017-11-10 07:05:54',NULL,NULL),(77,22,22,1,'2017-11-10 07:05:54',NULL,NULL),(80,38,22,2,'2017-11-10 07:24:47',NULL,NULL),(81,40,24,1,'2017-11-10 09:18:17',NULL,NULL),(82,44,24,40,'2017-11-10 12:29:46',NULL,NULL),(83,21,24,1,'2017-11-10 12:29:46',NULL,NULL),(84,45,27,1,'2017-11-10 13:26:51',NULL,NULL),(85,45,22,2,'2017-11-10 13:26:51',NULL,NULL),(86,45,29,1,'2017-11-10 13:26:51',NULL,NULL),(87,47,22,2,'2017-11-10 14:19:21',NULL,NULL),(88,48,22,2,'2017-11-10 14:32:50',NULL,NULL),(89,49,22,2,'2017-11-13 12:27:33',NULL,NULL),(90,51,22,2,'2017-11-13 12:30:32',NULL,NULL),(91,52,22,2,'2017-11-13 13:34:05',NULL,NULL),(92,53,24,1,'2017-11-13 13:40:55',NULL,NULL),(93,53,23,1,'2017-11-13 13:40:55',NULL,NULL),(94,54,22,20,'2017-11-14 14:15:34',NULL,NULL),(95,55,22,20,'2017-11-14 14:41:31',NULL,NULL),(96,58,22,20,'2017-11-15 12:45:40',NULL,NULL),(97,59,22,20,'2017-11-15 14:13:26',NULL,NULL),(98,60,22,20,'2017-11-15 14:59:59',NULL,NULL),(99,61,22,20,'2017-11-15 15:08:28',NULL,NULL),(100,62,22,20,'2017-11-15 15:09:46',NULL,NULL),(101,63,22,20,'2017-11-15 15:10:23',NULL,NULL),(102,1,23,1,'2017-11-16 15:06:34',NULL,NULL),(103,1,24,1,'2017-11-16 15:06:34',NULL,NULL),(104,1,25,1,'2017-11-16 15:06:34',NULL,NULL),(105,1,35,1,'2017-11-16 15:06:34',NULL,NULL),(106,1,36,1,'2017-11-16 15:06:34',NULL,NULL),(107,1,37,1,'2017-11-16 15:06:34',NULL,NULL),(108,1,38,1,'2017-11-16 15:06:34',NULL,NULL),(109,1,39,1,'2017-11-16 15:06:34',NULL,NULL),(110,1,40,1,'2017-11-16 15:06:34',NULL,NULL),(111,1,43,1,'2017-11-16 15:06:34',NULL,NULL),(112,1,44,1,'2017-11-16 15:06:34',NULL,NULL),(113,1,45,1,'2017-11-16 15:06:34',NULL,NULL),(114,1,46,1,'2017-11-16 15:06:34',NULL,NULL),(115,1,47,1,'2017-11-16 15:06:34',NULL,NULL),(116,1,48,1,'2017-11-16 15:06:34',NULL,NULL),(117,1,49,1,'2017-11-16 15:06:34',NULL,NULL),(118,1,50,1,'2017-11-16 15:06:34',NULL,NULL),(119,1,51,1,'2017-11-16 15:06:34',NULL,NULL),(120,1,52,1,'2017-11-16 15:06:34',NULL,NULL),(121,1,53,1,'2017-11-16 15:06:34',NULL,NULL),(122,1,54,1,'2017-11-16 15:06:34',NULL,NULL),(123,1,55,1,'2017-11-16 15:06:34',NULL,NULL),(124,1,56,1,'2017-11-16 15:06:34',NULL,NULL),(125,1,57,1,'2017-11-16 15:06:34',NULL,NULL),(126,1,58,1,'2017-11-16 15:06:34',NULL,NULL),(127,1,59,1,'2017-11-16 15:06:34',NULL,NULL),(128,1,60,1,'2017-11-16 15:06:34',NULL,NULL),(129,1,61,1,'2017-11-16 15:06:34',NULL,NULL),(130,1,62,1,'2017-11-16 15:06:34',NULL,NULL),(131,1,63,1,'2017-11-16 15:06:34',NULL,NULL),(132,1,64,1,'2017-11-16 15:06:34',NULL,NULL),(133,1,65,1,'2017-11-16 15:06:34',NULL,NULL),(134,1,66,1,'2017-11-16 15:06:34',NULL,NULL),(135,1,70,1,'2017-11-16 15:06:34',NULL,NULL),(137,1,72,1,'2017-11-16 15:06:34',NULL,NULL),(138,1,81,1,'2017-11-16 15:06:34',NULL,NULL),(139,1,83,1,'2017-11-16 15:06:34',NULL,NULL),(140,1,86,1,'2017-11-16 15:06:34',NULL,NULL),(141,1,89,1,'2017-11-16 15:06:34',NULL,NULL),(142,1,90,1,'2017-11-16 15:06:34',NULL,NULL),(143,1,92,1,'2017-11-16 15:06:34',NULL,NULL),(144,1,82,1,'2017-11-16 15:06:34',NULL,NULL),(145,1,84,1,'2017-11-16 15:06:34',NULL,NULL),(146,1,88,1,'2017-11-16 15:06:34',NULL,NULL),(147,1,22,1,'2017-11-16 15:06:34',NULL,NULL),(148,1,26,1,'2017-11-16 15:06:34',NULL,NULL),(149,1,27,1,'2017-11-16 15:06:34',NULL,NULL),(150,1,28,1,'2017-11-16 15:06:34',NULL,NULL),(151,1,29,1,'2017-11-16 15:06:34',NULL,NULL),(165,1,94,1,'2017-11-16 09:47:56',NULL,NULL),(166,1,99,1,'2017-11-16 10:07:36',NULL,NULL),(167,1,71,1,'2017-11-16 15:44:29',NULL,NULL),(168,64,23,1,'2017-11-16 12:08:21',NULL,NULL),(169,64,24,1,'2017-11-16 12:08:21',NULL,NULL);
/*!40000 ALTER TABLE `userschooldetails` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
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

-- Dump completed on 2017-11-16 19:25:27
