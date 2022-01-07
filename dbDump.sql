-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.57-MariaDB

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
-- Temporary view structure for view `card_penalty`
--

DROP TABLE IF EXISTS `card_penalty`;
/*!50001 DROP VIEW IF EXISTS `card_penalty`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `card_penalty` AS SELECT 
 1 AS `name`,
 1 AS `player_ID`,
 1 AS `year`,
 1 AS `time_issued`,
 1 AS `color`,
 1 AS `match_ID`,
 1 AS `home_team`,
 1 AS `away_team`,
 1 AS `country`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cup`
--

DROP TABLE IF EXISTS `cup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cup` (
  `year` int(10) unsigned NOT NULL,
  `host` varchar(35) NOT NULL,
  `num_of_countries` int(10) unsigned NOT NULL,
  PRIMARY KEY (`year`),
  UNIQUE KEY `year_UNIQUE` (`year`),
  KEY `idx_cup_year` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cup`
--

LOCK TABLES `cup` WRITE;
/*!40000 ALTER TABLE `cup` DISABLE KEYS */;
INSERT INTO `cup` VALUES (1958,'Sweden',16),(1994,'United States',24),(1998,'France',32),(2002,'Korea',32),(2010,'South Africa',32),(2014,'Brazil',32),(2018,'Russia',32);
/*!40000 ALTER TABLE `cup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goals_scored`
--

DROP TABLE IF EXISTS `goals_scored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goals_scored` (
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `time_scored` time NOT NULL,
  PRIMARY KEY (`player_id`,`match_id`,`time_scored`),
  KEY `match_ID_idx` (`match_id`),
  CONSTRAINT `match_id1` FOREIGN KEY (`match_id`) REFERENCES `match` (`match_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `player_id1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals_scored`
--

LOCK TABLES `goals_scored` WRITE;
/*!40000 ALTER TABLE `goals_scored` DISABLE KEYS */;
INSERT INTO `goals_scored` VALUES (1805,6410,'15:45:00'),(1807,6418,'00:00:38'),(1808,6410,'00:00:55'),(1808,6418,'00:00:59'),(1809,6418,'35:15:00');
/*!40000 ALTER TABLE `goals_scored` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `hall of fame`
--

DROP TABLE IF EXISTS `hall of fame`;
/*!50001 DROP VIEW IF EXISTS `hall of fame`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `hall of fame` AS SELECT 
 1 AS `winner`,
 1 AS `year`,
 1 AS `coach`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match` (
  `match_ID` int(11) NOT NULL,
  `place` varchar(35) DEFAULT NULL,
  `home_team` varchar(35) DEFAULT NULL,
  `away_team` varchar(35) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `phase` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`match_ID`),
  UNIQUE KEY `match_ID_UNIQUE` (`match_ID`),
  KEY `place_idx` (`place`),
  KEY `home_team_idx` (`home_team`),
  KEY `away_team_idx` (`away_team`),
  KEY `idx_match_date` (`date`),
  CONSTRAINT `away_team` FOREIGN KEY (`away_team`) REFERENCES `team` (`country`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `home_team` FOREIGN KEY (`home_team`) REFERENCES `team` (`country`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `place` FOREIGN KEY (`place`) REFERENCES `stadium` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
INSERT INTO `match` VALUES (110,'FNB Stadium','South Africa','Mexico','2010-06-11','Group stage'),(518,'Luzhniki Stadium','Croatia','England','2018-08-11','Semi-finals'),(6318,'Krestovsky Stadium','Belgium','England','2018-07-14','Third place play-off'),(6410,'FNB Stadium','Netherlands','Spain','2010-08-11','Final'),(6418,'Luzhniki Stadium','France','Croatia','2018-08-12','Final');
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_has_referee`
--

DROP TABLE IF EXISTS `match_has_referee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_has_referee` (
  `referee_ID` int(11) NOT NULL,
  `match_ID` int(11) NOT NULL,
  PRIMARY KEY (`referee_ID`,`match_ID`),
  KEY `match_id_idx` (`match_ID`),
  CONSTRAINT `match_id` FOREIGN KEY (`match_ID`) REFERENCES `match` (`match_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `referee_id` FOREIGN KEY (`referee_ID`) REFERENCES `referee` (`referee_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_has_referee`
--

LOCK TABLES `match_has_referee` WRITE;
/*!40000 ALTER TABLE `match_has_referee` DISABLE KEYS */;
INSERT INTO `match_has_referee` VALUES (1,6418),(2,6418),(3,6418),(15,6418),(35,6418);
/*!40000 ALTER TABLE `match_has_referee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalties`
--

DROP TABLE IF EXISTS `penalties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penalties` (
  `player_ID` int(11) NOT NULL,
  `match_ID` int(11) NOT NULL,
  `time_issued` time NOT NULL,
  `type` enum('Foul','Off-side','Out','Corner') DEFAULT NULL,
  `color` enum('Red','Yellow') DEFAULT NULL,
  PRIMARY KEY (`player_ID`,`match_ID`),
  KEY `match_ID_idx` (`match_ID`),
  CONSTRAINT `match_ID2` FOREIGN KEY (`match_ID`) REFERENCES `match` (`match_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `player_ID2` FOREIGN KEY (`player_ID`) REFERENCES `player` (`player_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalties`
--

LOCK TABLES `penalties` WRITE;
/*!40000 ALTER TABLE `penalties` DISABLE KEYS */;
INSERT INTO `penalties` VALUES (1801,6410,'00:15:09','Foul',NULL),(1802,6418,'00:03:48','Off-side',NULL),(1803,6418,'29:00:00','Foul','Yellow'),(1807,6418,'15:00:00','Corner',NULL),(1809,6418,'00:45:15','Foul','Red');
/*!40000 ALTER TABLE `penalties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `player_ID` int(11) NOT NULL,
  `name` varchar(35) NOT NULL,
  `position` char(2) NOT NULL,
  `age` int(10) unsigned NOT NULL,
  PRIMARY KEY (`player_ID`),
  UNIQUE KEY `player_ID_UNIQUE` (`player_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1801,'Hugo Lloris','GK',31),(1802,'Benjamin Pavard','DF',22),(1803,'Presnel Kimpembe','DF',22),(1805,'Samuel Umtiti','DF',24),(1807,'Antoine Griezmann','FW',27),(1808,'Paul Pogba','MF',25),(1809,'Kylian Mbappe','FW',19);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referee`
--

DROP TABLE IF EXISTS `referee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referee` (
  `referee_ID` int(11) NOT NULL,
  `ref_name` varchar(35) NOT NULL,
  `ethnicity` varchar(35) NOT NULL,
  `role` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`referee_ID`),
  UNIQUE KEY `referee_ID_UNIQUE` (`referee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referee`
--

LOCK TABLES `referee` WRITE;
/*!40000 ALTER TABLE `referee` DISABLE KEYS */;
INSERT INTO `referee` VALUES (1,'Pitana Nestor','Argentina','Referee'),(2,'Maidana Hernan','Argentina','Assistant Referee 1'),(3,'Belatti Juan Pablo','Argentina','Assistant Referee 2'),(15,'Kuipers Bjorn','Netherlands','Fourth official'),(35,'Irrati Massimiliano','Italy','Video Assistant Referee');
/*!40000 ALTER TABLE `referee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `scorer`
--

DROP TABLE IF EXISTS `scorer`;
/*!50001 DROP VIEW IF EXISTS `scorer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `scorer` AS SELECT 
 1 AS `name`,
 1 AS `player_ID`,
 1 AS `year`,
 1 AS `country`,
 1 AS `match_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stadium` (
  `name` varchar(35) NOT NULL,
  `st_country` varchar(35) NOT NULL,
  `st_city` varchar(35) NOT NULL,
  `capacity` int(10) unsigned NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
INSERT INTO `stadium` VALUES ('Ellis Park Stadium','South Africa','Johannesburg',55686),('Estadio do Maracana','Brazil','Rio de Janeiro',74738),('FNB Stadium','South Africa','Somewhere',50000),('Krestovsky Stadium','Russia','Saint Petersburg',64468),('Luzhniki Stadium','Russia','Moscow',78011),('Stade Velodrome','France','Marseille',48875);
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `country` varchar(35) NOT NULL,
  `year` int(10) unsigned NOT NULL,
  `leaderboard_pos` int(10) unsigned DEFAULT NULL,
  `coach` varchar(35) NOT NULL,
  PRIMARY KEY (`country`,`year`),
  KEY `year_idx` (`year`),
  KEY `idx_team_year` (`year`),
  KEY `idx_team_leaderboard_pos` (`leaderboard_pos`),
  CONSTRAINT `year` FOREIGN KEY (`year`) REFERENCES `cup` (`year`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('Argentina',2014,2,'Alejandro Sabella'),('Belgium',2018,3,'Roberto Martinez'),('Brazil',2002,1,'Someone'),('Brazil',2014,4,'Luiz Felipe Scolari'),('Croatia',2018,2,'Zlatko Dalic'),('England',2018,4,'Gareth Southgate'),('France',2018,1,'Didier Deschamps'),('Mexico',2010,8,'John John'),('Netherlands',2010,2,'Mike Mike'),('South Africa',2010,15,'Tite'),('Spain',2010,1,'Jorge john ');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_has_player`
--

DROP TABLE IF EXISTS `team_has_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_has_player` (
  `player_ID` int(11) NOT NULL,
  `country` varchar(35) NOT NULL,
  `year` int(10) unsigned NOT NULL,
  PRIMARY KEY (`player_ID`),
  KEY `country_idx` (`country`,`year`),
  CONSTRAINT `country , year` FOREIGN KEY (`country`, `year`) REFERENCES `team` (`country`, `year`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `player_ID` FOREIGN KEY (`player_ID`) REFERENCES `player` (`player_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_has_player`
--

LOCK TABLES `team_has_player` WRITE;
/*!40000 ALTER TABLE `team_has_player` DISABLE KEYS */;
INSERT INTO `team_has_player` VALUES (1801,'France',2018),(1802,'France',2018),(1803,'France',2018),(1807,'France',2018),(1808,'France',2018),(1809,'France',2018);
/*!40000 ALTER TABLE `team_has_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `card_penalty`
--

/*!50001 DROP VIEW IF EXISTS `card_penalty`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `card_penalty` AS select `player`.`name` AS `name`,`player`.`player_ID` AS `player_ID`,`team_has_player`.`year` AS `year`,`penalties`.`time_issued` AS `time_issued`,`penalties`.`color` AS `color`,`penalties`.`match_ID` AS `match_ID`,`match`.`home_team` AS `home_team`,`match`.`away_team` AS `away_team`,`team_has_player`.`country` AS `country` from (((`penalties` join `player` on((`player`.`player_ID` = `penalties`.`player_ID`))) join `team_has_player` on((`team_has_player`.`player_ID` = `player`.`player_ID`))) join `match` on((`match`.`match_ID` = `penalties`.`match_ID`))) where ((`penalties`.`color` = 'Red') or (`penalties`.`color` = 'Yellow')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `hall of fame`
--

/*!50001 DROP VIEW IF EXISTS `hall of fame`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hall of fame` AS select `team`.`country` AS `winner`,`team`.`year` AS `year`,`team`.`coach` AS `coach` from `team` where (`team`.`leaderboard_pos` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `scorer`
--

/*!50001 DROP VIEW IF EXISTS `scorer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `scorer` AS select `player`.`name` AS `name`,`player`.`player_ID` AS `player_ID`,`team_has_player`.`year` AS `year`,`team_has_player`.`country` AS `country`,`goals_scored`.`match_id` AS `match_ID` from ((`goals_scored` join `player` on((`player`.`player_ID` = `goals_scored`.`player_id`))) join `team_has_player` on((`team_has_player`.`player_ID` = `player`.`player_ID`))) */;
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

-- Dump completed on 2018-12-21 23:43:07
