-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: uusi_db
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `kirjat2`
--

DROP TABLE IF EXISTS `kirjat2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kirjat2` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nimi` varchar(255) NOT NULL,
  `luettu` tinyint(1) NOT NULL,
  `sivumaara` int(12) DEFAULT NULL,
  `lukija_id` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lukija_id` (`lukija_id`),
  CONSTRAINT `kirjat2_ibfk_1` FOREIGN KEY (`lukija_id`) REFERENCES `lukijat2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kirjat2`
--

LOCK TABLES `kirjat2` WRITE;
/*!40000 ALTER TABLE `kirjat2` DISABLE KEYS */;
INSERT INTO `kirjat2` VALUES (1,'Mallikas elämäni',0,313,1),(2,'Kodin korjausopas',0,278,1),(3,'Kave-lava',0,443,2),(4,'Siellä Pohjantähden alla',0,623,2),(5,'Tuo tuntemani sotilas',0,422,2);
/*!40000 ALTER TABLE `kirjat2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lukijat2`
--

DROP TABLE IF EXISTS `lukijat2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lukijat2` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nimi` varchar(255) NOT NULL,
  `ika` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lukijat2`
--

LOCK TABLES `lukijat2` WRITE;
/*!40000 ALTER TABLE `lukijat2` DISABLE KEYS */;
INSERT INTO `lukijat2` VALUES (1,'Mikko Mallikas',58),(2,'Sanna Suomalainen',24);
/*!40000 ALTER TABLE `lukijat2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-12 11:15:07
