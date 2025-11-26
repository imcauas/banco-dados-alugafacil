CREATE DATABASE  IF NOT EXISTS `alugafacil` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `alugafacil`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: alugafacil
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `cnh` varchar(100) NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `numero` varchar(100) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `municipio` varchar(45) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnh_UNIQUE` (`cnh`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (6,'João','Silva','12345678900','11999990000','joao@email.com','Rua A','10','01001000','SP','São Paulo','Brasil'),(7,'Maria','Oliveira','98765432100','21988887777','maria@email.com','Av Brasil','500','20040002','RJ','Rio de Janeiro','Brasil'),(9,'Ana','Pereira','22233344455','51998887766','ana.pereira@email.com','Rua da Praia','500','90010000','RS','Porto Alegre','Brasil'),(10,'Bruno','Mendes','55566677788','71987776655','bruno.m@email.com','Av Oceanica','1200','40140000','BA','Salvador','Brasil'),(11,'Camila','Rocha','99988877766','41996665544','camila.r@email.com','Rua das Araucarias','85','80030000','PR','Curitiba','Brasil'),(12,'Patricia','Lima','11122233399','11977771111','pati@email.com','Rua Augusta','800','01300000','SP','São Paulo','Brasil'),(13,'Marcos','Vinicius','44455566688','21966662222','marcos.v@email.com','Av Atlantica','100','22000000','RJ','Rio de Janeiro','Brasil'),(14,'Luciana','Duarte','77788899977','31955553333','lu.duarte@email.com','Rua da Bahia','50','30100000','MG','Belo Horizonte','Brasil');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_retirada` datetime NOT NULL,
  `data_prevista_devolucao` datetime DEFAULT NULL,
  `valor_diaria` decimal(10,2) DEFAULT NULL,
  `valor_multa_atraso` decimal(10,2) DEFAULT NULL,
  `km_saida` int NOT NULL,
  `observacoes` text,
  `status` varchar(45) DEFAULT NULL,
  `cliente_id` int NOT NULL,
  `veiculo_id` int NOT NULL,
  `funcionario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_CONTRATOS_clientes1_idx` (`cliente_id`),
  KEY `fk_CONTRATOS_veiculos1_idx` (`veiculo_id`),
  KEY `fk_CONTRATOS_FUNCIONARIOS1_idx` (`funcionario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (7,'2023-11-01 10:00:00','2023-11-05 10:00:00',100.00,110.00,10000,'Cliente solicitou cadeirinha de bebê inclusa no valor.','Ativo',6,13,1),(8,'2023-11-02 14:00:00','2023-11-04 14:00:00',150.00,165.00,2500,NULL,'Concluido',9,14,2),(9,'2023-11-10 09:00:00','2023-11-12 09:00:00',200.00,220.00,500,'Confirmar horário de retirada via WhatsApp com o cliente.','Agendado',6,15,1),(10,'2025-11-20 11:39:46','2025-11-25 11:39:46',250.00,275.00,5000,'Cliente VIP, tanque cheio.','Ativo',13,18,6),(11,'2023-10-01 08:00:00','2023-10-10 08:00:00',120.00,132.00,15000,NULL,'Concluido',12,17,2);
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucao`
--

DROP TABLE IF EXISTS `devolucao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_devolucao_real` datetime NOT NULL,
  `km_chegada` int NOT NULL,
  `observacoes_devolucao` text,
  `contrato_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_DEVOLUCAO_CONTRATOS1_idx` (`contrato_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao`
--

LOCK TABLES `devolucao` WRITE;
/*!40000 ALTER TABLE `devolucao` DISABLE KEYS */;
INSERT INTO `devolucao` VALUES (1,'2023-11-04 16:00:00',2900,'Entregue com tanque cheio. Sem avarias.',8),(2,'2023-10-10 08:30:00',15800,'Tudo ok.',11);
/*!40000 ALTER TABLE `devolucao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Roberto','Almeida','Atendente'),(2,'Fernanda','Costa','Gerente'),(3,'Lucas','Pereira','Vendedor'),(4,'Amanda','Souza','Atendente'),(5,'Ricardo','Mendes','Mecânico Chefe'),(6,'Juliana','Paiva','Atendente');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_marca` varchar(255) NOT NULL,
  `origem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Volkswagen','Alemanha'),(2,'Toyota','Japão'),(3,'Chevrolet','EUA'),(6,'Ford','EUA'),(7,'Hyundai','Coreia do Sul'),(8,'Fiat','Itália');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_pagamento` datetime DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `metodo_pagamento` varchar(45) DEFAULT NULL,
  `status_pagamento` varchar(45) DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `contrato_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PAGAMENTO_CONTRATOS1_idx` (`contrato_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,'2023-11-05 10:00:00',1100.00,'Cartao Credito','Aprovado',0.00,7),(2,'2023-11-04 14:00:00',300.00,'Pix','Aprovado',15.00,8),(3,'2023-11-10 09:00:00',50.00,'Dinheiro','Pendente',0.00,9),(4,'2023-10-10 09:00:00',1080.00,'Cartao Credito','Aprovado',0.00,11);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `relatorio_status_contratos`
--

DROP TABLE IF EXISTS `relatorio_status_contratos`;
/*!50001 DROP VIEW IF EXISTS `relatorio_status_contratos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `relatorio_status_contratos` AS SELECT 
 1 AS `Nome_Cliente`,
 1 AS `Veiculo`,
 1 AS `Data_Inicio`,
 1 AS `Previsao_Fim`,
 1 AS `Status_Atual`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca_id` int NOT NULL,
  `transmissao` varchar(255) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `combustivel` varchar(255) NOT NULL,
  `placa` varchar(45) NOT NULL,
  `chassi` varchar(50) NOT NULL,
  `cor` varchar(45) DEFAULT NULL,
  `ano_fabricacao` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `placa_UNIQUE` (`placa`),
  UNIQUE KEY `chassi_UNIQUE` (`chassi`),
  KEY `marcas_id` (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (13,1,'Manual','Gol','Flex','ABC-1234','9BWZZZ...','Branco',2020),(14,1,'Automatico','Onix','Flex','XYZ-9876','8C3VVV...','Prata',2022),(15,2,'Automatico','Corolla','Gasolina','JKL-5555','7TYUUU...','Preto',2023),(16,6,'Manual','Ka SE','Flex','KKA-1122','2001','Branco',2021),(17,7,'Automatico','HB20S','Flex','HBS-3344','2002','Cinza',2023),(18,8,'Automatico','Toro','Diesel','TOR-5566','2003','Vinho',2022);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_alerta_atrasos`
--

DROP TABLE IF EXISTS `view_alerta_atrasos`;
/*!50001 DROP VIEW IF EXISTS `view_alerta_atrasos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_alerta_atrasos` AS SELECT 
 1 AS `Cliente`,
 1 AS `Carro_com_Cliente`,
 1 AS `Era_pra_Devolver_Em`,
 1 AS `Dias_de_Atraso`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_resumo_financeiro`
--

DROP TABLE IF EXISTS `view_resumo_financeiro`;
/*!50001 DROP VIEW IF EXISTS `view_resumo_financeiro`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_resumo_financeiro` AS SELECT 
 1 AS `Forma_Pagamento`,
 1 AS `Qtd_Transacoes`,
 1 AS `Valor_Total_Arrecadado`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `relatorio_status_contratos`
--

/*!50001 DROP VIEW IF EXISTS `relatorio_status_contratos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `relatorio_status_contratos` AS select concat(`cli`.`nome`,' ',`cli`.`sobrenome`) AS `Nome_Cliente`,concat(`vei`.`modelo`,' - ',`vei`.`placa`) AS `Veiculo`,`con`.`data_retirada` AS `Data_Inicio`,`con`.`data_prevista_devolucao` AS `Previsao_Fim`,`con`.`status` AS `Status_Atual` from ((`contrato` `con` join `cliente` `cli` on((`con`.`cliente_id` = `cli`.`id`))) join `veiculo` `vei` on((`con`.`veiculo_id` = `vei`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_alerta_atrasos`
--

/*!50001 DROP VIEW IF EXISTS `view_alerta_atrasos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_alerta_atrasos` AS select `cli`.`nome` AS `Cliente`,`vei`.`modelo` AS `Carro_com_Cliente`,`con`.`data_prevista_devolucao` AS `Era_pra_Devolver_Em`,(to_days(now()) - to_days(`con`.`data_prevista_devolucao`)) AS `Dias_de_Atraso` from ((`contrato` `con` join `cliente` `cli` on((`con`.`cliente_id` = `cli`.`id`))) join `veiculo` `vei` on((`con`.`veiculo_id` = `vei`.`id`))) where ((`con`.`status` = 'Ativo') and (`con`.`data_prevista_devolucao` < now())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_resumo_financeiro`
--

/*!50001 DROP VIEW IF EXISTS `view_resumo_financeiro`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_resumo_financeiro` AS select `pagamento`.`metodo_pagamento` AS `Forma_Pagamento`,count(0) AS `Qtd_Transacoes`,sum(`pagamento`.`valor_total`) AS `Valor_Total_Arrecadado` from `pagamento` group by `pagamento`.`metodo_pagamento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-20 12:11:57
