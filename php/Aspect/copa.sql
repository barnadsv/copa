-- MySQL dump 10.13  Distrib 5.5.27, for Win32 (x86)
--
-- Host: localhost    Database: copa_confederacoes
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_equipe` varchar(100) NOT NULL,
  `img_bandeira` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (1,'Brasil','/img/flag_brazil.png'),(2,'Japão','/img/flag_japan.png'),(3,'México','/img/flag_mexico.png'),(4,'Itália','/img/flag_italy.png'),(5,'Espanha','/img/flag_spain.png'),(6,'Uruguai','/img/flag_uruguay.png'),(7,'Taiti','/img/flag_tahiti.png'),(8,'Nigéria','/img/flag_nigeria.png'),(9,'1º - A',''),(10,'2º - A',''),(11,'1º - B',''),(12,'2º - B',''),(13,'Venc. - 13',''),(14,'Perd. - 13',''),(15,'Venc. - 14',''),(16,'Perd. - 14','');
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fase`
--

DROP TABLE IF EXISTS `fase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_fase` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fase`
--

LOCK TABLES `fase` WRITE;
/*!40000 ALTER TABLE `fase` DISABLE KEYS */;
INSERT INTO `fase` VALUES (1,'Fase de Grupos - 1ª Rodada'),(2,'Fase de Grupos - 2ª Rodada'),(3,'Fase de Grupos - 3ª Rodada'),(4,'Semifinais'),(5,'Finais');
/*!40000 ALTER TABLE `fase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local`
--

DROP TABLE IF EXISTS `local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cidade` varchar(100) NOT NULL,
  `nom_estadio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local`
--

LOCK TABLES `local` WRITE;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
INSERT INTO `local` VALUES (1,'Belo Horizonte',NULL),(2,'Brasília',NULL),(3,'Fortaleza',NULL),(4,'Recife',NULL),(5,'Rio de Janeiro',NULL),(6,'Salvador',NULL);
/*!40000 ALTER TABLE `local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palpite`
--

DROP TABLE IF EXISTS `palpite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `palpite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `partida_id` int(11) NOT NULL,
  `dth_palpite` datetime DEFAULT NULL,
  `qtd_gols_equipe_1` varchar(2) DEFAULT NULL,
  `qtd_gols_equipe_2` varchar(2) DEFAULT NULL,
  `qtd_pontos` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_palpite_1_idx` (`usuario_id`),
  KEY `fk_palpite_1_idx1` (`partida_id`),
  CONSTRAINT `frk_palpite_partida_id` FOREIGN KEY (`partida_id`) REFERENCES `partida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `frk_palpite_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palpite`
--

LOCK TABLES `palpite` WRITE;
/*!40000 ALTER TABLE `palpite` DISABLE KEYS */;
INSERT INTO `palpite` VALUES (45,1,1,NULL,'5','1',2),(46,1,2,NULL,'2','0',2),(47,1,3,NULL,'4','2',1),(48,1,4,NULL,'3','1',2),(49,1,6,NULL,'4','3',2),(50,1,30,NULL,'4','1',1),(51,1,31,NULL,'0','0',2),(52,1,32,NULL,'4','3',0),(53,1,33,NULL,'2','1',1),(54,1,34,NULL,'3','0',2),(55,1,35,NULL,'0','1',2),(56,1,36,NULL,'3','2',3),(57,1,37,NULL,'4','0',3),(58,1,38,NULL,'2','2',1),(59,1,39,NULL,'1','0',2),(60,1,40,NULL,'0','0',0),(61,8,1,NULL,'3','0',3),(62,8,2,NULL,'2','1',2),(63,8,3,NULL,'2','2',5),(64,8,4,NULL,'4','5',2),(65,8,6,NULL,'0','0',0),(66,8,30,NULL,'1','2',1),(67,8,31,NULL,'2','1',1),(68,8,32,NULL,'3','2',1),(69,8,33,NULL,'2','3',0),(70,8,34,NULL,'0','2',3),(71,8,35,NULL,'2','0',3),(72,8,36,NULL,'1','0',2),(73,8,37,NULL,'1','1',1),(74,8,38,NULL,'0','1',2),(75,8,39,NULL,'2','2',0),(76,8,40,NULL,'0','1',2),(77,9,1,NULL,'2','2',1),(78,9,2,NULL,'1','1',0),(79,9,3,NULL,'2','3',1),(80,9,4,NULL,'1','0',3),(81,9,6,NULL,'0','1',2),(82,9,30,NULL,'0','0',2),(83,9,31,NULL,'1','1',2),(84,9,32,NULL,'1','1',2),(85,9,33,NULL,'1','0',1),(86,9,34,NULL,'0','1',5),(87,9,35,NULL,'1','2',3),(88,9,36,NULL,'2','2',1),(89,9,37,NULL,'2','1',2),(90,9,38,NULL,'0','1',2),(91,9,39,NULL,'0','0',0),(92,9,40,NULL,'0','1',2),(93,10,1,NULL,'1','1',0),(94,10,2,NULL,'1','2',3),(95,10,3,NULL,'4','3',0),(96,10,4,NULL,'1','3',5),(97,10,6,NULL,'2','2',1),(98,10,30,NULL,'0','1',1),(99,10,31,NULL,'2','1',1),(100,10,32,NULL,'4','2',1),(101,10,33,NULL,'3','2',0),(102,10,34,NULL,'2','3',2),(103,10,35,NULL,'0','1',2),(104,10,36,NULL,'0','0',1),(105,10,37,NULL,'2','1',2),(106,10,38,NULL,'1','2',5),(107,10,39,NULL,'2','3',2),(108,10,40,NULL,'1','1',0),(109,11,1,NULL,'1','2',2),(110,11,2,NULL,'2','3',2),(111,11,3,NULL,'0','0',2),(112,11,4,NULL,'0','1',2),(113,11,6,NULL,'2','2',1),(114,11,30,NULL,'2','0',0),(115,11,31,NULL,'0','1',0),(116,11,32,NULL,'1','2',1),(117,11,33,NULL,'1','2',1),(118,11,34,NULL,'2','1',3),(119,11,35,NULL,'3','3',0),(120,11,36,NULL,'4','2',3),(121,11,37,NULL,'4','3',2),(122,11,38,NULL,'1','3',3),(123,11,39,NULL,'2','2',0),(124,11,40,NULL,'3','3',1),(125,12,1,NULL,'1','2',2),(126,12,2,NULL,'1','1',0),(127,12,3,NULL,'1','0',0),(128,12,4,NULL,'2','2',0),(129,12,6,NULL,'1','2',5),(130,12,30,NULL,'5','0',0),(131,12,31,NULL,'2','2',5),(132,12,32,NULL,'3','5',0),(133,12,33,NULL,'3','0',0),(134,12,34,NULL,'2','1',3),(135,12,35,NULL,'5','3',2),(136,12,36,NULL,'4','2',3),(137,12,37,NULL,'1','3',3),(138,12,38,NULL,'2','2',1),(139,12,39,NULL,'4','6',3),(140,12,40,NULL,'2','2',0),(141,13,1,NULL,'0','0',1),(142,13,2,NULL,'2','1',2),(143,13,3,NULL,'1','0',0),(144,13,4,NULL,'2','2',0),(145,13,6,NULL,'1','0',3),(146,13,30,NULL,'4','2',0),(147,13,31,NULL,'3','3',2),(148,13,32,NULL,'1','0',0),(149,13,33,NULL,'2','0',0),(150,13,34,NULL,'2','4',2),(151,13,35,NULL,'2','1',2),(152,13,36,NULL,'2','2',1),(153,13,37,NULL,'1','2',3),(154,13,38,NULL,'1','3',3),(155,13,39,NULL,'1','2',2),(156,13,40,NULL,'1','5',2),(157,18,1,NULL,'4','4',0),(158,18,2,NULL,'1','1',0),(159,18,3,NULL,'2','2',5),(160,18,4,NULL,'3','0',2),(161,18,6,NULL,'1','0',3),(162,18,30,NULL,NULL,NULL,0),(163,18,31,NULL,NULL,NULL,0),(164,18,32,NULL,NULL,NULL,0),(165,18,33,NULL,NULL,NULL,0),(166,18,34,NULL,NULL,NULL,0),(167,18,35,NULL,NULL,NULL,0),(168,18,36,NULL,NULL,NULL,0),(169,18,37,NULL,NULL,NULL,0),(170,18,38,NULL,NULL,NULL,0),(171,18,39,NULL,NULL,NULL,0),(172,18,40,NULL,NULL,NULL,0),(173,19,1,NULL,'2','0',5),(174,19,2,NULL,'1','1',0),(175,19,3,NULL,'2','1',1),(176,19,4,NULL,'0','0',0),(177,19,6,NULL,'2','2',1),(178,19,30,NULL,NULL,NULL,0),(179,19,31,NULL,NULL,NULL,0),(180,19,32,NULL,NULL,NULL,0),(181,19,33,NULL,NULL,NULL,0),(182,19,34,NULL,NULL,NULL,0),(183,19,35,NULL,NULL,NULL,0),(184,19,36,NULL,NULL,NULL,0),(185,19,37,NULL,NULL,NULL,0),(186,19,38,NULL,NULL,NULL,0),(187,19,39,NULL,NULL,NULL,0),(188,19,40,NULL,NULL,NULL,0),(189,20,1,NULL,'4','2',2),(190,20,2,NULL,'2','4',2),(191,20,3,NULL,'1','1',2),(192,20,4,NULL,'1','1',1),(193,20,6,NULL,'1','0',3),(194,20,30,NULL,NULL,NULL,0),(195,20,31,NULL,NULL,NULL,0),(196,20,32,NULL,NULL,NULL,0),(197,20,33,NULL,NULL,NULL,0),(198,20,34,NULL,NULL,NULL,0),(199,20,35,NULL,NULL,NULL,0),(200,20,36,NULL,NULL,NULL,0),(201,20,37,NULL,NULL,NULL,0),(202,20,38,NULL,NULL,NULL,0),(203,20,39,NULL,NULL,NULL,0),(204,20,40,NULL,NULL,NULL,0),(205,21,1,NULL,'2','0',5),(206,21,2,NULL,'4','2',3),(207,21,3,NULL,'1','2',1),(208,21,4,NULL,'4','3',3),(209,21,6,NULL,'1','2',5),(210,21,30,NULL,NULL,NULL,0),(211,21,31,NULL,NULL,NULL,0),(212,21,32,NULL,NULL,NULL,0),(213,21,33,NULL,NULL,NULL,0),(214,21,34,NULL,NULL,NULL,0),(215,21,35,NULL,NULL,NULL,0),(216,21,36,NULL,NULL,NULL,0),(217,21,37,NULL,NULL,NULL,0),(218,21,38,NULL,NULL,NULL,0),(219,21,39,NULL,NULL,NULL,0),(220,21,40,NULL,NULL,NULL,0),(221,22,1,NULL,'1','2',2),(222,22,2,NULL,'3','4',3),(223,22,3,NULL,'5','0',0),(224,22,4,NULL,'1','1',1),(225,22,6,NULL,'1','2',5),(226,22,30,NULL,'2','2',2),(227,22,31,NULL,'2','3',1),(228,22,32,NULL,'3','3',2),(229,22,33,NULL,'0','2',0),(230,22,34,NULL,'3','4',2),(231,22,35,NULL,'4','4',0),(232,22,36,NULL,'0','0',1),(233,22,37,NULL,'1','3',3),(234,22,38,NULL,'5','1',2),(235,22,39,NULL,'4','2',3),(236,22,40,NULL,'2','0',2),(237,23,1,NULL,NULL,NULL,0),(238,23,2,NULL,NULL,NULL,0),(239,23,3,NULL,NULL,NULL,0),(240,23,4,NULL,NULL,NULL,0),(241,23,6,NULL,NULL,NULL,0),(242,23,30,NULL,NULL,NULL,0),(243,23,31,NULL,NULL,NULL,0),(244,23,32,NULL,NULL,NULL,0),(245,23,33,NULL,NULL,NULL,0),(246,23,34,NULL,NULL,NULL,0),(247,23,35,NULL,NULL,NULL,0),(248,23,36,NULL,NULL,NULL,0),(249,23,37,NULL,NULL,NULL,0),(250,23,38,NULL,NULL,NULL,0),(251,23,39,NULL,NULL,NULL,0),(252,23,40,NULL,NULL,NULL,0),(253,24,1,NULL,NULL,NULL,0),(254,24,2,NULL,NULL,NULL,0),(255,24,3,NULL,NULL,NULL,0),(256,24,4,NULL,NULL,NULL,0),(257,24,6,NULL,NULL,NULL,0),(258,24,30,NULL,NULL,NULL,0),(259,24,31,NULL,NULL,NULL,0),(260,24,32,NULL,NULL,NULL,0),(261,24,33,NULL,NULL,NULL,0),(262,24,34,NULL,NULL,NULL,0),(263,24,35,NULL,NULL,NULL,0),(264,24,36,NULL,NULL,NULL,0),(265,24,37,NULL,NULL,NULL,0),(266,24,38,NULL,NULL,NULL,0),(267,24,39,NULL,NULL,NULL,0),(268,24,40,NULL,NULL,NULL,0),(269,25,1,NULL,NULL,NULL,0),(270,25,2,NULL,NULL,NULL,0),(271,25,3,NULL,NULL,NULL,0),(272,25,4,NULL,NULL,NULL,0),(273,25,6,NULL,NULL,NULL,0),(274,25,30,NULL,NULL,NULL,0),(275,25,31,NULL,NULL,NULL,0),(276,25,32,NULL,NULL,NULL,0),(277,25,33,NULL,NULL,NULL,0),(278,25,34,NULL,NULL,NULL,0),(279,25,35,NULL,NULL,NULL,0),(280,25,36,NULL,NULL,NULL,0),(281,25,37,NULL,NULL,NULL,0),(282,25,38,NULL,NULL,NULL,0),(283,25,39,NULL,NULL,NULL,0),(284,25,40,NULL,NULL,NULL,0),(285,26,1,NULL,NULL,NULL,0),(286,26,2,NULL,NULL,NULL,0),(287,26,3,NULL,NULL,NULL,0),(288,26,4,NULL,NULL,NULL,0),(289,26,6,NULL,NULL,NULL,0),(290,26,30,NULL,NULL,NULL,0),(291,26,31,NULL,NULL,NULL,0),(292,26,32,NULL,NULL,NULL,0),(293,26,33,NULL,NULL,NULL,0),(294,26,34,NULL,NULL,NULL,0),(295,26,35,NULL,NULL,NULL,0),(296,26,36,NULL,NULL,NULL,0),(297,26,37,NULL,NULL,NULL,0),(298,26,38,NULL,NULL,NULL,0),(299,26,39,NULL,NULL,NULL,0),(300,26,40,NULL,NULL,NULL,0),(301,27,1,NULL,NULL,NULL,0),(302,27,2,NULL,NULL,NULL,0),(303,27,3,NULL,NULL,NULL,0),(304,27,4,NULL,NULL,NULL,0),(305,27,6,NULL,NULL,NULL,0),(306,27,30,NULL,NULL,NULL,0),(307,27,31,NULL,NULL,NULL,0),(308,27,32,NULL,NULL,NULL,0),(309,27,33,NULL,NULL,NULL,0),(310,27,34,NULL,NULL,NULL,0),(311,27,35,NULL,NULL,NULL,0),(312,27,36,NULL,NULL,NULL,0),(313,27,37,NULL,NULL,NULL,0),(314,27,38,NULL,NULL,NULL,0),(315,27,39,NULL,NULL,NULL,0),(316,27,40,NULL,NULL,NULL,0),(317,28,1,NULL,NULL,NULL,0),(318,28,2,NULL,NULL,NULL,0),(319,28,3,NULL,NULL,NULL,0),(320,28,4,NULL,NULL,NULL,0),(321,28,6,NULL,NULL,NULL,0),(322,28,30,NULL,NULL,NULL,0),(323,28,31,NULL,NULL,NULL,0),(324,28,32,NULL,NULL,NULL,0),(325,28,33,NULL,NULL,NULL,0),(326,28,34,NULL,NULL,NULL,0),(327,28,35,NULL,NULL,NULL,0),(328,28,36,NULL,NULL,NULL,0),(329,28,37,NULL,NULL,NULL,0),(330,28,38,NULL,NULL,NULL,0),(331,28,39,NULL,NULL,NULL,0),(332,28,40,NULL,NULL,NULL,0),(333,29,1,NULL,NULL,NULL,0),(334,29,2,NULL,NULL,NULL,0),(335,29,3,NULL,NULL,NULL,0),(336,29,4,NULL,NULL,NULL,0),(337,29,6,NULL,NULL,NULL,0),(338,29,30,NULL,NULL,NULL,0),(339,29,31,NULL,NULL,NULL,0),(340,29,32,NULL,NULL,NULL,0),(341,29,33,NULL,NULL,NULL,0),(342,29,34,NULL,NULL,NULL,0),(343,29,35,NULL,NULL,NULL,0),(344,29,36,NULL,NULL,NULL,0),(345,29,37,NULL,NULL,NULL,0),(346,29,38,NULL,NULL,NULL,0),(347,29,39,NULL,NULL,NULL,0),(348,29,40,NULL,NULL,NULL,0),(349,30,1,NULL,NULL,NULL,0),(350,30,2,NULL,NULL,NULL,0),(351,30,3,NULL,NULL,NULL,0),(352,30,4,NULL,NULL,NULL,0),(353,30,6,NULL,NULL,NULL,0),(354,30,30,NULL,NULL,NULL,0),(355,30,31,NULL,NULL,NULL,0),(356,30,32,NULL,NULL,NULL,0),(357,30,33,NULL,NULL,NULL,0),(358,30,34,NULL,NULL,NULL,0),(359,30,35,NULL,NULL,NULL,0),(360,30,36,NULL,NULL,NULL,0),(361,30,37,NULL,NULL,NULL,0),(362,30,38,NULL,NULL,NULL,0),(363,30,39,NULL,NULL,NULL,0),(364,30,40,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `palpite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partida`
--

DROP TABLE IF EXISTS `partida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_partida` int(11) NOT NULL,
  `local_id` int(11) NOT NULL,
  `dth_partida` datetime NOT NULL,
  `fase_id` int(11) NOT NULL,
  `equipe_1_id` int(11) NOT NULL,
  `equipe_2_id` int(11) NOT NULL,
  `qtd_gols_equipe_1` varchar(2) DEFAULT NULL,
  `qtd_gols_equipe_2` varchar(2) DEFAULT NULL,
  `grupo` varchar(10) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'A iniciar',
  PRIMARY KEY (`id`),
  KEY `fk_partida_1_idx` (`equipe_1_id`),
  KEY `frk_partida_equipe_2_id_idx` (`equipe_2_id`),
  KEY `fk_partida_1_idx1` (`local_id`),
  KEY `fk_partida_1_idx2` (`fase_id`),
  CONSTRAINT `frk_partida_equipe_1_id` FOREIGN KEY (`equipe_1_id`) REFERENCES `equipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `frk_partida_fase_id` FOREIGN KEY (`fase_id`) REFERENCES `fase` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `frk_partida_local_id` FOREIGN KEY (`local_id`) REFERENCES `local` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `partida_ibfk_1` FOREIGN KEY (`equipe_2_id`) REFERENCES `equipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partida`
--

LOCK TABLES `partida` WRITE;
/*!40000 ALTER TABLE `partida` DISABLE KEYS */;
INSERT INTO `partida` VALUES (1,1,2,'2013-06-15 16:00:00',1,1,2,'2','0','A','Em andamento'),(2,2,5,'2013-06-16 16:00:00',1,3,4,'3','2','A','Em andamento'),(3,3,4,'2013-06-16 19:00:00',1,5,6,'2','2','B','A iniciar'),(4,4,1,'2013-06-17 16:00:00',1,7,8,'1','3','B','Em andamento'),(6,5,3,'2013-06-19 16:00:00',2,1,3,'1','2','A','Em andamento'),(30,6,4,'2013-06-19 19:00:00',2,4,2,'1','1','A','Em andamento'),(31,7,5,'2013-06-20 16:00:00',2,5,7,'2','2','B','Em andamento'),(32,8,6,'2013-06-20 19:00:00',2,8,6,'2','2','B','Em andamento'),(33,9,6,'2013-06-22 16:00:00',3,4,1,'1','1','A','Em andamento'),(34,10,1,'2013-06-22 16:00:00',3,2,3,'0','1','A','Em andamento'),(35,11,3,'2013-06-23 16:00:00',3,8,5,'1','0','B','Em andamento'),(36,12,4,'2013-06-23 16:00:00',3,6,7,'0','2','B','Em andamento'),(37,13,1,'2013-06-26 16:00:00',4,9,12,'1','0','SEMI','Em andamento'),(38,14,3,'2013-06-27 16:00:00',4,11,10,'1','2','SEMI','Em andamento'),(39,15,6,'2013-06-30 13:00:00',5,14,16,'4','1','3º','Em andamento'),(40,16,5,'2013-06-30 19:00:00',5,13,15,'4','3','FINAL','Em andamento');
/*!40000 ALTER TABLE `partida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(250) NOT NULL,
  `papel` varchar(45) NOT NULL DEFAULT 'user',
  `contribuicao` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'leonardo@gmail.com','Leonardo','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','admin',50.00),(8,'magna@gmail.com','Magnamara','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(9,'raquel@gmail.com','Raquel','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(10,'fernanda@gmail.com','Fernanda','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(11,'izete@gmail.com','Izete','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(12,'waldenir@gmail.com','Waldenir','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(13,'tiago@gmail.com','Tiago','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(18,'joao@gmail.com','João Cândia','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(19,'carlos@gmail.com','Carlos','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(20,'fabio@gmail.com','Fábio','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(21,'danilo@gmail.com','Danilo','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(22,'usuario1@gmail.com','Usuario1','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(23,'usuario2@gmail.com','Usuario2','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(24,'usuario3@gmail.com','Usuario3','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(25,'usuario4@gmail.com','Usuario4','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(26,'usuario5@gmail.com','Usuario5','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(27,'usuario6@gmail.com','Usuario6','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(28,'usuario7@gmail.com','Usuario7','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(29,'usuario8@gmail.com','Usuario8','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00),(30,'usuario9@gmail.com','Usuario9','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','user',50.00);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-11 19:13:55
