-- --------------------------------------------------------
-- Host:                         www.xualiapp.com
-- Versión del servidor:         5.5.52-cll - MySQL Community Server (GPL)
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
  `CD_ACTIVIDAD` varchar(20) NOT NULL DEFAULT '',
  `NM_ACTIVIDAD` varchar(150) NOT NULL,
  `DS_ACTIVIDAD` varchar(300) DEFAULT NULL,
  `AM_PUNTOS` int(11) DEFAULT NULL,
  PRIMARY KEY (`CD_ACTIVIDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.ACTIVIDAD: ~0 rows (aproximadamente)
DELETE FROM `ACTIVIDAD`;
/*!40000 ALTER TABLE `ACTIVIDAD` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACTIVIDAD` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.COMPONENTE
DROP TABLE IF EXISTS `COMPONENTE`;
CREATE TABLE IF NOT EXISTS `COMPONENTE` (
  `ID_COMPONENTE` int(11) NOT NULL DEFAULT '0',
  `DS_COMPONENTE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_COMPONENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.COMPONENTE: ~1 rows (aproximadamente)
DELETE FROM `COMPONENTE`;
/*!40000 ALTER TABLE `COMPONENTE` DISABLE KEYS */;
INSERT INTO `COMPONENTE` (`ID_COMPONENTE`, `DS_COMPONENTE`) VALUES
	(1, 'Derechos Sexuales y Reproductivos');
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
  `CD_ROL` varchar(20) NOT NULL,
  `CD_ESTADO` char(1) DEFAULT NULL,
  `DT_ADDED` datetime NOT NULL,
  `ID_ADDED` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_EMPLEADO`),
  KEY `EMPLEADO_ENTIDAD` (`ID_ENTIDAD`),
  KEY `EMPLEADO_ROL` (`CD_ROL`),
  CONSTRAINT `EMPLEADO_ENTIDAD` FOREIGN KEY (`ID_ENTIDAD`) REFERENCES `ENTIDAD` (`ID_ENTIDAD`),
  CONSTRAINT `EMPLEADO_ROL` FOREIGN KEY (`CD_ROL`) REFERENCES `ROL` (`CD_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.EMPLEADO: ~2 rows (aproximadamente)
DELETE FROM `EMPLEADO`;
/*!40000 ALTER TABLE `EMPLEADO` DISABLE KEYS */;
INSERT INTO `EMPLEADO` (`ID_EMPLEADO`, `ID_ENTIDAD`, `CD_TIPO_DOCUMENTO`, `ID_DOCUMENTO`, `NOMBRE1`, `NOMBRE2`, `APELLIDO1`, `APELLIDO2`, `CD_ROL`, `CD_ESTADO`, `DT_ADDED`, `ID_ADDED`) VALUES
	(1, 1, 'CC', '34511214', 'LUIS', 'CARLOS', 'MARTINEZ', 'SALAS', 'G', 'A', '2016-09-01 00:00:00', NULL),
	(2, 1, 'CC', '1454110', 'ANA', 'MARIA', 'PELAEZ', 'RUIZ', 'A', 'A', '2016-09-02 00:00:00', NULL);
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

-- Volcando datos para la tabla xualiapp_xualiapp.ENTIDAD: ~1 rows (aproximadamente)
DELETE FROM `ENTIDAD`;
/*!40000 ALTER TABLE `ENTIDAD` DISABLE KEYS */;
INSERT INTO `ENTIDAD` (`ID_ENTIDAD`, `NM_ENTIDAD`, `DS_ENTIDAD`, `DIRECCION`, `URL_LOGO`, `URL_PORTADA`, `URL_WEBSITE`, `CD_ESTADO`) VALUES
	(1, 'Joven en Accion', 'Entidad sin animo de lucro para el empoderamiento de los jovenes.', 'Cartagena, Centro', NULL, NULL, NULL, 'A');
/*!40000 ALTER TABLE `ENTIDAD` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.HISTORIA
DROP TABLE IF EXISTS `HISTORIA`;
CREATE TABLE IF NOT EXISTS `HISTORIA` (
  `ID_HISTORIA` int(11) NOT NULL DEFAULT '0',
  `ID_TEMA` int(11) DEFAULT NULL,
  `CD_TYPE` varchar(20) DEFAULT NULL,
  `TITLE_HISTORIA` varchar(150) DEFAULT NULL,
  `DS_INTRO` varchar(250) DEFAULT NULL,
  `DS_HISTORIA` text,
  `URL_PORTADA` varchar(250) DEFAULT NULL,
  `URL_HISTORIA` varchar(250) DEFAULT NULL,
  `PUNTO_DECISION` int(11) DEFAULT NULL,
  `CD_ESTADO` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID_HISTORIA`),
  KEY `HISTORIA_TEMA` (`ID_TEMA`),
  CONSTRAINT `HISTORIA_TEMA` FOREIGN KEY (`ID_TEMA`) REFERENCES `TEMA` (`ID_TEMA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.HISTORIA: ~3 rows (aproximadamente)
DELETE FROM `HISTORIA`;
/*!40000 ALTER TABLE `HISTORIA` DISABLE KEYS */;
INSERT INTO `HISTORIA` (`ID_HISTORIA`, `ID_TEMA`, `CD_TYPE`, `TITLE_HISTORIA`, `DS_INTRO`, `DS_HISTORIA`, `URL_PORTADA`, `URL_HISTORIA`, `PUNTO_DECISION`, `CD_ESTADO`) VALUES
	(10, 1, 'PUBLICO', 'JENNIFER TIENE 20', 'Jennifer nos cuenta su historia, siendo una adolescente se dejó llevar por el amor que sentía por su novio John ...', 'Actualmente Jeninifer con 20 años tiene a su hijo Juan David de 3 años,  nos cuenta que a la edad que quedó embarazada no tenia mucha información acerca de sexualidad', 'jennifer.jpg', 'https://www.youtube.com/embed/CfZXTpczGpY', NULL, '1'),
	(11, 1, 'PUBLICO', 'MILDRE Y SU HIJO', 'Mildre encuentra preservativos en la ropa de su hijo, quieres saber como reacciona?', 'Mientras lavaba la ropa de su hijo, Mildre, madre costeña le reclama a su hijo, no esperando la respuesta que el le dio.', 'mildre.jpg', 'https://www.youtube.com/embed/G-nj5mR1hT0', NULL, '1'),
	(12, 1, 'PUBLICO', 'ANA Y SU PLAN DE VIDA', 'Cuando Ana de 15 años se entera que está embarazada corre a contarle a su novio Andrés, no pensando que el, le daría la espalda', 'Ana no tuvo un final feliz, esta historia contada por sus padres nos conmueve...', 'ana.jpg', 'https://www.youtube.com/embed/In0NAov8vFg', NULL, '1');
/*!40000 ALTER TABLE `HISTORIA` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.NIVEL
DROP TABLE IF EXISTS `NIVEL`;
CREATE TABLE IF NOT EXISTS `NIVEL` (
  `CD_NIVEL` varchar(20) NOT NULL DEFAULT '',
  `NM_NIVEL` varchar(20) DEFAULT NULL,
  `DS_NIVEL` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CD_NIVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.NIVEL: ~0 rows (aproximadamente)
DELETE FROM `NIVEL`;
/*!40000 ALTER TABLE `NIVEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `NIVEL` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.NIVEL_COMPETENCIA
DROP TABLE IF EXISTS `NIVEL_COMPETENCIA`;
CREATE TABLE IF NOT EXISTS `NIVEL_COMPETENCIA` (
  `CD_NIVEL` varchar(20) NOT NULL DEFAULT '',
  `ID_COMPETENCIA` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CD_NIVEL`,`ID_COMPETENCIA`),
  KEY `NIVEL_COMP_COMPETENCIA` (`ID_COMPETENCIA`),
  CONSTRAINT `NIVEL_COMP_COMPETENCIA` FOREIGN KEY (`ID_COMPETENCIA`) REFERENCES `TEMA` (`ID_TEMA`),
  CONSTRAINT `NIVEL_COMP_NIVEL` FOREIGN KEY (`CD_NIVEL`) REFERENCES `NIVEL` (`CD_NIVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.NIVEL_COMPETENCIA: ~0 rows (aproximadamente)
DELETE FROM `NIVEL_COMPETENCIA`;
/*!40000 ALTER TABLE `NIVEL_COMPETENCIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `NIVEL_COMPETENCIA` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.PREGUNTA
DROP TABLE IF EXISTS `PREGUNTA`;
CREATE TABLE IF NOT EXISTS `PREGUNTA` (
  `ID_PREGUNTA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `DS_TITULO` varchar(150) DEFAULT NULL,
  `DS_PREGUNTA` varchar(300) DEFAULT NULL,
  `DT_PREGUNTA` datetime DEFAULT NULL,
  `CD_ESTADO` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID_PREGUNTA`),
  KEY `PREGUNTA_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `PREGUNTA_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `USUARIO` (`ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.PREGUNTA: ~14 rows (aproximadamente)
DELETE FROM `PREGUNTA`;
/*!40000 ALTER TABLE `PREGUNTA` DISABLE KEYS */;
INSERT INTO `PREGUNTA` (`ID_PREGUNTA`, `ID_USUARIO`, `DS_TITULO`, `DS_PREGUNTA`, `DT_PREGUNTA`, `CD_ESTADO`) VALUES
	(1, 10, 'Estar enamorado, ¿es bueno para la salud?', 'Me contaron  que enamorarse es bueno para la salud, pero no se si es cierto.', '2016-09-20 00:00:00', 'A'),
	(2, 10, 'Latido del corazon', '¿Por qué nos late el corazón con más fuerza cuando estamos excitados o enamorados?', '2016-09-21 00:00:00', 'A'),
	(3, 10, '¿Pueden las mujeres ser impotentes?', 'Una amiga me conto que era impotente, pero no estoy seguro si esto es posible.', '2016-09-22 00:00:00', 'A'),
	(4, 10, '¿Qué pasa si se rompe el preservativo?', 'Durante la relacion sexual que puede pasar si se rompe el preservativo?', '2016-09-22 00:00:00', 'A'),
	(5, 10, 'Dos condones son mas seguros?', '¿Si te pones dos condones es más seguro?', '0920-09-23 06:00:00', 'A'),
	(8, 11, 'Puede una niña de 13 quedar embarazada', 'Quiero saber si una niña de 13 años puede quedar embarazada', '2016-10-15 16:41:31', 'A'),
	(10, 68, 'A que edad se desarrollan los hombres', 'Quiero saber a que edad comienzan a desarrollarse los hombres', '2016-10-15 17:01:47', 'A'),
	(11, 68, 'A que edad de desarrollan las niñas?', 'Quiero saber a que edad se desarrollan las mujeres', '2016-10-15 17:11:46', 'A'),
	(12, 77, 'Que pasa cuando las niñas tienen su primer período', 'Que pasa cuando las niñas tienen su primer período', '2016-10-17 20:11:18', 'A'),
	(13, 15, 'Prueba', 'Prueba', '2016-11-16 05:45:04', 'A'),
	(14, 15, 'Prueba', 'Prueba', '2016-11-16 05:45:04', 'A'),
	(15, 15, 'Prueba', 'Prueba', '2016-11-16 05:45:04', 'A'),
	(16, 15, 'Prueba', 'Prueba', '2016-11-16 05:45:05', 'A'),
	(17, 15, 'Prueba', 'Prueba', '2016-11-16 05:45:06', 'A');
/*!40000 ALTER TABLE `PREGUNTA` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.PUNTO_DECISION
DROP TABLE IF EXISTS `PUNTO_DECISION`;
CREATE TABLE IF NOT EXISTS `PUNTO_DECISION` (
  `ID_PUNTO_DECISION` int(11) NOT NULL DEFAULT '0',
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
  `ID_RESPUESTA` int(11) NOT NULL DEFAULT '0',
  `ID_PREGUNTA` int(11) DEFAULT NULL,
  `ID_EMPLEADO` int(11) DEFAULT NULL,
  `DS_RESPUESTA` varchar(500) DEFAULT NULL,
  `DT_RESPUESTA` datetime DEFAULT NULL,
  `CD_STADO` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID_RESPUESTA`),
  KEY `RESPUESTA_EMPLEADO` (`ID_EMPLEADO`),
  KEY `RESPUESTA_PREGUNTA` (`ID_PREGUNTA`),
  CONSTRAINT `RESPUESTA_EMPLEADO` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `EMPLEADO` (`ID_EMPLEADO`),
  CONSTRAINT `RESPUESTA_PREGUNTA` FOREIGN KEY (`ID_PREGUNTA`) REFERENCES `PREGUNTA` (`ID_PREGUNTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.RESPUESTA: ~5 rows (aproximadamente)
DELETE FROM `RESPUESTA`;
/*!40000 ALTER TABLE `RESPUESTA` DISABLE KEYS */;
INSERT INTO `RESPUESTA` (`ID_RESPUESTA`, `ID_PREGUNTA`, `ID_EMPLEADO`, `DS_RESPUESTA`, `DT_RESPUESTA`, `CD_STADO`) VALUES
	(1, 1, 2, 'Sí. Es un punto en el que coinciden de forma unánime los especialistas: las relaciones de pareja cariñosas favorecen la salud.', '2016-09-22 00:00:00', 'A'),
	(2, 2, 2, 'Este mecanismo es muy similar al que sentimos cuando nos invade el miedo: corazón desbocado, rodillas con flojera, sensación de irritabilidad muy característica en la boca de nuestro estómago. Todo esto depende de nuestro sistema nervioso vegetativo, que es el que rige las funciones corporales que no dependen de nuestra voluntad, como es el ritmo y la intensidad del ritmo cardíaco.', '2016-09-23 00:00:00', 'A'),
	(3, 3, 2, 'No. Existe una dificultad similar en las mujeres: la falta de turgencia del clítoris, aunque esto no impide, como en el caso de la disfunción eréctil, la participación pasiva en el coito, pero sí dificulta la obtención del placer sexual.', '2016-09-26 00:00:00', 'A'),
	(4, 4, 2, 'En ocasiones el preservativo se rompe. el motivo de la ruptua muchas veces es o porque no se colocó correctamente o porque el preservativo estaba en mal estado. Sin embargo, sea el motivo que sea, una vez que se rompa el preservativo existe riesgo de embarazo.', '2016-09-26 00:00:00', 'A'),
	(5, 5, 2, 'No, todo lo contrario. La colocación de dos preservativos puede ocasionar su ruptura por el roce. Lo corresto es usar uno y colocarlo correctamente', '2016-09-27 00:00:00', 'A');
/*!40000 ALTER TABLE `RESPUESTA` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.ROL
DROP TABLE IF EXISTS `ROL`;
CREATE TABLE IF NOT EXISTS `ROL` (
  `CD_ROL` varchar(20) NOT NULL,
  `NM_ROL` varchar(100) NOT NULL,
  PRIMARY KEY (`CD_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.ROL: ~2 rows (aproximadamente)
DELETE FROM `ROL`;
/*!40000 ALTER TABLE `ROL` DISABLE KEYS */;
INSERT INTO `ROL` (`CD_ROL`, `NM_ROL`) VALUES
	('A', 'ASESOR'),
	('G', 'GESTOR');
/*!40000 ALTER TABLE `ROL` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.TEMA
DROP TABLE IF EXISTS `TEMA`;
CREATE TABLE IF NOT EXISTS `TEMA` (
  `ID_TEMA` int(11) NOT NULL DEFAULT '0',
  `ID_COMPONENTE` int(11) DEFAULT NULL,
  `DS_COMPETENCIA` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_TEMA`),
  KEY `COMPETENCIA_COMPONENTE` (`ID_COMPONENTE`),
  CONSTRAINT `COMPETENCIA_COMPONENTE` FOREIGN KEY (`ID_COMPONENTE`) REFERENCES `COMPONENTE` (`ID_COMPONENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.TEMA: ~1 rows (aproximadamente)
DELETE FROM `TEMA`;
/*!40000 ALTER TABLE `TEMA` DISABLE KEYS */;
INSERT INTO `TEMA` (`ID_TEMA`, `ID_COMPONENTE`, `DS_COMPETENCIA`) VALUES
	(1, 1, 'Prevención Embarazo Adolescente');
/*!40000 ALTER TABLE `TEMA` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.TIPO_DOCUMENTO
DROP TABLE IF EXISTS `TIPO_DOCUMENTO`;
CREATE TABLE IF NOT EXISTS `TIPO_DOCUMENTO` (
  `CD_TIPO_DOCUMENTO` varchar(20) DEFAULT NULL,
  `NM_TIPO_DOCUMENTO` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.TIPO_DOCUMENTO: ~0 rows (aproximadamente)
DELETE FROM `TIPO_DOCUMENTO`;
/*!40000 ALTER TABLE `TIPO_DOCUMENTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPO_DOCUMENTO` ENABLE KEYS */;


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
  `CD_ESTADO` varchar(20) DEFAULT 'A',
  PRIMARY KEY (`ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualiapp_xualiapp.USUARIO: ~81 rows (aproximadamente)
DELETE FROM `USUARIO`;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
INSERT INTO `USUARIO` (`ID_USUARIO`, `CD_TIPO_DOCUMENTO`, `ID_DOCUMENTO`, `NOMBRE`, `DS_EMAIL`, `DS_PASSWORD`, `DT_NACIMIENTO`, `URL_FACEBOOK`, `URL_TWITTER`, `CD_ESTADO`) VALUES
	(10, 'TI', '84020612345', 'Jhon Daniels', 'pjdisar@hotmail.com', 'clave123', NULL, NULL, NULL, 'A'),
	(11, 'TI', '84020656789', 'Carlos Marx', 'carlosmarx@hotmail.com', 'clave123', NULL, NULL, NULL, 'A'),
	(12, 'TI', '84020656789', 'Carlos Marx', 'florindameza@hotmail.com', 'clave123', NULL, NULL, NULL, 'A'),
	(13, 'TI', '84020656789', 'Carlos Marx', 'otroemail@hotmail.com', 'clave123', NULL, NULL, NULL, 'A'),
	(14, 'TI', '84020656789', 'Carlos Marx', 'miemail@hotmail.com', 'clave123', NULL, NULL, NULL, 'A'),
	(15, 'TI', '123456', 'John', 'mario@gmail.com', 'clave123', NULL, NULL, NULL, 'A'),
	(16, 'TI', '123456', 'John', 'mario2@gmail.com', 'clave123', NULL, NULL, NULL, 'A'),
	(17, 'TI', '85154127', 'Ana Smith', 'anasmith@gmail.com', 'clave123', NULL, NULL, NULL, 'A'),
	(18, 'TI', '85154127', 'Ana Jordan', 'anajordan@gmail.com', 'clave123', NULL, NULL, NULL, 'A'),
	(19, 'TI', '85154127', 'Ana Jordan', 'anajordan15@gmail.com', 'clave123', NULL, NULL, NULL, 'A'),
	(20, 'TI', '12345', 'Ana Jordan', 'anajordan54@gmail.com', 'clave123', NULL, NULL, NULL, 'A'),
	(21, 'TI', '12345', 'Ana Jordan', 'anajordan5@gmail.com', 'clave123', NULL, NULL, NULL, 'A'),
	(22, 'TI', '65122154', 'John Carter', 'jhonc@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(23, 'TI', '3131254', 'diana lean', 'diana@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(24, 'TI', '1456461', 'ricardo', 'ricardo@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(25, 'TI', '64212', 'camila suarez', 'camila@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(26, 'TI', '64212', 'camila suarez', 'camila2@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(27, 'TI', '64212', 'camila suarez', 'camila21@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(28, 'TI', '64212', 'camila suarez', 'camila22@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(29, 'TI', '64212', 'camila suarez', 'camila24@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(30, 'TI', '64212', 'camila suarez', 'camila25@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(31, 'TI', '64564', 'Jhon marx', 'johnm@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(32, 'TI', '64564', 'Jhon marx', 'johnmarx@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(33, 'TI', '3164', 'manuel guillet', 'mgui@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(34, 'TI', '84020656789', 'Carlos Marx', 'miemail2@hotmail.com', 'clave123', NULL, NULL, NULL, 'A'),
	(35, 'TI', '3164', 'manuel guillet', 'mguill@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(36, 'TI', '3164', 'manuel guillet', 'mguille@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(37, 'TI', '32311', 'Manuel', 'man@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(38, 'TI', '32311', 'Manuel', 'man12@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(39, 'TI', '64634', 'Jhon Doe', 'jhond@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(40, 'TI', '64634', 'Jhon Doe', 'jhondoe@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(41, 'CC', '3132101', 'Karen Martelo', 'kmartelo@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(42, 'Cédula', '45548866', 'July Dayana', 'Julycastillo83@gmail.com', 'Judacas45548', NULL, NULL, NULL, 'A'),
	(43, 'Cédula de Ciudadanía', '52906398', 'Kattya De Oro Genes', 'kdeoro@gmail.com', 'Cartagena2016', NULL, NULL, NULL, 'A'),
	(44, 'Cc', '1047381738', 'Pedro', 'sawy0007@gmail.com', 'ndradeguerrero', NULL, NULL, NULL, 'A'),
	(45, 'TI', '12345', 'Peter Diaz', 'pjdisar@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(46, 'TI', '85154', 'Jhan Carlos', 'jhancarlos@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(47, ' cedula', '1143378980', 'julio jose prieto berthel', 'elenprendedor@hotmail.com', '123456789j', NULL, NULL, NULL, 'A'),
	(48, 'TI', '9812', 'Daduis', 'daoking69@gmail.com', '981201', NULL, NULL, NULL, 'A'),
	(49, 'TI', '9812', 'Daduis', 'daoking69@gmail.com', '981201', NULL, NULL, NULL, 'A'),
	(50, 'TI', '12345', 'Jean Paul Sartre', 'Jeanpaul@gmail.com', 'clabe123', NULL, NULL, NULL, 'A'),
	(51, 'Ti', '12345', 'Jean Paul', 'Jeanpual@hotmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(52, 'TI', '987654', 'frank kafka', 'kafka@gmail.com', 'clave123', NULL, NULL, NULL, 'A'),
	(53, 'TI', '561311', 'ana smith', 'anasmith@hotmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(54, 'TI', '564145', 'jhondiaz', 'jhondiaz@hotmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(55, 'TI', '62141001', 'angel', 'angel@hotmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(56, 'TI', '53024420', 'Shakira Mebarak', 'shakira@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(57, 'TI', '2484721', 'Juan Esteban Garcia', 'Juanes@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(58, 'TI', '44534101', 'Alex Rovira', 'alex@hotmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(59, 'CC', '123', 'karen', 'xualiapp@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(60, 'CC', '123', 'karen', 'xualiapp@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(61, 'CC', '123', 'karen', 'xualiapp@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(62, 'CC', '123', 'karen', 'xualiapp@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(63, 'cc', '123455', 'karen', 'km@hormail.com', '123', NULL, NULL, NULL, 'A'),
	(64, 'CC', '1234', 'karen', 'kkk@gmail.com', '123', NULL, NULL, NULL, 'A'),
	(65, 'CC', '123', 'karen', 'km@hotm.com', '123', NULL, NULL, NULL, 'A'),
	(66, 'Cédula ciudadanía ', '1143344711', 'Jorge Luis ', 'thebigboss-09@hotmail.com', '900809', NULL, NULL, NULL, 'A'),
	(67, 'Cédula ciudadanía ', '1143344711', 'Jorge Luis ', 'thebigboss-09@hotmail.com', '900809', NULL, NULL, NULL, 'A'),
	(68, 'TI', '54321324', 'Carlos Darwin', 'carlosdarwin@hotmail.com', 'clave123', NULL, NULL, NULL, 'A'),
	(69, 'TI', '1', 'sdf', 'pjdisar10@hotmail.com', 'aaaa', NULL, NULL, NULL, 'A'),
	(70, 'TI', '2134', 'Chayanne', 'chayann@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(71, 'TI', '132451', 'Ignacio Fontalvo', 'ignacio@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(72, 'TI', '213212', 'Peter', 'pjsystem@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(73, 'TI', '', 'Peter', 'pjsystem11@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(74, 'TI', '123', 'Peter', 'pjsystem12@gmail.com', 'clave', NULL, NULL, NULL, 'A'),
	(75, 'CC', '1143334559', 'Kate pas', 'katepas18@hotmail.com', 'mono20', NULL, NULL, NULL, 'A'),
	(76, 'TI', '123456', 'Karen Paola', 'karen@gmail.com', '1234', NULL, NULL, NULL, 'A'),
	(77, 'TI', '123456', 'Karen Paola', 'karen@gmail.com', '1234', NULL, NULL, NULL, 'A'),
	(78, 'CC', '1143398352', 'Jonathan Cantillo', 'jccantillog@gmail.com', 'jajaja1234', NULL, NULL, NULL, 'A'),
	(79, 'CC', '10299765', 'Juan manuel', 'juanmasuarezt@gmail.com', '1234567890', NULL, NULL, NULL, 'A'),
	(80, 'CC', '73208654', 'CARLOS BUENO', 'buenogutierrez@gmail.com', 'c4rt4g3n4', NULL, NULL, NULL, 'A'),
	(81, 'CC', '10299765', 'Juan manuel suarez', 'juanmasuarezt@hotmail.com', 'XualiIntro8cad', NULL, NULL, NULL, 'A'),
	(82, 'CC', '10299765', 'Juan manuel suarez', 'juanmasuarez1@gmail.com', 'XualiIntro8cad', NULL, NULL, NULL, 'A'),
	(83, 'CC', '18009177', 'julian Patrick manrique mclean', 'jpmanriquemclean@hotmail.com', 'patrick', NULL, NULL, NULL, 'A'),
	(84, 'CC', '73181977', 'Michel de Oro', 'micheldeoro@gmail.com', 'bpogra12', NULL, NULL, NULL, 'A'),
	(85, 'CC', '104945383', 'Ivan Villamil', '8avilla@gmail.com', 'Amaranto1', NULL, NULL, NULL, 'A'),
	(86, 'CC', '104945383', 'Ivan Villamil', '8avilla@gmail.com', 'Amaranto1', NULL, NULL, NULL, 'A'),
	(87, 'CC', '111111', 'Juan', 'juan@juan.com', 'clave1', NULL, NULL, NULL, 'A'),
	(88, 'CC', '1047478887', 'Karen Madiedo', 'karenmr.04@gmail.com', 'Dios040405', NULL, NULL, NULL, 'A'),
	(89, 'CC', '1', 'juan', 'juan@manuel.com', '123456789', NULL, NULL, NULL, 'A'),
	(90, 'CC', '1', 'juan', 'juan@ma.com', '1234', NULL, NULL, NULL, 'A');
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;


-- Volcando estructura para tabla xualiapp_xualiapp.USUARIO_ACTIVIDAD
DROP TABLE IF EXISTS `USUARIO_ACTIVIDAD`;
CREATE TABLE IF NOT EXISTS `USUARIO_ACTIVIDAD` (
  `ID_USUARIO` int(11) NOT NULL DEFAULT '0',
  `CD_ACTIVIDAD` varchar(20) NOT NULL DEFAULT '',
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
