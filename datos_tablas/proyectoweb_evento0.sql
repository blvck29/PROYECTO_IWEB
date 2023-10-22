-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: proyectoweb
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
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `idEvento` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `subTitulo` varchar(100) NOT NULL,
  `hora` time NOT NULL,
  `fecha` date NOT NULL,
  `lugar` varchar(32) NOT NULL,
  `imagen` longblob,
  `descripcion` varchar(250) NOT NULL,
  `idEstado` varchar(8) NOT NULL,
  `idActividad` varchar(8) NOT NULL,
  PRIMARY KEY (`idEvento`),
  KEY `fk_Evento_Estado_Evento1_idx` (`idEstado`),
  KEY `fk_Evento_Actividad1_idx` (`idActividad`),
  CONSTRAINT `fk_Evento_Actividad1` FOREIGN KEY (`idActividad`) REFERENCES `actividad` (`idActividad`),
  CONSTRAINT `fk_Evento_Estado_Evento1` FOREIGN KEY (`idEstado`) REFERENCES `estado_evento` (`Id_Estado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'VALORANT - Jornada 1','Fibra Tóxica vs. Electroshock','17:30:00','2023-10-18','Av. La Marina 223 2do piso',NULL,'Partido de clasificación de Valorant','PUBLIC','ESPORTS'),(2,'FUTBOL - Jornada 1','Naranja Mecánica vs. PXO','19:00:00','2023-10-18','PUCP, Cancha de Minas',NULL,'Partidos de clasificación Futbol','PUBLIC','FUTBOL'),(3,'VOLEY - Jornada 1','Fibra Tóxica vs. Hormigón Armado','21:00:00','2023-10-18','PUCP, Cancha de Minas',NULL,'Partidos de clasificación Futbol','PUBLIC','FUTBOL'),(4,'LOL - Jornada 1','Fibra Tóxica vs. Naranja Mecánica','11:00:00','2023-10-17','Av. Universitaria 561 3er piso',NULL,'Partido de clasificación de LOL','PUBLIC','ESPORTS'),(5,'VALORANT - Jornada 2','PXO vs. Hormigón Armado','15:00:00','2023-10-19','Av. La Marina 223 2do piso',NULL,'Partido de clasificación de Valorant','PUBLIC','ESPORTS'),(6,'BASQUET - Jornada 1','Fibra Tóxica vs. Electroshock','10:00:00','2023-10-19','PUCP, Polideportivo',NULL,'Partidos de clasificación Basquet','PUBLIC','BASQUET');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-22 12:12:08
