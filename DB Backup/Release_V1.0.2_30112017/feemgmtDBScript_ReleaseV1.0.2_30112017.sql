-- CREATE DATABASE  IF NOT EXISTS `feemgmt` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `feemgmt`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: feemgmt
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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='b0460f9a-54f1-11e7-ba34-54c558754d14:1-6281';

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
  `isCurrent` tinyint(1) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schoolId_startDate_endDate_UNIQUE` (`schoolId`,`startDate`,`endDate`),
  KEY `FK_AcademicYear_School_idx` (`schoolId`),
  CONSTRAINT `FK_AcademicYear_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academicyear`
--

LOCK TABLES `academicyear` WRITE;
/*!40000 ALTER TABLE `academicyear` DISABLE KEYS */;
INSERT INTO `academicyear` VALUES (1,1,'2017-11-15','2018-11-15','2017-18',1,0,6,'2017-11-18 11:49:21',NULL,NULL),(2,2,'2017-11-20','2018-11-20','2017-18',1,0,13,'2017-11-21 05:54:07',NULL,NULL);
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
INSERT INTO `accesstoken` VALUES ('0lFW1ERprEjNcsjqOwhYKkCzptkYeJPhtpMut3B87uG029G06xgYLp3A0UWB7BjQ',1209600,NULL,'2017-11-21 05:38:41',1),('1QXRKfckoHWVleiMYvSupcmSD9eBMwo7NFs5W9w7yn1IlwDo64WoXhzrBRjnADpY',1209600,NULL,'2017-11-18 13:15:11',1),('32iNQ3JnQj5zKWbYLdJUzlEHB8HUAY8hxReFbcQpPDTu75sjnrwBIqcrXTkR0zlD',1209600,NULL,'2017-11-18 07:21:15',1),('3t5IVSfN2rKA2WJzPBxKBMRDNq0eCvfSVAk81NyDHYvG84RAUN4P2hcvi5NKGeCn',1209600,NULL,'2017-11-18 09:35:12',1),('4f7S35KKupGSSV9SqphiO3hosFZL2CTBru64U5F1a2syu0mfJ0tb4CB6VJ1Fmssb',1209600,NULL,'2017-11-21 09:25:43',1),('58XevVkG7v89vEVUYpfkqk4kNyKL3r5m9nU43jPxGCYGsCWJGkGKWH2LvmWA94vj',1209600,NULL,'2017-11-19 10:45:42',1),('5Wn0aHNtSjG6opuhRKsuB7oFqs9Ws5Tvg1RX2BZrRJ4vr2hsiQLOWJlIUFQLkivx',1209600,NULL,'2017-11-22 16:09:39',13),('62sSaCZW4G52ogG30zwPeVI1b5jIYRwAmGwBV3GyTK0VQWggevEDIugHxLK4U4Eu',1209600,NULL,'2017-11-20 10:28:53',1),('6zVhXOZeKbeD6HE23pNwNsElUkJXtEuKmmNXubtRclgc6enoikBGp0ce9QmQV3zS',1209600,NULL,'2017-11-18 11:08:26',1),('7wHuETOPkZjFyo5f2Hfs3U2H4qrsKWDfOOWjDxbRL6nUHXK36vUc5TPwgkqMfiy9',1209600,NULL,'2017-11-18 09:58:47',8),('8Ci3f5gpXiloI2FG8tXohGiz9VKB7zAsz8HKzT47qdjAm3r1l20t1b4bBHXLQF3P',1209600,NULL,'2017-11-20 13:31:55',1),('96NXAA0DxE2sIV75JHqjUyVbYVBvogbFVW3CTlvr2GbkTpuEnAAvcbrn5Z5j5xOQ',1209600,NULL,'2017-11-23 05:08:09',12),('9poqiToKfWjeHliaLXwDMBYyNuMLYuXQgqK6oxcKx4W6A4HpuQxCbiePHDGhKGxP',1209600,NULL,'2017-11-23 05:18:31',13),('a9RRlKIzHV0QlAmuZDwcAXEGRlZyJzhvYiazTcGn5kDRr4q6Ml0IJ6qASnkVGYFR',1209600,NULL,'2017-11-21 10:08:31',12),('agxql87OT6JrIHXCAb4mjbBdk390bmXNnqS1QkPjMbPGnyflEd2v1aO4XL3Wf1JR',1209600,NULL,'2017-11-22 16:12:28',12),('aiEi6kGJwN0bptEyFqHZvERHR0Ity1EXKJbnzCxdTiAIuOlPDaRx41uDwSyFjgUz',1209600,NULL,'2017-11-18 09:45:19',8),('aU0ecqrESugzlIypgJIEAjAFzN7dB7atmlMJEFZkFV6MPwwCCZZDVbjfI4sgVQQx',1209600,NULL,'2017-11-23 05:17:13',1),('Bb96QecHvV8pZkdM8UTBbbAJxsduoGlcJF9vZfxTC6qbtCuY6oKIvqqa9aEFcn9I',1209600,NULL,'2017-11-22 07:01:03',1),('BRfoKMCxDJ64gEPvN5pMLhJnzC3Vfl02IiqZviAfPQWKta632DkIkeEZ06myoRfT',1209600,NULL,'2017-11-23 06:21:45',13),('cMGmPSDfOib9c0X6Y5Ut0P7VqWBMvedFeG8LdzFm42GhSN2VlFaakt3gX6HbMjuU',1209600,NULL,'2017-11-21 10:53:35',1),('d8vDDyJvwBmYOb4nYAM5usCOtvQ7HG6GYklNtqxNs0EHhHP3CR78gJBH61QP1RhS',1209600,NULL,'2017-11-20 10:08:14',1),('dGjbATUjKxPyM86zB5SIvSyDgj9MKqNsDErNnUsRKE1oa885U303GuEiCRONtMBe',1209600,NULL,'2017-11-21 07:34:11',1),('dKBFmfcIgh80o88QqypROH9gnIEjtoVW9E8CtqttGRaH8Q3OGxn32vRCahlmUpGT',1209600,NULL,'2017-11-20 09:25:07',1),('DY7KxwkU9IrnYvvIFKEr8YFzEAPFzsRTP8gsY1hbhXB9xqoJXHgusdVktrGb6E0M',1209600,NULL,'2017-11-21 08:00:56',1),('e4wsFAycndWZwC0mSUeyuClV3TRo1gCDSBuD9xtOw6AerSJbDXYQ2DKQPO5O0cq0',1209600,NULL,'2017-11-21 07:55:59',13),('E8ysQBcicvLAqjq0HGWEPzdXZjc25KCYGV78u7sEGxbwDXMXmSGUy0lCj4Y6sgLa',1209600,NULL,'2017-11-22 13:04:28',13),('EdWQPqT54eLtfq7DWfG2FZTiXKEp02UyNNDahtSJF7chQfBSyJq2hcA1EX9z4iBB',1209600,NULL,'2017-11-18 09:56:39',1),('eE4eOpL95PPxrgdcKhqX97ez1ZFrvF4HQthoFQ3R7I6yHM72v7kZrYGLIyZLgRq0',1209600,NULL,'2017-11-23 05:24:34',13),('efNvvdCPMLD9kERpUYdmwpE6D5KTB6qnVnHTmHzbJCOhvqh7FAPwiSPe3Qpcco28',1209600,NULL,'2017-11-20 07:31:06',1),('EhxpsJVORpU5jiXJ8qDJqSxr0uxUlJRuRdAYRYEBOCrHfArwhpAuD8hkCPfnhkax',1209600,NULL,'2017-11-23 07:18:33',13),('ePeYttKFd5peuYvvw9ZyEvRkGL6LShZxEzBB71hvXzqMGFCmXyvdz1cq8Xb70Cem',1209600,NULL,'2017-11-20 07:10:43',8),('ERkkKFvUs3CPgaT4uUBXbpx3qDVFOvkX8v3fDX8uYr4EdQ2vjnjavRwhCXCG9tRq',1209600,NULL,'2017-11-18 08:44:47',1),('ETgZE6VOcF3RWkBLTJyDg8njdnWPFKLzhCl5ROHtAGPwEEAu41vgwsOGdNn5SF1e',1209600,NULL,'2017-11-23 05:19:16',1),('FBoxmXVR93gN9kS7Eu6xB0jLWfFY0YMYLVDaSRfqVvoP52lR5E1ymq7xI5o8OwC3',1209600,NULL,'2017-11-20 13:33:35',1),('feX5qFcVmSc5uCXYG0KDFHdnGRg6xPZxYKwrRSjhgZTlT24klSeSi0EaqM0B8T79',1209600,NULL,'2017-11-21 07:56:31',1),('FT1O80oQVbuAhCsF62iPSxE4uqewfvkI87hkATrf9QqmGOaSQr9Xxz6d2mmtRwzc',900,'[\"reset-password\"]','2017-11-18 10:02:05',8),('gfIgwkR4pSwr5eHqOi2WBkZwQksEySi5A8FrfqwpCoSQDVDMgDBoRtKv3ibfOPp8',1209600,NULL,'2017-11-22 12:52:35',1),('Gk6Sf319yzIuCOOAm975VnqJVJFJII52RxPUdPFsgnU9RvRK6SAKd5VMtyBbNqEs',1209600,NULL,'2017-11-18 06:11:22',1),('GZb9HQMNEc7WHWWVoKBZhEXEFh6eyCkmHvRPFUxLsAgYokvmv1ntvhPJj86idryO',1209600,NULL,'2017-11-23 04:44:49',13),('hfU0Tnd0r5Gv6iU9e6lftCzTZVzluWdJySOqxA5qrtYMba0AAAwqcAMWYBeKBqw9',1209600,NULL,'2017-11-23 05:34:51',12),('HIjVjVBDBh7HAs92CQwdTE6AfkjdZVRW5FBrTxmy9gu09Pd8AlHRd44hoPEXP9k3',1209600,NULL,'2017-11-23 05:35:44',13),('HolTvFpDIAFzxwFjVYEj8xepesQxb0LPw1RDy9hjAxCyTKl7nZDb4f3ZEhWZgs43',1209600,NULL,'2017-11-22 12:56:25',1),('hTlWCUtR9hm2Fkux1jXoCmHGYOa3kGLobtD0pN3jdAGMxmvCtdC4mFBVlkmNF3vI',1209600,NULL,'2017-11-22 12:53:44',1),('HV6hB8ChHWgNXu4Xc4n7DsjUib9l3W6DOat8xsnGrm80qyyNGOvicuA0617QBUHj',1209600,NULL,'2017-11-23 09:53:14',1),('IlZ8B9LxeyPfaWhreUlOY4KMmK5cVr3G5FUNHByynH4OefJvgutiU6uq1QwgOJbK',1209600,NULL,'2017-11-22 12:09:45',1),('imLSkrprdJSqfTArj6PBCg9GAjDJ8E5HyELQN9tfcvjFQcYtVloCVNEjD7IgtcEq',1209600,NULL,'2017-11-22 12:54:08',13),('J49jlT101sNgQoZnLWGfBzekJlHuZJvTFWoDirK8pEtVpzCDkPF3YdTdbcyQsLiy',1209600,NULL,'2017-11-18 07:18:43',2),('kAWeq4mDLRLL2t29W3pZ98RPzTAlWlgDr8PFYPu3upOH014fPiJyijCDMZB5NN85',1209600,NULL,'2017-11-20 10:52:52',12),('KHNV6VA1TlWX353z2BXhJ6c2OjbzRZailwQ9OX5nzi8U2E2KMrrjAAgJorzHJjNK',1209600,NULL,'2017-11-22 13:42:55',13),('ki4vuOpmUZ7pY5w1PfVS3Qz7WGvFLktbaQhcSlunF28waxCsdAZBNwUVd2DncxNt',1209600,NULL,'2017-11-21 09:05:25',12),('KLPzoGbzB113M80eqEEEWCx3bePWZEy4nyu52xhTHQQgv4iBIE2xfq3iqILI75ny',1209600,NULL,'2017-11-20 04:59:27',1),('KOcoX16UjanAx6EegwtO18ueuL6up5gBt9KOpUgLahzEM0Dym3AEZcalJQf0Bxf9',1209600,NULL,'2017-11-22 12:59:08',1),('kyHIR1ToELglgAqx3K0FgUfnin28DX1dEh4dZn4WXd34AF0xaS6cbxXsCYrUgzE4',1209600,NULL,'2017-11-22 13:05:27',13),('lHLV3XueNvmBUBBCxJRrxe4ZwC4c4SdrKEfxr2KC3dL2r7sAV3ekD2okquSGCXKC',1209600,NULL,'2017-11-20 14:21:46',1),('LLDqSjJL726fuY9NaeRsemw6xlatrWNoTHBhEraCioQ7NSQwEmA8hVwpvuduEYzC',1209600,NULL,'2017-11-22 13:10:42',1),('lo7eg6ROXFaYE1uFfHpxVx8B7mlFayL5IBwnA0QnSfkQaZSBery8ZmQUZOVvZ7yf',900,'[\"reset-password\"]','2017-11-21 05:45:48',13),('LUECLaYzDFthe63BL3nHT0gCF4b4gjMWv6SmuHUhOuNL6iumUQszloa3mRjyErub',1209600,NULL,'2017-11-20 07:32:30',1),('LxhOH4RPhtNGl7j6SxRiUahbh9mGq72GNMj4hmPY450Rg8mmMZ08Cy7QSKwJzLLl',1209600,NULL,'2017-11-23 07:20:33',13),('MNO7E7ORqWQemfaMhPOY3XBKeW206JD04KOgRMvjmpiXVA4WGqjVd9qvIdFDDbw6',1209600,NULL,'2017-11-21 07:58:54',13),('mQ2RdZR6ypNxFNAEbXeX7VHpVeaXzymJBSVP4XAZJ6pWETn5mS5PBLPBXLFoQl1k',1209600,NULL,'2017-11-21 09:03:28',12),('mUbVKjzt53T6ZmxsaHnpPypRJ6boh6IsAFD8cCwfB12TL1O8K2D7jqCwlPaxZL2I',1209600,NULL,'2017-11-22 14:44:43',12),('Ntx3nDM3aTqjuqtKjLQrnV1q9JSTFdTBYbHW0UBQ76fZM69JEl3ppgrwHdPGhBa9',1209600,NULL,'2017-11-22 06:30:48',1),('o9HpZZH229mXOVfjitGP10GhupqjvkuuHIXhbv5CjwSBZLsFiQnsZs5m7qDVR4Yg',1209600,NULL,'2017-11-21 09:02:32',12),('OBnB2OVGXCd5UAsxjUTmqQdURHGqgvAxgYWX8g7OZtt2XcwZuJ3cEX3PXImVCRA7',1209600,NULL,'2017-11-21 04:18:45',1),('obnDr8JYm4QcKWOJGHBKMJLIGACLuG8DzVRogb7qa3KY8ivey6MS3nXQPscMfn1D',1209600,NULL,'2017-11-23 05:25:11',13),('omVhgajVwJWoX0eEEgUIah3jVQHGbcTeNttdH0kxrdnhnYaFIiqy7uvApwodrziQ',1209600,NULL,'2017-11-17 16:05:50',1),('P56OsF09Ww9WkRj3g791XYOTeFYpfX377G2iavqAkHVt4SsmcMOiYE8UyVpOCLhY',1209600,NULL,'2017-11-23 05:35:49',13),('P5pMWysmsbGYSgxOR1gMaToaE3TmDSa17OZEFDVSCHgpLk0KReW8WPHoBtk7FCeh',1209600,NULL,'2017-11-23 05:18:57',13),('PGxeqNDElODpHNRJSeuD23Lm3eo7ap9QhliQwB6HU6Ba79BIkfH4g0ccdd3xIDXa',1209600,NULL,'2017-11-22 13:11:13',13),('pJbwlOKJi4f2guKIgqMyhg7PdbmhPKDyzgMfLNscgLMPoApEw5aTwCR5e4gQCXdW',1209600,NULL,'2017-11-23 05:24:11',13),('QtgtAv1BBjRdsbjF1XdvCcZAnOO0UswTksRj6gNZ57eZAzDdGu6QCKRQTjlE4CGU',1209600,NULL,'2017-11-21 09:11:43',12),('R3JO18LoqVegmvi4QcomiviD4bR5iC4SfHSDCaMPAfrGGgvZxC9PeyU3MvK9HUyY',1209600,NULL,'2017-11-22 15:49:05',13),('rEJ1ZvGh3JuI155s9tXKICRJ7tEWG6KCdP2LVA5uBqniZJ6yVih5sQFTvTfxnSCa',1209600,NULL,'2017-11-22 12:52:03',1),('Rvb469XbUKff2WmPUVDTyzO80R02r3gHy0GIa1iKLhzh0LSchTDKMn3mcja5tO4R',1209600,NULL,'2017-11-23 05:25:45',1),('S0JO3AVjJMwHNMlzswkfncibpJ7wt2uBuRpQBOXYGau0GDNLhRjdfJedUxcJ5hip',1209600,NULL,'2017-11-20 07:11:39',1),('t88akBmVWMwYomhnTfhPCvMiLQ1CnzU29rocO1zwrQBih5rlvYZymaLZJe9DHsqV',1209600,NULL,'2017-11-21 12:38:19',1),('TTKkfiDyqocjaq3DjxnbJAWt0iLmGK8ANL4mPIzQXADq2r2zi2OHNFUBuwSEPcFN',1209600,NULL,'2017-11-18 07:33:12',1),('UMHWRac4bAAjyoMgycOCiFNReYfEv6HID53ryqIaFg2nRuqhET9NnpZCPSnMQGfV',1209600,NULL,'2017-11-20 05:15:01',1),('UpwkwnFLH24kBusGWTO6trGNrVFycEWWmBq0LeD3V0DXvamyWoHjK68ZOqD4umXv',1209600,NULL,'2017-11-23 07:37:15',13),('uR7dwEVnjwYpgjb4ZMKbHGckQpHcDBJOYl9HZWQzMrrECSgGjWQK9jdn69jZLPhU',1209600,NULL,'2017-11-21 09:13:22',14),('uuUgRMsBwjWfX9xj1jCP3mWl04LA1toOGVuRPDoVpMkydgWyOZ9u3ODIzQCevAtn',1209600,NULL,'2017-11-22 12:22:00',13),('uvWmvhXatBVjK0DU483SHrXfc1TAS3j2N6KTQvZUdeUxIvUyEML6JS6TnR3KJcoE',1209600,NULL,'2017-11-23 05:20:19',12),('VdaTqhuZuAvW9QEds588iNMIw8ud8iQ1kvrdNlLkw4FYUxwlGAy54xRcjHvhe7Uz',1209600,NULL,'2017-11-21 10:01:42',14),('vKdtOL0nLSbvCcvthZinItJ51pOmZScc1Dkn6OIWTERSnyCpFoNsJrAiPWQ3ACav',1209600,NULL,'2017-11-18 10:01:33',1),('VqATGmd5sMG3aZoco0TnvFfIQDJq1UtuIZuOBCsI7wRz0ACZHygMEbW6DjhgQFAM',1209600,NULL,'2017-11-21 09:11:25',12),('Wg0FPdROVW7eZ826zcwfyre653yLUlaYHvCzCAd6NBloQmYkqnWIG3MwPEztVlPj',1209600,NULL,'2017-11-21 12:04:13',1),('WkVgGMVLS9rA9RlPohdWBx1wtiKGAZOjkXw3c2167DhlHNJAPzlLAGhtWJ6P8uXC',1209600,NULL,'2017-11-18 09:47:06',7),('X6UGB0bdJi3bXgXecxiLIDZ0pJ1xmeP2l0Ci12EcG3Om5h5T4gv03RQWjoHa5Spy',1209600,NULL,'2017-11-21 08:02:03',13),('xRXOhazgbscHHk3gDEAeHHtV42XMDlInMaAW5aGADl8owF3Squa44dj4zw7OqyOy',1209600,NULL,'2017-11-22 12:57:29',13),('xs5YigCxILCj1Y0laOK3gTaCvhmDpzPtqx0RGKHCw0KiZbTZSC3msEXA4gn172Ve',1209600,NULL,'2017-11-18 06:49:31',1),('XVTUO9NpcxhoYf8wS6GHIRyRSYgexBIdiwWD05pYs5hnWXXTkswgEIIMLJRAFIPg',1209600,NULL,'2017-11-22 07:18:34',13),('YbES8qr3shrO4dJ1HjexMGjEq8wGP75HUiLSNEYKiB3ATtS6tUwtR1pQig9oaCGv',1209600,NULL,'2017-11-21 12:36:43',13),('YcZa4rd29ZaKRWaLMcO5wx0FQOTTmSmMfpDcbV4kGwIGANU5dtunbzzVG67AYagr',1209600,NULL,'2017-11-20 10:13:43',1),('yG8VEn9rfDx6DXy33DA7h0WaG8WBeqU6GB3YSCHOvbZgfmKXfVFYR3zhNxYlJEsZ',1209600,NULL,'2017-11-18 11:22:15',1),('yJlC32XSrGE5QLEoZrAmy7dF5tY84RzrNrqkcendCb2u2qZHG05YSiaKXgxC5FDI',1209600,NULL,'2017-11-20 09:30:41',1),('yxDFa1BKLLtwGdcLcMN3QGvaSoUnRuI7cUnzepkBNtAFYBR39mPIZ7LqRkDAayND',1209600,NULL,'2017-11-22 06:58:50',13),('Z5KXEPtpcvjoU2xEgp6Mj1Msy7J7FbyMVhRTR4ukb2SgCFDIm4MyExyUF57PdkBG',1209600,NULL,'2017-11-21 05:47:21',13);
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
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl`
--

LOCK TABLES `acl` WRITE;
/*!40000 ALTER TABLE `acl` DISABLE KEYS */;
INSERT INTO `acl` VALUES (1,'Institute','*','*','DENY','ROLE','$everyone'),(2,'Board','*','*','DENY','ROLE','$everyone'),(3,'School','*','*','DENY','ROLE','$everyone'),(4,'role','*','*','DENY','ROLE','$everyone'),(5,'user','*','*','DENY','ROLE','$everyone'),(6,'Frequency','*','*','DENY','ROLE','$everyone'),(7,'Class','*','*','DENY','ROLE','$everyone'),(8,'Division','*','*','DENY','ROLE','$everyone'),(9,'Category','*','*','DENY','ROLE','$everyone'),(10,'Feehead','*','*','DENY','ROLE','$everyone'),(11,'Feeplan','*','*','DENY','ROLE','$everyone'),(12,'Zone','*','*','DENY','ROLE','$everyone'),(13,'Adhocfee','*','*','DENY','ROLE','$everyone'),(14,'Student','*','*','DENY','ROLE','$everyone'),(15,'ProcessFee','*','*','DENY','ROLE','$everyone'),(16,'Report','*','*','DENY','ROLE','$everyone'),(17,'Academicyear','*','*','DENY','ROLE','$everyone'),(18,'Feeplanheaddetails','*','*','DENY','ROLE','$everyone'),(19,'Feeplanassociation','*','*','DENY','ROLE','$everyone'),(20,'Zone','*','*','DENY','ROLE','$everyone'),(21,'Zonedetails','*','*','DENY','ROLE','$everyone'),(22,'role','__get__permission','READ','ALLOW','ROLE','$authenticated'),(23,'Institute','find','READ','ALLOW','ROLE','SuperAdmin'),(24,'Board','find','READ','ALLOW','ROLE','SuperAdmin'),(25,'School','find','READ','ALLOW','ROLE','SuperAdmin'),(26,'role','find','READ','ALLOW','ROLE','SuperAdmin'),(27,'user','find','READ','ALLOW','ROLE','SuperAdmin'),(28,'Frequency','find','READ','ALLOW','ROLE','SuperAdmin'),(29,'Class','find','READ','ALLOW','ROLE','SuperAdmin'),(30,'Division','find','READ','ALLOW','ROLE','SuperAdmin'),(31,'Category','find','READ','ALLOW','ROLE','SuperAdmin'),(32,'Feehead','find','READ','ALLOW','ROLE','SuperAdmin'),(33,'Feeplan','find','READ','ALLOW','ROLE','SuperAdmin'),(34,'Feeplanassociation','find','READ','ALLOW','ROLE','SuperAdmin'),(35,'Feeplanheaddetails','find','READ','ALLOW','ROLE','SuperAdmin'),(36,'Zone','find','READ','ALLOW','ROLE','SuperAdmin'),(37,'Adhocfee','find','READ','ALLOW','ROLE','SuperAdmin'),(38,'Student','find','READ','ALLOW','ROLE','SuperAdmin'),(39,'ProcessFee','find','READ','ALLOW','ROLE','SuperAdmin'),(40,'Report','find','READ','ALLOW','ROLE','SuperAdmin'),(41,'Academicyear','find','READ','ALLOW','ROLE','SuperAdmin'),(42,'Permission','find','READ','ALLOW','ROLE','SuperAdmin'),(43,'Institute','findById','READ','ALLOW','ROLE','SuperAdmin'),(44,'Board','findById','READ','ALLOW','ROLE','SuperAdmin'),(45,'School','findById','READ','ALLOW','ROLE','SuperAdmin'),(46,'role','findById','READ','ALLOW','ROLE','SuperAdmin'),(47,'user','findById','READ','ALLOW','ROLE','SuperAdmin'),(48,'Frequency','findById','READ','ALLOW','ROLE','SuperAdmin'),(49,'Class','findById','READ','ALLOW','ROLE','SuperAdmin'),(50,'Division','findById','READ','ALLOW','ROLE','SuperAdmin'),(51,'Category','findById','READ','ALLOW','ROLE','SuperAdmin'),(52,'Feehead','findById','READ','ALLOW','ROLE','SuperAdmin'),(53,'Feeplan','findById','READ','ALLOW','ROLE','SuperAdmin'),(54,'Feeplanassociation','findById','READ','ALLOW','ROLE','SuperAdmin'),(55,'Feeplanheaddetails','findById','READ','ALLOW','ROLE','SuperAdmin'),(56,'Zone','findById','READ','ALLOW','ROLE','SuperAdmin'),(57,'Adhocfee','findById','READ','ALLOW','ROLE','SuperAdmin'),(58,'Student','findById','READ','ALLOW','ROLE','SuperAdmin'),(59,'ProcessFee','findById','READ','ALLOW','ROLE','SuperAdmin'),(60,'Report','findById','READ','ALLOW','ROLE','SuperAdmin'),(61,'Academicyear','findById','READ','ALLOW','ROLE','SuperAdmin'),(62,'Permission','findById','READ','ALLOW','ROLE','SuperAdmin'),(63,'Institute','create','WRITE','ALLOW','ROLE','SuperAdmin'),(64,'Board','create','WRITE','ALLOW','ROLE','SuperAdmin'),(65,'School','create','WRITE','ALLOW','ROLE','SuperAdmin'),(66,'role','create','WRITE','ALLOW','ROLE','SuperAdmin'),(67,'user','create','WRITE','ALLOW','ROLE','SuperAdmin'),(68,'Frequency','create','WRITE','ALLOW','ROLE','SuperAdmin'),(69,'Class','create','WRITE','ALLOW','ROLE','SuperAdmin'),(70,'Division','create','WRITE','ALLOW','ROLE','SuperAdmin'),(71,'Category','create','WRITE','ALLOW','ROLE','SuperAdmin'),(72,'Feehead','create','WRITE','ALLOW','ROLE','SuperAdmin'),(73,'Feeplan','create','WRITE','ALLOW','ROLE','SuperAdmin'),(74,'Feeplanassociation','create','WRITE','ALLOW','ROLE','SuperAdmin'),(75,'Feeplanheaddetails','create','WRITE','ALLOW','ROLE','SuperAdmin'),(76,'Zone','create','WRITE','ALLOW','ROLE','SuperAdmin'),(77,'Adhocfee','create','WRITE','ALLOW','ROLE','SuperAdmin'),(78,'Student','create','WRITE','ALLOW','ROLE','SuperAdmin'),(79,'ProcessFee','create','WRITE','ALLOW','ROLE','SuperAdmin'),(80,'Report','create','WRITE','ALLOW','ROLE','SuperAdmin'),(81,'Academicyear','create','WRITE','ALLOW','ROLE','SuperAdmin'),(82,'Institute','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(83,'Board','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(84,'School','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(85,'role','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(86,'user','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(87,'Frequency','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(88,'Class','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(89,'Division','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(90,'Category','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(91,'Feehead','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(92,'Feeplan','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(93,'Feeplanassociation','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(94,'Feeplanheaddetails','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(95,'Zone','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(96,'Adhocfee','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(97,'Student','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(98,'ProcessFee','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(99,'Report','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(100,'Academicyear','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(101,'Institute','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(102,'Board','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(103,'School','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(104,'role','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(105,'user','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(106,'Frequency','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(107,'Class','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(108,'Division','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(109,'Category','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(110,'Feehead','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(111,'Feeplan','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(112,'Zone','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(113,'Adhocfee','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(114,'Student','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(115,'ProcessFee','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(116,'Report','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(117,'Academicyear','destroyById','WRITE','ALLOW','ROLE','SuperAdmin'),(118,'user','createUser','EXECUTE','ALLOW','ROLE','SuperAdmin'),(119,'user','updateUser','EXECUTE','ALLOW','ROLE','SuperAdmin'),(120,'Feeplanheaddetails','updateFeeplanheaddetails','EXECUTE','ALLOW','ROLE','SuperAdmin'),(121,'Feeplanassociation','updateFeeplanAssociation','EXECUTE','ALLOW','ROLE','SuperAdmin'),(122,'Institute','count','READ','ALLOW','ROLE','SuperAdmin'),(123,'Board','count','READ','ALLOW','ROLE','SuperAdmin'),(124,'School','count','READ','ALLOW','ROLE','SuperAdmin'),(125,'role','count','READ','ALLOW','ROLE','SuperAdmin'),(126,'user','count','READ','ALLOW','ROLE','SuperAdmin'),(127,'Frequency','count','READ','ALLOW','ROLE','SuperAdmin'),(128,'Class','count','READ','ALLOW','ROLE','SuperAdmin'),(129,'Division','count','READ','ALLOW','ROLE','SuperAdmin'),(130,'Category','count','READ','ALLOW','ROLE','SuperAdmin'),(131,'Feehead','count','READ','ALLOW','ROLE','SuperAdmin'),(132,'Feeplan','count','READ','ALLOW','ROLE','SuperAdmin'),(133,'Feeplanassociation','count','READ','ALLOW','ROLE','SuperAdmin'),(134,'Feeplanheaddetails','count','READ','ALLOW','ROLE','SuperAdmin'),(135,'Zone','count','READ','ALLOW','ROLE','SuperAdmin'),(136,'Adhocfee','count','READ','ALLOW','ROLE','SuperAdmin'),(137,'Student','count','READ','ALLOW','ROLE','SuperAdmin'),(138,'ProcessFee','count','READ','ALLOW','ROLE','SuperAdmin'),(139,'Report','count','READ','ALLOW','ROLE','SuperAdmin'),(140,'Academicyear','count','READ','ALLOW','ROLE','SuperAdmin'),(141,'Permission','count','READ','ALLOW','ROLE','SuperAdmin'),(142,'Institute','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(143,'Board','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(144,'School','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(145,'role','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(146,'user','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(147,'Frequency','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(148,'Class','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(149,'Division','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(150,'Category','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(151,'Feehead','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(152,'Feeplan','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(153,'Zone','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(154,'Adhocfee','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(155,'Student','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(156,'ProcessFee','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(157,'Report','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(158,'Academicyear','deleteRecord','EXECUTE','ALLOW','ROLE','SuperAdmin'),(159,'Zone','find','READ','ALLOW','ROLE','SuperAdmin'),(160,'Zone','findById','READ','ALLOW','ROLE','SuperAdmin'),(161,'Zone','create','WRITE','ALLOW','ROLE','SuperAdmin'),(162,'Zone','updateAttributes','WRITE','ALLOW','ROLE','SuperAdmin'),(163,'Zonedetails','find','READ','ALLOW','ROLE','SuperAdmin'),(164,'Zonedetails','findById','READ','ALLOW','ROLE','SuperAdmin'),(165,'Zonedetails','count','READ','ALLOW','ROLE','SuperAdmin'),(166,'Zonedetails','updateZonedetails','EXECUTE','ALLOW','ROLE','SuperAdmin'),(167,'School','__get__Students','READ','ALLOW','ROLE','SuperAdmin'),(168,'School','__get__SchoolYear','READ','ALLOW','ROLE','SuperAdmin'),(169,'School','__get__SchoolUsers','READ','ALLOW','ROLE','SuperAdmin'),(170,'School','__get__SchoolInstitute','READ','ALLOW','ROLE','SuperAdmin'),(171,'School','__get__SchoolDivision','READ','ALLOW','ROLE','SuperAdmin'),(172,'School','__get__SchoolClass','READ','ALLOW','ROLE','SuperAdmin'),(173,'School','__get__SchoolBoard','READ','ALLOW','ROLE','SuperAdmin'),(174,'School','__get__Roles','READ','ALLOW','ROLE','SuperAdmin'),(175,'School','__findById__Students','READ','ALLOW','ROLE','SuperAdmin'),(176,'School','__findById__SchoolYear','READ','ALLOW','ROLE','SuperAdmin'),(177,'School','__findById__SchoolUsers','READ','ALLOW','ROLE','SuperAdmin'),(178,'School','__findById__SchoolInstitute','READ','ALLOW','ROLE','SuperAdmin'),(179,'School','__findById__SchoolDivision','READ','ALLOW','ROLE','SuperAdmin'),(180,'School','__findById__SchoolClass','READ','ALLOW','ROLE','SuperAdmin'),(181,'School','__findById__SchoolBoard','READ','ALLOW','ROLE','SuperAdmin'),(182,'School','__findById__Roles','READ','ALLOW','ROLE','SuperAdmin'),(183,'School','__count__Students','READ','ALLOW','ROLE','SuperAdmin'),(184,'School','__count__SchoolYear','READ','ALLOW','ROLE','SuperAdmin'),(185,'School','__count__SchoolUsers','READ','ALLOW','ROLE','SuperAdmin'),(186,'School','__count__SchoolInstitute','READ','ALLOW','ROLE','SuperAdmin'),(187,'School','__count__SchoolDivision','READ','ALLOW','ROLE','SuperAdmin'),(188,'School','__count__SchoolClass','READ','ALLOW','ROLE','SuperAdmin'),(189,'School','__count__SchoolBoard','READ','ALLOW','ROLE','SuperAdmin'),(190,'School','__count__Roles','READ','ALLOW','ROLE','SuperAdmin'),(191,'School','__create__Students','WRITE','ALLOW','ROLE','SuperAdmin'),(192,'School','__create__SchoolYear','WRITE','ALLOW','ROLE','SuperAdmin'),(193,'School','__create__SchoolUsers','WRITE','ALLOW','ROLE','SuperAdmin'),(194,'School','__create__SchoolInstitute','WRITE','ALLOW','ROLE','SuperAdmin'),(195,'School','__create__SchoolDivision','WRITE','ALLOW','ROLE','SuperAdmin'),(196,'School','__create__SchoolClass','WRITE','ALLOW','ROLE','SuperAdmin'),(197,'School','__create__SchoolBoard','WRITE','ALLOW','ROLE','SuperAdmin'),(198,'School','__create__Roles','WRITE','ALLOW','ROLE','SuperAdmin'),(199,'School','__updateById__Students','WRITE','ALLOW','ROLE','SuperAdmin'),(200,'School','__updateById__SchoolYear','WRITE','ALLOW','ROLE','SuperAdmin'),(201,'School','__updateById__SchoolUsers','WRITE','ALLOW','ROLE','SuperAdmin'),(202,'School','__updateById__SchoolInstitute','WRITE','ALLOW','ROLE','SuperAdmin'),(203,'School','__updateById__SchoolDivision','WRITE','ALLOW','ROLE','SuperAdmin'),(204,'School','__updateById__SchoolClass','WRITE','ALLOW','ROLE','SuperAdmin'),(205,'School','__updateById__SchoolBoard','WRITE','ALLOW','ROLE','SuperAdmin'),(206,'School','__updateById__Roles','WRITE','ALLOW','ROLE','SuperAdmin'),(207,'Student','__get__StudentCategory','READ','ALLOW','ROLE','SuperAdmin'),(208,'Student','__get__StudentClass','READ','ALLOW','ROLE','SuperAdmin'),(209,'Student','__get__StudentDivision','READ','ALLOW','ROLE','SuperAdmin'),(210,'Student','__get__StudentSchool','READ','ALLOW','ROLE','SuperAdmin'),(211,'Student','getStudentFeeplanDetails','READ','ALLOW','ROLE','SuperAdmin'),(212,'Class','__get__ClassSchool','READ','ALLOW','ROLE','SuperAdmin'),(213,'Division','__get__DivisionSchool','READ','ALLOW','ROLE','SuperAdmin'),(214,'role','__get__rolemenu','READ','ALLOW','ROLE','SuperAdmin'),(215,'role','__findById__rolemenu','READ','ALLOW','ROLE','SuperAdmin'),(216,'role','__updateById__rolemenu','WRITE','ALLOW','ROLE','SuperAdmin'),(217,'School','__get__FeePlans','READ','ALLOW','ROLE','SuperAdmin'),(218,'School','__findById__FeePlans','READ','ALLOW','ROLE','SuperAdmin'),(219,'School','__count__FeePlans','READ','ALLOW','ROLE','SuperAdmin'),(220,'School','__create__FeePlans','WRITE','ALLOW','ROLE','SuperAdmin'),(221,'School','__updateById__FeePlans','WRITE','ALLOW','ROLE','SuperAdmin'),(222,'Feeplan','__get__associations','READ','ALLOW','ROLE','SuperAdmin'),(223,'Feeplan','__findById__associations','READ','ALLOW','ROLE','SuperAdmin'),(224,'Feeplan','__count__associations','READ','ALLOW','ROLE','SuperAdmin'),(225,'Feeplan','__create__associations','WRITE','ALLOW','ROLE','SuperAdmin'),(226,'Feeplan','__updateById__associations','WRITE','ALLOW','ROLE','SuperAdmin'),(227,'School','__get__Adhocfees','READ','ALLOW','ROLE','SuperAdmin'),(228,'School','__findById__Adhocfees','READ','ALLOW','ROLE','SuperAdmin'),(229,'School','__count__Adhocfees','READ','ALLOW','ROLE','SuperAdmin'),(230,'School','__create__Adhocfees','WRITE','ALLOW','ROLE','SuperAdmin'),(231,'School','__updateById__Adhocfees','WRITE','ALLOW','ROLE','SuperAdmin'),(232,'School','__get__zones','READ','ALLOW','ROLE','SuperAdmin'),(233,'School','__findById__zones','READ','ALLOW','ROLE','SuperAdmin'),(234,'School','__count__zones','READ','ALLOW','ROLE','SuperAdmin'),(235,'School','__create__zones','WRITE','ALLOW','ROLE','SuperAdmin'),(236,'School','__updateById__zones','WRITE','ALLOW','ROLE','SuperAdmin'),(237,'role','find','READ','ALLOW','ROLE','SchoolAdmin'),(238,'user','find','READ','ALLOW','ROLE','SchoolAdmin'),(239,'Class','find','READ','ALLOW','ROLE','SchoolAdmin'),(240,'Division','find','READ','ALLOW','ROLE','SchoolAdmin'),(241,'Feehead','find','READ','ALLOW','ROLE','SchoolAdmin'),(242,'Feeplan','find','READ','ALLOW','ROLE','SchoolAdmin'),(243,'Feeplanassociation','find','READ','ALLOW','ROLE','SchoolAdmin'),(244,'Feeplanheaddetails','find','READ','ALLOW','ROLE','SchoolAdmin'),(245,'Zone','find','READ','ALLOW','ROLE','SchoolAdmin'),(246,'Adhocfee','find','READ','ALLOW','ROLE','SchoolAdmin'),(247,'Student','find','READ','ALLOW','ROLE','SchoolAdmin'),(248,'ProcessFee','find','READ','ALLOW','ROLE','SchoolAdmin'),(249,'Report','find','READ','ALLOW','ROLE','SchoolAdmin'),(250,'Academicyear','find','READ','ALLOW','ROLE','SchoolAdmin'),(251,'Permission','find','READ','ALLOW','ROLE','SchoolAdmin'),(252,'role','findById','READ','ALLOW','ROLE','SchoolAdmin'),(253,'user','findById','READ','ALLOW','ROLE','SchoolAdmin'),(254,'Class','findById','READ','ALLOW','ROLE','SchoolAdmin'),(255,'Division','findById','READ','ALLOW','ROLE','SchoolAdmin'),(256,'Feehead','findById','READ','ALLOW','ROLE','SchoolAdmin'),(257,'Feeplan','findById','READ','ALLOW','ROLE','SchoolAdmin'),(258,'Feeplanassociation','findById','READ','ALLOW','ROLE','SchoolAdmin'),(259,'Feeplanheaddetails','findById','READ','ALLOW','ROLE','SchoolAdmin'),(260,'Zone','findById','READ','ALLOW','ROLE','SchoolAdmin'),(261,'Adhocfee','findById','READ','ALLOW','ROLE','SchoolAdmin'),(262,'Student','findById','READ','ALLOW','ROLE','SchoolAdmin'),(263,'ProcessFee','findById','READ','ALLOW','ROLE','SchoolAdmin'),(264,'Report','findById','READ','ALLOW','ROLE','SchoolAdmin'),(265,'Academicyear','findById','READ','ALLOW','ROLE','SchoolAdmin'),(266,'Permission','findById','READ','ALLOW','ROLE','SchoolAdmin'),(267,'School','findById','READ','ALLOW','ROLE','SchoolAdmin'),(268,'role','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(269,'user','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(270,'Class','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(271,'Division','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(272,'Feehead','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(273,'Feeplan','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(274,'Feeplanassociation','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(275,'Feeplanheaddetails','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(276,'Zone','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(277,'Adhocfee','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(278,'Student','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(279,'ProcessFee','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(280,'Report','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(281,'Academicyear','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(282,'role','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(283,'user','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(284,'Class','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(285,'Division','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(286,'Feehead','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(287,'Feeplan','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(288,'Feeplanassociation','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(289,'Feeplanheaddetails','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(290,'Zone','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(291,'Adhocfee','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(292,'Student','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(293,'ProcessFee','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(294,'Report','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(295,'Academicyear','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(296,'role','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(297,'user','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(298,'Class','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(299,'Division','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(300,'Feehead','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(301,'Feeplan','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(302,'Zone','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(303,'Adhocfee','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(304,'Student','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(305,'ProcessFee','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(306,'Report','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(307,'Academicyear','destroyById','WRITE','ALLOW','ROLE','SchoolAdmin'),(308,'User','createUser','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(309,'user','updateUser','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(310,'Feeplanheaddetails','updateFeeplanheaddetails','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(311,'Feeplanassociation','updateFeeplanAssociation','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(312,'role','count','READ','ALLOW','ROLE','SchoolAdmin'),(313,'user','count','READ','ALLOW','ROLE','SchoolAdmin'),(314,'Class','count','READ','ALLOW','ROLE','SchoolAdmin'),(315,'Division','count','READ','ALLOW','ROLE','SchoolAdmin'),(316,'Feehead','count','READ','ALLOW','ROLE','SchoolAdmin'),(317,'Feeplan','count','READ','ALLOW','ROLE','SchoolAdmin'),(318,'Feeplanassociation','count','READ','ALLOW','ROLE','SchoolAdmin'),(319,'Feeplanheaddetails','count','READ','ALLOW','ROLE','SchoolAdmin'),(320,'Zone','count','READ','ALLOW','ROLE','SchoolAdmin'),(321,'Adhocfee','count','READ','ALLOW','ROLE','SchoolAdmin'),(322,'Student','count','READ','ALLOW','ROLE','SchoolAdmin'),(323,'ProcessFee','count','READ','ALLOW','ROLE','SchoolAdmin'),(324,'Report','count','READ','ALLOW','ROLE','SchoolAdmin'),(325,'Academicyear','count','READ','ALLOW','ROLE','SchoolAdmin'),(326,'Permission','count','READ','ALLOW','ROLE','SchoolAdmin'),(327,'role','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(328,'user','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(329,'Class','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(330,'Division','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(331,'Feehead','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(332,'Feeplan','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(333,'Zone','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(334,'Adhocfee','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(335,'Student','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(336,'ProcessFee','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(337,'Report','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(338,'Academicyear','deleteRecord','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(339,'Zone','find','READ','ALLOW','ROLE','SchoolAdmin'),(340,'Zone','findById','READ','ALLOW','ROLE','SchoolAdmin'),(341,'Zone','create','WRITE','ALLOW','ROLE','SchoolAdmin'),(342,'Zone','updateAttributes','WRITE','ALLOW','ROLE','SchoolAdmin'),(343,'Zonedetails','find','READ','ALLOW','ROLE','SchoolAdmin'),(344,'Zonedetails','findById','READ','ALLOW','ROLE','SchoolAdmin'),(345,'Zonedetails','count','READ','ALLOW','ROLE','SchoolAdmin'),(346,'Zonedetails','updateZonedetails','EXECUTE','ALLOW','ROLE','SchoolAdmin'),(347,'School','__get__Students','READ','ALLOW','ROLE','SchoolAdmin'),(348,'School','__get__SchoolYear','READ','ALLOW','ROLE','SchoolAdmin'),(349,'School','__get__SchoolUsers','READ','ALLOW','ROLE','SchoolAdmin'),(350,'School','__get__SchoolInstitute','READ','ALLOW','ROLE','SchoolAdmin'),(351,'School','__get__SchoolDivision','READ','ALLOW','ROLE','SchoolAdmin'),(352,'School','__get__SchoolClass','READ','ALLOW','ROLE','SchoolAdmin'),(353,'School','__get__SchoolBoard','READ','ALLOW','ROLE','SchoolAdmin'),(354,'School','__get__Roles','READ','ALLOW','ROLE','SchoolAdmin'),(355,'School','__findById__Students','READ','ALLOW','ROLE','SchoolAdmin'),(356,'School','__findById__SchoolYear','READ','ALLOW','ROLE','SchoolAdmin'),(357,'School','__findById__SchoolUsers','READ','ALLOW','ROLE','SchoolAdmin'),(358,'School','__findById__SchoolInstitute','READ','ALLOW','ROLE','SchoolAdmin'),(359,'School','__findById__SchoolDivision','READ','ALLOW','ROLE','SchoolAdmin'),(360,'School','__findById__SchoolClass','READ','ALLOW','ROLE','SchoolAdmin'),(361,'School','__findById__SchoolBoard','READ','ALLOW','ROLE','SchoolAdmin'),(362,'School','__findById__Roles','READ','ALLOW','ROLE','SchoolAdmin'),(363,'School','__count__Students','READ','ALLOW','ROLE','SchoolAdmin'),(364,'School','__count__SchoolYear','READ','ALLOW','ROLE','SchoolAdmin'),(365,'School','__count__SchoolUsers','READ','ALLOW','ROLE','SchoolAdmin'),(366,'School','__count__SchoolInstitute','READ','ALLOW','ROLE','SchoolAdmin'),(367,'School','__count__SchoolDivision','READ','ALLOW','ROLE','SchoolAdmin'),(368,'School','__count__SchoolClass','READ','ALLOW','ROLE','SchoolAdmin'),(369,'School','__count__SchoolBoard','READ','ALLOW','ROLE','SchoolAdmin'),(370,'School','__count__Roles','READ','ALLOW','ROLE','SchoolAdmin'),(371,'School','__create__Students','WRITE','ALLOW','ROLE','SchoolAdmin'),(372,'School','__create__SchoolYear','WRITE','ALLOW','ROLE','SchoolAdmin'),(373,'School','__create__SchoolUsers','WRITE','ALLOW','ROLE','SchoolAdmin'),(374,'School','__create__SchoolInstitute','WRITE','ALLOW','ROLE','SchoolAdmin'),(375,'School','__create__SchoolDivision','WRITE','ALLOW','ROLE','SchoolAdmin'),(376,'School','__create__SchoolClass','WRITE','ALLOW','ROLE','SchoolAdmin'),(377,'School','__create__SchoolBoard','WRITE','ALLOW','ROLE','SchoolAdmin'),(378,'School','__create__Roles','WRITE','ALLOW','ROLE','SchoolAdmin'),(379,'School','__updateById__Students','WRITE','ALLOW','ROLE','SchoolAdmin'),(380,'School','__updateById__SchoolYear','WRITE','ALLOW','ROLE','SchoolAdmin'),(381,'School','__updateById__SchoolUsers','WRITE','ALLOW','ROLE','SchoolAdmin'),(382,'School','__updateById__SchoolInstitute','WRITE','ALLOW','ROLE','SchoolAdmin'),(383,'School','__updateById__SchoolDivision','WRITE','ALLOW','ROLE','SchoolAdmin'),(384,'School','__updateById__SchoolClass','WRITE','ALLOW','ROLE','SchoolAdmin'),(385,'School','__updateById__SchoolBoard','WRITE','ALLOW','ROLE','SchoolAdmin'),(386,'School','__updateById__Roles','WRITE','ALLOW','ROLE','SchoolAdmin'),(387,'Student','__get__StudentCategory','READ','ALLOW','ROLE','SchoolAdmin'),(388,'Student','__get__StudentClass','READ','ALLOW','ROLE','SchoolAdmin'),(389,'Student','__get__StudentDivision','READ','ALLOW','ROLE','SchoolAdmin'),(390,'Student','__get__StudentSchool','READ','ALLOW','ROLE','SchoolAdmin'),(391,'Student','getStudentFeeplanDetails','READ','ALLOW','ROLE','SchoolAdmin'),(392,'Class','__get__ClassSchool','READ','ALLOW','ROLE','SchoolAdmin'),(393,'Division','__get__DivisionClass','READ','ALLOW','ROLE','SchoolAdmin'),(394,'role','__get__rolemenu','READ','ALLOW','ROLE','SchoolAdmin'),(395,'School','__get__FeePlans','READ','ALLOW','ROLE','SchoolAdmin'),(396,'School','__findById__FeePlans','READ','ALLOW','ROLE','SchoolAdmin'),(397,'School','__count__FeePlans','READ','ALLOW','ROLE','SchoolAdmin'),(398,'School','__create__FeePlans','WRITE','ALLOW','ROLE','SchoolAdmin'),(399,'School','__updateById__FeePlans','WRITE','ALLOW','ROLE','SchoolAdmin'),(400,'Feeplan','__get__associations','READ','ALLOW','ROLE','SchoolAdmin'),(401,'Feeplan','__findById__associations','READ','ALLOW','ROLE','SchoolAdmin'),(402,'Feeplan','__count__associations','READ','ALLOW','ROLE','SchoolAdmin'),(403,'Feeplan','__create__associations','WRITE','ALLOW','ROLE','SchoolAdmin'),(404,'Feeplan','__updateById__associations','WRITE','ALLOW','ROLE','SchoolAdmin'),(405,'School','__get__Adhocfees','READ','ALLOW','ROLE','SchoolAdmin'),(406,'School','__findById__Adhocfees','READ','ALLOW','ROLE','SchoolAdmin'),(407,'School','__count__Adhocfees','READ','ALLOW','ROLE','SchoolAdmin'),(408,'School','__create__Adhocfees','WRITE','ALLOW','ROLE','SchoolAdmin'),(409,'School','__updateById__Adhocfees','WRITE','ALLOW','ROLE','SchoolAdmin'),(410,'School','__get__zones','READ','ALLOW','ROLE','SchoolAdmin'),(411,'School','__findById__zones','READ','ALLOW','ROLE','SchoolAdmin'),(412,'School','__count__zones','READ','ALLOW','ROLE','SchoolAdmin'),(413,'School','__create__zones','WRITE','ALLOW','ROLE','SchoolAdmin'),(414,'School','__updateById__zones','WRITE','ALLOW','ROLE','SchoolAdmin'),(415,'School','__create__SchoolClass','WRITE','ALLOW','ROLE','AddRole3'),(416,'Class','deleteRecord','WRITE','ALLOW','ROLE','DeleteClass4'),(417,'Addhocfee','create','WRITE','ALLOW','ROLE','NewRole5'),(418,'School','__updateById__SchoolClass','WRITE','ALLOW','ROLE','NewRole5'),(419,'Class','updateAttributes','WRITE','ALLOW','ROLE','NewRole5'),(420,'Class','updateAttribute','WRITE','ALLOW','ROLE','NewRole5'),(421,'Class','deleteRecord','WRITE','ALLOW','ROLE','AddRole3'),(422,'School','__count__SchoolClass','READ','ALLOW','ROLE','AddRole3'),(423,'School','__get__SchoolClass','READ','ALLOW','ROLE','AddRole3'),(424,'School','__findById__SchoolClass','READ','ALLOW','ROLE','AddRole3'),(425,'Class','__get__ClassSchool','READ','ALLOW','ROLE','AddRole3'),(426,'Student','__get__StudentClass','READ','ALLOW','ROLE','AddRole3'),(427,'Class','count','READ','ALLOW','ROLE','AddRole3'),(428,'Class','findById','READ','ALLOW','ROLE','AddRole3'),(429,'Class','find','READ','ALLOW','ROLE','AddRole3'),(430,'School','__create__SchoolClass','WRITE','ALLOW','ROLE','Createclass6'),(431,'School','__count__SchoolClass','READ','ALLOW','ROLE','Createclass6'),(432,'School','__get__SchoolClass','READ','ALLOW','ROLE','Createclass6'),(433,'School','__findById__SchoolClass','READ','ALLOW','ROLE','Createclass6'),(434,'Class','__get__ClassSchool','READ','ALLOW','ROLE','Createclass6'),(435,'Student','__get__StudentClass','READ','ALLOW','ROLE','Createclass6'),(436,'Class','find','READ','ALLOW','ROLE','Createclass6'),(437,'Class','findById','READ','ALLOW','ROLE','Createclass6'),(438,'Class','count','READ','ALLOW','ROLE','Createclass6'),(439,'School','__count__SchoolClass','READ','ALLOW','ROLE','Finance7'),(440,'School','__get__SchoolClass','READ','ALLOW','ROLE','Finance7'),(441,'School','__findById__SchoolClass','READ','ALLOW','ROLE','Finance7'),(442,'Class','__get__ClassSchool','READ','ALLOW','ROLE','Finance7'),(443,'Student','__get__StudentClass','READ','ALLOW','ROLE','Finance7'),(444,'Class','find','READ','ALLOW','ROLE','Finance7'),(445,'Class','findById','READ','ALLOW','ROLE','Finance7'),(446,'Class','count','READ','ALLOW','ROLE','Finance7'),(447,'School','__create__SchoolClass','WRITE','ALLOW','ROLE','Finance7'),(448,'School','__updateById__SchoolClass','WRITE','ALLOW','ROLE','Finance7'),(449,'Class','updateAttributes','WRITE','ALLOW','ROLE','Finance7'),(450,'Class','updateAttribute','WRITE','ALLOW','ROLE','Finance7'),(451,'Addhocfee','find','READ','ALLOW','ROLE','Createclass6'),(452,'Addhocfee','findById','READ','ALLOW','ROLE','Createclass6'),(453,'Addhocfee','count','READ','ALLOW','ROLE','Createclass6'),(454,'School','__create__SchoolClass','WRITE','ALLOW','ROLE','FeeStaff8'),(455,'School','__updateById__SchoolClass','WRITE','ALLOW','ROLE','FeeStaff8'),(456,'Class','updateAttributes','WRITE','ALLOW','ROLE','FeeStaff8'),(457,'Class','updateAttribute','WRITE','ALLOW','ROLE','FeeStaff8'),(458,'Class','deleteRecord','WRITE','ALLOW','ROLE','FeeStaff8');
/*!40000 ALTER TABLE `acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adhocfee`
--

DROP TABLE IF EXISTS `adhocfee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adhocfee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `schoolId` bigint(20) NOT NULL,
  `adhocFeeName` varchar(50) NOT NULL,
  `adhocFeeDescription` varchar(100) DEFAULT NULL,
  `invoiceDescription` varchar(50) DEFAULT NULL,
  `invoiceDetailText` varchar(100) DEFAULT NULL,
  `adhocFeeCharges` float(18,2) NOT NULL,
  `dueDate` datetime NOT NULL,
  `isTransactionProcessed` tinyint(1) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schoolId_addhocFeeName` (`schoolId`,`adhocFeeName`),
  KEY `FK_AddhocFee_School_idx` (`schoolId`),
  CONSTRAINT `FK_AddhocFee_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adhocfee`
--

LOCK TABLES `adhocfee` WRITE;
/*!40000 ALTER TABLE `adhocfee` DISABLE KEYS */;
/*!40000 ALTER TABLE `adhocfee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adhocfeedetails`
--

DROP TABLE IF EXISTS `adhocfeedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adhocfeedetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adhocFeeId` bigint(20) NOT NULL,
  `categoryId` bigint(20) NOT NULL,
  `classId` bigint(20) NOT NULL,
  `divisionId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addHocFee_category_class_division` (`adhocFeeId`,`categoryId`,`classId`,`divisionId`),
  KEY `FK_AddhockFeeDetails_AddhocFee_idx` (`adhocFeeId`),
  KEY `FK_AddhockFeeDetails_Category_idx` (`categoryId`),
  KEY `FK_AddhockFeeDetails_Class_idx` (`classId`),
  KEY `FK_AddhockFeeDetails_Dvision_idx` (`divisionId`),
  CONSTRAINT `FK_AddhockFeeDetails_AddhocFee` FOREIGN KEY (`adhocFeeId`) REFERENCES `adhocfee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_AddhockFeeDetails_Category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_AddhockFeeDetails_Class` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_AddhockFeeDetails_Dvision` FOREIGN KEY (`divisionId`) REFERENCES `division` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adhocfeedetails`
--

LOCK TABLES `adhocfeedetails` WRITE;
/*!40000 ALTER TABLE `adhocfeedetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `adhocfeedetails` ENABLE KEYS */;
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
INSERT INTO `board` VALUES (1,'CBSC','CBSC Board',0,1,'2017-11-06 17:58:10',NULL,NULL),(2,'ICSC','ICSC Board',0,1,'2017-11-06 17:58:10',NULL,NULL),(3,'SSE','SSE Board',0,1,'2017-11-06 17:58:10',NULL,NULL),(4,'NA','Not Aaplicatble',0,1,'2017-11-06 17:58:10',NULL,NULL);
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
INSERT INTO `category` VALUES (1,'General','General Category','Genral',0,1,'2017-11-06 12:32:49',NULL,NULL),(2,'Staff','Staff Category','Staff',0,1,'2017-11-06 12:32:49',NULL,NULL),(3,'Management','Management Category','Management',0,1,'2017-11-06 12:32:49',NULL,NULL),(4,'RTE','RTE Category','RTE',0,1,'2017-11-06 12:32:49',NULL,NULL);
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
INSERT INTO `class` VALUES (1,1,'12th Std','CL34',0,6,'2017-11-18 07:56:32',6,'2017-11-18 08:00:13'),(2,2,'Class A','CL56',0,13,'2017-11-21 05:52:38',13,'2017-11-21 05:56:16');
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
INSERT INTO `division` VALUES (1,1,1,'A','A',0,6,'2017-11-18 11:52:02',NULL,NULL),(2,2,2,'A','dv21',0,13,'2017-11-21 05:52:59',NULL,NULL);
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
  `chargeHeadName` varchar(20) NOT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schoolId_chargeHeadName_UNIQUE` (`schoolId`,`chargeHeadName`),
  UNIQUE KEY `schoolId_feeHeadName_UNIQUE` (`schoolId`,`feeHeadName`),
  KEY `FK_FeeHeads_Frequency_idx` (`frequencyId`),
  KEY `FK_FeeHeads_School_idx` (`schoolId`),
  CONSTRAINT `FK_FeeHeads_Frequency` FOREIGN KEY (`frequencyId`) REFERENCES `frequency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_FeeHeads_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
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
  `feePlanName` varchar(50) NOT NULL,
  `feePlanDescription` varchar(100) DEFAULT NULL,
  `academicYear` varchar(20) NOT NULL,
  `isTransactionProcessed` tinyint(1) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schoolId_feePlanName_UNIQUE` (`schoolId`,`feePlanName`),
  KEY `FK_FeePlan_School_idx` (`schoolId`),
  CONSTRAINT `FK_FeePlan_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeplan`
--

LOCK TABLES `feeplan` WRITE;
/*!40000 ALTER TABLE `feeplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `feeplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeplanassociation`
--

DROP TABLE IF EXISTS `feeplanassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feeplanassociation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `schoolId` bigint(20) NOT NULL,
  `feeplanId` bigint(20) NOT NULL,
  `classId` bigint(20) NOT NULL,
  `categoryId` bigint(20) NOT NULL,
  `academicYear` varchar(20) NOT NULL,
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `feeplanId_classId_categoryId_UNIQUE` (`feeplanId`,`classId`,`categoryId`,`academicYear`),
  KEY `FK_FeePlanAssociation_FeePlan_idx` (`feeplanId`),
  KEY `FK_FeePlanAssociation_Class_idx` (`classId`),
  KEY `FK_FeePlanAssociation_Category_idx` (`categoryId`),
  KEY `FK_FeePlanAssociation_School_idx` (`schoolId`),
  CONSTRAINT `FK_FeePlanAssociation_Category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_FeePlanAssociation_Class` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_FeePlanAssociation_FeePlan` FOREIGN KEY (`feeplanId`) REFERENCES `feeplan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_FeePlanAssociation_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeplanassociation`
--

LOCK TABLES `feeplanassociation` WRITE;
/*!40000 ALTER TABLE `feeplanassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `feeplanassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeplanheaddetails`
--

DROP TABLE IF EXISTS `feeplanheaddetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feeplanheaddetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `schoolId` bigint(20) NOT NULL,
  `feePlanId` bigint(20) NOT NULL,
  `feeHeadId` bigint(20) NOT NULL,
  `feeCharges` decimal(9,2) NOT NULL,
  `sequenceNumber` int(2) NOT NULL,
  `dueDate` date NOT NULL,
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `feePlan_feeHead_dueDate_UNIQUE` (`feePlanId`,`feeHeadId`,`dueDate`),
  KEY `FK_FeePlanDetails_FeePlan_idx` (`feePlanId`),
  KEY `FK_FeePlanDetails_FeeHead_idx` (`feeHeadId`),
  KEY `FK_FeePlanDetails_School_idx` (`schoolId`),
  CONSTRAINT `FK_FeePlanDetails_FeeHead` FOREIGN KEY (`feeHeadId`) REFERENCES `feehead` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_FeePlanDetails_FeePlan` FOREIGN KEY (`feePlanId`) REFERENCES `feeplan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_FeePlanDetails_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
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
INSERT INTO `frequency` VALUES (1,'Monthly',12,0,1,'2017-11-06 12:35:41',1,'2017-11-21 05:31:52'),(2,'Quarterly',3,0,1,'2017-11-06 12:35:41',NULL,NULL),(3,'Half Yearly',2,0,1,'2017-11-06 12:35:41',NULL,NULL),(4,'Yearly',1,0,1,'2017-11-06 12:35:41',NULL,NULL),(5,'OneTime',1,0,1,'2017-11-06 12:35:41',NULL,NULL);
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
  `email` varchar(254) DEFAULT NULL,
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
INSERT INTO `institute` VALUES (1,'St Xavier\'s Institute ','This is the xavier\'s Institute ','9543301832','rangarajan.ragavan@phicommerce.com','G 58, 3:1, Sector-4, Nerul, Navi Mumbai ',0,1,'2017-11-18 06:51:54',NULL,NULL),(3,'Avabai Petit Girls High School','','','leena.gulanikar@phicommerce.com','Union Park, Bandra West, Mumbai ',0,12,'2017-11-22 14:46:53',1,'2017-11-23 05:20:00');
/*!40000 ALTER TABLE `institute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoiceNumber` varchar(32) NOT NULL,
  `merchantId` varchar(12) NOT NULL,
  `aggregatorId` varchar(12) DEFAULT NULL,
  `userId` varchar(24) NOT NULL,
  `userName` varchar(48) DEFAULT NULL,
  `emailId` varchar(264) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `desc` varchar(48) NOT NULL,
  `dueDate` date NOT NULL,
  `chargeAmount` decimal(9,2) NOT NULL,
  `isProcessed` tinyint(1) DEFAULT NULL,
  `transactionId` varchar(24) DEFAULT NULL,
  `paymentId` varchar(24) DEFAULT NULL,
  `paymentDate` datetime DEFAULT NULL,
  `settlementID` varchar(32) DEFAULT NULL,
  `settlementDate` datetime DEFAULT NULL,
  `calculatedLateFees` decimal(9,2) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoiceNumber_UNIQUE` (`invoiceNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoicedetails`
--

DROP TABLE IF EXISTS `invoicedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoicedetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoiceNumber` varchar(32) NOT NULL,
  `feePlanName` varchar(50) NOT NULL,
  `className` varchar(50) NOT NULL,
  `categoryName` varchar(50) NOT NULL,
  `feeHeadName` varchar(50) NOT NULL,
  `frquecneyName` varchar(50) NOT NULL,
  `chargeHeadName` varchar(20) NOT NULL,
  `chargeAmount` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoicedetails`
--

LOCK TABLES `invoicedetails` WRITE;
/*!40000 ALTER TABLE `invoicedetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoicedetails` ENABLE KEYS */;
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
INSERT INTO `menu` VALUES (1,'Institures',0,1,0,1,'2017-11-03 15:12:09',NULL,NULL),(2,'Board',0,2,0,1,'2017-11-03 15:12:09',NULL,NULL),(3,'Schools',0,3,0,1,'2017-11-03 15:12:09',NULL,NULL),(4,'Role And Permissions',0,4,0,1,'2017-11-03 15:12:09',NULL,NULL),(5,'User Management',0,5,0,1,'2017-11-03 15:12:09',NULL,NULL),(6,'Frequency',0,6,0,1,'2017-11-03 15:12:09',NULL,NULL),(7,'Class',0,7,0,1,'2017-11-03 15:12:09',NULL,NULL),(8,'Division',0,8,0,1,'2017-11-03 15:12:09',NULL,NULL),(9,'Category',0,9,0,1,'2017-11-03 15:12:09',NULL,NULL),(10,'Fee Heads',0,10,0,1,'2017-11-03 15:12:09',NULL,NULL),(11,'Fee Plans',0,11,0,1,'2017-11-03 15:12:09',NULL,NULL),(12,'Zone',0,12,0,1,'2017-11-03 15:12:09',NULL,NULL),(13,'AddHoc Fee',0,13,0,1,'2017-11-03 15:12:09',NULL,NULL),(14,'Student Management',0,14,0,1,'2017-11-03 15:12:09',NULL,NULL),(15,'Process Fee',0,15,0,1,'2017-11-03 15:12:09',NULL,NULL),(16,'Reports',0,16,0,1,'2017-11-03 15:12:09',NULL,NULL),(17,'AcademicYear',0,17,0,1,'2017-11-03 12:49:35',NULL,NULL),(18,'FeePlanAssociation',0,18,0,1,'2017-11-03 12:49:35',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,1,1,'Institute.Create','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),(2,1,1,'Institute.Read','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),(3,1,1,'Institute.Update','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),(4,1,1,'Institute.Delete','Institute',0,1,'2017-11-03 15:52:26',NULL,NULL),(5,2,1,'Board.Create','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),(6,2,1,'Board.Read','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),(7,2,1,'Board.Update','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),(8,2,1,'Board.Delete','Board',0,1,'2017-11-03 15:52:26',NULL,NULL),(9,3,1,'School.Create','School',0,1,'2017-11-03 15:52:26',NULL,NULL),(10,3,1,'School.Read','School',0,1,'2017-11-03 15:52:26',NULL,NULL),(11,3,1,'School.Update','School',0,1,'2017-11-03 15:52:26',NULL,NULL),(12,3,1,'School.Delete','School',0,1,'2017-11-03 15:52:26',NULL,NULL),(13,4,1,'Role.Create','role',0,1,'2017-11-03 15:52:26',NULL,NULL),(14,4,1,'Role.Read','role',0,1,'2017-11-03 15:52:26',NULL,NULL),(15,4,1,'Role.Update','role',0,1,'2017-11-03 15:52:26',NULL,NULL),(16,4,1,'Role.Delete','role',0,1,'2017-11-03 15:52:26',NULL,NULL),(17,5,1,'User.Create','user',0,1,'2017-11-03 15:52:26',NULL,NULL),(18,5,1,'User.Read','user',0,1,'2017-11-03 15:52:26',NULL,NULL),(19,5,1,'User.Update','user',0,1,'2017-11-03 15:52:26',NULL,NULL),(20,5,1,'User.Delete','user',0,1,'2017-11-03 15:52:26',NULL,NULL),(21,6,1,'Frequency.Create','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),(22,6,1,'Frequency.Read','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),(23,6,1,'Frequency.Update','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),(24,6,1,'Frequency.Delete','Frequency',0,1,'2017-11-03 15:52:26',NULL,NULL),(25,7,1,'Class.Create','Class',0,1,'2017-11-03 15:52:26',NULL,NULL),(26,7,1,'Class.Read','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(27,7,1,'Class.Update','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(28,7,1,'Class.Delete','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(29,8,1,'Division.Create','Division',0,1,'2017-11-03 16:11:22',NULL,NULL),(30,8,1,'Division.Read','Division',0,1,'2017-11-03 16:11:23',NULL,NULL),(31,8,1,'Division.Update','Division',0,1,'2017-11-03 16:11:23',NULL,NULL),(32,8,1,'Division.Delete','Division',0,1,'2017-11-03 16:11:23',NULL,NULL),(33,9,1,'Category.Create','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),(34,9,1,'Category.Read','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),(35,9,1,'Category.Update','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),(36,9,1,'Category.Delete','Category',0,1,'2017-11-03 16:11:23',NULL,NULL),(37,10,1,'Feehead.Create','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(38,10,1,'Feehead.Read','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(39,10,1,'Feehead.Update','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(40,10,1,'Feehead.Delete','Feehead',0,1,'2017-11-03 16:11:24',NULL,NULL),(41,11,1,'Feeplan.Create','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(42,11,1,'Feeplan.Read','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(43,11,1,'Feeplan.Update','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(44,11,1,'Feeplan.Delete','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(45,12,1,'Transport.Create','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(46,12,1,'Transport.Read','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(47,12,1,'Transport.Update','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(48,12,1,'Transport.Delete','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(49,13,1,'Addhocfee.Create','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(50,13,1,'Addhocfee.Read','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(51,13,1,'Addhocfee.Update','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(52,13,1,'Addhocfee.Delete','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(53,14,1,'Student.Create','Student',0,1,'2017-11-03 16:11:24',NULL,NULL),(54,14,1,'Student.Read','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(55,14,1,'Student.Update','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(56,14,1,'Student.Delete','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(57,15,1,'ProcessFee.Create','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(58,15,1,'ProcessFee.Read','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(59,15,1,'ProcessFee.Update','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(60,15,1,'ProcessFee.Delete','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(61,16,1,'Report.Create','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(62,16,1,'Report.Read','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(63,16,1,'Report.Update','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(64,16,1,'Report.Delete','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(65,17,1,'AcademicYear.Create','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(66,17,1,'AcademicYear.Read','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(67,17,1,'AcademicYear.Update','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(68,17,1,'AcademicYear.Delete','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(69,7,2,'Class.Create','Class',0,1,'2017-11-03 15:52:26',NULL,NULL),(70,7,2,'Class.Read','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(71,7,2,'Class.Update','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(72,7,2,'Class.Delete','Class',0,1,'2017-11-03 16:11:22',NULL,NULL),(73,8,2,'Division.Create','Division',0,1,'2017-11-03 16:11:22',NULL,NULL),(74,8,2,'Division.Read','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),(75,8,2,'Division.Update','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),(76,8,2,'Division.Delete','Dvision',0,1,'2017-11-03 16:11:23',NULL,NULL),(77,10,2,'Feehead.Create','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(78,10,2,'Feehead.Read','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(79,10,2,'Feehead.Update','Feehead',0,1,'2017-11-03 16:11:23',NULL,NULL),(80,10,2,'Feehead.Delete','Feehead',0,1,'2017-11-03 16:11:24',NULL,NULL),(81,11,2,'Feeplan.Create','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(82,11,2,'Feeplan.Read','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(83,11,2,'Feeplan.Update','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(84,11,2,'Feeplan.Delete','Feeplan',0,1,'2017-11-03 16:11:24',NULL,NULL),(85,12,2,'Transport.Create','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(86,12,2,'Transport.Read','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(87,12,2,'Transport.Update','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(88,12,2,'Transport.Delete','Transport',0,1,'2017-11-03 16:11:24',NULL,NULL),(89,13,2,'Addhocfee.Create','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(90,13,2,'Addhocfee.Read','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(91,13,2,'Addhocfee.Update','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(92,13,2,'Addhocfee.Delete','Addhocfee',0,1,'2017-11-03 16:11:24',NULL,NULL),(93,14,2,'Student.Create','Student',0,1,'2017-11-03 16:11:24',NULL,NULL),(94,14,2,'Student.Read','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(95,14,2,'Student.Update','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(96,14,2,'Student.Delete','Student',0,1,'2017-11-03 16:11:25',NULL,NULL),(97,15,2,'ProcessFee.Create','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(98,15,2,'ProcessFee.Read','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(99,15,2,'ProcessFee.Update','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(100,15,2,'ProcessFee.Delete','ProcessFee',0,1,'2017-11-03 16:11:25',NULL,NULL),(101,16,2,'Report.Create','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(102,16,2,'Report.Read','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(103,16,2,'Report.Update','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(104,16,2,'Report.Delete','Report',0,1,'2017-11-03 16:11:25',NULL,NULL),(105,17,2,'AcademicYear.Create','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(106,17,2,'AcademicYear.Read','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(107,17,2,'AcademicYear.Update','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(108,17,2,'AcademicYear.Delete','Academicyear',0,1,'2017-11-03 12:51:59',NULL,NULL),(125,18,1,'FeePlanAssociation.Create','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL),(126,18,1,'FeePlanAssociation.Read','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL),(127,18,1,'FeePlanAssociation.Update','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL),(128,18,1,'FeePlanAssociation.Delete','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL),(129,18,2,'FeePlanAssociation.Create','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL),(130,18,2,'FeePlanAssociation.Read','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL),(131,18,2,'FeePlanAssociation.Update','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL),(132,18,2,'FeePlanAssociation.Delete','Feeplanassociation',0,1,'2017-11-03 12:51:59',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,NULL,'SuperAdmin','Super Administration','SuperAdmin',0,1,'2017-11-03 16:14:10',NULL,NULL),(2,NULL,'SchoolAdmin','School Admin','SchoolAdmin',0,1,'2017-11-03 16:14:10',NULL,NULL),(3,1,'AddRole3','Can add Class and delete Class ','Add Class ',0,6,'2017-11-18 07:46:50',6,NULL),(4,1,'DeleteClass4','It can also delete class ','Delete Class ',1,6,'2017-11-18 07:55:06',6,NULL),(5,1,'NewRole5','Yet to be defined ','New Role',0,6,'2017-11-18 08:05:11',6,NULL),(6,2,'Createclass6','Creating class ','Create class',0,13,'2017-11-21 06:10:17',13,NULL),(7,1,'Finance7','Will deal with finance ','Finance ',0,13,'2017-11-22 12:23:02',13,NULL),(8,1,'FeeStaff8','Management of fee system','Fee Staff',0,13,'2017-11-22 15:50:23',13,NULL),(9,1,'Frontoffice9','Front office staff ','Front office',0,13,'2017-11-22 15:55:31',13,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolemapping`
--

LOCK TABLES `rolemapping` WRITE;
/*!40000 ALTER TABLE `rolemapping` DISABLE KEYS */;
INSERT INTO `rolemapping` VALUES (1,'USER',1,1),(2,'USER',2,2),(3,'USER',5,2),(4,'USER',6,2),(5,'USER',7,3),(6,'USER',8,3),(7,'USER',9,2),(8,'USER',10,2),(9,'USER',11,2),(10,'USER',12,1),(11,'USER',13,2),(12,'USER',14,1),(13,'USER',15,8),(14,'USER',16,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolemenudetails`
--

LOCK TABLES `rolemenudetails` WRITE;
/*!40000 ALTER TABLE `rolemenudetails` DISABLE KEYS */;
INSERT INTO `rolemenudetails` VALUES (1,1,1,1,'2017-11-03 12:20:07',NULL,NULL),(2,1,2,1,'2017-11-03 12:20:07',NULL,NULL),(3,1,3,1,'2017-11-03 12:20:07',NULL,NULL),(4,1,4,1,'2017-11-03 12:20:07',NULL,NULL),(5,1,5,1,'2017-11-03 12:20:07',NULL,NULL),(6,1,6,1,'2017-11-03 12:20:07',NULL,NULL),(7,1,7,1,'2017-11-03 12:20:07',NULL,NULL),(8,1,8,1,'2017-11-03 12:20:07',NULL,NULL),(9,1,9,1,'2017-11-03 12:20:07',NULL,NULL),(10,1,10,1,'2017-11-03 12:20:07',NULL,NULL),(11,1,11,1,'2017-11-03 12:20:07',NULL,NULL),(12,1,12,1,'2017-11-03 12:20:07',NULL,NULL),(13,1,13,1,'2017-11-03 12:20:07',NULL,NULL),(14,1,14,1,'2017-11-03 12:20:07',NULL,NULL),(15,1,15,1,'2017-11-03 12:20:07',NULL,NULL),(16,1,16,1,'2017-11-03 12:20:07',NULL,NULL),(17,1,17,1,'2017-11-03 13:16:14',NULL,NULL),(18,2,4,1,'2017-11-03 14:03:33',NULL,NULL),(19,2,5,1,'2017-11-03 14:03:33',NULL,NULL),(20,2,7,1,'2017-11-03 14:03:33',NULL,NULL),(21,2,8,1,'2017-11-03 14:03:33',NULL,NULL),(22,2,10,1,'2017-11-03 14:03:33',NULL,NULL),(23,2,11,1,'2017-11-03 14:03:33',NULL,NULL),(24,2,12,1,'2017-11-03 14:03:33',NULL,NULL),(25,2,13,1,'2017-11-03 14:03:33',NULL,NULL),(26,2,14,1,'2017-11-03 14:03:33',NULL,NULL),(27,2,15,1,'2017-11-03 14:03:33',NULL,NULL),(28,2,16,1,'2017-11-03 14:03:33',NULL,NULL),(29,2,17,1,'2017-11-03 14:03:33',NULL,NULL),(34,1,18,1,'2017-11-30 14:57:23',NULL,NULL),(35,2,18,1,'2017-11-30 14:57:23',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=1680 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolepermissiondetails`
--

LOCK TABLES `rolepermissiondetails` WRITE;
/*!40000 ALTER TABLE `rolepermissiondetails` DISABLE KEYS */;
INSERT INTO `rolepermissiondetails` VALUES (1,1,1,'Institute.Create',1,'2017-11-03 13:56:01',NULL,NULL),(2,1,2,'Institute.Read',1,'2017-11-03 13:56:01',NULL,NULL),(3,1,3,'Institute.Update',1,'2017-11-03 13:56:01',NULL,NULL),(4,1,4,'Institute.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(5,1,5,'Board.Create',1,'2017-11-03 13:56:01',NULL,NULL),(6,1,6,'Board.Read',1,'2017-11-03 13:56:01',NULL,NULL),(7,1,7,'Board.Update',1,'2017-11-03 13:56:01',NULL,NULL),(8,1,8,'Board.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(9,1,9,'School.Create',1,'2017-11-03 13:56:01',NULL,NULL),(10,1,10,'School.Read',1,'2017-11-03 13:56:01',NULL,NULL),(11,1,11,'School.Update',1,'2017-11-03 13:56:01',NULL,NULL),(12,1,12,'School.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(13,1,13,'Role.Create',1,'2017-11-03 13:56:01',NULL,NULL),(14,1,14,'Role.Read',1,'2017-11-03 13:56:01',NULL,NULL),(15,1,15,'Role.Update',1,'2017-11-03 13:56:01',NULL,NULL),(16,1,16,'Role.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(17,1,17,'User.Create',1,'2017-11-03 13:56:01',NULL,NULL),(18,1,18,'User.Read',1,'2017-11-03 13:56:01',NULL,NULL),(19,1,19,'User.Update',1,'2017-11-03 13:56:01',NULL,NULL),(20,1,20,'User.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(21,1,21,'Frequency.Create',1,'2017-11-03 13:56:01',NULL,NULL),(22,1,22,'Frequency.Read',1,'2017-11-03 13:56:01',NULL,NULL),(23,1,23,'Frequency.Update',1,'2017-11-03 13:56:01',NULL,NULL),(24,1,24,'Frequency.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(25,1,25,'Class.Create',1,'2017-11-03 13:56:01',NULL,NULL),(26,1,26,'Class.Read',1,'2017-11-03 13:56:01',NULL,NULL),(27,1,27,'Class.Update',1,'2017-11-03 13:56:01',NULL,NULL),(28,1,28,'Class.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(29,1,29,'Division.Create',1,'2017-11-03 13:56:01',NULL,NULL),(30,1,30,'Division.Read',1,'2017-11-03 13:56:01',NULL,NULL),(31,1,31,'Division.Update',1,'2017-11-03 13:56:01',NULL,NULL),(32,1,32,'Division.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(33,1,33,'Category.Create',1,'2017-11-03 13:56:01',NULL,NULL),(34,1,34,'Category.Read',1,'2017-11-03 13:56:01',NULL,NULL),(35,1,35,'Category.Update',1,'2017-11-03 13:56:01',NULL,NULL),(36,1,36,'Category.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(37,1,37,'Feehead.Create',1,'2017-11-03 13:56:01',NULL,NULL),(38,1,38,'Feehead.Read',1,'2017-11-03 13:56:01',NULL,NULL),(39,1,39,'Feehead.Update',1,'2017-11-03 13:56:01',NULL,NULL),(40,1,40,'Feehead.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(41,1,41,'Feeplan.Create',1,'2017-11-03 13:56:01',NULL,NULL),(42,1,42,'Feeplan.Read',1,'2017-11-03 13:56:01',NULL,NULL),(43,1,43,'Feeplan.Update',1,'2017-11-03 13:56:01',NULL,NULL),(44,1,44,'Feeplan.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(45,1,45,'Transport.Create',1,'2017-11-03 13:56:01',NULL,NULL),(46,1,46,'Transport.Read',1,'2017-11-03 13:56:01',NULL,NULL),(47,1,47,'Transport.Update',1,'2017-11-03 13:56:01',NULL,NULL),(48,1,48,'Transport.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(49,1,49,'Addhocfee.Create',1,'2017-11-03 13:56:01',NULL,NULL),(50,1,50,'Addhocfee.Read',1,'2017-11-03 13:56:01',NULL,NULL),(51,1,51,'Addhocfee.Update',1,'2017-11-03 13:56:01',NULL,NULL),(52,1,52,'Addhocfee.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(53,1,53,'Student.Create',1,'2017-11-03 13:56:01',NULL,NULL),(54,1,54,'Student.Read',1,'2017-11-03 13:56:01',NULL,NULL),(55,1,55,'Student.Update',1,'2017-11-03 13:56:01',NULL,NULL),(56,1,56,'Student.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(57,1,57,'ProcessFee.Create',1,'2017-11-03 13:56:01',NULL,NULL),(58,1,58,'ProcessFee.Read',1,'2017-11-03 13:56:01',NULL,NULL),(59,1,59,'ProcessFee.Update',1,'2017-11-03 13:56:01',NULL,NULL),(60,1,60,'ProcessFee.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(61,1,61,'Report.Create',1,'2017-11-03 13:56:01',NULL,NULL),(62,1,62,'Report.Read',1,'2017-11-03 13:56:01',NULL,NULL),(63,1,63,'Report.Update',1,'2017-11-03 13:56:01',NULL,NULL),(64,1,64,'Report.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(65,1,65,'AcademicYear.Create',1,'2017-11-03 13:56:01',NULL,NULL),(66,1,66,'AcademicYear.Read',1,'2017-11-03 13:56:01',NULL,NULL),(67,1,67,'AcademicYear.Update',1,'2017-11-03 13:56:01',NULL,NULL),(68,1,68,'AcademicYear.Delete',1,'2017-11-03 13:56:01',NULL,NULL),(69,2,13,'Role.Create',1,'2017-11-03 14:06:07',NULL,NULL),(70,2,14,'Role.Read',1,'2017-11-03 14:06:07',NULL,NULL),(71,2,15,'Role.Update',1,'2017-11-03 14:06:07',NULL,NULL),(72,2,16,'Role.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(73,2,17,'User.Create',1,'2017-11-03 14:06:07',NULL,NULL),(74,2,18,'User.Read',1,'2017-11-03 14:06:07',NULL,NULL),(75,2,19,'User.Update',1,'2017-11-03 14:06:07',NULL,NULL),(76,2,20,'User.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(77,2,25,'Class.Create',1,'2017-11-03 14:06:07',NULL,NULL),(78,2,26,'Class.Read',1,'2017-11-03 14:06:07',NULL,NULL),(79,2,27,'Class.Update',1,'2017-11-03 14:06:07',NULL,NULL),(80,2,28,'Class.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(81,2,29,'Division.Create',1,'2017-11-03 14:06:07',NULL,NULL),(82,2,30,'Division.Read',1,'2017-11-03 14:06:07',NULL,NULL),(83,2,31,'Division.Update',1,'2017-11-03 14:06:07',NULL,NULL),(84,2,32,'Division.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(85,2,37,'Feehead.Create',1,'2017-11-03 14:06:07',NULL,NULL),(86,2,38,'Feehead.Read',1,'2017-11-03 14:06:07',NULL,NULL),(87,2,39,'Feehead.Update',1,'2017-11-03 14:06:07',NULL,NULL),(88,2,40,'Feehead.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(89,2,41,'Feeplan.Create',1,'2017-11-03 14:06:07',NULL,NULL),(90,2,42,'Feeplan.Read',1,'2017-11-03 14:06:07',NULL,NULL),(91,2,43,'Feeplan.Update',1,'2017-11-03 14:06:07',NULL,NULL),(92,2,44,'Feeplan.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(93,2,45,'Transport.Create',1,'2017-11-03 14:06:07',NULL,NULL),(94,2,46,'Transport.Read',1,'2017-11-03 14:06:07',NULL,NULL),(95,2,47,'Transport.Update',1,'2017-11-03 14:06:07',NULL,NULL),(96,2,48,'Transport.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(97,2,49,'Addhocfee.Create',1,'2017-11-03 14:06:07',NULL,NULL),(98,2,50,'Addhocfee.Read',1,'2017-11-03 14:06:07',NULL,NULL),(99,2,51,'Addhocfee.Update',1,'2017-11-03 14:06:07',NULL,NULL),(100,2,52,'Addhocfee.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(101,2,53,'Student.Create',1,'2017-11-03 14:06:07',NULL,NULL),(102,2,54,'Student.Read',1,'2017-11-03 14:06:07',NULL,NULL),(103,2,55,'Student.Update',1,'2017-11-03 14:06:07',NULL,NULL),(104,2,56,'Student.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(105,2,57,'ProcessFee.Create',1,'2017-11-03 14:06:07',NULL,NULL),(106,2,58,'ProcessFee.Read',1,'2017-11-03 14:06:07',NULL,NULL),(107,2,59,'ProcessFee.Update',1,'2017-11-03 14:06:07',NULL,NULL),(108,2,60,'ProcessFee.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(109,2,61,'Report.Create',1,'2017-11-03 14:06:07',NULL,NULL),(110,2,62,'Report.Read',1,'2017-11-03 14:06:07',NULL,NULL),(111,2,63,'Report.Update',1,'2017-11-03 14:06:07',NULL,NULL),(112,2,64,'Report.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(113,2,65,'AcademicYear.Create',1,'2017-11-03 14:06:07',NULL,NULL),(114,2,66,'AcademicYear.Read',1,'2017-11-03 14:06:07',NULL,NULL),(115,2,67,'AcademicYear.Update',1,'2017-11-03 14:06:07',NULL,NULL),(116,2,68,'AcademicYear.Delete',1,'2017-11-03 14:06:07',NULL,NULL),(118,3,69,'Class.Create',6,'2017-11-18 07:54:27',NULL,NULL),(119,4,72,'Class.Delete',6,'2017-11-18 07:55:37',NULL,NULL),(120,5,89,'Addhocfee.Create',6,'2017-11-18 08:07:54',NULL,NULL),(121,5,71,'Class.Update',6,'2017-11-18 08:10:14',NULL,NULL),(122,3,72,'Class.Delete',6,'2017-11-18 08:32:20',NULL,NULL),(123,3,70,'Class.Read',6,'2017-11-18 09:05:39',NULL,NULL),(124,6,69,'Class.Create',13,'2017-11-21 06:11:35',NULL,NULL),(125,6,70,'Class.Read',13,'2017-11-21 06:11:42',NULL,NULL),(126,7,70,'Class.Read',13,'2017-11-22 12:23:53',NULL,NULL),(127,7,69,'Class.Create',13,'2017-11-22 12:23:58',NULL,NULL),(128,7,71,'Class.Update',13,'2017-11-22 12:24:02',NULL,NULL),(129,6,90,'Addhocfee.Read',13,'2017-11-22 13:02:40',NULL,NULL),(130,8,69,'Class.Create',13,'2017-11-22 15:52:24',NULL,NULL),(131,8,71,'Class.Update',13,'2017-11-22 15:52:37',NULL,NULL),(132,8,72,'Class.Delete',13,'2017-11-22 15:52:44',NULL,NULL),(1672,1,125,'FeePlanAssociation.Create',1,'2017-11-30 15:16:58',NULL,NULL),(1673,1,126,'FeePlanAssociation.Read',1,'2017-11-30 15:16:58',NULL,NULL),(1674,1,127,'FeePlanAssociation.Update',1,'2017-11-30 15:16:58',NULL,NULL),(1675,1,128,'FeePlanAssociation.Delete',1,'2017-11-30 15:16:58',NULL,NULL),(1676,2,129,'FeePlanAssociation.Create',1,'2017-11-30 15:16:58',NULL,NULL),(1677,2,130,'FeePlanAssociation.Read',1,'2017-11-30 15:16:58',NULL,NULL),(1678,2,131,'FeePlanAssociation.Update',1,'2017-11-30 15:16:58',NULL,NULL),(1679,2,132,'FeePlanAssociation.Delete',1,'2017-11-30 15:16:58',NULL,NULL);
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
  `schoolEmail` varchar(254) DEFAULT NULL,
  `schoolPhone` varchar(20) DEFAULT NULL,
  `schoolAddress` varchar(500) DEFAULT NULL,
  `schoolCity` varchar(50) DEFAULT NULL,
  `schoolState` varchar(50) DEFAULT NULL,
  `schoolCountry` varchar(50) DEFAULT NULL,
  `schoolLogo` varchar(50) DEFAULT NULL,
  `schoolHeader` varchar(50) NOT NULL,
  `processingDate` int(2) NOT NULL,
  `graceDays` int(2) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (1,1,1,'St Vincent\'s High School ','23409','aryan.ragavan@gmail.','9699810653','G44232jshassasasa','Navi Mumbai','Maharashtra ',NULL,NULL,'St Vin',5,10,0,1,'2017-11-18 07:07:54',NULL,NULL),(2,1,2,'St. Xavier School','X001','adminxavier@xaviers.com','7894565123','Pune','Pune','Maharashtra',NULL,'/api/containers/2/download/logosample.jpg','St. Xavier school',5,10,0,1,'2017-11-20 13:47:14',1,'2017-11-20 14:26:53'),(3,1,1,'St Augustine High School ','AG2001','aryan.ragavan@gmail.com','9543301832','This is my new shcool Address ','Navi Mumbai','Maharashtra ',NULL,'/api/containers/3/download/logosample.jpg','Augustine',5,10,0,1,'2017-11-21 07:43:45',1,'2017-11-21 08:01:28'),(4,3,2,'Avabai Petit Girls High School','AVA123','leena.gulanikar@phicommerce.com','9920919922','Union Park','Mumbai','Maharashtra',NULL,NULL,'Ava',5,10,0,12,'2017-11-22 14:49:10',1,'2017-11-23 05:20:27');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolmerchant`
--

DROP TABLE IF EXISTS `schoolmerchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schoolmerchant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `schoolId` bigint(20) NOT NULL,
  `merchantId` varchar(12) NOT NULL,
  `securityKey` varchar(64) NOT NULL,
  `isDefault` tinyint(1) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_merchant_UNIQE` (`schoolId`,`merchantId`),
  KEY `FK_SchoolMerchant_School_idx` (`schoolId`),
  CONSTRAINT `FK_SchoolMerchant_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolmerchant`
--

LOCK TABLES `schoolmerchant` WRITE;
/*!40000 ALTER TABLE `schoolmerchant` DISABLE KEYS */;
/*!40000 ALTER TABLE `schoolmerchant` ENABLE KEYS */;
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
  `title` varchar(10) DEFAULT NULL,
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
  `email` varchar(254) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `cast` varchar(50) DEFAULT NULL,
  `bloodGroup` varchar(20) DEFAULT NULL,
  `academicYear` varchar(20) NOT NULL,
  `isRegistered` tinyint(1) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) DEFAULT '1',
  `deactiveDate` datetime DEFAULT NULL,
  `deactiveDesc` varchar(100) DEFAULT NULL,
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
INSERT INTO `student` VALUES (1,1,1,1,1,NULL,'K001','1001',NULL,'Raghu ','Ragavan','Butt','Male','Alpha','Butt','9762147262','Daniela','Butt','9822053665','','','','2014-03-03','2017-06-15','Aundh, Pune','Nerul','Maharashtra','India','9762982700','schooltest90@gmail.com','Hindu','OPEN','O+','2017-18',0,1,NULL,NULL,0,1,'2017-11-14 00:00:00',13,'2017-11-23 05:56:18'),(2,1,1,1,1,NULL,'K001','1002',NULL,'Barkha','Sharma','Butt','Male','Alpha','Butt','9762147262','Daniela','Butt','9822053665','','','','2014-03-03','2017-06-15','Aundh, Pune','','Maharashtra','India','9543301832','','Hindu','OPEN','O+','2017-18',0,1,NULL,NULL,0,1,'2017-11-14 00:00:00',NULL,NULL),(5,1,1,1,1,NULL,'K001','1003',NULL,'Satish','Vijay','Bull','Male','Alpha','Butt','9762147262','Daniela','Butt','9822053665','','','','2014-03-03','2017-06-15','Aundh, Pune','','Maharashtra','India','9762982700','','Hindu','OPEN','O+','2017-18',0,1,NULL,NULL,0,1,'2017-11-14 00:00:00',NULL,NULL),(6,1,1,1,1,NULL,'K001','1004',NULL,'Anil','Sharmila','Bull','Male','Alpha','Butt','9762147262','Daniela','Butt','9822053665','','','','2014-03-03','2017-06-15','Aundh, Pune','','Maharashtra','India','9543301832','','Hindu','OPEN','O+','2017-18',0,1,NULL,NULL,0,1,'2017-11-14 00:00:00',NULL,NULL),(7,1,1,1,1,NULL,'K001','1005',NULL,'Priya','Bajaj','Bullet','Male','Alpha','Bagavan','9762147262','Daniela','Butt','9822053665','','','','2014-03-03','2017-06-15','Aundh, Pune','','Maharashtra','India','9762982700','','Hindu','OPEN','O+','2017-18',0,1,NULL,NULL,0,1,'2017-11-14 00:00:00',NULL,NULL),(8,1,1,1,1,NULL,'K001','1006',NULL,'Sharukhan','Khan','Bullet','Male','Alpha','Bhagi','9762147262','Daniela','Butt','9822053665','','','','2014-03-03','2017-06-15','Aundh, Pune','','Maharashtra','India','9543301832','','Hindu','OPEN','O+','2017-18',0,1,NULL,NULL,0,1,'2017-11-14 00:00:00',NULL,NULL),(9,1,1,1,1,NULL,'K001','8007',NULL,'Akansha  kaur','Ragavan','Butt','Male','Alpha','Butt','9762147262','Daniela','Butt','9822053665','','','','2014-03-03','2017-06-15','Aundh, Pune','','Maharashtra','India','9762982700','','Hindu','OPEN','O+','2017-18',0,1,NULL,NULL,0,1,'2017-11-14 00:00:00',NULL,NULL),(10,1,1,1,1,NULL,'K001','8008',NULL,'Aksahy','Sharma','Butt','Male','Alpha','Butt','9762147262','Daniela','Butt','9822053665','','','','2014-03-03','2017-06-15','Aundh, Pune','','Maharashtra','India','9543301832','','Hindu','OPEN','O+','2017-18',0,1,NULL,NULL,0,1,'2017-11-14 00:00:00',NULL,NULL),(11,2,1,2,2,NULL,'K001','1007',NULL,'Ravi','Kant','Kemal','Male','Alpha','Butt','9762147262','Daniela','Butt','9822053665','','','','2014-03-03','2017-06-15','Aundh, Pune','','Maharashtra','India','9762982700','','Hindu','OPEN','O+','2017-18',0,1,NULL,NULL,0,1,'2017-11-14 00:00:00',NULL,NULL),(12,2,1,2,2,NULL,'K001','1008',NULL,'Sesha','Sharmila','Keval','Male','Alpha','Butt','9762147262','Daniela','Butt','9822053665','','','','2014-03-03','2017-06-15','Aundh, Pune','','Maharashtra','India','9543301832','','Hindu','OPEN','O+','2017-18',0,1,NULL,NULL,0,1,'2017-11-14 00:00:00',NULL,NULL);
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
  `email` varchar(254) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'Administrator','$2a$10$E4I8lp4oaHAwbvjG1H7UHuveBSCxtoz78OQVZFl8M9buVENkyOBRK',NULL,'rangarajan.ragavan@phicommerce.com','2017-11-23 09:53:14',0,0,1,1,1,NULL,NULL,0,1,'2017-11-06 16:02:16',NULL,NULL),(2,2,'Ramesh','$2a$10$PpNZW2fSxBPM/nHdb4Fvc.FKT1tI5a6Pc3Ok.9Y/NVhWfdQ4sASb6','9543301832','aryan.ragavan@gmail.com','2017-11-18 07:18:43',0,0,1,1,1,NULL,NULL,1,1,'2017-11-18 07:13:27',1,'2017-11-18 07:25:40'),(5,2,'Rajesh','$2a$10$zjIJBz/kbcgtu47ssvff1.nK/fXlUfbPu4KACuO57H14gWc.prVCq','9543301832','jofin.francis@phicommerce.com',NULL,0,0,0,0,0,'e12051bd1231bd8fa3eabce8d07198bb4eb193494358ebbfce82b54b2423f2b3f7e694d03065f90519d646ba248860929427739c8d29f3292c6b460d5780511d',NULL,0,1,'2017-11-18 07:29:38',1,'2017-11-18 07:29:38'),(6,2,'subhash','$2a$10$t4wWOf5fmUfFE0XUaPf9bOAeO0IvdYr/MhViaEjlcumPbTz0YTV/a','9543301832','schooltest89@gmail.com','2017-11-20 06:32:46',0,0,1,1,0,NULL,NULL,0,1,'2017-11-18 07:41:12',1,'2017-11-20 13:43:52'),(7,3,'Pramita','$2a$10$sDuZNbyDKfnnyjr7xesv8.0KkQ5XdYCKa4S65u6LGOUCEAMeee7ZW','9543301832','pramita.sharma@phicommerce.com','2017-11-18 09:47:06',0,0,1,1,1,NULL,NULL,0,6,'2017-11-18 08:34:57',6,'2017-11-18 08:38:38'),(8,3,'Invictus','$2a$10$jxblGvb5BKQgb6SppSWToeysdZbdzqWhDfTCzs/9dZ2UZZqjOJprm','9543301832','invictus.raghu@gmail.com','2017-11-18 09:58:47',3,1,1,1,1,NULL,NULL,0,6,'2017-11-18 08:54:53',8,'2017-11-18 09:44:55'),(9,2,'SchoolTest3','$2a$10$Ag9aP79X3u2IkQGS5qPDduPnlglnISG4JbfHlo.APYesgrepj8LbW','9543301832','schooltest90@gmail.com','2017-11-20 07:37:34',0,0,1,1,0,NULL,NULL,1,1,'2017-11-20 07:36:27',1,'2017-11-20 10:05:38'),(10,2,'Test88','$2a$10$e6.rSSLqu8dKnWGAmuvvt.Jgv4vReenVxwwwQD8idqD59LbBJdEDG','9543301832','schooltest90@gmail.com','2017-11-20 10:08:59',0,0,1,1,0,NULL,NULL,1,1,'2017-11-20 10:07:02',1,'2017-11-20 10:14:13'),(11,2,'Tschool','$2a$10$WGnRgI6R0Am/91toFR9dPeiBrll2U4bYLG2OiqGrKTBs1yE7XimGC','9543301832','schooltest88@gmail.com','2017-11-20 10:18:31',0,0,1,1,0,'73763b70725a95080bcdbab89e3b4900eca86315a389533675762a5403b4fb52491522e4c8cd960d83903228cb87f8abe7d5eb7a2e7c5e9937ca573b453d6c8b',NULL,0,1,'2017-11-20 10:15:46',1,'2017-11-20 14:34:16'),(12,1,'Admin1','$2a$10$cwz..KYGoAd4VJNQmgMzMuJrAccakVXMVVC7LJabcWuNzq/HpP4D2','9543301832','schooltest90@gmail.com','2017-11-23 05:34:51',0,0,1,1,1,NULL,NULL,0,1,'2017-11-20 10:30:18',1,'2017-11-20 10:30:18'),(13,2,'barkha.s','$2a$10$G6IkfhpD0H4bljEfFBAUT.cTDz5KB2mVMquzOluxRVo3pGOxL2W1i','7894561232','aryan.ragavan@gmail.com','2017-11-23 07:37:15',0,0,1,1,1,NULL,NULL,0,1,'2017-11-20 13:44:20',12,'2017-11-23 05:35:17'),(14,1,'Admin2','$2a$10$VIbrLXmalmovO5bqInFSbulN5YR.LrEsssCt4SLX12vrQO.CXpFgC','9543301832','schooltest91@gmail.com','2017-11-21 10:01:42',0,0,1,1,1,NULL,NULL,0,12,'2017-11-21 09:12:39',12,'2017-11-21 09:12:39'),(15,8,'Leena','$2a$10$4ANagcHYaYC2EPYikq7wE.FE9x/gkqegYdCiAY47gwYrb3zHypraW','','leena.gulanikar@phicommerce.com',NULL,1,0,1,0,1,NULL,NULL,0,13,'2017-11-22 15:51:46',13,'2017-11-22 15:51:46'),(16,9,'Tara','$2a$10$DmawlYdJywhpk4w9O.B4xeh464Oj.7M0wKExxYQzv29nen85.YgIC','','tg@gmail.com',NULL,0,0,0,0,0,'88fcb8e14a6d21e38974fef048cde3ae9cda49b114b0b6b5def934a5b0f680ef2da450189615e1e176cbb53666e7f4aaf75c5bd16e884f0c1770bb7d90eb0f6a',NULL,0,13,'2017-11-22 15:56:24',13,'2017-11-23 05:37:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userschooldetails`
--

LOCK TABLES `userschooldetails` WRITE;
/*!40000 ALTER TABLE `userschooldetails` DISABLE KEYS */;
INSERT INTO `userschooldetails` VALUES (1,1,1,1,'2017-11-18 07:07:54',NULL,NULL),(2,2,1,1,'2017-11-18 07:13:27',NULL,NULL),(3,5,1,1,'2017-11-18 07:29:38',NULL,NULL),(9,7,1,6,'2017-11-18 08:38:38',NULL,NULL),(11,8,1,6,'2017-11-18 08:54:53',NULL,NULL),(15,9,1,1,'2017-11-20 09:25:59',NULL,NULL),(17,10,1,10,'2017-11-20 10:13:11',NULL,NULL),(19,12,1,1,'2017-11-20 10:30:18',NULL,NULL),(22,6,1,1,'2017-11-20 13:43:52',NULL,NULL),(24,1,2,1,'2017-11-20 13:47:14',NULL,NULL),(39,11,1,1,'2017-11-20 14:34:16',NULL,NULL),(44,1,3,1,'2017-11-21 07:43:45',NULL,NULL),(48,14,1,12,'2017-11-21 09:12:39',NULL,NULL),(49,14,2,12,'2017-11-21 09:12:39',NULL,NULL),(50,14,3,12,'2017-11-21 09:12:39',NULL,NULL),(51,12,4,12,'2017-11-22 14:49:10',NULL,NULL),(52,15,1,13,'2017-11-22 15:51:46',NULL,NULL),(57,13,1,12,'2017-11-23 05:35:17',NULL,NULL),(58,13,2,12,'2017-11-23 05:35:17',NULL,NULL),(59,13,3,12,'2017-11-23 05:35:17',NULL,NULL),(60,16,1,13,'2017-11-23 05:37:57',NULL,NULL);
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
  `zoneCost` decimal(9,2) NOT NULL,
  `academicYear` varchar(20) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonedetails`
--

DROP TABLE IF EXISTS `zonedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonedetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `schoolId` bigint(20) NOT NULL,
  `zoneId` bigint(20) NOT NULL,
  `dueDate` date NOT NULL,
  `academicYear` varchar(20) NOT NULL,
  `sequenceNumber` int(2) NOT NULL,
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ZoneDetails_Zone_idx` (`zoneId`),
  KEY `FK_ZoneDetails_School_idx` (`schoolId`),
  CONSTRAINT `FK_ZoneDetails_School` FOREIGN KEY (`schoolId`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ZoneDetails_Zone` FOREIGN KEY (`zoneId`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonedetails`
--

LOCK TABLES `zonedetails` WRITE;
/*!40000 ALTER TABLE `zonedetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'feemgmt'
--

--
-- Dumping routines for database 'feemgmt'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-30 18:39:30
