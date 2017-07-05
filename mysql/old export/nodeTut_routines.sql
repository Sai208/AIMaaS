-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: nodeTut
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
-- Temporary table structure for view `supplierSummary`
--

DROP TABLE IF EXISTS `supplierSummary`;
/*!50001 DROP VIEW IF EXISTS `supplierSummary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `supplierSummary` AS SELECT 
 1 AS `name`,
 1 AS `count(psm.prospectId)`,
 1 AS `sum(spendAmount)`,
 1 AS `sum(poCount)`,
 1 AS `sum(invoiceCount)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `prospectSummary`
--

DROP TABLE IF EXISTS `prospectSummary`;
/*!50001 DROP VIEW IF EXISTS `prospectSummary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `prospectSummary` AS SELECT 
 1 AS `name`,
 1 AS `count(psm.supplierId)`,
 1 AS `sum(psm.spendAmount)`,
 1 AS `sum(psm.poCount)`,
 1 AS `sum(psm.invoiceCount)`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `supplierSummary`
--

/*!50001 DROP VIEW IF EXISTS `supplierSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `supplierSummary` AS select `s`.`name` AS `name`,count(`psm`.`prospectId`) AS `count(psm.prospectId)`,sum(`psm`.`spendAmount`) AS `sum(spendAmount)`,sum(`psm`.`poCount`) AS `sum(poCount)`,sum(`psm`.`invoiceCount`) AS `sum(invoiceCount)` from (`supplier` `s` join `prospectSupplierMatch` `psm`) where (`s`.`supplierId` = `psm`.`supplierId`) group by `psm`.`supplierId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prospectSummary`
--

/*!50001 DROP VIEW IF EXISTS `prospectSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prospectSummary` AS select `p`.`name` AS `name`,count(`psm`.`supplierId`) AS `count(psm.supplierId)`,sum(`psm`.`spendAmount`) AS `sum(psm.spendAmount)`,sum(`psm`.`poCount`) AS `sum(psm.poCount)`,sum(`psm`.`invoiceCount`) AS `sum(psm.invoiceCount)` from (`prospects` `p` join `prospectSupplierMatch` `psm`) where (`p`.`prospectId` = `psm`.`prospectId`) group by `psm`.`prospectId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-30  0:02:07
