CREATE DATABASE  IF NOT EXISTS `schoolfeesystem_int` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `schoolfeesystem_int`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 192.168.101.22    Database: schoolfeesystem_int
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academicyear`
--

LOCK TABLES `academicyear` WRITE;
/*!40000 ALTER TABLE `academicyear` DISABLE KEYS */;
INSERT INTO `academicyear` VALUES (4,70,'2017-11-15','2018-11-15','2017  - 18',0,42,'2017-11-15 06:53:17',42,'2017-11-15 14:23:05'),(5,70,'2018-11-16','2019-11-15','2018 - 19',0,42,'2017-11-15 06:55:36',NULL,NULL),(6,70,'2017-11-15','2018-11-14','2017 - 18',0,42,'2017-11-15 14:20:35',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl`
--

LOCK TABLES `acl` WRITE;
/*!40000 ALTER TABLE `acl` DISABLE KEYS */;
INSERT INTO `acl` VALUES (1,'Institute','find','READ','DENY','ROLE','$everyone'),(2,'Board','find','READ','DENY','ROLE','$everyone'),(3,'School','find','READ','DENY','ROLE','$everyone'),(4,'Role','find','READ','DENY','ROLE','$everyone'),(5,'user','find','READ','DENY','ROLE','$everyone'),(6,'Frequency','find','READ','DENY','ROLE','$everyone'),(7,'Class','find','READ','DENY','ROLE','$everyone'),(8,'Division','find','READ','DENY','ROLE','$everyone'),(9,'Category','find','READ','DENY','ROLE','$everyone'),(10,'Feehead','find','READ','DENY','ROLE','$everyone'),(11,'Feeplan','find','READ','DENY','ROLE','$everyone'),(12,'Transport','find','READ','DENY','ROLE','$everyone'),(13,'Addhocfee','find','READ','DENY','ROLE','$everyone'),(14,'Student','find','READ','DENY','ROLE','$everyone'),(15,'ProcessFee','find','READ','DENY','ROLE','$everyone'),(16,'Report','find','READ','DENY','ROLE','$everyone'),(17,'Academicyear','find','READ','DENY','ROLE','$everyone'),(18,'Institute','findById','READ','DENY','ROLE','$everyone'),(19,'Board','findById','READ','DENY','ROLE','$everyone'),(20,'School','findById','READ','DENY','ROLE','$everyone'),(21,'Role','findById','READ','DENY','ROLE','$everyone'),(22,'user','findById','READ','DENY','ROLE','$everyone'),(23,'Frequency','findById','READ','DENY','ROLE','$everyone'),(24,'Class','findById','READ','DENY','ROLE','$everyone'),(25,'Division','findById','READ','DENY','ROLE','$everyone'),(26,'Category','findById','READ','DENY','ROLE','$everyone'),(27,'Feehead','findById','READ','DENY','ROLE','$everyone'),(28,'Feeplan','findById','READ','DENY','ROLE','$everyone'),(29,'Transport','findById','READ','DENY','ROLE','$everyone'),(30,'Addhocfee','findById','READ','DENY','ROLE','$everyone'),(31,'Student','findById','READ','DENY','ROLE','$everyone'),(32,'ProcessFee','findById','READ','DENY','ROLE','$everyone'),(33,'Report','findById','READ','DENY','ROLE','$everyone'),(34,'Academicyear','findById','READ','DENY','ROLE','$everyone'),(35,'Institute','create','WRITE','DENY','ROLE','$everyone'),(36,'Board','create','WRITE','DENY','ROLE','$everyone'),(37,'School','create','WRITE','DENY','ROLE','$everyone'),(38,'Role','create','WRITE','DENY','ROLE','$everyone'),(39,'user','create','WRITE','DENY','ROLE','$everyone'),(40,'Frequency','create','WRITE','DENY','ROLE','$everyone'),(41,'Class','create','WRITE','DENY','ROLE','$everyone'),(42,'Division','create','WRITE','DENY','ROLE','$everyone'),(43,'Category','create','WRITE','DENY','ROLE','$everyone'),(44,'Feehead','create','WRITE','DENY','ROLE','$everyone'),(45,'Feeplan','create','WRITE','DENY','ROLE','$everyone'),(46,'Transport','create','WRITE','DENY','ROLE','$everyone'),(47,'Addhocfee','create','WRITE','DENY','ROLE','$everyone'),(48,'Student','create','WRITE','DENY','ROLE','$everyone'),(49,'ProcessFee','create','WRITE','DENY','ROLE','$everyone'),(50,'Report','create','WRITE','DENY','ROLE','$everyone'),(51,'Academicyear','create','WRITE','DENY','ROLE','$everyone'),(52,'Institute','updateAttributes','WRITE','DENY','ROLE','$everyone'),(53,'Board','updateAttributes','WRITE','DENY','ROLE','$everyone'),(54,'School','updateAttributes','WRITE','DENY','ROLE','$everyone'),(55,'Role','updateAttributes','WRITE','DENY','ROLE','$everyone'),(56,'user','updateAttributes','WRITE','DENY','ROLE','$everyone'),(57,'Frequency','updateAttributes','WRITE','DENY','ROLE','$everyone'),(58,'Class','updateAttributes','WRITE','DENY','ROLE','$everyone'),(59,'Division','updateAttributes','WRITE','DENY','ROLE','$everyone'),(60,'Category','updateAttributes','WRITE','DENY','ROLE','$everyone'),(61,'Feehead','updateAttributes','WRITE','DENY','ROLE','$everyone'),(62,'Feeplan','updateAttributes','WRITE','DENY','ROLE','$everyone'),(63,'Transport','updateAttributes','WRITE','DENY','ROLE','$everyone'),(64,'Addhocfee','updateAttributes','WRITE','DENY','ROLE','$everyone'),(65,'Student','updateAttributes','WRITE','DENY','ROLE','$everyone'),(66,'ProcessFee','updateAttributes','WRITE','DENY','ROLE','$everyone'),(67,'Report','updateAttributes','WRITE','DENY','ROLE','$everyone'),(68,'Academicyear','updateAttributes','WRITE','DENY','ROLE','$everyone'),(69,'Institute','destroyById','WRITE','DENY','ROLE','$everyone'),(70,'Board','destroyById','WRITE','DENY','ROLE','$everyone'),(71,'School','destroyById','WRITE','DENY','ROLE','$everyone'),(72,'Role','destroyById','WRITE','DENY','ROLE','$everyone'),(73,'user','destroyById','WRITE','DENY','ROLE','$everyone'),(74,'Frequency','destroyById','WRITE','DENY','ROLE','$everyone'),(75,'Class','destroyById','WRITE','DENY','ROLE','$everyone'),(76,'Division','destroyById','WRITE','DENY','ROLE','$everyone'),(77,'Category','destroyById','WRITE','DENY','ROLE','$everyone'),(78,'Feehead','destroyById','WRITE','DENY','ROLE','$everyone'),(79,'Feeplan','destroyById','WRITE','DENY','ROLE','$everyone'),(80,'Transport','destroyById','WRITE','DENY','ROLE','$everyone'),(81,'Addhocfee','destroyById','WRITE','DENY','ROLE','$everyone'),(82,'Student','destroyById','WRITE','DENY','ROLE','$everyone'),(83,'ProcessFee','destroyById','WRITE','DENY','ROLE','$everyone'),(84,'Report','destroyById','WRITE','DENY','ROLE','$everyone'),(85,'Academicyear','destroyById','WRITE','DENY','ROLE','$everyone'),(86,'user','createUser','EXECUTE','DENY','ROLE','$everyone'),(87,'Institute','count','READ','DENY','ROLE','$everyone'),(88,'Board','count','READ','DENY','ROLE','$everyone'),(89,'School','count','READ','DENY','ROLE','$everyone'),(90,'Role','count','READ','DENY','ROLE','$everyone'),(91,'user','count','READ','DENY','ROLE','$everyone'),(92,'Frequency','count','READ','DENY','ROLE','$everyone'),(93,'Class','count','READ','DENY','ROLE','$everyone'),(94,'Division','count','READ','DENY','ROLE','$everyone'),(95,'Category','count','READ','DENY','ROLE','$everyone'),(96,'Feehead','count','READ','DENY','ROLE','$everyone'),(97,'Feeplan','count','READ','DENY','ROLE','$everyone'),(98,'Transport','count','READ','DENY','ROLE','$everyone'),(99,'Addhocfee','count','READ','DENY','ROLE','$everyone'),(100,'Student','count','READ','DENY','ROLE','$everyone'),(101,'ProcessFee','count','READ','DENY','ROLE','$everyone'),(102,'Report','count','READ','DENY','ROLE','$everyone'),(103,'Academicyear','count','READ','DENY','ROLE','$everyone'),(104,'Institute','find','READ','ALLOW','ROLE','SuperAdmin'),(105,'Board','find','READ','ALLOW','ROLE','SuperAdmin'),(106,'School','find','READ','ALLOW','ROLE','SuperAdmin'),(107,'Role','find','READ','ALLOW','ROLE','SuperAdmin'),(108,'user','find','READ','ALLOW','ROLE','SuperAdmin'),(109,'Frequency','find','READ','ALLOW','ROLE','SuperAdmin'),(110,'Class','find','READ','ALLOW','ROLE','SuperAdmin'),(111,'Division','find','READ','ALLOW','ROLE','SuperAdmin'),(112,'Category','find','READ','ALLOW','ROLE','SuperAdmin'),(113,'Feehead','find','READ','ALLOW','ROLE','SuperAdmin'),(114,'Feeplan','find','READ','ALLOW','ROLE','SuperAdmin'),(115,'Transport','find','READ','ALLOW','ROLE','SuperAdmin'),(116,'Addhocfee','find','READ','ALLOW','ROLE','SuperAdmin'),(117,'Student','find','READ','ALLOW','ROLE','SuperAdmin'),(118,'ProcessFee','find','READ','ALLOW','ROLE','SuperAdmin'),(119,'Report','find','READ','ALLOW','ROLE','SuperAdmin'),(120,'Academicyear','find','READ','ALLOW','ROLE','SuperAdmin'),(121,'Institute','findById','READ','ALLOW','ROLE','SuperAdmin'),(122,'Board','findById','READ','ALLOW','ROLE','SuperAdmin'),(123,'School','findById','READ','ALLOW','ROLE','SuperAdmin'),(124,'Role','findById','READ','ALLOW','ROLE','SuperAdmin'),(125,'user','findById','READ','ALLOW','ROLE','SuperAdmin'),(126,'Frequency','findById','READ','ALLOW','ROLE','SuperAdmin'),(127,'Class','findById','READ','ALLOW','ROLE','SuperAdmin'),(128,'Division','findById','READ','ALLOW','ROLE','SuperAdmin'),(129,'Category','findById','READ','ALLOW','ROLE','SuperAdmin'),(130,'Feehead','findById','READ','ALLOW','ROLE','SuperAdmin'),(131,'Feeplan','findById','READ','ALLOW','ROLE','SuperAdmin'),(132,'Transport','findById','READ','ALLOW','ROLE','SuperAdmin'),(133,'Addhocfee','findById','READ','ALLOW','ROLE','SuperAdmin'),(134,'Student','findById','READ','ALLOW','ROLE','SuperAdmin'),(135,'ProcessFee','findById','READ','ALLOW','ROLE','SuperAdmin'),(136,'Report','findById','READ','ALLOW','ROLE','SuperAdmin'),(137,'Academicyear','findById','READ','ALLOW','ROLE','SuperAdmin'),(138,'Institute','create','WRITE','ALLOW','ROLE','SuperAdmin'),(139,'Board','create','WRITE','ALLOW','ROLE','SuperAdmin'),(140,'School','create','WRITE','ALLOW','ROLE','SuperAdmin'),(141,'Role','create','WRITE','ALLOW','ROLE','SuperAdmin'),(142,'user','create','WRITE','ALLOW','ROLE','SuperAdmin'),(143,'Frequency','create','WRITE','ALLOW','ROLE','SuperAdmin'),(144,'Class','create','WRITE','ALLOW','ROLE','SuperAdmin'),(145,'Division','create','WRITE','ALLOW','ROLE','SuperAdmin'),(146,'Category','create','WRITE','ALLOW','ROLE','SuperAdmin'),(147,'Feehead','create','WRITE','ALLOW','ROLE','SuperAdmin'),(148,'Feeplan','create','WRITE','ALLOW','ROLE','SuperAdmin'),(149,'Transport','create','WRITE','ALLOW','ROLE','SuperAdmin'),(150,'Addhocfee','create','WRITE','ALLOW','ROLE','SuperAdmin'),(151,'Student','create','WRITE','ALLOW','ROLE','SuperAdmin'),(152,'ProcessFee','create','WRITE','ALLOW','ROLE','SuperAdmin'),(153,'Report','create','WRITE','ALLOW','ROLE','SuperAdmin'),(154,'Academicyear','create','WRITE','ALLOW','ROLE','SuperAdmin'),(155,'Institute','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(156,'Board','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(157,'School','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(158,'Role','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(159,'user','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(160,'Frequency','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(161,'Class','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(162,'Division','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(163,'Category','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(164,'Feehead','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(165,'Feeplan','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(166,'Transport','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(167,'Addhocfee','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(168,'Student','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(169,'ProcessFee','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(170,'Report','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(171,'Academicyear','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(172,'Institute','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(173,'Board','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(174,'School','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(175,'Role','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(176,'user','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(177,'Frequency','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(178,'Class','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(179,'Division','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(180,'Category','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(181,'Feehead','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(182,'Feeplan','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(183,'Transport','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(184,'Addhocfee','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(185,'Student','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(186,'ProcessFee','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(187,'Report','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(188,'Academicyear','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(189,'user','createUser','EXECUTE','ALLOW','ROLE','SuperAdmin'),(190,'user','updateUser','EXECUTE','ALLOW','ROLE','SuperAdmin'),(191,'Institute','count','READ','ALLOW','ROLE','SuperAdmin'),(192,'Board','count','READ','ALLOW','ROLE','SuperAdmin'),(193,'School','count','READ','ALLOW','ROLE','SuperAdmin'),(194,'Role','count','READ','ALLOW','ROLE','SuperAdmin'),(195,'user','count','READ','ALLOW','ROLE','SuperAdmin'),(196,'Frequency','count','READ','ALLOW','ROLE','SuperAdmin'),(197,'Class','count','READ','ALLOW','ROLE','SuperAdmin'),(198,'Division','count','READ','ALLOW','ROLE','SuperAdmin'),(199,'Category','count','READ','ALLOW','ROLE','SuperAdmin'),(200,'Feehead','count','READ','ALLOW','ROLE','SuperAdmin'),(201,'Feeplan','count','READ','ALLOW','ROLE','SuperAdmin'),(202,'Transport','count','READ','ALLOW','ROLE','SuperAdmin'),(203,'Addhocfee','count','READ','ALLOW','ROLE','SuperAdmin'),(204,'Student','count','READ','ALLOW','ROLE','SuperAdmin'),(205,'ProcessFee','count','READ','ALLOW','ROLE','SuperAdmin'),(206,'Report','count','READ','ALLOW','ROLE','SuperAdmin'),(207,'Academicyear','count','READ','ALLOW','ROLE','SuperAdmin'),(208,'role','find','READ','ALLOW','ROLE','SchoolAdmin'),(209,'user','find','READ','ALLOW','ROLE','SchoolAdmin'),(210,'Frequency','find','READ','ALLOW','ROLE','SchoolAdmin'),(211,'Class','find','READ','ALLOW','ROLE','SchoolAdmin'),(212,'Division','find','READ','ALLOW','ROLE','SchoolAdmin'),(213,'Category','find','READ','ALLOW','ROLE','SchoolAdmin'),(214,'Feehead','find','READ','ALLOW','ROLE','SchoolAdmin'),(215,'Feeplan','find','READ','ALLOW','ROLE','SchoolAdmin'),(216,'Transport','find','READ','ALLOW','ROLE','SchoolAdmin'),(217,'Addhocfee','find','READ','ALLOW','ROLE','SchoolAdmin'),(218,'Student','find','READ','ALLOW','ROLE','SchoolAdmin'),(219,'ProcessFee','find','READ','ALLOW','ROLE','SchoolAdmin'),(220,'Report','find','READ','ALLOW','ROLE','SchoolAdmin'),(221,'Academicyear','find','READ','ALLOW','ROLE','SchoolAdmin'),(222,'Role','findById','READ','ALLOW','ROLE','SchoolAdmin'),(223,'user','findById','READ','ALLOW','ROLE','SchoolAdmin'),(224,'Frequency','findById','READ','ALLOW','ROLE','SchoolAdmin'),(225,'Class','findById','READ','ALLOW','ROLE','SchoolAdmin'),(226,'Division','findById','READ','ALLOW','ROLE','SchoolAdmin'),(227,'Category','findById','READ','ALLOW','ROLE','SchoolAdmin'),(228,'Feehead','findById','READ','ALLOW','ROLE','SchoolAdmin'),(229,'Feeplan','findById','READ','ALLOW','ROLE','SchoolAdmin'),(230,'Transport','findById','READ','ALLOW','ROLE','SchoolAdmin'),(231,'Addhocfee','findById','READ','ALLOW','ROLE','SchoolAdmin'),(232,'Student','findById','READ','ALLOW','ROLE','SchoolAdmin'),(233,'ProcessFee','findById','READ','ALLOW','ROLE','SchoolAdmin'),(234,'Report','findById','READ','ALLOW','ROLE','SchoolAdmin'),(235,'Academicyear','findById','READ','ALLOW','ROLE','SchoolAdmin'),(236,'Role','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(237,'user','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(238,'Frequency','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(239,'Class','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(240,'Division','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(241,'Category','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(242,'Feehead','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(243,'Feeplan','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(244,'Transport','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(245,'Addhocfee','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(246,'Student','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(247,'ProcessFee','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(248,'Report','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(249,'Academicyear','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(250,'Role','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(251,'user','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(252,'Frequency','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(253,'Class','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(254,'Division','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(255,'Category','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(256,'Feehead','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(257,'Feeplan','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(258,'Transport','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(259,'Addhocfee','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(260,'Student','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(261,'ProcessFee','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(262,'Report','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(263,'Academicyear','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(264,'Role','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(265,'user','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(266,'Frequency','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(267,'Class','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(268,'Division','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(269,'Category','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(270,'Feehead','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(271,'Feeplan','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(272,'Transport','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(273,'Addhocfee','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(274,'Student','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(275,'ProcessFee','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(276,'Report','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(277,'Academicyear','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(278,'user','createUser','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(279,'user','updateUser','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(280,'Role','count','READ','ALLOW','ROLE','SchoolAdmin'),(281,'user','count','READ','ALLOW','ROLE','SchoolAdmin'),(282,'Frequency','count','READ','ALLOW','ROLE','SchoolAdmin'),(283,'Class','count','READ','ALLOW','ROLE','SchoolAdmin'),(284,'Division','count','READ','ALLOW','ROLE','SchoolAdmin'),(285,'Category','count','READ','ALLOW','ROLE','SchoolAdmin'),(286,'Feehead','count','READ','ALLOW','ROLE','SchoolAdmin'),(287,'Feeplan','count','READ','ALLOW','ROLE','SchoolAdmin'),(288,'Transport','count','READ','ALLOW','ROLE','SchoolAdmin'),(289,'Addhocfee','count','READ','ALLOW','ROLE','SchoolAdmin'),(290,'Student','count','READ','ALLOW','ROLE','SchoolAdmin'),(291,'ProcessFee','count','READ','ALLOW','ROLE','SchoolAdmin'),(292,'Report','count','READ','ALLOW','ROLE','SchoolAdmin'),(293,'Academicyear','count','READ','ALLOW','ROLE','SchoolAdmin'),(304,'Permission','find','READ','DENY','ROLE','$everyone'),(305,'Menu','find','READ','DENY','ROLE','$everyone'),(306,'Permission','findById','READ','DENY','ROLE','$everyone'),(307,'Menu','findById','READ','DENY','ROLE','$everyone'),(308,'Permission','create','WRITE','DENY','ROLE','$everyone'),(309,'Menu','create','WRITE','DENY','ROLE','$everyone'),(310,'Permission','updateAttributes','WRITE','DENY','ROLE','$everyone'),(311,'Menu','updateAttributes','WRITE','DENY','ROLE','$everyone'),(312,'Permission','destroyById','WRITE','DENY','ROLE','$everyone'),(313,'Menu','destroyById','WRITE','DENY','ROLE','$everyone'),(314,'Permission','count','READ','DENY','ROLE','$everyone'),(315,'Menu','count','READ','DENY','ROLE','$everyone'),(316,'Permission','find','READ','ALLOW','ROLE','SuperAdmin'),(317,'Permission','findById','READ','ALLOW','ROLE','SuperAdmin'),(318,'Permission','find','READ','ALLOW','ROLE','SchoolAdmin'),(319,'Permission','findById','READ','ALLOW','ROLE','SchoolAdmin'),(320,'Permission','count','READ','ALLOW','ROLE','SuperAdmin'),(321,'Permission','count','READ','ALLOW','ROLE','SchoolAdmin'),(322,'Institute','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(323,'Board','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(324,'School','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(325,'role','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(326,'user','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(327,'Frequency','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(328,'Class','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(329,'Division','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(330,'Category','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(331,'Feehead','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(332,'Feeplan','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(333,'Transport','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(334,'Addhocfee','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(335,'Student','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(336,'ProcessFee','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(337,'Report','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(338,'Academicyear','deleteRecord','EXECUTE','DENY','ROLE','$everyone'),(339,'Institute','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(340,'Board','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(341,'School','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(342,'role','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(343,'user','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(344,'Frequency','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(345,'Class','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(346,'Division','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(347,'Category','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(348,'Feehead','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(349,'Feeplan','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(350,'Transport','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(351,'Addhocfee','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(352,'Student','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(353,'ProcessFee','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(354,'Report','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(355,'Academicyear','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(356,'role','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(357,'user','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(358,'Frequency','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(359,'Class','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(360,'Division','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(361,'Category','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(362,'Feehead','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(363,'Feeplan','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(364,'Transport','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(365,'Addhocfee','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(366,'Student','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(367,'ProcessFee','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(368,'Report','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(369,'Academicyear','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(370,'Class','create','WRITE','ALLOW','ROLE','Accounting assistant70'),(371,'Class','find','READ','ALLOW','ROLE','Accounting assistant70'),(372,'Class','findById','READ','ALLOW','ROLE','Accounting assistant70'),(373,'Class','count','READ','ALLOW','ROLE','Accounting assistant70'),(374,'Student','create','WRITE','ALLOW','ROLE','Accounting assistant70'),(375,'Report','create','WRITE','ALLOW','ROLE','Accounting assistant70'),(379,'Report','find','READ','ALLOW','ROLE','Accounting assistant70'),(380,'Report','findById','READ','ALLOW','ROLE','Accounting assistant70'),(381,'Report','count','READ','ALLOW','ROLE','Accounting assistant70'),(382,'Class','updateAttributes','WRITE','ALLOW','ROLE','Accounting assistant70'),(388,'Category','create','WRITE','ALLOW','ROLE','Accounting Manager70'),(393,'Student','updateAttributes','WRITE','ALLOW','ROLE','Accounting Manager70'),(394,'Student','find','READ','ALLOW','ROLE','Accounting Manager70'),(395,'Student','findById','READ','ALLOW','ROLE','Accounting Manager70'),(396,'Student','count','READ','ALLOW','ROLE','Accounting Manager70'),(403,'role','__get__permission','READ','DENY','ROLE','$everyone'),(404,'role','__get__permission','READ','ALLOW','ROLE','$authenticated'),(405,'Class','find','READ','ALLOW','ROLE','Accounting Manager70'),(406,'Class','findById','READ','ALLOW','ROLE','Accounting Manager70'),(407,'Class','count','READ','ALLOW','ROLE','Accounting Manager70'),(408,'Class','updateAttributes','WRITE','ALLOW','ROLE','Accounting Manager70'),(410,'Class','create','WRITE','ALLOW','ROLE','Accounting Manager70'),(411,'Class','deleteRecord','EXECUTE','ALLOW','ROLE','Accounting Manager70'),(412,'Division','find','READ','ALLOW','ROLE','Accounting Manager70'),(413,'Division','findById','READ','ALLOW','ROLE','Accounting Manager70'),(414,'Division','count','READ','ALLOW','ROLE','Accounting Manager70'),(415,'Division','updateAttributes','WRITE','ALLOW','ROLE','Accounting Manager70'),(416,'Division','create','WRITE','ALLOW','ROLE','Accounting Manager70'),(420,'Category','find','READ','ALLOW','ROLE','Accounting Manager70'),(421,'Category','findById','READ','ALLOW','ROLE','Accounting Manager70'),(422,'Category','count','READ','ALLOW','ROLE','Accounting Manager70'),(423,'Category','updateAttributes','WRITE','ALLOW','ROLE','Accounting Manager70'),(424,'Category','deleteRecord','EXECUTE','ALLOW','ROLE','Accounting Manager70'),(425,'Division','deleteRecord','EXECUTE','ALLOW','ROLE','Accounting Manager70'),(429,'Feehead','find','READ','ALLOW','ROLE','Accounting Manager70'),(430,'Feehead','findById','READ','ALLOW','ROLE','Accounting Manager70'),(431,'Feehead','count','READ','ALLOW','ROLE','Accounting Manager70'),(434,'Feeplan','find','READ','ALLOW','ROLE','Accounting Manager70'),(435,'Feeplan','findById','READ','ALLOW','ROLE','Accounting Manager70'),(436,'Feeplan','count','READ','ALLOW','ROLE','Accounting Manager70'),(437,'Feeplan','create','WRITE','ALLOW','ROLE','Accounting Manager70'),(438,'ProcessFee','find','READ','ALLOW','ROLE','Accounting Manager70'),(439,'ProcessFee','findById','READ','ALLOW','ROLE','Accounting Manager70'),(440,'ProcessFee','count','READ','ALLOW','ROLE','Accounting Manager70');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'CBSC','CBSC Board',0,1,'2017-11-06 17:58:10',NULL,NULL),(2,'ICSC','ICSC Board',0,1,'2017-11-06 17:58:10',NULL,NULL),(3,'SSE','SSE Board',0,1,'2017-11-06 17:58:10',NULL,NULL),(7,'test','test',0,1,'2017-11-14 06:33:54',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'Staff','Staff Category','Staff',1,1,'2017-11-06 12:32:49',1,'2017-11-15 13:23:05'),(3,'Management','Management Category','Management',0,1,'2017-11-06 12:32:49',NULL,NULL),(4,'RTE','RTE Category','RTE',0,1,'2017-11-06 12:32:49',NULL,NULL),(7,'General','General Category','GEN',0,46,'2017-11-13 10:04:46',NULL,NULL),(13,'OPEN','OPEN Category','005',0,46,'2017-11-13 11:54:16',NULL,NULL),(19,'Staff1','staff category ','Staff1',0,42,'2017-11-15 14:15:20',45,'2017-11-16 06:43:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (11,70,'Std 1','Std First',0,46,'2017-11-13 09:36:34',45,'2017-11-16 06:24:08'),(13,70,'Std 2','Std 2',0,46,'2017-11-13 09:37:34',42,'2017-11-15 04:57:27'),(14,70,'Std 3','Std 3',0,46,'2017-11-13 09:38:00',42,'2017-11-15 04:57:35'),(16,70,'Std 4 ','Std 4 ',0,42,'2017-11-13 10:08:27',42,'2017-11-15 04:57:43'),(18,71,'Std 1','Std 1',0,46,'2017-11-15 09:57:46',NULL,NULL),(19,70,'Std 5','Std 5',0,44,'2017-11-15 12:49:06',44,'2017-11-15 12:49:33'),(20,70,'Std 6','Std 6',1,45,'2017-11-16 06:28:40',45,'2017-11-16 06:29:10');
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
  UNIQUE KEY `school_class_divisionCode` (`schoolId`,`classId`,`divisionName`),
  UNIQUE KEY `school_class_divisionCode_UNIQUE` (`schoolId`,`classId`,`divisionCode`),
  KEY `FK_Division_Class_idx` (`classId`),
  KEY `FK_Division_School_idx` (`schoolId`),
  CONSTRAINT `FK_Division_Class` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Division_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (31,11,70,'A','A',0,46,'2017-11-13 12:02:12',NULL,NULL),(32,11,70,'B','B',0,46,'2017-11-13 12:02:31',NULL,NULL),(33,13,70,'A','A',0,46,'2017-11-13 12:02:41',NULL,NULL),(34,13,70,'B','B',0,46,'2017-11-13 12:02:51',NULL,NULL),(35,14,70,'A','A',0,46,'2017-11-13 12:03:06',NULL,NULL),(36,14,70,'B','B',0,42,'2017-11-14 08:55:34',NULL,NULL),(37,18,71,'A','AA',0,46,'2017-11-15 09:57:57',46,'2017-11-15 09:58:09'),(38,19,70,'B','B',0,44,'2017-11-15 12:50:23',45,'2017-11-16 06:30:51'),(39,19,70,'C','C',0,44,'2017-11-15 12:50:44',45,'2017-11-16 06:30:36');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequency`
--

LOCK TABLES `frequency` WRITE;
/*!40000 ALTER TABLE `frequency` DISABLE KEYS */;
INSERT INTO `frequency` VALUES (1,'Monthly',12,0,1,'2017-11-06 12:35:41',NULL,NULL),(2,'Quarterly',3,0,1,'2017-11-06 12:35:41',NULL,NULL),(3,'Half Yearly',2,0,1,'2017-11-06 12:35:41',NULL,NULL),(4,'Yearly',1,0,1,'2017-11-06 12:35:41',NULL,NULL),(5,'OneTime',1,0,1,'2017-11-06 12:35:41',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute`
--

LOCK TABLES `institute` WRITE;
/*!40000 ALTER TABLE `institute` DISABLE KEYS */;
INSERT INTO `institute` VALUES (27,'St.Xaviers education ','Great campus, infrastructure, huge area availability, football turf, basketball courts','9762982702','abc@gmail.com','3, Narveer Tanaji Malusare Rd, Vittalvadi, Narveer Tanaji Malusare Rd, Vittalvadi, Hingne Khurd,Pune, Maharashtra 411051',0,1,'2017-11-10 10:30:33',1,'2017-11-16 07:02:33'),(29,'Symboisis','Colleges in india, Best collage for economics in pune, bsc and msc economic.','9762982700','','3rd Floor, SCHC Building, Senapati Bapat Road, Pune, Maharashtra 411004',0,1,'2017-11-10 10:51:33',NULL,NULL),(30,'Bishop\'s education','Bishop\'s School','9789451231','abc@gmail.com','5-A, General Bhagat Marg, Camp, Pune, Maharashtra 411001',0,1,'2017-11-13 09:26:01',1,'2017-11-13 09:28:39');
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
INSERT INTO `menu` VALUES (1,'Institures',0,1,0,1,'2017-11-03 15:12:09',NULL,NULL),(2,'Board',0,2,0,1,'2017-11-03 15:12:09',NULL,NULL),(3,'Schools',0,3,0,1,'2017-11-03 15:12:09',NULL,NULL),(4,'Role And Permissions',0,4,0,1,'2017-11-03 15:12:09',NULL,NULL),(5,'User Management',0,5,0,1,'2017-11-03 15:12:09',NULL,NULL),(6,'Frequency',0,6,0,1,'2017-11-03 15:12:09',NULL,NULL),(7,'Class',0,7,0,1,'2017-11-03 15:12:09',NULL,NULL),(8,'Division',0,8,0,1,'2017-11-03 15:12:09',NULL,NULL),(9,'Category',0,9,0,1,'2017-11-03 15:12:09',NULL,NULL),(10,'Fee Heads',0,10,0,1,'2017-11-03 15:12:09',NULL,NULL),(11,'Fee Plans',0,11,0,1,'2017-11-03 15:12:09',NULL,NULL),(12,'Zone',0,12,0,1,'2017-11-03 15:12:09',NULL,NULL),(13,'AddHoc Fee',0,13,0,1,'2017-11-03 15:12:09',NULL,NULL),(14,'Student Management',0,14,0,1,'2017-11-03 15:12:09',NULL,NULL),(15,'Process Fee',0,15,0,1,'2017-11-03 15:12:09',NULL,NULL),(16,'Reports',0,16,0,1,'2017-11-03 15:12:09',NULL,NULL),(17,'AcademicYear',0,17,0,1,'2017-11-03 12:49:35',NULL,NULL),(18,'Permission',0,18,0,1,'2017-11-13 12:23:06',NULL,NULL);
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
  CONSTRAINT `FK_Permission_Menu` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Permission_Role` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,1,1,'Institute.Create','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),(2,1,1,'Institute.Read','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),(3,1,1,'Institute.Update','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),(4,1,1,'Institute.Delete','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),(5,2,1,'Board.Create','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),(6,2,1,'Board.Read','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),(7,2,1,'Board.Update','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),(8,2,1,'Board.Delete','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),(9,3,1,'School.Create','School',0,1,'2017-11-03 15:52:26',NULL,NULL),(10,3,1,'School.Read','School',0,1,'2017-11-03 15:52:26',NULL,NULL),(11,3,1,'School.Update','School',0,1,'2017-11-03 15:52:26',NULL,NULL),(12,3,1,'School.Delete','School',0,1,'2017-11-03 15:52:26',NULL,NULL),(13,4,1,'Role.Create','role',0,1,'2017-11-03 15:52:26',NULL,NULL),(14,4,1,'Role.Read','role',0,1,'2017-11-03 15:52:26',NULL,NULL),(15,4,1,'Role.Update','role',0,1,'2017-11-03 15:52:26',NULL,NULL),(16,4,1,'Role.Delete','role',0,1,'2017-11-03 15:52:26',NULL,NULL),(17,5,1,'User.Create','user',0,1,'2017-11-03 15:52:26',NULL,NULL),(18,5,1,'User.Read','user',0,1,'2017-11-03 15:52:26',NULL,NULL),(19,5,1,'User.Update','user',0,1,'2017-11-03 15:52:26',NULL,NULL),(20,5,1,'User.Delete','user',0,1,'2017-11-03 15:52:26',NULL,NULL),(21,6,1,'Frequency.Create','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),(22,6,1,'Frequency.Read','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),(23,6,1,'Frequency.Update','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),(24,6,1,'Frequency.Delete','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),(25,7,1,'Class.Create','Class',0,1,'2017-11-03 15:52:26',NULL,NULL),(26,7,1,'Class.Read','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(27,7,1,'Class.Update','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(28,7,1,'Class.Delete','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(29,8,1,'Division.Create','Dvision',0,1,'2017-11-03 16:11:22',NULL,NULL),(30,8,1,'Division.Read','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),(31,8,1,'Division.Update','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),(32,8,1,'Division.Delete','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),(33,9,1,'Category.Create','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),(34,9,1,'Category.Read','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),(35,9,1,'Category.Update','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),(36,9,1,'Category.Delete','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),(37,10,1,'Feehead.Create','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(38,10,1,'Feehead.Read','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(39,10,1,'Feehead.Update','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(40,10,1,'Feehead.Delete','Feehead',0,1,'2017-11-03 16:11:24',NULL,NULL),(41,11,1,'Feeplan.Create','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(42,11,1,'Feeplan.Read','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(43,11,1,'Feeplan.Update','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(44,11,1,'Feeplan.Delete','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(45,12,1,'Transport.Create','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(46,12,1,'Transport.Read','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(47,12,1,'Transport.Update','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(48,12,1,'Transport.Delete','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(49,13,1,'Addhocfee.Create','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(50,13,1,'Addhocfee.Read','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(51,13,1,'Addhocfee.Update','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(52,13,1,'Addhocfee.Delete','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(53,14,1,'Student.Create','Student',0,1,'2017-11-03 16:11:24',NULL,NULL),(54,14,1,'Student.Read','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(55,14,1,'Student.Update','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(56,14,1,'Student.Delete','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(57,15,1,'ProcessFee.Create','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(58,15,1,'ProcessFee.Read','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(59,15,1,'ProcessFee.Update','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(60,15,1,'ProcessFee.Delete','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(61,16,1,'Report.Create','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(62,16,1,'Report.Read','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(63,16,1,'Report.Update','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(64,16,1,'Report.Delete','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(65,17,1,'AcademicYear.Create','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(66,17,1,'AcademicYear.Read','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(67,17,1,'AcademicYear.Update','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(68,17,1,'AcademicYear.Delete','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(74,7,2,'Class.Create','Class',0,1,'2017-11-03 15:52:26',NULL,NULL),(75,7,2,'Class.Read','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(76,7,2,'Class.Update','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(77,7,2,'Class.Delete','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(78,8,2,'Division.Create','Division',0,1,'2017-11-03 16:11:22',NULL,NULL),(79,8,2,'Division.Read','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),(80,8,2,'Division.Update','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),(81,8,2,'Division.Delete','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),(86,10,2,'Feehead.Create','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(87,10,2,'Feehead.Read','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(88,10,2,'Feehead.Update','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(89,10,2,'Feehead.Delete','Feehead',0,1,'2017-11-03 16:11:24',NULL,NULL),(90,11,2,'Feeplan.Create','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(91,11,2,'Feeplan.Read','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(92,11,2,'Feeplan.Update','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(93,11,2,'Feeplan.Delete','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(94,12,2,'Transport.Create','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(95,12,2,'Transport.Read','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(96,12,2,'Transport.Update','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(97,12,2,'Transport.Delete','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(98,13,2,'Addhocfee.Create','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(99,13,2,'Addhocfee.Read','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(100,13,2,'Addhocfee.Update','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(101,13,2,'Addhocfee.Delete','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(102,14,2,'Student.Create','Student',0,1,'2017-11-03 16:11:24',NULL,NULL),(103,14,2,'Student.Read','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(104,14,2,'Student.Update','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(105,14,2,'Student.Delete','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(106,15,2,'ProcessFee.Create','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(107,15,2,'ProcessFee.Read','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(108,15,2,'ProcessFee.Update','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(109,15,2,'ProcessFee.Delete','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(110,16,2,'Report.Create','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(111,16,2,'Report.Read','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(112,16,2,'Report.Update','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(113,16,2,'Report.Delete','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(114,17,2,'AcademicYear.Create','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(115,17,2,'AcademicYear.Read','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(116,17,2,'AcademicYear.Update','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(117,17,2,'AcademicYear.Delete','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,NULL,'SuperAdmin','Super Administration','SuperAdmin',0,1,'2017-11-03 16:14:10',NULL,NULL),(2,NULL,'SchoolAdmin','School Admin','SchoolAdmin',0,1,'2017-11-03 16:14:10',NULL,NULL),(16,70,'Accounting assistant70','Responsible to define & view Fee heads and Fee plans','Accounting Assistant',0,42,'2017-11-10 11:37:00',42,'2017-11-10 11:37:27'),(20,70,'Accounting Manager70','Monitor finance related operations','Accounting Manager',0,42,'2017-11-10 11:43:10',42,NULL),(21,70,'Accounting supervisor70','Able to define adhoc fees and transport fee plans','Accounting supervisor',0,42,'2017-11-10 11:52:54',NULL,NULL),(22,70,'Financial reporting manager70','Supervising financial reports for each year','Financial reporting manager',0,42,'2017-11-10 11:53:22',NULL,NULL),(31,70,'Accountant analyst70','','Accountant analyst',0,46,'2017-11-13 09:31:24',NULL,NULL),(32,70,'Audit consultant70','','Audit consultant',0,42,'2017-11-13 10:09:20',46,'2017-11-13 10:34:40'),(33,71,'accountant Staff71','Responsible to handle fee heads and fee plans','accountant Staff',0,46,'2017-11-13 11:25:17',NULL,NULL),(34,71,'Finance head71','Responsible to set cost for each fee head','Finance head',0,46,'2017-11-13 11:26:44',NULL,NULL),(35,71,'abc35','','abc',0,46,'2017-11-15 10:04:04',46,NULL),(36,70,'accasistant36','acc asistant1','acc asistant',0,42,'2017-11-15 14:16:02',42,NULL),(37,70,'test37','test','test',1,42,'2017-11-15 14:33:47',42,NULL),(38,70,'test38','test','test',1,42,'2017-11-15 15:34:14',42,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolemapping`
--

LOCK TABLES `rolemapping` WRITE;
/*!40000 ALTER TABLE `rolemapping` DISABLE KEYS */;
INSERT INTO `rolemapping` VALUES (1,'USER',1,1),(26,'USER',42,2),(27,'USER',43,2),(28,'USER',44,16),(29,'USER',45,20),(30,'USER',46,2),(31,'USER',47,16),(32,'USER',48,32),(33,'USER',49,16),(34,'USER',50,31),(35,'USER',51,2),(36,'USER',52,2),(37,'USER',53,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolemenudetails`
--

LOCK TABLES `rolemenudetails` WRITE;
/*!40000 ALTER TABLE `rolemenudetails` DISABLE KEYS */;
INSERT INTO `rolemenudetails` VALUES (1,1,1,1,'2017-11-03 12:20:07',NULL,NULL),(2,1,2,1,'2017-11-03 12:20:07',NULL,NULL),(3,1,3,1,'2017-11-03 12:20:07',NULL,NULL),(4,1,4,1,'2017-11-03 12:20:07',NULL,NULL),(5,1,5,1,'2017-11-03 12:20:07',NULL,NULL),(6,1,6,1,'2017-11-03 12:20:07',NULL,NULL),(7,1,7,1,'2017-11-03 12:20:07',NULL,NULL),(8,1,8,1,'2017-11-03 12:20:07',NULL,NULL),(9,1,9,1,'2017-11-03 12:20:07',NULL,NULL),(10,1,10,1,'2017-11-03 12:20:07',NULL,NULL),(11,1,11,1,'2017-11-03 12:20:07',NULL,NULL),(12,1,12,1,'2017-11-03 12:20:07',NULL,NULL),(13,1,13,1,'2017-11-03 12:20:07',NULL,NULL),(14,1,14,1,'2017-11-03 12:20:07',NULL,NULL),(15,1,15,1,'2017-11-03 12:20:07',NULL,NULL),(16,1,16,1,'2017-11-03 12:20:07',NULL,NULL),(17,1,17,1,'2017-11-03 13:16:14',NULL,NULL),(18,2,4,1,'2017-11-03 14:03:33',NULL,NULL),(19,2,5,1,'2017-11-03 14:03:33',NULL,NULL),(21,2,7,1,'2017-11-03 14:03:33',NULL,NULL),(22,2,8,1,'2017-11-03 14:03:33',NULL,NULL),(24,2,10,1,'2017-11-03 14:03:33',NULL,NULL),(25,2,11,1,'2017-11-03 14:03:33',NULL,NULL),(26,2,12,1,'2017-11-03 14:03:33',NULL,NULL),(27,2,13,1,'2017-11-03 14:03:33',NULL,NULL),(28,2,14,1,'2017-11-03 14:03:33',NULL,NULL),(29,2,15,1,'2017-11-03 14:03:33',NULL,NULL),(30,2,16,1,'2017-11-03 14:03:33',NULL,NULL),(31,2,17,1,'2017-11-03 14:03:33',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=1642 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolepermissiondetails`
--

LOCK TABLES `rolepermissiondetails` WRITE;
/*!40000 ALTER TABLE `rolepermissiondetails` DISABLE KEYS */;
INSERT INTO `rolepermissiondetails` VALUES (1,1,1,'Institute.Create',1,'2017-11-03 13:56:01',NULL,NULL),(2,1,2,'Institute.Read',1,'2017-11-03 13:56:01',NULL,NULL),(3,1,3,'Institute.Update',1,'2017-11-03 13:56:01',NULL,NULL),(4,1,4,'Institute.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(5,1,5,'Board.Create',1,'2017-11-03 13:56:01',NULL,NULL),(6,1,6,'Board.Read',1,'2017-11-03 13:56:01',NULL,NULL),(7,1,7,'Board.Update',1,'2017-11-03 13:56:01',NULL,NULL),(8,1,8,'Board.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(9,1,9,'School.Create',1,'2017-11-03 13:56:01',NULL,NULL),(10,1,10,'School.Read',1,'2017-11-03 13:56:01',NULL,NULL),(11,1,11,'School.Update',1,'2017-11-03 13:56:01',NULL,NULL),(12,1,12,'School.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(13,1,13,'Role.Create',1,'2017-11-03 13:56:01',NULL,NULL),(14,1,14,'Role.Read',1,'2017-11-03 13:56:01',NULL,NULL),(15,1,15,'Role.Update',1,'2017-11-03 13:56:01',NULL,NULL),(16,1,16,'Role.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(17,1,17,'User.Create',1,'2017-11-03 13:56:01',NULL,NULL),(18,1,18,'User.Read',1,'2017-11-03 13:56:01',NULL,NULL),(19,1,19,'User.Update',1,'2017-11-03 13:56:01',NULL,NULL),(20,1,20,'User.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(21,1,21,'Frequency.Create',1,'2017-11-03 13:56:01',NULL,NULL),(22,1,22,'Frequency.Read',1,'2017-11-03 13:56:01',NULL,NULL),(23,1,23,'Frequency.Update',1,'2017-11-03 13:56:01',NULL,NULL),(24,1,24,'Frequency.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(25,1,25,'Class.Create',1,'2017-11-03 13:56:01',NULL,NULL),(26,1,26,'Class.Read',1,'2017-11-03 13:56:01',NULL,NULL),(27,1,27,'Class.Update',1,'2017-11-03 13:56:01',NULL,NULL),(28,1,28,'Class.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(29,1,29,'Division.Create',1,'2017-11-03 13:56:01',NULL,NULL),(30,1,30,'Division.Read',1,'2017-11-03 13:56:01',NULL,NULL),(31,1,31,'Division.Update',1,'2017-11-03 13:56:01',NULL,NULL),(32,1,32,'Division.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(33,1,33,'Category.Create',1,'2017-11-03 13:56:01',NULL,NULL),(34,1,34,'Category.Read',1,'2017-11-03 13:56:01',NULL,NULL),(35,1,35,'Category.Update',1,'2017-11-03 13:56:01',NULL,NULL),(36,1,36,'Category.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(37,1,37,'Feehead.Create',1,'2017-11-03 13:56:01',NULL,NULL),(38,1,38,'Feehead.Read',1,'2017-11-03 13:56:01',NULL,NULL),(39,1,39,'Feehead.Update',1,'2017-11-03 13:56:01',NULL,NULL),(40,1,40,'Feehead.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(41,1,41,'Feeplan.Create',1,'2017-11-03 13:56:01',NULL,NULL),(42,1,42,'Feeplan.Read',1,'2017-11-03 13:56:01',NULL,NULL),(43,1,43,'Feeplan.Update',1,'2017-11-03 13:56:01',NULL,NULL),(44,1,44,'Feeplan.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(45,1,45,'Transport.Create',1,'2017-11-03 13:56:01',NULL,NULL),(46,1,46,'Transport.Read',1,'2017-11-03 13:56:01',NULL,NULL),(47,1,47,'Transport.Update',1,'2017-11-03 13:56:01',NULL,NULL),(48,1,48,'Transport.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(49,1,49,'Addhocfee.Create',1,'2017-11-03 13:56:01',NULL,NULL),(50,1,50,'Addhocfee.Read',1,'2017-11-03 13:56:01',NULL,NULL),(51,1,51,'Addhocfee.Update',1,'2017-11-03 13:56:01',NULL,NULL),(52,1,52,'Addhocfee.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(53,1,53,'Student.Create',1,'2017-11-03 13:56:01',NULL,NULL),(54,1,54,'Student.Read',1,'2017-11-03 13:56:01',NULL,NULL),(55,1,55,'Student.Update',1,'2017-11-03 13:56:01',NULL,NULL),(56,1,56,'Student.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(57,1,57,'ProcessFee.Create',1,'2017-11-03 13:56:01',NULL,NULL),(58,1,58,'ProcessFee.Read',1,'2017-11-03 13:56:01',NULL,NULL),(59,1,59,'ProcessFee.Update',1,'2017-11-03 13:56:01',NULL,NULL),(60,1,60,'ProcessFee.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(61,1,61,'Report.Create',1,'2017-11-03 13:56:01',NULL,NULL),(62,1,62,'Report.Read',1,'2017-11-03 13:56:01',NULL,NULL),(63,1,63,'Report.Update',1,'2017-11-03 13:56:01',NULL,NULL),(64,1,64,'Report.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(65,1,65,'AcademicYear.Create',1,'2017-11-03 13:56:01',NULL,NULL),(66,1,66,'AcademicYear.Read',1,'2017-11-03 13:56:01',NULL,NULL),(67,1,67,'AcademicYear.Update',1,'2017-11-03 13:56:01',NULL,NULL),(68,1,68,'AcademicYear.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(69,2,13,'Role.Create',1,'2017-11-03 14:06:07',NULL,NULL),(70,2,14,'Role.Read',1,'2017-11-03 14:06:07',NULL,NULL),(71,2,15,'Role.Update',1,'2017-11-03 14:06:07',NULL,NULL),(72,2,16,'Role.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(73,2,17,'User.Create',1,'2017-11-03 14:06:07',NULL,NULL),(74,2,18,'User.Read',1,'2017-11-03 14:06:07',NULL,NULL),(75,2,19,'User.Update',1,'2017-11-03 14:06:07',NULL,NULL),(76,2,20,'User.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(81,2,25,'Class.Create',1,'2017-11-03 14:06:07',NULL,NULL),(82,2,26,'Class.Read',1,'2017-11-03 14:06:07',NULL,NULL),(83,2,27,'Class.Update',1,'2017-11-03 14:06:07',NULL,NULL),(84,2,28,'Class.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(85,2,29,'Division.Create',1,'2017-11-03 14:06:07',NULL,NULL),(86,2,30,'Division.Read',1,'2017-11-03 14:06:07',NULL,NULL),(87,2,31,'Division.Update',1,'2017-11-03 14:06:07',NULL,NULL),(88,2,32,'Division.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(93,2,37,'Feehead.Create',1,'2017-11-03 14:06:07',NULL,NULL),(94,2,38,'Feehead.Read',1,'2017-11-03 14:06:07',NULL,NULL),(95,2,39,'Feehead.Update',1,'2017-11-03 14:06:07',NULL,NULL),(96,2,40,'Feehead.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(97,2,41,'Feeplan.Create',1,'2017-11-03 14:06:07',NULL,NULL),(98,2,42,'Feeplan.Read',1,'2017-11-03 14:06:07',NULL,NULL),(99,2,43,'Feeplan.Update',1,'2017-11-03 14:06:07',NULL,NULL),(100,2,44,'Feeplan.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(101,2,45,'Transport.Create',1,'2017-11-03 14:06:07',NULL,NULL),(102,2,46,'Transport.Read',1,'2017-11-03 14:06:07',NULL,NULL),(103,2,47,'Transport.Update',1,'2017-11-03 14:06:07',NULL,NULL),(104,2,48,'Transport.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(105,2,49,'Addhocfee.Create',1,'2017-11-03 14:06:07',NULL,NULL),(106,2,50,'Addhocfee.Read',1,'2017-11-03 14:06:07',NULL,NULL),(107,2,51,'Addhocfee.Update',1,'2017-11-03 14:06:07',NULL,NULL),(108,2,52,'Addhocfee.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(109,2,53,'Student.Create',1,'2017-11-03 14:06:07',NULL,NULL),(110,2,54,'Student.Read',1,'2017-11-03 14:06:07',NULL,NULL),(111,2,55,'Student.Update',1,'2017-11-03 14:06:07',NULL,NULL),(112,2,56,'Student.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(113,2,57,'ProcessFee.Create',1,'2017-11-03 14:06:07',NULL,NULL),(114,2,58,'ProcessFee.Read',1,'2017-11-03 14:06:07',NULL,NULL),(115,2,59,'ProcessFee.Update',1,'2017-11-03 14:06:07',NULL,NULL),(116,2,60,'ProcessFee.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(117,2,61,'Report.Create',1,'2017-11-03 14:06:07',NULL,NULL),(118,2,62,'Report.Read',1,'2017-11-03 14:06:07',NULL,NULL),(119,2,63,'Report.Update',1,'2017-11-03 14:06:07',NULL,NULL),(120,2,64,'Report.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(121,2,65,'AcademicYear.Create',1,'2017-11-03 14:06:07',NULL,NULL),(122,2,66,'AcademicYear.Read',1,'2017-11-03 14:06:07',NULL,NULL),(123,2,67,'AcademicYear.Update',1,'2017-11-03 14:06:07',NULL,NULL),(124,2,68,'AcademicYear.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(1579,16,37,'Feehead.Create',42,'2017-11-10 11:37:47',NULL,NULL),(1589,16,38,'Feehead.Read',42,'2017-11-10 12:20:12',NULL,NULL),(1590,16,41,'Feeplan.Create',42,'2017-11-10 12:21:55',NULL,NULL),(1593,21,17,'User.Create',46,'2017-11-13 05:22:34',NULL,NULL),(1594,21,13,'Role.Create',46,'2017-11-13 05:22:49',NULL,NULL),(1595,21,15,'Role.Update',46,'2017-11-13 05:22:54',NULL,NULL),(1596,21,14,'Role.Read',46,'2017-11-13 05:22:56',NULL,NULL),(1605,16,25,'Class.Create',42,'2017-11-14 06:18:52',NULL,NULL),(1606,16,26,'Class.Read',42,'2017-11-14 06:18:55',NULL,NULL),(1607,16,53,'Student.Create',42,'2017-11-14 06:19:02',NULL,NULL),(1608,16,61,'Report.Create',42,'2017-11-14 06:27:47',NULL,NULL),(1610,16,62,'Report.Read',42,'2017-11-14 06:28:37',NULL,NULL),(1611,16,76,'Class.Update',42,'2017-11-15 12:47:58',NULL,NULL),(1618,20,104,'Student.Update',42,'2017-11-16 05:37:39',NULL,NULL),(1619,20,103,'Student.Read',42,'2017-11-16 06:07:38',NULL,NULL),(1622,20,75,'Class.Read',42,'2017-11-16 06:22:39',NULL,NULL),(1623,20,76,'Class.Update',42,'2017-11-16 06:23:40',NULL,NULL),(1625,20,74,'Class.Create',42,'2017-11-16 06:28:06',NULL,NULL),(1626,20,77,'Class.Delete',42,'2017-11-16 06:28:54',NULL,NULL),(1627,20,79,'Division.Read',42,'2017-11-16 06:29:29',NULL,NULL),(1628,20,80,'Division.Update',42,'2017-11-16 06:30:09',NULL,NULL),(1629,20,78,'Division.Create',42,'2017-11-16 06:31:03',NULL,NULL),(1634,20,81,'Division.Delete',42,'2017-11-16 06:46:53',NULL,NULL),(1636,20,87,'Feehead.Read',42,'2017-11-16 06:59:19',NULL,NULL),(1639,20,91,'Feeplan.Read',42,'2017-11-16 07:01:14',NULL,NULL),(1640,20,90,'Feeplan.Create',42,'2017-11-16 07:01:36',NULL,NULL),(1641,20,107,'ProcessFee.Read',42,'2017-11-16 07:02:03',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (70,27,1,'St. Xavier School','X001','abc@yahoo.com','9762982700','3, Narveer Tanaji Malusare Rd, Vittalvadi, Narveer Tanaji Malusare Rd, Vittalvadi','Pune','Maharashtra',NULL,'logo.png','St.Xavier',0,1,'2017-11-10 11:01:05',1,'2017-11-14 07:19:22'),(71,27,2,'St.Vincent\'s high school','X002','abcd@gmail.com','9762982700','No. 2005/2006, St. Vincent\'s Street, Opposite Shivaji Market, Camp','Pune','Maharashtra',NULL,'logo.png','St.Vincent',0,1,'2017-11-10 11:02:33',1,'2017-11-14 07:12:58'),(72,29,2,'Symbiosis International School','SM001','','9822053665','Gate No. 3, Symbiosis Viman Nagar Campus, Off., New Airport Rd, Viman Nagar, Pune, Maharashtra 411014','Pune','Maharashtra',NULL,'logo.png','Symbi International',0,1,'2017-11-13 05:37:37',1,'2017-11-13 05:37:59'),(74,29,2,'Symbiosis Institute of Management Studies','SM002','','','Khadki, Range Hill Rd, Pune, Maharashtra 411020','','',NULL,'logo.png','SIMS',0,1,'2017-11-13 06:49:45',NULL,NULL),(80,29,1,'Symboisis school of economics','SM004','','','','','',NULL,'logo.png','SSE',1,1,'2017-11-13 07:37:29',1,'2017-11-14 13:02:41'),(82,29,1,'Symbiosis Institute of Management Studies(CBSC)','sm005','','','','','',NULL,'logo.png','SIMS',1,1,'2017-11-13 09:24:25',1,'2017-11-15 13:28:03'),(83,30,1,'The Bishop\'s Co-Ed School','BP01','','','Plot No. 78, Yerawada Town Planning Scheme, Near Pepsi Godown, Village Yerawada, Kalyani Nagar, ','Pune','Maharashtra',NULL,'logo.png','Bishop',0,1,'2017-11-13 09:26:55',1,'2017-11-13 09:27:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (61,70,3,11,31,NULL,'1267','10101','Riya','Satish','Anam','Female','Satish','Anam','9833368007','Kajal','Anam','9619650762','.','.','0','1987-09-04','2016-10-09','.','','Maharashtra','India','0','','hindu','general','not known','2011',1,1,'2017-11-13 18:30:00',42,'2017-11-14 13:45:50'),(62,70,2,11,31,NULL,'1268','10102','Anushree','Somnathan','Vishwanathan','Female','Somnathan','Vishwanathan','9833451810','Latha','Vishwanathan','9987579428','.','.','0','1985-10-09','2016-10-08','.','','Maharashtra','India','0','','hindu','general','not known','2011',1,1,'2017-11-13 18:30:00',42,'2017-11-14 13:45:54'),(67,70,7,11,31,NULL,'K001','1001','James','Alpha','Butt','Male','Alpha','Butt','9762147262','Daniela','Butt','9822053665','','','','2014-03-02','2017-06-14','Aundh, Pune','','Maharashtra','India','9762982700','','Hindu','OPEN','O+','2011',1,42,'2017-11-14 13:57:37',42,'2017-11-14 14:06:13'),(68,70,4,11,31,NULL,'K002','1002','Josephine','Refugia','Darakjy','Male','Refugia','Darakjy','9762147263','Cecilia','Darakjy','9822053666','','','','2014-03-03','2017-06-14','Baner, Pune','','Maharashtra','India','9762982701','','Hindu','OPEN','AB+','2011',1,42,'2017-11-14 13:57:38',42,'2017-11-14 14:06:19'),(69,70,7,11,32,NULL,'K003','1003','Art','Shawnda','Venere','Male','Shawnda','Venere','9762147264','Leslie','Venere','9822053667','','','','2014-03-04','2017-06-14','Sb road,Pune','','Maharashtra','India','9762982702','','Hindu','OPEN','O+','5',0,42,'2017-11-14 13:57:38',42,'2017-11-16 04:13:45'),(70,70,3,11,32,NULL,'K004','1004','Lenna','Mona','Paprocki','Female','Mona','Paprocki','9762147265','Nan','Paprocki','9822053668','','','','2014-03-05','2017-06-14','Law college Road Pune','','Maharashtra','India','9762982703','','Hindu','OPEN','O+','2011',0,42,'2017-11-14 13:57:38',NULL,NULL),(71,70,3,13,31,NULL,'K005','1005','Donette','Gilma','Foller','Female','Gilma','Foller','9762147266','Izetta','Foller','9822053669','','','','2014-03-06','2017-06-14','Kothrud, Pune','','Maharashtra','India','9762982704','','Hindu','OPEN','B+','2011',0,42,'2017-11-14 13:57:38',NULL,NULL),(72,70,7,13,32,NULL,'K006','1006','Simona','Janey','Morasca','Female','Janey','Morasca','9762147267','Tegan','Morasca','9822053670','','','','2014-03-07','2017-06-14','Karvenagar,Pune','','Maharashtra','India','9762982705','','Hindu','OPEN','O+','2011',0,42,'2017-11-14 13:57:38',NULL,NULL),(73,70,4,13,32,NULL,'K007','1007','Mitsue','Lili','Tollner','Female','Lili','Tollner','9762147268','Ruthann','Tollner','9822053671','','','','2014-03-08','2017-06-14','Pimple saudagar,Pune','','Maharashtra','India','9762982706','','Hindu','OPEN','O+','2011',0,42,'2017-11-14 13:57:38',NULL,NULL),(74,70,2,14,31,NULL,'K008','1008','Leota','Loren','Dilliard','Male','Loren','Dilliard','9762147269','Joni','Dilliard','9822053672','','','','2014-03-09','2017-06-14','Prabhat road,Pune','','Maharashtra','India','9762982707','','Hindu','OPEN','B -','2011',0,42,'2017-11-14 13:57:38',NULL,NULL),(75,70,3,14,31,NULL,'K009','1009','Sage','Dorothy','Wieser','Male','Dorothy','Wieser','9762147270','Vi','Wieser','9822053673','','','','2014-03-10','2017-06-14','Camp ,Pune','','Maharashtra','India','9762982708','','Hindu','OPEN','O+','2011',0,42,'2017-11-14 13:57:39',NULL,NULL),(76,70,7,14,32,NULL,'K010','1010','Kris','Gail','Marrier','Male','Gail','Marrier','9762147271','Colette','Marrier','9822053674','','','','2014-03-11','2017-06-14','Kalyani nagar,Pune','','Maharashtra','India','9762982709','','Hindu','OPEN','AB+','2011',0,42,'2017-11-14 13:57:39',NULL,NULL),(98,70,7,11,31,NULL,'G001','10020','Jolanda','Glendora','Hanafan','Male','Glendora','Hanafan','8941687452','Sarbacher','Hanafan','9786455232','','','','2002-05-11','2012-06-14','Aundh, Pune','','Maharashtra','India','9822053665','','Hindu','OPEN','O+','2011',0,42,'2017-11-14 14:15:51',NULL,NULL),(99,70,7,11,31,NULL,'G001','1030','Jolanda','Glendora','Hanafan','Male','Glendora','Hanafan','8941687452','Sarbacher','Hanafan','9786455232','','','','2002-05-11','2012-06-14','Aundh, Pune','','Maharashtra','India','9822053665','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 05:00:51',NULL,NULL),(100,70,4,11,32,NULL,'G002','1031','Barrett','Avery','Toyama','Male','Avery','Toyama','8941687453','Steier','Toyama','9786455233','','','','2002-05-12','2012-06-14','Baner, Pune','','Maharashtra','India','9822053666','','Hindu','OPEN','AB+','2011',0,42,'2017-11-15 05:00:51',NULL,NULL),(101,70,3,11,31,NULL,'G004','1033','Ashlyn','Nicolette','Pinilla','Female','Nicolette','Pinilla','8941687455','Brossart','Pinilla','9786455235','','','','2002-05-14','2012-06-14','Law college Road Pune','','Maharashtra','India','9822053668','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 05:00:51',NULL,NULL),(102,70,7,14,32,NULL,'G011','1046','Rebecka','Gwenn','Gesick','Female','Gwenn','Gesick','8941687466','Suffield','Gesick','9786455246','','','','2002-05-25','2012-06-14','Sb road,Pune','','Maharashtra','India','9822053679','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 05:00:51',NULL,NULL),(103,70,7,14,31,NULL,'G011','1047','Frederica','Salena','Blunk','Female','Salena','Blunk','8941687467','Karpel','Blunk','9786455247','','','','2002-05-26','2012-06-14','Law college Road Pune','','Maharashtra','India','9822053680','','Hindu','OPEN','B -','2011',0,42,'2017-11-15 05:00:51',NULL,NULL),(104,70,7,14,32,NULL,'G017','1049','Glen','Yoko','Bartolet','Female','Yoko','Bartolet','8941687468','Fishburne','Bartolet','9786455248','','','','2002-05-27','2012-06-14','Kothrud, Pune','','Maharashtra','India','9822053681','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 05:00:51',NULL,NULL),(105,70,4,14,31,NULL,'G018','1050','Freeman','Taryn','Gochal','Female','Taryn','Gochal','8941687469','Moyd','Gochal','9786455249','','','','2002-05-28','2012-06-14','Karvenagar,Pune','','Maharashtra','India','9822053682','','Hindu','OPEN','AB+','2011',0,42,'2017-11-15 05:00:52',NULL,NULL),(106,70,2,14,32,NULL,'G019','1051','Vincent','Katina','Meinerding','Male','Katina','Meinerding','8941687470','Polidori','Meinerding','9786455250','','','','2002-05-29','2012-06-14','Pimple saudagar,Pune','','Maharashtra','India','9822053683','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 05:00:52',NULL,NULL),(107,70,3,14,31,NULL,'G020','1052','Rima','Rickie','Bevelacqua','Male','Rickie','Bevelacqua','8941687471','Plumer','Bevelacqua','9786455251','','','','2002-05-30','2012-06-14','Prabhat road,Pune','','Maharashtra','India','9822053684','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 05:00:52',NULL,NULL),(108,70,2,13,31,NULL,'G007','1036','Marge','Tiera','Limmel','Female','Tiera','Limmel','8941687458','Frankel','Limmel','9786455238','','','','2011-05-16','2012-06-14','Pimple saudagar,Pune','','Maharashtra','India','9822053671','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 05:17:30',NULL,NULL),(109,70,3,13,32,NULL,'G009','1038','Aliza','Earleen','Baltimore','Female','Earleen','Baltimore','8941687460','Mai','Baltimore','9786455240','','','','2011-05-19','2012-06-14','Camp ,Pune','','Maharashtra','India','9822053673','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 05:17:30',NULL,NULL),(110,70,7,13,31,NULL,'G011','1042','Viola','Ressie','Bitsuie','Male','Ressie','Bitsuie','8941687462','Auffrey','Bitsuie','9786455242','','','','2011-05-21','2012-06-14','KP,Pune','','Maharashtra','India','9822053675','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 05:17:30',NULL,NULL),(111,70,2,14,31,NULL,'G011','1044','Willodean','Eladia','Konopacki','Female','Eladia','Konopacki','8941687464','Saulter','Konopacki','9786455244','','','','2012-05-21','2012-06-14','Aundh,Pune','','Maharashtra','India','9822053677','','Hindu','OPEN','B+','2011',0,42,'2017-11-15 05:17:30',NULL,NULL),(116,70,7,13,32,NULL,'G010','1039','Mozell','Leonida','Pelkowski','Male','Leonida','Pelkowski','8941687461','Gobern','Pelkowski','9786455241','','','','2011-05-20','2012-06-14','Kalyani nagar,Pune','','Maharashtra','India','9822053674','','Hindu','OPEN','AB+','2011',0,42,'2017-11-15 05:24:38',NULL,NULL),(117,70,3,14,31,NULL,'G011','1045','Beckie','Chaya','Silvestrini','Male','Chaya','Silvestrini','8941687465','Malvin','Silvestrini','9786455245','','','','2012-05-21','2012-06-14','Baner, Pune','','Maharashtra','India','9822053678','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 05:24:38',NULL,NULL),(118,70,4,11,31,NULL,'G006','1035','Ronny','Virgina','Caiafa','Female','Virgina','Caiafa','8941687457','Tegarden','Caiafa','9786455237','','','','2010-05-16','2012-06-14','Karvenagar,Pune','','Maharashtra','India','9822053670','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 05:26:53',NULL,NULL),(119,70,7,11,32,NULL,'G005','1034','Fausto','Tracey','Agramonte','Male','Tracey','Agramonte','8941687456','Modzelewski','Agramonte','9786455236','','','','2010-05-15','2012-06-14','Kothrud, Pune','','Maharashtra','India','9822053669','','Hindu','OPEN','B+','2011',0,42,'2017-11-15 05:29:23',NULL,NULL),(122,70,3,14,31,NULL,'','1060','Rima chandra','Rickie','Bevela           cqua','Male','','','','','','','','','','2010-05-30','2012-06-14','','','','','','','','','','2011',0,42,'2017-11-15 07:20:09',NULL,NULL),(124,70,3,14,32,NULL,'K050','1063','Blair','Sherita','Malet','Male','Sherita','Malet','9762147311','Ogg','Malet','9822053714','','','','2010-05-30','2012-06-14','Baner, Pune','','Maharashtra','India','9762982749','','Hindu','OPEN','AB+','2011',0,42,'2017-11-15 08:39:48',NULL,NULL),(125,70,3,14,31,NULL,'K051','1064','Brock','Lashawnda','Bolognia','Female','Lashawnda','Bolognia','9762147312','Saras','Bolognia','9822053715','','','','2010-05-30','2012-06-14','Sb road,Pune','','Maharashtra','India','9762982750','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 08:39:48',NULL,NULL),(126,70,3,14,31,NULL,'K052','1065','Lorrie','Ernest','Nestle','Female','Ernest','Nestle','9762147313','Stuer','Nestle','9822053716','','','','2010-05-30','2012-06-14','Law college Road Pune','','Maharashtra','India','9762982751','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 08:39:48',NULL,NULL),(127,70,3,14,31,NULL,'K053','1066','Sabra','Nobuko','Uyetake','Female','Nobuko','Uyetake','9762147314','Syrop','Uyetake','9822053717','','','','2010-05-30','2012-06-14','Kothrud, Pune','','Maharashtra','India','9762982752','','Hindu','OPEN','B+','2011',0,42,'2017-11-15 08:39:48',NULL,NULL),(128,70,3,14,31,NULL,'K054','1067','Marjory','Lavonna','Mastella','Female','Lavonna','Mastella','9762147315','Halsey','Mastella','9822053718','','','','2010-05-30','2012-06-14','Karvenagar,Pune','','Maharashtra','India','9762982753','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 08:39:48',NULL,NULL),(129,70,3,14,31,NULL,'K055','1068','Karl','Lashaunda','Klonowski','Male','Lashaunda','Klonowski','9762147316','Wolny','Klonowski','9822053719','','','','2010-05-30','2012-06-14','Pimple saudagar,Pune','','Maharashtra','India','9762982754','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 08:39:48',NULL,NULL),(130,70,4,14,32,NULL,'K057','1081','Amber','Helene','Monarrez','Female','Helene','Monarrez','9762147318','Bilden','Monarrez','9822053721','','','','2009-04-27','2010-06-14','Camp ,Pune','','Maharashtra','India','9762982756','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 08:56:29',NULL,NULL),(133,70,7,14,32,NULL,'K056','1080','Tonette','Mariann','Wenner','Female','Mariann','Wenner','9762147317','Lizama','Wenner','9822053720','','','','2009-04-26','2010-06-14','Prabhat road,Pune','','Maharashtra','India','9762982755','','Hindu','OPEN','B -','2011',0,42,'2017-11-15 08:58:50',NULL,NULL),(135,70,3,14,32,NULL,'K058','3455','Shenika','Roselle','Seewald','Female','Roselle','Seewald','9762147319','Rodenberger','Seewald','9822053722','','','','2010-06-14','2010-06-14','Kalyani nagar,Pune','','Maharashtra','India','9762982757','','Hindu','OPEN','AB+','2011',0,42,'2017-11-15 09:32:31',NULL,NULL),(136,70,4,14,32,NULL,'K059','3456','Delmy','Samira','Ahle','Female','Samira','Ahle','9762147320','Estell','Ahle','9822053723','','','','2010-06-14','2010-06-14','KP,Pune','','Maharashtra','India','9762982758','','Hindu','OPEN','O+','2011',0,42,'2017-11-15 09:32:31',NULL,NULL),(137,71,3,18,37,NULL,'K058','3457','Deeanna','Billye','Juhas','Female','Roselle','Seewald','9762147319','Rodenberger','Seewald','9822053722','','','','2010-06-14','2010-06-14','Kalyani nagar,Pune','','Maharashtra','India','9762982757','','Hindu','OPEN','AB+','2011',0,46,'2017-11-15 09:59:10',NULL,NULL),(138,71,4,18,37,NULL,'K059','3458','Blondell','Glenna','Pugh','Female','Samira','Ahle','9762147320','Estell','Ahle','9822053723','','','','2010-06-14','2010-06-14','KP,Pune','','Maharashtra','India','9762982758','','Hindu','OPEN','O+','2011',0,46,'2017-11-15 09:59:10',NULL,NULL),(139,70,3,11,31,NULL,'K058','3457','Deeanna','Billye','Juhas','Female','Roselle','Seewald','9762147319','Rodenberger','Seewald','9822053722','','','','2010-06-14','2010-06-14','Kalyani nagar,Pune','','Maharashtra','India','9762982757','','Hindu','OPEN','AB+','2011',0,46,'2017-11-15 10:02:46',NULL,NULL),(140,70,4,11,31,NULL,'K059','3458','Blondell','Glenna','Pugh','Female','Samira','Ahle','9762147320','Estell','Ahle','9822053723','','','','2010-06-14','2010-06-14','KP,Pune','','Maharashtra','India','9762982758','','Hindu','OPEN','O+','2011',0,46,'2017-11-15 10:02:46',NULL,NULL),(141,71,4,18,37,NULL,'K050','10065','Bla, nfjjir','Sherita','Malet-bhy-bb','Male','Sherita','Malet','9762147311','Ogg','Malet','9822053714','','','','2010-04-20','2010-06-14','Baner, Pune','','Maharashtra','India','9762982749','','Hindu','OPEN','AB+','2011',0,46,'2017-11-15 10:07:08',NULL,NULL),(142,71,4,18,37,NULL,'K051','10066','Brock','Lashawnda','Bolognia','Female','Lashawnda','Bolognia','9762147312','Saras','Bolognia','9822053715','','','','2009-04-21','2010-06-14','Sb road,Pune','','Maharashtra','India','9762982750','','Hindu','OPEN','O+','2011',0,46,'2017-11-15 10:07:08',NULL,NULL),(143,71,4,18,37,NULL,'K050','10067','Laurel�','Sh�erita','Ma,.?/><:;{[|!@#$%^&*()_+let-b�h�y/-bb','Male','Sherita','Malet','9762147311','Ogg','Malet','9822053714','','','','2010-04-20','2010-06-14','Baner, Pune','','Maharashtra','India','9762982749','','Hindu','OPEN','AB+','2011',0,46,'2017-11-15 10:08:49',NULL,NULL),(144,71,4,18,37,NULL,'K051','10068','Delisa','Lashawnda','Bolognia','Female','Lashawnda','Bolognia','9762147312','Saras','Bolognia','9822053715','','','','2009-04-21','2010-06-14','Sb road,Pune','','Maharashtra','India','9762982750','','Hindu','OPEN','O+','2011',0,46,'2017-11-15 10:08:49',NULL,NULL),(145,70,4,11,31,NULL,'K050','10069','<b>hello</b>\'','<b>hello</b>\'','franceco','Male','Sherita','Malet','9762147311','Ogg','Malet','9822053714','','','','2010-04-20','2010-06-14','Baner, Pune','','Maharashtra','India','9762982749','','Hindu','OPEN','AB+','2011',0,42,'2017-11-15 11:48:17',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'Administrator','$2a$10$txwgt5DoJ1K.cieu7tniguDTX9sZr9DzWYa24.BFOr6A3BDM/bHwC','1234567890','espl@eternussolutions.com','2017-11-16 08:38:46',0,0,1,1,1,NULL,NULL,0,1,'2017-11-06 16:02:16',NULL,NULL),(42,2,'XavierAdmin','$2a$10$hsBcdeU8Ixbe0xevltXXtuReQjeKoZ5K4YbMd7ug7xKpnOtr9G.9m','9762982702','sharmabarkha973@gmail.com','2017-11-16 08:39:28',0,0,0,1,1,NULL,NULL,0,1,'2017-11-10 11:08:56',1,'2017-11-13 05:33:28'),(43,2,'vincentadmin','$2a$10$nCa.HMU7bBHVuF9vZdpAceOgEDL4qtEJS9RzivYLNqYlu06lLNXGe','9762982700','barkha.sharma@eternussolutions.com',NULL,0,0,0,1,1,NULL,NULL,0,1,'2017-11-10 11:21:04',43,'2017-11-10 11:23:07'),(44,16,'manish.patil','$2a$10$m6kpNZu9tOuF5TwzgUtJA.IfJZj0JvmcFzFgHuLVa41u/zdFq4qKS','9762982700','manish.patil@eternussolutions.com',NULL,0,0,0,1,1,NULL,NULL,0,42,'2017-11-10 11:58:10',42,'2017-11-15 12:48:33'),(45,20,'suyash.chiplunkar','$2a$10$nuCNTJx1mNO.XHVjjJongOQdmlPtNhXMdntZd9m0TB2HQYjzWmfTK','9762982700','suyash.chiplunkar@eternussolutions.com','2017-11-16 08:41:26',0,0,0,1,1,NULL,NULL,0,42,'2017-11-10 12:07:19',42,'2017-11-16 06:20:35'),(46,2,'xavieradmin2','$2a$10$c5SASl6iqfp38vwnoK4cW.BRRsumxDOp5VsgLVPokCj1VTHR/bHZK','9762982700','shabnam.maniyar@eternussolutions.com',NULL,0,0,0,1,1,NULL,NULL,0,1,'2017-11-10 12:53:11',46,'2017-11-10 12:54:46'),(47,16,'fdfd','$2a$10$S.1XfXirVsMyDTvrMsikKO0utZ9RuIDHCoKDx.7rlQj6xCrH13anO','7894561230','asd@2ighds.com',NULL,0,0,0,0,0,'035a3ca90a7f4976b7876ea2755f8920cb2f65fb200ef2db9ec1153055963b564462bc49cf3201a2fda648d8faeee7a47e3503eb2658c61b7f529c8d93157f38',NULL,0,46,'2017-11-10 13:21:47',46,'2017-11-10 13:21:47'),(48,32,'Akansha.k','$2a$10$VtRzT8Xhoazd7VQWiqzA0.SWCukHXQpnTb/.h77H2P/2fmjArvFZ6','9762982700','akanksha.koulage@eternussolutions.com',NULL,0,0,1,1,1,NULL,NULL,0,46,'2017-11-13 10:10:53',48,'2017-11-13 10:23:32'),(49,16,'akshay.waikar','$2a$10$xGs9frRW58s5C0Ejc3pGse.saD5H8JDchySranyOXninhPaE9ikDK','9762982700','waikar@eternusolutions.com',NULL,0,0,0,0,1,'d2e93e31532a9717dee7201ceb3ced656fd7e2d4380b826617cb6f3e8db277c4c5203cb6d5cceb7f6e213bf0f8b8922940ace002ecc7615cd809318dbc62810f',NULL,0,46,'2017-11-13 11:38:42',46,'2017-11-13 11:40:14'),(50,31,'akshay.w','$2a$10$z50seveIKavUW2I9HMbDPennnNMufbDOdiqclW23hyw0elFrihDwW','9762982700','akshay.waikar@eternussolutions.com',NULL,0,0,1,0,1,NULL,NULL,0,46,'2017-11-13 11:41:00',46,'2017-11-13 11:41:00'),(51,2,'abhijeet.pasalkar','$2a$10$HTkTNvMgT3dlLBwoEqL17e31KAQ0Ji80FgARUmSWXe7AzCKbdyPs.','9762982700','abhijeet.pasalkar@eternussolutions.com',NULL,0,0,1,0,1,NULL,NULL,1,1,'2017-11-13 12:45:42',1,'2017-11-15 13:24:30'),(52,2,'abhi.pasalkar','$2a$10$Doyn/5hjGu26QMv61bnWduuunpng2wufNO2nwOzwFc3wjWEpFXazy','9762982700','adpasalkar@gmail.com',NULL,0,0,1,1,1,NULL,NULL,0,1,'2017-11-13 12:50:19',52,'2017-11-13 12:52:26'),(53,2,'shaggyshelar','$2a$10$txwgt5DoJ1K.cieu7tniguDTX9sZr9DzWYa24.BFOr6A3BDM/bHwC','8149886522','shaggy.shelar@gmail.com','2017-11-16 05:49:14',0,0,0,1,1,NULL,NULL,0,1,'2017-11-15 16:59:48',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userschooldetails`
--

LOCK TABLES `userschooldetails` WRITE;
/*!40000 ALTER TABLE `userschooldetails` DISABLE KEYS */;
INSERT INTO `userschooldetails` VALUES (65,43,71,1,'2017-11-10 11:21:04',NULL,NULL),(72,46,70,1,'2017-11-10 12:53:11',NULL,NULL),(73,46,71,1,'2017-11-10 12:53:11',NULL,NULL),(74,47,70,46,'2017-11-10 13:21:47',NULL,NULL),(75,42,70,1,'2017-11-13 05:33:28',NULL,NULL),(76,48,70,46,'2017-11-13 10:10:53',NULL,NULL),(79,49,70,46,'2017-11-13 11:40:14',NULL,NULL),(80,50,70,46,'2017-11-13 11:41:00',NULL,NULL),(81,51,72,1,'2017-11-13 12:45:42',NULL,NULL),(82,51,80,1,'2017-11-13 12:45:42',NULL,NULL),(83,52,72,1,'2017-11-13 12:50:19',NULL,NULL),(84,52,74,1,'2017-11-13 12:50:19',NULL,NULL),(88,53,70,1,'2017-11-15 17:00:38',NULL,NULL),(89,44,70,42,'2017-11-15 12:48:33',NULL,NULL),(92,45,70,42,'2017-11-16 06:20:36',NULL,NULL);
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
-- Dumping events for database 'schoolfeesystem_int'
--

--
-- Dumping routines for database 'schoolfeesystem_int'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-16 14:14:48
