-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: proyectoweb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `idRolSistema` varchar(8) NOT NULL DEFAULT 'UNSET',
  `idEstado` varchar(8) NOT NULL DEFAULT 'REG',
  `nombres` varchar(32) NOT NULL,
  `apellidos` varchar(32) NOT NULL,
  `codigo` varchar(8) NOT NULL,
  `correo_pucp` varchar(45) NOT NULL,
  `contrasena` varchar(64) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cant_eventos_inscritos` int NOT NULL DEFAULT '0',
  `idRolAcademico` varchar(15) NOT NULL DEFAULT 'STUDENT',
  `kit_teleco` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `correo_pucp_UNIQUE` (`correo_pucp`),
  KEY `fk_Usuarios_Estado_Usuario1_idx` (`idEstado`),
  KEY `fk_Usuarios_Rol1_idx` (`idRolSistema`),
  KEY `fk_Usuario_RolAcademico` (`idRolAcademico`),
  CONSTRAINT `fk_Usuario_RolAcademico` FOREIGN KEY (`idRolAcademico`) REFERENCES `rol_academico` (`idRolAcademico`),
  CONSTRAINT `fk_Usuarios_Estado_Usuario1` FOREIGN KEY (`idEstado`) REFERENCES `estado_usuario` (`idEstado_Usuario`),
  CONSTRAINT `fk_Usuarios_Rol1` FOREIGN KEY (`idRolSistema`) REFERENCES `rol_sistema` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'DELGEN','ACC','Alonso','Escobedo','20210850','root@pucp.edu.pe','4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2','2023-11-14 11:44:47',0,'STUDENT',0),(2,'DELACT','ACC','admin','act','11111111','adminact@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-11-14 16:18:49',0,'STUDENT',0),(10,'DELACT','BAN','Alonso','Escobedo','20210850','a20210250@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-10-19 16:20:46',0,'STUDENT',0),(11,'DELACT','ACC','Jorge','Coronado','20181526','a20181526@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-10-19 16:28:50',0,'STUDENT',0),(12,'DELACT','ACC','Sergio','Bustamante','20213170','a20213170@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-10-19 16:30:11',0,'STUDENT',0),(13,'DELACT','ACC','Piero','Huancas','20200814','a20200814@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-10-19 16:31:04',0,'STUDENT',0),(14,'DELACT','ACC','Gerardo','Gutierrez','20206089','a20206089@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-10-19 16:31:52',0,'STUDENT',0),(15,'DELACT','ACC','Leonardo','Aldoradin','20204205','a20204205@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-10-19 16:32:45',0,'STUDENT',0),(16,'DELACT','ACC','Ever','Sullca','20182926','a20182926@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-10-19 16:33:16',0,'STUDENT',0),(100,'USER','ACC','Pepe','Gonzales','20200100','a20200100@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-10-19 16:13:24',0,'STUDENT',0),(101,'USER','VER','Barack','Obama','20200101','a20200101@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-10-19 16:14:28',0,'STUDENT',0),(102,'USER','PEN','Nicola','Porcella','20200102','a20200102@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-10-19 16:16:10',0,'STUDENT',0),(103,'USER','ACC','Maria','Mercedes','20200103','a20200103@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-10-19 16:16:58',0,'STUDENT',0),(104,'USER','ACC','Diego','Caballero','20200104','a20200104@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-10-19 16:18:55',0,'STUDENT',0),(105,'USER','ACC','Sara','Gonzales','20200105','a20200105@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-10-19 16:18:55',0,'STUDENT',0),(106,'USER','PEN','Jose','Olaya','20200106','a20200106@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-10-19 16:34:27',0,'STUDENT',0),(107,'USER','ACC','Pedro','Huaman','20200107','a20200107@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-10-19 16:36:42',0,'STUDENT',0),(109,'USER','PEN','Maria','Lopez','20200109','a20200109@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-11-04 16:31:16',0,'STUDENT',0),(111,'USER','ACC','Laura','Rodriguez','20200111','a20200111@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-11-04 16:31:16',0,'STUDENT',0),(112,'USER','VER','Carlos','Martinez','20200112','a20200112@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-11-04 16:31:16',0,'STUDENT',0),(115,'USER','ACC','Isabel','Sanchez','20200115','a20200115@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-11-04 16:31:16',0,'STUDENT',0),(116,'USER','ACC','Miguel','Vargas','20200116','a20200116@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-11-04 16:31:16',0,'STUDENT',0),(117,'USER','BAN','Rosa','Mendoza','20200117','a20200117@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-11-04 16:31:16',0,'STUDENT',0),(118,'USER','BAN','Hector','Fernandez','20200118','a20200118@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-11-04 16:31:16',0,'STUDENT',0),(119,'USER','VER','Elena','Garcia','20200119','a20200119@pucp.edu.pe','b885e53e3dedaabdac3084094b736fde64e03dc0000e3e894b35d1a0adddeda4','2023-11-04 16:31:16',0,'STUDENT',0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-14 16:28:35
