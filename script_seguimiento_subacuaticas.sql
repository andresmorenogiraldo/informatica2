CREATE DATABASE  IF NOT EXISTS `seguimiento_subacuaticas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `seguimiento_subacuaticas`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: seguimiento_subacuaticas
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administradores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  `idRol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_UNIQUE` (`email`),
  KEY `fk_Administradores_Roles1_idx` (`idRol`),
  CONSTRAINT `fk_Administradores_Roles1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,1016001176,'Andres','Moreno','andresmorenogiraldo@gmail.com','123456',1);
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chequeos`
--

DROP TABLE IF EXISTS `chequeos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chequeos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tiempo` varchar(45) DEFAULT NULL,
  `fechaChequeo` date DEFAULT NULL,
  `idDeportista` int(11) NOT NULL,
  `idPrueba` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Registro_tiempo_Deportista1_idx` (`idDeportista`),
  KEY `fk_Registro_tiempo_Prueba1_idx` (`idPrueba`),
  CONSTRAINT `fk_Registro_tiempo_Deportista1` FOREIGN KEY (`idDeportista`) REFERENCES `deportistas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_tiempo_Prueba1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chequeos`
--

LOCK TABLES `chequeos` WRITE;
/*!40000 ALTER TABLE `chequeos` DISABLE KEYS */;
INSERT INTO `chequeos` VALUES (1,'00:01:35.90','2018-01-01',2,1),(2,'00:01:01.15','2018-01-01',3,3),(6,'00:01:35.01','2018-01-01',2,1),(10,'00:04:00.19','2018-05-02',3,6),(11,'00:01:35.92','2018-05-15',2,1),(12,'00:01:35.99','2018-05-19',2,1);
/*!40000 ALTER TABLE `chequeos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubes`
--

DROP TABLE IF EXISTS `clubes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clubes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `liga` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubes`
--

LOCK TABLES `clubes` WRITE;
/*!40000 ALTER TABLE `clubes` DISABLE KEYS */;
INSERT INTO `clubes` VALUES (2,'Rorcual','Cundinamarca'),(3,'Akuator','Bogota'),(14,'Azul','Bogota'),(16,'Pulpos','Cundinamarca'),(19,'Esturiones','Antioquia'),(20,'Tiburones','Valle'),(23,'Mantarrayas','Antioquia'),(24,'Nutrias','Huila');
/*!40000 ALTER TABLE `clubes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deportistas`
--

DROP TABLE IF EXISTS `deportistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deportistas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `estatura` float DEFAULT NULL,
  `rama` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  `idClub` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_UNIQUE` (`cedula`),
  UNIQUE KEY `usuario_UNIQUE` (`email`),
  KEY `fk_Deportista_Club1_idx` (`idClub`),
  KEY `fk_Deportistas_Roles1_idx` (`idRol`),
  CONSTRAINT `fk_Deportista_Club1` FOREIGN KEY (`idClub`) REFERENCES `clubes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Deportistas_Roles1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deportistas`
--

LOCK TABLES `deportistas` WRITE;
/*!40000 ALTER TABLE `deportistas` DISABLE KEYS */;
INSERT INTO `deportistas` VALUES (2,1016001176,'Andres','Moreno','1987-03-07',62.7,1.7,'Masculina','andresmoreno87@hotmail.com','123',2,3),(3,1020562171,'Paula','Barrios','1990-01-04',59.5,1.51,'Femenina','paulafer@gmail.com','123',2,3),(4,1022789546,'Alejandra','Ortiz','1987-12-28',61.6,1.55,'Femenina','alejandra.ortiz@gmail.com','123',16,3);
/*!40000 ALTER TABLE `deportistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrenadores`
--

DROP TABLE IF EXISTS `entrenadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrenadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  `idClub` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_UNIQUE` (`cedula`),
  UNIQUE KEY `usuario_UNIQUE` (`email`),
  KEY `fk_Entrenador_Club1_idx` (`idClub`),
  KEY `fk_Entrenadores_Roles1_idx` (`idRol`),
  CONSTRAINT `fk_Entrenador_Club1` FOREIGN KEY (`idClub`) REFERENCES `clubes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entrenadores_Roles1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenadores`
--

LOCK TABLES `entrenadores` WRITE;
/*!40000 ALTER TABLE `entrenadores` DISABLE KEYS */;
INSERT INTO `entrenadores` VALUES (1,18365475,'William Orlando','Pena A.','williampwp@yahoo.com','123',2,2),(3,1018586911,'Daniel Felipe','Lagos Prieto','daniel.lagos@gmail.com','123',16,2);
/*!40000 ALTER TABLE `entrenadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pruebas`
--

DROP TABLE IF EXISTS `pruebas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pruebas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distancia` int(11) DEFAULT NULL,
  `modalidad` varchar(45) DEFAULT NULL,
  `rama` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prueba_UNIQUE` (`distancia`,`modalidad`,`rama`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pruebas`
--

LOCK TABLES `pruebas` WRITE;
/*!40000 ALTER TABLE `pruebas` DISABLE KEYS */;
INSERT INTO `pruebas` VALUES (1,200,'Superficie','Masculina','00:01:18.65'),(2,50,'Apnea','Masculina','00:00:13.94'),(3,100,'Bialetas','Femenina','00:00:49.37'),(5,400,'Superficie','Masculina','00:03:05.52'),(6,400,'Superficie','Femenina','00:03:58.72'),(8,200,'Superficie','Femenina','00:01:33.17');
/*!40000 ALTER TABLE `pruebas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrosimc`
--

DROP TABLE IF EXISTS `registrosimc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registrosimc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imc` float DEFAULT NULL,
  `fechaImc` date DEFAULT NULL,
  `idDeportista` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Registro_imc_Deportista1_idx` (`idDeportista`),
  CONSTRAINT `fk_Registro_imc_Deportista1` FOREIGN KEY (`idDeportista`) REFERENCES `deportistas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrosimc`
--

LOCK TABLES `registrosimc` WRITE;
/*!40000 ALTER TABLE `registrosimc` DISABLE KEYS */;
INSERT INTO `registrosimc` VALUES (1,21.5917,'2018-04-29',2),(3,26.0953,'2018-04-29',3),(4,25.64,'2018-04-29',4),(5,21.6263,'2018-04-29',2),(7,21.6263,'2018-04-29',2),(11,25.64,'2018-04-29',4),(13,25.64,'2018-04-29',4),(14,26.0953,'2018-04-29',3),(15,26.0953,'2018-04-29',3),(20,21.7647,'2018-04-29',2),(25,25.64,'2018-04-30',4),(26,26.0953,'2018-05-06',3),(27,21.7647,'2018-05-06',2),(34,26.0953,'2018-05-07',3),(35,25.64,'2018-05-07',4),(37,21.6263,'2018-05-07',2),(38,21.6263,'2018-05-15',2),(42,21.6955,'2018-05-19',2);
/*!40000 ALTER TABLE `registrosimc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'administrador'),(2,'entrenador'),(3,'deportista');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;