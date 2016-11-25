-- MySQL dump 10.16  Distrib 10.1.13-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: testdb2
-- ------------------------------------------------------
-- Server version	10.1.13-MariaDB

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `bid` char(5) NOT NULL,
  `title` varchar(60) DEFAULT NULL,
  `aid` char(6) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `pbid` char(5) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('b0003','DB構築','b20010',1980,'p2003'),('b0005','Linux入門','a10001',3500,'p3001');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `id` varchar(4) NOT NULL,
  `branchne` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('1','Tokyo'),('2','Yokohama'),('3','Osaka'),('4','Nagoya'),('5','saitama');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `itemId` char(5) NOT NULL,
  `itemName` varchar(50) NOT NULL,
  `itemPrice` int(10) NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `name_idx` (`itemName`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('s0001','液晶テレビ',158000),('s0002','冷蔵庫',138000),('s0003','オーブンレンジ',98000),('s0004','オーブントースター',5800),('s0005','液晶ディスプレイ',19800),('s0006','洗濯機',138000),('s0007','掃除機',79800),('s0008','電気カーペット',13800),('S0020','エアコン',50000),('S0023','ルンバ',150000),('S0024','一眼レフ',139800);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `name` varchar(20) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('Sato','Tokyo',23),('Suzuki','Tokyo',24),('Takahashi','Kanagawa',28),('Tanaka','Kanagawa',26),('Watanabe','Tokyo',30);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_staff`
--

DROP TABLE IF EXISTS `new_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` datetime DEFAULT CURRENT_TIMESTAMP,
  `pid` varchar(4) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `bid` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_staff`
--

LOCK TABLES `new_staff` WRITE;
/*!40000 ALTER TABLE `new_staff` DISABLE KEYS */;
INSERT INTO `new_staff` VALUES (46,'2016-08-23 15:48:33',NULL,'vale',37,'3'),(93,NULL,NULL,'marc',23,'1'),(99,NULL,NULL,'jorge',29,'2');
/*!40000 ALTER TABLE `new_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!50001 DROP VIEW IF EXISTS `order_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `order_detail` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `branchne` tinyint NOT NULL,
  `itemName` tinyint NOT NULL,
  `itemPrice` tinyint NOT NULL,
  `amount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_tbl`
--

DROP TABLE IF EXISTS `order_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_tbl` (
  `id` int(11) NOT NULL,
  `Pid` varchar(4) DEFAULT NULL,
  `iid` char(5) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tbl`
--

LOCK TABLES `order_tbl` WRITE;
/*!40000 ALTER TABLE `order_tbl` DISABLE KEYS */;
INSERT INTO `order_tbl` VALUES (1,'1','s0001',5),(2,'2','s0001',10),(3,'4','s0002',8),(4,'1','s0003',3),(5,'1','s0004',4),(6,'2','s0003',5),(7,'5','s0001',5),(8,'4','s0004',10),(9,'3','s0003',6),(10,'7','s0002',4),(20,'9','s0002',15);
/*!40000 ALTER TABLE `order_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_tbl1`
--

DROP TABLE IF EXISTS `order_tbl1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_tbl1` (
  `id` int(11) NOT NULL,
  `Pid` varchar(4) DEFAULT NULL,
  `iid` char(5) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tbl1`
--

LOCK TABLES `order_tbl1` WRITE;
/*!40000 ALTER TABLE `order_tbl1` DISABLE KEYS */;
INSERT INTO `order_tbl1` VALUES (1,'1','s0001',5),(2,'2','s0001',10),(3,'4','s0002',8),(4,'1','s0003',3),(5,'1','s0004',4),(6,'2','s0003',5),(7,'5','s0001',5),(8,'4','s0004',10),(9,'3','s0003',6),(10,'7','s0002',4);
/*!40000 ALTER TABLE `order_tbl1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_tbl2`
--

DROP TABLE IF EXISTS `order_tbl2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_tbl2` (
  `id` int(11) NOT NULL,
  `Pid` varchar(4) DEFAULT NULL,
  `iid` char(5) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tbl2`
--

LOCK TABLES `order_tbl2` WRITE;
/*!40000 ALTER TABLE `order_tbl2` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_tbl2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_tbl_back`
--

DROP TABLE IF EXISTS `order_tbl_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_tbl_back` (
  `id` int(11) NOT NULL,
  `Pid` varchar(4) DEFAULT NULL,
  `iid` char(5) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tbl_back`
--

LOCK TABLES `order_tbl_back` WRITE;
/*!40000 ALTER TABLE `order_tbl_back` DISABLE KEYS */;
INSERT INTO `order_tbl_back` VALUES (1,'1','s0001',5),(2,'2','s0001',10),(3,'4','s0002',8),(4,'1','s0003',3),(5,'1','s0004',4),(6,'2','s0003',5),(7,'5','s0001',5),(8,'4','s0004',10),(9,'3','s0003',6),(10,'7','s0002',4),(20,'9','s0002',15);
/*!40000 ALTER TABLE `order_tbl_back` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `over10`
--

DROP TABLE IF EXISTS `over10`;
/*!50001 DROP VIEW IF EXISTS `over10`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `over10` (
  `itemId` tinyint NOT NULL,
  `itemName` tinyint NOT NULL,
  `itemPrice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `over10v2`
--

DROP TABLE IF EXISTS `over10v2`;
/*!50001 DROP VIEW IF EXISTS `over10v2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `over10v2` (
  `itemId` tinyint NOT NULL,
  `itemName` tinyint NOT NULL,
  `itemPrice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `p_no` int(11) NOT NULL,
  `p_name` varchar(20) DEFAULT NULL,
  `pp_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`p_no`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (135,'INAGAKI',240),(184,'kusanagi',135),(235,'KATORI',240),(240,'KIMURA',NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saleday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bid` char(5) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`),
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (2,'2016-08-23 02:02:43','b0005',10);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff11`
--

DROP TABLE IF EXISTS `staff11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff11` (
  `id` smallint(4) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT '50',
  `bid` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff11`
--

LOCK TABLES `staff11` WRITE;
/*!40000 ALTER TABLE `staff11` DISABLE KEYS */;
INSERT INTO `staff11` VALUES (1,'Sato',24,'1'),(2,'Suzuki',24,'2'),(3,'Takahashi',28,'1'),(4,'Tanaka',26,'3'),(5,'Watanabe',30,'2'),(6,'xxxx',596,'1'),(7,'yyy',999,'1'),(9,'Kobayashi',NULL,NULL),(10,'ddd',140,'1'),(46,'vale',37,'3'),(93,'marc',23,'1'),(99,'jorge',29,'2');
/*!40000 ALTER TABLE `staff11` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp932 */ ;
/*!50003 SET character_set_results = cp932 */ ;
/*!50003 SET collation_connection  = cp932_japanese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`student`@`localhost`*/ /*!50003 trigger new_staff after insert on staff11
for each row
begin
insert into new_staff(id, name, age, bid) values (NEW.id, NEW.name, NEW.age, NEW.bid);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp932 */ ;
/*!50003 SET character_set_results = cp932 */ ;
/*!50003 SET collation_connection  = cp932_japanese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`student`@`localhost`*/ /*!50003 trigger staff_delete before delete on staff11
for each row
begin
insert into staff_del values(OLD.id, OLD.name, OLD.age, OLD.bid);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `staff2`
--

DROP TABLE IF EXISTS `staff2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff2` (
  `id` varchar(4) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `bid` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff2`
--

LOCK TABLES `staff2` WRITE;
/*!40000 ALTER TABLE `staff2` DISABLE KEYS */;
INSERT INTO `staff2` VALUES ('1','Ito',27,'2'),('2','Yamamoto',31,'1'),('3','nakamura',24,'4');
/*!40000 ALTER TABLE `staff2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_del`
--

DROP TABLE IF EXISTS `staff_del`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_del` (
  `id` smallint(4) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT '50',
  `bid` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_del`
--

LOCK TABLES `staff_del` WRITE;
/*!40000 ALTER TABLE `staff_del` DISABLE KEYS */;
INSERT INTO `staff_del` VALUES (20,'shitayama',25,'1');
/*!40000 ALTER TABLE `staff_del` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_item`
--

DROP TABLE IF EXISTS `v_item`;
/*!50001 DROP VIEW IF EXISTS `v_item`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_item` (
  `itemId` tinyint NOT NULL,
  `itemName` tinyint NOT NULL,
  `itemPrice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_staff_branch`
--

DROP TABLE IF EXISTS `v_staff_branch`;
/*!50001 DROP VIEW IF EXISTS `v_staff_branch`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_staff_branch` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `age` tinyint NOT NULL,
  `bid` tinyint NOT NULL,
  `branchid` tinyint NOT NULL,
  `branchne` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `order_detail`
--

/*!50001 DROP TABLE IF EXISTS `order_detail`*/;
/*!50001 DROP VIEW IF EXISTS `order_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp932 */;
/*!50001 SET character_set_results     = cp932 */;
/*!50001 SET collation_connection      = cp932_japanese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`student`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_detail` AS select `order_tbl`.`id` AS `id`,`staff11`.`name` AS `name`,`branch`.`branchne` AS `branchne`,`item`.`itemName` AS `itemName`,`item`.`itemPrice` AS `itemPrice`,`order_tbl`.`amount` AS `amount` from (((`order_tbl` join `staff11` on((`order_tbl`.`Pid` = `staff11`.`id`))) join `branch` on((`staff11`.`bid` = `branch`.`id`))) join `item` on((`order_tbl`.`iid` = `item`.`itemId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `over10`
--

/*!50001 DROP TABLE IF EXISTS `over10`*/;
/*!50001 DROP VIEW IF EXISTS `over10`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp932 */;
/*!50001 SET character_set_results     = cp932 */;
/*!50001 SET collation_connection      = cp932_japanese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`student`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `over10` AS select `item`.`itemId` AS `itemId`,`item`.`itemName` AS `itemName`,`item`.`itemPrice` AS `itemPrice` from `item` where (`item`.`itemPrice` >= 100000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `over10v2`
--

/*!50001 DROP TABLE IF EXISTS `over10v2`*/;
/*!50001 DROP VIEW IF EXISTS `over10v2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp932 */;
/*!50001 SET character_set_results     = cp932 */;
/*!50001 SET collation_connection      = cp932_japanese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`student`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `over10v2` AS select `item`.`itemId` AS `itemId`,`item`.`itemName` AS `itemName`,`item`.`itemPrice` AS `itemPrice` from `item` where (`item`.`itemPrice` >= 100000) */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_item`
--

/*!50001 DROP TABLE IF EXISTS `v_item`*/;
/*!50001 DROP VIEW IF EXISTS `v_item`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp932 */;
/*!50001 SET character_set_results     = cp932 */;
/*!50001 SET collation_connection      = cp932_japanese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`student`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_item` AS select `item`.`itemId` AS `itemId`,`item`.`itemName` AS `itemName`,`item`.`itemPrice` AS `itemPrice` from `item` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_staff_branch`
--

/*!50001 DROP TABLE IF EXISTS `v_staff_branch`*/;
/*!50001 DROP VIEW IF EXISTS `v_staff_branch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp932 */;
/*!50001 SET character_set_results     = cp932 */;
/*!50001 SET collation_connection      = cp932_japanese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`student`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_staff_branch` AS select `staff11`.`id` AS `id`,`staff11`.`name` AS `name`,`staff11`.`age` AS `age`,`staff11`.`bid` AS `bid`,`branch`.`id` AS `branchid`,`branch`.`branchne` AS `branchne` from (`staff11` join `branch` on((`staff11`.`bid` = `branch`.`id`))) */;
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

-- Dump completed on 2016-08-24  9:45:53
