-- --------------------------------------------------------
-- Host:                         192.168.33.10
-- Versión del servidor:         5.6.33 - MySQL Community Server (GPL)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para xualidb
CREATE DATABASE IF NOT EXISTS `xualidb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `xualidb`;


-- Volcando estructura para tabla xualidb.ACTIVIDAD
CREATE TABLE IF NOT EXISTS `ACTIVIDAD` (
  `CD_ACTIVIDAD` varchar(20) NOT NULL DEFAULT '',
  `NM_ACTIVIDAD` varchar(150) NOT NULL,
  `DS_ACTIVIDAD` varchar(300) DEFAULT NULL,
  `AM_PUNTOS` int(11) DEFAULT NULL,
  PRIMARY KEY (`CD_ACTIVIDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.ACTIVIDAD: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ACTIVIDAD` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACTIVIDAD` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.COMPONENTE
CREATE TABLE IF NOT EXISTS `COMPONENTE` (
  `ID_COMPONENTE` int(11) NOT NULL DEFAULT '0',
  `DS_COMPONENTE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_COMPONENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.COMPONENTE: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `COMPONENTE` DISABLE KEYS */;
REPLACE INTO `COMPONENTE` (`ID_COMPONENTE`, `DS_COMPONENTE`) VALUES
	(1, 'Derechos Sexuales y Reproductivos');
/*!40000 ALTER TABLE `COMPONENTE` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.EMPLEADO
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

-- Volcando datos para la tabla xualidb.EMPLEADO: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `EMPLEADO` DISABLE KEYS */;
REPLACE INTO `EMPLEADO` (`ID_EMPLEADO`, `ID_ENTIDAD`, `CD_TIPO_DOCUMENTO`, `ID_DOCUMENTO`, `NOMBRE1`, `NOMBRE2`, `APELLIDO1`, `APELLIDO2`, `CD_ROL`, `CD_ESTADO`, `DT_ADDED`, `ID_ADDED`) VALUES
	(1, 1, 'CC', '34511214', 'LUIS', 'CARLOS', 'MARTINEZ', 'SALAS', 'G', 'A', '2016-09-01 00:00:00', NULL),
	(2, 1, 'CC', '1454110', 'ANA', 'MARIA', 'PELAEZ', 'RUIZ', 'A', 'A', '2016-09-02 00:00:00', NULL);
/*!40000 ALTER TABLE `EMPLEADO` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.ENTIDAD
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

-- Volcando datos para la tabla xualidb.ENTIDAD: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ENTIDAD` DISABLE KEYS */;
REPLACE INTO `ENTIDAD` (`ID_ENTIDAD`, `NM_ENTIDAD`, `DS_ENTIDAD`, `DIRECCION`, `URL_LOGO`, `URL_PORTADA`, `URL_WEBSITE`, `CD_ESTADO`) VALUES
	(1, 'Joven en Accion', 'Entidad sin animo de lucro para el empoderamiento de los jovenes.', 'Cartagena, Centro', NULL, NULL, NULL, 'A');
/*!40000 ALTER TABLE `ENTIDAD` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.HISTORIA
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

-- Volcando datos para la tabla xualidb.HISTORIA: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `HISTORIA` DISABLE KEYS */;
REPLACE INTO `HISTORIA` (`ID_HISTORIA`, `ID_TEMA`, `CD_TYPE`, `TITLE_HISTORIA`, `DS_INTRO`, `DS_HISTORIA`, `URL_PORTADA`, `URL_HISTORIA`, `PUNTO_DECISION`, `CD_ESTADO`) VALUES
	(10, 1, 'PUBLICO', 'JENNIFER TIENE 20', 'Jennifer nos cuenta su historia, siendo una adolescente se dejó llevar por el amor que sentía por su novio John ...', 'Actualmente Jeninifer con 20 años tiene a su hijo Juan David de 3 años,  nos cuenta que a la edad que quedó embarazada no tenia mucha información acerca de sexualidad', 'jennifer.jpg', 'jennifer.mp4', NULL, '1'),
	(11, 1, 'PUBLICO', 'JESICA Y JUAN DAVID', 'Jesica como madre adolescente nos cuenta que su proyecto de vida se desvió al tener a su hijo', 'Cuando sus amigas del colegio se graduaban, ella estaba en su casa cuidando a Pedrito su hijo.', 'jesica.jpg', 'jesica.mp4', NULL, '1'),
	(12, 1, 'PUBLICO', 'ANA Y SU PLAN DE VIDA', 'Cuando Ana de 15 años se entera que está embarazada corre a contarle a su novio Andrés, no contando que el, le daría la espalda', 'Ana no tuvo un final feliz, esta historia contada por sus padres nos conmueve...', 'ana.jpg', 'ana.mp4', NULL, '1');
/*!40000 ALTER TABLE `HISTORIA` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.NIVEL
CREATE TABLE IF NOT EXISTS `NIVEL` (
  `CD_NIVEL` varchar(20) NOT NULL DEFAULT '',
  `NM_NIVEL` varchar(20) DEFAULT NULL,
  `DS_NIVEL` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CD_NIVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.NIVEL: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `NIVEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `NIVEL` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.NIVEL_COMPETENCIA
CREATE TABLE IF NOT EXISTS `NIVEL_COMPETENCIA` (
  `CD_NIVEL` varchar(20) NOT NULL DEFAULT '',
  `ID_COMPETENCIA` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CD_NIVEL`,`ID_COMPETENCIA`),
  KEY `NIVEL_COMP_COMPETENCIA` (`ID_COMPETENCIA`),
  CONSTRAINT `NIVEL_COMP_COMPETENCIA` FOREIGN KEY (`ID_COMPETENCIA`) REFERENCES `TEMA` (`ID_TEMA`),
  CONSTRAINT `NIVEL_COMP_NIVEL` FOREIGN KEY (`CD_NIVEL`) REFERENCES `NIVEL` (`CD_NIVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.NIVEL_COMPETENCIA: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `NIVEL_COMPETENCIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `NIVEL_COMPETENCIA` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.PREGUNTA
CREATE TABLE IF NOT EXISTS `PREGUNTA` (
  `ID_PREGUNTA` int(11) NOT NULL DEFAULT '0',
  `ID_USUARIO` int(11) DEFAULT NULL,
  `DS_TITULO` varchar(150) DEFAULT NULL,
  `DS_PREGUNTA` varchar(300) DEFAULT NULL,
  `DT_PREGUNTA` datetime DEFAULT NULL,
  `CD_ESTADO` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID_PREGUNTA`),
  KEY `PREGUNTA_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `PREGUNTA_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `USUARIO` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.PREGUNTA: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `PREGUNTA` DISABLE KEYS */;
REPLACE INTO `PREGUNTA` (`ID_PREGUNTA`, `ID_USUARIO`, `DS_TITULO`, `DS_PREGUNTA`, `DT_PREGUNTA`, `CD_ESTADO`) VALUES
	(1, 10, 'Estar enamorado, ¿es bueno para la salud?', 'Me contaron  que enamorarse es bueno para la salud, pero no se si es cierto.', '2016-09-20 00:00:00', 'A'),
	(2, 10, 'Latido del corazon', '¿Por qué nos late el corazón con más fuerza cuando estamos excitados o enamorados?', '2016-09-21 00:00:00', 'A'),
	(3, 10, '¿Pueden las mujeres ser impotentes?', 'Una amiga me conto que era impotente, pero no estoy seguro si esto es posible.', '2016-09-22 00:00:00', 'A'),
	(4, 10, '¿Qué pasa si se rompe el preservativo?', 'Durante la relacion sexual que puede pasar si se rompe el preservativo?', '2016-09-22 00:00:00', 'A'),
	(5, 10, 'Dos condones son mas seguros?', '¿Si te pones dos condones es más seguro?', '0920-09-23 06:00:00', 'A');
/*!40000 ALTER TABLE `PREGUNTA` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.PUNTO_DECISION
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

-- Volcando datos para la tabla xualidb.PUNTO_DECISION: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `PUNTO_DECISION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PUNTO_DECISION` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.RESPUESTA
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

-- Volcando datos para la tabla xualidb.RESPUESTA: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `RESPUESTA` DISABLE KEYS */;
REPLACE INTO `RESPUESTA` (`ID_RESPUESTA`, `ID_PREGUNTA`, `ID_EMPLEADO`, `DS_RESPUESTA`, `DT_RESPUESTA`, `CD_STADO`) VALUES
	(1, 1, 2, 'Sí. Es un punto en el que coinciden de forma unánime los especialistas: las relaciones de pareja cariñosas favorecen la salud.', '2016-09-22 00:00:00', 'A'),
	(2, 2, 2, 'Este mecanismo es muy similar al que sentimos cuando nos invade el miedo: corazón desbocado, rodillas con flojera, sensación de irritabilidad muy característica en la boca de nuestro estómago. Todo esto depende de nuestro sistema nervioso vegetativo, que es el que rige las funciones corporales que no dependen de nuestra voluntad, como es el ritmo y la intensidad del ritmo cardíaco.', '2016-09-23 00:00:00', 'A'),
	(3, 3, 2, 'No. Existe una dificultad similar en las mujeres: la falta de turgencia del clítoris, aunque esto no impide, como en el caso de la disfunción eréctil, la participación pasiva en el coito, pero sí dificulta la obtención del placer sexual.', '2016-09-26 00:00:00', 'A'),
	(4, 4, 2, 'En ocasiones el preservativo se rompe. el motivo de la ruptua muchas veces es o porque no se colocó correctamente o porque el preservativo estaba en mal estado. Sin embargo, sea el motivo que sea, una vez que se rompa el preservativo existe riesgo de embarazo.', '2016-09-26 00:00:00', 'A'),
	(5, 5, 2, 'No, todo lo contrario. La colocación de dos preservativos puede ocasionar su ruptura por el roce. Lo corresto es usar uno y colocarlo correctamente', '2016-09-27 00:00:00', 'A');
/*!40000 ALTER TABLE `RESPUESTA` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.ROL
CREATE TABLE IF NOT EXISTS `ROL` (
  `CD_ROL` varchar(20) NOT NULL,
  `NM_ROL` varchar(100) NOT NULL,
  PRIMARY KEY (`CD_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.ROL: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `ROL` DISABLE KEYS */;
REPLACE INTO `ROL` (`CD_ROL`, `NM_ROL`) VALUES
	('A', 'ASESOR'),
	('G', 'GESTOR');
/*!40000 ALTER TABLE `ROL` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.TEMA
CREATE TABLE IF NOT EXISTS `TEMA` (
  `ID_TEMA` int(11) NOT NULL DEFAULT '0',
  `ID_COMPONENTE` int(11) DEFAULT NULL,
  `DS_COMPETENCIA` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_TEMA`),
  KEY `COMPETENCIA_COMPONENTE` (`ID_COMPONENTE`),
  CONSTRAINT `COMPETENCIA_COMPONENTE` FOREIGN KEY (`ID_COMPONENTE`) REFERENCES `COMPONENTE` (`ID_COMPONENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.TEMA: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `TEMA` DISABLE KEYS */;
REPLACE INTO `TEMA` (`ID_TEMA`, `ID_COMPONENTE`, `DS_COMPETENCIA`) VALUES
	(1, 1, 'Prevención Embarazo Adolescente');
/*!40000 ALTER TABLE `TEMA` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.TIPO_DOCUMENTO
CREATE TABLE IF NOT EXISTS `TIPO_DOCUMENTO` (
  `CD_TIPO_DOCUMENTO` varchar(20) DEFAULT NULL,
  `NM_TIPO_DOCUMENTO` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.TIPO_DOCUMENTO: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `TIPO_DOCUMENTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPO_DOCUMENTO` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.USUARIO
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla xualidb.USUARIO: ~31 rows (aproximadamente)
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
REPLACE INTO `USUARIO` (`ID_USUARIO`, `CD_TIPO_DOCUMENTO`, `ID_DOCUMENTO`, `NOMBRE`, `DS_EMAIL`, `DS_PASSWORD`, `DT_NACIMIENTO`, `URL_FACEBOOK`, `URL_TWITTER`, `CD_ESTADO`) VALUES
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
	(41, 'CC', '3132101', 'Karen Martelo', 'kmartelo@gmail.com', 'clave', NULL, NULL, NULL, 'A');
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.USUARIO_ACTIVIDAD
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

-- Volcando datos para la tabla xualidb.USUARIO_ACTIVIDAD: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `USUARIO_ACTIVIDAD` DISABLE KEYS */;
/*!40000 ALTER TABLE `USUARIO_ACTIVIDAD` ENABLE KEYS */;


-- Volcando estructura para tabla xualidb.USUARIO_ENTIDAD
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

-- Volcando datos para la tabla xualidb.USUARIO_ENTIDAD: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `USUARIO_ENTIDAD` DISABLE KEYS */;
/*!40000 ALTER TABLE `USUARIO_ENTIDAD` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
