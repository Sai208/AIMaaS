-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: nodetut
-- ------------------------------------------------------
-- Server version	5.6.37

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
-- Temporary view structure for view `important_supplier_match`
--

DROP TABLE IF EXISTS `important_supplier_match`;
/*!50001 DROP VIEW IF EXISTS `important_supplier_match`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `important_supplier_match` AS SELECT 
 1 AS `Nos`,
 1 AS `Match_Current_Status`,
 1 AS `Initial_Month`,
 1 AS `Initial_Year`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `small_supplier_match`
--

DROP TABLE IF EXISTS `small_supplier_match`;
/*!50001 DROP VIEW IF EXISTS `small_supplier_match`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `small_supplier_match` AS SELECT 
 1 AS `Nos`,
 1 AS `Match_Current_Status`,
 1 AS `Initial_Month`,
 1 AS `Initial_Year`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prospect_spend_summary`
--

DROP TABLE IF EXISTS `prospect_spend_summary`;
/*!50001 DROP VIEW IF EXISTS `prospect_spend_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `prospect_spend_summary` AS SELECT 
 1 AS `Prospect_ID`,
 1 AS `Enablement_Strategy`,
 1 AS `Spend`,
 1 AS `PO_Count`,
 1 AS `Invoice_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `supplier_priority_list`
--

DROP TABLE IF EXISTS `supplier_priority_list`;
/*!50001 DROP VIEW IF EXISTS `supplier_priority_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `supplier_priority_list` AS SELECT 
 1 AS `Supplier`,
 1 AS `Spend`,
 1 AS `PO`,
 1 AS `SMP`,
 1 AS `OnNetwork`,
 1 AS `NumberOfProspects`,
 1 AS `Enablement_Strategy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `suppliers_to_be_matched`
--

DROP TABLE IF EXISTS `suppliers_to_be_matched`;
/*!50001 DROP VIEW IF EXISTS `suppliers_to_be_matched`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `suppliers_to_be_matched` AS SELECT 
 1 AS `Nos`,
 1 AS `Match_Current_Status`,
 1 AS `Initial_Month`,
 1 AS `Initial_time_YYYY`,
 1 AS `Initial_Year`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `medium_supplier_match`
--

DROP TABLE IF EXISTS `medium_supplier_match`;
/*!50001 DROP VIEW IF EXISTS `medium_supplier_match`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `medium_supplier_match` AS SELECT 
 1 AS `Nos`,
 1 AS `Match_Current_Status`,
 1 AS `Initial_Month`,
 1 AS `Initial_Year`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `supplier_match`
--

DROP TABLE IF EXISTS `supplier_match`;
/*!50001 DROP VIEW IF EXISTS `supplier_match`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `supplier_match` AS SELECT 
 1 AS `Nos`,
 1 AS `Match_Current_Status`,
 1 AS `Initial_Month`,
 1 AS `Initial_Year`,
 1 AS `Enablement_Strategy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prospect_savings_aggregate`
--

DROP TABLE IF EXISTS `prospect_savings_aggregate`;
/*!50001 DROP VIEW IF EXISTS `prospect_savings_aggregate`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `prospect_savings_aggregate` AS SELECT 
 1 AS `Prospect_ID`,
 1 AS `Supplier_Compliance_Savings`,
 1 AS `Invoice_Error_Reductions_Savings`,
 1 AS `PO_Requisition_Transmission_Savings`,
 1 AS `Invoice_Receipt_Processing_Savings`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `important_supplier_match`
--

/*!50001 DROP VIEW IF EXISTS `important_supplier_match`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `important_supplier_match` AS select count(`unmatched_suppliers`.`Match_Current_Status`) AS `Nos`,`unmatched_suppliers`.`Match_Current_Status` AS `Match_Current_Status`,`unmatched_suppliers`.`Initial_time_MMM` AS `Initial_Month`,`unmatched_suppliers`.`Initial_time_YYYY` AS `Initial_Year` from `unmatched_suppliers` where (`unmatched_suppliers`.`Enablement_Strategy` = 'Important') group by `unmatched_suppliers`.`Initial_time_MMM`,`unmatched_suppliers`.`Initial_time_YYYY`,`unmatched_suppliers`.`Match_Current_Status` order by `Initial_Month`,`Initial_Year` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `small_supplier_match`
--

/*!50001 DROP VIEW IF EXISTS `small_supplier_match`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `small_supplier_match` AS select count(`unmatched_suppliers`.`Match_Current_Status`) AS `Nos`,`unmatched_suppliers`.`Match_Current_Status` AS `Match_Current_Status`,`unmatched_suppliers`.`Initial_time_MMM` AS `Initial_Month`,`unmatched_suppliers`.`Initial_time_YYYY` AS `Initial_Year` from `unmatched_suppliers` where (`unmatched_suppliers`.`Enablement_Strategy` = 'Small') group by `unmatched_suppliers`.`Initial_time_MMM`,`unmatched_suppliers`.`Initial_time_YYYY`,`unmatched_suppliers`.`Match_Current_Status` order by `Initial_Month`,`Initial_Year` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prospect_spend_summary`
--

/*!50001 DROP VIEW IF EXISTS `prospect_spend_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prospect_spend_summary` AS select `prospect_spend`.`Prospect_ID` AS `Prospect_ID`,`prospect_spend`.`Enablement_Strategy` AS `Enablement_Strategy`,sum(`prospect_spend`.`Spend_USD`) AS `Spend`,sum(`prospect_spend`.`PO_Count`) AS `PO_Count`,sum(`prospect_spend`.`Invoice_Count`) AS `Invoice_Count` from `prospect_spend` where (`prospect_spend`.`Enablement_Strategy` is not null) group by `prospect_spend`.`Prospect_ID`,`prospect_spend`.`Enablement_Strategy` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `supplier_priority_list`
--

/*!50001 DROP VIEW IF EXISTS `supplier_priority_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `supplier_priority_list` AS select `unmatched_suppliers`.`Prospect_Supplier_Name` AS `Supplier`,sum(`unmatched_suppliers`.`Spend_USD`) AS `Spend`,sum(`unmatched_suppliers`.`PO_Count`) AS `PO`,sum(`unmatched_suppliers`.`SMP_USD`) AS `SMP`,`unmatched_suppliers`.`Match_Current_Status` AS `OnNetwork`,count(`unmatched_suppliers`.`Prospect_ID`) AS `NumberOfProspects`,`unmatched_suppliers`.`Enablement_Strategy` AS `Enablement_Strategy` from `unmatched_suppliers` group by `unmatched_suppliers`.`Prospect_Supplier_Name` order by sum(`unmatched_suppliers`.`SMP_USD`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `suppliers_to_be_matched`
--

/*!50001 DROP VIEW IF EXISTS `suppliers_to_be_matched`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `suppliers_to_be_matched` AS select count(`unmatched_suppliers`.`Match_Current_Status`) AS `Nos`,`unmatched_suppliers`.`Match_Current_Status` AS `Match_Current_Status`,`unmatched_suppliers`.`Initial_time_MMM` AS `Initial_Month`,`unmatched_suppliers`.`Initial_time_YYYY` AS `Initial_time_YYYY`,`unmatched_suppliers`.`Enablement_Strategy` AS `Initial_Year` from `unmatched_suppliers` group by `unmatched_suppliers`.`Initial_time_MMM`,`unmatched_suppliers`.`Initial_time_YYYY`,`unmatched_suppliers`.`Match_Current_Status`,`unmatched_suppliers`.`Enablement_Strategy` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `medium_supplier_match`
--

/*!50001 DROP VIEW IF EXISTS `medium_supplier_match`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `medium_supplier_match` AS select count(`unmatched_suppliers`.`Match_Current_Status`) AS `Nos`,`unmatched_suppliers`.`Match_Current_Status` AS `Match_Current_Status`,`unmatched_suppliers`.`Initial_time_MMM` AS `Initial_Month`,`unmatched_suppliers`.`Initial_time_YYYY` AS `Initial_Year` from `unmatched_suppliers` where (`unmatched_suppliers`.`Enablement_Strategy` = 'Medium') group by `unmatched_suppliers`.`Initial_time_MMM`,`unmatched_suppliers`.`Initial_time_YYYY`,`unmatched_suppliers`.`Match_Current_Status` order by `Initial_Month`,`Initial_Year` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `supplier_match`
--

/*!50001 DROP VIEW IF EXISTS `supplier_match`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `supplier_match` AS select count(`unmatched_suppliers`.`Match_Current_Status`) AS `Nos`,`unmatched_suppliers`.`Match_Current_Status` AS `Match_Current_Status`,`unmatched_suppliers`.`Initial_time_MMM` AS `Initial_Month`,`unmatched_suppliers`.`Initial_time_YYYY` AS `Initial_Year`,`unmatched_suppliers`.`Enablement_Strategy` AS `Enablement_Strategy` from `unmatched_suppliers` group by `unmatched_suppliers`.`Initial_time_MMM`,`unmatched_suppliers`.`Initial_time_YYYY`,`unmatched_suppliers`.`Match_Current_Status`,`unmatched_suppliers`.`Enablement_Strategy` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prospect_savings_aggregate`
--

/*!50001 DROP VIEW IF EXISTS `prospect_savings_aggregate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prospect_savings_aggregate` AS select `prospect_savings`.`Prospect_ID` AS `Prospect_ID`,sum(`prospect_savings`.`Supplier_Compliance_Savings_USD`) AS `Supplier_Compliance_Savings`,sum(`prospect_savings`.`Invoice_Error_Reductions_Savings_USD`) AS `Invoice_Error_Reductions_Savings`,sum(`prospect_savings`.`PO_Requisition_Transmission_Savings_USD`) AS `PO_Requisition_Transmission_Savings`,sum(`prospect_savings`.`Invoice_Receipt_Processing_Savings_USD`) AS `Invoice_Receipt_Processing_Savings` from `prospect_savings` where ((`prospect_savings`.`Enablement_Strategy` = 'Important') or (`prospect_savings`.`Enablement_Strategy` = 'Quick Win')) group by `prospect_savings`.`Prospect_ID` */;
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

-- Dump completed on 2017-07-25 16:34:25
