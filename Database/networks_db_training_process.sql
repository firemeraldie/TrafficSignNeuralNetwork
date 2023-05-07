CREATE DATABASE  IF NOT EXISTS `networks_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `networks_db`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: networks_db
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `training_process`
--

DROP TABLE IF EXISTS `training_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_process` (
  `id` int NOT NULL AUTO_INCREMENT,
  `configuration_id` int NOT NULL,
  `epoch` int NOT NULL,
  `loss` float NOT NULL,
  `accuracy` float NOT NULL,
  `val_loss` float NOT NULL,
  `val_accuracy` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `configuration_id` (`configuration_id`),
  CONSTRAINT `training_process_ibfk_1` FOREIGN KEY (`configuration_id`) REFERENCES `configurations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_process`
--

LOCK TABLES `training_process` WRITE;
/*!40000 ALTER TABLE `training_process` DISABLE KEYS */;
INSERT INTO `training_process` VALUES (1,14,0,1.7141,0.50653,0.519934,0.849953),(2,14,1,0.680348,0.798096,0.224821,0.946272),(3,14,2,0.437353,0.870395,0.147499,0.961914),(4,14,3,0.313648,0.910301,0.0892041,0.980872),(5,14,4,0.260703,0.922193,0.0692041,0.983848),(6,14,5,0.214919,0.935362,0.0631258,0.987248),(7,14,6,0.187404,0.944408,0.0512271,0.986823),(8,14,7,0.17106,0.948311,0.047649,0.988693),(9,14,8,0.150261,0.956665,0.0400384,0.990479),(10,14,9,0.133464,0.961115,0.0395347,0.992094),(11,15,0,1.7336,0.50259,0.199224,0.947547),(12,15,1,0.290989,0.911542,0.0419569,0.988268),(13,15,2,0.149708,0.956117,0.0270242,0.992689),(14,15,3,0.0963004,0.972058,0.0208191,0.993539),(15,15,4,0.0742135,0.977712,0.0116031,0.996514),(16,15,5,0.0554415,0.983366,0.0100704,0.997195),(17,15,6,0.0496354,0.984679,0.00588658,0.998555),(18,15,7,0.0468362,0.986102,0.00797652,0.99796),(19,15,8,0.0336793,0.989166,0.00314248,0.99915),(20,15,9,0.0261671,0.992559,0.00370619,0.998895),(21,16,0,1.91402,0.445976,0.538509,0.865),(22,16,1,0.67064,0.792114,0.150134,0.96659),(23,16,2,0.392977,0.882797,0.0830363,0.981297),(24,16,3,0.285108,0.914314,0.035624,0.990394),(25,16,4,0.213945,0.937915,0.0355006,0.991244),(26,16,5,0.183014,0.944773,0.0293921,0.993199),(27,16,6,0.160309,0.951631,0.0267569,0.993284),(28,16,7,0.136308,0.95754,0.0252876,0.994219),(29,16,8,0.123564,0.962975,0.0222966,0.994134),(30,16,9,0.107324,0.968264,0.0381075,0.991414),(41,19,0,1.71363,0.505873,0.510437,0.857604),(42,19,1,0.749531,0.768002,0.224849,0.938706),(43,19,2,0.4803,0.854855,0.118812,0.972201),(44,19,3,0.363673,0.889691,0.0688801,0.984018),(45,19,4,0.292742,0.911797,0.0691459,0.985548),(46,19,5,0.246997,0.927336,0.0457055,0.990224),(47,19,6,0.214018,0.934194,0.0446667,0.988608),(48,19,7,0.199874,0.939301,0.0333607,0.993369),(49,19,8,0.174605,0.946451,0.0321409,0.993029),(50,19,9,0.164133,0.9505,0.0236496,0.995069),(51,19,10,0.141716,0.95692,0.0225865,0.995579),(52,19,11,0.139377,0.957613,0.022297,0.995409),(53,19,12,0.130306,0.960203,0.019492,0.996004),(54,19,13,0.11598,0.965419,0.019041,0.995239),(55,19,14,0.106708,0.968483,0.014963,0.997025),(56,19,15,0.102263,0.967827,0.0157389,0.996089),(57,19,16,0.102124,0.96976,0.0140325,0.997025),(58,19,17,0.0973284,0.971547,0.0152116,0.99711),(59,19,18,0.0921379,0.972569,0.0155454,0.996599),(60,19,19,0.0874787,0.9737,0.0114141,0.99813),(61,19,20,0.0880351,0.973444,0.0121591,0.997535),(62,19,21,0.0796669,0.976472,0.0111693,0.997875),(63,19,22,0.0815747,0.975961,0.0150574,0.996514),(64,19,23,0.0771327,0.976691,0.00950282,0.998385),(65,19,24,0.0714909,0.979208,0.0104465,0.99813),(66,19,25,0.0728391,0.977749,0.00986552,0.99813),(67,19,26,0.0682565,0.979244,0.0117838,0.997875),(68,19,27,0.0713643,0.979755,0.0159002,0.99643),(69,19,28,0.0637476,0.980813,0.0105958,0.997875),(70,19,29,0.064744,0.979901,0.00979425,0.998385),(71,20,0,1.80714,0.478551,0.239522,0.935986),(72,20,1,0.361208,0.890859,0.0506301,0.988013),(73,20,2,0.177895,0.947509,0.0352598,0.992264),(74,20,3,0.117072,0.965091,0.0210107,0.993964),(75,20,4,0.096771,0.970964,0.0242925,0.992179),(76,20,5,0.0767515,0.976654,0.013597,0.996684),(77,20,6,0.0756727,0.976837,0.0167274,0.995069),(78,20,7,0.0552156,0.982892,0.00666011,0.99796),(79,20,8,0.0487531,0.985956,0.0146494,0.99643),(80,20,9,0.0508503,0.985956,0.00705577,0.99796),(81,20,10,0.0452162,0.985847,0.0111807,0.99762),(82,20,11,0.0376471,0.988911,0.00593732,0.997875),(83,20,12,0.0357003,0.988619,0.00524495,0.99847),(84,20,13,0.0335296,0.989531,0.00566419,0.998045),(85,20,14,0.0326667,0.990662,0.00632127,0.99813),(86,20,15,0.0259086,0.992121,0.00693124,0.99796),(87,20,16,0.0287062,0.991793,0.0066557,0.997705),(88,20,17,0.0287566,0.992048,0.00945596,0.996684),(89,20,18,0.0229984,0.992923,0.00473659,0.99864),(90,20,19,0.0242714,0.992595,0.00466896,0.99847),(91,20,20,0.0233653,0.992668,0.00765468,0.99779),(92,20,21,0.018275,0.994601,0.00624459,0.998215),(93,20,22,0.0189203,0.994601,0.00313803,0.99932),(94,20,23,0.0172785,0.994711,0.00540357,0.999235),(95,20,24,0.0184649,0.993507,0.00432024,0.99864),(96,20,25,0.0216158,0.993543,0.0038606,0.998725),(97,20,26,0.0148911,0.995513,0.00538997,0.99813),(98,20,27,0.0161409,0.994857,0.0033852,0.999065),(99,20,28,0.0138738,0.99544,0.00283653,0.99915),(100,20,29,0.0147575,0.995404,0.00432053,0.998725);
/*!40000 ALTER TABLE `training_process` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-07 14:46:59