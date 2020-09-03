CREATE DATABASE  IF NOT EXISTS `sportradar` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sportradar`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: sportradar
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.13-MariaDB-1:10.4.13+maria~focal

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Football','2020-09-03 09:27:24','2020-09-03 09:27:24'),(2,'Basketball','2020-09-03 09:27:24','2020-09-03 09:27:24'),(3,'Ice Hockey','2020-09-03 09:27:24','2020-09-03 09:27:24');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `event_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `home_team_id` int(10) unsigned NOT NULL,
  `visitors_team_id` int(10) unsigned NOT NULL,
  `start_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `_fk--events-category_id--category-category_id` (`category_id`),
  KEY `_fk--events-home_team_id--teams-team_id` (`home_team_id`),
  KEY `_fk--events-visitors_team_id--teams-team_id` (`visitors_team_id`),
  CONSTRAINT `_fk--events-category_id--category-category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `_fk--events-home_team_id--teams-team_id` FOREIGN KEY (`home_team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE,
  CONSTRAINT `_fk--events-visitors_team_id--teams-team_id` FOREIGN KEY (`visitors_team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,2,9,8,'2020-09-09 23:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(2,1,10,11,'2020-09-06 11:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(3,1,10,4,'2020-09-05 04:45:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(4,1,4,11,'2020-09-07 08:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(5,2,9,7,'2020-09-10 14:00:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(6,2,1,8,'2020-09-10 11:00:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(7,2,8,9,'2020-09-04 13:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(8,1,11,4,'2020-09-05 04:30:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(9,3,3,12,'2020-09-08 17:45:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(10,2,7,8,'2020-09-10 00:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(11,3,5,3,'2020-09-09 20:00:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(12,2,8,1,'2020-09-04 21:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(13,3,6,5,'2020-09-03 23:45:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(14,3,3,6,'2020-09-04 01:30:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(15,3,6,5,'2020-09-09 22:00:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(16,1,4,11,'2020-09-07 21:00:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(17,2,7,9,'2020-09-03 03:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(18,3,12,5,'2020-09-04 10:30:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(19,2,8,7,'2020-09-06 22:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(20,1,10,11,'2020-09-05 04:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(21,3,12,6,'2020-09-03 22:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(22,2,7,8,'2020-09-03 11:30:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(23,1,10,4,'2020-09-08 01:45:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(24,3,3,6,'2020-09-05 18:45:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(25,1,2,10,'2020-09-05 03:30:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(26,2,8,1,'2020-09-06 04:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(27,2,7,9,'2020-09-03 16:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(28,3,5,3,'2020-09-04 07:45:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(29,1,4,10,'2020-09-06 22:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(30,3,6,5,'2020-09-10 15:30:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(31,3,6,5,'2020-09-05 04:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(32,2,8,1,'2020-09-10 11:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(33,1,10,2,'2020-09-08 06:00:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(34,1,10,2,'2020-09-05 21:30:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(35,2,9,7,'2020-09-06 23:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(36,1,11,10,'2020-09-04 12:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(37,2,7,1,'2020-09-07 05:30:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(38,2,7,1,'2020-09-04 17:45:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(39,2,1,9,'2020-09-06 06:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(40,1,2,10,'2020-09-10 11:00:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(41,2,1,7,'2020-09-07 23:00:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(42,2,8,1,'2020-09-07 15:30:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(43,2,8,9,'2020-09-03 00:45:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(44,1,4,11,'2020-09-05 19:45:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(45,3,12,3,'2020-09-03 05:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(46,1,4,2,'2020-09-03 07:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(47,2,9,7,'2020-09-10 17:45:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(48,1,4,2,'2020-09-09 02:15:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(49,1,11,2,'2020-09-04 03:45:00','2020-09-03 09:27:24','2020-09-03 09:27:24'),(50,2,7,8,'2020-09-06 06:00:00','2020-09-03 09:27:24','2020-09-03 09:27:24');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (16,'2020_09_03_080912_create_categories_table',1),(17,'2020_09_03_081253_create_teams_table',1),(18,'2020_09_03_081456_create_events_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `team_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  KEY `_fk--teams-category_id--category-category_id` (`category_id`),
  CONSTRAINT `_fk--teams-category_id--category-category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Real Madrid',2,'2020-09-03 09:27:24','2020-09-03 09:27:24'),(2,'FC Barcelona',1,'2020-09-03 09:27:24','2020-09-03 09:27:24'),(3,'Manchester United',3,'2020-09-03 09:27:24','2020-09-03 09:27:24'),(4,'Arsenal',1,'2020-09-03 09:27:24','2020-09-03 09:27:24'),(5,'FC Rapid',3,'2020-09-03 09:27:24','2020-09-03 09:27:24'),(6,'FC Salzburg',3,'2020-09-03 09:27:24','2020-09-03 09:27:24'),(7,'Bayern Munich',2,'2020-09-03 09:27:24','2020-09-03 09:27:24'),(8,'Borussia Dortmund',2,'2020-09-03 09:27:24','2020-09-03 09:27:24'),(9,'Liverpool',2,'2020-09-03 09:27:24','2020-09-03 09:27:24'),(10,'AC Milan',1,'2020-09-03 09:27:24','2020-09-03 09:27:24'),(11,'Inter',1,'2020-09-03 09:27:24','2020-09-03 09:27:24'),(12,'Lazio',3,'2020-09-03 09:27:24','2020-09-03 09:27:24');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-03 14:26:25
