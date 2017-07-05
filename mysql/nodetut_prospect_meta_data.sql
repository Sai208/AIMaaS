-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: nodetut
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `prospect_meta_data`
--

DROP TABLE IF EXISTS `prospect_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_meta_data` (
  `Prospect_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Prospect_Name` varchar(255) NOT NULL,
  `Version` varchar(25) NOT NULL,
  `Industry` varchar(255) NOT NULL,
  PRIMARY KEY (`Prospect_ID`),
  KEY `fk_accountType_idx` (`Version`),
  KEY `fk_industryType_idx` (`Industry`),
  CONSTRAINT `fk_accountType` FOREIGN KEY (`Version`) REFERENCES `accounttypes` (`type`),
  CONSTRAINT `fk_industryType` FOREIGN KEY (`Industry`) REFERENCES `industrytype` (`industry`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_meta_data`
--

LOCK TABLES `prospect_meta_data` WRITE;
/*!40000 ALTER TABLE `prospect_meta_data` DISABLE KEYS */;
INSERT INTO `prospect_meta_data` VALUES (1,'Pepsi','Advanced','Consumer Staples'),(2,'Coca-Cola','Advanced','Consumer Staples'),(3,'Asian Paints','Limited','Materials');
/*!40000 ALTER TABLE `prospect_meta_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-05 22:17:35
