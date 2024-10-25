-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: bookmark_manager
-- ------------------------------------------------------
-- Server version	5.5.5-10.9.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookmark`
--

DROP TABLE IF EXISTS `bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmark` (
  `IDBookmark` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `IsPublic` tinyint(1) NOT NULL DEFAULT 0,
  `FIDUser` int(10) unsigned NOT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`IDBookmark`),
  KEY `bookmark_user_FK` (`FIDUser`),
  CONSTRAINT `bookmark_user_FK` FOREIGN KEY (`FIDUser`) REFERENCES `user` (`IDUser`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmark`
--

LOCK TABLES `bookmark` WRITE;
/*!40000 ALTER TABLE `bookmark` DISABLE KEYS */;
INSERT INTO `bookmark` VALUES (1,'Smashing Magazine','https://www.smashingmagazine.com/',1,1,'2024-07-15 13:57:58'),(2,'CSS-Tricks','https://css-tricks.com/',1,1,'2024-07-15 13:59:23'),(3,'WIFI OÖ','https://www.wifi-ooe.at',1,2,'2024-07-15 14:00:22'),(4,'Awesome Company','https://www.awesome-company.com',0,2,'2024-07-15 14:01:13');
/*!40000 ALTER TABLE `bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `FIDUser` int(10) unsigned NOT NULL,
  `FIDBookmark` int(10) unsigned NOT NULL,
  `Rating` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`FIDUser`,`FIDBookmark`),
  KEY `rating_bookmark_FK` (`FIDBookmark`),
  CONSTRAINT `rating_bookmark_FK` FOREIGN KEY (`FIDBookmark`) REFERENCES `bookmark` (`IDBookmark`) ON DELETE CASCADE,
  CONSTRAINT `rating_user_FK` FOREIGN KEY (`FIDUser`) REFERENCES `user` (`IDUser`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (2,1,4),(3,1,5),(3,2,5),(4,1,5),(4,3,5);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `IDUser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Username` varchar(32) NOT NULL,
  `Email` varchar(64) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`IDUser`),
  UNIQUE KEY `user_unique` (`Username`),
  UNIQUE KEY `user_unique_1` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'jane','jane@doe.com','$2y$10$1u2Ab/e5/HlgHD.58xEzPOmvOerIIBqqwSrEbRbw0n.scp6YLI2VG'),(2,'john','john@doe.com','$2y$10$slnGYGLZtvI1Vcv00m0avOJFBzimJWS75z.lX3hZEvlv/UvQNLJEy'),(3,'susi','susi@test.com','$2y$10$yUq4v0Y6iDQummgz4WtK3eTt7yFgqubfCbOzTzd.IggBBKX4YEcWK'),(4,'max','max@test.at','$2y$10$S/5mC.5zUe0LI2slBCyqFufiSE3Y4I8c9RA34j2MRlRt5u23dLi8q');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bookmark_manager'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-16 11:01:10
