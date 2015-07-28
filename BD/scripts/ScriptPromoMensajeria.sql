DROP SCHEMA IF EXISTS `datatabs_mensajeria`;

CREATE DATABASE IF NOT EXISTS `datatabs_mensajeria` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `datatabs_mensajeria`;

CREATE TABLE IF NOT EXISTS `csms_tipoentrada` (
	`id_tipoEntrada` TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	`codigo`         CHAR(5)    COLLATE utf8_spanish_ci NOT NULL,
	`activo`         TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoEntrada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tipos de mensajes de entrada';

CREATE TABLE IF NOT EXISTS `csms_tipoentrada_t` (
	`id_tipoEntrada_t`      TINYINT(1)                           NOT NULL AUTO_INCREMENT,
	`tipoEntrada`           VARCHAR(20)  COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_tipoEntrada`        TINYINT(1)                           NOT NULL,
	`id_idioma`             TINYINT(1)                           NOT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoEntrada_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipos de mensajes de entrada';

ALTER TABLE `csms_tipoentrada_t`
ADD CONSTRAINT `csms_tipoentrada_t__tb_idioma`        FOREIGN KEY (`id_idioma`)      REFERENCES datatabs_main.tb_idioma (`id_idioma`),
ADD CONSTRAINT `csms_tipoentrada_t__csms_tipoentrada` FOREIGN KEY (`id_tipoEntrada`) REFERENCES csms_tipoentrada        (`id_tipoEntrada`);

CREATE TABLE IF NOT EXISTS `csms_bentrada` (
	`id_entrada`     INT(11)                              NOT NULL AUTO_INCREMENT,
	`id_cliente`     INT(11)                              NOT NULL,
	`id_user`        INT(11)                              NOT NULL,
	`movil`          VARCHAR(15)  COLLATE utf8_spanish_ci NOT NULL,
	`sms`            VARCHAR(180) COLLATE utf8_spanish_ci NOT NULL,
	`fecha`          DATETIME                             NOT NULL,
	`status`         TINYINT(1)                           NOT NULL,
    `modem`          VARCHAR(15)  COLLATE utf8_spanish_ci NOT NULL,
    `id_tipoEntrada` TINYINT(1)                           DEFAULT NULL,
	PRIMARY KEY (`id_entrada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de mensajes';

ALTER TABLE `csms_bentrada`
ADD CONSTRAINT `csms_bentrada__csms_tipoentrada` FOREIGN KEY (`id_tipoEntrada`) REFERENCES `csms_tipoentrada` (`id_tipoEntrada`);

CREATE TABLE IF NOT EXISTS `csms_dispositivoModem` (
	`id_dispositivoModem` INT(11)                             NOT NULL AUTO_INCREMENT,
    `id_dispositivo`      VARCHAR(45) COLLATE utf8_spanish_ci NOT NULL,
	`id_modem`            SMALLINT(6)                         NOT NULL,
	`cont`                INT(11)                             NOT NULL DEFAULT '0',
PRIMARY KEY (`id_dispositivoModem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar dispositivos con modems';

CREATE TABLE IF NOT EXISTS `csms_bsalidaSpeed` (
	`id_salida`       BIGINT(20)                           NOT NULL AUTO_INCREMENT,
	`id_cliente`      INT(11)                              NOT NULL,
	`movil`           VARCHAR(100) COLLATE utf8_spanish_ci NOT NULL,
	`sms`             VARCHAR(160) COLLATE utf8_spanish_ci NOT NULL,
	`fecha_creada`    DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`fecha_ejecucion` DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_confirm`      FLOAT(10, 2)                         NOT NULL DEFAULT '0',
	`status`          VARCHAR(10)  COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
	`server`          SMALLINT(6)                          NOT NULL DEFAULT '0',
	`enviando`        TINYINT(1)                           NOT NULL DEFAULT '0',
	`ip`              VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
	`prioridad`       TINYINT(1)                           NOT NULL DEFAULT '1',
PRIMARY KEY (`id_salida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de estados de mensajes';

ALTER TABLE `csms_bsalidaSpeed`
ADD INDEX `ix_csms_bsalidaSpeed` (`server`);

CREATE TABLE IF NOT EXISTS `csms_blacklist` (
  `id_blacklist` INT(11)                             NOT NULL AUTO_INCREMENT,
  `id_empresa`   INT(11)                             DEFAULT NULL,
  `word`         VARCHAR(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `movil`        VARCHAR(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status`       INT(11)                             DEFAULT NULL,
  `fecha`        DATETIME                            DEFAULT NULL,
PRIMARY KEY (`id_blacklist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de lista negra';

CREATE TABLE IF NOT EXISTS `csms_whitelist` (
  `id_whitelist` INT(11)                             NOT NULL AUTO_INCREMENT,
  `word`         VARCHAR(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `movil`        VARCHAR(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status`       INT(11)                             DEFAULT NULL,
  `fecha`        DATETIME                            DEFAULT NULL,
  `id_empresa`   INT(11)                             DEFAULT NULL,
PRIMARY KEY (`id_whitelist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de lista blanca';

CREATE TABLE IF NOT EXISTS `csms_grupo` (
  `id_grupo`     INT(11)                              NOT NULL AUTO_INCREMENT,
  `nombre`       VARCHAR(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_creado` DATETIME                             DEFAULT NULL,
  `id_empresa`   INT(11)                              DEFAULT NULL,
  `id_sucursal`  INT(11)                              DEFAULT NULL,
  `id_evento`    INT(11)                              DEFAULT NULL,
PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de grupos para mensajeria';

CREATE TABLE IF NOT EXISTS `csms_grupo_mensaje` (
  `id_grupoMensaje` INT(11)                             NOT NULL AUTO_INCREMENT,
  `id_grupo`        INT(11)                             NOT NULL,
  `id_consumidor`   INT(11)                             NOT NULL,
  `movil`           VARCHAR(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_mensaje`      INT(11)                             NOT NULL,
PRIMARY KEY (`id_grupoMensaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `csms_grupo_mensaje`
ADD CONSTRAINT `csms_grupo_mensaje__csms_bentrada` FOREIGN KEY (`id_mensaje`) REFERENCES csms_bentrada (`id_entrada`),
ADD CONSTRAINT `csms_grupo_mensaje__csms_grupo`    FOREIGN KEY (`id_grupo`)   REFERENCES csms_grupo    (`id_grupo`);