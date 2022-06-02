/*
Navicat MySQL Data Transfer

Source Server         : 5isc11
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : autolavado

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2017-01-07 20:37:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auto
-- ----------------------------
DROP TABLE IF EXISTS `auto`;
CREATE TABLE `auto` (
  `Matricula` varchar(20) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `clave_emp` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `costos` int(11) NOT NULL,
  PRIMARY KEY (`Matricula`),
  KEY `idCliente` (`idCliente`),
  KEY `clave_emp` (`clave_emp`),
  KEY `idCategoria` (`idCategoria`),
  CONSTRAINT `auto_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `auto_ibfk_2` FOREIGN KEY (`clave_emp`) REFERENCES `empleado` (`clave_emp`),
  CONSTRAINT `auto_ibfk_3` FOREIGN KEY (`idCategoria`) REFERENCES `tipo` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auto
-- ----------------------------
INSERT INTO `auto` VALUES ('KAJJD', '7', '3', '2', '120');
INSERT INTO `auto` VALUES ('MKL-58', '1', '3', '3', '180');
INSERT INTO `auto` VALUES ('MKL-87', '6', '5', '1', '90');
INSERT INTO `auto` VALUES ('MNKL_78', '1', '1', '1', '90');
INSERT INTO `auto` VALUES ('MPKJ-41', '3', '4', '4', '220');
INSERT INTO `auto` VALUES ('ÑKJJH', '6', '5', '3', '200');
INSERT INTO `auto` VALUES ('OPR-794', '4', '5', '2', '120');
INSERT INTO `auto` VALUES ('YYR1', '5', '5', '3', '90');

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) NOT NULL,
  `APP` varchar(15) NOT NULL,
  `APM` varchar(15) NOT NULL,
  `Sexo` varchar(15) NOT NULL,
  `Edad` int(11) NOT NULL,
  `clave_emp` int(11) NOT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `clave_emp` (`clave_emp`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`clave_emp`) REFERENCES `empleado` (`clave_emp`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cliente
-- ----------------------------
INSERT INTO `cliente` VALUES ('1', 'RAUL', 'VENEGAS', 'PAREDES', 'M', '45', '1');
INSERT INTO `cliente` VALUES ('2', 'CARMEN', 'SALINAS', 'HUERTA', 'F', '40', '3');
INSERT INTO `cliente` VALUES ('3', 'DIANA', 'SOTO', 'GOMEZ', 'F', '24', '4');
INSERT INTO `cliente` VALUES ('4', 'ERNESTO', 'CASTILLO', 'CASTILLO', 'M', '22', '5');
INSERT INTO `cliente` VALUES ('5', 'JUAN', 'LOPEZ', 'LOPEZ', 'M', '25', '1');
INSERT INTO `cliente` VALUES ('6', 'JUANA', 'KARL', 'LOPES', 'F', '20', '5');
INSERT INTO `cliente` VALUES ('7', 'UUUUY', 'HH', 'HH', 'F', '98', '6');
INSERT INTO `cliente` VALUES ('8', 'KAREN', 'DOLORES', 'GUZMAN', 'F', '40', '3');

-- ----------------------------
-- Table structure for dueño
-- ----------------------------
DROP TABLE IF EXISTS `dueño`;
CREATE TABLE `dueño` (
  `idDueño` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) NOT NULL,
  `APP` varchar(15) NOT NULL,
  `APM` varchar(15) NOT NULL,
  `Sexo` varchar(2) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Ganancia` int(11) NOT NULL,
  PRIMARY KEY (`idDueño`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dueño
-- ----------------------------
INSERT INTO `dueño` VALUES ('1', 'KEVIN', 'RAMIREZ', 'FLORES', 'M', '25', '60');
INSERT INTO `dueño` VALUES ('2', 'MARCELA', 'FLORES', 'VASQUEZ', 'F', '33', '40');

-- ----------------------------
-- Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `clave_emp` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) NOT NULL,
  `APP` varchar(15) NOT NULL,
  `APM` varchar(15) NOT NULL,
  `Sexo` varchar(15) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Ganancia` int(11) DEFAULT NULL,
  `idDueño` int(11) NOT NULL,
  PRIMARY KEY (`clave_emp`),
  KEY `idDueño` (`idDueño`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idDueño`) REFERENCES `dueño` (`idDueño`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empleado
-- ----------------------------
INSERT INTO `empleado` VALUES ('1', 'GABRIELA', 'JUAREZ', 'VARGAS', 'F', '34', '0', '1');
INSERT INTO `empleado` VALUES ('3', 'ROBERTO', 'RODIGUEZ', 'RAMOS', 'M', '27', '0', '1');
INSERT INTO `empleado` VALUES ('4', 'MARCELA', 'MONTES', 'ALVA', 'F', '23', '0', '1');
INSERT INTO `empleado` VALUES ('5', 'JUAN', 'LOPEZ', 'LALVAN', 'M', '25', '0', '2');
INSERT INTO `empleado` VALUES ('6', 'LL', 'LL', 'LL', 'M', '45', '0', '2');

-- ----------------------------
-- Table structure for proceso
-- ----------------------------
DROP TABLE IF EXISTS `proceso`;
CREATE TABLE `proceso` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `Estado` varchar(15) NOT NULL,
  `clave_emp` int(11) NOT NULL,
  `Matricula` varchar(15) NOT NULL,
  PRIMARY KEY (`idEstado`),
  KEY `Matricula` (`Matricula`),
  CONSTRAINT `clave_emp` FOREIGN KEY (`idEstado`) REFERENCES `empleado` (`clave_emp`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `proceso_ibfk_1` FOREIGN KEY (`Matricula`) REFERENCES `auto` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of proceso
-- ----------------------------

-- ----------------------------
-- Table structure for tipo
-- ----------------------------
DROP TABLE IF EXISTS `tipo`;
CREATE TABLE `tipo` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(15) NOT NULL,
  `Costo` int(11) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tipo
-- ----------------------------
INSERT INTO `tipo` VALUES ('1', 'AUTO', '90');
INSERT INTO `tipo` VALUES ('2', 'CAMIONETA', '200');
INSERT INTO `tipo` VALUES ('3', 'CAMION', '180');
INSERT INTO `tipo` VALUES ('4', 'TRAILER', '220');

-- ----------------------------
-- View structure for gananciadueño
-- ----------------------------
DROP VIEW IF EXISTS `gananciadueño`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gananciadueño` AS select (sum(`auto`.`costos`) * 0.60) AS `gananciaTD` from `auto` ;

-- ----------------------------
-- View structure for ingresototal
-- ----------------------------
DROP VIEW IF EXISTS `ingresototal`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `ingresototal` AS SELECT SUM(costos) as TOTALD FROM auto ;

-- ----------------------------
-- View structure for total
-- ----------------------------
DROP VIEW IF EXISTS `total`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `total` AS SELECT (SUM(costos) * 0.40)/COUNT(idCliente) AS precio FROM auto ;

-- ----------------------------
-- View structure for totalganancia
-- ----------------------------
DROP VIEW IF EXISTS `totalganancia`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `totalganancia` AS SELECT SUM(costos) * 0.40 AS precioT FROM auto ;

-- ----------------------------
-- Procedure structure for addAutos
-- ----------------------------
DROP PROCEDURE IF EXISTS `addAutos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addAutos`(IN `ma` varchar(20),IN `ie` int,IN `ce` int,IN `ti` int,IN `cost` int)
BEGIN
	#Routine body goes here...
INSERT INTO auto(Matricula,idCliente,clave_emp,idCategoria,costos) VALUES (ma,ie,ce,ti,cost);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for addCli
-- ----------------------------
DROP PROCEDURE IF EXISTS `addCli`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCli`(IN `nomb` varchar(15),IN `app` varchar(15),IN `apm` varchar(15),IN `sexo` varchar(15),IN `edad` int,IN `clave` int)
BEGIN
	#Routine body goes here...
INSERT INTO cliente(Nombre,APP,APM,Sexo,Edad,clave_emp) VALUES (nomb,apm,app,sexo,edad,clave);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for addEmpleado
-- ----------------------------
DROP PROCEDURE IF EXISTS `addEmpleado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addEmpleado`(IN `c` int,IN `nom` varchar(20),IN `app` varchar(20),IN `apm` varchar(20),IN `sex` varchar(20),IN `eda` int,IN `du` int)
BEGIN
INSERT INTO empleado(clave_emp,Nombre,APP,APM,Sexo,Edad,idDueño) VALUES (c,nom,app,apm,sex,eda,du);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for borrar
-- ----------------------------
DROP PROCEDURE IF EXISTS `borrar`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar`(IN `nom` varchar(15))
BEGIN
DELETE FROM auto WHERE auto.Matricula=nom;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for borrarEMP
-- ----------------------------
DROP PROCEDURE IF EXISTS `borrarEMP`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarEMP`(IN `ma` int)
BEGIN
DELETE FROM empleado WHERE empleado.clave_emp=ma;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for cambiarda
-- ----------------------------
DROP PROCEDURE IF EXISTS `cambiarda`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cambiarda`(IN `m` varchar(20),IN `c` int,IN `e` int,IN `ca` int,IN `ma` varchar(20))
BEGIN
	UPDATE auto SET Matricula=m,idCliente=c,clave_emp=e,idCategoria=ca WHERE Matricula=ma;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for cambiarEm
-- ----------------------------
DROP PROCEDURE IF EXISTS `cambiarEm`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cambiarEm`(IN `cla` int,IN `nom` varchar(15),IN `ap` varchar(15),IN `ape` varchar(15),IN `sex` varchar(15),IN `ed` int,IN `camb` int)
BEGIN
UPDATE empleado SET clave_emp=cla, Nombre=nom, APP=ap, APM=ape, Sexo=sex, Edad=ed WHERE clave_emp=camb;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for cambioPrecio
-- ----------------------------
DROP PROCEDURE IF EXISTS `cambioPrecio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cambioPrecio`(IN `cos` int, IN `cat` varchar(15))
BEGIN
UPDATE tipo SET Costo=cos WHERE Categoria=cat;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for df
-- ----------------------------
DROP PROCEDURE IF EXISTS `df`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `df`()
BEGIN
DECLARE IDS INT;
DECLARE EMS INT;
DECLARE RESUL INT;
SELECT SUM(costos)*0.40 FROM auto
INTO IDS;
SELECT COUNT(clave_emp) FROM empleado
INTO EMS;
SET RESUL=IDS/EMS;
SELECT RESUL;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for EM
-- ----------------------------
DROP PROCEDURE IF EXISTS `EM`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EM`()
BEGIN
DECLARE IDS INT;
SELECT SUM(costos)*0.40 FROM auto
INTO IDS;

SELECT IDS;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for mostE
-- ----------------------------
DROP PROCEDURE IF EXISTS `mostE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostE`(IN `nom` varchar(15))
BEGIN
SELECT empleado.clave_emp, empleado.Nombre,empleado.APP,empleado.APM,empleado.Sexo,empleado.Edad 
FROM empleado 
WHERE Nombre=nom;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for mostrarEm
-- ----------------------------
DROP PROCEDURE IF EXISTS `mostrarEm`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarEm`()
BEGIN
	#Routine body goes here...
SELECT empleado.Nombre FROM empleado;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for precioD
-- ----------------------------
DROP PROCEDURE IF EXISTS `precioD`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `precioD`()
BEGIN
SELECT SUM(costos)*0.60  AS Total FROM auto;
END
;;
DELIMITER ;
