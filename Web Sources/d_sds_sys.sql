CREATE DATABASE  IF NOT EXISTS `d_sds_sys` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `d_sds_sys`;
-- MySQL dump 10.13  Distrib 5.7.22, for Win64 (x86_64)
--
-- Host: localhost    Database: d_sds_sys
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `MENU_ID` varchar(100) NOT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_TITLE` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `INDEX_LEVEL` varchar(10) DEFAULT NULL,
  `MENU_ICON` varchar(200) DEFAULT NULL,
  `HREF` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `SYS` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('MNU_CONFIG','root','Parameter','040','fa-edit (alias)','pages/maintainNav.html','Monitor'),('MNU_CONN','root','Connectivity','050','fa-link','pages/connectivity.html','Monitor'),('MNU_DASH','root','Dashboard','020','fa-th-large','pages/dashboard.html','Monitor'),('MNU_HOME','root','Home','010','fa-home','pages/home.html','Monitor'),('MNU_MACC','root','Menu Access Control','030','fa-circle','pages/CONFIG_MENUACCS/SDS_GROUP.html','Config'),('MNU_MNU','root','Menu Configure','020','fa-circle','pages/CONFIG_MENU/SDS_MENU.html','Config'),('MNU_OV','root','Overview','030','fa-line-chart','pages/viewNav.html','Monitor'),('MNU_USR','root','User','010','fa-circle','pages/CONFIG_USER/SDS_USER.html','Config');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_group`
--

DROP TABLE IF EXISTS `menu_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_group` (
  `MENU_ID` varchar(100) DEFAULT NULL,
  `GROUP_ID` char(36) DEFAULT NULL,
  KEY `FK_MENU_ID` (`MENU_ID`),
  KEY `FK_MGROUP_ID` (`GROUP_ID`),
  CONSTRAINT `FK_MENU_ID` FOREIGN KEY (`MENU_ID`) REFERENCES `menu` (`MENU_ID`),
  CONSTRAINT `FK_MGROUP_ID` FOREIGN KEY (`GROUP_ID`) REFERENCES `u_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_group`
--

LOCK TABLES `menu_group` WRITE;
/*!40000 ALTER TABLE `menu_group` DISABLE KEYS */;
INSERT INTO `menu_group` VALUES ('MNU_MNU','8daec00e-8e12-4068-a10c-a2deb07831ae'),('MNU_MACC','8daec00e-8e12-4068-a10c-a2deb07831ae'),('MNU_USR','8daec00e-8e12-4068-a10c-a2deb07831ae');
/*!40000 ALTER TABLE `menu_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `no` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `course` varchar(45) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'A','XX',76),(2,'A','YY',82),(3,'B','XX',92),(4,'B','YY',46),(5,'C','XX',90),(6,'C','YY',92),(7,'C','ZZ',99);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_group`
--

DROP TABLE IF EXISTS `u_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_group` (
  `GROUP_ID` char(36) NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `DESCRIPTION` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_group`
--

LOCK TABLES `u_group` WRITE;
/*!40000 ALTER TABLE `u_group` DISABLE KEYS */;
INSERT INTO `u_group` VALUES ('11d15bf2-da63-4fa1-98fb-ce5a7fb97d71','Administrator','Admin'),('8daec00e-8e12-4068-a10c-a2deb07831ae','SDS','SDS User');
/*!40000 ALTER TABLE `u_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `USER_ID` char(36) DEFAULT NULL,
  `GROUP_ID` char(36) DEFAULT NULL,
  KEY `fk_GROUP_ID` (`GROUP_ID`),
  KEY `fk_USER_ID` (`USER_ID`),
  CONSTRAINT `fk_GROUP_ID` FOREIGN KEY (`GROUP_ID`) REFERENCES `u_group` (`GROUP_ID`),
  CONSTRAINT `fk_USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES ('95d7d273-d7d1-4f73-988b-2016b6000410','11d15bf2-da63-4fa1-98fb-ce5a7fb97d71'),('4ced7708-1038-11e9-8a0b-bc5ff4bcba18','8daec00e-8e12-4068-a10c-a2deb07831ae');
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `USER_ID` char(36) NOT NULL,
  `NAME` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `LOGIN_ID` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PASSWORD` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ACTIVE` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `LANGUAGE_ID` char(36) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('4ced7708-1038-11e9-8a0b-bc5ff4bcba18','MIKEL','SILMIKEL','6JfC1I9BF1zGpXKtZ828Kg==','Y',NULL),('95d7d273-d7d1-4f73-988b-2016b6000410','Administrator User','ADMIN','pnwzoMSnj7FBevnXJFrPzg==','Y',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-28  8:06:24
