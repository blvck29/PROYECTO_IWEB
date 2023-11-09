-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyectoweb
-- ------------------------------------------------------
-- Server version	8.0.33

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
  `contrasena` varchar(32) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ultimo_login` datetime DEFAULT NULL,
  `cant_eventos_inscritos` int NOT NULL DEFAULT '0',
  `motivo_rechazo` varchar(45) DEFAULT NULL,
  `idRolAcademico` varchar(15) NOT NULL DEFAULT 'GRADUAT',
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `password_UNIQUE` (`contrasena`),
  UNIQUE KEY `correo_pucp_UNIQUE` (`correo_pucp`),
  KEY `fk_Usuarios_Estado_Usuario1_idx` (`idEstado`),
  KEY `fk_Usuarios_Rol1_idx` (`idRolSistema`),
  KEY `fk_Usuario_RolAcademico` (`idRolAcademico`),
  CONSTRAINT `fk_Usuario_RolAcademico` FOREIGN KEY (`idRolAcademico`) REFERENCES `rol_academico` (`idRolAcademico`),
  CONSTRAINT `fk_Usuarios_Estado_Usuario1` FOREIGN KEY (`idEstado`) REFERENCES `estado_usuario` (`idEstado_Usuario`),
  CONSTRAINT `fk_Usuarios_Rol1` FOREIGN KEY (`idRolSistema`) REFERENCES `rol_sistema` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (0,'DELGEN','ACC','Administrador','General','20200220','	a20210850@pucp.edu.pe','password','2023-10-19 16:03:34',NULL,0,NULL,'STUDENT'),(10,'DELACT','BAN','Alonso','Escobedo','20210850','a20210850@pucp.edu.pe','10','2023-10-19 16:20:46',NULL,0,NULL,'STUDENT'),(11,'DELACT','ACC','Jorge','Coronado','20181526','a20181526@pucp.edu.pe','11','2023-10-19 16:28:50',NULL,0,NULL,'STUDENT'),(12,'DELACT','ACC','Sergio','Bustamante','20213170','a20213170@pucp.edu.pe','12','2023-10-19 16:30:11',NULL,0,NULL,'STUDENT'),(13,'DELACT','ACC','Piero','Huancas','20200814','a20200814@pucp.edu.pe','13','2023-10-19 16:31:04',NULL,0,NULL,'STUDENT'),(14,'DELACT','ACC','Gerardo','Gutierrez','20206089','a20206089@pucp.edu.pe','14','2023-10-19 16:31:52',NULL,0,NULL,'STUDENT'),(15,'DELACT','ACC','Leonardo','Aldoradin','20204205','a20204205@pucp.edu.pe','15','2023-10-19 16:32:45',NULL,0,NULL,'STUDENT'),(16,'DELACT','ACC','Ever','Sullca','20182926','a20182926@pucp.edu.pe','16','2023-10-19 16:33:16',NULL,0,NULL,'STUDENT'),(100,'USER','ACC','Pepe','Gonzales','20200100','a20200100@pucp.edu.pe','100','2023-10-19 16:13:24',NULL,0,NULL,'STUDENT'),(101,'USER','VER','Barack','Obama','20200101','a20200101@pucp.edu.pe','101','2023-10-19 16:14:28',NULL,0,NULL,'STUDENT'),(102,'USER','PEN','Nicola','Porcella','20200102','a20200102@pucp.edu.pe','102','2023-10-19 16:16:10',NULL,0,NULL,'STUDENT'),(103,'USER','ACC','Maria','Mercedes','20200103','a20200103@pucp.edu.pe','103','2023-10-19 16:16:58',NULL,0,NULL,'STUDENT'),(104,'USER','ACC','Diego','Caballero','20200104','a20200104@pucp.edu.pe','104','2023-10-19 16:18:55',NULL,0,NULL,'STUDENT'),(105,'USER','ACC','Sara','Gonzales','20200105','a20200105@pucp.edu.pe','105','2023-10-19 16:18:55',NULL,0,NULL,'STUDENT'),(106,'USER','PEN','Jose','Olaya','20200106','a20200106@pucp.edu.pe','106','2023-10-19 16:34:27',NULL,0,NULL,'STUDENT'),(107,'USER','ACC','Pedro','Huaman','20200107','a20200107@pucp.edu.pe','107','2023-10-19 16:36:42',NULL,0,NULL,'STUDENT'),(109,'USER','PEN','Maria','Lopez','20200109','a20200109@pucp.edu.pe','109','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT'),(111,'USER','ACC','Laura','Rodriguez','20200111','a20200111@pucp.edu.pe','111','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT'),(112,'USER','VER','Carlos','Martinez','20200112','a20200112@pucp.edu.pe','112','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT'),(115,'USER','ACC','Isabel','Sanchez','20200115','a20200115@pucp.edu.pe','115','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT'),(116,'USER','ACC','Miguel','Vargas','20200116','a20200116@pucp.edu.pe','116','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT'),(117,'USER','BAN','Rosa','Mendoza','20200117','a20200117@pucp.edu.pe','117','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT'),(118,'USER','BAN','Hector','Fernandez','20200118','a20200118@pucp.edu.pe','118','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT'),(119,'USER','VER','Elena','Garcia','20200119','a20200119@pucp.edu.pe','119','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT');
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

-- Dump completed on 2023-11-09 18:19:29
