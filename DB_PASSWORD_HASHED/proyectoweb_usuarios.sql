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
  `kit_teleco` tinyint(1) DEFAULT NULL,
  `contrasena_hashed` varchar(64) DEFAULT NULL,
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
INSERT INTO `usuarios` VALUES (1,'DELGEN','ACC','Administrador','General','20200220','	a20210850@pucp.edu.pe','password','2023-10-19 16:03:34',NULL,0,NULL,'STUDENT',0,'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),(10,'DELACT','BAN','Alonso','Escobedo','20210850','a20210850@pucp.edu.pe','10','2023-10-19 16:20:46',NULL,0,NULL,'STUDENT',0,'4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5'),(11,'DELACT','ACC','Jorge','Coronado','20181526','a20181526@pucp.edu.pe','11','2023-10-19 16:28:50',NULL,0,NULL,'STUDENT',0,'4fc82b26aecb47d2868c4efbe3581732a3e7cbcc6c2efb32062c08170a05eeb8'),(12,'DELACT','ACC','Sergio','Bustamante','20213170','a20213170@pucp.edu.pe','12','2023-10-19 16:30:11',NULL,0,NULL,'STUDENT',0,'6b51d431df5d7f141cbececcf79edf3dd861c3b4069f0b11661a3eefacbba918'),(13,'DELACT','ACC','Piero','Huancas','20200814','a20200814@pucp.edu.pe','13','2023-10-19 16:31:04',NULL,0,NULL,'STUDENT',0,'3fdba35f04dc8c462986c992bcf875546257113072a909c162f7e470e581e278'),(14,'DELACT','ACC','Gerardo','Gutierrez','20206089','a20206089@pucp.edu.pe','14','2023-10-19 16:31:52',NULL,0,NULL,'STUDENT',0,'8527a891e224136950ff32ca212b45bc93f69fbb801c3b1ebedac52775f99e61'),(15,'DELACT','ACC','Leonardo','Aldoradin','20204205','a20204205@pucp.edu.pe','15','2023-10-19 16:32:45',NULL,0,NULL,'STUDENT',0,'e629fa6598d732768f7c726b4b621285f9c3b85303900aa912017db7617d8bdb'),(16,'DELACT','ACC','Ever','Sullca','20182926','a20182926@pucp.edu.pe','16','2023-10-19 16:33:16',NULL,0,NULL,'STUDENT',0,'b17ef6d19c7a5b1ee83b907c595526dcb1eb06db8227d650d5dda0a9f4ce8cd9'),(100,'USER','ACC','Pepe','Gonzales','20200100','a20200100@pucp.edu.pe','100','2023-10-19 16:13:24',NULL,0,NULL,'STUDENT',0,'ad57366865126e55649ecb23ae1d48887544976efea46a48eb5d85a6eeb4d306'),(101,'USER','VER','Barack','Obama','20200101','a20200101@pucp.edu.pe','101','2023-10-19 16:14:28',NULL,0,NULL,'STUDENT',0,'16dc368a89b428b2485484313ba67a3912ca03f2b2b42429174a4f8b3dc84e44'),(102,'USER','PEN','Nicola','Porcella','20200102','a20200102@pucp.edu.pe','102','2023-10-19 16:16:10',NULL,0,NULL,'STUDENT',0,'37834f2f25762f23e1f74a531cbe445db73d6765ebe60878a7dfbecd7d4af6e1'),(103,'USER','ACC','Maria','Mercedes','20200103','a20200103@pucp.edu.pe','103','2023-10-19 16:16:58',NULL,0,NULL,'STUDENT',0,'454f63ac30c8322997ef025edff6abd23e0dbe7b8a3d5126a894e4a168c1b59b'),(104,'USER','ACC','Diego','Caballero','20200104','a20200104@pucp.edu.pe','104','2023-10-19 16:18:55',NULL,0,NULL,'STUDENT',0,'5ef6fdf32513aa7cd11f72beccf132b9224d33f271471fff402742887a171edf'),(105,'USER','ACC','Sara','Gonzales','20200105','a20200105@pucp.edu.pe','105','2023-10-19 16:18:55',NULL,0,NULL,'STUDENT',0,'1253e9373e781b7500266caa55150e08e210bc8cd8cc70d89985e3600155e860'),(106,'USER','PEN','Jose','Olaya','20200106','a20200106@pucp.edu.pe','106','2023-10-19 16:34:27',NULL,0,NULL,'STUDENT',0,'482d9673cfee5de391f97fde4d1c84f9f8d6f2cf0784fcffb958b4032de7236c'),(107,'USER','ACC','Pedro','Huaman','20200107','a20200107@pucp.edu.pe','107','2023-10-19 16:36:42',NULL,0,NULL,'STUDENT',0,'3346f2bbf6c34bd2dbe28bd1bb657d0e9c37392a1d5ec9929e6a5df4763ddc2d'),(109,'USER','PEN','Maria','Lopez','20200109','a20200109@pucp.edu.pe','109','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT',0,'0fd42b3f73c448b34940b339f87d07adf116b05c0227aad72e8f0ee90533e699'),(111,'USER','ACC','Laura','Rodriguez','20200111','a20200111@pucp.edu.pe','111','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT',0,'f6e0a1e2ac41945a9aa7ff8a8aaa0cebc12a3bcc981a929ad5cf810a090e11ae'),(112,'USER','VER','Carlos','Martinez','20200112','a20200112@pucp.edu.pe','112','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT',0,'b1556dea32e9d0cdbfed038fd7787275775ea40939c146a64e205bcb349ad02f'),(115,'USER','ACC','Isabel','Sanchez','20200115','a20200115@pucp.edu.pe','115','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT',0,'28dae7c8bde2f3ca608f86d0e16a214dee74c74bee011cdfdd46bc04b655bc14'),(116,'USER','ACC','Miguel','Vargas','20200116','a20200116@pucp.edu.pe','116','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT',0,'e5b861a6d8a966dfca7e7341cd3eb6be9901688d547a72ebed0b1f5e14f3d08d'),(117,'USER','BAN','Rosa','Mendoza','20200117','a20200117@pucp.edu.pe','117','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT',0,'2ac878b0e2180616993b4b6aa71e61166fdc86c28d47e359d0ee537eb11d46d3'),(118,'USER','BAN','Hector','Fernandez','20200118','a20200118@pucp.edu.pe','118','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT',0,'85daaf6f7055cd5736287faed9603d712920092c4f8fd0097ec3b650bf27530e'),(119,'USER','VER','Elena','Garcia','20200119','a20200119@pucp.edu.pe','119','2023-11-04 16:31:16',NULL,0,NULL,'STUDENT',0,'3038bfb575bee6a0e61945eff8784835bb2c720634e42734678c083994b7f018');
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

-- Dump completed on 2023-11-10 19:05:26
