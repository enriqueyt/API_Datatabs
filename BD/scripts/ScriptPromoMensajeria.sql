DROP SCHEMA IF EXISTS `mensajeria`;

CREATE DATABASE IF NOT EXISTS `mensajeria` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `mensajeria`;

CREATE TABLE IF NOT EXISTS `cSMS_Bentrada` (
	`id_entrada` INT(11)                              NOT NULL AUTO_INCREMENT,
	`id_cliente` INT(11)                              NOT NULL,
	`id_user`    INT(11)                              NOT NULL,
	`movil`      VARCHAR(15)  COLLATE utf8_spanish_ci NOT NULL,
	`sms`        VARCHAR(180) COLLATE utf8_spanish_ci NOT NULL,
	`fecha`      DATETIME                             NOT NULL,
	`status`     TINYINT(1)                           NOT NULL,
    `modem`      VARCHAR(15)  COLLATE utf8_spanish_ci NOT NULL,
	PRIMARY KEY (`id_entrada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de mensajes';

CREATE TABLE IF NOT EXISTS `cSMS_DispositivoModem` (
	`idDispositivo` VARCHAR(45) COLLATE utf8_spanish_ci NOT NULL,
	`idModem`       SMALLINT(6)                         NOT NULL,
	`cont`          INT(11)                             NOT NULL DEFAULT '0',
PRIMARY KEY (`idDispositivo`, `idModem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar dispositivos con modems';

CREATE TABLE IF NOT EXISTS `cSMS_BsalidaSpeed` (
	`id_salida`       BIGINT(20)                           NOT NULL AUTO_INCREMENT,
	`id_cliente`      INT(11)                              NOT NULL,
	`movil`           VARCHAR(100) COLLATE utf8_spanish_ci NOT NULL,
	`sms`             VARCHAR(160) COLLATE utf8_spanish_ci NOT NULL,
	`fecha_creada`    DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`fecha_ejecucion` DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`idConfirm`       FLOAT(10, 2)                         NOT NULL DEFAULT '0',
	`status`          VARCHAR(10)  COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
	`server`          SMALLINT(6)                          NOT NULL DEFAULT '0',
	`enviando`        TINYINT(1)                           NOT NULL DEFAULT '0',
	`ip`              VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
	`prioridad`       TINYINT(1)                           NOT NULL DEFAULT '1',
PRIMARY KEY (`id_salida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de estados de mensajes';

ALTER TABLE `cSMS_BsalidaSpeed`
ADD INDEX `ix_cSMS_BsalidaSpeed` (`server`);