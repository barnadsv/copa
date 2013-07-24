-- MySQL dump 10.13  Distrib 5.1.63, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: planilha_treino
-- ------------------------------------------------------
-- Server version	5.1.63-0ubuntu0.11.10.1

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `cod_administrador` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario` int(11) NOT NULL,
  PRIMARY KEY (`cod_administrador`),
  KEY `frk_administrador_cod_usuario` (`cod_usuario`),
  CONSTRAINT `frk_administrador_cod_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COMMENT='Usuários administradores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (22,1);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__administrador_ai 
after insert on administrador
for each row
begin
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'insert', now(), 'administrador', null, 'cod_administrador', null, cast(new.cod_administrador as char), null, null);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__administrador_au 
after update on administrador
for each row
begin

declare v_val_prk int(20);
declare v_cod_usuario_old int(20);
declare v_cod_usuario_new int(20);

set v_val_prk := old.cod_administrador;
set v_cod_usuario_old := old.cod_usuario;
set v_cod_usuario_new := new.cod_usuario;

if ifnull(v_cod_usuario_new,0) != ifnull(v_cod_usuario_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'administrador', v_val_prk, 'cod_usuario', cast(v_cod_usuario_old as char), cast(v_cod_usuario_new as char), null, null);
end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__administrador_ad
after delete on administrador
for each row
begin
declare v_val_prk int(20);
declare v_cod_usuario_old int(20);
set v_val_prk := old.cod_administrador;
set v_cod_usuario_old := old.cod_usuario;
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'administrador', v_val_prk, 'cod_administrador', cast(v_val_prk as char), null, null, null);
if ifnull(v_cod_usuario_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'administrador', v_val_prk, 'cod_usuario', cast(v_cod_usuario_old as char), null, null, null);
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `atleta`
--

DROP TABLE IF EXISTS `atleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atleta` (
  `cod_atleta` int(11) NOT NULL AUTO_INCREMENT,
  `cod_treinador` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  PRIMARY KEY (`cod_atleta`),
  KEY `frk_atleta_cod_treinador` (`cod_treinador`),
  KEY `frk_atleta_cod_usuario` (`cod_usuario`),
  CONSTRAINT `frk_atleta_cod_treinador` FOREIGN KEY (`cod_treinador`) REFERENCES `treinador` (`cod_treinador`),
  CONSTRAINT `frk_atleta_cod_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COMMENT='Usuários atletas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atleta`
--

LOCK TABLES `atleta` WRITE;
/*!40000 ALTER TABLE `atleta` DISABLE KEYS */;
INSERT INTO `atleta` VALUES (1,1,8),(4,1,9),(14,2,11),(15,2,10);
/*!40000 ALTER TABLE `atleta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__atleta_ai 
after insert on atleta
for each row
begin
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'insert', now(), 'atleta', null, 'cod_atleta', null, cast(new.cod_atleta as char), null, null);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__atleta_au 
after update on atleta
for each row
begin

declare v_val_prk int(20);
declare v_cod_usuario_old int(20);
declare v_cod_usuario_new int(20);
declare v_cod_treinador_old int(20);
declare v_cod_treinador_new int(20);

set v_val_prk := old.cod_atleta;
set v_cod_usuario_old := old.cod_usuario;
set v_cod_usuario_new := new.cod_usuario;
set v_cod_treinador_old := old.cod_treinador;
set v_cod_treinador_new := new.cod_treinador;

if ifnull(v_cod_usuario_new,0) != ifnull(v_cod_usuario_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'atleta', v_val_prk, 'cod_usuario', cast(v_cod_usuario_old as char), cast(v_cod_usuario_new as char), null, null);
end if;
if ifnull(v_cod_treinador_new,0) != ifnull(v_cod_treinador_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'atleta', v_val_prk, 'cod_treinador', cast(v_cod_treinador_old as char), cast(v_cod_treinador_new as char), null, null);
end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__atleta_ad
after delete on atleta
for each row
begin
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'atleta', null, 'cod_atleta', cast(old.cod_atleta as char), null, null, null);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `exercicio`
--

DROP TABLE IF EXISTS `exercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercicio` (
  `cod_exercicio` int(11) NOT NULL AUTO_INCREMENT,
  `cod_tipo_exercicio` int(11) NOT NULL,
  `cod_grupo_muscular` int(11) NOT NULL,
  `nom_exercicio` varchar(255) NOT NULL,
  `des_exercicio` text NOT NULL,
  PRIMARY KEY (`cod_exercicio`),
  KEY `frk_exerc_cod_tipo_exercicio` (`cod_tipo_exercicio`),
  KEY `frk_exerc_cod_grupo_muscular` (`cod_grupo_muscular`),
  CONSTRAINT `frk_exerc_cod_grupo_muscular` FOREIGN KEY (`cod_grupo_muscular`) REFERENCES `grupo_muscular` (`cod_grupo_muscular`),
  CONSTRAINT `frk_exerc_cod_tipo_exercicio` FOREIGN KEY (`cod_tipo_exercicio`) REFERENCES `tipo_exercicio` (`cod_tipo_exercicio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercicio`
--

LOCK TABLES `exercicio` WRITE;
/*!40000 ALTER TABLE `exercicio` DISABLE KEYS */;
INSERT INTO `exercicio` VALUES (1,1,1,'Trote','');
/*!40000 ALTER TABLE `exercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercicio_modelo`
--

DROP TABLE IF EXISTS `exercicio_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercicio_modelo` (
  `cod_exercicio_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario` int(11) DEFAULT NULL,
  `cod_tipo_exercicio_modelo` int(11) NOT NULL,
  `cod_grupo_muscular_modelo` int(11) NOT NULL,
  `nom_exercicio_modelo` varchar(255) NOT NULL,
  `des_exercicio_modelo` text,
  PRIMARY KEY (`cod_exercicio_modelo`),
  KEY `frk_exerc_modelo_cod_tipo_exercicio` (`cod_tipo_exercicio_modelo`),
  KEY `frk_exerc_modelo_cod_grupo_muscular` (`cod_grupo_muscular_modelo`),
  KEY `frk_exerc_modelo_cod_usuario` (`cod_usuario`),
  CONSTRAINT `frk_exerc_modelo_cod_grupo_muscular_modelo` FOREIGN KEY (`cod_grupo_muscular_modelo`) REFERENCES `grupo_muscular_modelo` (`cod_grupo_muscular_modelo`),
  CONSTRAINT `frk_exerc_modelo_cod_tipo_exercicio_modelo` FOREIGN KEY (`cod_tipo_exercicio_modelo`) REFERENCES `tipo_exercicio_modelo` (`cod_tipo_exercicio_modelo`),
  CONSTRAINT `frk_exerc_modelo_cod_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercicio_modelo`
--

LOCK TABLES `exercicio_modelo` WRITE;
/*!40000 ALTER TABLE `exercicio_modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercicio_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercicio_sessao`
--

DROP TABLE IF EXISTS `exercicio_sessao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercicio_sessao` (
  `cod_exercicio_sessao` int(11) NOT NULL AUTO_INCREMENT,
  `cod_exercicio` int(11) NOT NULL,
  `cod_sessao` int(11) NOT NULL,
  `nom_exercicio_sessao` varchar(255) DEFAULT NULL,
  `num_ordem_exercicio` int(11) NOT NULL,
  `tipo_serie` varchar(255) NOT NULL COMMENT 'Verificar...',
  `qtd_tempo_pedido` time NOT NULL,
  `qtd_tempo_realizado` time NOT NULL,
  `qtd_tempo_realizado_parametrizado` time NOT NULL,
  `qtd_repeticao_pedida` int(11) NOT NULL,
  `qtd_repeticao_realizada` int(11) NOT NULL,
  `qtd_distancia_km_pedida` float NOT NULL,
  `qtd_distancia_km_realizada` float NOT NULL,
  `tmp_ritmo_pedido` time NOT NULL,
  `tmp_ritmo_realizado` time NOT NULL,
  `cod_intensidade_fc_pedida` int(20) DEFAULT NULL,
  `num_fc_realizada` int(3) NOT NULL,
  `qtd_carga_pedida` float NOT NULL,
  `qtd_carga_realizada` float NOT NULL,
  `ind_executado` tinyint(1) NOT NULL,
  `qtd_pontos` float NOT NULL,
  PRIMARY KEY (`cod_exercicio_sessao`),
  UNIQUE KEY `nom_exercicio_sessao_UNIQUE` (`nom_exercicio_sessao`),
  KEY `frk_exerc_sess_cod_exercicio` (`cod_exercicio`),
  KEY `frk_exerc_sess_cod_sessao` (`cod_sessao`),
  CONSTRAINT `frk_exerc_sess_cod_exercicio` FOREIGN KEY (`cod_exercicio`) REFERENCES `exercicio` (`cod_exercicio`),
  CONSTRAINT `frk_exerc_sess_cod_sessao` FOREIGN KEY (`cod_sessao`) REFERENCES `sessao` (`cod_sessao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='O exercício feito em uma determinada sessão.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercicio_sessao`
--

LOCK TABLES `exercicio_sessao` WRITE;
/*!40000 ALTER TABLE `exercicio_sessao` DISABLE KEYS */;
INSERT INTO `exercicio_sessao` VALUES (1,1,1,'Trote inicial',1,'','00:00:00','00:00:00','00:00:00',0,0,0,0,'00:00:00','00:00:00',NULL,0,0,0,0,0);
/*!40000 ALTER TABLE `exercicio_sessao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercicio_sessao_modelo`
--

DROP TABLE IF EXISTS `exercicio_sessao_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercicio_sessao_modelo` (
  `cod_exercicio_sessao_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario` int(11) DEFAULT NULL,
  `cod_exercicio_modelo` int(11) NOT NULL,
  `cod_sessao_modelo` int(11) DEFAULT NULL,
  `nom_exercicio_sessao_modelo` varchar(255) DEFAULT NULL,
  `num_ordem_exercicio` int(11) DEFAULT NULL,
  `tipo_serie` varchar(255) DEFAULT NULL COMMENT 'Verificar...',
  `qtd_tempo_pedido` time DEFAULT NULL,
  `qtd_tempo_realizado` time DEFAULT NULL,
  `qtd_tempo_realizado_parametrizado` time DEFAULT NULL,
  `qtd_repeticao_pedida` int(11) DEFAULT NULL,
  `qtd_repeticao_realizada` int(11) DEFAULT NULL,
  `qtd_distancia_km_pedida` float DEFAULT NULL,
  `qtd_distancia_km_realizada` float DEFAULT NULL,
  `tmp_ritmo_pedido` time DEFAULT NULL,
  `tmp_ritmo_realizado` time DEFAULT NULL,
  `cod_intensidade_fc_pedida` int(20) DEFAULT NULL,
  `num_fc_realizada` int(11) DEFAULT NULL,
  `qtd_carga_pedida` float DEFAULT NULL,
  `qtd_carga_realizada` float DEFAULT NULL,
  `ind_executado` tinyint(1) DEFAULT NULL,
  `qtd_pontos` float DEFAULT NULL,
  PRIMARY KEY (`cod_exercicio_sessao_modelo`),
  KEY `frk_exerc_sess_modelo_cod_exercicio` (`cod_exercicio_modelo`),
  KEY `frk_exerc_sess_modelo_cod_sessao` (`cod_sessao_modelo`),
  KEY `frk_exerc_sess_modelo_cod_usuario` (`cod_usuario`),
  CONSTRAINT `frk_exerc_sess_modelo_cod_exercicio_modelo` FOREIGN KEY (`cod_exercicio_modelo`) REFERENCES `exercicio_modelo` (`cod_exercicio_modelo`),
  CONSTRAINT `frk_exerc_sess_modelo_cod_sessao_modelo` FOREIGN KEY (`cod_sessao_modelo`) REFERENCES `sessao_modelo` (`cod_sessao_modelo`),
  CONSTRAINT `frk_exerc_sess_modelo_cod_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Modelo de exercício feito em uma determinada sessão.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercicio_sessao_modelo`
--

LOCK TABLES `exercicio_sessao_modelo` WRITE;
/*!40000 ALTER TABLE `exercicio_sessao_modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercicio_sessao_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frequencimetro`
--

DROP TABLE IF EXISTS `frequencimetro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequencimetro` (
  `cod_frequencimetro` int(11) NOT NULL AUTO_INCREMENT,
  `cod_atleta` int(11) NOT NULL,
  `nom_marca` varchar(255) NOT NULL,
  `nom_modelo` varchar(255) NOT NULL,
  `tip_interface` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cod_frequencimetro`),
  KEY `frk_frequencimetro_cod_atleta` (`cod_atleta`),
  CONSTRAINT `frk_frequencimetro_cod_atleta` FOREIGN KEY (`cod_atleta`) REFERENCES `atleta` (`cod_atleta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequencimetro`
--

LOCK TABLES `frequencimetro` WRITE;
/*!40000 ALTER TABLE `frequencimetro` DISABLE KEYS */;
INSERT INTO `frequencimetro` VALUES (1,1,'POLAR','R38',NULL);
/*!40000 ALTER TABLE `frequencimetro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerente`
--

DROP TABLE IF EXISTS `gerente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gerente` (
  `cod_gerente` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario` int(11) NOT NULL,
  PRIMARY KEY (`cod_gerente`),
  KEY `frk_gerente_cod_usuario` (`cod_usuario`),
  CONSTRAINT `frk_gerente_cod_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Usuários gerentes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerente`
--

LOCK TABLES `gerente` WRITE;
/*!40000 ALTER TABLE `gerente` DISABLE KEYS */;
INSERT INTO `gerente` VALUES (1,2),(2,3);
/*!40000 ALTER TABLE `gerente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__gerente_ai 
after insert on gerente
for each row
begin
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'insert', now(), 'gerente', null, 'cod_gerente', null, cast(new.cod_gerente as char), null, null);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__gerente_au 
after update on gerente
for each row
begin
declare v_val_prk int(20);
declare v_cod_usuario_old int(20);
declare v_cod_usuario_new int(20);
set v_val_prk := old.cod_gerente;
set v_cod_usuario_old := old.cod_usuario;
set v_cod_usuario_new := new.cod_usuario;
if ifnull(v_cod_usuario_new,0) != ifnull(v_cod_usuario_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'gerente', v_val_prk, 'cod_usuario', cast(v_cod_usuario_old as char), cast(v_cod_usuario_new as char), null, null);
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__gerente_ad
after delete on gerente
for each row
begin
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'gerente', null, 'cod_gerente', cast(old.cod_gerente as char), null, null, null);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `grupo_muscular`
--

DROP TABLE IF EXISTS `grupo_muscular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_muscular` (
  `cod_grupo_muscular` int(11) NOT NULL AUTO_INCREMENT,
  `nom_grupo_muscular` varchar(255) NOT NULL,
  `des_grupo_muscular` text NOT NULL,
  PRIMARY KEY (`cod_grupo_muscular`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_muscular`
--

LOCK TABLES `grupo_muscular` WRITE;
/*!40000 ALTER TABLE `grupo_muscular` DISABLE KEYS */;
INSERT INTO `grupo_muscular` VALUES (1,'Panturrilha',''),(2,'Quadríceps','');
/*!40000 ALTER TABLE `grupo_muscular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_muscular_modelo`
--

DROP TABLE IF EXISTS `grupo_muscular_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_muscular_modelo` (
  `cod_grupo_muscular_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario` int(11) DEFAULT NULL,
  `nom_grupo_muscular_modelo` varchar(255) NOT NULL,
  `des_grupo_muscular_modelo` text,
  PRIMARY KEY (`cod_grupo_muscular_modelo`),
  KEY `frk_grupo_muscular_modelo_cod_usuario` (`cod_usuario`),
  CONSTRAINT `frk_grupo_muscular_modelo_cod_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_muscular_modelo`
--

LOCK TABLES `grupo_muscular_modelo` WRITE;
/*!40000 ALTER TABLE `grupo_muscular_modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_muscular_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `cod_log` int(20) NOT NULL AUTO_INCREMENT,
  `nom_usuario` varchar(100) DEFAULT NULL,
  `num_ip` varchar(50) DEFAULT NULL,
  `num_id_conexao` int(20) DEFAULT NULL,
  `nom_acao` varchar(100) DEFAULT NULL,
  `dth_acao` datetime DEFAULT NULL,
  `nom_tabela` varchar(50) DEFAULT NULL,
  `num_val_prk` int(20) DEFAULT NULL,
  `nom_campo` varchar(50) DEFAULT NULL,
  `old_txt_value` text,
  `new_txt_value` text,
  `old_blob_value` blob,
  `new_blob_value` blob,
  PRIMARY KEY (`cod_log`)
) ENGINE=InnoDB AUTO_INCREMENT=4552 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (4043,'usuario22','127.0.0.1',305,'Update - Inicio','2011-09-05 20:17:35','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4044,NULL,NULL,305,'update','2011-09-05 20:17:35','microciclo',114,'nom_microciclo','Micro 25','Micro 26',NULL,NULL),(4045,'usuario22','127.0.0.1',305,'Update - Fim','2011-09-05 20:17:35','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4046,'usuario22','127.0.0.1',309,'Update - Inicio','2011-09-05 20:17:45','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4047,NULL,NULL,309,'update','2011-09-05 20:17:45','microciclo',32,'nom_microciclo','Micro 24','Micro 25',NULL,NULL),(4048,'usuario22','127.0.0.1',309,'Update - Fim','2011-09-05 20:17:45','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4049,'usuario22','127.0.0.1',313,'Update - Inicio','2011-09-05 20:17:54','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4050,NULL,NULL,313,'update','2011-09-05 20:17:54','microciclo',31,'nom_microciclo','Micro 23','Micro 24',NULL,NULL),(4051,'usuario22','127.0.0.1',313,'Update - Fim','2011-09-05 20:17:54','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4052,'usuario22','127.0.0.1',317,'Update - Inicio','2011-09-05 20:18:07','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4053,NULL,NULL,317,'update','2011-09-05 20:18:07','microciclo',115,'nom_microciclo','teste','Micro',NULL,NULL),(4054,'usuario22','127.0.0.1',317,'Update - Fim','2011-09-05 20:18:07','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4055,'usuario22','127.0.0.1',321,'Update - Inicio','2011-09-05 20:18:17','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4056,NULL,NULL,321,'update','2011-09-05 20:18:17','microciclo',115,'nom_microciclo','Micro','Micro 23',NULL,NULL),(4057,'usuario22','127.0.0.1',321,'Update - Fim','2011-09-05 20:18:17','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4058,NULL,NULL,326,'update','2011-09-05 20:19:02','microciclo',32,'num_ordem_microciclo','25','26',NULL,NULL),(4059,NULL,NULL,326,'update','2011-09-05 20:19:02','microciclo',32,'dat_inicio','2012-02-13','2012-02-20',NULL,NULL),(4060,NULL,NULL,326,'update','2011-09-05 20:19:02','microciclo',32,'dat_fim','2012-02-19','2012-02-26',NULL,NULL),(4061,NULL,NULL,326,'update','2011-09-05 20:19:02','microciclo',114,'num_ordem_microciclo','26','27',NULL,NULL),(4062,NULL,NULL,326,'update','2011-09-05 20:19:02','microciclo',114,'dat_inicio','2012-02-20','2012-02-27',NULL,NULL),(4063,NULL,NULL,326,'update','2011-09-05 20:19:02','microciclo',114,'dat_fim','2012-02-26','2012-03-04',NULL,NULL),(4064,'usuario22','127.0.0.1',326,'Insert - Inicio','2011-09-05 20:19:02','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4065,NULL,NULL,326,'insert','2011-09-05 20:19:02','microciclo',NULL,'cod_microciclo',NULL,'116',NULL,NULL),(4066,NULL,NULL,326,'update','2011-09-05 20:19:02','mesociclo',17,'qtd_microciclos_mesociclo','6','7',NULL,NULL),(4067,NULL,NULL,326,'update','2011-09-05 20:19:02','macrociclo',21,'qtd_microciclos_macrociclo','26','27',NULL,NULL),(4068,NULL,NULL,326,'update','2011-09-05 20:19:02','macrociclo',21,'dat_fim','2012-02-05','2012-02-19',NULL,NULL),(4069,'usuario22','127.0.0.1',326,'Insert - Fim','2011-09-05 20:19:02','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4070,'usuario22','127.0.0.1',353,'Delete - Inicio','2011-09-05 20:27:42','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4071,'usuario22','127.0.0.1',353,'Delete - Inicio','2011-09-05 20:27:42','treino',NULL,NULL,NULL,NULL,NULL,NULL),(4072,'usuario22','127.0.0.1',353,'Delete - Fim','2011-09-05 20:27:42','treino',NULL,NULL,NULL,NULL,NULL,NULL),(4073,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'cod_microciclo','114',NULL,NULL,NULL),(4074,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'cod_mesociclo','17',NULL,NULL,NULL),(4075,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'nom_microciclo','Micro 26',NULL,NULL,NULL),(4076,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'num_ordem_microciclo','27',NULL,NULL,NULL),(4077,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'dat_inicio','2012-02-27',NULL,NULL,NULL),(4078,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'dat_fim','2012-03-04',NULL,NULL,NULL),(4079,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'qtd_carga_kg_total','0',NULL,NULL,NULL),(4080,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'qtd_distancia_km_total','0',NULL,NULL,NULL),(4081,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'qtd_tempo_total','00:00:00',NULL,NULL,NULL),(4082,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'num_fc_le_minima','0',NULL,NULL,NULL),(4083,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'num_fc_le_maxima','0',NULL,NULL,NULL),(4084,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'tmp_ritmo_le','00:00:00',NULL,NULL,NULL),(4085,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'num_fc_mo_minima','0',NULL,NULL,NULL),(4086,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'num_fc_mo_maxima','0',NULL,NULL,NULL),(4087,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'tmp_ritmo_mo','00:00:00',NULL,NULL,NULL),(4088,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'num_fc_fo_minima','0',NULL,NULL,NULL),(4089,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'num_fc_fo_maxima','0',NULL,NULL,NULL),(4090,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'tmp_ritmo_fo','00:00:00',NULL,NULL,NULL),(4091,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'qtd_pontos_microciclo','0',NULL,NULL,NULL),(4092,NULL,NULL,353,'delete','2011-09-05 20:27:42','microciclo',114,'ind_executado','0',NULL,NULL,NULL),(4093,NULL,NULL,353,'update','2011-09-05 20:27:42','mesociclo',17,'qtd_microciclos_mesociclo','7','6',NULL,NULL),(4094,NULL,NULL,353,'update','2011-09-05 20:27:42','macrociclo',21,'qtd_microciclos_macrociclo','27','26',NULL,NULL),(4095,'usuario22','127.0.0.1',353,'Delete - Fim','2011-09-05 20:27:42','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4123,'usuario22','127.0.0.1',382,'Delete - Inicio','2011-09-05 20:34:22','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4124,'usuario22','127.0.0.1',382,'Delete - Inicio','2011-09-05 20:34:22','treino',NULL,NULL,NULL,NULL,NULL,NULL),(4125,'usuario22','127.0.0.1',382,'Delete - Fim','2011-09-05 20:34:22','treino',NULL,NULL,NULL,NULL,NULL,NULL),(4126,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'cod_microciclo','116',NULL,NULL,NULL),(4127,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'cod_mesociclo','17',NULL,NULL,NULL),(4128,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'nom_microciclo','Micro inserido',NULL,NULL,NULL),(4129,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'num_ordem_microciclo','25',NULL,NULL,NULL),(4130,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'dat_inicio','2012-02-13',NULL,NULL,NULL),(4131,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'dat_fim','2012-02-19',NULL,NULL,NULL),(4132,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'qtd_carga_kg_total','0',NULL,NULL,NULL),(4133,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'qtd_distancia_km_total','0',NULL,NULL,NULL),(4134,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'qtd_tempo_total','00:00:00',NULL,NULL,NULL),(4135,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'num_fc_le_minima','0',NULL,NULL,NULL),(4136,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'num_fc_le_maxima','0',NULL,NULL,NULL),(4137,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'tmp_ritmo_le','00:00:00',NULL,NULL,NULL),(4138,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'num_fc_mo_minima','0',NULL,NULL,NULL),(4139,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'num_fc_mo_maxima','0',NULL,NULL,NULL),(4140,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'tmp_ritmo_mo','00:00:00',NULL,NULL,NULL),(4141,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'num_fc_fo_minima','0',NULL,NULL,NULL),(4142,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'num_fc_fo_maxima','0',NULL,NULL,NULL),(4143,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'tmp_ritmo_fo','00:00:00',NULL,NULL,NULL),(4144,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'qtd_pontos_microciclo','0',NULL,NULL,NULL),(4145,NULL,NULL,382,'delete','2011-09-05 20:34:22','microciclo',116,'ind_executado','0',NULL,NULL,NULL),(4146,NULL,NULL,382,'update','2011-09-05 20:34:22','mesociclo',17,'qtd_microciclos_mesociclo','6','5',NULL,NULL),(4147,NULL,NULL,382,'update','2011-09-05 20:34:22','macrociclo',21,'qtd_microciclos_macrociclo','26','25',NULL,NULL),(4148,NULL,NULL,382,'update','2011-09-05 20:34:22','microciclo',32,'num_ordem_microciclo','26','25',NULL,NULL),(4149,NULL,NULL,382,'update','2011-09-05 20:34:22','microciclo',32,'dat_inicio','2012-02-20','2012-02-13',NULL,NULL),(4150,NULL,NULL,382,'update','2011-09-05 20:34:22','microciclo',32,'dat_fim','2012-02-26','2012-02-19',NULL,NULL),(4151,'usuario22','127.0.0.1',382,'Delete - Fim','2011-09-05 20:34:22','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4152,'usuario22','127.0.0.1',386,'Delete - Inicio','2011-09-05 20:34:40','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4153,'usuario22','127.0.0.1',386,'Delete - Inicio','2011-09-05 20:34:40','treino',NULL,NULL,NULL,NULL,NULL,NULL),(4154,'usuario22','127.0.0.1',386,'Delete - Fim','2011-09-05 20:34:40','treino',NULL,NULL,NULL,NULL,NULL,NULL),(4155,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'cod_microciclo','31',NULL,NULL,NULL),(4156,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'cod_mesociclo','17',NULL,NULL,NULL),(4157,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'nom_microciclo','Micro 24',NULL,NULL,NULL),(4158,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'num_ordem_microciclo','24',NULL,NULL,NULL),(4159,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'dat_inicio','2012-02-06',NULL,NULL,NULL),(4160,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'dat_fim','2012-02-12',NULL,NULL,NULL),(4161,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'qtd_carga_kg_total','0',NULL,NULL,NULL),(4162,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'qtd_distancia_km_total','0',NULL,NULL,NULL),(4163,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'qtd_tempo_total','00:00:00',NULL,NULL,NULL),(4164,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'num_fc_le_minima','0',NULL,NULL,NULL),(4165,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'num_fc_le_maxima','0',NULL,NULL,NULL),(4166,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'tmp_ritmo_le','00:00:00',NULL,NULL,NULL),(4167,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'num_fc_mo_minima','0',NULL,NULL,NULL),(4168,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'num_fc_mo_maxima','0',NULL,NULL,NULL),(4169,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'tmp_ritmo_mo','00:00:00',NULL,NULL,NULL),(4170,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'num_fc_fo_minima','0',NULL,NULL,NULL),(4171,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'num_fc_fo_maxima','0',NULL,NULL,NULL),(4172,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'tmp_ritmo_fo','00:00:00',NULL,NULL,NULL),(4173,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'qtd_pontos_microciclo','50',NULL,NULL,NULL),(4174,NULL,NULL,386,'update','2011-09-05 20:34:40','mesociclo',17,'qtd_pontos_mesociclo','215','165',NULL,NULL),(4175,NULL,NULL,386,'update','2011-09-05 20:34:40','macrociclo',21,'qtd_pontos_macrociclo','1631','1581',NULL,NULL),(4176,NULL,NULL,386,'delete','2011-09-05 20:34:40','microciclo',31,'ind_executado','0',NULL,NULL,NULL),(4177,NULL,NULL,386,'update','2011-09-05 20:34:40','mesociclo',17,'qtd_microciclos_mesociclo','5','4',NULL,NULL),(4178,NULL,NULL,386,'update','2011-09-05 20:34:40','macrociclo',21,'qtd_microciclos_macrociclo','25','24',NULL,NULL),(4179,NULL,NULL,386,'update','2011-09-05 20:34:40','microciclo',32,'num_ordem_microciclo','25','24',NULL,NULL),(4180,NULL,NULL,386,'update','2011-09-05 20:34:40','microciclo',32,'dat_inicio','2012-02-13','2012-02-06',NULL,NULL),(4181,NULL,NULL,386,'update','2011-09-05 20:34:40','microciclo',32,'dat_fim','2012-02-19','2012-02-12',NULL,NULL),(4182,'usuario22','127.0.0.1',386,'Delete - Fim','2011-09-05 20:34:40','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4183,'usuario22','127.0.0.1',390,'Update - Inicio','2011-09-05 20:35:01','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4184,NULL,NULL,390,'update','2011-09-05 20:35:01','microciclo',32,'nom_microciclo','Micro 25','Micro 24',NULL,NULL),(4185,'usuario22','127.0.0.1',390,'Update - Fim','2011-09-05 20:35:01','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4186,'usuario22','127.0.0.1',503,'Insert - Inicio','2011-09-06 01:03:38','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4187,NULL,NULL,503,'insert','2011-09-06 01:03:38','microciclo',NULL,'cod_microciclo',NULL,'117',NULL,NULL),(4188,NULL,NULL,503,'update','2011-09-06 01:03:38','mesociclo',17,'qtd_microciclos_mesociclo','4','5',NULL,NULL),(4189,NULL,NULL,503,'update','2011-09-06 01:03:38','macrociclo',21,'qtd_microciclos_macrociclo','24','25',NULL,NULL),(4190,'usuario22','127.0.0.1',503,'Insert - Fim','2011-09-06 01:03:38','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4191,'usuario22','127.0.0.1',508,'Insert - Inicio','2011-09-06 01:08:06','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4192,NULL,NULL,508,'insert','2011-09-06 01:08:07','microciclo',NULL,'cod_microciclo',NULL,'118',NULL,NULL),(4193,NULL,NULL,508,'update','2011-09-06 01:08:07','mesociclo',17,'qtd_microciclos_mesociclo','5','6',NULL,NULL),(4194,NULL,NULL,508,'update','2011-09-06 01:08:07','macrociclo',21,'qtd_microciclos_macrociclo','25','26',NULL,NULL),(4195,NULL,NULL,508,'update','2011-09-06 01:08:07','macrociclo',21,'dat_fim','2012-02-19','2012-02-26',NULL,NULL),(4196,'usuario22','127.0.0.1',508,'Insert - Fim','2011-09-06 01:08:07','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4197,'usuario22','127.0.0.1',1069,'Update - Inicio','2011-09-10 11:54:21','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4198,NULL,NULL,1069,'update','2011-09-10 11:54:22','microciclo',11,'nom_microciclo','Nicro 8','Micro 8',NULL,NULL),(4199,NULL,NULL,1069,'update','2011-09-10 11:54:22','microciclo',11,'tmp_ritmo_le',NULL,'00:00:00',NULL,NULL),(4200,NULL,NULL,1069,'update','2011-09-10 11:54:22','microciclo',11,'tmp_ritmo_mo',NULL,'00:00:00',NULL,NULL),(4201,NULL,NULL,1069,'update','2011-09-10 11:54:22','microciclo',11,'tmp_ritmo_fo',NULL,'00:00:00',NULL,NULL),(4202,'usuario22','127.0.0.1',1069,'Update - Fim','2011-09-10 11:54:22','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4203,NULL,NULL,2154,'insert','2011-09-10 21:52:24','treino',NULL,'cod_treino',NULL,'4',NULL,NULL),(4204,NULL,NULL,2154,'insert','2011-09-10 21:52:24','treino',NULL,'cod_treino',NULL,'3',NULL,NULL),(4205,NULL,NULL,2154,'insert','2011-09-10 21:52:24','treino',NULL,'cod_treino',NULL,'2',NULL,NULL),(4206,NULL,NULL,2303,'insert','2011-09-11 00:55:48','treino',NULL,'cod_treino',NULL,'7',NULL,NULL),(4207,NULL,NULL,2303,'insert','2011-09-11 00:55:48','treino',NULL,'cod_treino',NULL,'6',NULL,NULL),(4208,NULL,NULL,2303,'insert','2011-09-11 00:55:48','treino',NULL,'cod_treino',NULL,'5',NULL,NULL),(4209,NULL,NULL,2308,'insert','2011-09-11 00:59:05','treino',NULL,'cod_treino',NULL,'8',NULL,NULL),(4210,'usuario1','127.0.0.1',2724,'Insert - Inicio','2011-09-16 23:59:20','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4211,NULL,NULL,2724,'insert','2011-09-16 23:59:20','administrador',NULL,'cod_administrador',NULL,'9',NULL,NULL),(4212,'usuario1','127.0.0.1',2724,'Insert - Fim','2011-09-16 23:59:20','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4213,NULL,NULL,2726,'delete','2011-09-17 08:05:11','administrador',9,'cod_administrador','9',NULL,NULL,NULL),(4214,NULL,NULL,2726,'delete','2011-09-17 08:05:11','administrador',9,'cod_usuario','11',NULL,NULL,NULL),(4215,'usuario1','127.0.0.1',2746,'Insert - Inicio','2011-09-17 08:06:14','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4216,NULL,NULL,2746,'insert','2011-09-17 08:06:14','administrador',NULL,'cod_administrador',NULL,'10',NULL,NULL),(4217,'usuario1','127.0.0.1',2746,'Insert - Fim','2011-09-17 08:06:39','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4218,NULL,NULL,2783,'delete','2011-09-17 08:54:24','administrador',10,'cod_administrador','10',NULL,NULL,NULL),(4219,NULL,NULL,2783,'delete','2011-09-17 08:54:24','administrador',10,'cod_usuario','11',NULL,NULL,NULL),(4220,'usuario1','127.0.0.1',2799,'Insert - Inicio','2011-09-17 08:55:42','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4221,NULL,NULL,2799,'insert','2011-09-17 08:55:43','administrador',NULL,'cod_administrador',NULL,'11',NULL,NULL),(4222,'usuario1','127.0.0.1',2799,'Insert - Fim','2011-09-17 08:55:46','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4223,NULL,NULL,2801,'delete','2011-09-17 08:58:43','administrador',11,'cod_administrador','11',NULL,NULL,NULL),(4224,NULL,NULL,2801,'delete','2011-09-17 08:58:43','administrador',11,'cod_usuario','11',NULL,NULL,NULL),(4225,'usuario1','127.0.0.1',2824,'Insert - Inicio','2011-09-17 09:02:08','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4226,NULL,NULL,2824,'insert','2011-09-17 09:02:08','administrador',NULL,'cod_administrador',NULL,'12',NULL,NULL),(4227,'usuario1','127.0.0.1',2824,'Insert - Fim','2011-09-17 09:02:08','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4228,NULL,NULL,2844,'delete','2011-09-17 09:03:42','administrador',12,'cod_administrador','12',NULL,NULL,NULL),(4229,NULL,NULL,2844,'delete','2011-09-17 09:03:42','administrador',12,'cod_usuario','11',NULL,NULL,NULL),(4230,'usuario1','127.0.0.1',2846,'Insert - Inicio','2011-09-17 09:03:50','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4231,NULL,NULL,2846,'insert','2011-09-17 09:03:50','administrador',NULL,'cod_administrador',NULL,'13',NULL,NULL),(4232,'usuario1','127.0.0.1',2846,'Insert - Fim','2011-09-17 09:03:50','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4233,NULL,NULL,2848,'delete','2011-09-17 09:04:17','administrador',13,'cod_administrador','13',NULL,NULL,NULL),(4234,NULL,NULL,2848,'delete','2011-09-17 09:04:17','administrador',13,'cod_usuario','11',NULL,NULL,NULL),(4235,'usuario1','127.0.0.1',2885,'Insert - Inicio','2011-09-17 09:08:24','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4236,NULL,NULL,2885,'insert','2011-09-17 09:08:24','administrador',NULL,'cod_administrador',NULL,'14',NULL,NULL),(4237,'usuario1','127.0.0.1',2885,'Insert - Fim','2011-09-17 09:08:24','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4238,NULL,NULL,2887,'delete','2011-09-17 09:08:54','administrador',14,'cod_administrador','14',NULL,NULL,NULL),(4239,NULL,NULL,2887,'delete','2011-09-17 09:08:54','administrador',14,'cod_usuario','11',NULL,NULL,NULL),(4240,'usuario1','127.0.0.1',2908,'Insert - Inicio','2011-09-17 09:10:20','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4241,NULL,NULL,2908,'insert','2011-09-17 09:10:20','administrador',NULL,'cod_administrador',NULL,'15',NULL,NULL),(4242,'usuario1','127.0.0.1',2908,'Insert - Fim','2011-09-17 09:10:20','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4243,NULL,NULL,2910,'delete','2011-09-17 09:10:51','administrador',15,'cod_administrador','15',NULL,NULL,NULL),(4244,NULL,NULL,2910,'delete','2011-09-17 09:10:51','administrador',15,'cod_usuario','11',NULL,NULL,NULL),(4245,'usuario1','127.0.0.1',2930,'Insert - Inicio','2011-09-17 09:11:42','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4246,NULL,NULL,2930,'insert','2011-09-17 09:11:42','administrador',NULL,'cod_administrador',NULL,'16',NULL,NULL),(4247,'usuario1','127.0.0.1',2930,'Insert - Fim','2011-09-17 09:11:43','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4248,NULL,NULL,2950,'delete','2011-09-17 09:20:05','administrador',16,'cod_administrador','16',NULL,NULL,NULL),(4249,NULL,NULL,2950,'delete','2011-09-17 09:20:05','administrador',16,'cod_usuario','11',NULL,NULL,NULL),(4250,'usuario1','127.0.0.1',2952,'Insert - Inicio','2011-09-17 09:20:11','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4251,NULL,NULL,2952,'insert','2011-09-17 09:20:11','administrador',NULL,'cod_administrador',NULL,'17',NULL,NULL),(4252,'usuario1','127.0.0.1',2952,'Insert - Fim','2011-09-17 09:20:11','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4253,NULL,NULL,2967,'delete','2011-09-17 09:23:43','administrador',17,'cod_administrador','17',NULL,NULL,NULL),(4254,NULL,NULL,2967,'delete','2011-09-17 09:23:43','administrador',17,'cod_usuario','11',NULL,NULL,NULL),(4255,'usuario1','127.0.0.1',2987,'Insert - Inicio','2011-09-17 09:24:13','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4256,NULL,NULL,2987,'insert','2011-09-17 09:24:13','administrador',NULL,'cod_administrador',NULL,'18',NULL,NULL),(4257,'usuario1','127.0.0.1',2987,'Insert - Fim','2011-09-17 09:24:13','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4258,NULL,NULL,3007,'delete','2011-09-17 09:25:13','administrador',18,'cod_administrador','18',NULL,NULL,NULL),(4259,NULL,NULL,3007,'delete','2011-09-17 09:25:13','administrador',18,'cod_usuario','11',NULL,NULL,NULL),(4260,'usuario1','127.0.0.1',3028,'Insert - Inicio','2011-09-17 09:29:43','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4261,NULL,NULL,3028,'insert','2011-09-17 09:29:43','administrador',NULL,'cod_administrador',NULL,'19',NULL,NULL),(4262,'usuario1','127.0.0.1',3028,'Insert - Fim','2011-09-17 09:29:43','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4263,NULL,NULL,3030,'delete','2011-09-17 09:31:32','administrador',19,'cod_administrador','19',NULL,NULL,NULL),(4264,NULL,NULL,3030,'delete','2011-09-17 09:31:32','administrador',19,'cod_usuario','11',NULL,NULL,NULL),(4265,'usuario1','127.0.0.1',3050,'Insert - Inicio','2011-09-17 09:32:06','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4266,NULL,NULL,3050,'insert','2011-09-17 09:32:06','administrador',NULL,'cod_administrador',NULL,'20',NULL,NULL),(4267,'usuario1','127.0.0.1',3050,'Insert - Fim','2011-09-17 09:32:06','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4268,'usuario1','127.0.0.1',3137,'Delete - Inicio','2011-09-17 10:13:22','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4269,NULL,NULL,3137,'delete','2011-09-17 10:13:22','administrador',20,'cod_administrador','20',NULL,NULL,NULL),(4270,NULL,NULL,3137,'delete','2011-09-17 10:13:22','administrador',20,'cod_usuario','11',NULL,NULL,NULL),(4271,'usuario1','127.0.0.1',3137,'Delete - Fim','2011-09-17 10:13:22','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4272,'usuario1','127.0.0.1',3247,'Insert - Inicio','2011-09-17 10:42:09','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4273,NULL,NULL,3247,'insert','2011-09-17 10:42:09','administrador',NULL,'cod_administrador',NULL,'21',NULL,NULL),(4274,'usuario1','127.0.0.1',3247,'Insert - Fim','2011-09-17 10:42:09','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4275,'usuario1','127.0.0.1',3271,'Delete - Inicio','2011-09-17 10:43:58','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4276,NULL,NULL,3271,'delete','2011-09-17 10:43:58','administrador',21,'cod_administrador','21',NULL,NULL,NULL),(4277,NULL,NULL,3271,'delete','2011-09-17 10:43:58','administrador',21,'cod_usuario','11',NULL,NULL,NULL),(4278,'usuario1','127.0.0.1',3271,'Delete - Fim','2011-09-17 10:43:58','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4279,'usuario1','127.0.0.1',3305,'Insert - Inicio','2011-09-17 10:45:53','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4280,NULL,NULL,3305,'insert','2011-09-17 10:45:53','administrador',NULL,'cod_administrador',NULL,'22',NULL,NULL),(4281,'usuario1','127.0.0.1',3305,'Insert - Fim','2011-09-17 10:45:53','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4282,'usuario1','127.0.0.1',3306,'Delete - Inicio','2011-09-17 10:46:07','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4283,NULL,NULL,3306,'delete','2011-09-17 10:46:07','administrador',8,'cod_administrador','8',NULL,NULL,NULL),(4284,NULL,NULL,3306,'delete','2011-09-17 10:46:07','administrador',8,'cod_usuario','1',NULL,NULL,NULL),(4285,'usuario1','127.0.0.1',3306,'Delete - Fim','2011-09-17 10:46:07','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4286,NULL,NULL,3361,'update','2011-09-17 10:56:56','administrador',22,'cod_usuario','11','1',NULL,NULL),(4287,'usuario1','127.0.0.1',3546,'Insert - Inicio','2011-09-17 11:22:34','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4288,NULL,NULL,3546,'insert','2011-09-17 11:22:34','administrador',NULL,'cod_administrador',NULL,'23',NULL,NULL),(4289,'usuario1','127.0.0.1',3546,'Insert - Fim','2011-09-17 11:22:34','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4290,'usuario1','127.0.0.1',3547,'Delete - Inicio','2011-09-17 11:22:43','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4291,NULL,NULL,3547,'delete','2011-09-17 11:22:43','administrador',23,'cod_administrador','23',NULL,NULL,NULL),(4292,NULL,NULL,3547,'delete','2011-09-17 11:22:43','administrador',23,'cod_usuario','11',NULL,NULL,NULL),(4293,'usuario1','127.0.0.1',3547,'Delete - Fim','2011-09-17 11:22:43','administrador',NULL,NULL,NULL,NULL,NULL,NULL),(4294,'usuario1','127.0.0.1',3694,'Insert - Inicio','2011-09-18 00:43:02','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4295,NULL,NULL,3694,'insert','2011-09-18 00:43:02','atleta',NULL,'cod_atleta',NULL,'5',NULL,NULL),(4296,'usuario1','127.0.0.1',3694,'Insert - Fim','2011-09-18 00:43:02','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4297,NULL,NULL,3758,'delete','2011-09-18 00:51:01','atleta',NULL,'cod_atleta','5',NULL,NULL,NULL),(4298,'usuario1','127.0.0.1',3780,'Insert - Inicio','2011-09-18 00:51:35','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4299,NULL,NULL,3780,'insert','2011-09-18 00:51:35','atleta',NULL,'cod_atleta',NULL,'6',NULL,NULL),(4300,'usuario1','127.0.0.1',3780,'Insert - Fim','2011-09-18 00:51:35','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4301,NULL,NULL,3786,'delete','2011-09-18 00:52:47','atleta',NULL,'cod_atleta','6',NULL,NULL,NULL),(4302,'usuario1','127.0.0.1',3810,'Insert - Inicio','2011-09-18 00:54:37','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4303,NULL,NULL,3810,'insert','2011-09-18 00:54:37','atleta',NULL,'cod_atleta',NULL,'7',NULL,NULL),(4304,'usuario1','127.0.0.1',3810,'Insert - Fim','2011-09-18 00:54:37','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4305,NULL,NULL,3828,'delete','2011-09-18 01:04:39','atleta',NULL,'cod_atleta','7',NULL,NULL,NULL),(4306,'usuario1','127.0.0.1',4058,'Insert - Inicio','2011-09-18 01:37:05','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4307,NULL,NULL,4058,'insert','2011-09-18 01:37:05','atleta',NULL,'cod_atleta',NULL,'8',NULL,NULL),(4308,'usuario1','127.0.0.1',4058,'Insert - Fim','2011-09-18 01:37:05','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4309,NULL,NULL,4060,'delete','2011-09-18 01:37:20','atleta',NULL,'cod_atleta','8',NULL,NULL,NULL),(4310,'usuario1','127.0.0.1',4072,'Insert - Inicio','2011-09-18 01:42:26','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4311,NULL,NULL,4072,'insert','2011-09-18 01:42:26','atleta',NULL,'cod_atleta',NULL,'9',NULL,NULL),(4312,'usuario1','127.0.0.1',4072,'Insert - Fim','2011-09-18 01:42:26','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4313,NULL,NULL,4074,'delete','2011-09-18 01:43:13','atleta',NULL,'cod_atleta','9',NULL,NULL,NULL),(4314,NULL,NULL,4650,'insert','2011-09-18 14:55:46','gerente',NULL,'cod_gerente',NULL,'2',NULL,NULL),(4315,NULL,NULL,4652,'update','2011-09-18 14:56:21','treinador',3,'cod_gerente','1','2',NULL,NULL),(4316,NULL,NULL,4652,'update','2011-09-18 14:56:21','treinador',3,'cod_usuario','3','6',NULL,NULL),(4317,NULL,NULL,4652,'update','2011-09-18 14:56:21','treinador',2,'cod_usuario','6','5',NULL,NULL),(4318,NULL,NULL,4652,'update','2011-09-18 14:56:21','treinador',1,'cod_usuario','5','4',NULL,NULL),(4319,NULL,NULL,4656,'insert','2011-09-18 14:57:10','treinador',NULL,'cod_treinador',NULL,'6',NULL,NULL),(4320,NULL,NULL,4662,'insert','2011-09-18 14:59:08','atleta',NULL,'cod_atleta',NULL,'12',NULL,NULL),(4321,NULL,NULL,4662,'insert','2011-09-18 14:59:08','atleta',NULL,'cod_atleta',NULL,'13',NULL,NULL),(4322,NULL,NULL,4662,'insert','2011-09-18 14:59:08','atleta',NULL,'cod_atleta',NULL,'14',NULL,NULL),(4323,NULL,NULL,4662,'insert','2011-09-18 14:59:08','atleta',NULL,'cod_atleta',NULL,'15',NULL,NULL),(4324,NULL,NULL,4662,'update','2011-09-18 14:59:08','atleta',4,'cod_treinador','2','1',NULL,NULL),(4325,NULL,NULL,4662,'update','2011-09-18 14:59:08','atleta',4,'cod_usuario','8','9',NULL,NULL),(4326,NULL,NULL,4662,'update','2011-09-18 14:59:08','atleta',1,'cod_usuario','7','8',NULL,NULL),(4327,NULL,NULL,4667,'insert','2011-09-18 15:00:01','atleta',NULL,'cod_atleta',NULL,'17',NULL,NULL),(4328,NULL,NULL,4669,'insert','2011-09-18 15:00:19','atleta',NULL,'cod_atleta',NULL,'18',NULL,NULL),(4329,'usuario1','127.0.0.1',4703,'Delete - Inicio','2011-09-18 15:01:43','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4330,'usuario1','127.0.0.1',4703,'Delete - Fim','2011-09-18 15:01:43','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4331,'usuario1','127.0.0.1',4760,'Delete - Inicio','2011-09-18 15:04:39','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4332,'usuario1','127.0.0.1',4760,'Delete - Fim','2011-09-18 15:04:40','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4334,'usuario1','127.0.0.1',4817,'Delete - Inicio','2011-09-18 15:11:52','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4335,'usuario1','127.0.0.1',4817,'Delete - Fim','2011-09-18 15:11:52','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4336,'usuario1','127.0.0.1',4845,'Delete - Inicio','2011-09-18 15:17:35','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4337,'usuario1','127.0.0.1',4845,'Delete - Fim','2011-09-18 15:17:35','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4338,'usuario1','127.0.0.1',4873,'Delete - Inicio','2011-09-18 15:22:50','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4339,'usuario1','127.0.0.1',4873,'Delete - Fim','2011-09-18 15:22:50','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4340,'usuario1','127.0.0.1',4902,'Delete - Inicio','2011-09-18 15:25:12','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4341,'usuario1','127.0.0.1',4902,'Delete - Inicio','2011-09-18 15:25:46','macrociclo',NULL,NULL,NULL,NULL,NULL,NULL),(4342,'usuario1','127.0.0.1',4902,'Delete - Fim','2011-09-18 15:25:46','macrociclo',NULL,NULL,NULL,NULL,NULL,NULL),(4343,NULL,NULL,4902,'delete','2011-09-18 15:26:04','atleta',NULL,'cod_atleta','18',NULL,NULL,NULL),(4344,'usuario1','127.0.0.1',4902,'Delete - Fim','2011-09-18 15:26:18','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4345,'usuario1','127.0.0.1',4905,'Insert - Inicio','2011-09-18 15:27:41','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4346,NULL,NULL,4905,'insert','2011-09-18 15:27:41','atleta',NULL,'cod_atleta',NULL,'19',NULL,NULL),(4347,'usuario1','127.0.0.1',4905,'Insert - Fim','2011-09-18 15:27:41','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4348,'usuario1','127.0.0.1',4906,'Delete - Inicio','2011-09-18 15:27:55','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4349,'usuario1','127.0.0.1',4906,'Delete - Fim','2011-09-18 15:27:55','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4350,'usuario1','127.0.0.1',4909,'Delete - Inicio','2011-09-18 15:28:15','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4351,'usuario1','127.0.0.1',4909,'Delete - Inicio','2011-09-18 15:28:15','macrociclo',NULL,NULL,NULL,NULL,NULL,NULL),(4352,'usuario1','127.0.0.1',4909,'Delete - Fim','2011-09-18 15:28:15','macrociclo',NULL,NULL,NULL,NULL,NULL,NULL),(4353,NULL,NULL,4909,'delete','2011-09-18 15:28:15','atleta',NULL,'cod_atleta','19',NULL,NULL,NULL),(4354,'usuario1','127.0.0.1',4909,'Delete - Fim','2011-09-18 15:28:15','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4355,'usuario1','127.0.0.1',5232,'Insert - Inicio','2011-09-18 18:37:58','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4356,'usuario1','127.0.0.1',5232,'Insert - Fim','2011-09-18 18:37:58','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4357,'usuario1','127.0.0.1',5233,'Delete - Inicio','2011-09-18 18:38:20','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4358,'usuario1','127.0.0.1',5233,'Delete - Fim','2011-09-18 18:38:20','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4359,'usuario1','127.0.0.1',5633,'Insert - Inicio','2011-09-19 01:33:33','atleta',NULL,NULL,NULL,NULL,NULL,NULL),(4360,NULL,NULL,5633,'insert','2011-09-19 01:33:33','atleta',NULL,'cod_atleta',NULL,'20',NULL,NULL),(4361,'usuario1','127.0.0.1',5633,'Insert - Fim','2011-09-19 01:33:33','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4370,'usuario_treinador_1','127.0.0.1',6190,'Update - Inicio','2011-09-20 01:10:51','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4371,NULL,NULL,6190,'update','2011-09-20 01:10:51','microciclo',115,'nom_microciclo','Micro 23','Micro 23a',NULL,NULL),(4372,'usuario_treinador_1','127.0.0.1',6190,'Update - Fim','2011-09-20 01:10:52','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4373,'usuario_treinador_1','127.0.0.1',6215,'Update - Inicio','2011-09-20 01:12:56','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4374,NULL,NULL,6215,'update','2011-09-20 01:12:56','microciclo',115,'nom_microciclo','Micro 23a','Micro 23ab',NULL,NULL),(4375,'usuario_treinador_1','127.0.0.1',6215,'Update - Fim','2011-09-20 01:12:56','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4376,'usuario_treinador_1','127.0.0.1',6219,'Update - Inicio','2011-09-20 01:13:25','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4377,NULL,NULL,6219,'update','2011-09-20 01:13:25','microciclo',115,'nom_microciclo','Micro 23ab','Micro 23abc',NULL,NULL),(4378,'usuario_treinador_1','127.0.0.1',6219,'Update - Fim','2011-09-20 01:13:25','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4379,'usuario_treinador_1','127.0.0.1',6222,'Update - Inicio','2011-09-20 01:14:04','mesociclo',NULL,NULL,NULL,NULL,NULL,NULL),(4380,'usuario_treinador_1','127.0.0.1',6222,'Update - Fim','2011-09-20 01:14:04','mesociclo',NULL,NULL,NULL,NULL,NULL,NULL),(4381,'usuario_treinador_1','127.0.0.1',6289,'Update - Inicio','2011-09-23 14:06:03','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4382,NULL,NULL,6289,'update','2011-09-23 14:06:03','microciclo',115,'nom_microciclo','Micro 23abc','Micro 23',NULL,NULL),(4383,'usuario_treinador_1','127.0.0.1',6289,'Update - Fim','2011-09-23 14:06:03','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4384,'usuario_treinador_1','127.0.0.1',6292,'Update - Inicio','2011-09-23 14:06:50','mesociclo',NULL,NULL,NULL,NULL,NULL,NULL),(4385,'usuario_treinador_1','127.0.0.1',6292,'Update - Fim','2011-09-23 14:06:50','mesociclo',NULL,NULL,NULL,NULL,NULL,NULL),(4386,NULL,NULL,108,'insert','2011-09-23 20:01:05','treino',NULL,'cod_treino',NULL,'9',NULL,NULL),(4387,NULL,NULL,108,'insert','2011-09-23 20:01:06','treino',NULL,'cod_treino',NULL,'10',NULL,NULL),(4388,NULL,NULL,108,'insert','2011-09-23 20:01:06','treino',NULL,'cod_treino',NULL,'11',NULL,NULL),(4389,NULL,NULL,108,'insert','2011-09-23 20:01:06','treino',NULL,'cod_treino',NULL,'12',NULL,NULL),(4390,NULL,NULL,108,'insert','2011-09-23 20:01:06','treino',NULL,'cod_treino',NULL,'13',NULL,NULL),(4391,NULL,NULL,108,'insert','2011-09-23 20:01:06','treino',NULL,'cod_treino',NULL,'14',NULL,NULL),(4392,NULL,NULL,290,'update','2011-09-25 10:06:04','treino',9,'dat_treino','2011-08-14','0000-00-00',NULL,NULL),(4393,NULL,NULL,299,'update','2011-09-25 10:06:49','treino',9,'dat_treino','0000-00-00','2011-08-14',NULL,NULL),(4394,'usuario_atleta_1','127.0.0.1',881,'Update - Inicio','2012-02-28 22:07:51','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4395,NULL,NULL,881,'update','2012-02-28 22:07:51','microciclo',1,'num_ordem_microciclo','1','2',NULL,NULL),(4396,NULL,NULL,881,'update','2012-02-28 22:07:51','microciclo',1,'dat_inicio','2011-08-01','2011-08-08',NULL,NULL),(4397,NULL,NULL,881,'update','2012-02-28 22:07:51','microciclo',1,'dat_fim','2011-08-07','2011-08-14',NULL,NULL),(4398,'usuario_atleta_1','127.0.0.1',881,'Update - Fim','2012-02-28 22:07:51','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4399,'usuario_atleta_1','127.0.0.1',898,'Update - Inicio','2012-02-28 22:08:04','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4400,NULL,NULL,898,'update','2012-02-28 22:08:04','microciclo',1,'num_ordem_microciclo','2','1',NULL,NULL),(4401,'usuario_atleta_1','127.0.0.1',898,'Update - Fim','2012-02-28 22:08:04','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4402,'usuario_atleta_1','127.0.0.1',945,'Update - Inicio','2012-02-28 22:12:25','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4403,NULL,NULL,945,'update','2012-02-28 22:12:25','microciclo',1,'num_ordem_microciclo','1','2',NULL,NULL),(4404,'usuario_atleta_1','127.0.0.1',945,'Update - Fim','2012-02-28 22:12:25','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4405,'usuario_atleta_1','127.0.0.1',1012,'Update - Inicio','2012-02-28 22:16:40','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4406,NULL,NULL,1012,'update','2012-02-28 22:16:40','microciclo',3,'num_ordem_microciclo','2','1',NULL,NULL),(4407,'usuario_atleta_1','127.0.0.1',1012,'Update - Fim','2012-02-28 22:16:40','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4408,'usuario_atleta_1','127.0.0.1',1029,'Update - Inicio','2012-02-28 22:17:24','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4409,NULL,NULL,1029,'update','2012-02-28 22:17:24','microciclo',3,'num_ordem_microciclo','1','2',NULL,NULL),(4410,'usuario_atleta_1','127.0.0.1',1029,'Update - Fim','2012-02-28 22:17:24','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4411,'usuario_atleta_1','127.0.0.1',1046,'Update - Inicio','2012-02-28 22:18:08','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4412,NULL,NULL,1046,'update','2012-02-28 22:18:08','microciclo',3,'num_ordem_microciclo','2','1',NULL,NULL),(4413,'usuario_atleta_1','127.0.0.1',1046,'Update - Fim','2012-02-28 22:18:08','microciclo',NULL,NULL,NULL,NULL,NULL,NULL),(4414,NULL,'127.0.0.1',1457,'Update - Inicio','2012-03-13 00:34:14','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4415,NULL,'127.0.0.1',1457,'Update - Fim','2012-03-13 00:34:15','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4416,NULL,'127.0.0.1',1466,'Update - Inicio','2012-03-13 00:42:44','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4417,NULL,'127.0.0.1',1466,'Update - Fim','2012-03-13 00:42:44','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4418,NULL,'127.0.0.1',1473,'Update - Inicio','2012-03-13 00:47:22','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4419,NULL,'127.0.0.1',1473,'Update - Fim','2012-03-13 00:47:22','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4420,NULL,'127.0.0.1',1489,'Update - Inicio','2012-03-13 00:49:20','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4421,NULL,'127.0.0.1',1489,'Update - Fim','2012-03-13 00:49:20','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4422,NULL,'127.0.0.1',1496,'Update - Inicio','2012-03-13 01:00:16','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4423,NULL,'127.0.0.1',1496,'Update - Fim','2012-03-13 01:00:16','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4424,NULL,'127.0.0.1',1503,'Update - Inicio','2012-03-13 01:04:04','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4425,NULL,'127.0.0.1',1503,'Update - Fim','2012-03-13 01:04:04','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4426,NULL,'127.0.0.1',1508,'Update - Inicio','2012-03-13 01:06:04','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4427,NULL,'127.0.0.1',1508,'Update - Fim','2012-03-13 01:06:04','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4428,NULL,'127.0.0.1',1510,'Update - Inicio','2012-03-13 01:09:55','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4429,NULL,'127.0.0.1',1510,'Update - Fim','2012-03-13 01:09:56','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4430,NULL,'127.0.0.1',1517,'Update - Inicio','2012-03-13 01:11:03','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4431,NULL,'127.0.0.1',1517,'Update - Fim','2012-03-13 01:11:04','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4432,'usuario1','127.0.0.1',1530,'Update - Inicio','2012-03-13 01:13:55','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4433,'usuario1','127.0.0.1',1530,'Update - Fim','2012-03-13 01:13:56','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4434,'usuario1','127.0.0.1',75,'Insert - Inicio','2012-03-14 07:45:09','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4435,'usuario1','127.0.0.1',75,'Insert - Fim','2012-03-14 07:45:09','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4436,'usuario1','127.0.0.1',79,'Update - Inicio','2012-03-14 07:45:24','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4437,'usuario1','127.0.0.1',79,'Update - Fim','2012-03-14 07:45:24','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4438,'usuario1','127.0.0.1',95,'Insert - Inicio','2012-03-14 20:14:59','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4439,'usuario1','127.0.0.1',95,'Insert - Fim','2012-03-14 20:14:59','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4440,'usuario1','127.0.0.1',100,'Insert - Inicio','2012-03-14 20:17:51','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4441,'usuario1','127.0.0.1',100,'Insert - Fim','2012-03-14 20:17:51','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4442,'usuario1','127.0.0.1',108,'Insert - Inicio','2012-03-14 20:18:39','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4443,'usuario1','127.0.0.1',108,'Insert - Fim','2012-03-14 20:18:39','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4444,'usuario1','127.0.0.1',117,'Insert - Inicio','2012-03-14 20:19:46','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4445,'usuario1','127.0.0.1',117,'Insert - Fim','2012-03-14 20:19:46','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4446,'usuario1','127.0.0.1',125,'Insert - Inicio','2012-03-14 20:20:32','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4447,'usuario1','127.0.0.1',125,'Insert - Fim','2012-03-14 20:20:32','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4448,'usuario1','127.0.0.1',135,'Insert - Inicio','2012-03-14 20:21:08','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4449,'usuario1','127.0.0.1',135,'Insert - Fim','2012-03-14 20:21:08','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4450,'usuario1','127.0.0.1',144,'Insert - Inicio','2012-03-14 20:22:17','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4451,'usuario1','127.0.0.1',144,'Insert - Fim','2012-03-14 20:22:17','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4452,'usuario1','127.0.0.1',152,'Insert - Inicio','2012-03-14 20:30:51','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4453,'usuario1','127.0.0.1',152,'Insert - Fim','2012-03-14 20:30:51','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4454,'usuario1','127.0.0.1',158,'Insert - Inicio','2012-03-14 20:31:34','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4455,'usuario1','127.0.0.1',158,'Insert - Fim','2012-03-14 20:31:35','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4456,'usuario1','127.0.0.1',164,'Delete - Inicio','2012-03-14 20:32:06','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4457,'usuario1','127.0.0.1',164,'Delete - Fim','2012-03-14 20:32:06','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4458,'usuario1','127.0.0.1',165,'Delete - Inicio','2012-03-14 20:32:10','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4459,'usuario1','127.0.0.1',165,'Delete - Fim','2012-03-14 20:32:10','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4460,'usuario1','127.0.0.1',166,'Delete - Inicio','2012-03-14 20:32:14','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4461,'usuario1','127.0.0.1',166,'Delete - Fim','2012-03-14 20:32:14','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4462,'usuario1','127.0.0.1',167,'Delete - Inicio','2012-03-14 20:32:16','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4463,'usuario1','127.0.0.1',167,'Delete - Fim','2012-03-14 20:32:16','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4464,'usuario1','127.0.0.1',168,'Delete - Inicio','2012-03-14 20:32:19','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4465,'usuario1','127.0.0.1',168,'Delete - Fim','2012-03-14 20:32:19','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4466,'usuario1','127.0.0.1',170,'Delete - Inicio','2012-03-14 20:32:29','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4467,'usuario1','127.0.0.1',170,'Delete - Fim','2012-03-14 20:32:29','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4468,'usuario1','127.0.0.1',171,'Delete - Inicio','2012-03-14 20:32:31','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4469,'usuario1','127.0.0.1',171,'Delete - Fim','2012-03-14 20:32:31','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4470,'usuario1','127.0.0.1',172,'Delete - Inicio','2012-03-14 20:32:35','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4471,'usuario1','127.0.0.1',172,'Delete - Fim','2012-03-14 20:32:35','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4472,'usuario1','127.0.0.1',178,'Insert - Inicio','2012-03-14 20:36:23','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4473,'usuario1','127.0.0.1',178,'Insert - Fim','2012-03-14 20:36:23','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4474,'usuario1','127.0.0.1',185,'Insert - Inicio','2012-03-14 20:43:51','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4475,'usuario1','127.0.0.1',185,'Insert - Fim','2012-03-14 20:43:51','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4476,'usuario1','127.0.0.1',191,'Insert - Inicio','2012-03-14 20:45:52','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4477,'usuario1','127.0.0.1',191,'Insert - Fim','2012-03-14 20:45:52','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4478,'usuario1','127.0.0.1',198,'Insert - Inicio','2012-03-14 20:48:48','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4479,'usuario1','127.0.0.1',198,'Insert - Fim','2012-03-14 20:48:48','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4480,'usuario1','127.0.0.1',200,'Update - Inicio','2012-03-14 20:50:07','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4481,'usuario1','127.0.0.1',200,'Update - Fim','2012-03-14 20:50:07','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4482,'usuario1','127.0.0.1',203,'Update - Inicio','2012-03-14 20:50:28','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4483,'usuario1','127.0.0.1',203,'Update - Fim','2012-03-14 20:50:28','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4484,'usuario1','127.0.0.1',205,'Update - Inicio','2012-03-14 20:50:35','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4485,'usuario1','127.0.0.1',205,'Update - Fim','2012-03-14 20:50:35','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4486,'usuario1','127.0.0.1',207,'Update - Inicio','2012-03-14 20:52:29','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4487,'usuario1','127.0.0.1',207,'Update - Fim','2012-03-14 20:52:29','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4488,'usuario1','127.0.0.1',210,'Update - Inicio','2012-03-14 20:53:16','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4489,'usuario1','127.0.0.1',210,'Update - Fim','2012-03-14 20:53:16','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4490,'usuario1','127.0.0.1',213,'Delete - Inicio','2012-03-14 20:53:31','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4491,'usuario1','127.0.0.1',213,'Delete - Fim','2012-03-14 20:53:31','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4492,'usuario1','127.0.0.1',214,'Delete - Inicio','2012-03-14 20:53:34','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4493,'usuario1','127.0.0.1',214,'Delete - Fim','2012-03-14 20:53:34','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4494,'usuario1','127.0.0.1',215,'Insert - Inicio','2012-03-14 20:53:50','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4495,'usuario1','127.0.0.1',215,'Insert - Fim','2012-03-14 20:53:50','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4496,'usuario1','127.0.0.1',217,'Delete - Inicio','2012-03-14 20:54:00','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4497,'usuario1','127.0.0.1',217,'Delete - Fim','2012-03-14 20:54:00','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4498,'usuario1','127.0.0.1',223,'Delete - Inicio','2012-03-14 20:54:11','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4499,'usuario1','127.0.0.1',223,'Delete - Fim','2012-03-14 20:54:11','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4500,'usuario1','127.0.0.1',225,'Insert - Inicio','2012-03-14 20:54:27','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4501,'usuario1','127.0.0.1',225,'Insert - Fim','2012-03-14 20:54:27','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4502,'usuario1','127.0.0.1',232,'Insert - Inicio','2012-03-14 20:55:19','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4503,'usuario1','127.0.0.1',232,'Insert - Fim','2012-03-14 20:55:19','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4504,'usuario1','127.0.0.1',239,'Update - Inicio','2012-03-14 20:55:55','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4505,'usuario1','127.0.0.1',239,'Update - Fim','2012-03-14 20:55:55','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4506,'usuario1','127.0.0.1',241,'Delete - Inicio','2012-03-14 20:56:04','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4507,'usuario1','127.0.0.1',241,'Delete - Fim','2012-03-14 20:56:04','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4508,'usuario1','127.0.0.1',243,'Insert - Inicio','2012-03-14 20:56:24','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4509,'usuario1','127.0.0.1',243,'Insert - Fim','2012-03-14 20:56:24','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4511,'usuario1','127.0.0.1',370,'Delete - Inicio','2012-03-16 08:18:59','macrociclo',NULL,NULL,NULL,NULL,NULL,NULL),(4512,NULL,NULL,370,'delete','2012-03-16 08:18:59','macrociclo',23,'cod_atleta','1',NULL,NULL,NULL),(4513,NULL,NULL,370,'delete','2012-03-16 08:18:59','macrociclo',23,'cod_treinador','1',NULL,NULL,NULL),(4514,NULL,NULL,370,'delete','2012-03-16 08:18:59','macrociclo',23,'nom_macrociclo','Teste Macrociclo 3',NULL,NULL,NULL),(4515,NULL,NULL,370,'delete','2012-03-16 08:18:59','macrociclo',23,'dat_inicio','2011-09-12',NULL,NULL,NULL),(4516,NULL,NULL,370,'delete','2012-03-16 08:18:59','macrociclo',23,'qtd_microciclos_macrociclo','0',NULL,NULL,NULL),(4517,NULL,NULL,370,'delete','2012-03-16 08:18:59','macrociclo',23,'tip_macrociclo','Teste',NULL,NULL,NULL),(4518,NULL,NULL,370,'delete','2012-03-16 08:18:59','macrociclo',23,'des_objetivo','Teste',NULL,NULL,NULL),(4519,NULL,NULL,370,'delete','2012-03-16 08:18:59','macrociclo',23,'cod_primeiro_dia_semana','0',NULL,NULL,NULL),(4520,NULL,NULL,370,'delete','2012-03-16 08:18:59','macrociclo',23,'qtd_pontos_macrociclo','0',NULL,NULL,NULL),(4521,NULL,NULL,370,'delete','2012-03-16 08:18:59','macrociclo',23,'ind_executado','0',NULL,NULL,NULL),(4522,'usuario1','127.0.0.1',370,'Delete - Fim','2012-03-16 08:18:59','macrociclo',NULL,NULL,NULL,NULL,NULL,NULL),(4550,'usuario1','127.0.0.1',588,'Update - Inicio','2012-03-17 16:49:25','usuario',NULL,NULL,NULL,NULL,NULL,NULL),(4551,'usuario1','127.0.0.1',588,'Update - Fim','2012-03-17 16:49:25','usuario',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg__log_bi BEFORE INSERT ON log
FOR EACH ROW BEGIN
  SET NEW.num_id_conexao = connection_id();
  SET NEW.dth_acao = now();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `macrociclo`
--

DROP TABLE IF EXISTS `macrociclo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `macrociclo` (
  `cod_macrociclo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_atleta` int(11) NOT NULL,
  `cod_treinador` int(11) NOT NULL,
  `nom_macrociclo` varchar(255) NOT NULL,
  `dat_inicio` date NOT NULL,
  `dat_fim` date DEFAULT NULL,
  `qtd_microciclos_macrociclo` int(11) NOT NULL,
  `tip_macrociclo` varchar(255) NOT NULL,
  `des_objetivo` text NOT NULL,
  `cod_primeiro_dia_semana` int(1) NOT NULL,
  `qtd_pontos_macrociclo` float DEFAULT NULL,
  `ind_executado` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_macrociclo`),
  UNIQUE KEY `nom_macrociclo_UNIQUE` (`nom_macrociclo`),
  KEY `frk_macrociclo_cod_usuario` (`cod_atleta`),
  KEY `frk_macrociclo_cod_treinador` (`cod_treinador`),
  CONSTRAINT `frk_macrociclo_cod_atleta` FOREIGN KEY (`cod_atleta`) REFERENCES `atleta` (`cod_atleta`),
  CONSTRAINT `frk_macrociclo_cod_treinador` FOREIGN KEY (`cod_treinador`) REFERENCES `treinador` (`cod_treinador`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COMMENT='Período total do treinamento.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macrociclo`
--

LOCK TABLES `macrociclo` WRITE;
/*!40000 ALTER TABLE `macrociclo` DISABLE KEYS */;
INSERT INTO `macrociclo` VALUES (21,1,1,'Teste Macrociclo','2011-08-29','2012-02-26',26,'Teste Macrociclo','Teste Macrociclo',0,1581,0),(22,1,1,'Teste Macrociclo 2','2011-08-22',NULL,2,'Teste','Teste',0,40,0);
/*!40000 ALTER TABLE `macrociclo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__macrociclo_au 
after update on macrociclo
for each row
begin
declare v_val_prk int(11);
declare v_cod_atleta_old int(11);
declare v_cod_atleta_new int(11);
declare v_cod_treinador_old int(11);
declare v_cod_treinador_new int(11);
declare v_nom_macrociclo_old varchar(255);
declare v_nom_macrociclo_new varchar(255);
declare v_dat_inicio_old varchar(255);
declare v_dat_inicio_new varchar(255);
declare v_dat_fim_old varchar(255);
declare v_dat_fim_new varchar(255);
declare v_qtd_microciclos_macrociclo_old int(11);
declare v_qtd_microciclos_macrociclo_new int(11);
declare v_tip_macrociclo_old varchar(255);
declare v_tip_macrociclo_new varchar(255);
declare v_des_objetivo_old varchar(255);
declare v_des_objetivo_new varchar(255);
declare v_cod_primeiro_dia_semana_old int(1);
declare v_cod_primeiro_dia_semana_new int(1);
declare v_qtd_pontos_macrociclo_old float(11);
declare v_qtd_pontos_macrociclo_new float(11);
declare v_ind_executado_old int(1);
declare v_ind_executado_new int(1);
set v_val_prk := old.cod_macrociclo;
set v_cod_atleta_old := old.cod_atleta;
set v_cod_atleta_new := new.cod_atleta;
set v_cod_treinador_old := old.cod_treinador;
set v_cod_treinador_new := new.cod_treinador;
set v_nom_macrociclo_old := old.nom_macrociclo;
set v_nom_macrociclo_new := new.nom_macrociclo;
set v_dat_inicio_old := old.dat_inicio;
set v_dat_inicio_new := new.dat_inicio;
set v_dat_fim_old := old.dat_fim;
set v_dat_fim_new := new.dat_fim;
set v_qtd_microciclos_macrociclo_old := old.qtd_microciclos_macrociclo;
set v_qtd_microciclos_macrociclo_new := new.qtd_microciclos_macrociclo;
set v_tip_macrociclo_old := old.tip_macrociclo;
set v_tip_macrociclo_new := new.tip_macrociclo;
set v_des_objetivo_old := old.des_objetivo;
set v_des_objetivo_new := new.des_objetivo;
set v_cod_primeiro_dia_semana_old := old.cod_primeiro_dia_semana;
set v_cod_primeiro_dia_semana_new := new.cod_primeiro_dia_semana;
set v_qtd_pontos_macrociclo_old := old.qtd_pontos_macrociclo;
set v_qtd_pontos_macrociclo_new := new.qtd_pontos_macrociclo;
set v_ind_executado_old := old.ind_executado;
set v_ind_executado_new := new.ind_executado;
if ifnull(v_cod_atleta_new,0) != ifnull(v_cod_atleta_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'macrociclo', v_val_prk, 'cod_atleta', cast(v_cod_atleta_old as char), cast(v_cod_atleta_new as char), null, null);
end if;
if ifnull(v_cod_treinador_new,0) != ifnull(v_cod_treinador_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'macrociclo', v_val_prk, 'cod_treinador', cast(v_cod_treinador_old as char), cast(v_cod_treinador_new as char), null, null);
end if;
if ifnull(v_nom_macrociclo_new,0) != ifnull(v_nom_macrociclo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'macrociclo', v_val_prk, 'nom_macrociclo', cast(v_nom_macrociclo_old as char), cast(v_nom_macrociclo_new as char), null, null);
end if;
if ifnull(v_dat_inicio_new,0) != ifnull(v_dat_inicio_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'macrociclo', v_val_prk, 'dat_inicio', cast(v_dat_inicio_old as char), cast(v_dat_inicio_new as char), null, null);
end if;
if ifnull(v_dat_fim_new,0) != ifnull(v_dat_fim_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'macrociclo', v_val_prk, 'dat_fim', cast(v_dat_fim_old as char), cast(v_dat_fim_new as char), null, null);
end if;
if ifnull(v_qtd_microciclos_macrociclo_new,0) != ifnull(v_qtd_microciclos_macrociclo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'macrociclo', v_val_prk, 'qtd_microciclos_macrociclo', cast(v_qtd_microciclos_macrociclo_old as char), cast(v_qtd_microciclos_macrociclo_new as char), null, null);
end if;
if ifnull(v_tip_macrociclo_new,0) != ifnull(v_tip_macrociclo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'macrociclo', v_val_prk, 'tip_macrociclo', cast(v_tip_macrociclo_old as char), cast(v_tip_macrociclo_new as char), null, null);
end if;
if ifnull(v_des_objetivo_new,0) != ifnull(v_des_objetivo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'macrociclo', v_val_prk, 'des_objetivo', cast(v_des_objetivo_old as char), cast(v_des_objetivo_new as char), null, null);
end if;
if ifnull(v_cod_primeiro_dia_semana_new,0) != ifnull(v_cod_primeiro_dia_semana_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'macrociclo', v_val_prk, 'cod_primeiro_dia_semana', cast(v_cod_primeiro_dia_semana as char), cast(v_cod_primeiro_dia_semana_new as char), null, null);
end if;
if ifnull(v_qtd_pontos_macrociclo_new,0) != ifnull(v_qtd_pontos_macrociclo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'macrociclo', v_val_prk, 'qtd_pontos_macrociclo', cast(v_qtd_pontos_macrociclo_old as char), cast(v_qtd_pontos_macrociclo_new as char), null, null);
end if;
if ifnull(v_ind_executado_new,0) != ifnull(v_ind_executado_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'macrociclo', v_val_prk, 'ind_executado', cast(v_ind_executado_old as char), cast(v_ind_executado_new as char), null, null);
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__macrociclo_ad 
after delete on macrociclo
for each row
begin
declare v_val_prk int(11);
declare v_cod_atleta_old int(11);
declare v_cod_treinador_old int(11);
declare v_nom_macrociclo_old varchar(255);
declare v_dat_inicio_old varchar(255);
declare v_dat_fim_old varchar(255);
declare v_qtd_microciclos_macrociclo_old int(11);
declare v_tip_macrociclo_old varchar(255);
declare v_des_objetivo_old varchar(255);
declare v_cod_primeiro_dia_semana_old int(1);
declare v_qtd_pontos_macrociclo_old float(11);
declare v_ind_executado_old int(1);
set v_val_prk := old.cod_macrociclo;
set v_cod_atleta_old := old.cod_atleta;
set v_cod_treinador_old := old.cod_treinador;
set v_nom_macrociclo_old := old.nom_macrociclo;
set v_dat_inicio_old := old.dat_inicio;
set v_dat_fim_old := old.dat_fim;
set v_qtd_microciclos_macrociclo_old := old.qtd_microciclos_macrociclo;
set v_tip_macrociclo_old := old.tip_macrociclo;
set v_des_objetivo_old := old.des_objetivo;
set v_cod_primeiro_dia_semana_old := old.cod_primeiro_dia_semana;
set v_qtd_pontos_macrociclo_old := old.qtd_pontos_macrociclo;
set v_ind_executado_old := old.ind_executado;
if ifnull(v_cod_atleta_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'macrociclo', v_val_prk, 'cod_atleta', cast(v_cod_atleta_old as char), null, null, null);
end if;
if ifnull(v_cod_treinador_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'macrociclo', v_val_prk, 'cod_treinador', cast(v_cod_treinador_old as char), null, null, null);
end if;
if ifnull(v_nom_macrociclo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'macrociclo', v_val_prk, 'nom_macrociclo', cast(v_nom_macrociclo_old as char), null, null, null);
end if;
if ifnull(v_dat_inicio_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'macrociclo', v_val_prk, 'dat_inicio', cast(v_dat_inicio_old as char), null, null, null);
end if;
if ifnull(v_dat_fim_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'macrociclo', v_val_prk, 'dat_fim', cast(v_dat_fim_old as char), null, null, null);
end if;
if ifnull(v_qtd_microciclos_macrociclo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'macrociclo', v_val_prk, 'qtd_microciclos_macrociclo', cast(v_qtd_microciclos_macrociclo_old as char), null, null, null);
end if;
if ifnull(v_tip_macrociclo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'macrociclo', v_val_prk, 'tip_macrociclo', cast(v_tip_macrociclo_old as char), null, null, null);
end if;
if ifnull(v_des_objetivo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'macrociclo', v_val_prk, 'des_objetivo', cast(v_des_objetivo_old as char), null, null, null);
end if;
if ifnull(v_cod_primeiro_dia_semana_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'macrociclo', v_val_prk, 'cod_primeiro_dia_semana', cast(v_cod_primeiro_dia_semana_old as char), null, null, null);
end if;
if ifnull(v_qtd_pontos_macrociclo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'macrociclo', v_val_prk, 'qtd_pontos_macrociclo', cast(v_qtd_pontos_macrociclo_old as char), null, null, null);
end if;
if ifnull(v_ind_executado_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'macrociclo', v_val_prk, 'ind_executado', cast(v_ind_executado_old as char), null, null, null);
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `macrociclo_modelo`
--

DROP TABLE IF EXISTS `macrociclo_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `macrociclo_modelo` (
  `cod_macrociclo_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_treinador` int(11) DEFAULT NULL,
  `nom_macrociclo_modelo` varchar(255) DEFAULT NULL,
  `dat_inicio` date DEFAULT NULL,
  `dat_fim` date DEFAULT NULL,
  `qtd_microciclos_macrociclo` int(11) DEFAULT NULL,
  `tip_macrociclo` varchar(255) DEFAULT NULL,
  `des_objetivo` text,
  `cod_primeiro_dia_semana` int(1) DEFAULT NULL,
  `qtd_pontos_macrociclo` float DEFAULT NULL,
  `ind_executado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cod_macrociclo_modelo`),
  KEY `frk_macrociclo_modelo_cod_usuario` (`cod_treinador`),
  CONSTRAINT `frk_macrociclo_modelo_cod_treinador` FOREIGN KEY (`cod_treinador`) REFERENCES `treinador` (`cod_treinador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Modelo para o Macrociclo - Período total do treinamento.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macrociclo_modelo`
--

LOCK TABLES `macrociclo_modelo` WRITE;
/*!40000 ALTER TABLE `macrociclo_modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `macrociclo_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesociclo`
--

DROP TABLE IF EXISTS `mesociclo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesociclo` (
  `cod_mesociclo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_macrociclo` int(11) NOT NULL,
  `nom_mesociclo` varchar(255) DEFAULT NULL,
  `num_ordem_mesociclo` int(11) NOT NULL,
  `qtd_microciclos_mesociclo` int(11) NOT NULL,
  `tip_mesociclo` varchar(255) NOT NULL,
  `obs_mesociclo` varchar(255) NOT NULL,
  `qtd_pontos_mesociclo` float DEFAULT NULL,
  `ind_executado` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_mesociclo`),
  UNIQUE KEY `nom_mesociclo_UNIQUE` (`nom_mesociclo`),
  KEY `frk_macrociclo_cod_mesociclo` (`cod_macrociclo`),
  CONSTRAINT `frk_macrociclo_cod_mesociclo` FOREIGN KEY (`cod_macrociclo`) REFERENCES `macrociclo` (`cod_macrociclo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COMMENT='Fases compreendidas por semanas (microciclos).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesociclo`
--

LOCK TABLES `mesociclo` WRITE;
/*!40000 ALTER TABLE `mesociclo` DISABLE KEYS */;
INSERT INTO `mesociclo` VALUES (11,21,'Meso 1',1,4,'Incorporação','Teste 1',143,0),(12,21,'Meso 2',2,4,'Básico 1','Teste 2',223,0),(13,21,'Meso 3',3,4,'Básico 2','Teste 3',270,0),(14,21,'Meso 4',4,4,'Específico 1','Teste 4',355,0),(15,21,'Meso 5',5,4,'Específico 2','Teste 5',425,0),(16,22,'Meso 1 Macro 2',1,2,'Básico 1','teste',40,0),(17,21,'Meso 6',6,6,'Transição','Teste',165,0);
/*!40000 ALTER TABLE `mesociclo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_log__mesociclo_ai 
AFTER INSERT ON mesociclo
FOR EACH ROW
begin
declare v_meso_qtd_microciclos int;
declare v_macro_qtd_microciclos int;
declare v_meso_qtd_pontos float;
declare v_macro_qtd_pontos float;
declare fim_cursor int;
declare cur_microciclos cursor for
	select qtd_microciclos_mesociclo
	from mesociclo
	where cod_macrociclo = new.cod_macrociclo;
declare cur_pontos cursor for
	select qtd_pontos_mesociclo
	from mesociclo
	where cod_macrociclo = new.cod_macrociclo;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_cursor = 1;
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'insert', now(), 'mesociclo', null, 'cod_mesociclo', null, cast(new.cod_mesociclo as char), null, null);
set fim_cursor = 0;
set v_macro_qtd_microciclos = 0;
if (new.qtd_microciclos_mesociclo != 0) then
	open cur_microciclos;
	cursor_loop:loop
		fetch cur_microciclos into v_meso_qtd_microciclos;
		if fim_cursor = 1 then
			leave cursor_loop;
		end if;
		set v_macro_qtd_microciclos = v_macro_qtd_microciclos + v_meso_qtd_microciclos;
	end loop cursor_loop;
	update macrociclo set qtd_microciclos_macrociclo = v_macro_qtd_microciclos where cod_macrociclo = new.cod_macrociclo;	
end if;
set fim_cursor = 0;
set v_macro_qtd_pontos = 0;
if (new.qtd_pontos_mesociclo != 0) then
	open cur_pontos;
	cursor_loop:loop
		fetch cur_pontos into v_meso_qtd_pontos;
		if fim_cursor = 1 then
			leave cursor_loop;
		end if;
		set v_macro_qtd_pontos = v_macro_qtd_pontos + v_meso_qtd_pontos;
	end loop cursor_loop;
	update macrociclo set qtd_pontos_macrociclo = v_macro_qtd_pontos where cod_macrociclo = new.cod_macrociclo;	
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__mesociclo_au 
after update on mesociclo
for each row
begin
declare v_val_prk int(11);
declare v_cod_macrociclo_old int(11);
declare v_cod_macrociclo_new int(11);
declare v_num_ordem_mesociclo_old int(11);
declare v_num_ordem_mesociclo_new int(11);
declare v_qtd_microciclos_mesociclo_old int(11);
declare v_qtd_microciclos_mesociclo_new int(11);
declare v_tip_mesociclo_old varchar(255);
declare v_tip_mesociclo_new varchar(255);
declare v_obs_mesociclo_old varchar(255);
declare v_obs_mesociclo_new varchar(255);
declare v_qtd_pontos_mesociclo_old float(11);
declare v_qtd_pontos_mesociclo_new float(11);
declare v_ind_executado_old int(1);
declare v_ind_executado_new int(1);
declare v_meso_qtd_microciclos int;
declare v_macro_qtd_microciclos int;
declare v_meso_qtd_pontos float;
declare v_macro_qtd_pontos float;
declare fim_cursor int;
declare cur_mesociclos cursor for
	select qtd_microciclos_mesociclo
	from mesociclo
	where cod_macrociclo = new.cod_macrociclo;
declare cur_pontos cursor for
	select qtd_pontos_mesociclo
	from mesociclo
	where cod_macrociclo = new.cod_macrociclo;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_cursor = 1;
set v_val_prk := old.cod_mesociclo;
set v_cod_macrociclo_old := old.cod_macrociclo;
set v_cod_macrociclo_new := new.cod_macrociclo;
set v_num_ordem_mesociclo_old := old.num_ordem_mesociclo;
set v_num_ordem_mesociclo_new := new.num_ordem_mesociclo;
set v_qtd_microciclos_mesociclo_old := old.qtd_microciclos_mesociclo;
set v_qtd_microciclos_mesociclo_new := new.qtd_microciclos_mesociclo;
set v_tip_mesociclo_old := old.tip_mesociclo;
set v_tip_mesociclo_new := new.tip_mesociclo;
set v_obs_mesociclo_old := old.obs_mesociclo;
set v_obs_mesociclo_new := new.obs_mesociclo;
set v_qtd_pontos_mesociclo_old := old.qtd_pontos_mesociclo;
set v_qtd_pontos_mesociclo_new := new.qtd_pontos_mesociclo;
set v_ind_executado_old := old.ind_executado;
set v_ind_executado_new := new.ind_executado;
if ifnull(v_cod_macrociclo_new,0) != ifnull(v_cod_macrociclo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'mesociclo', v_val_prk, 'cod_macrociclo', cast(v_cod_macrociclo_old as char), cast(v_cod_macrociclo_new as char), null, null);
end if;
if ifnull(v_num_ordem_mesociclo_new,0) != ifnull(v_num_ordem_mesociclo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'mesociclo', v_val_prk, 'num_ordem_mesociclo', cast(v_num_ordem_mesociclo_old as char), cast(v_num_ordem_mesociclo_new as char), null, null);
end if;
if ifnull(v_qtd_microciclos_mesociclo_new,0) != ifnull(v_qtd_microciclos_mesociclo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'mesociclo', v_val_prk, 'qtd_microciclos_mesociclo', cast(v_qtd_microciclos_mesociclo_old as char), cast(v_qtd_microciclos_mesociclo_new as char), null, null);
set fim_cursor = 0;
set v_macro_qtd_microciclos = 0;
open cur_mesociclos;
cursor_loop:loop
	fetch cur_mesociclos into v_meso_qtd_microciclos;
	if fim_cursor = 1 then
		leave cursor_loop;
	end if;
	set v_macro_qtd_microciclos = v_macro_qtd_microciclos + v_meso_qtd_microciclos;
end loop cursor_loop;
update macrociclo set qtd_microciclos_macrociclo = v_macro_qtd_microciclos where cod_macrociclo = new.cod_macrociclo;	
end if;
if ifnull(v_tip_mesociclo_new,0) != ifnull(v_tip_mesociclo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'mesociclo', v_val_prk, 'tip_mesociclo', cast(v_tip_mesociclo_old as char), cast(v_tip_mesociclo_new as char), null, null);
end if;
if ifnull(v_obs_mesociclo_new,0) != ifnull(v_obs_mesociclo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'mesociclo', v_val_prk, 'obs_mesociclo', cast(v_obs_mesociclo_old as char), cast(v_obs_mesociclo_new as char), null, null);
end if;
if ifnull(v_qtd_pontos_mesociclo_new,0) != ifnull(v_qtd_pontos_mesociclo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'mesociclo', v_val_prk, 'qtd_pontos_mesociclo', cast(v_qtd_pontos_mesociclo_old as char), cast(v_qtd_pontos_mesociclo_new as char), null, null);
set fim_cursor = 0;
set v_macro_qtd_pontos = 0;
open cur_pontos;
cursor_loop:loop
	fetch cur_pontos into v_meso_qtd_pontos;
	if fim_cursor = 1 then
		leave cursor_loop;
	end if;
	set v_macro_qtd_pontos = v_macro_qtd_pontos + v_meso_qtd_pontos;
end loop cursor_loop;
update macrociclo set qtd_pontos_macrociclo = v_macro_qtd_pontos where cod_macrociclo = new.cod_macrociclo;	
end if;
if ifnull(v_ind_executado_new,0) != ifnull(v_ind_executado_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'mesociclo', v_val_prk, 'ind_executado', cast(v_ind_executado_old as char), cast(v_ind_executado_new as char), null, null);
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__mesociclo_ad
after delete on mesociclo
for each row
begin
declare v_val_prk int(11);
declare v_cod_macrociclo_old int(11);
declare v_num_ordem_mesociclo_old int(11);
declare v_qtd_microciclos_mesociclo_old int(11);
declare v_tip_mesociclo_old varchar(255);
declare v_obs_mesociclo_old varchar(255);
declare v_qtd_pontos_mesociclo_old float(11);
declare v_ind_executado_old int(1);
declare v_meso_qtd_microciclos int;
declare v_macro_qtd_microciclos int;
declare v_meso_qtd_pontos float;
declare v_macro_qtd_pontos float;
declare fim_cursor int;
declare cur_mesociclos cursor for
	select qtd_microciclos_mesociclo
	from mesociclo
	where cod_macrociclo = old.cod_macrociclo;
declare cur_pontos cursor for
	select qtd_pontos_mesociclo
	from mesociclo
	where cod_macrociclo = old.cod_macrociclo;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_cursor = 1;
set v_val_prk := old.cod_mesociclo;
set v_cod_macrociclo_old := old.cod_macrociclo;
set v_num_ordem_mesociclo_old := old.num_ordem_mesociclo;
set v_qtd_microciclos_mesociclo_old := old.qtd_microciclos_mesociclo;
set v_tip_mesociclo_old := old.tip_mesociclo;
set v_obs_mesociclo_old := old.obs_mesociclo;
set v_qtd_pontos_mesociclo_old := old.qtd_pontos_mesociclo;
set v_ind_executado_old := old.ind_executado;
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'mesociclo', v_val_prk, 'cod_mesociclo', cast(old.cod_mesociclo as char), null, null, null);
if ifnull(v_cod_macrociclo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'mesociclo', v_val_prk, 'cod_macrociclo', cast(v_cod_macrociclo_old as char), null, null, null);
end if;
if ifnull(v_num_ordem_mesociclo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'mesociclo', v_val_prk, 'num_ordem_mesociclo', cast(v_num_ordem_mesociclo_old as char), null, null, null);
end if;
if ifnull(v_qtd_microciclos_mesociclo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'mesociclo', v_val_prk, 'qtd_microciclos_mesociclo', cast(v_qtd_microciclos_mesociclo_old as char), null, null, null);
set fim_cursor = 0;
set v_macro_qtd_microciclos = 0;
open cur_mesociclos;
cursor_loop:loop
	fetch cur_mesociclos into v_meso_qtd_microciclos;
	if fim_cursor = 1 then
		leave cursor_loop;
	end if;
	set v_macro_qtd_microciclos = v_macro_qtd_microciclos + v_meso_qtd_microciclos;
end loop cursor_loop;
update macrociclo set qtd_microciclos_macrociclo = v_macro_qtd_microciclos where cod_macrociclo = old.cod_macrociclo;
end if;
if ifnull(v_tip_mesociclo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'mesociclo', v_val_prk, 'tip_mesociclo', cast(v_tip_mesociclo_old as char), null, null, null);
end if;
if ifnull(v_obs_mesociclo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'mesociclo', v_val_prk, 'obs_mesociclo', cast(v_obs_mesociclo_old as char), null, null, null);
end if;
if ifnull(v_qtd_pontos_mesociclo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'mesociclo', v_val_prk, 'qtd_pontos_mesociclo', cast(v_qtd_pontos_mesociclo_old as char), null, null, null);
set fim_cursor = 0;
set v_macro_qtd_pontos = 0;
open cur_pontos;
cursor_loop:loop
	fetch cur_pontos into v_meso_qtd_pontos;
	if fim_cursor = 1 then
		leave cursor_loop;
	end if;
	set v_macro_qtd_pontos = v_macro_qtd_pontos + v_meso_qtd_pontos;
end loop cursor_loop;
update macrociclo set qtd_pontos_macrociclo = v_macro_qtd_pontos where cod_macrociclo = old.cod_macrociclo;	
end if;
if ifnull(v_ind_executado_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'mesociclo', v_val_prk, 'ind_executado', cast(v_ind_executado_old as char), null, null, null);
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mesociclo_modelo`
--

DROP TABLE IF EXISTS `mesociclo_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesociclo_modelo` (
  `cod_mesociclo_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_treinador` int(11) DEFAULT NULL,
  `cod_macrociclo_modelo` int(11) DEFAULT NULL,
  `nom_mesociclo_modelo` varchar(255) DEFAULT NULL,
  `num_ordem_mesociclo` int(11) DEFAULT NULL,
  `qtd_microciclos_mesociclo` int(11) DEFAULT NULL,
  `tip_mesociclo` varchar(255) DEFAULT NULL,
  `obs_mesociclo` text,
  `qtd_pontos_mesociclo` float DEFAULT NULL,
  `ind_executado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cod_mesociclo_modelo`),
  KEY `frk_mesociclo_modelo_cod_macrociclo_modelo` (`cod_macrociclo_modelo`),
  KEY `frk_mesociclo_modelo_cod_usuario` (`cod_treinador`),
  CONSTRAINT `frk_mesociclo_modelo_cod_macrociclo_modelo` FOREIGN KEY (`cod_macrociclo_modelo`) REFERENCES `macrociclo_modelo` (`cod_macrociclo_modelo`),
  CONSTRAINT `frk_mesociclo_modelo_cod_treinador` FOREIGN KEY (`cod_treinador`) REFERENCES `treinador` (`cod_treinador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Fases compreendidas por semanas (microciclos).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesociclo_modelo`
--

LOCK TABLES `mesociclo_modelo` WRITE;
/*!40000 ALTER TABLE `mesociclo_modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesociclo_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microciclo`
--

DROP TABLE IF EXISTS `microciclo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `microciclo` (
  `cod_microciclo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_mesociclo` int(11) NOT NULL,
  `nom_microciclo` varchar(255) DEFAULT NULL,
  `num_ordem_microciclo` int(11) NOT NULL,
  `dat_inicio` date NOT NULL,
  `dat_fim` date NOT NULL,
  `qtd_carga_kg_total` float NOT NULL,
  `qtd_distancia_km_total` float NOT NULL,
  `qtd_tempo_total` time NOT NULL,
  `num_fc_le_minima` int(3) DEFAULT NULL,
  `num_fc_le_maxima` int(3) DEFAULT NULL,
  `tmp_ritmo_le` time DEFAULT NULL,
  `num_fc_mo_minima` int(3) DEFAULT NULL,
  `num_fc_mo_maxima` int(3) DEFAULT NULL,
  `tmp_ritmo_mo` time DEFAULT NULL,
  `num_fc_fo_minima` int(3) DEFAULT NULL,
  `num_fc_fo_maxima` int(3) DEFAULT NULL,
  `tmp_ritmo_fo` time DEFAULT NULL,
  `qtd_pontos_microciclo` float DEFAULT NULL,
  `ind_executado` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_microciclo`),
  UNIQUE KEY `nom_microciclo_UNIQUE` (`nom_microciclo`),
  KEY `frk_microciclo_cod_mesociclo` (`cod_mesociclo`),
  CONSTRAINT `frk_microciclo_cod_mesociclo` FOREIGN KEY (`cod_mesociclo`) REFERENCES `mesociclo` (`cod_mesociclo`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microciclo`
--

LOCK TABLES `microciclo` WRITE;
/*!40000 ALTER TABLE `microciclo` DISABLE KEYS */;
INSERT INTO `microciclo` VALUES (1,11,'Micro 1',2,'2011-08-08','2011-08-14',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',20,0),(3,11,'Micro 2',1,'2011-08-08','2011-08-14',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',30,0),(4,11,'Micro 3',3,'2011-08-15','2011-08-21',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',33,0),(5,11,'Micro 4',4,'2011-08-22','2011-08-28',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',60,0),(8,12,'Micro 5',5,'2011-08-29','2011-09-04',0,0,'00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,0),(10,12,'Micro 6',6,'2011-09-05','2011-09-11',0,0,'00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,55,0),(11,12,'Micro 8',8,'2011-09-19','2011-09-25',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',60,0),(12,12,'Micro 7',7,'2011-09-12','2011-09-18',0,0,'00:00:00',0,0,'00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,75,0),(17,13,'Micro 9',9,'2011-09-26','2011-10-31',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',55,0),(18,13,'Micro 10',10,'2011-11-01','2011-08-07',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',60,0),(19,13,'Micro 11',11,'2011-11-07','2011-08-14',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',85,0),(20,13,'Micro 12',12,'2011-08-15','2011-08-21',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',70,0),(21,14,'Micro 13',13,'2011-08-22','2011-08-28',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',80,0),(22,14,'Micro 14',14,'2011-08-29','2011-09-04',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',90,0),(23,14,'Micro 15',15,'2011-12-05','2011-12-11',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',100,0),(24,14,'Micro 16',16,'2011-12-12','2011-09-18',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',85,0),(25,15,'Micro 17',17,'2011-12-19','2011-09-25',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',100,0),(26,15,'Micro 18',18,'2011-12-26','2012-01-01',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',110,0),(27,15,'Micro 19',19,'2012-01-02','2012-01-08',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',115,0),(28,15,'Micro 20',20,'2012-01-09','2012-01-15',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',100,0),(29,17,'Micro 21',21,'2012-01-16','2012-01-22',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',60,0),(30,17,'Micro 22',22,'2012-01-23','2012-01-29',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',65,0),(32,17,'Micro 24',24,'2012-02-06','2012-02-12',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',40,0),(104,16,'ghsdfhsfdgh',1,'2011-09-07','2011-09-14',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',20,0),(110,16,'gybjghdjbg',4,'2011-09-07','2011-09-12',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',20,0),(115,17,'Micro 23',23,'2012-01-30','2012-02-05',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0),(117,17,'teste',25,'2012-02-13','2012-02-19',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0),(118,17,'teste2',26,'2012-02-20','2012-02-26',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0,'00:00:00',0,0);
/*!40000 ALTER TABLE `microciclo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_log__microciclo_ai 
AFTER INSERT ON microciclo
FOR EACH ROW
begin
declare v_micro_qtd_pontos float;
declare v_meso_qtd_pontos float;
declare v_meso_qtd_microciclos integer;
declare fim_cursor int;
declare cur_pontos cursor for
	select qtd_pontos_microciclo
	from microciclo
	where cod_mesociclo = new.cod_mesociclo;
declare cur_microciclos cursor for
	select count(cod_microciclo)
	from microciclo
	where cod_mesociclo = new.cod_mesociclo;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_cursor = 1;
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'insert', now(), 'microciclo', null, 'cod_microciclo', null, cast(new.cod_microciclo as char), null, null);
set fim_cursor = 0;
set v_meso_qtd_pontos = 0;
if (new.qtd_pontos_microciclo != 0) then
	open cur_pontos;
	cursor_loop_pontos:loop
		fetch cur_pontos into v_micro_qtd_pontos;
		if fim_cursor = 1 then
			leave cursor_loop_pontos;
		end if;
		set v_meso_qtd_pontos = v_meso_qtd_pontos + v_micro_qtd_pontos;
	end loop cursor_loop_pontos;
	update mesociclo set qtd_pontos_mesociclo = v_meso_qtd_pontos where cod_mesociclo = new.cod_mesociclo;	
end if;
set fim_cursor = 0;
set v_meso_qtd_microciclos = 0;
open cur_microciclos;
cursor_loop_microciclos:loop
	fetch cur_microciclos into v_meso_qtd_microciclos;
	if fim_cursor = 1 then
		leave cursor_loop_microciclos;
	end if;
end loop cursor_loop_microciclos;
update mesociclo set qtd_microciclos_mesociclo = v_meso_qtd_microciclos where cod_mesociclo = new.cod_mesociclo;
update macrociclo inner join mesociclo on (macrociclo.cod_macrociclo = mesociclo.cod_macrociclo) set macrociclo.dat_fim = new.dat_fim where mesociclo.cod_mesociclo = new.cod_mesociclo;	
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__microciclo_au 
after update on microciclo
for each row
begin
declare v_val_prk int(11);
declare v_cod_mesociclo_old int(11);
declare v_cod_mesociclo_new int(11);
declare v_nom_microciclo_old varchar(255);
declare v_nom_microciclo_new varchar(255);
declare v_num_ordem_microciclo_old int(11);
declare v_num_ordem_microciclo_new int(11);
declare v_dat_inicio_old varchar(255);
declare v_dat_inicio_new varchar(255);
declare v_dat_fim_old varchar(255);
declare v_dat_fim_new varchar(255);
declare v_qtd_carga_kg_total_old float(11);
declare v_qtd_carga_kg_total_new float(11);
declare v_qtd_distancia_km_total_old float(11);
declare v_qtd_distancia_km_total_new int(11);
declare v_qtd_tempo_total_old varchar(255);
declare v_qtd_tempo_total_new varchar(255);
declare v_num_fc_le_minima_old int(3);
declare v_num_fc_le_minima_new int(3);
declare v_num_fc_le_maxima_old int(3);
declare v_num_fc_le_maxima_new int(3);
declare v_tmp_ritmo_le_old varchar(255);
declare v_tmp_ritmo_le_new varchar(255);
declare v_num_fc_mo_minima_old int(3);
declare v_num_fc_mo_minima_new int(3);
declare v_num_fc_mo_maxima_old int(3);
declare v_num_fc_mo_maxima_new int(3);
declare v_tmp_ritmo_mo_old varchar(255);
declare v_tmp_ritmo_mo_new varchar(255);
declare v_num_fc_fo_minima_old int(3);
declare v_num_fc_fo_minima_new int(3);
declare v_num_fc_fo_maxima_old int(3);
declare v_num_fc_fo_maxima_new int(3);
declare v_tmp_ritmo_fo_old varchar(255);
declare v_tmp_ritmo_fo_new varchar(255);
declare v_qtd_pontos_microciclo_old float(11);
declare v_qtd_pontos_microciclo_new float(11);
declare v_ind_executado_old int(1);
declare v_ind_executado_new int(1);
declare v_micro_qtd_pontos float;
declare v_meso_qtd_pontos float;
declare fim_cursor int;
declare cur_pontos cursor for
	select qtd_pontos_microciclo
	from microciclo
	where cod_mesociclo = new.cod_mesociclo;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_cursor = 1;
set v_val_prk := old.cod_microciclo;
set v_cod_mesociclo_old := old.cod_mesociclo;
set v_cod_mesociclo_new := new.cod_mesociclo;
set v_nom_microciclo_old := old.nom_microciclo;
set v_nom_microciclo_new := new.nom_microciclo;
set v_num_ordem_microciclo_old := old.num_ordem_microciclo;
set v_num_ordem_microciclo_new := new.num_ordem_microciclo;
set v_dat_inicio_old := old.dat_inicio;
set v_dat_inicio_new := new.dat_inicio;
set v_dat_fim_old := old.dat_fim;
set v_dat_fim_new := new.dat_fim;
set v_qtd_carga_kg_total_old := old.qtd_carga_kg_total;
set v_qtd_carga_kg_total_new := new.qtd_carga_kg_total;
set v_qtd_distancia_km_total_old := old.qtd_distancia_km_total;
set v_qtd_distancia_km_total_new := new.qtd_distancia_km_total;
set v_qtd_tempo_total_old := old.qtd_tempo_total;
set v_qtd_tempo_total_new := new.qtd_tempo_total;
set v_num_fc_le_minima_old := old.num_fc_le_minima;
set v_num_fc_le_minima_new := new.num_fc_le_minima;
set v_num_fc_le_maxima_old := old.num_fc_le_maxima;
set v_num_fc_le_maxima_new := new.num_fc_le_maxima;
set v_tmp_ritmo_le_old := old.tmp_ritmo_le;
set v_tmp_ritmo_le_new := new.tmp_ritmo_le;
set v_num_fc_mo_minima_old := old.num_fc_mo_minima;
set v_num_fc_mo_minima_new := new.num_fc_mo_minima;
set v_num_fc_mo_maxima_old := old.num_fc_mo_maxima;
set v_num_fc_mo_maxima_new := new.num_fc_mo_maxima;
set v_tmp_ritmo_mo_old := old.tmp_ritmo_mo;
set v_tmp_ritmo_mo_new := new.tmp_ritmo_mo;
set v_num_fc_fo_minima_old := old.num_fc_fo_minima;
set v_num_fc_fo_minima_new := new.num_fc_fo_minima;
set v_num_fc_fo_maxima_old := old.num_fc_fo_maxima;
set v_num_fc_fo_maxima_new := new.num_fc_fo_maxima;
set v_tmp_ritmo_fo_old := old.tmp_ritmo_fo;
set v_tmp_ritmo_fo_new := new.tmp_ritmo_fo;
set v_qtd_pontos_microciclo_old := old.qtd_pontos_microciclo;
set v_qtd_pontos_microciclo_new := new.qtd_pontos_microciclo;
set v_ind_executado_old := old.ind_executado;
set v_ind_executado_new := new.ind_executado;
if ifnull(v_cod_mesociclo_new,0) != ifnull(v_cod_mesociclo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'cod_mesociclo', cast(v_cod_mesociclo_old as char), cast(v_cod_mesociclo_new as char), null, null);
end if;
if ifnull(v_nom_microciclo_new,0) != ifnull(v_nom_microciclo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'nom_microciclo', cast(v_nom_microciclo_old as char), cast(v_nom_microciclo_new as char), null, null);
end if;
if ifnull(v_num_ordem_microciclo_new,0) != ifnull(v_num_ordem_microciclo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'num_ordem_microciclo', cast(v_num_ordem_microciclo_old as char), cast(v_num_ordem_microciclo_new as char), null, null);
end if;
if ifnull(v_dat_inicio_new,0) != ifnull(v_dat_inicio_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'dat_inicio', cast(v_dat_inicio_old as char), cast(v_dat_inicio_new as char), null, null);
end if;
if ifnull(v_dat_fim_new,0) != ifnull(v_dat_fim_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'dat_fim', cast(v_dat_fim_old as char), cast(v_dat_fim_new as char), null, null);
end if;
if ifnull(v_qtd_carga_kg_total_new,0) != ifnull(v_qtd_carga_kg_total_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'qtd_carga_kg_total', cast(v_qtd_carga_kg_total_old as char), cast(v_qtd_carga_kg_total_new as char), null, null);
end if;
if ifnull(v_qtd_distancia_km_total_new,0) != ifnull(v_qtd_distancia_km_total_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'qtd_distancia_km_total', cast(v_qtd_distancia_km_total_old as char), cast(v_qtd_distancia_km_total_new as char), null, null);
end if;
if ifnull(v_qtd_tempo_total_new,0) != ifnull(v_qtd_tempo_total_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'qtd_tempo_total', cast(v_qtd_tempo_total_old as char), cast(v_qtd_tempo_total_new as char), null, null);
end if;
if ifnull(v_num_fc_le_minima_new,0) != ifnull(v_num_fc_le_minima_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'num_fc_le_minima', cast(v_num_fc_le_minima_old as char), cast(v_num_fc_le_minima_new as char), null, null);
end if;
if ifnull(v_num_fc_le_maxima_new,0) != ifnull(v_num_fc_le_maxima_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'num_fc_le_maxima', cast(v_num_fc_le_maxima_old as char), cast(v_num_fc_le_maxima_new as char), null, null);
end if;
if ifnull(v_tmp_ritmo_le_new,0) != ifnull(v_tmp_ritmo_le_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'tmp_ritmo_le', cast(v_tmp_ritmo_le_old as char), cast(v_tmp_ritmo_le_new as char), null, null);
end if;
if ifnull(v_num_fc_mo_minima_new,0) != ifnull(v_num_fc_mo_minima_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'num_fc_mo_minima', cast(v_num_fc_mo_minima_old as char), cast(v_num_fc_mo_minima_new as char), null, null);
end if;
if ifnull(v_num_fc_mo_maxima_new,0) != ifnull(v_num_fc_mo_maxima_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'num_fc_mo_maxima', cast(v_num_fc_mo_maxima_old as char), cast(v_num_fc_mo_maxima_new as char), null, null);
end if;
if ifnull(v_tmp_ritmo_mo_new,0) != ifnull(v_tmp_ritmo_mo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'tmp_ritmo_mo', cast(v_tmp_ritmo_mo_old as char), cast(v_tmp_ritmo_mo_new as char), null, null);
end if;
if ifnull(v_num_fc_fo_minima_new,0) != ifnull(v_num_fc_fo_minima_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'num_fc_fo_minima', cast(v_num_fc_fo_minima_old as char), cast(v_num_fc_fo_minima_new as char), null, null);
end if;
if ifnull(v_num_fc_fo_maxima_new,0) != ifnull(v_num_fc_fo_maxima_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'num_fc_fo_maxima', cast(v_num_fc_fo_maxima_old as char), cast(v_num_fc_fo_maxima_new as char), null, null);
end if;
if ifnull(v_tmp_ritmo_fo_new,0) != ifnull(v_tmp_ritmo_fo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'tmp_ritmo_fo', cast(v_tmp_ritmo_fo_old as char), cast(v_tmp_ritmo_fo_new as char), null, null);
end if;
if ifnull(v_qtd_pontos_microciclo_new,0) != ifnull(v_qtd_pontos_microciclo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'qtd_pontos_microciclo', cast(v_qtd_pontos_microciclo_old as char), cast(v_qtd_pontos_microciclo_new as char), null, null);
set fim_cursor = 0;
set v_meso_qtd_pontos = 0;
open cur_pontos;
cursor_loop:loop
	fetch cur_pontos into v_micro_qtd_pontos;
	if fim_cursor = 1 then
		leave cursor_loop;
	end if;
	set v_meso_qtd_pontos = v_meso_qtd_pontos + v_micro_qtd_pontos;
end loop cursor_loop;
update mesociclo set qtd_pontos_mesociclo = v_meso_qtd_pontos where cod_mesociclo = new.cod_mesociclo;	
end if;
if ifnull(v_ind_executado_new,0) != ifnull(v_ind_executado_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'microciclo', v_val_prk, 'ind_executado', cast(v_ind_executado_old as char), cast(v_ind_executado_new as char), null, null);
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__microciclo_ad
after delete on microciclo
for each row
begin
declare v_val_prk int(11);
declare v_cod_mesociclo_old int(11);
declare v_nom_microciclo_old varchar(255);
declare v_num_ordem_microciclo_old int(11);
declare v_dat_inicio_old varchar(255);
declare v_dat_fim_old varchar(255);
declare v_qtd_carga_kg_total_old float(11);
declare v_qtd_distancia_km_total_old float(11);
declare v_qtd_tempo_total_old varchar(255);
declare v_num_fc_le_minima_old int(3);
declare v_num_fc_le_maxima_old int(3);
declare v_tmp_ritmo_le_old varchar(255);
declare v_num_fc_mo_minima_old int(3);
declare v_num_fc_mo_maxima_old int(3);
declare v_tmp_ritmo_mo_old varchar(255);
declare v_num_fc_fo_minima_old int(3);
declare v_num_fc_fo_maxima_old int(3);
declare v_tmp_ritmo_fo_old varchar(255);
declare v_qtd_pontos_microciclo_old float(11);
declare v_ind_executado_old int(1);
declare v_micro_qtd_pontos float;
declare v_meso_qtd_pontos float;
declare v_meso_qtd_microciclos integer;
declare fim_cursor int;
declare cur_pontos cursor for
	select qtd_pontos_microciclo
	from microciclo
	where cod_mesociclo = old.cod_mesociclo;
declare cur_microciclos cursor for
	select count(cod_microciclo)
	from microciclo
	where cod_mesociclo = old.cod_mesociclo;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_cursor = 1;
set v_val_prk := old.cod_microciclo;
set v_cod_mesociclo_old := old.cod_mesociclo;
set v_nom_microciclo_old := old.nom_microciclo;
set v_num_ordem_microciclo_old := old.num_ordem_microciclo;
set v_dat_inicio_old := old.dat_inicio;
set v_dat_fim_old := old.dat_fim;
set v_qtd_carga_kg_total_old := old.qtd_carga_kg_total;
set v_qtd_distancia_km_total_old := old.qtd_distancia_km_total;
set v_qtd_tempo_total_old := old.qtd_tempo_total;
set v_num_fc_le_minima_old := old.num_fc_le_minima;
set v_num_fc_le_maxima_old := old.num_fc_le_maxima;
set v_tmp_ritmo_le_old := old.tmp_ritmo_le;
set v_num_fc_mo_minima_old := old.num_fc_mo_minima;
set v_num_fc_mo_maxima_old := old.num_fc_mo_maxima;
set v_tmp_ritmo_mo_old := old.tmp_ritmo_mo;
set v_num_fc_fo_minima_old := old.num_fc_fo_minima;
set v_num_fc_fo_maxima_old := old.num_fc_fo_maxima;
set v_tmp_ritmo_fo_old := old.tmp_ritmo_fo;
set v_qtd_pontos_microciclo_old := old.qtd_pontos_microciclo;
set v_ind_executado_old := old.ind_executado;
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'cod_microciclo', cast(old.cod_microciclo as char), null, null, null);
if ifnull(v_cod_mesociclo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'cod_mesociclo', cast(v_cod_mesociclo_old as char), null, null, null);
end if;
if ifnull(v_nom_microciclo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'nom_microciclo', cast(v_nom_microciclo_old as char), null, null, null);
end if;
if ifnull(v_num_ordem_microciclo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'num_ordem_microciclo', cast(v_num_ordem_microciclo_old as char), null, null, null);
end if;
if ifnull(v_dat_inicio_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'dat_inicio', cast(v_dat_inicio_old as char), null, null, null);
end if;
if ifnull(v_dat_fim_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'dat_fim', cast(v_dat_fim_old as char), null, null, null);
end if;
if ifnull(v_qtd_carga_kg_total_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'qtd_carga_kg_total', cast(v_qtd_carga_kg_total_old as char), null, null, null);
end if;
if ifnull(v_qtd_distancia_km_total_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'qtd_distancia_km_total', cast(v_qtd_distancia_km_total_old as char), null, null, null);
end if;
if ifnull(v_qtd_tempo_total_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'qtd_tempo_total', cast(v_qtd_tempo_total_old as char), null, null, null);
end if;
if ifnull(v_num_fc_le_minima_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'num_fc_le_minima', cast(v_num_fc_le_minima_old as char), null, null, null);
end if;
if ifnull(v_num_fc_le_maxima_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'num_fc_le_maxima', cast(v_num_fc_le_maxima_old as char), null, null, null);
end if;
if ifnull(v_tmp_ritmo_le_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'tmp_ritmo_le', cast(v_tmp_ritmo_le_old as char), null, null, null);
end if;
if ifnull(v_num_fc_mo_minima_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'num_fc_mo_minima', cast(v_num_fc_mo_minima_old as char), null, null, null);
end if;
if ifnull(v_num_fc_mo_maxima_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'num_fc_mo_maxima', cast(v_num_fc_mo_maxima_old as char), null, null, null);
end if;
if ifnull(v_tmp_ritmo_mo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'tmp_ritmo_mo', cast(v_tmp_ritmo_mo_old as char), null, null, null);
end if;
if ifnull(v_num_fc_fo_minima_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'num_fc_fo_minima', cast(v_num_fc_fo_minima_old as char), null, null, null);
end if;
if ifnull(v_num_fc_fo_maxima_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'num_fc_fo_maxima', cast(v_num_fc_fo_maxima_old as char), null, null, null);
end if;
if ifnull(v_tmp_ritmo_fo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'tmp_ritmo_fo', cast(v_tmp_ritmo_fo_old as char), null, null, null);
end if;
if ifnull(v_qtd_pontos_microciclo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'qtd_pontos_microciclo', cast(v_qtd_pontos_microciclo_old as char), null, null, null);
set fim_cursor = 0;
set v_meso_qtd_pontos = 0;
open cur_pontos;
cursor_loop_pontos:loop
	fetch cur_pontos into v_micro_qtd_pontos;
	if fim_cursor = 1 then
		leave cursor_loop_pontos;
	end if;
	set v_meso_qtd_pontos = v_meso_qtd_pontos + v_micro_qtd_pontos;
end loop cursor_loop_pontos;
update mesociclo set qtd_pontos_mesociclo = v_meso_qtd_pontos where cod_mesociclo = old.cod_mesociclo;	
end if;
if ifnull(v_ind_executado_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'microciclo', v_val_prk, 'ind_executado', cast(v_ind_executado_old as char), null, null, null);
end if;
set fim_cursor = 0;
set v_meso_qtd_microciclos = 0;
open cur_microciclos;
cursor_loop_microciclos:loop
	fetch cur_microciclos into v_meso_qtd_microciclos;
	if fim_cursor = 1 then
		leave cursor_loop_microciclos;
	end if;
end loop cursor_loop_microciclos;
update mesociclo set qtd_microciclos_mesociclo = v_meso_qtd_microciclos where cod_mesociclo = old.cod_mesociclo;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `microciclo_modelo`
--

DROP TABLE IF EXISTS `microciclo_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `microciclo_modelo` (
  `cod_microciclo_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_treinador` int(11) DEFAULT NULL,
  `cod_mesociclo_modelo` int(11) DEFAULT NULL,
  `nom_microciclo_modelo` varchar(255) DEFAULT NULL,
  `num_ordem_microciclo` int(11) DEFAULT NULL,
  `dat_inicio` date DEFAULT NULL,
  `dat_fim` date DEFAULT NULL,
  `qtd_carga_kg_total` float DEFAULT NULL,
  `qtd_distancia_km_total` float DEFAULT NULL,
  `qtd_tempo_total` time DEFAULT NULL,
  `num_fc_le_minima` int(3) DEFAULT NULL,
  `num_fc_le_maxima` int(3) DEFAULT NULL,
  `tmp_ritmo_le` time DEFAULT NULL,
  `num_fc_mo_minima` int(3) DEFAULT NULL,
  `num_fc_mo_maxima` int(3) DEFAULT NULL,
  `tmp_ritmo_mo` time DEFAULT NULL,
  `num_fc_fo_minima` int(3) DEFAULT NULL,
  `num_fc_fo_maxima` int(3) DEFAULT NULL,
  `tmp_ritmo_fo` time DEFAULT NULL,
  `qtd_pontos_microciclo` float DEFAULT NULL,
  `ind_executado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cod_microciclo_modelo`),
  KEY `frk_microciclo_modelo_cod_mesociclo_modelo` (`cod_mesociclo_modelo`),
  KEY `frk_microciclo_modelo_cod_usuario` (`cod_treinador`),
  CONSTRAINT `frk_microciclo_modelo_cod_mesociclo_modelo` FOREIGN KEY (`cod_mesociclo_modelo`) REFERENCES `mesociclo_modelo` (`cod_mesociclo_modelo`),
  CONSTRAINT `frk_microciclo_modelo_cod_treinador` FOREIGN KEY (`cod_treinador`) REFERENCES `treinador` (`cod_treinador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Modelo de Microciclo (Período de uma semana).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microciclo_modelo`
--

LOCK TABLES `microciclo_modelo` WRITE;
/*!40000 ALTER TABLE `microciclo_modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `microciclo_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `state` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'Jena','3967 Sed St.','South Dakota'),(2,'Laurel','P.O. Box 478, 3963 Cursus St.','Maine'),(3,'Ava','248-5104 Ligula Avenue','IA'),(4,'Paloma','448-2971 Auctor. Av.','NJ'),(5,'Kaseem','1675 Id, St.','California'),(6,'Maite','P.O. Box 557, 5661 Egestas Rd.','MI'),(7,'Karleigh','6245 Quis, Rd.','Alabama'),(8,'Lysandra','Ap #102-9761 Proin Ave','NH'),(9,'Carter','131-8840 Metus Street','Montana'),(10,'Deirdre','Ap #170-7629 Cursus. Street','NC'),(11,'Dominic','Ap #618-9757 Pharetra Rd.','KS'),(12,'Hop','772-3109 Ante. Rd.','Alabama'),(13,'Lenore','107-9328 Erat Av.','OK'),(14,'John','P.O. Box 661, 6238 Vivamus Rd.','KS'),(15,'Lyle','Ap #258-1054 Sed Rd.','New York'),(16,'Jamal','9241 Odio Av.','NC'),(17,'Lynn','635-6259 Hendrerit St.','IL'),(18,'Emmanuel','Ap #164-9343 Suspendisse Street','New Hampshire'),(19,'Lane','P.O. Box 574, 1474 Mus. Ave','Maine'),(20,'Jamalia','6052 Ipsum Rd.','Wyoming'),(21,'Quinn','P.O. Box 372, 9014 Tincidunt Rd.','NM'),(22,'Xenos','Ap #174-5044 Dictum Avenue','PA'),(23,'Quincy','P.O. Box 854, 6981 Luctus Street','MA'),(24,'Orson','Ap #434-1895 Tellus Rd.','MD'),(25,'Candice','Ap #340-6661 Amet St.','Tennessee'),(26,'Breanna','8347 Netus Rd.','AZ'),(27,'Dawn','Ap #377-8505 Consequat St.','Utah'),(28,'Martina','P.O. Box 580, 9236 Augue Ave','New York'),(29,'Lucas','143-3529 Porttitor Street','NV'),(30,'Fredericka','294-9650 Proin St.','Vermont'),(31,'Doris','8210 Est, St.','Nebraska'),(32,'Oliver','173-8147 Enim St.','Iowa'),(33,'Norman','839-832 Aenean Ave','Alaska'),(34,'Jaime','348-948 Consectetuer Av.','MA'),(35,'Galvin','P.O. Box 401, 8839 Justo. Road','Ohio'),(36,'Constance','178-9344 Erat. Street','Louisiana'),(37,'Ebony','Ap #153-7975 Faucibus Av.','Maryland'),(38,'Lacey','338-1071 Dictum Rd.','MN'),(39,'Oprah','Ap #185-5075 Suspendisse St.','NV'),(40,'Teegan','Ap #147-5573 Phasellus Avenue','Oklahoma'),(41,'David','788-9475 Turpis. St.','Georgia'),(42,'Theodore','795-5592 Sapien. Ave','MN'),(43,'Yael','Ap #404-9812 In St.','WY'),(44,'Armando','Ap #724-9548 Amet, Ave','Alabama'),(45,'Marshall','7276 Ut Avenue','NE'),(46,'Orlando','P.O. Box 768, 5129 Quisque Rd.','West Virginia'),(47,'Xenos','9687 Fringilla, Rd.','MA'),(48,'Fredericka','P.O. Box 209, 4026 Cras Ave','West Virginia'),(49,'Kellie','P.O. Box 756, 174 Orci Street','Illinois'),(50,'Thane','8443 Ligula. Av.','South Carolina'),(51,'Ralph','P.O. Box 536, 4158 Tellus St.','DC'),(52,'Illiana','885-6499 Malesuada. St.','DE'),(53,'Quail','P.O. Box 424, 7860 Enim. Av.','GA'),(54,'Mariko','P.O. Box 812, 2062 Imperdiet Road','WY'),(55,'Kuame','7197 Libero Av.','CO'),(56,'Drake','527-8837 Vitae St.','LA'),(57,'Victoria','P.O. Box 802, 3560 Nibh. Ave','HI'),(58,'Vivian','1068 Vehicula Rd.','HI'),(59,'Brian','P.O. Box 117, 6257 Porttitor Road','Delaware'),(60,'Jasper','9317 Etiam Rd.','West Virginia'),(61,'Neil','9569 Scelerisque Avenue','SC'),(62,'Yardley','P.O. Box 940, 4177 Dignissim Rd.','UT'),(63,'James','124-4302 Et Road','Arizona'),(64,'Patrick','Ap #656-3077 Imperdiet Rd.','New Jersey'),(65,'Herrod','9899 Quisque Avenue','Idaho'),(66,'Lee','470-7789 Neque Street','SC'),(67,'Griffith','335-9002 Eget St.','Utah'),(68,'Ahmed','Ap #382-4557 Consequat St.','ID'),(69,'Maggie','Ap #534-1274 Consequat, Rd.','WA'),(70,'Robert','P.O. Box 677, 5432 Pellentesque Street','Arizona'),(71,'Beck','Ap #520-8357 Porttitor Ave','CA'),(72,'Christine','416-3033 Ipsum Road','AK'),(73,'Abra','Ap #921-9878 Erat. Ave','West Virginia'),(74,'Hedwig','P.O. Box 320, 1494 Elementum Ave','WV'),(75,'Nell','8904 Eu Ave','ID'),(76,'Rae','3251 Nulla St.','West Virginia'),(77,'Orson','Ap #833-6523 Nulla St.','Wisconsin'),(78,'Charissa','P.O. Box 238, 946 Euismod Rd.','TX'),(79,'Lesley','544 Vitae St.','ME'),(80,'Sade','7270 Massa Road','NY'),(81,'Quinn','4213 Cras Road','West Virginia'),(82,'Clayton','762-6288 Aliquam Av.','Kansas'),(83,'Dylan','583-6491 At Road','HI'),(84,'Simone','728-426 Eu, Street','CA'),(85,'Graham','352 Ut Ave','RI'),(86,'Jamalia','7538 Fringilla Road','West Virginia'),(87,'Venus','P.O. Box 746, 8897 Sagittis Av.','North Dakota'),(88,'Hamish','516-9760 Mauris St.','Indiana'),(89,'Micah','661-8926 Pede, Road','Alabama'),(90,'Lawrence','Ap #658-1268 Commodo Rd.','New York'),(91,'Illiana','Ap #909-8828 Mus. Rd.','HI'),(92,'Paloma','619-9337 Ipsum Rd.','AL'),(93,'Quon','481-2680 Non Rd.','DC'),(94,'Christopher','P.O. Box 212, 548 Ullamcorper, Rd.','Ohio'),(95,'Imani','2157 Fusce St.','MD'),(96,'Mason','Ap #898-3159 Nascetur Rd.','MN'),(97,'Vernon','P.O. Box 642, 503 In Av.','Connecticut'),(98,'Ulric','Ap #204-594 Congue Rd.','IN'),(99,'Emi','207 A St.','Missouri'),(100,'Iola','5650 Mattis. St.','NM'),(101,'Conan','P.O. Box 412, 5243 Fusce Road','MT'),(102,'Kirestin','Ap #925-231 Sapien. St.','Indiana'),(103,'Tarik','968-2250 Molestie Av.','Delaware'),(104,'Pearl','P.O. Box 545, 9555 Risus. Ave','Missouri'),(105,'Boris','992-4588 Curabitur Av.','New York'),(106,'Jamalia','Ap #524-9345 Ligula Rd.','TX'),(107,'Naomi','7956 Arcu St.','NE'),(108,'Rylee','815-6528 Semper, Rd.','New Mexico'),(109,'Preston','495-8121 Ac Road','California'),(110,'Isabella','926-6672 Malesuada Avenue','WI'),(111,'Burton','P.O. Box 210, 5033 Arcu. St.','MN'),(112,'Dominic','P.O. Box 984, 9763 Fermentum Avenue','Maine'),(113,'Fulton','7932 Dignissim Rd.','SD'),(114,'Irene','947-5818 Purus, Road','WV'),(115,'Sara','765-5551 Luctus Street','North Carolina'),(116,'Jonah','481 Eu Street','HI'),(117,'Ian','P.O. Box 191, 5042 Nec St.','Nebraska'),(118,'Marsden','Ap #800-4543 Sed Rd.','Arkansas'),(119,'Raja','400-7354 Proin Street','NH'),(120,'Barbara','Ap #623-8318 Sem Av.','SD'),(121,'Charles','P.O. Box 241, 5917 Amet, Rd.','Pennsylvania'),(122,'Carla','5701 Libero Road','Connecticut'),(123,'Guinevere','4772 Nunc St.','Colorado'),(124,'Phoebe','554-636 Vivamus St.','AL'),(125,'Odette','930-4834 Eu, St.','Oklahoma'),(126,'Jonas','Ap #340-3129 Tempus Avenue','Iowa'),(127,'Xena','270-736 Consequat Road','New York'),(128,'Iris','9805 Luctus Rd.','AK'),(129,'Mona','512-5077 Eget St.','MD'),(130,'Veronica','P.O. Box 962, 6035 Nibh Rd.','KS'),(131,'Sopoline','964-6903 Est. Street','Nebraska'),(132,'Otto','P.O. Box 987, 2912 Nec Ave','Maine'),(133,'Melyssa','9810 Arcu St.','Massachusetts'),(134,'Rhea','P.O. Box 899, 7724 Dolor. Avenue','CT'),(135,'Jerry','P.O. Box 527, 7651 Pharetra, St.','GA'),(136,'Fatima','Ap #307-7472 Sagittis St.','LA'),(137,'Octavia','183 Aenean Avenue','TX'),(138,'Sylvia','P.O. Box 896, 1399 Diam Rd.','VA'),(139,'Finn','Ap #629-8028 Quam. Rd.','NC'),(140,'Darius','Ap #958-9527 Eleifend. Street','Washington'),(141,'Sara','8050 Sem Ave','New Mexico'),(142,'Dara','P.O. Box 915, 9894 Nunc Ave','Maine'),(143,'Hu','P.O. Box 717, 7730 Ac Rd.','Virginia'),(144,'Ishmael','790-476 Amet St.','MO'),(145,'Barry','1170 Et, Rd.','NH'),(146,'Driscoll','Ap #177-5059 Porttitor St.','NM'),(147,'Kibo','791-5244 Velit. St.','Wisconsin'),(148,'Beverly','Ap #115-2725 Ullamcorper. St.','New York'),(149,'Leila','2962 Arcu Ave','WA'),(150,'Ignatius','P.O. Box 114, 3722 In Av.','California'),(151,'Charlotte','P.O. Box 548, 2795 Non St.','ND'),(152,'Cheryl','1270 Cras Road','TN'),(153,'Remedios','Ap #180-6417 Nam St.','VA'),(154,'Chandler','195-2877 Pellentesque St.','IN'),(155,'Hanna','P.O. Box 488, 8121 Egestas Rd.','South Carolina'),(156,'Blythe','5426 Metus Rd.','GA'),(157,'Nicole','Ap #567-6162 Habitant Road','NM'),(158,'Zephr','401-1538 Euismod Ave','WV'),(159,'Dawn','P.O. Box 464, 3082 Interdum St.','VT'),(160,'Fletcher','Ap #290-3523 Eu, Rd.','Tennessee'),(161,'Mallory','Ap #738-3759 Vel Rd.','Wisconsin'),(162,'Imelda','Ap #141-4285 Duis Rd.','California'),(163,'Brenden','278-2313 Nulla Ave','South Carolina'),(164,'Denise','P.O. Box 501, 9745 Purus Street','WI'),(165,'Xaviera','Ap #709-4652 Lorem, Rd.','Iowa'),(166,'Piper','Ap #319-4739 Feugiat Rd.','North Carolina'),(167,'Keaton','8292 Non Rd.','Hawaii'),(168,'Noelani','Ap #891-5263 Sit Rd.','Nebraska'),(169,'Linda','5129 Consectetuer Rd.','AK'),(170,'Stephanie','P.O. Box 937, 2451 Pellentesque Rd.','Missouri'),(171,'Melissa','2855 Magnis Avenue','California'),(172,'Geoffrey','552-5525 Pharetra Road','Missouri'),(173,'Ramona','1246 Duis Road','CA'),(174,'Hu','P.O. Box 565, 6210 Gravida Avenue','TX'),(175,'Melvin','Ap #957-5990 Fringilla. Street','Iowa'),(176,'Clio','Ap #937-5274 Ac Ave','Iowa'),(177,'Shad','Ap #954-4438 Dictum Road','AK'),(178,'Astra','Ap #561-9232 Tristique Av.','IL'),(179,'Jonah','257-402 Et St.','VT'),(180,'Madeline','4679 Metus Street','ME'),(181,'Patience','7740 Velit Rd.','North Carolina'),(182,'Cassidy','P.O. Box 485, 3753 Libero Rd.','Maryland'),(183,'Ulla','P.O. Box 513, 5438 Non Rd.','AK'),(184,'Liberty','5386 Ante, Rd.','SC'),(185,'Caesar','1446 Duis Rd.','WI'),(186,'Patricia','812-5513 Malesuada Avenue','Louisiana'),(187,'Dante','8982 Ipsum Rd.','MS'),(188,'Anastasia','321-9552 Interdum. Avenue','South Dakota'),(189,'Frances','619-8829 Ac, St.','NH'),(190,'Joel','2553 Fringilla. Road','ND'),(191,'Kaye','P.O. Box 101, 4308 Magna. Road','Wisconsin'),(192,'Nicholas','Ap #449-6699 Ac Road','Montana'),(193,'Althea','Ap #633-1552 Sollicitudin Rd.','Wyoming'),(194,'Yvonne','1785 Penatibus Rd.','IL'),(195,'Cynthia','P.O. Box 555, 3404 Rhoncus. Rd.','TX'),(196,'Karyn','P.O. Box 527, 3544 Gravida Street','Connecticut'),(197,'Amber','P.O. Box 347, 6871 Mauris. Ave','WA'),(198,'Sierra','P.O. Box 450, 5515 Nulla Av.','New Jersey'),(199,'Zephania','2439 Tincidunt Avenue','DE'),(200,'Sydnee','P.O. Box 516, 7741 Sed Ave','DC'),(201,'Wynne','3045 Purus. Road','IA'),(202,'Brooke','Ap #409-3514 Nullam Avenue','Kentucky'),(203,'Camden','8526 Luctus Av.','Washington'),(204,'Cecilia','P.O. Box 889, 7140 Phasellus Av.','KY'),(205,'Wynter','517-3957 Donec Street','LA'),(206,'Yetta','221-3738 Urna. St.','Wyoming'),(207,'Thor','Ap #838-3122 Magnis St.','Alaska'),(208,'Barrett','P.O. Box 244, 1561 Amet Rd.','MI'),(209,'Tanek','592 A Avenue','District of Columbia'),(210,'Sacha','7265 Mauris Road','MN'),(211,'Sybill','382-3482 Molestie St.','MO'),(212,'Lesley','P.O. Box 196, 6211 Amet St.','FL'),(213,'Vernon','P.O. Box 644, 1189 Orci Street','AK'),(214,'Gisela','P.O. Box 333, 6873 Nulla Road','MT'),(215,'Noel','Ap #512-1850 Eros. Rd.','NV'),(216,'Cheryl','4745 Placerat. Rd.','Arkansas'),(217,'Emerson','202-5624 Nec, St.','Montana'),(218,'Xyla','273-8513 Sit St.','OH'),(219,'Roth','245-1940 Nibh. Avenue','NM'),(220,'Hadley','6160 Volutpat St.','DE'),(221,'Gavin','4738 Aliquet Rd.','AZ'),(222,'Brielle','950-8771 Vitae, Rd.','SD'),(223,'Merritt','Ap #646-389 In, St.','Washington'),(224,'Sydney','P.O. Box 533, 6540 Placerat. Street','Delaware'),(225,'Chester','9044 Dictum Rd.','Illinois'),(226,'Paul','Ap #102-3657 Diam Ave','AZ'),(227,'Candice','P.O. Box 247, 7586 Eget Av.','Minnesota'),(228,'Benedict','P.O. Box 664, 7028 Vitae Rd.','FL'),(229,'Unity','758-8918 Lorem Ave','IA'),(230,'Gloria','107-495 Et Avenue','CA'),(231,'Ulric','Ap #821-7967 Consectetuer Ave','AZ'),(232,'Theodore','981-5948 Phasellus Rd.','IN'),(233,'Anika','6505 Nibh. Rd.','Vermont'),(234,'Jerome','Ap #229-278 Sollicitudin St.','SD'),(235,'Aspen','P.O. Box 130, 8319 Bibendum Avenue','New York'),(236,'Calvin','597-4607 Ultrices Road','District of Columbia'),(237,'Hall','210-2522 Natoque Street','OH'),(238,'Imelda','P.O. Box 129, 8216 Ut, St.','DE'),(239,'Taylor','P.O. Box 523, 7271 Donec Rd.','Virginia'),(240,'Zeph','112-1036 At, Rd.','KS'),(241,'Walter','248-8692 Erat Avenue','IA'),(242,'Graiden','P.O. Box 355, 3726 Nullam St.','MA'),(243,'Inga','Ap #958-3912 Pharetra Ave','KY'),(244,'Demetria','999-4647 Aliquam Ave','KY'),(245,'Dawn','P.O. Box 315, 3244 Phasellus Avenue','Minnesota'),(246,'Kylynn','640-9835 Blandit St.','Iowa'),(247,'Keith','7327 Purus, Street','NC'),(248,'Garth','Ap #763-8349 Eget Rd.','North Dakota'),(249,'Remedios','632-7462 Elit. St.','New Mexico'),(250,'Ainsley','581-8246 Suscipit, Street','TN'),(251,'Kelly','Ap #558-5257 Consequat Road','FL'),(252,'Camilla','P.O. Box 584, 9214 Vitae Avenue','SC'),(253,'Aretha','P.O. Box 303, 7269 Tempus St.','Nevada'),(254,'Finn','P.O. Box 905, 2586 Viverra. St.','NY'),(255,'Abdul','199-6952 Euismod Avenue','ID'),(256,'Bo','Ap #667-2364 Ut St.','TN'),(257,'Jenette','Ap #688-3782 Eu St.','Oregon'),(258,'Arthur','2179 Eu, Avenue','RI'),(259,'Xander','P.O. Box 731, 7742 Tempus Rd.','OK'),(260,'Hoyt','P.O. Box 465, 6227 Suspendisse St.','Massachusetts'),(261,'Daniel','653 Tristique St.','District of Columbia'),(262,'Arsenio','8546 Feugiat Av.','KS'),(263,'Zelenia','7420 Gravida Street','Florida'),(264,'Sage','117-5179 Diam St.','Illinois'),(265,'Xantha','P.O. Box 456, 3203 Fermentum Road','RI'),(266,'Brenda','231-8909 Consectetuer Avenue','Michigan'),(267,'Chelsea','9397 Eget Av.','WI'),(268,'Ethan','Ap #813-1572 Est St.','Delaware'),(269,'Chaney','5918 Vitae Rd.','New Jersey'),(270,'Chancellor','Ap #252-495 Blandit Road','IN'),(271,'Neville','Ap #645-4853 Nonummy. St.','South Carolina'),(272,'Wynter','P.O. Box 361, 199 Posuere Av.','VA'),(273,'Carson','Ap #855-3062 Ante Rd.','MN'),(274,'Ashely','9943 Auctor Ave','Connecticut'),(275,'Laura','691-8112 Ullamcorper. Av.','MS'),(276,'Lesley','Ap #519-6707 Nec Rd.','AK'),(277,'Adara','815-4256 Et Road','NE'),(278,'Quamar','186-1350 Et Rd.','MN'),(279,'Beatrice','P.O. Box 419, 7677 Interdum Street','UT'),(280,'Charles','Ap #136-5896 Risus. Street','Montana'),(281,'Drew','Ap #147-4506 Aliquam Avenue','MO'),(282,'Elton','P.O. Box 882, 7693 Tortor, St.','Vermont'),(283,'Boris','632-284 Faucibus Avenue','Colorado'),(284,'Chase','Ap #308-8691 Euismod Rd.','VT'),(285,'Virginia','414-1959 Accumsan Road','MA'),(286,'Deborah','897-3558 Aliquet Avenue','Hawaii'),(287,'Hanae','117-9942 Lorem St.','NH'),(288,'Tad','335 Odio. St.','HI'),(289,'Karly','4690 Lectus, Avenue','Oklahoma'),(290,'Macaulay','8329 Faucibus Ave','LA'),(291,'Owen','Ap #834-2773 Mi Ave','OH'),(292,'Ashely','P.O. Box 754, 8840 Donec Road','CT'),(293,'Neil','104-7383 Suscipit, St.','PA'),(294,'Shafira','Ap #277-8734 Accumsan St.','Washington'),(295,'Jameson','9559 Eget Road','Florida'),(296,'Maggy','9490 Nisi Avenue','LA'),(297,'Anjolie','P.O. Box 213, 5215 Diam Av.','NH'),(298,'Illiana','Ap #741-1598 Amet, Rd.','NJ'),(299,'Tanya','P.O. Box 772, 788 Mattis. Road','OH'),(300,'Blaze','P.O. Box 452, 5587 Pharetra. St.','Minnesota'),(301,'Jordan','P.O. Box 825, 607 Maecenas Street','MA'),(302,'Nell','P.O. Box 457, 9173 Vehicula Road','Mississippi'),(303,'Petra','Ap #775-6951 Cum Road','Washington'),(304,'Forrest','P.O. Box 454, 9273 Amet Rd.','Mississippi'),(305,'Flynn','P.O. Box 748, 6640 Rutrum St.','West Virginia'),(306,'Guy','P.O. Box 454, 1906 Cum Rd.','Wisconsin'),(307,'Autumn','P.O. Box 168, 7622 Auctor, Av.','California'),(308,'Marcia','716-6579 A Rd.','Rhode Island'),(309,'Chastity','P.O. Box 637, 9791 Faucibus Road','NY'),(310,'Xavier','1077 Sollicitudin Road','Pennsylvania'),(311,'Cedric','706-6156 Parturient Avenue','IA'),(312,'Eric','P.O. Box 401, 7023 Elit, Rd.','North Dakota'),(313,'Teagan','Ap #121-7039 Aenean Ave','ME'),(314,'Martin','6510 Ipsum Road','VT'),(315,'Kyla','4853 Purus Rd.','TN'),(316,'Teagan','P.O. Box 848, 6395 Duis Ave','MS'),(317,'Mariko','P.O. Box 891, 6755 Ultrices St.','Kentucky'),(318,'Petra','Ap #914-4849 Dui Avenue','MA'),(319,'Lynn','Ap #241-3347 Molestie. St.','Louisiana'),(320,'Veda','204-1558 In Rd.','Iowa'),(321,'Amal','P.O. Box 908, 3839 Cursus Road','Nebraska'),(322,'Jermaine','2912 Amet Ave','Wyoming'),(323,'Brett','529-1252 Ipsum. St.','CT'),(324,'Aurora','363-8266 Inceptos Av.','ND'),(325,'India','3390 Lobortis Avenue','NY'),(326,'Christine','P.O. Box 828, 1428 Dapibus St.','WY'),(327,'Yvette','P.O. Box 574, 6675 Sed Rd.','Iowa'),(328,'Melanie','133-250 Massa. Rd.','WA'),(329,'Nolan','5176 Condimentum Rd.','RI'),(330,'Geoffrey','573-1997 Semper St.','CO'),(331,'Yolanda','843-3323 Tortor, Rd.','Maryland'),(332,'Jaquelyn','466-7587 Laoreet St.','Alaska'),(333,'Dacey','9115 Vestibulum. Street','DE'),(334,'Nora','6280 Montes, Ave','New Jersey'),(335,'Yetta','856-2796 Dictum Rd.','IL'),(336,'Donovan','7017 Curabitur St.','Hawaii'),(337,'Steel','P.O. Box 357, 4312 Luctus, St.','NM'),(338,'Lisandra','P.O. Box 575, 7984 Rhoncus. Av.','DE'),(339,'Jessamine','Ap #754-3498 Cras St.','SC'),(340,'Brendan','329-6994 Placerat Rd.','KS'),(341,'Yoko','P.O. Box 727, 8393 Nibh. Rd.','Virginia'),(342,'Oliver','357 Praesent Rd.','WY'),(343,'Martin','706-3199 Velit St.','Hawaii'),(344,'Axel','910-2344 Sem Street','Missouri'),(345,'Chase','P.O. Box 731, 9928 Pharetra. Street','GA'),(346,'Melvin','799-2678 Vitae Avenue','Hawaii'),(347,'Walker','Ap #222-837 Libero St.','NE'),(348,'Brady','293-8117 Dolor. Rd.','Iowa'),(349,'Noel','Ap #652-8511 Non, Ave','Arizona'),(350,'Robert','Ap #666-9043 Dignissim Av.','IL'),(351,'Yael','2760 Mauris Rd.','MA'),(352,'Roth','P.O. Box 770, 1574 Phasellus Road','Minnesota'),(353,'Myra','Ap #947-1477 Eget, Street','South Carolina'),(354,'Andrew','761-7590 Rhoncus. Av.','Iowa'),(355,'Patricia','757-3681 Nunc. St.','TX'),(356,'Anastasia','6215 Nec Rd.','DC'),(357,'Salvador','Ap #264-8339 Arcu. Av.','Wisconsin'),(358,'Amos','484-3788 In Rd.','Nevada'),(359,'Abraham','342 Ac Ave','SC'),(360,'Madaline','7699 Suspendisse Rd.','California'),(361,'Valentine','P.O. Box 305, 5372 Torquent Road','West Virginia'),(362,'Maxwell','9340 Erat Rd.','Washington'),(363,'Blossom','5947 Mi Av.','Montana'),(364,'Whilemina','446-3234 Porttitor Ave','NC'),(365,'Indigo','Ap #843-3960 Tincidunt Street','GA'),(366,'Evangeline','P.O. Box 989, 4090 Integer Street','UT'),(367,'Malcolm','Ap #359-1366 Pharetra. Av.','Nevada'),(368,'Octavia','254-465 Scelerisque St.','VT'),(369,'Allegra','5883 Tincidunt St.','ID'),(370,'Chelsea','P.O. Box 962, 5080 Lacus. Av.','Rhode Island'),(371,'Mollie','P.O. Box 480, 2665 Massa. Rd.','NH'),(372,'Burton','P.O. Box 535, 3615 Erat, Street','Nevada'),(373,'Tarik','Ap #948-2280 Nec Rd.','Wyoming'),(374,'Benedict','P.O. Box 160, 8724 Neque. Avenue','Iowa'),(375,'Alisa','Ap #464-5029 Nostra, Av.','MI'),(376,'Harper','Ap #683-2900 Nec Rd.','LA'),(377,'Jessica','Ap #157-6156 Libero. Street','IA'),(378,'Jordan','1148 Neque. Avenue','NC'),(379,'Martena','P.O. Box 229, 2345 At Av.','North Dakota'),(380,'John','1913 Vel, St.','TN'),(381,'Fredericka','1970 Lacus, St.','MI'),(382,'Mikayla','8977 Curae; Road','Nevada'),(383,'Alexa','541-8786 Mus. St.','Wisconsin'),(384,'Graiden','P.O. Box 699, 4303 Pede St.','Nevada'),(385,'Farrah','171 Sed St.','WY'),(386,'Ora','952-5855 Et Rd.','DE'),(387,'India','876-3777 Tincidunt St.','UT'),(388,'Tyler','773-888 Nunc Ave','VT'),(389,'Cullen','Ap #489-7220 Consectetuer Av.','Oklahoma'),(390,'Paki','Ap #188-8469 Placerat, Av.','MO'),(391,'Wesley','706-8954 Vitae Rd.','DE'),(392,'Ciara','P.O. Box 632, 2432 Auctor Rd.','Florida'),(393,'Leo','178-692 Lacus. Road','North Carolina'),(394,'Ulysses','Ap #272-4300 Rhoncus. Rd.','Nebraska'),(395,'Blythe','8692 Vestibulum Street','Indiana'),(396,'Clark','271-3729 Montes, Ave','New Hampshire'),(397,'Sasha','821-6196 Sociis Ave','MN'),(398,'Uriel','991-5741 Varius Rd.','Idaho'),(399,'Adam','598 Tristique Rd.','OH'),(400,'Ferris','6840 Orci. St.','Nebraska'),(401,'Adena','Ap #347-4195 Nec, St.','CO'),(402,'Venus','Ap #184-9060 Adipiscing St.','Nebraska'),(403,'Riley','P.O. Box 310, 4356 Ornare. Av.','Hawaii'),(404,'Sierra','Ap #869-1068 Quam. St.','Minnesota'),(405,'Cain','7153 A, Rd.','Washington'),(406,'Leah','P.O. Box 941, 3787 Porta Rd.','South Carolina'),(407,'Leonard','1258 Fusce Street','NC'),(408,'Otto','985-7112 Blandit Road','Pennsylvania'),(409,'Judah','853-2703 Tortor Ave','MD'),(410,'Charles','4023 Placerat Ave','GA'),(411,'Cairo','5604 Ipsum. Avenue','KS'),(412,'Bo','Ap #159-7955 Quisque Rd.','NE'),(413,'Marshall','7875 Maecenas Ave','California'),(414,'Sloane','P.O. Box 336, 6859 Habitant Avenue','New Hampshire'),(415,'Cairo','125-3511 Vitae Street','NY'),(416,'Sasha','907-9381 Non, Street','NY'),(417,'Kenyon','P.O. Box 659, 9796 Nullam Avenue','South Dakota'),(418,'Paula','372-9599 Purus Av.','Rhode Island'),(419,'Troy','3737 Sagittis Rd.','IN'),(420,'Victor','Ap #141-489 Elit. Rd.','WI'),(421,'Wendy','1940 Leo. St.','Washington'),(422,'Elizabeth','9942 In Avenue','RI'),(423,'Lara','Ap #128-6422 Nullam Avenue','Idaho'),(424,'Brennan','329-3267 At St.','GA'),(425,'Casey','P.O. Box 454, 7738 Velit. Rd.','LA'),(426,'Fallon','8928 Ipsum. Road','Oregon'),(427,'Chloe','562-1846 Aliquam St.','OH'),(428,'Zachery','P.O. Box 583, 2039 Urna St.','Alabama'),(429,'Wynter','479-9224 Tellus Rd.','TN'),(430,'Kelsey','P.O. Box 269, 8789 Velit Rd.','New York'),(431,'Donovan','3537 Viverra. St.','WA'),(432,'Maia','Ap #469-752 Donec St.','Alabama'),(433,'Sigourney','Ap #733-5735 Nunc St.','GA'),(434,'Sophia','526-9762 Iaculis Ave','Nevada'),(435,'Clarke','Ap #347-9233 Dis Av.','Washington'),(436,'Theodore','296-2983 Felis Road','Virginia'),(437,'Tatum','Ap #506-2897 In, St.','West Virginia'),(438,'Chava','P.O. Box 109, 9586 Ultricies Street','PA'),(439,'Raya','P.O. Box 543, 5188 Et, St.','SC'),(440,'Priscilla','288 Consequat Rd.','WV'),(441,'Michelle','Ap #996-9320 Egestas Ave','Iowa'),(442,'Ira','P.O. Box 549, 6502 Inceptos Av.','NC'),(443,'Dexter','P.O. Box 910, 102 Maecenas Street','NE'),(444,'Cherokee','Ap #488-9547 Vitae Ave','AZ'),(445,'Hector','927-5294 Mauris. Street','Colorado'),(446,'Tara','Ap #227-8484 Nibh. Ave','FL'),(447,'Tatum','Ap #603-522 Eleifend Street','IN'),(448,'Flynn','221-186 Suspendisse Rd.','MT'),(449,'Aphrodite','P.O. Box 699, 9116 Convallis St.','Kansas'),(450,'Lucian','213-6203 In Street','RI'),(451,'Moses','P.O. Box 533, 2056 Mauris Rd.','Pennsylvania'),(452,'Nathaniel','Ap #416-6300 Nisl Av.','MI'),(453,'Lacota','Ap #826-8482 Auctor. Rd.','District of Columbia'),(454,'Jin','Ap #538-9129 Erat Ave','NY'),(455,'Fallon','Ap #122-4490 Ridiculus St.','New York'),(456,'Britanney','881-4350 Quisque Street','Mississippi'),(457,'Tad','8407 Euismod Road','NM'),(458,'Nasim','929-9303 Gravida Rd.','Arkansas'),(459,'Natalie','380-2127 Sociis St.','NE'),(460,'Kamal','2170 Odio, Rd.','Louisiana'),(461,'Hop','P.O. Box 722, 5090 Ac Av.','Iowa'),(462,'Jerome','Ap #831-2088 Diam Rd.','VT'),(463,'Hanae','7227 Arcu. St.','VT'),(464,'Nash','P.O. Box 742, 3525 Est, Avenue','Montana'),(465,'Vance','P.O. Box 884, 4131 Ut Avenue','Maine'),(466,'Elaine','P.O. Box 208, 4106 Ante. St.','IA'),(467,'Zenaida','716-3350 Nisl Street','Oregon'),(468,'Mechelle','P.O. Box 904, 6027 Et Rd.','Connecticut'),(469,'Guinevere','901-4365 In Av.','AK'),(470,'Phyllis','P.O. Box 399, 8508 Consectetuer Av.','Oklahoma'),(471,'Mannix','Ap #711-2366 Erat. Street','Oklahoma'),(472,'Shad','134-8578 Sem Street','LA'),(473,'Levi','P.O. Box 524, 1629 Dignissim Av.','NV'),(474,'Shea','547-2246 Magna, St.','District of Columbia'),(475,'Suki','P.O. Box 338, 2846 Pellentesque Rd.','NH'),(476,'Blossom','3452 Vitae Ave','ND'),(477,'Sopoline','381-3445 Varius Rd.','MO'),(478,'Randall','6246 Ante Road','ME'),(479,'Deanna','Ap #299-8228 Dui. Rd.','Wisconsin'),(480,'Jeanette','P.O. Box 810, 7697 Porttitor Avenue','IN'),(481,'Dustin','3441 Duis Rd.','MT'),(482,'Colt','Ap #424-2189 Dictum Avenue','UT'),(483,'Jamal','270-8028 Nunc Street','California'),(484,'Karleigh','559 Purus. Avenue','Maryland'),(485,'Yetta','508-9995 Vitae Av.','MA'),(486,'Zachary','3467 Phasellus Av.','Nebraska'),(487,'Noelle','833-4195 In Rd.','North Dakota'),(488,'Pearl','P.O. Box 315, 4973 Nam Rd.','AK'),(489,'Geraldine','6201 Vestibulum Rd.','ME'),(490,'Isaiah','4044 Orci Ave','OK'),(491,'Tanek','2039 Quisque Street','New Jersey'),(492,'Brennan','Ap #680-1832 Sed St.','WY'),(493,'Clarke','1559 Proin Av.','ID'),(494,'Zorita','942-1523 Ipsum Street','Minnesota'),(495,'Charlotte','5746 Metus. St.','NE'),(496,'Quinn','252-1039 Odio. Avenue','WA'),(497,'Guinevere','Ap #956-1765 Semper St.','HI'),(498,'Quynn','P.O. Box 817, 1550 Vivamus Avenue','TN'),(499,'Janna','P.O. Box 779, 6357 Ipsum Rd.','Connecticut'),(500,'Chanda','P.O. Box 153, 8081 Eu Ave','North Dakota'),(501,'Illana','P.O. Box 354, 3613 Donec Avenue','Montana'),(502,'Callie','P.O. Box 887, 9693 Eleifend. Avenue','AK'),(503,'Carter','3327 Ut Av.','OH'),(504,'Lewis','337-1052 Rutrum Ave','Idaho'),(505,'Anthony','Ap #779-2985 Leo, St.','OR'),(506,'Sloane','4364 Ac Avenue','AK'),(507,'Alyssa','Ap #830-4139 Augue Av.','Mississippi'),(508,'Kaden','7217 Non, Rd.','LA'),(509,'Baker','P.O. Box 865, 5262 Eget St.','NV'),(510,'Solomon','2709 Amet, Rd.','KY'),(511,'Dorothy','Ap #668-1672 Ipsum Rd.','Georgia'),(512,'Rana','P.O. Box 811, 2151 Velit St.','WV'),(513,'Beverly','Ap #900-963 Vitae St.','Maine'),(514,'Travis','2062 Nunc Road','MS'),(515,'Byron','316-5305 Libero. Ave','LA'),(516,'Asher','P.O. Box 865, 325 Ut Avenue','Arkansas'),(517,'Guinevere','1927 Gravida. Street','North Dakota'),(518,'Dale','Ap #634-2027 Commodo St.','Kentucky'),(519,'Lareina','5340 Vel, Av.','Missouri'),(520,'Timothy','484-1632 Metus. Rd.','NH'),(521,'Kameko','P.O. Box 384, 9652 Convallis Ave','Louisiana'),(522,'Medge','1200 Dignissim St.','Texas'),(523,'Karen','P.O. Box 853, 7457 Nisl. Av.','Iowa'),(524,'Rhiannon','955-4061 Est, Av.','ND'),(525,'Jena','3236 Montes, Rd.','MD'),(526,'Ezekiel','P.O. Box 511, 4195 Montes, Avenue','IN'),(527,'Heidi','Ap #248-6064 Eget Av.','Arizona'),(528,'Brenden','533 Interdum. St.','MI'),(529,'Jameson','966 Facilisis St.','ME'),(530,'Jorden','P.O. Box 225, 8337 Netus Road','District of Columbia'),(531,'Candace','453-2337 Nec Street','TX'),(532,'Dawn','Ap #630-4536 Libero Avenue','NJ'),(533,'Kirk','Ap #478-5628 Ante Ave','MS'),(534,'Quynn','174-2170 Ante Av.','Maryland'),(535,'Stephen','P.O. Box 194, 3451 Nullam Rd.','SD'),(536,'Mohammad','8266 Imperdiet Rd.','Oklahoma'),(537,'Stuart','967-889 Per Street','Tennessee'),(538,'Grady','6484 Sapien. St.','NM'),(539,'Deborah','582-3657 Cubilia Road','SD'),(540,'Cara','9974 Consectetuer Road','Connecticut'),(541,'Lareina','9308 Vivamus Road','Georgia'),(542,'Adara','P.O. Box 649, 7143 Dolor. Rd.','Kentucky'),(543,'Phelan','6877 Phasellus Rd.','AK'),(544,'Owen','824 Sollicitudin Street','Nebraska'),(545,'Abbot','6055 Neque. St.','Utah'),(546,'Nasim','251-5414 Consequat, St.','Virginia'),(547,'Amir','918-4213 Elementum, St.','Texas'),(548,'Burke','Ap #182-3552 Nunc Road','Florida'),(549,'Melodie','P.O. Box 960, 135 Conubia St.','Louisiana'),(550,'Yoshio','956-9290 Semper St.','ME'),(551,'Tobias','Ap #737-6144 Non Ave','ME'),(552,'Gage','Ap #198-1670 Non, Avenue','Louisiana'),(553,'Mercedes','7877 Imperdiet, Rd.','WA'),(554,'Francesca','Ap #727-5914 Blandit. Ave','ME'),(555,'Zoe','728-5545 Elementum St.','NJ'),(556,'Vernon','878-4434 Vulputate Ave','Kentucky'),(557,'Sylvia','P.O. Box 139, 769 Quam St.','PA'),(558,'Francis','Ap #145-1540 Mauris, St.','MA'),(559,'Fiona','272-1957 Risus Road','Mississippi'),(560,'Margaret','4737 In, Road','Connecticut'),(561,'Callum','9561 Nulla Street','Wisconsin'),(562,'Carly','4543 Non, Street','Illinois'),(563,'Keiko','Ap #897-3886 A Avenue','MT'),(564,'Carly','607-9696 Vel Road','Pennsylvania'),(565,'Fritz','834-255 Morbi Av.','AK'),(566,'Quentin','724-8926 Nulla St.','Massachusetts'),(567,'Peter','Ap #413-7465 Sem. Street','New Mexico'),(568,'Brennan','432-7744 Rutrum. St.','North Dakota'),(569,'Damon','P.O. Box 777, 8192 Dolor Rd.','HI'),(570,'Echo','P.O. Box 407, 1178 Imperdiet Avenue','AK'),(571,'Blaze','399-1215 Mauris St.','OH'),(572,'Dean','1638 Dolor St.','MO'),(573,'Tanek','P.O. Box 840, 259 Diam. Ave','PA'),(574,'Amir','P.O. Box 381, 5555 Purus. Road','Maine'),(575,'Maryam','984-6998 Dolor. Rd.','Connecticut'),(576,'Ima','1730 Morbi St.','MO'),(577,'Carly','5987 Natoque Avenue','Rhode Island'),(578,'Cadman','519-5600 Integer Rd.','WI'),(579,'Janna','Ap #176-2418 Pede. Ave','LA'),(580,'Veda','822-7701 Proin Rd.','South Carolina'),(581,'Kevin','Ap #968-5248 Sed Road','MA'),(582,'Olga','Ap #101-9032 Enim. Avenue','Oregon'),(583,'Medge','8335 Sit Road','Montana'),(584,'Michael','975-7598 Enim, St.','MA'),(585,'Deacon','Ap #928-2395 Porttitor Rd.','Utah'),(586,'Colorado','7651 Ligula Road','TX'),(587,'Wyoming','955-6536 Nunc Avenue','DC'),(588,'Prescott','P.O. Box 333, 6487 Aliquam Road','RI'),(589,'Ali','9576 Dui Rd.','ND'),(590,'Nicole','Ap #595-3533 Tempor Road','Montana'),(591,'Christian','360-3914 Cursus. Rd.','ND'),(592,'Kessie','686-7020 Nascetur Ave','FL'),(593,'Dieter','Ap #678-7254 Lacus. Street','GA'),(594,'Gage','P.O. Box 682, 9802 Nulla. Av.','Alabama'),(595,'Charity','Ap #851-2927 Auctor Avenue','Delaware'),(596,'Brady','Ap #749-704 Sed St.','Kansas'),(597,'Octavia','6573 Ipsum. Avenue','SC'),(598,'Abdul','P.O. Box 139, 8172 Odio. Rd.','Wyoming'),(599,'Buckminster','299-981 Orci Avenue','Kentucky'),(600,'Jamal','1189 Lectus, Av.','Colorado'),(601,'Nathan','7930 Diam. Rd.','West Virginia'),(602,'Camille','990-6153 Lobortis Avenue','Wisconsin'),(603,'Hop','Ap #861-1343 Ac Road','Louisiana'),(604,'Martina','P.O. Box 548, 7319 Proin St.','DE'),(605,'Paloma','P.O. Box 666, 8540 Sodales Rd.','VT'),(606,'Naomi','4188 Consectetuer Av.','Colorado'),(607,'Addison','689-2661 Orci Rd.','OH'),(608,'Bianca','P.O. Box 972, 1470 Pellentesque Road','MN'),(609,'Geraldine','P.O. Box 244, 402 Ipsum. Road','WI'),(610,'Mechelle','Ap #227-1345 Diam Avenue','Missouri'),(611,'Irma','2277 Vulputate Rd.','Indiana'),(612,'Slade','720-5413 Quis St.','Alaska'),(613,'Rina','8572 Pellentesque St.','VA'),(614,'Demetrius','603-6633 Mollis. Av.','North Dakota'),(615,'Quinn','P.O. Box 424, 8895 Commodo St.','NE'),(616,'Celeste','P.O. Box 878, 6722 Nam Av.','VT'),(617,'Brian','8341 Nam Road','PA'),(618,'Xander','Ap #593-9232 Libero. St.','New Hampshire'),(619,'Tanya','710-6469 Lectus Rd.','Nebraska'),(620,'Hayes','690-2502 Euismod St.','Alabama'),(621,'Nadine','3888 In Av.','CO'),(622,'Selma','114-4542 Metus Rd.','MS'),(623,'Kirsten','P.O. Box 979, 8065 Ante. Road','California'),(624,'Wynne','4632 Libero Avenue','ME'),(625,'Len','Ap #816-4714 Odio. Rd.','KY'),(626,'Perry','P.O. Box 720, 3184 Lacinia Ave','CO'),(627,'Gail','994-6811 Curabitur Ave','WA'),(628,'Cynthia','Ap #235-8192 Cursus St.','Texas'),(629,'Matthew','Ap #399-7668 Cursus Avenue','NV'),(630,'Linda','P.O. Box 335, 4733 Lectus Rd.','OH'),(631,'Hilda','P.O. Box 722, 9590 Est, Road','ID'),(632,'Tucker','Ap #184-5466 Vel Avenue','New York'),(633,'Denise','Ap #567-3736 Ac Road','NE'),(634,'Palmer','P.O. Box 691, 7894 Molestie. Street','OK'),(635,'Kitra','Ap #752-1810 Fringilla Ave','ID'),(636,'Carolyn','P.O. Box 105, 8143 Consequat Avenue','OK'),(637,'Sharon','755-1252 Adipiscing Av.','WA'),(638,'Leonard','P.O. Box 175, 3028 Enim. Rd.','PA'),(639,'Yael','P.O. Box 583, 336 Nulla. Street','NH'),(640,'Wanda','919-7409 Diam. Ave','ME'),(641,'Denise','P.O. Box 804, 9256 Ipsum. Road','Texas'),(642,'Rooney','6302 Suspendisse Ave','CO'),(643,'Meredith','P.O. Box 248, 9504 Sapien. St.','VA'),(644,'Colton','Ap #206-6335 Magna. Road','Montana'),(645,'Lee','504-9927 Est St.','GA'),(646,'Nolan','Ap #104-818 Ac Avenue','Idaho'),(647,'Kelly','7780 Malesuada St.','CT'),(648,'Unity','484-7710 Nec St.','New Jersey'),(649,'Forrest','Ap #483-167 Ac Street','LA'),(650,'Stone','P.O. Box 706, 7094 Vel St.','Tennessee'),(651,'James','5524 Vel, Rd.','Alaska'),(652,'Rhiannon','102-1983 Mi Av.','Iowa'),(653,'India','8910 Amet Rd.','HI'),(654,'Lilah','759-2468 Nunc Ave','LA'),(655,'Leo','Ap #903-253 Nunc St.','PA'),(656,'Idola','Ap #703-8577 Dolor, Road','IL'),(657,'Thane','3461 Scelerisque Av.','Oregon'),(658,'Kaye','8225 Nec, Road','SC'),(659,'Larissa','4453 Magna St.','Maryland'),(660,'Tatiana','1481 Metus St.','Maryland'),(661,'Aretha','177-7505 Nisl St.','NM'),(662,'Hedda','358-5860 Urna, Rd.','WI'),(663,'Ulysses','817-178 Cras St.','TX'),(664,'Lev','Ap #313-4692 Phasellus St.','NY'),(665,'Henry','P.O. Box 153, 6591 Ornare St.','Maryland'),(666,'Davis','2639 Ac Avenue','WY'),(667,'Brianna','7655 Nec St.','Delaware'),(668,'Doris','390 Nisl. Road','Kansas'),(669,'Blake','1207 Non, Ave','OK'),(670,'Julie','9505 Augue Street','KY'),(671,'Damon','323 Porttitor St.','Washington'),(672,'Lester','Ap #350-5498 Nascetur St.','ME'),(673,'Aspen','P.O. Box 870, 4682 Leo St.','MS'),(674,'Joy','5084 Vestibulum, Avenue','Hawaii'),(675,'Cathleen','P.O. Box 595, 3597 Sed Ave','RI'),(676,'Nolan','P.O. Box 377, 3725 Eget, Street','MD'),(677,'Bianca','Ap #622-8424 Nulla Road','Montana'),(678,'Karly','P.O. Box 884, 1778 Nunc Avenue','WI'),(679,'Charissa','P.O. Box 215, 8117 Cras Rd.','HI'),(680,'Ruth','625-4099 Amet Rd.','District of Columbia'),(681,'Lucas','727-2111 Elit, Rd.','Rhode Island'),(682,'Hammett','P.O. Box 806, 4717 Magna St.','WV'),(683,'Hermione','Ap #300-3085 Neque Av.','North Carolina'),(684,'Jacob','120-2411 Vehicula St.','KS'),(685,'Cairo','P.O. Box 912, 3080 Vel Ave','AL'),(686,'Paki','992-4403 Etiam St.','Montana'),(687,'Jamal','109-7230 Integer Street','MI'),(688,'Maisie','Ap #581-5869 Maecenas St.','Pennsylvania'),(689,'Kylie','Ap #789-869 Tincidunt Rd.','Colorado'),(690,'Breanna','7190 Diam Rd.','CA'),(691,'Callum','Ap #588-958 Lacinia Rd.','New Jersey'),(692,'Kathleen','702-4764 Malesuada Avenue','DE'),(693,'Aspen','P.O. Box 372, 9192 Ornare. Av.','Vermont'),(694,'Cairo','P.O. Box 254, 5771 Etiam Ave','Rhode Island'),(695,'Perry','350-9026 Ipsum. Ave','Nevada'),(696,'Rahim','9338 Nulla Ave','Ohio'),(697,'Devin','P.O. Box 379, 6837 Aliquet, Rd.','California'),(698,'Garrett','P.O. Box 794, 3052 Etiam Rd.','Mississippi'),(699,'Caesar','Ap #965-7800 Malesuada St.','Ohio'),(700,'Jordan','Ap #923-9910 Aenean Road','Arkansas'),(701,'Rooney','Ap #615-491 Cubilia Road','ND'),(702,'Kibo','P.O. Box 719, 6942 Luctus. Street','Maine'),(703,'Alan','Ap #495-9934 Ac, Road','AK'),(704,'April','984-2105 Est, Avenue','ND'),(705,'Rashad','Ap #530-126 Maecenas Rd.','Oklahoma'),(706,'Len','P.O. Box 986, 351 A, St.','North Dakota'),(707,'Lars','828-6753 Auctor, Rd.','DC'),(708,'Mechelle','730-2775 At Road','Iowa'),(709,'Tanisha','Ap #802-4394 Ipsum. Rd.','AK'),(710,'Nadine','P.O. Box 263, 8493 Tellus St.','North Carolina'),(711,'Forrest','7830 Donec Av.','KS'),(712,'Isaiah','Ap #406-9962 Etiam St.','SD'),(713,'Nomlanga','Ap #696-9314 Mollis Street','Pennsylvania'),(714,'Kathleen','P.O. Box 339, 750 Non Ave','CA'),(715,'Baxter','355-9608 Lacus Road','AK'),(716,'Hiroko','6784 Elit, St.','HI'),(717,'Aimee','2511 Gravida. Ave','ME'),(718,'Janna','7505 Neque St.','UT'),(719,'Jared','625-8965 Odio. Av.','WY'),(720,'Scott','P.O. Box 285, 9429 Leo. Rd.','Louisiana'),(721,'Zelda','633-4399 Non Avenue','NY'),(722,'Rajah','281-2588 Pede St.','NY'),(723,'Brody','2000 Metus. Av.','Montana'),(724,'Adele','239-5892 Quis Rd.','CT'),(725,'Laurel','P.O. Box 791, 7740 Integer Avenue','TX'),(726,'Candice','9336 Risus. Road','Delaware'),(727,'Jolie','P.O. Box 745, 5769 Vel Rd.','IA'),(728,'Madaline','Ap #874-5203 Curabitur Avenue','TX'),(729,'Aubrey','7646 Elit Ave','AL'),(730,'Mara','7130 Suspendisse Rd.','Colorado'),(731,'Buckminster','Ap #225-7969 Mauris Av.','Alaska'),(732,'Xerxes','776-9820 Curabitur Street','Maine'),(733,'Dorian','346-1683 Mauris, Rd.','Virginia'),(734,'Whilemina','P.O. Box 260, 8741 Scelerisque St.','Rhode Island'),(735,'Sonia','Ap #983-9498 Ut St.','Illinois'),(736,'Sade','897-2253 Ante St.','Florida'),(737,'Channing','P.O. Box 435, 4524 Elit, Road','New Jersey'),(738,'Althea','P.O. Box 582, 4228 Amet Road','CT'),(739,'Amy','8036 Nec, Rd.','TN'),(740,'Camilla','586-5108 Sed Street','West Virginia'),(741,'Brielle','Ap #115-8306 Est. Av.','Massachusetts'),(742,'Vaughan','P.O. Box 317, 426 Neque Avenue','Vermont'),(743,'September','P.O. Box 392, 6677 Libero Rd.','NC'),(744,'Xena','Ap #584-5457 Cras St.','Illinois'),(745,'Colleen','P.O. Box 629, 8293 Aenean Avenue','NC'),(746,'Blythe','5353 Nisl. Avenue','MT'),(747,'Jana','P.O. Box 442, 1162 Augue St.','Nebraska'),(748,'Ashton','666-3122 Magna St.','NM'),(749,'Lawrence','P.O. Box 559, 5921 Bibendum. Rd.','MS'),(750,'Jacob','P.O. Box 169, 1794 Cursus, Avenue','Georgia'),(751,'Guinevere','P.O. Box 820, 1611 Luctus St.','CT'),(752,'Jasmine','7108 Vivamus Road','Kentucky'),(753,'Geraldine','4230 Adipiscing Av.','MI'),(754,'Ira','Ap #746-1438 Montes, Rd.','MI'),(755,'Burton','443-1604 Cras Road','Missouri'),(756,'Mara','1651 Lacus. Road','Virginia'),(757,'Lacy','P.O. Box 770, 7729 Proin Street','Kansas'),(758,'Dean','Ap #712-6810 Est, Rd.','Arizona'),(759,'Flynn','7530 Adipiscing Ave','AZ'),(760,'Gregory','305-4497 Aenean Av.','Nevada'),(761,'Giselle','Ap #820-2451 Ridiculus Avenue','Kentucky'),(762,'Samson','9958 Sapien, Av.','CA'),(763,'Amaya','P.O. Box 972, 4964 Feugiat St.','TX'),(764,'Kellie','P.O. Box 771, 7431 Libero Road','OR'),(765,'Craig','Ap #915-4089 Mi. Rd.','South Carolina'),(766,'Larissa','130-1994 Velit Road','Connecticut'),(767,'Victor','Ap #969-3043 Orci, St.','AK'),(768,'Sara','735-7497 Aliquet Ave','Illinois'),(769,'Damon','Ap #481-4360 Et Road','Oregon'),(770,'Arthur','P.O. Box 211, 377 Curabitur Rd.','Tennessee'),(771,'Kellie','Ap #779-5405 Nunc St.','AL'),(772,'Berk','881 Quam. Rd.','FL'),(773,'Randall','Ap #177-5447 Tincidunt Rd.','North Dakota'),(774,'Scarlett','Ap #732-5425 Ut St.','PA'),(775,'Gemma','580-5707 Ullamcorper, Rd.','Arizona'),(776,'Eagan','1959 Justo Rd.','KY'),(777,'Colton','6605 Et Road','NJ'),(778,'Vaughan','Ap #158-3207 A, St.','Louisiana'),(779,'Cullen','942-6694 Lacus, Road','KY'),(780,'Leigh','2498 Gravida Street','SD'),(781,'Igor','P.O. Box 226, 8632 Orci. Avenue','KY'),(782,'Herrod','4401 Neque Street','NC'),(783,'Theodore','Ap #933-6276 Consectetuer, Rd.','MN'),(784,'Bruno','3724 Nunc Rd.','Michigan'),(785,'Timon','P.O. Box 921, 5472 Tellus St.','Nevada'),(786,'Hiram','P.O. Box 804, 1852 Amet, Street','Hawaii'),(787,'Lacota','P.O. Box 807, 1335 Cursus Avenue','Idaho'),(788,'Azalia','130-937 Metus Rd.','IN'),(789,'Axel','3393 Mi, Rd.','Delaware'),(790,'George','Ap #207-5971 Et St.','Colorado'),(791,'Connor','383-4260 Duis Road','Tennessee'),(792,'Madeline','9092 Vestibulum Road','Tennessee'),(793,'Evan','594-3935 At St.','New Hampshire'),(794,'Thaddeus','P.O. Box 805, 6240 Libero Road','Connecticut'),(795,'Lacey','408-3018 Sed Ave','OH'),(796,'Coby','Ap #481-1973 Magna. St.','Utah'),(797,'Blaze','P.O. Box 614, 4895 Lacus Street','New Hampshire'),(798,'Bell','P.O. Box 461, 9276 Ut Road','South Carolina'),(799,'Calista','374-816 Non Avenue','Wyoming'),(800,'Kyle','836-550 Neque. Road','Vermont'),(801,'Madaline','869-2311 Nibh Avenue','VT'),(802,'Amela','748-3113 Natoque Avenue','Pennsylvania'),(803,'Keane','P.O. Box 493, 6965 Risus. Ave','RI'),(804,'Melodie','P.O. Box 120, 671 Nulla Rd.','LA'),(805,'Cecilia','P.O. Box 592, 3367 Vehicula Av.','WV'),(806,'Debra','430-240 Augue, Av.','Maine'),(807,'Penelope','755-6218 Et St.','Pennsylvania'),(808,'Zane','8819 Ac Avenue','OK'),(809,'Amelia','P.O. Box 184, 1040 Sapien. Av.','Virginia'),(810,'Colby','Ap #434-2190 Dolor Rd.','NJ'),(811,'Heidi','P.O. Box 862, 4851 In, Rd.','TN'),(812,'Paloma','Ap #444-1465 Nec St.','Maine'),(813,'Lamar','4520 Fusce St.','Michigan'),(814,'Imogene','P.O. Box 290, 1259 Magna. Ave','OH'),(815,'Astra','5686 Nec, St.','Idaho'),(816,'Julie','349 Non, Av.','Nebraska'),(817,'Carter','P.O. Box 967, 7592 Proin Ave','New Mexico'),(818,'Mikayla','5355 Mauris Rd.','Wisconsin'),(819,'Zenia','1495 Pede Street','Louisiana'),(820,'Orli','8875 Rhoncus. Av.','Washington'),(821,'Quinlan','Ap #829-9887 Quis Road','Mississippi'),(822,'Levi','420-704 Placerat Road','Idaho'),(823,'Farrah','Ap #246-212 Quisque Street','Wisconsin'),(824,'Thane','816-8615 Tincidunt Ave','KS'),(825,'Miriam','926-5436 Sed St.','Maine'),(826,'Tatyana','P.O. Box 229, 5296 A St.','South Dakota'),(827,'Keegan','770-6850 Augue, Rd.','Arkansas'),(828,'Sopoline','Ap #482-1314 Consequat Av.','VA'),(829,'Dalton','P.O. Box 691, 2562 Nullam Road','VT'),(830,'Reese','949-644 Aliquet St.','Idaho'),(831,'Roth','210-6123 Sed Av.','NC'),(832,'Colt','629-7111 Urna. Avenue','OK'),(833,'Ursula','801-6821 Ipsum Street','Illinois'),(834,'Lenore','291-1342 Proin Av.','MO'),(835,'Sierra','8214 Faucibus Avenue','Tennessee'),(836,'Shelly','Ap #924-6849 Proin Ave','FL'),(837,'Galvin','Ap #533-1309 Sed Rd.','KY'),(838,'Cleo','Ap #752-6204 Sit Ave','New York'),(839,'Buckminster','P.O. Box 781, 8996 Vulputate, Road','KS'),(840,'Matthew','Ap #305-8530 Quisque Avenue','TN'),(841,'Eve','397 Egestas. Ave','NH'),(842,'Tallulah','Ap #733-2081 Amet St.','Arizona'),(843,'Chantale','Ap #788-493 Suspendisse Road','Pennsylvania'),(844,'Maite','948-1982 Non Av.','NM'),(845,'Evelyn','P.O. Box 707, 7887 Et Rd.','Georgia'),(846,'Ferdinand','Ap #825-4985 Augue Rd.','Kansas'),(847,'Carl','3591 Condimentum. St.','Oregon'),(848,'Lana','P.O. Box 941, 4076 Ornare, St.','Montana'),(849,'Meghan','8042 Duis Rd.','Mississippi'),(850,'Maisie','6096 Mauris Av.','Virginia'),(851,'Branden','Ap #551-4961 Metus Ave','Massachusetts'),(852,'Kamal','898-4470 Iaculis Avenue','GA'),(853,'Aiko','411-5474 Amet, Avenue','FL'),(854,'Hayden','Ap #456-9732 Morbi St.','DE'),(855,'Talon','965-2698 Eu Avenue','MN'),(856,'Tarik','6341 Cursus, Road','TN'),(857,'Nell','6667 Erat. Avenue','District of Columbia'),(858,'Aidan','727-3241 Id Av.','DE'),(859,'Quinn','P.O. Box 611, 6340 Cras Rd.','FL'),(860,'Alika','9408 In Street','Hawaii'),(861,'Timon','P.O. Box 784, 1723 Lacus, St.','New Jersey'),(862,'Francesca','225-6483 Gravida. Av.','New Mexico'),(863,'Camilla','306-293 Pellentesque Avenue','Nevada'),(864,'Basil','5013 Magna. St.','California'),(865,'Porter','847-5340 Id St.','Oklahoma'),(866,'Ignatius','P.O. Box 297, 7525 Rutrum Rd.','Georgia'),(867,'Katelyn','P.O. Box 194, 3388 Primis Street','Georgia'),(868,'Carolyn','Ap #968-6246 In, Road','KS'),(869,'Jane','128-5140 Proin St.','AK'),(870,'Rosalyn','8875 Lorem, Avenue','DE'),(871,'Dieter','774-8027 Molestie Rd.','CO'),(872,'Martina','1960 Vel Rd.','NH'),(873,'Hermione','721-5879 Pretium Av.','Arizona'),(874,'Channing','918-9481 Ipsum. Ave','Nebraska'),(875,'Kim','Ap #892-7601 At, St.','KY'),(876,'Lenore','6814 Egestas. Street','South Carolina'),(877,'Maggie','Ap #903-6075 Urna. Road','NH'),(878,'Kellie','P.O. Box 951, 2848 Nascetur Ave','Arizona'),(879,'Erin','Ap #591-9325 A Road','Utah'),(880,'Lucian','4339 Eu Rd.','District of Columbia'),(881,'Uriah','734-2747 Eu, Ave','MI'),(882,'Wynter','P.O. Box 688, 849 Quis Ave','Wyoming'),(883,'Hamilton','P.O. Box 815, 2753 Mattis Rd.','MN'),(884,'Jelani','Ap #463-9707 Suspendisse St.','Vermont'),(885,'Lee','8843 Ut St.','OH'),(886,'Jenette','553-1178 Tortor, Ave','DC'),(887,'Chiquita','Ap #506-8667 Eleifend, Road','New York'),(888,'Keith','361-3532 Cursus, Ave','Maryland'),(889,'Dana','P.O. Box 725, 7548 Nonummy. Avenue','DC'),(890,'Yetta','785-8529 Tempor Road','Maryland'),(891,'Lenore','P.O. Box 161, 5664 Ultricies Avenue','Missouri'),(892,'Cairo','180-4798 Fringilla Street','HI'),(893,'Cally','167-9040 Amet Road','MD'),(894,'Mohammad','7186 Vivamus St.','Washington'),(895,'Miriam','P.O. Box 408, 6988 Est Rd.','NJ'),(896,'Brett','317-6692 Magna Rd.','NH'),(897,'Katelyn','1544 Suspendisse Avenue','AZ'),(898,'Kylan','568-5088 Phasellus Av.','Arkansas'),(899,'Fitzgerald','8856 Facilisis Ave','Wyoming'),(900,'Chastity','Ap #828-1474 Cubilia St.','Indiana'),(901,'Avye','P.O. Box 689, 1857 Vel Rd.','MS'),(902,'Imani','701-9666 Ipsum Rd.','Maine'),(903,'Cally','Ap #470-1154 Fermentum Av.','Arizona'),(904,'Phyllis','2952 Pede, St.','Massachusetts'),(905,'Emma','2626 Ligula Street','Rhode Island'),(906,'Denton','Ap #839-7533 Vel Av.','AZ'),(907,'Curran','5094 Purus. Ave','NJ'),(908,'Shoshana','Ap #824-4284 Mauris Avenue','Maryland'),(909,'Lee','594-7770 Mus. Rd.','Massachusetts'),(910,'Lucius','Ap #812-2115 Blandit Avenue','MT'),(911,'MacKensie','126-483 Vulputate Rd.','NE'),(912,'Patrick','Ap #921-8885 Nascetur Street','IL'),(913,'Rebekah','P.O. Box 695, 273 Libero Av.','Kansas'),(914,'Donna','140-5114 Vestibulum, Road','LA'),(915,'Abel','4436 Massa St.','California'),(916,'Eve','Ap #467-7469 Duis Avenue','IL'),(917,'Eleanor','Ap #177-1821 Donec Avenue','Massachusetts'),(918,'Aurora','516-4638 Dictum Rd.','MT'),(919,'Lavinia','Ap #309-3665 Ac Road','South Dakota'),(920,'Colorado','P.O. Box 748, 3117 Nunc St.','Kansas'),(921,'Britanni','Ap #494-7408 Felis Av.','Vermont'),(922,'Kelly','6129 Ac Ave','Hawaii'),(923,'Sylvia','Ap #420-8179 Interdum Rd.','Maine'),(924,'Serina','P.O. Box 172, 9518 Aliquam Av.','Vermont'),(925,'Xander','8320 Id, Rd.','UT'),(926,'Alea','655-1033 Est St.','HI'),(927,'Christen','Ap #911-7525 Nulla Avenue','OK'),(928,'Georgia','P.O. Box 322, 4169 Lectus. Rd.','VT'),(929,'Neve','192-6388 Tincidunt St.','LA'),(930,'Kyra','451-5081 Phasellus Rd.','Wisconsin'),(931,'Acton','5938 Rhoncus. St.','LA'),(932,'Amy','545 Ipsum Ave','Alaska'),(933,'Melodie','P.O. Box 534, 871 Lorem Av.','North Dakota'),(934,'Amir','133-4608 Malesuada St.','Indiana'),(935,'Dana','Ap #728-4434 Ultrices. Road','MD'),(936,'Indira','Ap #522-5437 Nonummy Road','NJ'),(937,'Keane','P.O. Box 416, 7675 Porttitor Ave','North Carolina'),(938,'Lawrence','P.O. Box 282, 9482 Proin St.','SD'),(939,'Zane','667-8537 Semper St.','Idaho'),(940,'Flavia','304-2365 Nisi Avenue','Iowa'),(941,'Roanna','Ap #105-2112 Laoreet Street','DC'),(942,'Margaret','738-4187 Turpis. St.','California'),(943,'Charissa','Ap #270-9975 Eros. Street','NE'),(944,'Meghan','P.O. Box 446, 9513 Pretium Rd.','WY'),(945,'Molly','P.O. Box 393, 8489 Commodo St.','NM'),(946,'Nomlanga','1372 Leo. Rd.','AZ'),(947,'Nehru','P.O. Box 349, 7310 Libero St.','SC'),(948,'Cherokee','P.O. Box 738, 1367 Tempus Rd.','TN'),(949,'Claire','2484 Dignissim Rd.','Pennsylvania'),(950,'Zena','P.O. Box 568, 922 Lorem, Road','New Hampshire'),(951,'Halla','P.O. Box 356, 3185 Ornare, St.','OR'),(952,'Mariam','168-5804 Nam Road','NJ'),(953,'Herrod','835-406 Ultrices, St.','Utah'),(954,'Philip','P.O. Box 404, 4598 Sed, St.','MT'),(955,'Joshua','960 Luctus Rd.','Louisiana'),(956,'Holmes','P.O. Box 402, 1350 Feugiat Ave','MS'),(957,'Marshall','Ap #157-8325 Id, St.','GA'),(958,'Roary','457-5828 Metus. St.','UT'),(959,'Signe','650-8948 In Avenue','NM'),(960,'Dorian','Ap #179-2332 Bibendum. Ave','New Jersey'),(961,'Leroy','890-1584 Turpis Rd.','GA'),(962,'Calista','Ap #849-6236 Aliquet Road','Illinois'),(963,'Kylie','6782 Neque Av.','Missouri'),(964,'Halla','305 Posuere St.','AZ'),(965,'Chiquita','1313 Dolor Rd.','VA'),(966,'Maggy','P.O. Box 373, 1930 Cras Avenue','Utah'),(967,'Fleur','Ap #248-6224 Nec Street','Vermont'),(968,'Wylie','P.O. Box 487, 6421 Nunc Road','CA'),(969,'Amena','P.O. Box 939, 9497 Nec Street','FL'),(970,'Demetrius','9841 Sed St.','CO'),(971,'Walker','4656 Vestibulum Rd.','Pennsylvania'),(972,'Kiona','355-9454 In Rd.','New Hampshire'),(973,'Melinda','Ap #730-4671 Parturient St.','Louisiana'),(974,'Scarlett','9409 Semper Road','ND'),(975,'Calista','407 Vivamus St.','California'),(976,'Bernard','Ap #970-7798 Dignissim. Rd.','MS'),(977,'Aileen','P.O. Box 592, 392 Phasellus Rd.','Vermont'),(978,'Raya','421-8460 Tellus Ave','MI'),(979,'Lydia','P.O. Box 241, 2334 Orci. Av.','Rhode Island'),(980,'Jessica','167-8704 Dapibus Ave','California'),(981,'Wallace','744-1470 Mattis Street','DC'),(982,'Summer','Ap #429-9859 Tempus Avenue','Nevada'),(983,'Nevada','7415 Quis Avenue','New Hampshire'),(984,'Anika','P.O. Box 874, 792 Orci, St.','District of Columbia'),(985,'Raphael','8046 Lectus Road','Oklahoma'),(986,'Wanda','663-8614 Ut Ave','Vermont'),(987,'Aimee','Ap #846-8170 Tincidunt Ave','West Virginia'),(988,'Tate','P.O. Box 486, 8075 Massa St.','UT'),(989,'Cedric','1436 Dictum. Rd.','NM'),(990,'Carter','P.O. Box 337, 7017 Molestie Ave','AK'),(991,'Judith','813-2343 Pede Street','SD'),(992,'Thane','3866 Erat, Rd.','WI'),(993,'Paula','689-5612 Risus. Road','Kentucky'),(994,'Breanna','P.O. Box 393, 7797 Metus Street','NC'),(995,'Quon','Ap #256-6147 Ultricies Ave','TN'),(996,'Leilani','485-4508 Montes, Road','South Carolina'),(997,'Harding','7690 Aenean Road','IL'),(998,'Reuben','345-6604 Sed, Av.','WI'),(999,'Kai','977-457 Eu Rd.','Kansas'),(1000,'Jaime','882-6804 Aliquet. Street','Iowa');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessao`
--

DROP TABLE IF EXISTS `sessao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessao` (
  `cod_sessao` int(11) NOT NULL AUTO_INCREMENT,
  `cod_treino` int(11) NOT NULL,
  `cod_tenis` int(11) DEFAULT NULL,
  `cod_frequencimetro` int(11) DEFAULT NULL,
  `nom_sessao` varchar(255) DEFAULT NULL,
  `num_ordem_sessao` int(11) NOT NULL,
  `dth_sessao` datetime NOT NULL,
  `des_clima` varchar(255) DEFAULT NULL,
  `des_temperatura` varchar(255) DEFAULT NULL,
  `des_terreno` varchar(255) DEFAULT NULL,
  `des_inclinacao` varchar(255) DEFAULT NULL,
  `num_escala_borg` int(11) NOT NULL,
  `obs_sessao` text,
  `ind_executado` tinyint(1) NOT NULL,
  `qtd_pontos_sessao` float DEFAULT NULL,
  PRIMARY KEY (`cod_sessao`),
  UNIQUE KEY `nom_sessao_UNIQUE` (`nom_sessao`),
  KEY `frk_sessao_cod_treino` (`cod_treino`),
  KEY `frk_sessao_cod_tenis` (`cod_tenis`),
  KEY `frk_sessao_cod_frequecimetro` (`cod_frequencimetro`),
  CONSTRAINT `frk_sessao_cod_frequecimetro` FOREIGN KEY (`cod_frequencimetro`) REFERENCES `frequencimetro` (`cod_frequencimetro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `frk_sessao_cod_tenis` FOREIGN KEY (`cod_tenis`) REFERENCES `tenis` (`cod_tenis`),
  CONSTRAINT `frk_sessao_cod_treino` FOREIGN KEY (`cod_treino`) REFERENCES `treino` (`cod_treino`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='Conjunto de exercícios. Pode ser feita uma ou mais sessões n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessao`
--

LOCK TABLES `sessao` WRITE;
/*!40000 ALTER TABLE `sessao` DISABLE KEYS */;
INSERT INTO `sessao` VALUES (1,1,1,1,'Sessão 1',1,'2011-08-01 09:00:00',NULL,NULL,NULL,NULL,0,NULL,0,0),(2,2,1,1,'Sessão 2',2,'2011-08-02 09:00:00',NULL,NULL,NULL,NULL,0,NULL,0,0),(3,3,1,1,'Sessão 3',3,'2011-08-03 09:00:00',NULL,NULL,NULL,NULL,0,NULL,0,0),(4,4,1,1,'Sessão 4',4,'2011-08-04 09:00:00',NULL,NULL,NULL,NULL,0,NULL,0,0),(5,5,1,1,'Sessão 5',5,'2011-08-05 09:00:00',NULL,NULL,NULL,NULL,0,NULL,0,0),(6,6,1,1,'Sessão 6',6,'2011-08-06 09:00:00',NULL,NULL,NULL,NULL,0,NULL,0,0),(7,7,1,1,'Sessão 7',7,'2011-08-07 09:00:00',NULL,NULL,NULL,NULL,0,NULL,0,0),(8,11,1,1,'Sessao 12',10,'2011-08-12 09:00:00',NULL,NULL,NULL,NULL,0,NULL,0,0),(9,13,1,1,'Sessão 10',9,'2011-08-10 09:00:00',NULL,NULL,NULL,NULL,0,NULL,0,0),(10,8,1,1,'Sessão 8',8,'2011-08-08 09:00:00',NULL,NULL,NULL,NULL,0,NULL,0,0),(11,9,1,1,'Sessão 14',11,'2011-08-14 09:00:00',NULL,NULL,NULL,NULL,0,NULL,0,0),(12,1,1,1,'Sessão 1.5',12,'2011-08-01 16:00:00',NULL,NULL,NULL,NULL,0,NULL,0,0);
/*!40000 ALTER TABLE `sessao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessao_modelo`
--

DROP TABLE IF EXISTS `sessao_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessao_modelo` (
  `cod_sessao_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_treinador` int(11) DEFAULT NULL,
  `cod_treino_modelo` int(11) DEFAULT NULL,
  `nom_sessao_modelo` varchar(255) DEFAULT NULL,
  `num_ordem_sessao` int(11) DEFAULT NULL,
  `dth_sessao` datetime DEFAULT NULL,
  `des_clima` varchar(255) DEFAULT NULL,
  `des_temperatura` varchar(255) DEFAULT NULL,
  `des_terreno` varchar(255) DEFAULT NULL,
  `des_inclinacao` varchar(255) DEFAULT NULL,
  `ind_executado` tinyint(1) DEFAULT NULL,
  `num_pontos_sessao` float DEFAULT NULL,
  PRIMARY KEY (`cod_sessao_modelo`),
  KEY `frk_sessao_modelo_cod_treino_modelo` (`cod_treino_modelo`),
  KEY `frk_sessao_modelo_cod_usuario` (`cod_treinador`),
  CONSTRAINT `frk_sessao_modelo_cod_treinador` FOREIGN KEY (`cod_treinador`) REFERENCES `treinador` (`cod_treinador`),
  CONSTRAINT `frk_sessao_modelo_cod_treino_modelo` FOREIGN KEY (`cod_treino_modelo`) REFERENCES `treino_modelo` (`cod_treino_modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Modelo de sessão ou conjunto de exercícios.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessao_modelo`
--

LOCK TABLES `sessao_modelo` WRITE;
/*!40000 ALTER TABLE `sessao_modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessao_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenis`
--

DROP TABLE IF EXISTS `tenis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenis` (
  `cod_tenis` int(11) NOT NULL AUTO_INCREMENT,
  `cod_atleta` int(11) NOT NULL,
  `nom_tenis` varchar(255) NOT NULL,
  `qtd_quilometragem` float NOT NULL,
  `nom_marca` varchar(255) NOT NULL,
  `nom_modelo` varchar(255) NOT NULL,
  PRIMARY KEY (`cod_tenis`),
  KEY `frk_tenis_cod_usuario` (`cod_atleta`),
  CONSTRAINT `frk_tenis_cod_atleta` FOREIGN KEY (`cod_atleta`) REFERENCES `atleta` (`cod_atleta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tênis que são usados pelo atleta.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenis`
--

LOCK TABLES `tenis` WRITE;
/*!40000 ALTER TABLE `tenis` DISABLE KEYS */;
INSERT INTO `tenis` VALUES (1,1,'ASICS Kohana',0,'ASICS','Kohana');
/*!40000 ALTER TABLE `tenis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_exercicio`
--

DROP TABLE IF EXISTS `tipo_exercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_exercicio` (
  `cod_tipo_exercicio` int(11) NOT NULL AUTO_INCREMENT,
  `nom_tipo_exercicio` varchar(255) NOT NULL,
  `des_tipo_exercicio` text NOT NULL,
  `img_logo_exercicio` blob,
  PRIMARY KEY (`cod_tipo_exercicio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Cardiorrespiratório, neuromuscular, mobilidade articular, et';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_exercicio`
--

LOCK TABLES `tipo_exercicio` WRITE;
/*!40000 ALTER TABLE `tipo_exercicio` DISABLE KEYS */;
INSERT INTO `tipo_exercicio` VALUES (1,'Corrida','',NULL),(2,'Musculação','',NULL),(3,'Natação','',NULL),(4,'Ciclismo','',NULL);
/*!40000 ALTER TABLE `tipo_exercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_exercicio_modelo`
--

DROP TABLE IF EXISTS `tipo_exercicio_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_exercicio_modelo` (
  `cod_tipo_exercicio_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_treinador` int(11) DEFAULT NULL,
  `nom_tipo_exercicio_modelo` text NOT NULL,
  `des_tipo_exercicio_modelo` text,
  PRIMARY KEY (`cod_tipo_exercicio_modelo`),
  KEY `frk_tipo_exercicio_modelo_cod_usuario` (`cod_treinador`),
  CONSTRAINT `frk_tipo_exercicio_modelo_cod_treinador` FOREIGN KEY (`cod_treinador`) REFERENCES `treinador` (`cod_treinador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cardiorrespiratório, neuromuscular, mobilidade articular, et';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_exercicio_modelo`
--

LOCK TABLES `tipo_exercicio_modelo` WRITE;
/*!40000 ALTER TABLE `tipo_exercicio_modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_exercicio_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treinador`
--

DROP TABLE IF EXISTS `treinador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treinador` (
  `cod_treinador` int(11) NOT NULL AUTO_INCREMENT,
  `cod_gerente` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  PRIMARY KEY (`cod_treinador`),
  KEY `frk_treinador_cod_gerente` (`cod_gerente`),
  KEY `frk_treinador_cod_usuario` (`cod_usuario`),
  CONSTRAINT `frk_treinador_cod_gerente` FOREIGN KEY (`cod_gerente`) REFERENCES `gerente` (`cod_gerente`),
  CONSTRAINT `frk_treinador_cod_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Usuários treinadores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treinador`
--

LOCK TABLES `treinador` WRITE;
/*!40000 ALTER TABLE `treinador` DISABLE KEYS */;
INSERT INTO `treinador` VALUES (1,1,4),(2,1,5),(3,2,6),(4,2,7);
/*!40000 ALTER TABLE `treinador` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__treinador_ai 
after insert on treinador
for each row
begin
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'insert', now(), 'treinador', null, 'cod_treinador', null, cast(new.cod_treinador as char), null, null);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__treinador_au 
after update on treinador
for each row
begin
declare v_val_prk int(20);
declare v_cod_usuario_old int(20);
declare v_cod_usuario_new int(20);
declare v_cod_gerente_old int(20);
declare v_cod_gerente_new int(20);
set v_val_prk := old.cod_treinador;
set v_cod_usuario_old := old.cod_usuario;
set v_cod_usuario_new := new.cod_usuario;
set v_cod_gerente_old := old.cod_gerente;
set v_cod_gerente_new := new.cod_gerente;
if ifnull(v_cod_usuario_new,0) != ifnull(v_cod_usuario_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treinador', v_val_prk, 'cod_usuario', cast(v_cod_usuario_old as char), cast(v_cod_usuario_new as char), null, null);
end if;
if ifnull(v_cod_gerente_new,0) != ifnull(v_cod_gerente_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treinador', v_val_prk, 'cod_gerente', cast(v_cod_gerente_old as char), cast(v_cod_gerente_new as char), null, null);
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__treinador_ad
after delete on treinador
for each row
begin
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'treinador', null, 'cod_treinador', cast(old.cod_treinador as char), null, null, null);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `treino`
--

DROP TABLE IF EXISTS `treino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treino` (
  `cod_treino` int(11) NOT NULL AUTO_INCREMENT,
  `cod_microciclo` int(11) NOT NULL,
  `nom_treino` varchar(255) DEFAULT NULL,
  `num_ordem_treino` int(11) NOT NULL,
  `dat_treino` date NOT NULL,
  `nom_caminho_arquivo_hrm` text NOT NULL,
  `qtd_pontos_treino` float DEFAULT NULL,
  `ind_liberado` tinyint(1) NOT NULL,
  `ind_executado` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_treino`),
  UNIQUE KEY `unq_treino_cod_microciclo_nom_treino` (`nom_treino`,`cod_microciclo`) USING BTREE,
  KEY `frk_treino_cod_microciclo` (`cod_microciclo`),
  CONSTRAINT `frk_treino_cod_microciclo` FOREIGN KEY (`cod_microciclo`) REFERENCES `microciclo` (`cod_microciclo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COMMENT='Treino feito em um dia.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treino`
--

LOCK TABLES `treino` WRITE;
/*!40000 ALTER TABLE `treino` DISABLE KEYS */;
INSERT INTO `treino` VALUES (1,1,'Treino 1',1,'2011-08-01','',12,0,0),(2,1,'Treino 2',2,'2011-08-02','',NULL,0,0),(3,1,'Treino 3',3,'2011-08-03','',NULL,0,0),(4,1,'Treino 4',4,'2011-08-04','',NULL,0,0),(5,1,'Treino 5',5,'2011-08-05','',NULL,0,0),(6,1,'Treino 6',6,'2011-08-06','',NULL,0,0),(7,1,'Treino 7',7,'2011-08-07','',NULL,0,0),(8,3,'Treino 1',1,'2011-08-08','',NULL,0,0),(9,3,'Treino 7',7,'2011-08-14','',NULL,0,0),(10,3,'Treino 6',6,'2011-08-13','',NULL,0,0),(11,3,'Treino 5',5,'2011-08-12','',NULL,0,0),(12,3,'Treino 4',4,'2011-08-11','',NULL,0,0),(13,3,'Treino 3',3,'2011-08-10','',NULL,0,0),(14,3,'Treino 2',2,'2011-08-09','',NULL,0,0);
/*!40000 ALTER TABLE `treino` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_log__treino_ai 
AFTER INSERT ON treino
FOR EACH ROW
begin
declare v_treino_qtd_pontos float;
declare v_micro_qtd_pontos float;
declare fim_cursor int;
declare cur_pontos cursor for
	select qtd_pontos_treino
	from treino
	where cod_microciclo = new.cod_microciclo;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_cursor = 1;
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'insert', now(), 'treino', null, 'cod_treino', null, cast(new.cod_treino as char), null, null);
set fim_cursor = 0;
set v_micro_qtd_pontos = 0;
if (new.qtd_pontos_treino != 0) then
	open cur_pontos;
	cursor_loop:loop
		fetch cur_pontos into v_treino_qtd_pontos;
		if fim_cursor = 1 then
			leave cursor_loop;
		end if;
		set v_micro_qtd_pontos = v_micro_qtd_pontos + v_treino_qtd_pontos;
	end loop cursor_loop;
	update microciclo set qtd_pontos_microciclo = v_micro_qtd_pontos where cod_microciclo = new.cod_microciclo;	
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__treino_au 
after update on treino
for each row
begin
declare v_val_prk int(11);
declare v_cod_microciclo_old int(11);
declare v_cod_microciclo_new int(11);
declare v_nom_treino_old varchar(255);
declare v_nom_treino_new varchar(255);
declare v_num_ordem_treino_old int(11);
declare v_num_ordem_treino_new int(11);
declare v_dat_treino_old varchar(255);
declare v_dat_treino_new varchar(255);
declare v_nom_caminho_arquivo_hrm_old varchar(255);
declare v_nom_caminho_arquivo_hrm_new varchar(255);
declare v_qtd_pontos_treino_old float(11);
declare v_qtd_pontos_treino_new float(11);
declare v_ind_liberado_old int(1);
declare v_ind_liberado_new int(1);
declare v_ind_executado_old int(1);
declare v_ind_executado_new int(1);
declare v_treino_qtd_pontos float;
declare v_micro_qtd_pontos float;
declare fim_cursor int;
declare cur_pontos cursor for
	select qtd_pontos_treino
	from treino
	where cod_microciclo = new.cod_microciclo;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_cursor = 1;
set v_val_prk := old.cod_treino;
set v_cod_microciclo_old := old.cod_microciclo;
set v_cod_microciclo_new := new.cod_microciclo;
set v_nom_treino_old := old.nom_treino;
set v_nom_treino_new := new.nom_treino;
set v_num_ordem_treino_old := old.num_ordem_treino;
set v_num_ordem_treino_new := new.num_ordem_treino;
set v_dat_treino_old := old.dat_treino;
set v_dat_treino_new := new.dat_treino;
set v_nom_caminho_arquivo_hrm_old := old.nom_caminho_arquivo_hrm;
set v_nom_caminho_arquivo_hrm_new := new.nom_caminho_arquivo_hrm;
set v_qtd_pontos_treino_old := old.qtd_pontos_treino;
set v_qtd_pontos_treino_new := new.qtd_pontos_treino;
set v_ind_liberado_old := old.ind_liberado;
set v_ind_liberado_new := new.ind_liberado;
set v_ind_executado_old := old.ind_executado;
set v_ind_executado_new := new.ind_executado;
if ifnull(v_cod_microciclo_new,0) != ifnull(v_cod_microciclo_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'cod_microciclo', cast(v_cod_microciclo_old as char), cast(v_cod_microciclo_new as char), null, null);
end if;
if ifnull(v_nom_treino_new,0) != ifnull(v_nom_treino_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'nom_treino', cast(v_nom_treino_old as char), cast(v_nom_treino_new as char), null, null);
end if;
if ifnull(v_num_ordem_treino_new,0) != ifnull(v_num_ordem_treino_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'num_ordem_treino', cast(v_num_ordem_treino_old as char), cast(v_num_ordem_treino_new as char), null, null);
end if;
if ifnull(v_dat_treino_new,0) != ifnull(v_dat_treino_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'dat_treino', cast(v_dat_treino_old as char), cast(v_dat_treino_new as char), null, null);
end if;
if ifnull(v_nom_caminho_arquivo_hrm_new,0) != ifnull(v_nom_caminho_arquivo_hrm_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'nom_caminho_arquivo_hrm', cast(v_nom_caminho_arquivo_hrm_old as char), cast(v_nom_caminho_arquivo_hrm_new as char), null, null);
end if;
if ifnull(v_qtd_pontos_treino_new,0) != ifnull(v_qtd_pontos_treino_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'qtd_pontos_treino', cast(v_qtd_pontos_treino_old as char), cast(v_qtd_pontos_treino_new as char), null, null);
set fim_cursor = 0;
set v_micro_qtd_pontos = 0;
open cur_pontos;
cursor_loop:loop
	fetch cur_pontos into v_treino_qtd_pontos;
	if fim_cursor = 1 then
		leave cursor_loop;
	end if;
	set v_micro_qtd_pontos = v_micro_qtd_pontos + v_treino_qtd_pontos;
end loop cursor_loop;
update microciclo set qtd_pontos_microciclo = v_micro_qtd_pontos where cod_microciclo = new.cod_microciclo;	
end if;
if ifnull(v_ind_liberado_new,0) != ifnull(v_ind_liberado_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'ind_liberado', cast(v_ind_liberado_old as char), cast(v_ind_liberado_new as char), null, null);
end if;
if ifnull(v_ind_executado_new,0) != ifnull(v_ind_executado_old,0) then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'ind_executado', cast(v_ind_executado_old as char), cast(v_ind_executado_new as char), null, null);
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_log__treino_ad
after delete on treino
for each row
begin
declare v_val_prk int(11);
declare v_cod_microciclo_old int(11);
declare v_nom_treino_old varchar(255);
declare v_num_ordem_treino_old int(11);
declare v_dat_treino_old varchar(255);
declare v_nom_caminho_arquivo_hrm_old varchar(255);
declare v_qtd_pontos_treino_old float(11);
declare v_ind_liberado_old int(1);
declare v_ind_executado_old int(1);
declare v_treino_qtd_pontos float;
declare v_micro_qtd_pontos float;
declare fim_cursor int;
declare cur_pontos cursor for
	select qtd_pontos_treino
	from treino
	where cod_microciclo = old.cod_microciclo;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_cursor = 1;
set v_val_prk := old.cod_treino;
set v_cod_microciclo_old := old.cod_microciclo;
set v_nom_treino_old := old.nom_treino;
set v_num_ordem_treino_old := old.num_ordem_treino;
set v_dat_treino_old := old.dat_treino;
set v_nom_caminho_arquivo_hrm_old := old.nom_caminho_arquivo_hrm;
set v_qtd_pontos_treino_old := old.qtd_pontos_treino;
set v_ind_liberado_old := old.ind_liberado;
set v_ind_executado_old := old.ind_executado;
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'delete', now(), 'treino', v_val_prk, 'cod_treino', cast(old.cod_treino as char), null, null, null);
if ifnull(v_cod_microciclo_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'cod_microciclo', cast(v_cod_microciclo_old as char), null, null, null);
end if;
if ifnull(v_nom_treino_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'nom_treino', cast(v_nom_treino_old as char), null, null, null);
end if;
if ifnull(v_num_ordem_treino_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'num_ordem_treino', cast(v_num_ordem_treino_old as char), null, null, null);
end if;
if ifnull(v_dat_treino_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'dat_treino', cast(v_dat_treino_old as char), null, null, null);
end if;
if ifnull(v_nom_caminho_arquivo_hrm_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'nom_caminho_arquivo_hrm', cast(v_nom_caminho_arquivo_hrm_old as char), null, null, null);
end if;
if ifnull(v_qtd_pontos_treino_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'qtd_pontos_treino', cast(v_qtd_pontos_treino_old as char), null, null, null);
set fim_cursor = 0;
set v_micro_qtd_pontos = 0;
open cur_pontos;
cursor_loop:loop
	fetch cur_pontos into v_treino_qtd_pontos;
	if fim_cursor = 1 then
		leave cursor_loop;
	end if;
	set v_micro_qtd_pontos = v_micro_qtd_pontos + v_treino_qtd_pontos;
end loop cursor_loop;
update microciclo set qtd_pontos_microciclo = v_micro_qtd_pontos where cod_microciclo = old.cod_microciclo;	
end if;
if ifnull(v_ind_liberado_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'ind_liberado', cast(v_ind_liberado_old as char), null, null, null);
end if;
if ifnull(v_ind_executado_old,' ') != ' ' then
insert into log (num_id_conexao, nom_acao, dth_acao, nom_tabela, num_val_prk, nom_campo, old_txt_value, new_txt_value, old_blob_value, new_blob_value)
values (connection_id(), 'update', now(), 'treino', v_val_prk, 'ind_executado', cast(v_ind_executado_old as char), null, null, null);
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `treino_modelo`
--

DROP TABLE IF EXISTS `treino_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treino_modelo` (
  `cod_treino_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_treinador` int(11) DEFAULT NULL,
  `cod_microciclo_modelo` int(11) DEFAULT NULL,
  `nom_treino_modelo` varchar(255) DEFAULT NULL,
  `num_ordem_treino` int(11) DEFAULT NULL,
  `dat_treino` date DEFAULT NULL,
  `nom_caminho_arquivo_hrm` text,
  `qtd_pontos` float DEFAULT NULL,
  `ind_liberado` tinyint(1) DEFAULT NULL,
  `ind_executado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cod_treino_modelo`),
  KEY `frk_treino_modelo_cod_microciclo` (`cod_microciclo_modelo`),
  KEY `frk_treino_modelo_cod_usuario` (`cod_treinador`),
  CONSTRAINT `frk_treino_modelo_cod_microciclo_modelo` FOREIGN KEY (`cod_microciclo_modelo`) REFERENCES `microciclo_modelo` (`cod_microciclo_modelo`),
  CONSTRAINT `frk_treino_modelo_cod_treinador` FOREIGN KEY (`cod_treinador`) REFERENCES `treinador` (`cod_treinador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Modelo de treino feito em um dia.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treino_modelo`
--

LOCK TABLES `treino_modelo` WRITE;
/*!40000 ALTER TABLE `treino_modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `treino_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `cod_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `cod_token` varchar(255) DEFAULT NULL,
  `nom_usuario` varchar(255) NOT NULL,
  `nom_login` varchar(255) NOT NULL,
  `cod_senha` varchar(255) DEFAULT NULL,
  `num_cpf` varchar(11) DEFAULT NULL,
  `num_ric` varchar(255) DEFAULT NULL,
  `nom_cidade_natal` varchar(255) DEFAULT NULL,
  `sgl_uf_natal` varchar(2) DEFAULT NULL,
  `nom_pais_natal` varchar(255) DEFAULT NULL,
  `dat_nascimento` date DEFAULT NULL,
  `end_residencia` varchar(255) DEFAULT NULL,
  `num_cep_residencia` varchar(8) DEFAULT NULL,
  `nom_bairro_residencia` varchar(255) DEFAULT NULL,
  `nom_cidade_residencia` varchar(255) DEFAULT NULL,
  `sgl_uf_residencia` varchar(2) DEFAULT NULL,
  `nom_pais_residencia` varchar(255) DEFAULT NULL,
  `num_telefone_residencia` varchar(255) DEFAULT NULL,
  `num_telefone_trabalho` varchar(255) DEFAULT NULL,
  `num_telefone_celular` varchar(255) DEFAULT NULL,
  `nom_email` varchar(255) NOT NULL,
  `ind_ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Nzz9LB3ab65nNIsIFis5MS.oWD03RwBSf.WoToxz5D7','usuario1','usuario1','1234','','','','','',NULL,'','','','','','','','','','usuario1@gmail.com',1),(2,'1','usuario_gerente_1','usuario_gerente_1','WPxPbdCyoITB80LNEvBVvRBwIOjLxxWnXVuwZFYIc6A','','','','','',NULL,'','','','','','','','','','usuario2@gmail.com',0),(3,'1','usuario_gerente_2','usuario_gerente_2','81fa7b9ac95c9fa8c27630de6c71165770529c3be5e4150b1f0ae505a0cdee9b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'usuario3@gmail.com',0),(4,'1','usuario_treinador_1','usuario_treinador_1','ldc.Klh6D8IQUDPYyE0gFBftKybQtAK9jWM9cDyJxv/','11','','','','',NULL,'','','','','','','','','','usuario11@gmail.com',0),(5,'11','usuario_treinador_2','usuario_treinador_2','WPxPbdCyoITB80LNEvBVvRBwIOjLxxWnXVuwZFYIc6A','58432825115','','','','',NULL,'','','','','','','','','','usuario22@gmail.com',0),(6,'1','usuario_treinador_3','usuario_treinador_3','81fa7b9ac95c9fa8c27630de6c71165770529c3be5e4150b1f0ae505a0cdee9b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'usuario33@gmail.com',0),(7,'1','usuario_treinador_4','usuario_treinador_4','81fa7b9ac95c9fa8c27630de6c71165770529c3be5e4150b1f0ae505a0cdee9b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'usuario222@gmail.com',0),(8,'1','usuario_atleta_1','usuario_atleta_1','81fa7b9ac95c9fa8c27630de6c71165770529c3be5e4150b1f0ae505a0cdee9b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'usuario444@gmail.com',0),(9,'1','usuario_atleta_2','usuario_atleta_2','81fa7b9ac95c9fa8c27630de6c71165770529c3be5e4150b1f0ae505a0cdee9b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'usuario_atleta_2@gmail.com',0),(10,'1','usuario_atleta_3','usuario_atleta_3','81fa7b9ac95c9fa8c27630de6c71165770529c3be5e4150b1f0ae505a0cdee9b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'usuario_atleta_3@gmail.com',0),(11,'1','usuario_atleta_4','usuario_atleta_4','ADA1XufMpk9ZGe10pD7K57anHhBL3VPGKxp2XyJJfM8','','','','','',NULL,'','','','','','','','','','usuario_atleta_4@gmail.com',0),(13,'2','teste','teste','swhS793sxpsUgwZwzpvYw7Lmw7RzsGwfzQAlIyIQ6Z.','','','','','',NULL,'','','','','','','','','','teste@teste.com',1),(22,'2','teste2','teste2','4OJAEAOqcVUoA0N9VAFyatIhloe79n9GNorFoTrjbCB','123456','','','','',NULL,'','','','','','','','','','teste2@teste.com',1),(27,'2','teste3','teste3','swhS793sxpsUgwZwzpvYw7Lmw7RzsGwfzQAlIyIQ6Z.','','','','','',NULL,'','','','','','','','','','teste3@teste.com',1),(29,'2','teste34','teste34','swhS793sxpsUgwZwzpvYw7Lmw7RzsGwfzQAlIyIQ6Z.','','','','','',NULL,'','','','','','','','','','teste34@teste.com',1);
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

-- Dump completed on 2013-04-08 20:06:19
