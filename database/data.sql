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
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'Ricardo','2003-02-01',1),(2,'Roberto','2003-02-02',1),(3,'Rosario','2003-02-03',1),(4,'Salvador','2003-02-04',1),(5,'Salvio','2003-02-05',1),(6,'Vicente','2003-02-06',1),(7,'Ursula','2003-02-07',1),(8,'Tadeo','2003-02-08',1),(9,'Siro','2003-02-09',1),(10,'Jacinto','2003-01-01',1),(11,'Juan','2003-01-02',1),(12,'Juvenal','2003-01-03',1),(13,'Javier','2003-01-04',1),(14,'Joel','2003-01-05',1),(15,'Laura','2003-01-06',1),(16,'Lázaro','2003-01-07',1),(17,'Leonardo','2003-01-08',1),(18,'Leonor','2003-01-09',1),(19,'Justino','2003-01-10',1),(20,'Jacob','2003-01-11',1);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `asignatura`
--

LOCK TABLES `asignatura` WRITE;
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
INSERT INTO `asignatura` VALUES (1,'Artes Visuales'),(2,'Ciencias Naturales'),(3,'Educación Física y Salud'),(4,'Historia, Geografía y Ciencias Sociales'),(5,'Inglés'),(6,'Lenguaje, Comunicación y Literatura'),(7,'Lengua indígena'),(8,'Matemática'),(9,'Música');
/*!40000 ALTER TABLE `asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `asignatura_alumno`
--

LOCK TABLES `asignatura_alumno` WRITE;
/*!40000 ALTER TABLE `asignatura_alumno` DISABLE KEYS */;
INSERT INTO `asignatura_alumno` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,1,2),(22,2,2),(23,3,2),(24,4,2),(25,5,2),(26,6,2),(27,7,2),(28,8,2),(29,9,2),(30,10,2),(31,11,2),(32,12,2),(33,13,2),(34,14,2),(35,15,2),(36,16,2),(37,17,2),(38,18,2),(39,19,2),(40,20,2),(41,1,3),(42,2,3),(43,3,3),(44,4,3),(45,5,3),(46,6,3),(47,7,3),(48,8,3),(49,9,3),(50,10,3),(51,11,3),(52,12,3),(53,13,3),(54,14,3),(55,15,3),(56,16,3),(57,17,3),(58,18,3),(59,19,3),(60,20,3),(61,1,4),(62,2,4),(63,3,4),(64,4,4),(65,5,4),(66,6,4),(67,7,4),(68,8,4),(69,9,4),(70,10,4),(71,11,4),(72,12,4),(73,13,4),(74,14,4),(75,15,4),(76,16,4),(77,17,4),(78,18,4),(79,19,4),(80,20,4),(81,1,5),(82,2,5),(83,3,5),(84,4,5),(85,5,5),(86,6,5),(87,7,5),(88,8,5),(89,9,5),(90,10,5),(91,11,5),(92,12,5),(93,13,5),(94,14,5),(95,15,5),(96,16,5),(97,17,5),(98,18,5),(99,19,5),(100,20,5),(101,1,6),(102,2,6),(103,3,6),(104,4,6),(105,5,6),(106,6,6),(107,7,6),(108,8,6),(109,9,6),(110,10,6),(111,11,6),(112,12,6),(113,13,6),(114,14,6),(115,15,6),(116,16,6),(117,17,6),(118,18,6),(119,19,6),(120,20,6),(121,1,7),(122,2,7),(123,3,7),(124,4,7),(125,5,7),(126,6,7),(127,7,7),(128,8,7),(129,9,7),(130,10,7),(131,11,7),(132,12,7),(133,13,7),(134,14,7),(135,15,7),(136,16,7),(137,17,7),(138,18,7),(139,19,7),(140,20,7),(141,1,8),(142,2,8),(143,3,8),(144,4,8),(145,5,8),(146,6,8),(147,7,8),(148,8,8),(149,9,8),(150,10,8),(151,11,8),(152,12,8),(153,13,8),(154,14,8),(155,15,8),(156,16,8),(157,17,8),(158,18,8),(159,19,8),(160,20,8),(161,1,9),(162,2,9),(163,3,9),(164,4,9),(165,5,9),(166,6,9),(167,7,9),(168,8,9),(169,9,9),(170,10,9),(171,11,9),(172,12,9),(173,13,9),(174,14,9),(175,15,9),(176,16,9),(177,17,9),(178,18,9),(179,19,9),(180,20,9);
/*!40000 ALTER TABLE `asignatura_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `colegio`
--

LOCK TABLES `colegio` WRITE;
/*!40000 ALTER TABLE `colegio` DISABLE KEYS */;
INSERT INTO `colegio` VALUES (1,'Carlos Alessandri Altamirano','El Olmo 1599'),(2,'Nuestro Tiempo','Calle El Espino 2374'),(3,'Pukalan de Algarrobo','Camino El Totoral Esquina 12 De La Fama'),(4,'Teresa de los andes algarrobo','El Molle 1390'),(5,'Basica rural el Yeco','Camino Publico S/N El Yeco'),(6,'Basica rural San Jose','Kilometro 20 Camino Las Dichas'),(7,'Particular San Jose','Camino Mirasol Km 21');
/*!40000 ALTER TABLE `colegio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `colegio_asignatura`
--

LOCK TABLES `colegio_asignatura` WRITE;
/*!40000 ALTER TABLE `colegio_asignatura` DISABLE KEYS */;
INSERT INTO `colegio_asignatura` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9);
/*!40000 ALTER TABLE `colegio_asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `nota`
--

LOCK TABLES `nota` WRITE;
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
INSERT INTO `nota` VALUES (1,1.0),(2,1.1),(3,1.2),(4,1.3),(5,1.4),(6,1.5),(7,1.6),(8,1.7),(9,1.8),(10,1.9),(11,2.0),(12,2.1),(13,2.2),(14,2.3),(15,2.4),(16,2.5),(17,2.6),(18,2.7),(19,2.8),(20,2.9),(21,3.0),(22,3.1),(23,3.2),(24,3.3),(25,3.4),(26,3.5),(27,3.6),(28,3.7),(29,3.8),(30,3.9),(31,4.0),(32,4.1),(33,4.2),(34,4.3),(35,4.4),(36,4.5),(37,4.6),(38,4.7),(39,4.8),(40,4.9),(41,5.0),(42,5.1),(43,5.2),(44,5.3),(45,5.4),(46,5.5),(47,5.6),(48,5.7),(49,5.8),(50,5.9),(51,6.0),(52,6.1),(53,6.2),(54,6.3),(55,6.4),(56,6.5),(57,6.6),(58,6.7),(59,6.8),(60,6.9),(61,7.0);
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `nota_alumno_asignatura`
--

LOCK TABLES `nota_alumno_asignatura` WRITE;
/*!40000 ALTER TABLE `nota_alumno_asignatura` DISABLE KEYS */;
INSERT INTO `nota_alumno_asignatura` VALUES (1,1,6,36),(2,1,6,21),(3,1,6,25),(4,1,8,60),(5,1,8,45),(6,1,8,35),(7,2,6,31),(8,2,6,36),(9,2,6,61),(10,2,8,51),(11,2,8,32),(12,2,8,55),(13,3,6,44),(14,3,6,33),(15,3,6,28),(16,3,8,57),(17,3,8,47),(18,3,8,35),(19,4,6,28),(20,4,6,44),(21,4,6,57),(22,4,8,34),(23,4,8,18),(24,4,8,49),(25,5,6,57),(26,5,6,27),(27,5,6,22),(28,5,8,45),(29,5,8,21),(30,5,8,12);
/*!40000 ALTER TABLE `nota_alumno_asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'Narciso','1996-06-01',1,1,1),(2,'Natalia','1996-06-02',2,1,1),(3,'Nazario','1996-06-03',3,1,1),(4,'Octavio','1996-06-04',4,1,1),(5,'Oto','1996-06-05',5,1,1),(6,'Pablo','1996-06-06',6,1,1),(7,'Daniel','1996-06-07',7,1,1),(8,'Mercedes','1996-06-08',8,1,1),(9,'Melchor','1996-06-09',9,1,1);
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-15  5:40:02
