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
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `kirjat`
--

LOCK TABLES `kirjat` WRITE;
/*!40000 ALTER TABLE `kirjat` DISABLE KEYS */;
INSERT INTO `kirjat` VALUES (2,'Hullua ja Hauskaa',1,36,3),(3,'Partiolaisen käsikirja',1,74,3),(4,'Ydinfysiikkaa lapsille',0,341,3),(5,'Unikeon Päiväkirja',0,243,1),(6,'Romanttisia tarinoita 1957',1,327,2),(7,'Tietokoneen käyttäminen aloittelijoille',0,154,2),(8,'Muistisairaudet ja niiden tunnistaminen',1,256,2),(9,'Muistisairaudet ja niiden tunnistaminen',0,256,2),(10,'40 000 tykkäyksen elämä',1,381,4),(11,'Miten tulla kuuluisaksi',1,428,4),(12,'Tulin ja menin; ekstrovertin elämä',0,299,4);
/*!40000 ALTER TABLE `kirjat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lukijat`
--

LOCK TABLES `lukijat` WRITE;
/*!40000 ALTER TABLE `lukijat` DISABLE KEYS */;
INSERT INTO `lukijat` VALUES (1,'Matti Myöhäinen',45),(2,'Vilho Vanhanaikainen',72),(3,'Väinö Vähäikäinen',7),(4,'Urho Uudenaikainen',23);
/*!40000 ALTER TABLE `lukijat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-11 12:27:15
