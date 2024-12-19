-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: marketdb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `apertura_caja`
--

DROP TABLE IF EXISTS `apertura_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apertura_caja` (
  `caja_id` varchar(15) NOT NULL,
  `monto_inicial` decimal(10,2) NOT NULL,
  `monto_final` decimal(10,2) NOT NULL,
  `monto_venta` decimal(10,2) NOT NULL,
  `fecha_apertura` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_cierre` datetime DEFAULT NULL,
  `estado` varchar(15) NOT NULL,
  `comentarios` varchar(255) DEFAULT NULL,
  `usuario_id` varchar(15) NOT NULL,
  PRIMARY KEY (`caja_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `apertura_caja_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apertura_caja`
--

LOCK TABLES `apertura_caja` WRITE;
/*!40000 ALTER TABLE `apertura_caja` DISABLE KEYS */;
INSERT INTO `apertura_caja` VALUES ('CAJ-A001',200.00,300.00,100.00,'2024-05-12 08:05:00','2024-05-12 22:00:05','CERRADO',NULL,'12345678'),('CAJ-A002',300.00,800.00,500.00,'2024-05-15 09:02:02','2024-05-15 21:35:15','CERRADO',NULL,'12345678'),('CAJ-A003',600.00,1500.00,900.00,'2024-05-18 08:32:01',NULL,'ABIERTO',NULL,'87654321');
/*!40000 ALTER TABLE `apertura_caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `categoria_id` varchar(15) NOT NULL,
  `nombre_cat` varchar(50) NOT NULL,
  `descripcion_cat` varchar(250) DEFAULT NULL,
  `imagen_cat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('CAT001','Lacteos','Productos derivados de la leche',NULL),('CAT002','Bebidas','Bebidas alcohólicas y no alcohólicas',NULL),('CAT003','Carnes','Carnes frescas y congeladas',NULL),('CAT004','Frutas','Frutas frescas',NULL),('CAT005','Verduras','Vegetales frescos',NULL),('CAT006','Panaderia','Pan y productos de panadería',NULL),('CAT007','Limpieza','Productos de limpieza del hogar',NULL),('CAT008','Cuidado Personal','Productos para cuidado personal',NULL),('CAT009','Enlatados','Conservas y enlatados',NULL),('CAT010','Snacks','Galletas, dulces y bocadillos',NULL);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cliente_id` varchar(15) NOT NULL,
  `nombre_cli` varchar(50) NOT NULL,
  `apellido1_cli` varchar(50) NOT NULL,
  `apellido2_cli` varchar(50) DEFAULT NULL,
  `telefono_cli` varchar(15) DEFAULT NULL,
  `direccion_cli` varchar(100) DEFAULT NULL,
  `tipo_cli` varchar(15) NOT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('09876543','Elena','Rojas','Benavidez','965432109','Pasaje Azul 202','PERSONA'),('12345678','Pedro','Ramirez','Arana','945678901','Av. Las Flores 123','PERSONA'),('20123456789','Don Pancho','S.A.C.',NULL,'912345678','Av. Nutricion 77','EMPRESA'),('20345678901','Astoria','S.R.L.',NULL,'987654320','Jr. Progreso 11','EMPRESA'),('20456789012','Corporación Elena','S.A.',NULL,'964321098','Carretera Central Km. 9','EMPRESA'),('20567890123','Manu','S.A.S.',NULL,'932165478','Av. Cerveza 33','EMPRESA'),('20654321098','Doña Lupe','E.I.R.L.',NULL,'931122334','Jr. Ganaderos 50','EMPRESA'),('45678901','Jose','Diaz','Rojas','987654321','Av. Universitaria 789','PERSONA'),('65432109','Claudia','Mendoza','Mancilla','976543210','Calle Lima 101','PERSONA'),('87654321','Lucia','Castillo','Mendoza','956789012','Jr. Los Olivos 456','PERSONA');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante`
--

DROP TABLE IF EXISTS `comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobante` (
  `comprobante_id` varchar(15) NOT NULL,
  `tipo_comp` varchar(20) NOT NULL,
  `fecha_comp` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado_comp` varchar(20) NOT NULL,
  `total_comp` decimal(10,2) NOT NULL,
  `cliente_id` varchar(15) NOT NULL,
  `usuario_id` varchar(15) NOT NULL,
  PRIMARY KEY (`comprobante_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `comprobante_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  CONSTRAINT `comprobante_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante`
--

LOCK TABLES `comprobante` WRITE;
/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
INSERT INTO `comprobante` VALUES ('B001-0000001','BOLETA','2024-05-15 09:02:02','ANULADO',26.50,'09876543','12345678'),('F001-0000001','FACTURA','2024-05-15 09:02:02','PAGADO',125.50,'45678901','12345678'),('N001-0000001','NOTA DE VENTA','2024-05-15 09:02:02','A CREDITO',86.40,'20456789012','12345678');
/*!40000 ALTER TABLE `comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credencial_usuario`
--

DROP TABLE IF EXISTS `credencial_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credencial_usuario` (
  `credencial_id` varchar(15) NOT NULL,
  `usuario_cred` varchar(50) NOT NULL,
  `contrasena_cred` varchar(120) NOT NULL,
  `rol_us` varchar(20) NOT NULL,
  `actividad_us` varchar(20) NOT NULL,
  `usuario_id` varchar(15) NOT NULL,
  PRIMARY KEY (`credencial_id`),
  UNIQUE KEY `usuario_cred` (`usuario_cred`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `credencial_usuario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credencial_usuario`
--

LOCK TABLES `credencial_usuario` WRITE;
/*!40000 ALTER TABLE `credencial_usuario` DISABLE KEYS */;
INSERT INTO `credencial_usuario` VALUES ('ADM-0001','root','admin','ADMINISTRADOR','ACTIVO','11223344'),('CAJ-0001','usuario','usuario123','CAJERO','DESHABILITADO','12345678'),('SUP-0001','supervisor','supervisor123','SUPERVISOR','INACTIVO','87654321');
/*!40000 ALTER TABLE `credencial_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_comprobante`
--

DROP TABLE IF EXISTS `detalle_comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_comprobante` (
  `detalle_comprobante_id` varchar(20) NOT NULL,
  `cantidad` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `tipo_pago` varchar(20) NOT NULL,
  `comprobante_id` varchar(15) NOT NULL,
  `producto_id` varchar(40) NOT NULL,
  PRIMARY KEY (`detalle_comprobante_id`),
  KEY `comprobante_id` (`comprobante_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_comprobante_ibfk_1` FOREIGN KEY (`comprobante_id`) REFERENCES `comprobante` (`comprobante_id`),
  CONSTRAINT `detalle_comprobante_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_comprobante`
--

LOCK TABLES `detalle_comprobante` WRITE;
/*!40000 ALTER TABLE `detalle_comprobante` DISABLE KEYS */;
INSERT INTO `detalle_comprobante` VALUES ('DCOM-AAA000001',2,44.80,'EFECTIVO','F001-0000001','1231212533535'),('DCOM-AAA000002',1,32.20,'EFECTIVO','F001-0000001','1234455455455'),('DCOM-AAA000003',2,8.40,'EFECTIVO','F001-0000001','1234567890123'),('DCOM-AAA000004',2,52.80,'EFECTIVO','F001-0000001','1234567890458'),('DCOM-AAA000005',1,22.40,'TARJETA','N001-0000001','1231212533535'),('DCOM-AAA000006',1,32.20,'TARJETA','N001-0000001','1234455455455'),('DCOM-AAA000007',1,4.20,'TARJETA','N001-0000001','1234567890123'),('DCOM-AAA000008',1,22.40,'EFECTIVO','B001-0000001','1231212533535'),('DCOM-AAA000009',1,4.20,'EFECTIVO','B001-0000001','1234567890123');
/*!40000 ALTER TABLE `detalle_comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_producto`
--

DROP TABLE IF EXISTS `detalle_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_producto` (
  `detalle_producto_id` varchar(20) NOT NULL,
  `fecha_ingreso_prod` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_vencimiento_prod` datetime DEFAULT NULL,
  `peso_prod` decimal(8,3) NOT NULL,
  `precio_prod` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `producto_id` varchar(40) NOT NULL,
  PRIMARY KEY (`detalle_producto_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_producto_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_producto`
--

LOCK TABLES `detalle_producto` WRITE;
/*!40000 ALTER TABLE `detalle_producto` DISABLE KEYS */;
INSERT INTO `detalle_producto` VALUES ('1231212533535','2024-05-12 08:05:00','2024-12-12 08:05:00',2.340,22.40,6,'1231212533535'),('1234455455455','2024-05-12 08:05:00','2024-12-12 08:05:00',2.340,32.20,7,'1234455455455'),('1234567890123','2024-05-12 08:05:00','2024-12-12 08:05:00',0.390,4.20,24,'1234567890123'),('1234567890458','2024-05-12 08:05:00','2024-12-12 08:05:00',2.340,26.40,4,'1234567890458');
/*!40000 ALTER TABLE `detalle_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `producto_id` varchar(40) NOT NULL,
  `nombre_prod` varchar(250) NOT NULL,
  `marca_prod` varchar(50) NOT NULL,
  `presentacion_prod` varchar(50) DEFAULT NULL,
  `disponibilidad_prod` tinyint(1) DEFAULT NULL,
  `imagen_prod` varchar(100) DEFAULT NULL,
  `categoria_id` varchar(15) NOT NULL,
  `proveedor_id` varchar(15) NOT NULL,
  PRIMARY KEY (`producto_id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('0520123202132','Producto 2','Gloria','SixPackLata',1,NULL,'CAT001','20456789012'),('1010000000012','Producto1','Gloria','SixPackLata',1,NULL,'CAT001','20456789012'),('1231212533535','Leche Reconstituida Entera GLORIA Lata 390g Paquete 6un','Gloria','SixPackLata',1,NULL,'CAT001','20456789012'),('1234455455455','Leche GLORIA Zero Lacto Lata 390g Paquete 6un','Gloria','SixPackLata',1,NULL,'CAT001','20456789012'),('1234567890123','Leche Reconstituida Entera GLORIA Lata 390g','Gloria','Lata',1,NULL,'CAT001','20456789012'),('1234567890458','Leche Light GLORIA Lata 390g Paquete 6un','Gloria','SixPackLata',1,NULL,'CAT001','20456789012'),('5433453544534','Producto 3','Gloria','SixPackLata',1,NULL,'CAT001','20456789012');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `proveedor_id` varchar(15) NOT NULL,
  `nombre_prov` varchar(50) NOT NULL,
  `contacto_prov` varchar(50) DEFAULT NULL,
  `telefono_prov` varchar(15) NOT NULL,
  `direccion_prov` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('20123456789','Nestlé','Ana Lopez Taipe','976543210','Av. Nutricion 77'),('20345678901','Alicorp','Jose Torres Peralta','956789012','Av. Progreso 100'),('20456789012','Gloria S.A.','Carlos Ramirez Moscoso','945678901','Carretera Central Km. 9'),('20567890123','Backus','Lucia Fernandez Huaman','987654321','Av. Cerveza 33'),('20654321098','Laive','Pedro Gonzales Guevara','965432109','Jr. Ganaderos 50');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuario_id` varchar(15) NOT NULL,
  `nombre_us` varchar(50) NOT NULL,
  `apellido1_us` varchar(50) NOT NULL,
  `apellido2_us` varchar(50) DEFAULT NULL,
  `telefono_us` varchar(15) DEFAULT NULL,
  `genero_us` varchar(1) NOT NULL,
  `imagen_us` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('11223344','Jean','Aquino',NULL,NULL,'M',NULL),('12345678','Juan Pedro','Perez','Garcia',NULL,'M',NULL),('87654321','Maria Pilar','Mendoza',NULL,NULL,'F',NULL);
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

-- Dump completed on 2024-12-19 12:50:59
