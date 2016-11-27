-- --------------------------------------------------------
-- Host:                         192.168.33.10
-- Versión del servidor:         5.6.34 - MySQL Community Server (GPL)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para xualiapp_xualiapp
DROP DATABASE IF EXISTS `xualiapp_xualiapp`;
CREATE DATABASE IF NOT EXISTS `xualiapp_xualiapp` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `xualiapp_xualiapp`;


-- Volcando estructura para tabla xualiapp_xualiapp.ACTIVIDAD
DROP TABLE IF EXISTS `ACTIVIDAD`;
CREATE TABLE IF NOT EXISTS `ACTIVIDAD` (
  `CD_ACTIVIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `NM_ACTIVIDAD` varchar(150) NOT NULL,
  `DS_ACTIVIDAD` varchar(300) DEFAULT NULL,
  `AM_PUNTOS` int(11) DEFAULT NULL,
  PRIMARY KEY (`CD_ACTIVIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.ACTIVIDAD: ~4 rows (aproximadamente)
DELETE FROM `ACTIVIDAD`;
/*!40000 ALTER TABLE `ACTIVIDAD` DISABLE KEYS */;
INSERT INTO `ACTIVIDAD` (`CD_ACTIVIDAD`, `NM_ACTIVIDAD`, `DS_ACTIVIDAD`, `AM_PUNTOS`) VALUES
	(1, 'HISTORIA', 'Reproducir historias', 10),
	(2, 'ASESORIA', 'Enviar preguntas al experto', 20),
	(3, 'EVENTOS', 'Consultar calendario de eventos', 2),
	(4, 'INICIAR SESION', 'Visitas a la aplicacion', 5);
/*!40000 ALTER TABLE `ACTIVIDAD` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.audittrail
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.audittrail: ~0 rows (aproximadamente)
DELETE FROM `audittrail`;
/*!40000 ALTER TABLE `audittrail` DISABLE KEYS */;
/*!40000 ALTER TABLE `audittrail` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.COMPONENTE
DROP TABLE IF EXISTS `COMPONENTE`;
CREATE TABLE IF NOT EXISTS `COMPONENTE` (
  `ID_COMPONENTE` int(11) NOT NULL AUTO_INCREMENT,
  `DS_COMPONENTE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_COMPONENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.COMPONENTE: ~3 rows (aproximadamente)
DELETE FROM `COMPONENTE`;
/*!40000 ALTER TABLE `COMPONENTE` DISABLE KEYS */;
INSERT INTO `COMPONENTE` (`ID_COMPONENTE`, `DS_COMPONENTE`) VALUES
	(1, 'IDENTIDAD DE GENERO'),
	(2, 'COMPORTAMIENTOS CULTURALES DE GENERO'),
	(3, 'ORIENTACION SEXUAL');
/*!40000 ALTER TABLE `COMPONENTE` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.EMPLEADO
DROP TABLE IF EXISTS `EMPLEADO`;
CREATE TABLE IF NOT EXISTS `EMPLEADO` (
  `ID_EMPLEADO` int(11) NOT NULL,
  `ID_ENTIDAD` int(11) NOT NULL,
  `CD_TIPO_DOCUMENTO` varchar(20) NOT NULL,
  `ID_DOCUMENTO` varchar(20) NOT NULL,
  `NOMBRE1` varchar(100) NOT NULL,
  `NOMBRE2` varchar(100) DEFAULT NULL,
  `APELLIDO1` varchar(100) NOT NULL,
  `APELLIDO2` varchar(100) DEFAULT NULL,
  `CD_ROL` int(11) NOT NULL COMMENT 'rol del empleado',
  `CD_ESTADO` int(1) NOT NULL COMMENT 'estado del empleado 1 ACTIVO 0 INACTIVO',
  `DT_ADDED` datetime NOT NULL,
  `ID_ADDED` int(11) NOT NULL,
  `NOMBRE_USUARIO` varchar(20) NOT NULL COMMENT 'nombre de usuario para acceso a la aplicacion (login)',
  `CONTRASENA_USUARIO` varchar(20) NOT NULL COMMENT 'contraseña de usuario para acceso a la aplicacion (login)',
  `EMAIL_EMPLEADO` varchar(30) NOT NULL COMMENT 'email corporativo del empleado',
  PRIMARY KEY (`ID_EMPLEADO`),
  KEY `EMPLEADO_ENTIDAD` (`ID_ENTIDAD`),
  KEY `EMPLEADO_ROL` (`CD_ROL`),
  CONSTRAINT `EMPLEADO_ENTIDAD` FOREIGN KEY (`ID_ENTIDAD`) REFERENCES `ENTIDAD` (`ID_ENTIDAD`),
  CONSTRAINT `EMPLEADO_ROL` FOREIGN KEY (`CD_ROL`) REFERENCES `ROL` (`CD_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.EMPLEADO: ~4 rows (aproximadamente)
DELETE FROM `EMPLEADO`;
/*!40000 ALTER TABLE `EMPLEADO` DISABLE KEYS */;
INSERT INTO `EMPLEADO` (`ID_EMPLEADO`, `ID_ENTIDAD`, `CD_TIPO_DOCUMENTO`, `ID_DOCUMENTO`, `NOMBRE1`, `NOMBRE2`, `APELLIDO1`, `APELLIDO2`, `CD_ROL`, `CD_ESTADO`, `DT_ADDED`, `ID_ADDED`, `NOMBRE_USUARIO`, `CONTRASENA_USUARIO`, `EMAIL_EMPLEADO`) VALUES
	(1, 1, 'CC', '45545924', 'KAREN', 'PAOLA', 'MARTELO', 'BELTRAN', -1, 1, '2016-01-01 00:00:00', 0, 'kmartelo', 'KarenMar2016*', 'kmartelo@gmail.com'),
	(2, 1, 'CC', '12345', 'PETER', NULL, 'DIAZ', NULL, 1, 0, '2016-01-01 00:00:00', 1, 'pdiaz', '2PX1W94rRfy7qmMx', 'pdiaz@gmai.com'),
	(3, 1, 'CC', '455459243', 'JULY', 'DAYANA', 'CASTILLO', 'CASTILLO', 2, 1, '0000-00-00 00:00:00', 0, 'jcastillo', '123456', 'july@gmail.com'),
	(4, 1, 'CC', '567890', 'KATTYA', NULL, 'DE ORO', NULL, -1, 1, '2016-01-01 00:00:00', 1, 'kdeoro', '2PX1W94rRfy7qmMx', 'kmartelo@gmail.com');
/*!40000 ALTER TABLE `EMPLEADO` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.ENTIDAD
DROP TABLE IF EXISTS `ENTIDAD`;
CREATE TABLE IF NOT EXISTS `ENTIDAD` (
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

-- Volcando datos para la tabla xualiapp_xualiapp.ENTIDAD: ~2 rows (aproximadamente)
DELETE FROM `ENTIDAD`;
/*!40000 ALTER TABLE `ENTIDAD` DISABLE KEYS */;
INSERT INTO `ENTIDAD` (`ID_ENTIDAD`, `NM_ENTIDAD`, `DS_ENTIDAD`, `DIRECCION`, `URL_LOGO`, `URL_PORTADA`, `URL_WEBSITE`, `CD_ESTADO`) VALUES
	(1, 'XUALI', '12345', 'CARTAGENA', NULL, NULL, NULL, '1'),
	(2, 'FUNDACION', '12344565', 'CARTAGENA', NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `ENTIDAD` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.HISTORIA
DROP TABLE IF EXISTS `HISTORIA`;
CREATE TABLE IF NOT EXISTS `HISTORIA` (
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
  CONSTRAINT `HISTORIA_ENTIDAD` FOREIGN KEY (`ID_ENTIDAD`) REFERENCES `ENTIDAD` (`ID_ENTIDAD`),
  CONSTRAINT `HISTORIA_TEMA` FOREIGN KEY (`ID_TEMA`) REFERENCES `TEMA` (`ID_TEMA`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.HISTORIA: ~3 rows (aproximadamente)
DELETE FROM `HISTORIA`;
/*!40000 ALTER TABLE `HISTORIA` DISABLE KEYS */;
INSERT INTO `HISTORIA` (`ID_HISTORIA`, `ID_COMPONENTE`, `ID_TEMA`, `CD_TYPE`, `TITLE_HISTORIA`, `DS_INTRO`, `DS_HISTORIA`, `URL_PORTADA`, `URL_HISTORIA`, `PUNTO_DECISION`, `CD_ESTADO`, `ID_ENTIDAD`) VALUES
	(10, NULL, 1, 'PUBLICO', 'JENNIFER TIENE 20', 'Jennifer nos cuenta su historia, siendo una adolescente se dejó llevar por el amor que sentía por su novio John ...', 'Actualmente Jeninifer con 20 años tiene a su hijo Juan David de 3 años,  nos cuenta que a la edad que quedó embarazada no tenia mucha información acerca de sexualidad', 'jennifer.jpg', 'https://www.youtube.com/embed/CfZXTpczGpY', NULL, 1, 1),
	(11, NULL, 1, 'PUBLICO', 'MILDRE Y SU HIJO', 'Mildre encuentra preservativos en la ropa de su hijo, quieres saber como reacciona?', 'Mientras lavaba la ropa de su hijo, Mildre, madre costeña le reclama a su hijo, no esperando la respuesta que el le dio.', 'mildre.jpg', 'https://www.youtube.com/embed/G-nj5mR1hT0', NULL, 1, 1),
	(12, NULL, 1, 'PUBLICO', 'ANA Y SU PLAN DE VIDA', 'Cuando Ana de 15 años se entera que está embarazada corre a contarle a su novio Andrés, no pensando que el, le daría la espalda', 'Ana no tuvo un final feliz, esta historia contada por sus padres nos conmueve...', 'ana.jpg', 'https://www.youtube.com/embed/In0NAov8vFg', NULL, 1, 1);
/*!40000 ALTER TABLE `HISTORIA` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.NIVEL
DROP TABLE IF EXISTS `NIVEL`;
CREATE TABLE IF NOT EXISTS `NIVEL` (
  `CD_NIVEL` int(11) NOT NULL AUTO_INCREMENT,
  `NM_NIVEL` varchar(20) DEFAULT NULL,
  `DS_NIVEL` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CD_NIVEL`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.NIVEL: ~3 rows (aproximadamente)
DELETE FROM `NIVEL`;
/*!40000 ALTER TABLE `NIVEL` DISABLE KEYS */;
INSERT INTO `NIVEL` (`CD_NIVEL`, `NM_NIVEL`, `DS_NIVEL`) VALUES
	(1, 'B?sico', 'Nivel inicia por defecto sajdahasd'),
	(2, 'Intermedio', 'Nivel intermedio'),
	(3, 'Avanzado', 'Nivel Avanzado');
/*!40000 ALTER TABLE `NIVEL` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.NIVEL_COMPETENCIA
DROP TABLE IF EXISTS `NIVEL_COMPETENCIA`;
CREATE TABLE IF NOT EXISTS `NIVEL_COMPETENCIA` (
  `CD_NIVEL` int(11) NOT NULL,
  `ID_COMPETENCIA` int(11) NOT NULL,
  PRIMARY KEY (`CD_NIVEL`,`ID_COMPETENCIA`),
  KEY `NIVEL_COMP_COMPETENCIA` (`ID_COMPETENCIA`),
  CONSTRAINT `NIVEL_COMP_COMPETENCIA` FOREIGN KEY (`ID_COMPETENCIA`) REFERENCES `TEMA` (`ID_TEMA`),
  CONSTRAINT `NIVEL_COMP_NIVEL` FOREIGN KEY (`CD_NIVEL`) REFERENCES `NIVEL` (`CD_NIVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.NIVEL_COMPETENCIA: ~3 rows (aproximadamente)
DELETE FROM `NIVEL_COMPETENCIA`;
/*!40000 ALTER TABLE `NIVEL_COMPETENCIA` DISABLE KEYS */;
INSERT INTO `NIVEL_COMPETENCIA` (`CD_NIVEL`, `ID_COMPETENCIA`) VALUES
	(1, 1),
	(2, 2),
	(3, 3);
/*!40000 ALTER TABLE `NIVEL_COMPETENCIA` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.PREGUNTA
DROP TABLE IF EXISTS `PREGUNTA`;
CREATE TABLE IF NOT EXISTS `PREGUNTA` (
  `ID_PREGUNTA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `DS_TITULO` varchar(150) DEFAULT NULL,
  `DS_PREGUNTA` varchar(300) DEFAULT NULL,
  `DT_PREGUNTA` datetime DEFAULT NULL,
  `CD_ESTADO` int(1) NOT NULL COMMENT '1 Activo 0 Inactivo',
  `ID_ENTIDAD` int(11) NOT NULL,
  PRIMARY KEY (`ID_PREGUNTA`),
  KEY `PREGUNTA_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `PREGUNTA_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `USUARIO` (`ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.PREGUNTA: ~14 rows (aproximadamente)
DELETE FROM `PREGUNTA`;
/*!40000 ALTER TABLE `PREGUNTA` DISABLE KEYS */;
INSERT INTO `PREGUNTA` (`ID_PREGUNTA`, `ID_USUARIO`, `DS_TITULO`, `DS_PREGUNTA`, `DT_PREGUNTA`, `CD_ESTADO`, `ID_ENTIDAD`) VALUES
	(1, 10, 'Estar enamorado, ¿es bueno para la salud?', 'Me contaron  que enamorarse es bueno para la salud, pero no se si es cierto.', '2016-09-20 00:00:00', 0, 1),
	(2, 10, 'Latido del corazon', '¿Por qué nos late el corazón con más fuerza cuando estamos excitados o enamorados?', '2016-09-21 00:00:00', 0, 1),
	(3, 10, '¿Pueden las mujeres ser impotentes?', 'Una amiga me conto que era impotente, pero no estoy seguro si esto es posible.', '2016-09-22 00:00:00', 0, 1),
	(4, 10, '¿Qué pasa si se rompe el preservativo?', 'Durante la relacion sexual que puede pasar si se rompe el preservativo?', '2016-09-22 00:00:00', 0, 1),
	(5, 10, 'Dos condones son mas seguros?', '¿Si te pones dos condones es más seguro?', '0920-09-23 06:00:00', 0, 1),
	(8, 11, 'Puede una niña de 13 quedar embarazada', 'Quiero saber si una niña de 13 años puede quedar embarazada', '2016-10-15 16:41:31', 0, 1),
	(10, 68, 'A que edad se desarrollan los hombres', 'Quiero saber a que edad comienzan a desarrollarse los hombres', '2016-10-15 17:01:47', 0, 1),
	(11, 68, 'A que edad de desarrollan las niñas?', 'Quiero saber a que edad se desarrollan las mujeres', '2016-10-15 17:11:46', 0, 1),
	(12, 77, 'Que pasa cuando las niñas tienen su primer período', 'Que pasa cuando las niñas tienen su primer período', '2016-10-17 20:11:18', 0, 1),
	(13, 15, 'Prueba', 'Prueba', '2016-11-16 05:45:04', 0, 1),
	(14, 15, 'Prueba', 'Prueba', '2016-11-16 05:45:04', 0, 1),
	(15, 15, 'Prueba', 'Prueba', '2016-11-16 05:45:04', 0, 1),
	(16, 15, 'Prueba', 'Prueba', '2016-11-16 05:45:05', 0, 1),
	(17, 15, 'Prueba', 'Prueba', '2016-11-16 05:45:06', 0, 1);
/*!40000 ALTER TABLE `PREGUNTA` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.PUNTO_DECISION
DROP TABLE IF EXISTS `PUNTO_DECISION`;
CREATE TABLE IF NOT EXISTS `PUNTO_DECISION` (
  `ID_PUNTO_DECISION` int(11) NOT NULL AUTO_INCREMENT,
  `DS_DECISION` varchar(250) DEFAULT NULL,
  `ID_HISTORIA_1` int(11) DEFAULT NULL,
  `ID_HISTORIA_2` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_PUNTO_DECISION`),
  KEY `DECISION_HISTORIA1` (`ID_HISTORIA_1`),
  KEY `DECISION_HISTORIA2` (`ID_HISTORIA_2`),
  CONSTRAINT `DECISION_HISTORIA1` FOREIGN KEY (`ID_HISTORIA_1`) REFERENCES `HISTORIA` (`ID_HISTORIA`),
  CONSTRAINT `DECISION_HISTORIA2` FOREIGN KEY (`ID_HISTORIA_2`) REFERENCES `HISTORIA` (`ID_HISTORIA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.PUNTO_DECISION: ~0 rows (aproximadamente)
DELETE FROM `PUNTO_DECISION`;
/*!40000 ALTER TABLE `PUNTO_DECISION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PUNTO_DECISION` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.RESPUESTA
DROP TABLE IF EXISTS `RESPUESTA`;
CREATE TABLE IF NOT EXISTS `RESPUESTA` (
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
  CONSTRAINT `RESPUESTA_EMPLEADO` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `EMPLEADO` (`ID_EMPLEADO`),
  CONSTRAINT `RESPUESTA_ENTIDAD` FOREIGN KEY (`ID_ENTIDAD`) REFERENCES `ENTIDAD` (`ID_ENTIDAD`),
  CONSTRAINT `RESPUESTA_PREGUNTA` FOREIGN KEY (`ID_PREGUNTA`) REFERENCES `PREGUNTA` (`ID_PREGUNTA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.RESPUESTA: ~5 rows (aproximadamente)
DELETE FROM `RESPUESTA`;
/*!40000 ALTER TABLE `RESPUESTA` DISABLE KEYS */;
INSERT INTO `RESPUESTA` (`ID_RESPUESTA`, `ID_PREGUNTA`, `ID_EMPLEADO`, `DS_RESPUESTA`, `DT_RESPUESTA`, `CD_STADO`, `ID_ENTIDAD`) VALUES
	(1, 1, 2, 'Sí. Es un punto en el que coinciden de forma unánime los especialistas: las relaciones de pareja cariñosas favorecen la salud.', '2016-09-22 00:00:00', 0, 1),
	(2, 2, 2, 'Este mecanismo es muy similar al que sentimos cuando nos invade el miedo: corazón desbocado, rodillas con flojera, sensación de irritabilidad muy característica en la boca de nuestro estómago. Todo esto depende de nuestro sistema nervioso vegetativo, que es el que rige las funciones corporales que no dependen de nuestra voluntad, como es el ritmo y la intensidad del ritmo cardíaco.', '2016-09-23 00:00:00', 0, 1),
	(3, 3, 2, 'No. Existe una dificultad similar en las mujeres: la falta de turgencia del clítoris, aunque esto no impide, como en el caso de la disfunción eréctil, la participación pasiva en el coito, pero sí dificulta la obtención del placer sexual.', '2016-09-26 00:00:00', 0, 1),
	(4, 4, 2, 'En ocasiones el preservativo se rompe. el motivo de la ruptua muchas veces es o porque no se colocó correctamente o porque el preservativo estaba en mal estado. Sin embargo, sea el motivo que sea, una vez que se rompa el preservativo existe riesgo de embarazo.', '2016-09-26 00:00:00', 0, 1),
	(5, 5, 2, 'No, todo lo contrario. La colocación de dos preservativos puede ocasionar su ruptura por el roce. Lo corresto es usar uno y colocarlo correctamente', '2016-09-27 00:00:00', 0, 1);
/*!40000 ALTER TABLE `RESPUESTA` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.ROL
DROP TABLE IF EXISTS `ROL`;
CREATE TABLE IF NOT EXISTS `ROL` (
  `CD_ROL` int(11) NOT NULL,
  `NM_ROL` varchar(100) NOT NULL,
  PRIMARY KEY (`CD_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.ROL: ~4 rows (aproximadamente)
DELETE FROM `ROL`;
/*!40000 ALTER TABLE `ROL` DISABLE KEYS */;
INSERT INTO `ROL` (`CD_ROL`, `NM_ROL`) VALUES
	(-2, 'Anonymous'),
	(-1, 'Administrator'),
	(1, 'GESTOR'),
	(2, 'ASESOR');
/*!40000 ALTER TABLE `ROL` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.TEMA
DROP TABLE IF EXISTS `TEMA`;
CREATE TABLE IF NOT EXISTS `TEMA` (
  `ID_TEMA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_COMPONENTE` int(11) DEFAULT NULL,
  `DS_TEMA` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_TEMA`),
  KEY `COMPETENCIA_COMPONENTE` (`ID_COMPONENTE`),
  CONSTRAINT `COMPETENCIA_COMPONENTE` FOREIGN KEY (`ID_COMPONENTE`) REFERENCES `COMPONENTE` (`ID_COMPONENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.TEMA: ~16 rows (aproximadamente)
DELETE FROM `TEMA`;
/*!40000 ALTER TABLE `TEMA` DISABLE KEYS */;
INSERT INTO `TEMA` (`ID_TEMA`, `ID_COMPONENTE`, `DS_TEMA`) VALUES
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
/*!40000 ALTER TABLE `TEMA` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.TIPO_DOCUMENTO
DROP TABLE IF EXISTS `TIPO_DOCUMENTO`;
CREATE TABLE IF NOT EXISTS `TIPO_DOCUMENTO` (
  `CD_TIPO_DOCUMENTO` varchar(20) NOT NULL,
  `NM_TIPO_DOCUMENTO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CD_TIPO_DOCUMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.TIPO_DOCUMENTO: ~5 rows (aproximadamente)
DELETE FROM `TIPO_DOCUMENTO`;
/*!40000 ALTER TABLE `TIPO_DOCUMENTO` DISABLE KEYS */;
INSERT INTO `TIPO_DOCUMENTO` (`CD_TIPO_DOCUMENTO`, `NM_TIPO_DOCUMENTO`) VALUES
	('CC', 'CEDULA DE CIUDADANIA'),
	('CE', 'CEDULA DE EXTRANJERIA'),
	('PA', 'PASAPORTE'),
	('RC', 'REGISTRO CIVIL'),
	('TI', 'TARJETA DE IDENTIDAD');
/*!40000 ALTER TABLE `TIPO_DOCUMENTO` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.userlevelpermissions
DROP TABLE IF EXISTS `userlevelpermissions`;
CREATE TABLE IF NOT EXISTS `userlevelpermissions` (
  `userlevelid` int(11) NOT NULL,
  `tablename` varchar(255) NOT NULL,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`userlevelid`,`tablename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.userlevelpermissions: ~0 rows (aproximadamente)
DELETE FROM `userlevelpermissions`;
/*!40000 ALTER TABLE `userlevelpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userlevelpermissions` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.userlevels
DROP TABLE IF EXISTS `userlevels`;
CREATE TABLE IF NOT EXISTS `userlevels` (
  `userlevelid` int(11) NOT NULL,
  `userlevelname` varchar(255) NOT NULL,
  PRIMARY KEY (`userlevelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.userlevels: ~4 rows (aproximadamente)
DELETE FROM `userlevels`;
/*!40000 ALTER TABLE `userlevels` DISABLE KEYS */;
INSERT INTO `userlevels` (`userlevelid`, `userlevelname`) VALUES
	(-2, 'Anonymous'),
	(-1, 'Administrator'),
	(0, 'Default'),
	(3, 'Gestor');
/*!40000 ALTER TABLE `userlevels` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.USUARIO
DROP TABLE IF EXISTS `USUARIO`;
CREATE TABLE IF NOT EXISTS `USUARIO` (
  `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `CD_TIPO_DOCUMENTO` varchar(20) NOT NULL,
  `ID_DOCUMENTO` varchar(20) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `DS_EMAIL` varchar(150) NOT NULL,
  `DS_PASSWORD` varchar(150) NOT NULL,
  `DT_NACIMIENTO` date DEFAULT NULL,
  `URL_FACEBOOK` varchar(300) DEFAULT NULL,
  `URL_TWITTER` varchar(300) DEFAULT NULL,
  `CD_ESTADO` int(1) NOT NULL DEFAULT '1' COMMENT '1 Activo 0 inactivo',
  `ID_ENTIDAD` int(11) NOT NULL DEFAULT '1',
  `CD_NIVEL` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_USUARIO`),
  KEY `USUARIO_ENTIDAD` (`ID_ENTIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.USUARIO: ~82 rows (aproximadamente)
DELETE FROM `USUARIO`;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
INSERT INTO `USUARIO` (`ID_USUARIO`, `CD_TIPO_DOCUMENTO`, `ID_DOCUMENTO`, `NOMBRE`, `DS_EMAIL`, `DS_PASSWORD`, `DT_NACIMIENTO`, `URL_FACEBOOK`, `URL_TWITTER`, `CD_ESTADO`, `ID_ENTIDAD`, `CD_NIVEL`) VALUES
	(10, 'TI', '84020612345', 'Jhon Daniels', 'pjdisar@hotmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1),
	(11, 'TI', '84020656789', 'Carlos Marx', 'carlosmarx@hotmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1),
	(12, 'TI', '84020656789', 'Carlos Marx', 'florindameza@hotmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1),
	(13, 'TI', '84020656789', 'Carlos Marx', 'otroemail@hotmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1),
	(14, 'TI', '84020656789', 'Carlos Marx', 'miemail@hotmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1),
	(15, 'TI', '123456', 'John', 'mario@gmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1),
	(16, 'TI', '123456', 'John', 'mario2@gmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1),
	(17, 'TI', '85154127', 'Ana Smith', 'anasmith@gmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1),
	(18, 'TI', '85154127', 'Ana Jordan', 'anajordan@gmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1),
	(19, 'TI', '85154127', 'Ana Jordan', 'anajordan15@gmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1),
	(20, 'TI', '12345', 'Ana Jordan', 'anajordan54@gmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1),
	(21, 'TI', '12345', 'Ana Jordan', 'anajordan5@gmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1),
	(22, 'TI', '65122154', 'John Carter', 'jhonc@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(23, 'TI', '3131254', 'diana lean', 'diana@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(24, 'TI', '1456461', 'ricardo', 'ricardo@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(25, 'TI', '64212', 'camila suarez', 'camila@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(26, 'TI', '64212', 'camila suarez', 'camila2@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(27, 'TI', '64212', 'camila suarez', 'camila21@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(28, 'TI', '64212', 'camila suarez', 'camila22@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(29, 'TI', '64212', 'camila suarez', 'camila24@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(30, 'TI', '64212', 'camila suarez', 'camila25@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(31, 'TI', '64564', 'Jhon marx', 'johnm@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(32, 'TI', '64564', 'Jhon marx', 'johnmarx@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(33, 'TI', '3164', 'manuel guillet', 'mgui@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(34, 'TI', '84020656789', 'Carlos Marx', 'miemail2@hotmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1),
	(35, 'TI', '3164', 'manuel guillet', 'mguill@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(36, 'TI', '3164', 'manuel guillet', 'mguille@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(37, 'TI', '32311', 'Manuel', 'man@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(38, 'TI', '32311', 'Manuel', 'man12@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(39, 'TI', '64634', 'Jhon Doe', 'jhond@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(40, 'TI', '64634', 'Jhon Doe', 'jhondoe@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(41, 'CC', '3132101', 'Karen Martelo', 'kmartelo@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(42, 'Cédula', '45548866', 'July Dayana', 'Julycastillo83@gmail.com', 'Judacas45548', NULL, NULL, NULL, 1, 1, 1),
	(43, 'Cédula de Ciudadanía', '52906398', 'Kattya De Oro Genes', 'kdeoro@gmail.com', 'Cartagena2016', NULL, NULL, NULL, 1, 1, 1),
	(44, 'Cc', '1047381738', 'Pedro', 'sawy0007@gmail.com', 'ndradeguerrero', NULL, NULL, NULL, 1, 1, 1),
	(45, 'TI', '12345', 'Peter Diaz', 'pjdisar@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(46, 'TI', '85154', 'Jhan Carlos', 'jhancarlos@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(47, ' cedula', '1143378980', 'julio jose prieto berthel', 'elenprendedor@hotmail.com', '123456789j', NULL, NULL, NULL, 1, 1, 1),
	(48, 'TI', '9812', 'Daduis', 'daoking69@gmail.com', '981201', NULL, NULL, NULL, 1, 1, 1),
	(49, 'TI', '9812', 'Daduis', 'daoking69@gmail.com', '981201', NULL, NULL, NULL, 1, 1, 1),
	(50, 'TI', '12345', 'Jean Paul Sartre', 'Jeanpaul@gmail.com', 'clabe123', NULL, NULL, NULL, 1, 1, 1),
	(51, 'Ti', '12345', 'Jean Paul', 'Jeanpual@hotmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(52, 'TI', '987654', 'frank kafka', 'kafka@gmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1),
	(53, 'TI', '561311', 'ana smith', 'anasmith@hotmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(54, 'TI', '564145', 'jhondiaz', 'jhondiaz@hotmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(55, 'TI', '62141001', 'angel', 'angel@hotmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(56, 'TI', '53024420', 'Shakira Mebarak', 'shakira@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(57, 'TI', '2484721', 'Juan Esteban Garcia', 'Juanes@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(58, 'TI', '44534101', 'Alex Rovira', 'alex@hotmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(59, 'CC', '123', 'karen', 'xualiapp@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(60, 'CC', '123', 'karen', 'xualiapp@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(61, 'CC', '123', 'karen', 'xualiapp@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(62, 'CC', '123', 'karen', 'xualiapp@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(63, 'cc', '123455', 'karen', 'km@hormail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(64, 'CC', '1234', 'karen', 'kkk@gmail.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(65, 'CC', '123', 'karen', 'km@hotm.com', '123', NULL, NULL, NULL, 1, 1, 1),
	(66, 'Cédula ciudadanía ', '1143344711', 'Jorge Luis ', 'thebigboss-09@hotmail.com', '900809', NULL, NULL, NULL, 1, 1, 1),
	(67, 'Cédula ciudadanía ', '1143344711', 'Jorge Luis ', 'thebigboss-09@hotmail.com', '900809', NULL, NULL, NULL, 1, 1, 1),
	(68, 'TI', '54321324', 'Carlos Darwin', 'carlosdarwin@hotmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1),
	(69, 'TI', '1', 'sdf', 'pjdisar10@hotmail.com', 'aaaa', NULL, NULL, NULL, 1, 1, 1),
	(70, 'TI', '2134', 'Chayanne', 'chayann@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(71, 'TI', '132451', 'Ignacio Fontalvo', 'ignacio@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(72, 'TI', '213212', 'Peter', 'pjsystem@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(73, 'TI', '', 'Peter', 'pjsystem11@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(74, 'TI', '123', 'Peter', 'pjsystem12@gmail.com', 'clave', NULL, NULL, NULL, 1, 1, 1),
	(75, 'CC', '1143334559', 'Kate pas', 'katepas18@hotmail.com', 'mono20', NULL, NULL, NULL, 1, 1, 1),
	(76, 'TI', '123456', 'Karen Paola', 'karen@gmail.com', '1234', NULL, NULL, NULL, 1, 1, 1),
	(77, 'TI', '123456', 'Karen Paola', 'karen@gmail.com', '1234', NULL, NULL, NULL, 1, 1, 1),
	(78, 'CC', '1143398352', 'Jonathan Cantillo', 'jccantillog@gmail.com', 'jajaja1234', NULL, NULL, NULL, 1, 1, 1),
	(79, 'CC', '10299765', 'Juan manuel', 'juanmasuarezt@gmail.com', '1234567890', NULL, NULL, NULL, 1, 1, 1),
	(80, 'CC', '73208654', 'CARLOS BUENO', 'buenogutierrez@gmail.com', 'c4rt4g3n4', NULL, NULL, NULL, 1, 1, 1),
	(81, 'CC', '10299765', 'Juan manuel suarez', 'juanmasuarezt@hotmail.com', 'XualiIntro8cad', NULL, NULL, NULL, 1, 1, 1),
	(82, 'CC', '10299765', 'Juan manuel suarez', 'juanmasuarez1@gmail.com', 'XualiIntro8cad', NULL, NULL, NULL, 1, 1, 1),
	(83, 'CC', '18009177', 'julian Patrick manrique mclean', 'jpmanriquemclean@hotmail.com', 'patrick', NULL, NULL, NULL, 1, 1, 1),
	(84, 'CC', '73181977', 'Michel de Oro', 'micheldeoro@gmail.com', 'bpogra12', NULL, NULL, NULL, 1, 1, 1),
	(85, 'CC', '104945383', 'Ivan Villamil', '8avilla@gmail.com', 'Amaranto1', NULL, NULL, NULL, 1, 1, 1),
	(86, 'CC', '104945383', 'Ivan Villamil', '8avilla@gmail.com', 'Amaranto1', NULL, NULL, NULL, 1, 1, 1),
	(87, 'CC', '111111', 'Juan', 'juan@juan.com', 'clave1', NULL, NULL, NULL, 1, 1, 1),
	(88, 'CC', '1047478887', 'Karen Madiedo', 'karenmr.04@gmail.com', 'Dios040405', NULL, NULL, NULL, 1, 1, 1),
	(89, 'CC', '1', 'juan', 'juan@manuel.com', '123456789', NULL, NULL, NULL, 1, 1, 1),
	(90, 'CC', '1', 'juan', 'juan@ma.com', '1234', NULL, NULL, NULL, 1, 1, 1),
	(91, 'TI', '12345', 'Karen Martelo Jr', 'karenmartelojr@hotmail.com', 'clave123', NULL, NULL, NULL, 1, 1, 1);
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.USUARIO_ACTIVIDAD
DROP TABLE IF EXISTS `USUARIO_ACTIVIDAD`;
CREATE TABLE IF NOT EXISTS `USUARIO_ACTIVIDAD` (
  `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `CD_ACTIVIDAD` int(11) NOT NULL,
  `DT_ACTIVIDAD` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `AM_PUNTOS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`,`CD_ACTIVIDAD`,`DT_ACTIVIDAD`),
  KEY `USUARIO_ACT_ACTIVIDAD` (`CD_ACTIVIDAD`),
  CONSTRAINT `USUARIO_ACT_ACTIVIDAD` FOREIGN KEY (`CD_ACTIVIDAD`) REFERENCES `ACTIVIDAD` (`CD_ACTIVIDAD`),
  CONSTRAINT `USUARIO_ACT_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `USUARIO` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.USUARIO_ACTIVIDAD: ~0 rows (aproximadamente)
DELETE FROM `USUARIO_ACTIVIDAD`;
/*!40000 ALTER TABLE `USUARIO_ACTIVIDAD` DISABLE KEYS */;
/*!40000 ALTER TABLE `USUARIO_ACTIVIDAD` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.USUARIO_ENTIDAD
DROP TABLE IF EXISTS `USUARIO_ENTIDAD`;
CREATE TABLE IF NOT EXISTS `USUARIO_ENTIDAD` (
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
  CONSTRAINT `USU_ENTIDAD_ENTIDAD` FOREIGN KEY (`ID_ENTIDAD`) REFERENCES `ENTIDAD` (`ID_ENTIDAD`),
  CONSTRAINT `USU_ENTIDAD_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `USUARIO` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.USUARIO_ENTIDAD: ~0 rows (aproximadamente)
DELETE FROM `USUARIO_ENTIDAD`;
/*!40000 ALTER TABLE `USUARIO_ENTIDAD` DISABLE KEYS */;
/*!40000 ALTER TABLE `USUARIO_ENTIDAD` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
