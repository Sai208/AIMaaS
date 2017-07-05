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
-- Table structure for table `industry_meta_data`
--

DROP TABLE IF EXISTS `industry_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industry_meta_data` (
  `Prospect_Industry` varchar(1000) NOT NULL,
  `Critical_Industries` varchar(1000) DEFAULT NULL,
  `Supplier_Compliance_Multiplier` float(10,6) DEFAULT NULL,
  `Invoice_Error_Multiplier` float(10,6) DEFAULT NULL,
  `PO_Req_and_Trans_Multiplier` float(10,6) DEFAULT NULL,
  `Invoice_Receipt_Multiplier` float(10,6) DEFAULT NULL,
  PRIMARY KEY (`Prospect_Industry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry_meta_data`
--

LOCK TABLES `industry_meta_data` WRITE;
/*!40000 ALTER TABLE `industry_meta_data` DISABLE KEYS */;
INSERT INTO `industry_meta_data` VALUES ('Consumer Discretionary',NULL,0.079200,0.035000,0.000910,0.000170),('Consumer Staples','Food and Staples Retailing, Food Products, Distributors',0.079200,0.035000,0.000910,0.000170),('Financials',NULL,0.079200,0.035000,0.000910,0.000170),('Healthcare','Chemicals,Containers and Packaging,Pharmaceuticals',0.079200,0.035000,0.000910,0.000170),('Industrials',NULL,0.079200,0.035000,0.000910,0.000170),('Information Technology',NULL,0.079200,0.035000,0.000910,0.000170),('Materials','Communications Equipment, Construction Materials, Building Products',0.079200,0.035000,0.000910,0.000170),('Real Estate',NULL,0.079200,0.035000,0.000910,0.000170),('Telecommunication Services',NULL,0.079200,0.035000,0.000910,0.000170),('Utilities',NULL,0.079200,0.035000,0.000910,0.000170);
/*!40000 ALTER TABLE `industry_meta_data` ENABLE KEYS */;
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
