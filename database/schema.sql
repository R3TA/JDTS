-- MySQL dump 10.16  Distrib 10.1.16-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: colegio
-- ------------------------------------------------------
-- Server version	10.1.16-MariaDB

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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `colegio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_colegio_alumno` (`colegio`),
  CONSTRAINT `fk_colegio_alumno` FOREIGN KEY (`colegio`) REFERENCES `colegio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asignatura_alumno`
--

DROP TABLE IF EXISTS `asignatura_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignatura_alumno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno` int(11) DEFAULT NULL,
  `asignatura` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alumno_asignatura_alumno` (`alumno`),
  KEY `fk_asignatura_asignatura_alumno` (`asignatura`),
  CONSTRAINT `fk_alumno_asignatura_alumno` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`id`),
  CONSTRAINT `fk_asignatura_asignatura_alumno` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `colegio`
--

DROP TABLE IF EXISTS `colegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colegio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `colegio_asignatura`
--

DROP TABLE IF EXISTS `colegio_asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colegio_asignatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colegio` int(11) DEFAULT NULL,
  `asignatura` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_colegio_colegio_asignatura` (`colegio`),
  KEY `fk_asignatura_colegio_asignatura` (`asignatura`),
  CONSTRAINT `fk_asignatura_colegio_asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`id`),
  CONSTRAINT `fk_colegio_colegio_asignatura` FOREIGN KEY (`colegio`) REFERENCES `colegio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nota_alumno_asignatura`
--

DROP TABLE IF EXISTS `nota_alumno_asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_alumno_asignatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno` int(11) DEFAULT NULL,
  `asignatura` int(11) DEFAULT NULL,
  `nota` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alumno_nota_alumno_asignatura` (`alumno`),
  KEY `fk_asignatura_nota_alumno_asignatura` (`asignatura`),
  KEY `fk_nota_nota_alumno_asignatura` (`nota`),
  CONSTRAINT `fk_alumno_nota_alumno_asignatura` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`id`),
  CONSTRAINT `fk_asignatura_nota_alumno_asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`id`),
  CONSTRAINT `fk_nota_nota_alumno_asignatura` FOREIGN KEY (`nota`) REFERENCES `nota` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `asignatura` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `colegio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_colegio_profesor` (`colegio`),
  KEY `fk_asignatura_profesor` (`asignatura`),
  CONSTRAINT `fk_asignatura_profesor` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`id`),
  CONSTRAINT `fk_colegio_profesor` FOREIGN KEY (`colegio`) REFERENCES `colegio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-15  5:44:12
