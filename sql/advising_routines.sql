CREATE DATABASE  IF NOT EXISTS `advising` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `advising`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: advising
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Temporary view structure for view `apptfw`
--

DROP TABLE IF EXISTS `apptfw`;
/*!50001 DROP VIEW IF EXISTS `apptfw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `apptfw` AS SELECT 
 1 AS `ApptID`,
 1 AS `ApptDate`,
 1 AS `ApptStartHour`,
 1 AS `ApptStartMin`,
 1 AS `ApptEndHour`,
 1 AS `ApptEndMin`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `availslot`
--

DROP TABLE IF EXISTS `availslot`;
/*!50001 DROP VIEW IF EXISTS `availslot`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `availslot` AS SELECT 
 1 AS `SlotID`,
 1 AS `SlotDate`,
 1 AS `SlotStartHour`,
 1 AS `SlotStartMin`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `apptslot`
--

DROP TABLE IF EXISTS `apptslot`;
/*!50001 DROP VIEW IF EXISTS `apptslot`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `apptslot` AS SELECT 
 1 AS `SlotID`,
 1 AS `SlotDate`,
 1 AS `SlotStartHour`,
 1 AS `SlotStartMin`,
 1 AS `ApptID`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `apptfw`
--

/*!50001 DROP VIEW IF EXISTS `apptfw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `apptfw` AS select `appointment`.`ApptID` AS `ApptID`,`appointment`.`ApptDate` AS `ApptDate`,`appointment`.`ApptStartHour` AS `ApptStartHour`,`appointment`.`ApptStartMin` AS `ApptStartMin`,`appointment`.`ApptEndHour` AS `ApptEndHour`,`appointment`.`ApptEndMin` AS `ApptEndMin` from `appointment` order by `appointment`.`ApptDate` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `availslot`
--

/*!50001 DROP VIEW IF EXISTS `availslot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `availslot` AS select `slot`.`SlotID` AS `SlotID`,`slot`.`SlotDate` AS `SlotDate`,`slot`.`SlotStartHour` AS `SlotStartHour`,`slot`.`SlotStartMin` AS `SlotStartMin` from `slot` where (not(`slot`.`SlotID` in (select `apptslot`.`SlotID` from `apptslot`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `apptslot`
--

/*!50001 DROP VIEW IF EXISTS `apptslot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `apptslot` AS select `slot`.`SlotID` AS `SlotID`,`slot`.`SlotDate` AS `SlotDate`,`slot`.`SlotStartHour` AS `SlotStartHour`,`slot`.`SlotStartMin` AS `SlotStartMin`,`apptfw`.`ApptID` AS `ApptID` from (`slot` join `apptfw`) where (((`slot`.`SlotDate` = `apptfw`.`ApptDate`) and (`slot`.`SlotStartHour` <> `apptfw`.`ApptEndHour`) and (`slot`.`SlotStartHour` = `apptfw`.`ApptStartHour`) and (`slot`.`SlotStartMin` >= `apptfw`.`ApptStartMin`)) or ((`slot`.`SlotDate` = `apptfw`.`ApptDate`) and (`slot`.`SlotStartHour` > `apptfw`.`ApptStartHour`) and (`slot`.`SlotStartHour` < `apptfw`.`ApptEndHour`)) or ((`slot`.`SlotDate` = `apptfw`.`ApptDate`) and (`slot`.`SlotStartHour` <> `apptfw`.`ApptStartHour`) and (`slot`.`SlotStartHour` = `apptfw`.`ApptEndHour`) and (`slot`.`SlotStartMin` < `apptfw`.`ApptEndMin`)) or ((`slot`.`SlotDate` = `apptfw`.`ApptDate`) and (`slot`.`SlotStartHour` = `apptfw`.`ApptStartHour`) and (`slot`.`SlotStartHour` = `apptfw`.`ApptEndHour`) and (`slot`.`SlotStartMin` >= `apptfw`.`ApptStartMin`) and (`slot`.`SlotStartMin` < `apptfw`.`ApptEndMin`))) */;
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

-- Dump completed on 2016-03-08 15:38:52
