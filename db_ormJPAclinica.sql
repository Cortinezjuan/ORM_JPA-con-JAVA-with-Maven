/*
SQLyog Ultimate v9.02 
MySQL - 5.5.5-10.4.20-MariaDB : Database - ormhospital
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ormhospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ormhospital`;

/*Table structure for table `detallehistoriaclinica` */

DROP TABLE IF EXISTS `detallehistoriaclinica`;

CREATE TABLE `detallehistoriaclinica` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `diagnostico` varchar(255) DEFAULT NULL,
  `sintomas` varchar(255) DEFAULT NULL,
  `fechaAtencion` varchar(255) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `id_historiaClinica` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK30562B05C7462C0C` (`id_historiaClinica`),
  CONSTRAINT `FK30562B05C7462C0C` FOREIGN KEY (`id_historiaClinica`) REFERENCES `historiaclinica` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `detallehistoriaclinica` */

insert  into `detallehistoriaclinica`(`id`,`diagnostico`,`sintomas`,`fechaAtencion`,`observaciones`,`id_historiaClinica`) values (1,'cervicalgia','migrañas','05/07/2021','reposo por 24hs',1);

/*Table structure for table `domicilio` */

DROP TABLE IF EXISTS `domicilio`;

CREATE TABLE `domicilio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `domicilio` */

insert  into `domicilio`(`id`,`numero`,`localidad`,`calle`) values (1,1200,'Mendoza','San Martin'),(2,255,'Lavalle','Mitre');

/*Table structure for table `empleado` */

DROP TABLE IF EXISTS `empleado`;

CREATE TABLE `empleado` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dni` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `nroLegajo` int(11) NOT NULL,
  `sueldo` double NOT NULL,
  `idDomicilio` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4AF864EB673CCA67` (`idDomicilio`),
  CONSTRAINT `FK4AF864EB673CCA67` FOREIGN KEY (`idDomicilio`) REFERENCES `domicilio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `empleado` */

/*Table structure for table `especialidad` */

DROP TABLE IF EXISTS `especialidad`;

CREATE TABLE `especialidad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `denominacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `especialidad` */

/*Table structure for table `historiaclinica` */

DROP TABLE IF EXISTS `historiaclinica`;

CREATE TABLE `historiaclinica` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fechaAlta` varchar(255) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `historiaclinica` */

insert  into `historiaclinica`(`id`,`fechaAlta`,`numero`) values (1,'22/08/2021',2);

/*Table structure for table `medico` */

DROP TABLE IF EXISTS `medico`;

CREATE TABLE `medico` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dni` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `celular` bigint(20) NOT NULL,
  `matricula` int(11) NOT NULL,
  `idDomicilio` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK89237969673CCA67` (`idDomicilio`),
  CONSTRAINT `FK89237969673CCA67` FOREIGN KEY (`idDomicilio`) REFERENCES `domicilio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `medico` */

insert  into `medico`(`id`,`dni`,`nombre`,`apellido`,`celular`,`matricula`,`idDomicilio`) values (1,25369852,NULL,'Gomez',261360986,125963,2);

/*Table structure for table `medico_especialidad` */

DROP TABLE IF EXISTS `medico_especialidad`;

CREATE TABLE `medico_especialidad` (
  `MEDICO_ID` bigint(20) NOT NULL,
  `ESPECIALIDAD_ID` bigint(20) NOT NULL,
  KEY `FKB104A86856973722` (`ESPECIALIDAD_ID`),
  KEY `FKB104A8688FE049C2` (`MEDICO_ID`),
  CONSTRAINT `FKB104A86856973722` FOREIGN KEY (`ESPECIALIDAD_ID`) REFERENCES `especialidad` (`id`),
  CONSTRAINT `FKB104A8688FE049C2` FOREIGN KEY (`MEDICO_ID`) REFERENCES `medico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `medico_especialidad` */

/*Table structure for table `paciente` */

DROP TABLE IF EXISTS `paciente`;

CREATE TABLE `paciente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dni` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `nroSocio` int(11) NOT NULL,
  `idDomicilio` bigint(20) DEFAULT NULL,
  `id_historiaClinica` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK30817791C7462C0C` (`id_historiaClinica`),
  KEY `FK30817791673CCA67` (`idDomicilio`),
  CONSTRAINT `FK30817791673CCA67` FOREIGN KEY (`idDomicilio`) REFERENCES `domicilio` (`id`),
  CONSTRAINT `FK30817791C7462C0C` FOREIGN KEY (`id_historiaClinica`) REFERENCES `historiaclinica` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `paciente` */

insert  into `paciente`(`id`,`dni`,`nombre`,`apellido`,`nroSocio`,`idDomicilio`,`id_historiaClinica`) values (1,35652693,'Juan','Perez',0,1,1);

/*Table structure for table `turno` */

DROP TABLE IF EXISTS `turno`;

CREATE TABLE `turno` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hora` int(11) NOT NULL,
  `idTurno` int(11) NOT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `minutos` int(11) NOT NULL,
  `id_paciente` bigint(20) DEFAULT NULL,
  `idMedico` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4D69F72A786182E` (`id_paciente`),
  KEY `FK4D69F72152C7015` (`idMedico`),
  CONSTRAINT `FK4D69F72152C7015` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`id`),
  CONSTRAINT `FK4D69F72A786182E` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `turno` */

insert  into `turno`(`id`,`hora`,`idTurno`,`fecha`,`minutos`,`id_paciente`,`idMedico`) values (1,10,0,'22/10/2021',30,1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
