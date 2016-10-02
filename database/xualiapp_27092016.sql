-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.9-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para xualidb
DROP DATABASE IF EXISTS `xualidb`;
CREATE DATABASE IF NOT EXISTS `xualidb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `xualidb`;


-- Volcando estructura para tabla xualidb.actividad
DROP TABLE IF EXISTS `actividad`;
CREATE TABLE IF NOT EXISTS `actividad` (
  `CD_ACTIVIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `NM_ACTIVIDAD` varchar(150) NOT NULL,
  `DS_ACTIVIDAD` varchar(300) DEFAULT NULL,
  `AM_PUNTOS` int(11) DEFAULT NULL,
  PRIMARY KEY (`CD_ACTIVIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.actividad: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT IGNORE INTO `actividad` (`CD_ACTIVIDAD`, `NM_ACTIVIDAD`, `DS_ACTIVIDAD`, `AM_PUNTOS`) VALUES
	(1, 'HISTORIA', 'Reproducir historias', 10),
	(2, 'ASESORIA', 'Enviar preguntas al experto', 20),
	(3, 'EVENTOS', 'Consultar calendario de eventos', 2),
	(4, 'INICIAR SESION', 'Visitas a la aplicacion', 5);
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.audittrail
DROP TABLE IF EXISTS `audittrail`;
CREATE TABLE IF NOT EXISTS `audittrail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `script` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `table` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `keyvalue` longtext,
  `oldvalue` longtext,
  `newvalue` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.audittrail: ~58 rows (aproximadamente)
/*!40000 ALTER TABLE `audittrail` DISABLE KEYS */;
INSERT IGNORE INTO `audittrail` (`id`, `datetime`, `script`, `user`, `action`, `table`, `field`, `keyvalue`, `oldvalue`, `newvalue`) VALUES
	(1, '2016-09-25 16:51:38', '/xuali/login.php', 'kmartelo', 'login', '::1', '', '', '', ''),
	(2, '2016-09-25 16:51:41', '/xuali/logout.php', 'kmartelo', 'logout', '::1', '', '', '', ''),
	(3, '2016-09-25 17:03:01', '/xuali/login.php', 'kmartelo', 'login', '::1', '', '', '', ''),
	(4, '2016-09-25 17:03:48', '/xuali/logout.php', 'kmartelo', 'logout', '::1', '', '', '', ''),
	(5, '2016-09-25 17:03:50', '/xuali/login.php', 'kmartelo', 'login', '::1', '', '', '', ''),
	(6, '2016-09-25 17:17:18', '/xuali/logout.php', 'kmartelo', 'logout', '::1', '', '', '', ''),
	(7, '2016-09-25 17:17:20', '/xuali/login.php', 'kmartelo', 'login', '::1', '', '', '', ''),
	(8, '2016-09-25 17:22:38', '/xuali/logout.php', 'kmartelo', 'logout', '::1', '', '', '', ''),
	(9, '2016-09-25 17:22:39', '/xuali/login.php', 'kmartelo', 'login', '::1', '', '', '', ''),
	(10, '2016-09-25 17:23:25', '/xuali/logout.php', 'kmartelo', 'logout', '::1', '', '', '', ''),
	(11, '2016-09-25 17:23:27', '/xuali/login.php', 'kmartelo', 'login', '::1', '', '', '', ''),
	(12, '2016-09-25 17:26:43', '/xuali/logout.php', 'kmartelo', 'logout', '::1', '', '', '', ''),
	(13, '2016-09-25 17:26:45', '/xuali/login.php', 'kmartelo', 'login', '::1', '', '', '', ''),
	(14, '2016-09-25 17:28:27', '/xuali/logout.php', 'kmartelo', 'logout', '::1', '', '', '', ''),
	(15, '2016-09-25 17:28:32', '/xuali/login.php', 'admin', 'login', '::1', '', '', '', ''),
	(16, '2016-09-25 17:30:26', '/xuali/logout.php', 'Administrator', 'logout', '::1', '', '', '', ''),
	(17, '2016-09-25 17:30:44', '/xuali/login.php', 'kmartelo', 'login', '::1', '', '', '', ''),
	(18, '2016-09-25 17:52:52', '/xuali/logout.php', 'kmartelo', 'logout', '::1', '', '', '', ''),
	(19, '2016-09-25 17:53:09', '/xuali/login.php', 'pdiaz', 'login', '::1', '', '', '', ''),
	(20, '2016-09-25 17:53:12', '/xuali/logout.php', 'pdiaz', 'logout', '::1', '', '', '', ''),
	(21, '2016-09-25 17:53:28', '/xuali/login.php', 'kmartelo', 'login', '::1', '', '', '', ''),
	(22, '2016-09-25 17:57:00', '/xuali/logout.php', 'kmartelo', 'logout', '::1', '', '', '', ''),
	(23, '2016-09-25 17:57:25', '/xuali/login.php', 'pdiaz', 'login', '::1', '', '', '', ''),
	(24, '2016-09-25 17:57:28', '/xuali/logout.php', 'pdiaz', 'logout', '::1', '', '', '', ''),
	(25, '2016-09-25 17:57:31', '/xuali/login.php', 'pdiaz', 'login', '::1', '', '', '', ''),
	(26, '2016-09-25 17:57:32', '/xuali/logout.php', 'pdiaz', 'logout', '::1', '', '', '', ''),
	(27, '2016-09-25 17:57:46', '/xuali/login.php', 'admin', 'login', '::1', '', '', '', ''),
	(28, '2016-09-25 17:59:35', '/xuali/logout.php', 'Administrator', 'logout', '::1', '', '', '', ''),
	(29, '2016-09-25 17:59:46', '/xuali/login.php', 'pdiaz', 'login', '::1', '', '', '', ''),
	(30, '2016-09-25 18:08:57', '/xuali/logout.php', 'pdiaz', 'logout', '::1', '', '', '', ''),
	(31, '2016-09-25 18:09:05', '/xuali/login.php', 'kmartelo', 'login', '::1', '', '', '', ''),
	(32, '2016-09-25 18:10:00', '/xuali/logout.php', 'kmartelo', 'logout', '::1', '', '', '', ''),
	(33, '2016-09-25 18:10:05', '/xuali/login.php', 'admin', 'login', '::1', '', '', '', ''),
	(34, '2016-09-25 18:17:49', '/xuali/logout.php', 'Administrator', 'logout', '::1', '', '', '', ''),
	(35, '2016-09-25 18:17:56', '/xuali/login.php', 'jcastillo', 'login', '::1', '', '', '', ''),
	(36, '2016-09-25 18:18:00', '/xuali/logout.php', 'jcastillo', 'logout', '::1', '', '', '', ''),
	(37, '2016-09-25 18:18:22', '/xuali/login.php', 'pdiaz', 'login', '::1', '', '', '', ''),
	(38, '2016-09-25 18:26:20', '/xuali/logout.php', 'pdiaz', 'logout', '::1', '', '', '', ''),
	(39, '2016-09-25 18:26:30', '/xuali/login.php', 'pdiaz', 'login', '::1', '', '', '', ''),
	(40, '2016-09-25 18:26:44', '/xuali/logout.php', 'pdiaz', 'logout', '::1', '', '', '', ''),
	(41, '2016-09-25 18:26:46', '/xuali/login.php', 'pdiaz', 'login', '::1', '', '', '', ''),
	(42, '2016-09-25 18:26:50', '/xuali/logout.php', 'pdiaz', 'logout', '::1', '', '', '', ''),
	(43, '2016-09-25 18:36:10', '/xuali/login.php', 'admin', 'login', '::1', '', '', '', ''),
	(44, '2016-09-25 18:36:31', '/xuali/logout.php', 'Administrator', 'logout', '::1', '', '', '', ''),
	(45, '2016-09-25 18:37:36', '/xuali/login.php', 'admin', 'login', '::1', '', '', '', ''),
	(46, '2016-09-25 19:14:10', '/xuali/logout.php', 'Administrator', 'logout', '::1', '', '', '', ''),
	(47, '2016-09-25 19:14:41', '/xuali/login.php', 'kmartelo', 'login', '::1', '', '', '', ''),
	(48, '2016-09-26 01:34:09', '/xuali/logout.php', 'kmartelo', 'logout', '::1', '', '', '', ''),
	(49, '2016-09-26 01:34:15', '/xuali/login.php', 'admin', 'login', '::1', '', '', '', ''),
	(50, '2016-09-26 01:52:39', '/xuali/logout.php', 'Administrator', 'logout', '::1', '', '', '', ''),
	(51, '2016-09-26 01:55:33', '/xuali/login.php', 'pdiaz', 'login', '::1', '', '', '', ''),
	(52, '2016-09-26 22:06:01', '/xuali/login.php', 'kmartelo', 'login', '::1', '', '', '', ''),
	(53, '2016-09-26 22:06:05', '/xuali/logout.php', 'kmartelo', 'logout', '::1', '', '', '', ''),
	(54, '2016-09-26 22:20:46', '/xuali/login.php', 'pdiaz', 'login', '::1', '', '', '', ''),
	(55, '2016-09-26 22:39:59', '/xuali/logout.php', 'pdiaz', 'logout', '::1', '', '', '', ''),
	(56, '2016-09-26 22:58:22', '/xuali/login.php', 'kmartelo', 'login', '::1', '', '', '', ''),
	(57, '2016-09-26 22:58:24', '/xuali/logout.php', 'kmartelo', 'logout', '::1', '', '', '', ''),
	(58, '2016-09-26 23:17:58', '/xuali/login.php', 'kmartelo', 'login', '::1', '', '', '', ''),
	(59, '2016-09-27 02:33:36', '/xuali/logout.php', 'kmartelo', 'logout', '::1', '', '', '', ''),
	(60, '2016-09-27 02:57:31', '/xuali/login.php', 'kmartelo', 'login', '::1', '', '', '', ''),
	(61, '2016-09-27 03:19:58', '/xuali/logout.php', 'kmartelo', 'logout', '::1', '', '', '', '');
/*!40000 ALTER TABLE `audittrail` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.componente
DROP TABLE IF EXISTS `componente`;
CREATE TABLE IF NOT EXISTS `componente` (
  `ID_COMPONENTE` int(11) NOT NULL AUTO_INCREMENT,
  `DS_COMPONENTE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_COMPONENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.componente: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `componente` DISABLE KEYS */;
INSERT IGNORE INTO `componente` (`ID_COMPONENTE`, `DS_COMPONENTE`) VALUES
	(1, 'IDENTIDAD DE GENERO'),
	(2, 'COMPORTAMIENTOS CULTURALES DE GENERO'),
	(3, 'ORIENTACION SEXUAL');
/*!40000 ALTER TABLE `componente` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.empleado
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `ID_EMPLEADO` int(11) NOT NULL,
  `ID_ENTIDAD` int(11) NOT NULL,
  `CD_TIPO_DOCUMENTO` varchar(20) NOT NULL,
  `ID_DOCUMENTO` varchar(20) NOT NULL,
  `NOMBRE1` varchar(100) NOT NULL,
  `NOMBRE2` varchar(100) DEFAULT NULL,
  `APELLIDO1` varchar(100) NOT NULL,
  `APELLIDO2` varchar(100) DEFAULT NULL,
  `CD_ROL` int(11) NOT NULL COMMENT 'rol del empleado',
  `CD_ESTADO` int(11) NOT NULL COMMENT 'estado del empleado 1 ACTIVO 0 INACTIVO',
  `DT_ADDED` datetime NOT NULL,
  `ID_ADDED` int(11) NOT NULL,
  `NOMBRE_USUARIO` varchar(20) NOT NULL COMMENT 'nombre de usuario para acceso a la aplicacion (login)',
  `CONTRASENA_USUARIO` varchar(20) NOT NULL COMMENT 'contraseña de usuario para acceso a la aplicacion (login)',
  `EMAIL_EMPLEADO` varchar(30) NOT NULL COMMENT 'email corporativo del empleado',
  PRIMARY KEY (`ID_EMPLEADO`),
  KEY `EMPLEADO_ENTIDAD` (`ID_ENTIDAD`),
  KEY `EMPLEADO_ROL` (`CD_ROL`),
  CONSTRAINT `EMPLEADO_ENTIDAD` FOREIGN KEY (`ID_ENTIDAD`) REFERENCES `entidad` (`ID_ENTIDAD`),
  CONSTRAINT `EMPLEADO_ROL` FOREIGN KEY (`CD_ROL`) REFERENCES `rol` (`CD_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.empleado: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT IGNORE INTO `empleado` (`ID_EMPLEADO`, `ID_ENTIDAD`, `CD_TIPO_DOCUMENTO`, `ID_DOCUMENTO`, `NOMBRE1`, `NOMBRE2`, `APELLIDO1`, `APELLIDO2`, `CD_ROL`, `CD_ESTADO`, `DT_ADDED`, `ID_ADDED`, `NOMBRE_USUARIO`, `CONTRASENA_USUARIO`, `EMAIL_EMPLEADO`) VALUES
	(1, 1, 'CC', '45545924', 'KAREN', 'PAOLA', 'MARTELO', 'BELTRAN', -1, 1, '2016-01-01 00:00:00', 0, 'kmartelo', 'KarenMar2016*', 'kmartelo@gmail.com'),
	(2, 1, 'CC', '12345', 'PETER', NULL, 'DIAZ', NULL, 1, 0, '2016-01-01 00:00:00', 1, 'pdiaz', '2PX1W94rRfy7qmMx', 'pdiaz@gmai.com'),
	(3, 1, 'CC', '455459243', 'JULY', 'DAYANA', 'CASTILLO', 'CASTILLO', 2, 1, '0000-00-00 00:00:00', 0, 'jcastillo', '123456', 'july@gmail.com'),
	(4, 1, 'CC', '567890', 'KATTYA', NULL, 'DE ORO', NULL, -1, 1, '2016-01-01 00:00:00', 1, 'kdeoro', '2PX1W94rRfy7qmMx', 'kmartelo@gmail.com');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.entidad
DROP TABLE IF EXISTS `entidad`;
CREATE TABLE IF NOT EXISTS `entidad` (
  `ID_ENTIDAD` int(11) NOT NULL,
  `NM_ENTIDAD` varchar(150) NOT NULL,
  `DS_ENTIDAD` varchar(250) DEFAULT NULL,
  `DIRECCION` varchar(250) DEFAULT NULL,
  `URL_LOGO` varchar(250) DEFAULT NULL,
  `URL_PORTADA` varchar(250) DEFAULT NULL,
  `URL_WEBSITE` varchar(250) DEFAULT NULL,
  `CD_ESTADO` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID_ENTIDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Entidades';

-- Volcando datos para la tabla xualidb.entidad: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `entidad` DISABLE KEYS */;
INSERT IGNORE INTO `entidad` (`ID_ENTIDAD`, `NM_ENTIDAD`, `DS_ENTIDAD`, `DIRECCION`, `URL_LOGO`, `URL_PORTADA`, `URL_WEBSITE`, `CD_ESTADO`) VALUES
	(1, 'XUALI', '12345', 'CARTAGENA', NULL, NULL, NULL, '1'),
	(2, 'FUNDACION', '12344565', 'CARTAGENA', NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `entidad` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.historia
DROP TABLE IF EXISTS `historia`;
CREATE TABLE IF NOT EXISTS `historia` (
  `ID_HISTORIA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_COMPONENTE` int(11) DEFAULT NULL,
  `ID_TEMA` int(11) DEFAULT NULL,
  `CD_TYPE` varchar(20) DEFAULT NULL,
  `TITLE_HISTORIA` varchar(150) DEFAULT NULL,
  `DS_INTRO` varchar(250) DEFAULT NULL,
  `DS_HISTORIA` text,
  `URL_PORTADA` varchar(250) DEFAULT NULL,
  `URL_HISTORIA` varchar(250) DEFAULT NULL,
  `PUNTO_DECISION` int(11) DEFAULT NULL,
  `CD_ESTADO` int(1) DEFAULT NULL COMMENT '1 Activo 0 Inactivo',
  `ID_ENTIDAD` int(11) NOT NULL,
  PRIMARY KEY (`ID_HISTORIA`),
  KEY `HISTORIA_TEMA` (`ID_TEMA`),
  KEY `HISTORIA_ENTIDAD` (`ID_ENTIDAD`),
  CONSTRAINT `HISTORIA_ENTIDAD` FOREIGN KEY (`ID_ENTIDAD`) REFERENCES `entidad` (`ID_ENTIDAD`),
  CONSTRAINT `HISTORIA_TEMA` FOREIGN KEY (`ID_TEMA`) REFERENCES `tema` (`ID_TEMA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.historia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `historia` DISABLE KEYS */;
INSERT IGNORE INTO `historia` (`ID_HISTORIA`, `ID_COMPONENTE`, `ID_TEMA`, `CD_TYPE`, `TITLE_HISTORIA`, `DS_INTRO`, `DS_HISTORIA`, `URL_PORTADA`, `URL_HISTORIA`, `PUNTO_DECISION`, `CD_ESTADO`, `ID_ENTIDAD`) VALUES
	(1, 1, 1, 'normal', 'PRUEBA DE HISTORIA', 'JENIFER Y EL JOHN', 'ESTA ES UNA HISTORIA DE PRUEBAS', 'XualiRectanguloTransparente.png', 'VID_20160918_182417430.mp4', NULL, 1, 1);
/*!40000 ALTER TABLE `historia` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.nivel
DROP TABLE IF EXISTS `nivel`;
CREATE TABLE IF NOT EXISTS `nivel` (
  `CD_NIVEL` int(11) NOT NULL AUTO_INCREMENT,
  `NM_NIVEL` varchar(20) DEFAULT NULL,
  `DS_NIVEL` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CD_NIVEL`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.nivel: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT IGNORE INTO `nivel` (`CD_NIVEL`, `NM_NIVEL`, `DS_NIVEL`) VALUES
	(1, 'Básico', 'Nivel inicia por defecto sajdahasd'),
	(2, 'Intermedio', 'Nivel intermedio'),
	(3, 'Avanzado', 'Nivel Avanzado');
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.nivel_competencia
DROP TABLE IF EXISTS `nivel_competencia`;
CREATE TABLE IF NOT EXISTS `nivel_competencia` (
  `CD_NIVEL` int(11) NOT NULL,
  `ID_COMPETENCIA` int(11) NOT NULL,
  PRIMARY KEY (`CD_NIVEL`,`ID_COMPETENCIA`),
  KEY `NIVEL_COMP_COMPETENCIA` (`ID_COMPETENCIA`),
  CONSTRAINT `NIVEL_COMP_COMPETENCIAS` FOREIGN KEY (`ID_COMPETENCIA`) REFERENCES `tema` (`ID_TEMA`),
  CONSTRAINT `NIVEL_COMP_NIVEL` FOREIGN KEY (`CD_NIVEL`) REFERENCES `nivel` (`CD_NIVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.nivel_competencia: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `nivel_competencia` DISABLE KEYS */;
INSERT IGNORE INTO `nivel_competencia` (`CD_NIVEL`, `ID_COMPETENCIA`) VALUES
	(1, 1),
	(2, 2),
	(3, 3);
/*!40000 ALTER TABLE `nivel_competencia` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.pregunta
DROP TABLE IF EXISTS `pregunta`;
CREATE TABLE IF NOT EXISTS `pregunta` (
  `ID_PREGUNTA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `DS_TITULO` varchar(150) DEFAULT NULL,
  `DS_PREGUNTA` varchar(300) DEFAULT NULL,
  `DT_PREGUNTA` datetime DEFAULT NULL,
  `CD_ESTADO` int(1) NOT NULL COMMENT '1 Activo 0 Inactivo',
  `ID_ENTIDAD` int(11) NOT NULL,
  PRIMARY KEY (`ID_PREGUNTA`),
  KEY `PREGUNTA_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `PREGUNTA_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.pregunta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT IGNORE INTO `pregunta` (`ID_PREGUNTA`, `ID_USUARIO`, `DS_TITULO`, `DS_PREGUNTA`, `DT_PREGUNTA`, `CD_ESTADO`, `ID_ENTIDAD`) VALUES
	(1, 1, 'prueba', 'prueba', '2016-09-01 00:00:00', 1, 1);
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.punto_decision
DROP TABLE IF EXISTS `punto_decision`;
CREATE TABLE IF NOT EXISTS `punto_decision` (
  `ID_PUNTO_DECISION` int(11) NOT NULL AUTO_INCREMENT,
  `DS_DECISION` varchar(250) DEFAULT NULL,
  `ID_HISTORIA_1` int(11) DEFAULT NULL,
  `ID_HISTORIA_2` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_PUNTO_DECISION`),
  KEY `DECISION_HISTORIA1` (`ID_HISTORIA_1`),
  KEY `DECISION_HISTORIA2` (`ID_HISTORIA_2`),
  CONSTRAINT `DECISION_HISTORIA1` FOREIGN KEY (`ID_HISTORIA_1`) REFERENCES `historia` (`ID_HISTORIA`),
  CONSTRAINT `DECISION_HISTORIA2` FOREIGN KEY (`ID_HISTORIA_2`) REFERENCES `historia` (`ID_HISTORIA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.punto_decision: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `punto_decision` DISABLE KEYS */;
/*!40000 ALTER TABLE `punto_decision` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.respuesta
DROP TABLE IF EXISTS `respuesta`;
CREATE TABLE IF NOT EXISTS `respuesta` (
  `ID_RESPUESTA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PREGUNTA` int(11) DEFAULT NULL,
  `ID_EMPLEADO` int(11) DEFAULT NULL,
  `DS_RESPUESTA` varchar(500) DEFAULT NULL,
  `DT_RESPUESTA` datetime DEFAULT NULL,
  `CD_STADO` int(1) NOT NULL COMMENT '1 Activo 0 inactivo',
  `ID_ENTIDAD` int(11) NOT NULL,
  PRIMARY KEY (`ID_RESPUESTA`),
  KEY `RESPUESTA_EMPLEADO` (`ID_EMPLEADO`),
  KEY `RESPUESTA_PREGUNTA` (`ID_PREGUNTA`),
  KEY `RESPUESTA_ENTIDAD` (`ID_ENTIDAD`),
  CONSTRAINT `RESPUESTA_EMPLEADO` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`),
  CONSTRAINT `RESPUESTA_ENTIDAD` FOREIGN KEY (`ID_ENTIDAD`) REFERENCES `entidad` (`ID_ENTIDAD`),
  CONSTRAINT `RESPUESTA_PREGUNTA` FOREIGN KEY (`ID_PREGUNTA`) REFERENCES `pregunta` (`ID_PREGUNTA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.respuesta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
INSERT IGNORE INTO `respuesta` (`ID_RESPUESTA`, `ID_PREGUNTA`, `ID_EMPLEADO`, `DS_RESPUESTA`, `DT_RESPUESTA`, `CD_STADO`, `ID_ENTIDAD`) VALUES
	(1, 1, 1, 'planifica', '2016-09-26 01:45:38', 1, 1),
	(2, 1, 1, 'prueba de respyera', '2016-09-27 03:17:56', 1, 1);
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.rol
DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `CD_ROL` int(11) NOT NULL,
  `NM_ROL` varchar(100) NOT NULL,
  PRIMARY KEY (`CD_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.rol: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT IGNORE INTO `rol` (`CD_ROL`, `NM_ROL`) VALUES
	(-2, 'Anonymous'),
	(-1, 'Administrator'),
	(1, 'GESTOR'),
	(2, 'ASESOR');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.tema
DROP TABLE IF EXISTS `tema`;
CREATE TABLE IF NOT EXISTS `tema` (
  `ID_TEMA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_COMPONENTE` int(11) DEFAULT NULL,
  `DS_TEMA` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_TEMA`),
  KEY `COMPETENCIA_COMPONENTE` (`ID_COMPONENTE`),
  CONSTRAINT `COMPETENCIAS_COMPONENTES` FOREIGN KEY (`ID_COMPONENTE`) REFERENCES `componente` (`ID_COMPONENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.tema: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
INSERT IGNORE INTO `tema` (`ID_TEMA`, `ID_COMPONENTE`, `DS_TEMA`) VALUES
	(1, 1, 'RECONOCIMIENTO DE LA DIGNIDAD'),
	(2, 1, 'PLURALIDAD DE LA DIGNIDAD'),
	(3, 1, 'VALORACIÓN DE SI MISMO'),
	(4, 1, 'DESARROLLO DEL JUICIO MORAL'),
	(5, 1, 'PROYECTO DE VIDA'),
	(6, 1, 'LIBRE DESARROLLO DE LA PERSONALIDA'),
	(7, 1, 'IDENTIDAD Y SEXUALIDAD'),
	(8, 1, 'DERECHO A LA INFORMACION'),
	(9, 2, 'CULTURA Y COMPORTAMIENTO DEL GENERO'),
	(10, 2, 'ANALISIS CRITICO DE LOS COMPORTAMIENTOS GENERALES DEL GENERO'),
	(11, 2, 'FLEXIBILIDAD EN LOS COMPORTAMIENTOS GENERALES DE GENERO'),
	(12, 2, 'EQUIDAD DE GENERO'),
	(13, 3, 'ORIENTACION SEXO-EROTICA AFECTIVA'),
	(14, 3, 'DERECHO A LA LIBERTAD DE ELECCION Y RESPETO A LAS DIFERENCIAS'),
	(15, 3, 'VALORACION DE LA DIVERSIDAD'),
	(16, 3, 'CONSTRUCCION DE AMBIENTES DE RESPETO');
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.tipo_documento
DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `CD_TIPO_DOCUMENTO` varchar(20) NOT NULL,
  `NM_TIPO_DOCUMENTO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CD_TIPO_DOCUMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.tipo_documento: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
INSERT IGNORE INTO `tipo_documento` (`CD_TIPO_DOCUMENTO`, `NM_TIPO_DOCUMENTO`) VALUES
	('CC', 'CEDULA DE CIUDADANIA'),
	('CE', 'CEDULA DE EXTRANJERIA'),
	('PA', 'PASAPORTE'),
	('RC', 'REGISTRO CIVIL'),
	('TI', 'TARJETA DE IDENTIDAD');
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.userlevelpermissions
DROP TABLE IF EXISTS `userlevelpermissions`;
CREATE TABLE IF NOT EXISTS `userlevelpermissions` (
  `userlevelid` int(11) NOT NULL,
  `tablename` varchar(255) NOT NULL,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`userlevelid`,`tablename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.userlevelpermissions: ~87 rows (aproximadamente)
/*!40000 ALTER TABLE `userlevelpermissions` DISABLE KEYS */;
INSERT IGNORE INTO `userlevelpermissions` (`userlevelid`, `tablename`, `permission`) VALUES
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}actividad', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}audittrail', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}componente', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}empleado', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}entidad', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}historia', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}nivel', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}nivel_competencia', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}pregunta', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}punto_decision', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}respuesta', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}rol', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}tema', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}tipo_documento', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}userlevelpermissions', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}userlevels', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}usuario', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}usuario_actividad', 0),
	(-2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}usuario_entidad', 0),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}actividad', 0),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}audittrail', 0),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}componente', 0),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}empleado', 0),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}entidad', 0),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}historia', 1),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}nivel', 0),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}nivel_competencia', 0),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}pregunta', 1),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}punto_decision', 0),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}respuesta', 1),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}rol', 0),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}tema', 0),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}tipo_documento', 0),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}userlevelpermissions', 0),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}userlevels', 0),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}usuario', 1),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}usuario_actividad', 0),
	(-1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}usuario_entidad', 0),
	(0, '', 0),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}actividad', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}audittrail', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}componente', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}empleado', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}entidad', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}historia', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}nivel', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}nivel_competencia', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}pregunta', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}punto_decision', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}respuesta', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}rol', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}tema', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}tipo_documento', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}userlevelpermissions', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}userlevels', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}usuario', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}usuario_actividad', 1),
	(0, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}usuario_entidad', 1),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}actividad', 0),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}audittrail', 0),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}componente', 0),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}empleado', 111),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}entidad', 0),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}historia', 111),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}nivel', 0),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}nivel_competencia', 0),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}pregunta', 0),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}punto_decision', 0),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}respuesta', 0),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}rol', 0),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}tema', 0),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}tipo_documento', 0),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}userlevelpermissions', 0),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}userlevels', 0),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}usuario', 111),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}usuario_actividad', 0),
	(1, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}usuario_entidad', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}actividad', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}audittrail', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}componente', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}empleado', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}entidad', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}historia', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}nivel', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}nivel_competencia', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}pregunta', 110),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}punto_decision', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}respuesta', 111),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}rol', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}tema', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}tipo_documento', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}userlevelpermissions', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}userlevels', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}usuario', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}usuario_actividad', 0),
	(2, '{35144F27-436D-4E9C-923A-8CF201D9DD0C}usuario_entidad', 0);
/*!40000 ALTER TABLE `userlevelpermissions` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.userlevels
DROP TABLE IF EXISTS `userlevels`;
CREATE TABLE IF NOT EXISTS `userlevels` (
  `userlevelid` int(11) NOT NULL,
  `userlevelname` varchar(255) NOT NULL,
  PRIMARY KEY (`userlevelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.userlevels: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `userlevels` DISABLE KEYS */;
INSERT IGNORE INTO `userlevels` (`userlevelid`, `userlevelname`) VALUES
	(-2, 'Anonymous'),
	(-1, 'Administrator'),
	(0, 'Default'),
	(3, 'Gestor');
/*!40000 ALTER TABLE `userlevels` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `CD_TIPO_DOCUMENTO` varchar(20) NOT NULL,
  `ID_DOCUMENTO` varchar(20) NOT NULL,
  `NOMBRE1` varchar(100) NOT NULL,
  `NOMBRE2` varchar(100) DEFAULT NULL,
  `APELLIDO1` varchar(100) NOT NULL,
  `APELLIDO2` varchar(100) DEFAULT NULL,
  `DS_EMAIL` varchar(150) NOT NULL,
  `DT_NACIMIENTO` date NOT NULL,
  `URL_FACEBOOK` varchar(300) DEFAULT NULL,
  `URL_TWITTER` varchar(300) DEFAULT NULL,
  `CD_ESTADO` int(11) NOT NULL COMMENT '1 Activo 0 inactivo',
  `CONTRASENA_USUARIO` varchar(20) NOT NULL,
  `ID_ENTIDAD` int(11) NOT NULL,
  `CD_NIVEL` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_USUARIO`),
  KEY `USUARIO_ENTIDAD` (`ID_ENTIDAD`),
  CONSTRAINT `USUARIO_ENTIDAD` FOREIGN KEY (`ID_ENTIDAD`) REFERENCES `entidad` (`ID_ENTIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT IGNORE INTO `usuario` (`ID_USUARIO`, `CD_TIPO_DOCUMENTO`, `ID_DOCUMENTO`, `NOMBRE1`, `NOMBRE2`, `APELLIDO1`, `APELLIDO2`, `DS_EMAIL`, `DT_NACIMIENTO`, `URL_FACEBOOK`, `URL_TWITTER`, `CD_ESTADO`, `CONTRASENA_USUARIO`, `ID_ENTIDAD`, `CD_NIVEL`) VALUES
	(1, 'CC', '345678', 'JUAN', NULL, 'PEREZ', NULL, 'kmartelo@gmail.com', '2016-01-01', NULL, NULL, 1, '123456', 1, 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.usuario_actividad
DROP TABLE IF EXISTS `usuario_actividad`;
CREATE TABLE IF NOT EXISTS `usuario_actividad` (
  `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `CD_ACTIVIDAD` int(11) NOT NULL,
  `DT_ACTIVIDAD` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `AM_PUNTOS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`,`CD_ACTIVIDAD`,`DT_ACTIVIDAD`),
  KEY `USUARIO_ACT_ACTIVIDAD` (`CD_ACTIVIDAD`),
  CONSTRAINT `USUARIO_ACT_ACTIVIDAD` FOREIGN KEY (`CD_ACTIVIDAD`) REFERENCES `actividad` (`CD_ACTIVIDAD`),
  CONSTRAINT `USUARIO_ACT_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.usuario_actividad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_actividad` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.usuario_entidad
DROP TABLE IF EXISTS `usuario_entidad`;
CREATE TABLE IF NOT EXISTS `usuario_entidad` (
  `ID_ENTIDAD` int(11) NOT NULL DEFAULT '0',
  `CD_TIPO_DOCUMENTO` varchar(20) NOT NULL DEFAULT '',
  `ID_DOCUMENTO` int(11) NOT NULL DEFAULT '0',
  `NOMBRE1` varchar(100) DEFAULT NULL,
  `NOMBRE2` varchar(100) DEFAULT NULL,
  `APELLIDO1` varchar(100) DEFAULT NULL,
  `APELLIDO2` varchar(100) DEFAULT NULL,
  `DT_NACIMIENTO` date DEFAULT NULL,
  `DT_ADDED` date DEFAULT NULL,
  `ID_EMPLEADO` int(11) DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `CD_ESTADO` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID_ENTIDAD`,`CD_TIPO_DOCUMENTO`,`ID_DOCUMENTO`),
  KEY `USU_ENTIDAD_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `USU_ENTIDAD_ENTIDAD` FOREIGN KEY (`ID_ENTIDAD`) REFERENCES `entidad` (`ID_ENTIDAD`),
  CONSTRAINT `USU_ENTIDAD_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.usuario_entidad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_entidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_entidad` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
