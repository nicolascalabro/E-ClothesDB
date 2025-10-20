CREATE DATABASE  IF NOT EXISTS `eclothesdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eclothesdb`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: eclothesdb
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `auditoria_precio_prod`
--

DROP TABLE IF EXISTS `auditoria_precio_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_precio_prod` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `precio_antiguo` decimal(10,2) DEFAULT NULL,
  `precio_nuevo` decimal(10,2) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_precio_prod`
--

LOCK TABLES `auditoria_precio_prod` WRITE;
/*!40000 ALTER TABLE `auditoria_precio_prod` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_precio_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Remeras'),(2,'Buzos'),(3,'Camperas'),(4,'Pantalones'),(5,'Vestidos'),(6,'Camisas'),(7,'Faldas'),(8,'Accesorios'),(9,'Calzado'),(10,'Chalecos');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Carlos','Perez','+54 9 351-4827310','carlos.perez@gmail.com','Av. Libertad 101'),(2,'Maria','Gomez','+54 9 011-3256998','maria.gomez@gmail.com','Calle Falsa 123'),(3,'Javier','Fernandez','+54 9 261-4478921','javier.fernandez@gmail.com','Callejon San Martin 303'),(4,'Lucia','Martinez','+54 9 223-4782210','lucia.martinez@gmail.com','Av. Plaza Central 514'),(5,'Andres','Sanchez','+54 9 381-4790033','andres.sanchez@gmail.com','Av. Rivadavia 625'),(6,'Sofia','Ramirez','+54 9 299-4637281','sofia.ramirez@gmail.com','Boulevard Mitre 845'),(7,'Mateo','Lopez','+54 9 011-4385621','mateo.lopez@gmail.com','Calle Belgrano 148'),(8,'Valentina','Torres','+54 9 351-4216583','valentina.torres@gmail.com','Paseo del Prado 78'),(9,'Martin','Ruiz','+54 9 223-4981220','martin.ruiz@gmail.com','Av. Alem 1100'),(10,'Camila','Morales','+54 9 381-4756329','camila.morales@gmail.com','Calle Moreno 250');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_pedido` int NOT NULL,
  `cantidad_item` int NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `fk_detalle_producto` (`id_producto`),
  KEY `fk_detalle_pedido` (`id_pedido`),
  CONSTRAINT `fk_detalle_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,1,2),(2,21,1,1),(3,36,1,1),(4,6,2,1),(5,12,2,1),(6,33,2,2),(7,16,3,1),(8,26,3,1),(9,31,3,1),(10,3,4,1),(11,8,4,1),(12,37,4,1),(13,5,5,1),(14,28,5,2),(15,39,5,1),(16,10,6,1),(17,23,6,1),(18,42,6,1),(19,2,7,1),(20,32,7,1),(21,35,7,2),(22,13,8,1),(23,18,8,1),(24,41,8,1),(25,4,9,1),(26,19,9,1),(27,29,9,1),(28,45,9,1),(29,7,10,1),(30,25,10,1),(31,38,10,1),(32,44,10,1);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_actualizar_stock_after_ins` AFTER INSERT ON `detalle_pedido` FOR EACH ROW BEGIN
		CALL sp_actualizar_stock_productos(NEW.id_producto, - NEW.cantidad_item);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_calcular_total_after_ins` AFTER INSERT ON `detalle_pedido` FOR EACH ROW BEGIN
		CALL sp_actualizar_total_pedido(NEW.id_pedido);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `metodo` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `total` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,'Tarjeta de credito','Pagado',0.00),(2,'Transferencia bancaria','Pagado',0.00),(3,'Transferencia bancaria','Pendiente',0.00),(4,'Tarjeta de debito','Pagado',0.00),(5,'Efectivo','Pagado',0.00),(6,'Transferencia bancaria','Cancelado',0.00),(7,'Tarjeta de credito','Pagado',0.00),(8,'Transferencia bancaria','Pagado',0.00),(9,'Tarjeta de debito','Pendiente',0.00),(10,'Efectivo','Pagado',0.00);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_pago` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_cliente` (`id_cliente`),
  KEY `fk_pedido_pago` (`id_pago`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pedido_pago` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,6,8,'2025-08-18'),(2,4,7,'2025-07-14'),(3,9,3,'2025-09-21'),(4,10,10,'2025-07-30'),(5,2,4,'2025-09-11'),(6,1,6,'2025-07-09'),(7,3,1,'2025-09-01'),(8,8,9,'2025-08-17'),(9,5,2,'2025-09-19'),(10,7,5,'2025-07-27');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `id_proveedor` int DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_producto_categoria` (`id_categoria`),
  KEY `fk_producto_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_producto_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,2,'Remera basica blanca','Remera de algodon con cuello redondo',4500.00,120),(2,1,1,'Remera estampada urbana','Remera de algodon con estampado grafico',5200.00,80),(3,1,6,'Remera negra slim fit','Remera de corte ajustado, color negro',3900.00,100),(4,1,1,'Remera oversize gris','Remera estilo urbano, corte ancho',4600.00,60),(5,1,8,'Remera deportiva','Remera para running',5300.00,75),(6,2,9,'Buzo canguro gris','Buzo de algodon con capucha y bolsillo frontal',85000.00,80),(7,2,1,'Buzo basico negro','Buzo liso de algodon, cuello redondo',50000.00,100),(8,2,8,'Buzo deportivo','Buzo liviano para entrenamiento',42000.00,70),(9,2,3,'Buzo oversize beige','Buzo estilo urbano de corte ancho',65000.00,50),(10,2,10,'Buzo estampado retro','Buzo con estampado vintage',95000.00,40),(11,3,2,'Campera de jean','Campera de jean azul clasico',90000.00,30),(12,3,9,'Campera bomber verde','Campera bomber con cierre metalico',100000.00,45),(13,3,5,'Campera de cuero','Campera de cuero sintetico negra',185000.00,20),(14,3,1,'Campera rompeviento','Campera ligera impermeable',80000.00,55),(15,3,3,'Campera abrigada','Campera acolchada para invierno',130000.00,25),(16,4,2,'Jeans azul clasico','Pantalon de jean corte recto',42000.00,70),(17,4,6,'Pantalon cargo verde','Pantalon cargo con multiples bolsillos',35000.00,40),(18,4,8,'Jogger gris','Pantalon deportivo con puño elastizado',38000.00,90),(19,4,10,'Pantalon formal negro','Pantalon de vestir slim fit',50000.00,50),(20,4,6,'Pantalon de lino beige','Pantalon liviano de verano',35000.00,35),(21,5,5,'Vestido largo floral','Vestido de verano con estampado floral',25000.00,40),(22,5,5,'Vestido corto negro','Vestido elegante color negro',30000.00,30),(23,5,2,'Vestido camisero','Vestido estilo camisa, manga larga',32000.00,25),(24,5,10,'Vestido de fiesta rojo','Vestido de noche',38000.00,15),(25,5,2,'Vestido casual','Vestido suelto de algodon',15000.00,35),(26,6,10,'Camisa blanca formal','Camisa manga larga, botones clasicos',11000.00,50),(27,6,6,'Camisa a cuadros','Camisa de algodon, estilo leñador',9800.00,60),(28,6,1,'Camisa celeste','Camisa manga larga slim fit',11500.00,40),(29,6,2,'Camisa de jean','Camisa de jean manga larga',12500.00,35),(30,6,6,'Camisa lino beige','Camisa fresca para verano',10500.00,45),(31,7,1,'Falda de jean','Falda corta de jean azul',26000.00,40),(32,7,5,'Falda negra','Falda larga suelta',34000.00,25),(33,7,6,'Falda estampada','Falda corta con estampado floral',27000.00,30),(34,7,1,'Falda larga beige','Falda de lino suelta',18500.00,20),(35,7,5,'Falda de cuero sintetico','Falda corta de cuero negro',35000.00,15),(36,8,7,'Cinturon de cuero','Cinturon marron con hebilla metalica',45000.00,80),(37,8,7,'Gorra deportiva','Gorra ajustable',32000.00,100),(38,8,7,'Bufanda lana','Bufanda tejida color gris',18000.00,70),(39,8,7,'Mochila urbana','Mochila negra con bolsillos multiples',90000.00,30),(40,8,7,'Bolso de tela','Bolso de tela estampado',65000.00,40),(41,9,4,'Zapatillas urbanas blancas','Zapatillas casuales de tela',91500.00,60),(42,9,4,'Botines negros','Botines de cuero con cierre lateral',67000.00,25),(43,9,4,'Sandalias marrones','Sandalias de cuero, hebilla metalica',50000.00,35),(44,9,4,'Ojotas playeras','Ojotas de goma estampadas',27000.00,100),(45,9,4,'Zapatillas running','Zapatillas deportivas livianas',70000.00,50),(46,10,9,'Chaleco acolchado negro','Chaleco abrigado',11800.00,45),(47,10,10,'Chaleco de lana gris','Chaleco tejido para invierno',9800.00,35),(48,10,2,'Chaleco formal azul','Chaleco elegante para traje',13500.00,25),(49,10,8,'Chaleco deportivo','Chaleco liviano para entrenamiento',8900.00,30),(50,10,1,'Chaleco de jean','Chaleco clasico de jean azul',10500.00,40);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_registrar_precio_after_upd` AFTER UPDATE ON `producto` FOR EACH ROW BEGIN
		IF OLD.precio <> NEW.precio THEN
        INSERT INTO Auditoria_Precio_Prod (id_producto, precio_antiguo, precio_nuevo, fecha, usuario)
        VALUES (NEW.id_producto, OLD.precio, NEW.precio, NOW(), CURRENT_USER());
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `empresa` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Moda Urbana SA','+54 9 011-4567890','contacto@modaurbana.com'),(2,'Estilo & Confort SRL','+54 9 351-4728391','ventas@estiloconfort.com'),(3,'Textiles Andinos','+54 9 261-4938274','info@textilesandinos.com'),(4,'Calzado del Sur','+54 9 223-4783920','pedidos@calzadodelsur.com'),(5,'Fashion Import','+54 9 381-4748293','ventas@fashionimport.com'),(6,'Distribuidora Ropa Joven','+54 9 299-4629382','ventas@ropajoven.com'),(7,'Accesorios Glamour','+54 9 011-4372981','contacto@accesoriosglamour.com'),(8,'Deportes Total','+54 9 379-4293842','ventas@deportestotal.com'),(9,'Abrigos Patagonia','+54 9 351-4738295','info@abrigospatagonia.com'),(10,'Indumentaria Premium','+54 9 223-4962837','ventas@indumentariapremium.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_cant_productos_pedido`
--

DROP TABLE IF EXISTS `vw_cant_productos_pedido`;
/*!50001 DROP VIEW IF EXISTS `vw_cant_productos_pedido`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cant_productos_pedido` AS SELECT 
 1 AS `Nro_Pedido`,
 1 AS `Total_Items`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_clientes_pedidos`
--

DROP TABLE IF EXISTS `vw_clientes_pedidos`;
/*!50001 DROP VIEW IF EXISTS `vw_clientes_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_clientes_pedidos` AS SELECT 
 1 AS `id_pedido`,
 1 AS `cliente`,
 1 AS `id_cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_estado_pedido`
--

DROP TABLE IF EXISTS `vw_estado_pedido`;
/*!50001 DROP VIEW IF EXISTS `vw_estado_pedido`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_estado_pedido` AS SELECT 
 1 AS `id_pedido`,
 1 AS `id_pago`,
 1 AS `metodo`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productos_mas_vendidos`
--

DROP TABLE IF EXISTS `vw_productos_mas_vendidos`;
/*!50001 DROP VIEW IF EXISTS `vw_productos_mas_vendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productos_mas_vendidos` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre`,
 1 AS `total_vendido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productos_sin_vender`
--

DROP TABLE IF EXISTS `vw_productos_sin_vender`;
/*!50001 DROP VIEW IF EXISTS `vw_productos_sin_vender`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productos_sin_vender` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre`,
 1 AS `descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'eclothesdb'
--

--
-- Dumping routines for database 'eclothesdb'
--
/*!50003 DROP FUNCTION IF EXISTS `f_calcular_precio_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_calcular_precio_venta`(p_monto DECIMAL(10,2), p_porc_ganancia DECIMAL(10,2)) RETURNS decimal(10,2)
    NO SQL
BEGIN
		DECLARE precio_venta DECIMAL(10,2);
        SET precio_venta = p_monto + p_monto * (p_porc_ganancia/100);
        RETURN precio_venta;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_calcular_total_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_calcular_total_pedido`(p_id_pedido INT) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
		DECLARE total_pedido DECIMAL(10,2);
		SELECT SUM(d.cantidad_item * p.precio) INTO total_pedido
        FROM detalle_pedido AS d
        JOIN producto AS p
			ON d.id_producto = p.id_producto
        WHERE id_pedido = p_id_pedido;
		RETURN total_pedido;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_stock_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_stock_productos`(IN p_id_producto INT, IN p_cantidad INT)
BEGIN
		DECLARE v_stock_actual INT;
        DECLARE v_nuevo_stock INT;
        
        SELECT stock INTO v_stock_actual
        FROM producto
        WHERE id_producto = p_id_producto;
        
        SET v_nuevo_stock = v_stock_actual + p_cantidad;
        
        IF v_nuevo_stock < 0 THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error: El stock no puede ser negativo';
        ELSE    
			UPDATE producto
			SET stock = v_nuevo_stock
			WHERE id_producto = p_id_producto;
		END IF;   
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_total_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_total_pedido`(IN p_id_pedido INT)
BEGIN
		DECLARE v_total DECIMAL(10,2);
        DECLARE v_num_pago INT;
        
		SELECT f_calcular_total_pedido(p_id_pedido) INTO v_total;
        
        SELECT id_pago INTO v_num_pago
        FROM pedido
        WHERE id_pedido = p_id_pedido;
       
		IF v_num_pago IS NULL THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error: El pedido no existe o no tiene un pago asociado';
		ELSE
			UPDATE pago
			SET total = v_total
			WHERE id_pago = v_num_pago;
		END IF;  
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_cant_productos_pedido`
--

/*!50001 DROP VIEW IF EXISTS `vw_cant_productos_pedido`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cant_productos_pedido` AS select `detalle_pedido`.`id_pedido` AS `Nro_Pedido`,sum(`detalle_pedido`.`cantidad_item`) AS `Total_Items` from `detalle_pedido` group by `detalle_pedido`.`id_pedido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_clientes_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `vw_clientes_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clientes_pedidos` AS select `p`.`id_pedido` AS `id_pedido`,concat(`c`.`nombre`,' ',`c`.`apellido`) AS `cliente`,`c`.`id_cliente` AS `id_cliente` from (`cliente` `c` left join `pedido` `p` on((`c`.`id_cliente` = `p`.`id_cliente`))) order by `p`.`id_pedido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_estado_pedido`
--

/*!50001 DROP VIEW IF EXISTS `vw_estado_pedido`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_estado_pedido` AS select `pe`.`id_pedido` AS `id_pedido`,`pe`.`id_pago` AS `id_pago`,`pa`.`metodo` AS `metodo`,`pa`.`estado` AS `estado` from (`pedido` `pe` left join `pago` `pa` on((`pe`.`id_pago` = `pa`.`id_pago`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productos_mas_vendidos`
--

/*!50001 DROP VIEW IF EXISTS `vw_productos_mas_vendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productos_mas_vendidos` AS select `p`.`id_producto` AS `id_producto`,`p`.`nombre` AS `nombre`,sum(`d`.`cantidad_item`) AS `total_vendido` from (`detalle_pedido` `d` join `producto` `p` on((`d`.`id_producto` = `p`.`id_producto`))) group by `p`.`id_producto`,`p`.`nombre` order by `total_vendido` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productos_sin_vender`
--

/*!50001 DROP VIEW IF EXISTS `vw_productos_sin_vender`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productos_sin_vender` AS select `p`.`id_producto` AS `id_producto`,`p`.`nombre` AS `nombre`,`p`.`descripcion` AS `descripcion` from (`producto` `p` left join `detalle_pedido` `d` on((`p`.`id_producto` = `d`.`id_producto`))) where `p`.`id_producto` in (select `detalle_pedido`.`id_producto` from `detalle_pedido`) is false */;
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

-- Dump completed on 2025-10-20  0:57:56
