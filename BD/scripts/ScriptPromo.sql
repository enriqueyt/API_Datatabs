DROP SCHEMA IF EXISTS `datatabs_mensajeria`;
DROP SCHEMA IF EXISTS `datatabs_main`;

CREATE DATABASE IF NOT EXISTS `datatabs_main` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `datatabs_main`;

CREATE TABLE IF NOT EXISTS `tb_idioma` (
	`id_idioma`             TINYINT(3)                         NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(3)    COLLATE utf8_spanish_ci NOT NULL,
	`id_usuarioCreador`     INT(11)                            DEFAULT NULL,
	`id_usuarioModificador` INT(11)                            DEFAULT NULL,
	`activo`                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_idioma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de idiomas';

CREATE TABLE IF NOT EXISTS `tb_idioma_t` (
	`id_idioma_t`           TINYINT(3)                          NOT NULL AUTO_INCREMENT,
	`idioma`                VARCHAR(20) COLLATE utf8_spanish_ci NOT NULL,
	`id_idioma`             TINYINT(1)                          NOT NULL,
	`id_usuarioCreador`     INT(11)                             DEFAULT NULL,
	`id_usuarioModificador` INT(11)                             DEFAULT NULL,
	`activo`                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_idioma_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de idiomas';

ALTER TABLE `tb_idioma_t`
ADD CONSTRAINT `tb_idioma_t__tb_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_idioma` (`id_idioma`);

CREATE TABLE IF NOT EXISTS `tb_pais` (
	`id_pais`               SMALLINT(6)                         NOT NULL AUTO_INCREMENT,
	`codigoNUM`             CHAR(3)     COLLATE utf8_spanish_ci NOT NULL,
	`codigoALP2`            CHAR(2)     COLLATE utf8_spanish_ci NOT NULL,
	`codigoALP3`            CHAR(3)     COLLATE utf8_spanish_ci NOT NULL,
	`id_usuarioCreador`     INT(11)                             DEFAULT NULL,
	`id_usuarioModificador` INT(11)                             DEFAULT NULL,
	`activo`                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de paises';

CREATE TABLE IF NOT EXISTS `tb_pais_t` (
	`id_pais_t`             SMALLINT(6)                         NOT NULL AUTO_INCREMENT,
	`pais`                  VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
	`id_pais`               SMALLINT(6)                         NOT NULL,
	`id_idioma`             TINYINT(1)                          NOT NULL,
	`id_usuarioCreador`     INT(11)                             DEFAULT NULL,
	`id_usuarioModificador` INT(11)                             DEFAULT NULL,
	`activo`                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_pais_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de paises';

ALTER TABLE `tb_pais_t`
ADD CONSTRAINT `tb_pais_t__tb_pais`   FOREIGN KEY (`id_pais`)   REFERENCES `tb_pais`   (`id_pais`),
ADD CONSTRAINT `tb_pais_t__tb_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_idioma` (`id_idioma`);

CREATE TABLE IF NOT EXISTS `tb_estado` (
	`id_estado`             SMALLINT(6)                         NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(5)     COLLATE utf8_spanish_ci NOT NULL,
	`id_pais`               SMALLINT(6)                         NOT NULL,
	`id_usuarioCreador`     INT(11)                             DEFAULT NULL,
	`id_usuarioModificador` INT(11)                             DEFAULT NULL,
	`activo`                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de estado, region, distrito, etc';

ALTER TABLE `tb_estado`
ADD CONSTRAINT `tb_estado__tb_pais` FOREIGN KEY (`id_pais`) REFERENCES `tb_pais` (`id_pais`);

CREATE TABLE IF NOT EXISTS `tb_estado_t` (
	`id_estado_t`           SMALLINT(6)                         NOT NULL AUTO_INCREMENT,
	`estado`                VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
	`id_estado`             SMALLINT(6)                         NOT NULL,
	`id_idioma`             TINYINT(1)                          NOT NULL,
	`id_usuarioCreador`     INT(11)                             DEFAULT NULL,
	`id_usuarioModificador` INT(11)                             DEFAULT NULL,
	`activo`                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_estado_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traduciones de estados, regiones, distritos, etc.';

ALTER TABLE `tb_estado_t`
ADD CONSTRAINT `tb_estado_t__tb_estado` FOREIGN KEY (`id_estado`) REFERENCES `tb_estado` (`id_estado`),
ADD CONSTRAINT `tb_estado_t__tb_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_idioma` (`id_idioma`);

CREATE TABLE IF NOT EXISTS `tb_ciudad` (
	`id_ciudad`             SMALLINT(6)                         NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(5)     COLLATE utf8_spanish_ci NOT NULL,
	`id_estado`             SMALLINT(6)                         NOT NULL,
	`id_usuarioCreador`     INT(11)                             DEFAULT NULL,
	`id_usuarioModificador` INT(11)                             DEFAULT NULL,
	`activo`                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de ciudades';

ALTER TABLE `tb_ciudad`
ADD CONSTRAINT `tb_ciudad__tb_estado` FOREIGN KEY (`id_estado`) REFERENCES `tb_estado` (`id_estado`);

CREATE TABLE IF NOT EXISTS `tb_ciudad_t` (
	`id_ciudad_t`           SMALLINT(6)                         NOT NULL AUTO_INCREMENT,
	`ciudad`                VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
	`id_ciudad`             SMALLINT(6)                         NOT NULL,
	`id_idioma`             TINYINT(1)                          NOT NULL,
	`id_usuarioCreador`     INT(11)                             DEFAULT NULL,
	`id_usuarioModificador` INT(11)                             DEFAULT NULL,
	`activo`                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_ciudad_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para ciudades y sus traducciones';

ALTER TABLE `tb_ciudad_t`
ADD CONSTRAINT `tb_ciudad_t__tb_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `tb_ciudad` (`id_ciudad`),
ADD CONSTRAINT `tb_ciudad_t__tb_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_idioma` (`id_idioma`);

CREATE TABLE IF NOT EXISTS `tb_perfil` (
	`id_perfil`             TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(10)   COLLATE utf8_spanish_ci NOT NULL,
	`id_usuarioCreador`     INT(11)                            DEFAULT NULL,
	`id_usuarioModificador` INT(11)                            DEFAULT NULL,
	`activo`                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de perfiles';

CREATE TABLE IF NOT EXISTS `tb_perfil_t` (
	`id_perfil_t`           TINYINT(1)                           NOT NULL AUTO_INCREMENT,
	`perfil`                VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_perfil`             TINYINT(1)                           NOT NULL,
	`id_idioma`             TINYINT(1)                           NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_perfil_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de perfiles';

ALTER TABLE `tb_perfil_t`
ADD CONSTRAINT `tb_perfil_t__tb_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `tb_perfil` (`id_perfil`),
ADD CONSTRAINT `tb_perfil_t__tb_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_idioma` (`id_idioma`);

CREATE TABLE IF NOT EXISTS `tb_sexo` (
	`id_sexo`               TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(1)    COLLATE utf8_spanish_ci NOT NULL,
	`id_usuarioCreador`     INT(11)                            DEFAULT NULL,
	`id_usuarioModificador` INT(11)                            DEFAULT NULL,
	`activo`                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_sexo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de sexo';

CREATE TABLE IF NOT EXISTS `tb_sexo_t` (
	`id_sexo_t`             TINYINT(1)                          NOT NULL AUTO_INCREMENT,
	`sexo`                  VARCHAR(20) COLLATE utf8_spanish_ci NOT NULL,
	`id_sexo`               TINYINT(1)                          NOT NULL,
	`id_idioma`             TINYINT(1)                          NOT NULL,
	`id_usuarioCreador`     INT(11)                             DEFAULT NULL,
	`id_usuarioModificador` INT(11)                             DEFAULT NULL,
	`activo`                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_sexo_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de sexo';

ALTER TABLE `tb_sexo_t`
ADD CONSTRAINT `tb_sexo_t__tb_sexo`   FOREIGN KEY (`id_sexo`)   REFERENCES `tb_sexo`   (`id_sexo`),
ADD CONSTRAINT `tb_sexo_t__tb_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_idioma` (`id_idioma`);

CREATE TABLE IF NOT EXISTS `tb_controlador` (
	`id_controlador`        SMALLINT(6)                          NOT NULL AUTO_INCREMENT,
	`nombre`                VARCHAR(100) COLLATE utf8_spanish_ci NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_controlador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de controladores de vistas';

CREATE TABLE IF NOT EXISTS `tb_controlador_t` (
	`id_controlador_t`      SMALLINT(6)                          NOT NULL AUTO_INCREMENT,
	`controlador`           VARCHAR(100) COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(300) COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_controlador`        SMALLINT(6)                          NOT NULL,
	`id_idioma`             TINYINT(1)                           NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_controlador_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de los controladores de vistas';

ALTER TABLE `tb_controlador_t`
ADD CONSTRAINT `tb_controlador_t__tb_controlador` FOREIGN KEY (`id_controlador`) REFERENCES `tb_controlador` (`id_controlador`),
ADD CONSTRAINT `tb_controlador_t__tb_idioma`      FOREIGN KEY (`id_idioma`)      REFERENCES `tb_idioma` (`id_idioma`);

CREATE TABLE IF NOT EXISTS `tb_vista` (
	`id_vista`              SMALLINT(6)                          NOT NULL AUTO_INCREMENT,
	`nombre`                VARCHAR(100) COLLATE utf8_spanish_ci NOT NULL,
	`id_controlador`        SMALLINT(6)                          NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_vista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de vistas de la aplicacion';

ALTER TABLE `tb_vista`
ADD CONSTRAINT `tb_vista__tb_controlador` FOREIGN KEY (`id_controlador`) REFERENCES `tb_controlador` (`id_controlador`);

CREATE TABLE IF NOT EXISTS `tb_vista_t` (
	`id_vista_t`            SMALLINT(6)                          NOT NULL AUTO_INCREMENT,
	`vista`                 VARCHAR(100) COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(300) COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_vista`              SMALLINT(6)                          NOT NULL,
	`id_idioma`             TINYINT(1)                           NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_vista_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de las vistas de la aplicacion';

ALTER TABLE `tb_vista_t`
ADD CONSTRAINT `tb_vista_t__tb_vista`  FOREIGN KEY (`id_vista`)  REFERENCES `tb_vista`  (`id_vista`),
ADD CONSTRAINT `tb_vista_t__tb_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_idioma` (`id_idioma`);

CREATE TABLE IF NOT EXISTS `tb_usuario` (
	`id_usuario`            INT(11)                              NOT NULL AUTO_INCREMENT,
	`usuario`               VARCHAR(200) COLLATE utf8_spanish_ci NOT NULL,
    `usuario_`              VARCHAR(200) COLLATE utf8_spanish_ci NOT NULL,
	`usuarioCorreo`         VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
    `usuarioCorreo_`        VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	`contrasena`            VARCHAR(255) COLLATE utf8_spanish_ci NOT NULL,
	`fechaRegistro`         DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de usuarios';

ALTER TABLE `tb_usuario`
ADD UNIQUE (`usuario`),
ADD UNIQUE (`usuarioCorreo`);

CREATE TABLE IF NOT EXISTS `tb_sesion` (
	`id_sesion`     INT(11)                              NOT NULL AUTO_INCREMENT,
	`sesion`        VARCHAR(255) COLLATE utf8_spanish_ci NOT NULL,
	`fechaInicio`   DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`fechaUltimaOp` DATETIME                             NOT NULL,
	`id_usuario`    INT(11)                              NOT NULL,
	`activo`        TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_sesion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de sesiones';

ALTER TABLE `tb_sesion`
ADD CONSTRAINT `tb_sesion__tb_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`);

CREATE TABLE IF NOT EXISTS `tb_usuarioactivo` (
	`id_usuarioActivo`      INT(11)    NOT NULL AUTO_INCREMENT,
	`id_usuario`            INT(11)    NOT NULL,
	`id_usuarioCreador`     INT(11)    DEFAULT NULL,
	`id_usuarioModificador` INT(11)    DEFAULT NULL,
	`activo`                TINYINT(1) NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_usuarioActivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para monitoreo de usuarios activos o no dentro de la aplicacion';

ALTER TABLE `tb_usuarioactivo`
ADD CONSTRAINT `tb_usuarioactivo__tb_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`);

CREATE TABLE IF NOT EXISTS `tb_usuario_perfil` (
	`id_usuarioPerfil`      INT(11)    NOT NULL AUTO_INCREMENT,
	`id_usuario`            INT(11)    NOT NULL,
	`id_perfil`             TINYINT(1) NOT NULL,
	`id_usuarioCreador`     INT(11)    DEFAULT NULL,
	`id_usuarioModificador` INT(11)    DEFAULT NULL,
	PRIMARY KEY (`id_usuarioPerfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar a un usuario con un perfil';

ALTER TABLE `tb_usuario_perfil`
ADD CONSTRAINT `tb_usuario_perfil__tb_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`),
ADD CONSTRAINT `tb_usuario_perfil__tb_perfil`  FOREIGN KEY (`id_perfil`)  REFERENCES `tb_perfil`  (`id_perfil`);

CREATE TABLE IF NOT EXISTS `tb_perfil_vista` (
	`id_perfilVista`        SMALLINT(6) NOT NULL AUTO_INCREMENT,
	`id_perfil`             TINYINT(1)  NOT NULL,
	`id_vista`              SMALLINT(6) NOT NULL,
	`id_usuarioCreador`     INT(11)     DEFAULT NULL,
	`id_usuarioModificador` INT(11)     DEFAULT NULL,
	PRIMARY KEY (`id_perfilVista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar a un perfil con las vistas a las que tendra acceso';

ALTER TABLE `tb_perfil_vista`
ADD CONSTRAINT `tb_perfil_vista__tb_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `tb_perfil` (`id_perfil`),
ADD CONSTRAINT `tb_perfil_vista__tb_vista`  FOREIGN KEY (`id_vista`)  REFERENCES `tb_vista`  (`id_vista`);

CREATE TABLE IF NOT EXISTS `tb_superdistribuidor` (
	`id_superDistribuidor`  INT(11)                              NOT NULL AUTO_INCREMENT,
	`identificacion`        VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`nombre`                VARCHAR(150) COLLATE utf8_spanish_ci NOT NULL,
	`razonSocial`           VARCHAR(150) COLLATE utf8_spanish_ci NOT NULL,
	`telefono`              VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`fax`                   VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`correo`                VARCHAR(50)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`direccion`             VARCHAR(300) COLLATE utf8_spanish_ci DEFAULT NULL,
	`fechaRegistro`         DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_ciudad`             SMALLINT(6)                          NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_superDistribuidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de super distribuidores';

ALTER TABLE `tb_superdistribuidor`
ADD UNIQUE (`nombre`, `razonSocial`),
ADD CONSTRAINT `tb_superdistribuidor__tb_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `tb_ciudad` (`id_ciudad`);

CREATE TABLE IF NOT EXISTS `tb_distribuidor` (
	`id_distribuidor`       INT(11)                              NOT NULL AUTO_INCREMENT,
	`identificacion`        VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`nombre`                VARCHAR(150) COLLATE utf8_spanish_ci NOT NULL,
	`razonSocial`           VARCHAR(150) COLLATE utf8_spanish_ci NOT NULL,
	`telefono`              VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`fax`                   VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`correo`                VARCHAR(50)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`direccion`             VARCHAR(300) COLLATE utf8_spanish_ci DEFAULT NULL,
	`fechaRegistro`         DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_ciudad`             SMALLINT(6)                          NOT NULL,
	`id_superDistribuidor`  INT(11)                              DEFAULT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_distribuidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de distribuidores';

ALTER TABLE `tb_distribuidor`
ADD CONSTRAINT `tb_distribuidor__tb_ciudad`            FOREIGN KEY (`id_ciudad`)            REFERENCES `tb_ciudad`            (`id_ciudad`),
ADD CONSTRAINT `tb_distribuidor__tb_superdistribuidor` FOREIGN KEY (`id_superDistribuidor`) REFERENCES `tb_superdistribuidor` (`id_superDistribuidor`);

CREATE TABLE IF NOT EXISTS `tb_empresa` (
	`id_empresa`            INT(11)                              NOT NULL AUTO_INCREMENT,
	`identificacion`        VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`nombre`                VARCHAR(150) COLLATE utf8_spanish_ci NOT NULL,
	`razonSocial`           VARCHAR(150) COLLATE utf8_spanish_ci NOT NULL,
	`telefono`              VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`fax`                   VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`correo`                VARCHAR(50)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`direccion`             VARCHAR(300) COLLATE utf8_spanish_ci DEFAULT NULL,
	`fechaRegistro`         DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_ciudad`             SMALLINT(6)                          NOT NULL,
	`id_distribuidor`       INT(11)                              NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de empresas';

ALTER TABLE `tb_empresa`
ADD CONSTRAINT `tb_empresa__tb_ciudad`       FOREIGN KEY (`id_ciudad`)       REFERENCES `tb_ciudad`       (`id_ciudad`),
ADD CONSTRAINT `tb_empresa__tb_distribuidor` FOREIGN KEY (`id_distribuidor`) REFERENCES `tb_distribuidor` (`id_distribuidor`);

CREATE TABLE IF NOT EXISTS `tb_sucursal` (
	`id_sucursal`           INT(11)                              NOT NULL AUTO_INCREMENT,
	`sucursal`              VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	`direccion`             VARCHAR(300) COLLATE utf8_spanish_ci DEFAULT NULL,
	`fechaRegistro`         DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_ciudad`             SMALLINT(6)                          NOT NULL,
	`id_empresa`            INT(11)                              NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de sucursales';

ALTER TABLE `tb_sucursal`
ADD CONSTRAINT `tb_sucursal__tb_ciudad`  FOREIGN KEY (`id_ciudad`)  REFERENCES `tb_ciudad`  (`id_ciudad`),
ADD CONSTRAINT `tb_sucursal__tb_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `tb_empresa` (`id_empresa`);

CREATE TABLE IF NOT EXISTS `tb_grupo` (
	`id_grupo`              SMALLINT(6)                          NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(5)      COLLATE utf8_spanish_ci DEFAULT NULL,
	`grupo`                 VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(300) COLLATE utf8_spanish_ci DEFAULT NULL,
    `id_empresa`            INT(11)                              NOT NULL,
    `id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de grupos';


CREATE TABLE IF NOT EXISTS `tb_tipousuariod` (
	`id_tipoUsuarioD`       TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(10)   COLLATE utf8_spanish_ci NOT NULL,
	`id_usuarioCreador`     INT(11)                            DEFAULT NULL,
	`id_usuarioModificador` INT(11)                            DEFAULT NULL,
	`activo`                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoUsuarioD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tipos de usuarios';

CREATE TABLE IF NOT EXISTS `tb_tipousuariod_t` (
	`id_tipoUsuarioD_t`     TINYINT(1)                           NOT NULL AUTO_INCREMENT,
	`tipoUsuarioD`          VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_tipoUsuarioD`       TINYINT(1)                           NOT NULL,
	`id_idioma`             TINYINT(1)                           NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoUsuarioD_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipos de usuario';

ALTER TABLE `tb_tipousuariod_t`
ADD CONSTRAINT `tb_tipousuariod_t__tb_idioma`       FOREIGN KEY (`id_idioma`)       REFERENCES `tb_idioma`       (`id_idioma`),
ADD CONSTRAINT `tb_tipousuariod_t__tb_tipousuariod` FOREIGN KEY (`id_tipoUsuarioD`) REFERENCES `tb_tipousuariod` (`id_tipoUsuarioD`);

CREATE TABLE IF NOT EXISTS `tb_usuariod` (
	`id_usuarioD`           INT(11)                              NOT NULL AUTO_INCREMENT,
	`identificacion`        VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`nombres`               VARCHAR(150) COLLATE utf8_spanish_ci DEFAULT NULL,
	`apellidos`             VARCHAR(150) COLLATE utf8_spanish_ci DEFAULT NULL,
	`correo`                VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	`tlfCasa`               VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`tlfOficina`            VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`tlfCelular`            VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`avatar`                VARCHAR(500) COLLATE utf8_spanish_ci DEFAULT NULL,
    `id_sexo`               TINYINT(1)                           NOT NULL,
	`id_tipoUsuarioD`       TINYINT(1)                           NOT NULL,
	`id_ciudad`             SMALLINT(6)                          NOT NULL,
	`id_idioma`             TINYINT(3)                           DEFAULT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_usuarioD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de usuarios con detalles de informacion';

ALTER TABLE `tb_usuariod`
ADD CONSTRAINT `tb_usuariod__tb_ciudad`       FOREIGN KEY (`id_ciudad`)       REFERENCES `tb_ciudad`       (`id_ciudad`),
ADD CONSTRAINT `tb_usuariod__tb_idioma`       FOREIGN KEY (`id_idioma`)       REFERENCES `tb_idioma`       (`id_idioma`),
ADD CONSTRAINT `tb_usuariod__tb_sexo`         FOREIGN KEY (`id_sexo`)         REFERENCES `tb_sexo`         (`id_sexo`),
ADD CONSTRAINT `tb_usuariod__tb_tipousuariod` FOREIGN KEY (`id_tipoUsuarioD`) REFERENCES `tb_tipousuariod` (`id_tipoUsuarioD`);

CREATE TABLE IF NOT EXISTS `tb_usuario_usuariod` (
	`id_usuarioUsuarioD`    INT(11) NOT NULL AUTO_INCREMENT,
	`id_usuario`            INT(11) NOT NULL,
	`id_usuarioD`           INT(11) NOT NULL,
	`id_usuarioCreador`     INT(11) DEFAULT NULL,
	`id_usuarioModificador` INT(11) DEFAULT NULL,
	PRIMARY KEY (`id_usuarioUsuarioD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar a un usuario con el detalle de su informacion';

ALTER TABLE `tb_usuario_usuariod`
ADD CONSTRAINT `tb_usuario_usuariod__tb_usuario`  FOREIGN KEY (`id_usuario`)  REFERENCES `tb_usuario`  (`id_usuario`),
ADD CONSTRAINT `tb_usuario_usuariod__tb_usuariod` FOREIGN KEY (`id_usuarioD`) REFERENCES `tb_usuariod` (`id_usuarioD`);

CREATE TABLE IF NOT EXISTS `tb_usuariod_superdistribuidor` (
	`id_usuarioDSuperDistribuidor` INT(11)    NOT NULL AUTO_INCREMENT,
	`id_usuarioD`                  INT(11)    NOT NULL,
	`id_superDistribuidor`         INT(11)    NOT NULL,
	`id_usuarioCreador`            INT(11)    DEFAULT NULL,
	`id_usuarioModificador`        INT(11)    DEFAULT NULL,
	`activo`                       TINYINT(1) NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_usuarioDSuperDistribuidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar usuarios con super distribuidores';

ALTER TABLE `tb_usuariod_superdistribuidor`
ADD CONSTRAINT `tb_usuariod_superdistribuidor__tb_superdistribuidor` FOREIGN KEY (`id_superDistribuidor`) REFERENCES `tb_superdistribuidor` (`id_superDistribuidor`),
ADD CONSTRAINT `tb_usuariod_superdistribuidor__tb_usuariod`          FOREIGN KEY (`id_usuarioD`)          REFERENCES `tb_usuariod`          (`id_usuarioD`);

CREATE TABLE IF NOT EXISTS `tb_usuariod_distribuidor` (
	`id_usuarioDDistribuidor` INT(11)    NOT NULL AUTO_INCREMENT,
	`id_usuarioD`             INT(11)    NOT NULL,
	`id_distribuidor`         INT(11)    NOT NULL,
	`id_usuarioCreador`       INT(11)    DEFAULT NULL,
	`id_usuarioModificador`   INT(11)    DEFAULT NULL,
	`activo`                  TINYINT(1) NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_usuarioDDistribuidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar usuarios con distribuidores';

ALTER TABLE `tb_usuariod_distribuidor`
ADD CONSTRAINT `tb_usuariod_distribuidor__tb_distribuidor` FOREIGN KEY (`id_distribuidor`) REFERENCES `tb_distribuidor` (`id_distribuidor`),
ADD CONSTRAINT `tb_usuariod_distribuidor__tb_usuariod`     FOREIGN KEY (`id_usuarioD`)     REFERENCES `tb_usuariod`     (`id_usuarioD`);

CREATE TABLE IF NOT EXISTS `tb_usuariod_empresa` (
	`id_usuarioDEmpresa`    INT(11)    NOT NULL AUTO_INCREMENT,
	`id_usuarioD`           INT(11)    NOT NULL,
	`id_empresa`            INT(11)    NOT NULL,
	`id_usuarioCreador`     INT(11)    DEFAULT NULL,
	`id_usuarioModificador` INT(11)    DEFAULT NULL,
	`activo`                TINYINT(1) NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_usuarioDEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar usuarios con empresas';

ALTER TABLE `tb_usuariod_empresa`
ADD CONSTRAINT `tb_usuariod_empresa__tb_empresa`  FOREIGN KEY (`id_empresa`)  REFERENCES `tb_empresa`  (`id_empresa`),
ADD CONSTRAINT `tb_usuariod_empresa__tb_usuariod` FOREIGN KEY (`id_usuarioD`) REFERENCES `tb_usuariod` (`id_usuarioD`);

CREATE TABLE IF NOT EXISTS `tb_usuariod_sucursal` (
	`id_usuarioDSucursal`   INT(11)    NOT NULL AUTO_INCREMENT,
	`id_usuarioD`           INT(11)    NOT NULL,
	`id_sucursal`           INT(11)    NOT NULL,
	`id_usuarioCreador`     INT(11)    DEFAULT NULL,
	`id_usuarioModificador` INT(11)    DEFAULT NULL,
	`activo`                TINYINT(1) NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_usuarioDSucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar usuarios con sucursales';

ALTER TABLE `tb_usuariod_sucursal`
ADD CONSTRAINT `tb_usuariod_sucursal__tb_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `tb_sucursal` (`id_sucursal`),
ADD CONSTRAINT `tb_usuariod_sucursal__tb_usuariod` FOREIGN KEY (`id_usuarioD`) REFERENCES `tb_usuariod` (`id_usuarioD`);

CREATE TABLE IF NOT EXISTS `tb_tipodispositivo` (
	`id_tipoDispositivo`    TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(5)    COLLATE utf8_spanish_ci NOT NULL,
	`id_usuarioCreador`     INT(11)                            DEFAULT NULL,
	`id_usuarioModificador` INT(11)                            DEFAULT NULL,
	`activo`                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoDispositivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tipos de dispositivos';

CREATE TABLE IF NOT EXISTS `tb_tipodispositivo_t` (
	`id_tipoDispositivo_t`  TINYINT(1)                           NOT NULL AUTO_INCREMENT,
	`tipoDispositivo`       VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_tipoDispositivo`    TINYINT(1)                           NOT NULL,
	`id_idioma`             TINYINT(1)                           NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoDispositivo_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipos de dispositivos';

ALTER TABLE `tb_tipodispositivo_t`
ADD CONSTRAINT `tb_tipodispositivo_t__tb_idioma`          FOREIGN KEY (`id_idioma`)          REFERENCES `tb_idioma`          (`id_idioma`),
ADD CONSTRAINT `tb_tipodispositivo_t__tb_tipodispositivo` FOREIGN KEY (`id_tipoDispositivo`) REFERENCES `tb_tipodispositivo` (`id_tipoDispositivo`);

CREATE TABLE IF NOT EXISTS `tb_dispositivo` (
	`id_dispositivo`        INT(11)                             NOT NULL AUTO_INCREMENT,
	`nombre`                VARCHAR(20) COLLATE utf8_spanish_ci NOT NULL,
    `identificacion`        VARCHAR(20) COLLATE utf8_spanish_ci NOT NULL,
	`marca`                 VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
	`modelo`                VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
	`serial`                VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
	`sistemaOperativo`      VARCHAR(50) COLLATE utf8_spanish_ci DEFAULT NULL,
	`version`               VARCHAR(10) COLLATE utf8_spanish_ci DEFAULT NULL,
	`fechaRegistro`         DATETIME                            NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`fechaUltimaRevision`   DATETIME                            DEFAULT NULL,
	`id_tipoDispositivo`    TINYINT(1)                          NOT NULL,
	`id_sucursal`           INT(11)                             DEFAULT NULL,
	`id_usuarioCreador`     INT(11)                             DEFAULT NULL,
	`id_usuarioModificador` INT(11)                             DEFAULT NULL,
	`activo`                TINYINT(1)                          NOT NULL DEFAULT '1',
	`borrado`               TINYINT(1)                          NOT NULL DEFAULT '0',
	PRIMARY KEY (`id_dispositivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de dispositivos';

ALTER TABLE `tb_dispositivo`
ADD CONSTRAINT `tb_dispositivo__tb_sucursal`        FOREIGN KEY (`id_sucursal`)        REFERENCES `tb_sucursal`        (`id_sucursal`),
ADD CONSTRAINT `tb_dispositivo__tb_tipodispositivo` FOREIGN KEY (`id_tipoDispositivo`) REFERENCES `tb_tipodispositivo` (`id_tipoDispositivo`);

CREATE TABLE IF NOT EXISTS `tb_modem` (
	`id_modem`              INT(11)                              NOT NULL AUTO_INCREMENT,
	`modem`                 VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(300) COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_modem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de modems';

CREATE TABLE IF NOT EXISTS `tb_dispositivo_modem` (
	`id_dispositivoModem`   INT(11) NOT NULL AUTO_INCREMENT,
	`id_dispositivo`        INT(11) NOT NULL,
	`id_modem`              INT(11) NOT NULL,
	`id_usuarioCreador`     INT(11)    DEFAULT NULL,
	`id_usuarioModificador` INT(11)    DEFAULT NULL,
	PRIMARY KEY (`id_dispositivoModem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar dispositivos con modems';

ALTER TABLE `tb_dispositivo_modem`
ADD CONSTRAINT `tb_dispositivo_modem__tb_dispositivo` FOREIGN KEY (`id_dispositivo`) REFERENCES `tb_dispositivo` (`id_dispositivo`),
ADD CONSTRAINT `tb_dispositivo_modem__tb_modem`       FOREIGN KEY (`id_modem`)       REFERENCES `tb_modem`       (`id_modem`);

CREATE TABLE IF NOT EXISTS `tb_tipoconsumidor` (
	`id_tipoConsumidor`     TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(5)    COLLATE utf8_spanish_ci NOT NULL,
	`id_usuarioCreador`     INT(11)                            DEFAULT NULL,
	`id_usuarioModificador` INT(11)                            DEFAULT NULL,
	`activo`                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoConsumidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tipos de consumidores';

CREATE TABLE IF NOT EXISTS `tb_tipoconsumidor_t` (
	`id_tipoConsumidor_t`   TINYINT(1)                           NOT NULL AUTO_INCREMENT,
	`tipoConsumidor`        VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_tipoConsumidor`     TINYINT(1)                           NOT NULL,
	`id_idioma`             TINYINT(1)                           NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoconsumidor_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipos de consumidores';

ALTER TABLE `tb_tipoconsumidor_t`
ADD CONSTRAINT `tb_tipoconsumidor_t__tb_idioma`         FOREIGN KEY (`id_idioma`)         REFERENCES `tb_idioma`         (`id_idioma`),
ADD CONSTRAINT `tb_tipoconsumidor_t__tb_tipoconsumidor` FOREIGN KEY (`id_tipoConsumidor`) REFERENCES `tb_tipoconsumidor` (`id_tipoConsumidor`);

CREATE TABLE IF NOT EXISTS `tb_consumidor` (
	`id_consumidor`         INT(11)                              NOT NULL AUTO_INCREMENT,
	`nombres`               VARCHAR(150) COLLATE utf8_spanish_ci DEFAULT NULL,
	`apellidos`             VARCHAR(150) COLLATE utf8_spanish_ci DEFAULT NULL,
	`celular`               VARCHAR(25)  COLLATE utf8_spanish_ci NOT NULL,
	`correo`                VARCHAR(50)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`twitter`               VARCHAR(50)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`facebook`              VARCHAR(50)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`fechaNacimiento`       DATETIME                             DEFAULT NULL,
	`fechaRegistro`         DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoConsumidor`     TINYINT(1)                           NOT NULL DEFAULT '1',
	`id_sexo`               TINYINT(1)                           DEFAULT NULL,
	`id_ciudad`             SMALLINT(6)                          DEFAULT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	PRIMARY KEY (`id_consumidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de consumidores';

ALTER TABLE `tb_consumidor`
ADD UNIQUE (`celular`),
ADD CONSTRAINT `tb_consumidor__tb_tipoconsumidor` FOREIGN KEY (`id_tipoConsumidor`) REFERENCES `tb_tipoConsumidor` (`id_tipoConsumidor`),
ADD CONSTRAINT `tb_consumidor__tb_ciudad`         FOREIGN KEY (`id_ciudad`)         REFERENCES `tb_ciudad`         (`id_ciudad`),
ADD CONSTRAINT `tb_consumidor__tb_sexo`           FOREIGN KEY (`id_sexo`)           REFERENCES `tb_sexo`           (`id_sexo`);

CREATE TABLE IF NOT EXISTS `tb_consumidor_dispositivo` (
	`id_consumidorDispositivo` INT(11) NOT NULL AUTO_INCREMENT,
	`id_consumidor`            INT(11) NOT NULL,
	`id_dispositivo`           INT(11) NOT NULL,
	PRIMARY KEY (`id_consumidorDispositivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar consumidores con dispositivos';

ALTER TABLE `tb_consumidor_dispositivo`
ADD CONSTRAINT `tb_consumidor_dispositivo__tb_consumidor`  FOREIGN KEY (`id_consumidor`)  REFERENCES `tb_consumidor`  (`id_consumidor`),
ADD CONSTRAINT `tb_consumidor_dispositivo__tb_dispositivo` FOREIGN KEY (`id_dispositivo`) REFERENCES `tb_dispositivo` (`id_dispositivo`);

CREATE TABLE IF NOT EXISTS `tb_consumidor_sucursal` (
	`id_consumidorSucursal` INT(11) NOT NULL AUTO_INCREMENT,
	`visitaGlobal`          INT(11) NOT NULL DEFAULT '1',
	`visitaActual`          INT(11) NOT NULL DEFAULT '1',
	`id_consumidor`         INT(11) NOT NULL,
	`id_sucursal`           INT(11) NOT NULL,
	`id_usuarioCreador`     INT(11) DEFAULT NULL,
	`id_usuarioModificador` INT(11) DEFAULT NULL,
	PRIMARY KEY (`id_consumidorSucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar consumidores con sucursales';

ALTER TABLE `tb_consumidor_sucursal`
ADD CONSTRAINT `tb_consumidor_sucursal__tb_consumidor` FOREIGN KEY (`id_consumidor`) REFERENCES `tb_consumidor` (`id_consumidor`),
ADD CONSTRAINT `tb_consumidor_sucursal__tb_sucursal`   FOREIGN KEY (`id_sucursal`)   REFERENCES `tb_sucursal`   (`id_sucursal`);

CREATE TABLE IF NOT EXISTS `tb_consumidor_grupo` (
	`id_consumidorGrupo`    INT(11)     NOT NULL AUTO_INCREMENT,
	`id_consumidor`         INT(11)     NOT NULL,
	`id_grupo`              SMALLINT(6) NOT NULL,
	`id_usuarioCreador`     INT(11)     DEFAULT NULL,
	`id_usuarioModificador` INT(11)     DEFAULT NULL,
	PRIMARY KEY (`id_consumidorGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar consumidores con grupos';

ALTER TABLE `tb_consumidor_grupo`
ADD CONSTRAINT `tb_consumidor_grupo__tb_consumidor` FOREIGN KEY (`id_consumidor`) REFERENCES `tb_consumidor` (`id_consumidor`),
ADD CONSTRAINT `tb_consumidor_grupo__tb_grupo`      FOREIGN KEY (`id_grupo`)      REFERENCES `tb_grupo`      (`id_grupo`);

CREATE TABLE IF NOT EXISTS `tb_visitasucursal` (
	`id_visitaSucursal` INT(11)  NOT NULL AUTO_INCREMENT,
	`id_consumidor`     INT(11)  NOT NULL,
	`id_sucursal`       INT(11)  NOT NULL,
	`fechaVisita`       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id_visitaSucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de fechas de visita de consumidores a sucursales';

ALTER TABLE `tb_visitasucursal`
ADD CONSTRAINT `tb_visitasucursal__tb_consumidor` FOREIGN KEY (`id_consumidor`) REFERENCES `tb_consumidor` (`id_consumidor`),
ADD CONSTRAINT `tb_visitasucursal__tb_sucursal`   FOREIGN KEY (`id_sucursal`)   REFERENCES `tb_sucursal`   (`id_sucursal`);

/* TABLAS IMAGEN */
CREATE TABLE IF NOT EXISTS `tb_tipoimagen` (
	`id_tipoImagen`         TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(5)    COLLATE utf8_spanish_ci NOT NULL,
	`id_usuarioCreador`     INT(11)                            DEFAULT NULL,
	`id_usuarioModificador` INT(11)                            DEFAULT NULL,
	`activo`                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoImagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de imagenes';

CREATE TABLE IF NOT EXISTS `tb_tipoimagen_t` (
	`id_tipoImagen_t`       TINYINT(1)                           NOT NULL AUTO_INCREMENT,
	`tipoImagen`            VARCHAR(20)  COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_tipoImagen`         TINYINT(1)                           NOT NULL,
	`id_idioma`             TINYINT(1)                           NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoImagen_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipos de imagenes';

ALTER TABLE `tb_tipoimagen_t`
ADD CONSTRAINT `tb_tipoimagen_t__tb_idioma`     FOREIGN KEY (`id_idioma`)     REFERENCES `tb_idioma`     (`id_idioma`),
ADD CONSTRAINT `tb_tipoimagen_t__tb_tipoimagen` FOREIGN KEY (`id_tipoImagen`) REFERENCES `tb_tipoimagen` (`id_tipoImagen`);

CREATE TABLE IF NOT EXISTS `tb_imagen` (
	`id_imagen`             INT(11)                              NOT NULL AUTO_INCREMENT,
	`imagen`                VARCHAR(255) COLLATE utf8_spanish_ci NOT NULL,
	`fechaRegistro`         DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`fechaActualizacion`    DATETIME                             DEFAULT NULL,
	`id_tipoImagen`         TINYINT(1)                           NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	PRIMARY KEY (`id_imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de imagenes';

ALTER TABLE `tb_imagen`
ADD CONSTRAINT `tb_imagen__tb_tipoimagen` FOREIGN KEY (`id_tipoImagen`) REFERENCES `tb_tipoimagen` (`id_tipoImagen`);
/* */


/* TABLAS VIDEO */
CREATE TABLE IF NOT EXISTS `tb_video` (
	`id_video`              INT(11)                              NOT NULL AUTO_INCREMENT,
	`video`                 VARCHAR(255) COLLATE utf8_spanish_ci NOT NULL,
	`fechaRegistro`         DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`fechaActualizacion`    DATETIME                             DEFAULT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	PRIMARY KEY (`id_video`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de videos';
/* */

/* TABLAS EVENTO */
CREATE TABLE IF NOT EXISTS `tb_evento` (
	`id_evento`             INT(11)                              NOT NULL AUTO_INCREMENT,
	`evento`                VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(300) COLLATE utf8_spanish_ci DEFAULT NULL,
	`fechaInicio`           DATETIME                             NOT NULL,
	`fechaFin`              DATETIME                             DEFAULT NULL,
	`flujo`                 TEXT         COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_usuariod`           INT(11)                              DEFAULT NULL,
    `id_empresa`            INT(11)                              NOT NULL,
	`id_imagen`             INT(11)                              DEFAULT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	`borrado`               TINYINT(1)                           NOT NULL DEFAULT '0',
	PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de eventos';

ALTER TABLE `tb_evento`
ADD CONSTRAINT `tb_evento__tb_usuariod` FOREIGN KEY (`id_usuariod`) REFERENCES `tb_usuariod` (`id_usuarioD`),
ADD CONSTRAINT `tb_evento__tb_empresa`  FOREIGN KEY (`id_empresa`)  REFERENCES `tb_empresa`  (`id_empresa`),
ADD CONSTRAINT `tb_evento__tb_imagen`   FOREIGN KEY (`id_imagen`)   REFERENCES `tb_imagen`   (`id_imagen`);

CREATE TABLE IF NOT EXISTS `tb_evento_dispositivo` (
	`id_eventoDispositivo`  INT(11)    NOT NULL AUTO_INCREMENT,
	`id_evento`             INT(11)    NOT NULL,
	`id_dispositivo`        INT(11)    NOT NULL,
	`id_usuarioCreador`     INT(11)    DEFAULT NULL,
	`id_usuarioModificador` INT(11)    DEFAULT NULL,
	`activo`                TINYINT(1) NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_eventoDispositivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar eventos con dispositivos';

ALTER TABLE `tb_evento_dispositivo`
ADD CONSTRAINT `tb_evento_dispositivo__tb_dispositivo` FOREIGN KEY (`id_dispositivo`) REFERENCES `tb_dispositivo` (`id_dispositivo`),
ADD CONSTRAINT `tb_evento_dispositivo__tb_evento`      FOREIGN KEY (`id_evento`)      REFERENCES `tb_evento`      (`id_evento`);

CREATE TABLE IF NOT EXISTS `tb_evento_sucursal` (
	`id_eventoSucursal`     INT(11)    NOT NULL AUTO_INCREMENT,
	`id_evento`             INT(11)    NOT NULL,
	`id_sucursal`           INT(11)    NOT NULL,
	`id_usuarioCreador`     INT(11)    DEFAULT NULL,
	`id_usuarioModificador` INT(11)    DEFAULT NULL,
	`activo`                TINYINT(1) NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_eventoSucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar eventos a sucursales';

ALTER TABLE `tb_evento_sucursal`
ADD CONSTRAINT `tb_evento_sucursal__tb_evento`   FOREIGN KEY (`id_evento`)   REFERENCES `tb_evento`   (`id_evento`),
ADD CONSTRAINT `tb_evento_sucursal__tb_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `tb_sucursal` (`id_sucursal`);

CREATE TABLE IF NOT EXISTS `tb_consumidor_evento` (
	`id_consumidorEvento`   INT(11) NOT NULL AUTO_INCREMENT,
	`visitaGlobal`          INT(11) NOT NULL DEFAULT '1',
	`visitaActual`          INT(11) NOT NULL DEFAULT '1',
	`id_consumidor`         INT(11) NOT NULL,
	`id_evento`             INT(11) NOT NULL,
	`id_usuarioCreador`     INT(11) DEFAULT NULL,
	`id_usuarioModificador` INT(11) DEFAULT NULL,
	PRIMARY KEY (`id_consumidorEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar consumidores con eventos';

ALTER TABLE `tb_consumidor_evento`
ADD CONSTRAINT `tb_consumidor_evento__tb_consumidor` FOREIGN KEY (`id_consumidor`) REFERENCES `tb_consumidor` (`id_consumidor`),
ADD CONSTRAINT `tb_consumidor_evento__tb_evento`     FOREIGN KEY (`id_evento`)     REFERENCES `tb_evento`     (`id_evento`);

CREATE TABLE IF NOT EXISTS `tb_visitaevento` (
	`id_visitaEvento`       INT(11)  NOT NULL AUTO_INCREMENT,
	`id_consumidor`         INT(11)  NOT NULL,
	`id_evento`             INT(11)  NOT NULL,
	`fechaVisita`           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id_visitaEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de fechas de visitas de consumidores a eventos';

ALTER TABLE `tb_visitaevento`
ADD CONSTRAINT `tb_visitaevento__tb_consumidor` FOREIGN KEY (`id_consumidor`) REFERENCES `tb_consumidor` (`id_consumidor`),
ADD CONSTRAINT `tb_visitaevento__tb_evento`     FOREIGN KEY (`id_evento`)     REFERENCES `tb_evento`     (`id_evento`);
/* */

/* TABLAS NODO */
CREATE TABLE IF NOT EXISTS `tb_tiponodo` (
	`id_tipoNodo`           TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(5)    COLLATE utf8_spanish_ci NOT NULL,
	`id_imagen`             INT(11)                            DEFAULT NULL,
	`id_usuarioCreador`     INT(11)                            DEFAULT NULL,
	`id_usuarioModificador` INT(11)                            DEFAULT NULL,
	`activo`                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoNodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tipos de nodos';

ALTER TABLE `tb_tiponodo`
ADD CONSTRAINT `tb_tiponodo__tb_imagen` FOREIGN KEY (`id_imagen`) REFERENCES `tb_imagen` (`id_imagen`);

CREATE TABLE IF NOT EXISTS `tb_tiponodo_t` (
	`id_tipoNodo_t`         TINYINT(1)                           NOT NULL AUTO_INCREMENT,
	`tipoNodo`              VARCHAR(20)  COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_tipoNodo`           TINYINT(1)                           NOT NULL,
	`id_idioma`             TINYINT(1)                           NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoNodo_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipos de nodos';

ALTER TABLE `tb_tiponodo_t`
ADD CONSTRAINT `tb_tiponodo_t__tb_idioma`   FOREIGN KEY (`id_idioma`)   REFERENCES `tb_idioma`   (`id_idioma`),
ADD CONSTRAINT `tb_tiponodo_t__tb_tiponodo` FOREIGN KEY (`id_tipoNodo`) REFERENCES `tb_tiponodo` (`id_tipoNodo`);

CREATE TABLE IF NOT EXISTS `tb_nodo` (
	`id_nodo`               INT(11)                             NOT NULL AUTO_INCREMENT,
    `alias`                 VARCHAR(25) COLLATE utf8_spanish_ci DEFAULT NULL,
	`inicio`                TINYINT(1)                          NOT NULL DEFAULT '0',
	`condicion`             TINYINT(1)                          NOT NULL DEFAULT '0',
	`id_evento`             INT(11)                             NOT NULL,
	`id_tipoNodo`           TINYINT(1)                          NOT NULL,
	`id_objeto`             INT(11)                             DEFAULT NULL,
	`id_tipoNodoPadre`      TINYINT(1)                          DEFAULT NULL,
	`id_objetoPadre`        INT(11)                             DEFAULT NULL,
	`id_usuarioCreador`     INT(11)                             DEFAULT NULL,
	`id_usuarioModificador` INT(11)                             DEFAULT NULL,
	`activo`                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_nodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de nodos';

ALTER TABLE `tb_nodo`
ADD CONSTRAINT `tb_nodo__tb_evento`        FOREIGN KEY (`id_evento`)   REFERENCES `tb_evento`   (`id_evento`),
ADD CONSTRAINT `tb_nodo__tb_tiponodo`      FOREIGN KEY (`id_tipoNodo`) REFERENCES `tb_tiponodo` (`id_tipoNodo`),
ADD CONSTRAINT `tb_nodo__tb_tiponodopadre` FOREIGN KEY (`id_tipoNodo`) REFERENCES `tb_tiponodo` (`id_tipoNodo`);

CREATE TABLE IF NOT EXISTS `tb_vertice` (
    `id_vertice`   INT(11)    NOT NULL AUTO_INCREMENT,
    `id_nodoHijo`  INT(11)    NOT NULL,
    `id_nodoPadre` INT(11)    DEFAULT NULL,
	`activo`       TINYINT(1) NOT NULL DEFAULT '1',
    PRIMARY KEY (`id_vertice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de vertices';

ALTER TABLE `tb_vertice`
ADD CONSTRAINT `tb_vertice__tb_nodo`      FOREIGN KEY (`id_nodoHijo`)  REFERENCES `tb_nodo` (`id_nodo`),
ADD CONSTRAINT `tb_vertice__tb_nodopadre` FOREIGN KEY (`id_nodoPadre`) REFERENCES `tb_nodo` (`id_nodo`);

CREATE TABLE IF NOT EXISTS `tb_consumidor_nodo` (
	`id_consumidorNodo` INT(11) NOT NULL AUTO_INCREMENT,
	`id_consumidor`     INT(11) NOT NULL,
	`id_nodo`           INT(11) NOT NULL,
	`visitaGlobal`    INT(11) NOT NULL DEFAULT '1',
	`visitaActual`    INT(11) NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_consumidorNodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar consumidores con nodos';

ALTER TABLE `tb_consumidor_nodo`
ADD CONSTRAINT `tb_consumidor_nodo__tb_consumidor` FOREIGN KEY (`id_consumidor`) REFERENCES `tb_consumidor` (`id_consumidor`),
ADD CONSTRAINT `tb_consumidor_nodo__tb_nodo`       FOREIGN KEY (`id_nodo`)       REFERENCES `tb_nodo`       (`id_nodo`);

CREATE TABLE IF NOT EXISTS `tb_visitanodo` (
	`id_visitaNodo`     INT(11)  NOT NULL AUTO_INCREMENT,
	`id_consumidor`     INT(11)  NOT NULL,
	`id_nodo`           INT(11)  NOT NULL,
	`fechaVisita`       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id_visitaNodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de fechas de visitas de consumidores a nodos de tipo check-in';

ALTER TABLE `tb_visitanodo`
ADD CONSTRAINT `tb_visitanodo__tb_consumidor` FOREIGN KEY (`id_consumidor`) REFERENCES `tb_consumidor` (`id_consumidor`),
ADD CONSTRAINT `tb_visitanodo__tb_nodo`       FOREIGN KEY (`id_nodo`)       REFERENCES `tb_nodo`       (`id_nodo`);

CREATE TABLE IF NOT EXISTS `tb_tipotiempoespera` (
	`id_tipoTiempoEspera`   SMALLINT(6)                     NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(5) COLLATE utf8_spanish_ci NOT NULL,
	`id_usuarioCreador`     INT(11)                         DEFAULT NULL,
	`id_usuarioModificador` INT(11)                         DEFAULT NULL,
	`activo`                TINYINT(1)                      NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoTiempoEspera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tipos de tiempos de espera';

CREATE TABLE IF NOT EXISTS `tb_tipotiempoespera_t` (
	`id_tipoTiempoEspera_t` SMALLINT(6)                          NOT NULL AUTO_INCREMENT,
	`tipoTiempoEspera`      VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_tipoTiempoEspera`   SMALLINT(6)                          NOT NULL,
	`id_idioma`             TINYINT(1)                           NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoTiempoEspera_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipos de tiempos de espera';

ALTER TABLE `tb_tipotiempoespera_t`
ADD CONSTRAINT `tb_tipotiempoespera_t__tb_idioma`           FOREIGN KEY (`id_idioma`)           REFERENCES `tb_idioma`           (`id_idioma`),
ADD CONSTRAINT `tb_tipotiempoespera_t__tb_tipotiempoespera` FOREIGN KEY (`id_tipoTiempoEspera`) REFERENCES `tb_tipotiempoespera` (`id_tipoTiempoEspera`);

CREATE TABLE IF NOT EXISTS `tb_tiempoespera` (
	`id_tiempoespera`       SMALLINT(6) NOT NULL AUTO_INCREMENT,
	`tiempoespera`          INT(11)     NOT NULL,
	`id_tipoTiempoEspera`   SMALLINT(6) NOT NULL,
	`id_usuarioCreador`     INT(11)     DEFAULT NULL,
	`id_usuarioModificador` INT(11)     DEFAULT NULL,
	PRIMARY KEY (`id_tiempoespera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tiempos de espera';

ALTER TABLE `tb_tiempoespera`
ADD CONSTRAINT `tb_tiempoespera__tb_tipotiempoespera` FOREIGN KEY (`id_tipoTiempoEspera`) REFERENCES `tb_tipotiempoespera` (`id_tipoTiempoEspera`);

CREATE TABLE IF NOT EXISTS `tb_checkin` (
	`id_checkin`            INT(11)    NOT NULL AUTO_INCREMENT,
	`background`            INT(11)    NOT NULL,
	`teclado`               INT(11)    NOT NULL,
	`fechaInicio`           DATETIME   NOT NULL,
	`fechaFin`              DATETIME   DEFAULT NULL,
	`contador`              INT(11)    NOT NULL DEFAULT '0',
	`id_usuarioCreador`     INT(11)    DEFAULT NULL,
	`id_usuarioModificador` INT(11)    DEFAULT NULL,
	PRIMARY KEY (`id_checkin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de nodo tipo checkin';

ALTER TABLE `tb_checkin`
ADD CONSTRAINT `tb_checkin__tb_imagen_b` FOREIGN KEY (`background`) REFERENCES `tb_imagen` (`id_imagen`),
ADD CONSTRAINT `tb_checkin__tb_imagen_k` FOREIGN KEY (`teclado`)    REFERENCES `tb_imagen` (`id_imagen`);

CREATE TABLE IF NOT EXISTS `tb_tipopregunta` (
	`id_tipoPregunta`       TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(5)    COLLATE utf8_spanish_ci NOT NULL,
	`id_usuarioCreador`     INT(11)                            DEFAULT NULL,
	`id_usuarioModificador` INT(11)                            DEFAULT NULL,
	`activo`                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoPregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tipos de preguntas';

CREATE TABLE IF NOT EXISTS `tb_tipopregunta_t` (
	`id_tipoPregunta_t`     TINYINT(1)                           NOT NULL AUTO_INCREMENT,
	`tipoPregunta`          VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_tipoPregunta`       TINYINT(1)                           NOT NULL,
	`id_idioma`             TINYINT(1)                           NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoPregunta_t`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipos de preguntas';

ALTER TABLE `tb_tipopregunta_t`
ADD CONSTRAINT `tb_tipopregunta_t__tb_idioma`       FOREIGN KEY (`id_idioma`)       REFERENCES `tb_idioma`       (`id_idioma`),
ADD CONSTRAINT `tb_tipopregunta_t__tb_tipopregunta` FOREIGN KEY (`id_tipoPregunta`) REFERENCES `tb_tipopregunta` (`id_tipoPregunta`);

CREATE TABLE IF NOT EXISTS `tb_pregunta` (
	`id_pregunta`           INT(11)                              NOT NULL AUTO_INCREMENT,
	`background`            INT(11)                              NOT NULL,
	`pregunta`              VARCHAR(200) COLLATE utf8_spanish_ci NOT NULL,
	`fechaInicio`           DATETIME                             NOT NULL,
	`fechaFin`              DATETIME                             DEFAULT NULL,
	`id_tipoPregunta`       TINYINT(1)                           NOT NULL,
	`id_tiempoEspera`       SMALLINT(11)                         DEFAULT NULL,
	`contador`              INT(11)                              NOT NULL DEFAULT '0',
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	PRIMARY KEY (`id_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de preguntas';

ALTER TABLE `tb_pregunta`
ADD CONSTRAINT `tb_pregunta__tb_imagen`       FOREIGN KEY (`background`)      REFERENCES `tb_imagen`       (`id_imagen`),
ADD CONSTRAINT `tb_pregunta__tb_tipopregunta` FOREIGN KEY (`id_tipoPregunta`) REFERENCES `tb_tipopregunta` (`id_tipoPregunta`);

CREATE TABLE IF NOT EXISTS `tb_respuestaopcion` (
	`id_respuestaOpcion`    INT(11)                             NOT NULL AUTO_INCREMENT,
	`respuestaOpcion`       VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
	`correcta`              TINYINT(1)                          NOT NULL DEFAULT '0',
	`id_pregunta`           INT(11)                             NOT NULL,
	`id_usuarioCreador`     INT(11)                             DEFAULT NULL,
	`id_usuarioModificador` INT(11)                             DEFAULT NULL,
	`activo`                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_respuestaOpcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de opciones de respuestas';

ALTER TABLE `tb_respuestaopcion`
ADD CONSTRAINT `tb_respuestaopcion__tb_pregunta` FOREIGN KEY (`id_pregunta`) REFERENCES `tb_pregunta` (`id_pregunta`);

CREATE TABLE IF NOT EXISTS `tb_respuesta` (
	`id_respuesta`  INT(11)                             NOT NULL AUTO_INCREMENT,
	`respuesta`     VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
	`puntuacion`    INT(11)                             NOT NULL DEFAULT '0',
	`fechaRegistro` DATETIME                            NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`correcta`      TINYINT(1)                          NOT NULL DEFAULT '0',
	`id_pregunta`   INT(11)                             NOT NULL,
	`id_consumidor` INT(11)                             NOT NULL,
	PRIMARY KEY (`id_respuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de respuestas';

ALTER TABLE `tb_respuesta`
ADD CONSTRAINT `tb_respuesta__tb_pregunta`   FOREIGN KEY (`id_pregunta`)   REFERENCES `tb_pregunta`   (`id_pregunta`),
ADD CONSTRAINT `tb_respuesta__tb_consumidor` FOREIGN KEY (`id_consumidor`) REFERENCES `tb_consumidor` (`id_consumidor`);

CREATE TABLE IF NOT EXISTS `tb_tipomensaje` (
	`id_tipoMensaje`        TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(5)    COLLATE utf8_spanish_ci NOT NULL,
	`id_usuarioCreador`     INT(11)                            DEFAULT NULL,
	`id_usuarioModificador` INT(11)                            DEFAULT NULL,
	`activo`                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoMensaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tipos de mensajes';

CREATE TABLE IF NOT EXISTS `tb_tipomensaje_t` (
	`id_tipoMensaje_t`      TINYINT(1)                           NOT NULL AUTO_INCREMENT,
	`tipoMensaje`           VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_tipoMensaje`        TINYINT(1)                           NOT NULL,
	`id_idioma`             TINYINT(1)                           NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoMensaje_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipos de mensajes';

ALTER TABLE `tb_tipomensaje_t`
ADD CONSTRAINT `tb_tipomensaje_t__tb_idioma`      FOREIGN KEY (`id_idioma`)      REFERENCES `tb_idioma`      (`id_idioma`),
ADD CONSTRAINT `tb_tipomensaje_t__tb_tipomensaje` FOREIGN KEY (`id_tipoMensaje`) REFERENCES `tb_tipomensaje` (`id_tipoMensaje`);

CREATE TABLE IF NOT EXISTS `tb_mensaje` (
	`id_mensaje`            INT(11)                              NOT NULL AUTO_INCREMENT,
	`mensaje`               VARCHAR(500) COLLATE utf8_spanish_ci NOT NULL,
	`fechaInicio`           DATETIME                             NOT NULL,
	`fechaFin`              DATETIME                             DEFAULT NULL,
	`id_tipoMensaje`        TINYINT(1)                           NOT NULL,
	`id_tiempoEspera`       SMALLINT(6)                          DEFAULT NULL,
	`contador`              INT(11)                              NOT NULL DEFAULT '0',
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	PRIMARY KEY (`id_mensaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de mensajes';

ALTER TABLE `tb_mensaje`
ADD CONSTRAINT `tb_mensaje__tb_tipoMensaje` FOREIGN KEY (`id_tipoMensaje`) REFERENCES `tb_tipomensaje` (`id_tipoMensaje`);

CREATE TABLE IF NOT EXISTS `tb_formularioconsumidor` (
	`id_formularioConsumidor` INT(11)    NOT NULL AUTO_INCREMENT,
	`fechaInicio`             DATETIME   DEFAULT NULL,
	`fechaFin`                DATETIME   DEFAULT NULL,
	`nombres`                 TINYINT(1) NOT NULL DEFAULT '0',
	`apellidos`               TINYINT(1) NOT NULL DEFAULT '0',
	`correo`                  TINYINT(1) NOT NULL DEFAULT '0',
	`twitter`                 TINYINT(1) NOT NULL DEFAULT '0',
	`facebook`                TINYINT(1) NOT NULL DEFAULT '0',
	`edad`                    TINYINT(1) NOT NULL DEFAULT '0',
	`sexo`                    TINYINT(1) NOT NULL DEFAULT '0',
	`ciudad`                  TINYINT(1) NOT NULL DEFAULT '0',
	`contador`                INT(11)    NOT NULL DEFAULT '0',
	`id_usuarioCreador`       INT(11)    DEFAULT NULL,
	`id_usuarioModificador`   INT(11)    DEFAULT NULL,
	PRIMARY KEY (`id_formularioConsumidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de formularios de consumidor';

CREATE TABLE IF NOT EXISTS `tb_mensajepantalla` (
	`id_mensajePantalla`    INT(11)      NOT NULL AUTO_INCREMENT,
	`background`            INT(11)      DEFAULT NULL,
	`video`                 INT(11)      DEFAULT NULL,
	`mensaje`               VARCHAR(500) DEFAULT NULL,
	`fechaInicio`           DATETIME     NOT NULL,
	`fechaFin`              DATETIME     DEFAULT NULL,
	`id_tiempoEspera`       SMALLINT(6)  DEFAULT NULL,
	`contador`              INT(11)      NOT NULL DEFAULT '0',
	`id_usuarioCreador`     INT(11)      DEFAULT NULL,
	`id_usuarioModificador` INT(11)      DEFAULT NULL,
	PRIMARY KEY (`id_mensajePantalla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de mensajes de pantallas';

ALTER TABLE `tb_mensajepantalla`
ADD CONSTRAINT `tb_mensajepantalla__tb_imagen` FOREIGN KEY (`background`) REFERENCES `tb_imagen` (`id_imagen`),
ADD CONSTRAINT `tb_mensajepantalla__tb_video`  FOREIGN KEY (`video`)      REFERENCES `tb_video`  (`id_video`);

CREATE TABLE IF NOT EXISTS `tb_tipoinvitacion` (
	`id_tipoInvitacion`     TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(5)    COLLATE utf8_spanish_ci NOT NULL,
	`id_usuarioCreador`     INT(11)                            DEFAULT NULL,
	`id_usuarioModificador` INT(11)                            DEFAULT NULL,
	`activo`                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoInvitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tipos de invitacion';

CREATE TABLE IF NOT EXISTS `tb_tipoinvitacion_t` (
	`id_tipoInvitacion_t`   TINYINT(1)                           NOT NULL AUTO_INCREMENT,
	`tipoInvitacion`        VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_tipoInvitacion`     TINYINT(1)                           NOT NULL,
	`id_idioma`             TINYINT(1)                           NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoInvitacion_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipos de invitacion';

ALTER TABLE `tb_tipoinvitacion_t`
ADD CONSTRAINT `tb_tipoinvitacion_t__tb_idioma`         FOREIGN KEY (`id_idioma`)         REFERENCES `tb_idioma`         (`id_idioma`),
ADD CONSTRAINT `tb_tipoinvitacion_t__tb_tipoinvitacion` FOREIGN KEY (`id_tipoInvitacion`) REFERENCES `tb_tipoinvitacion` (`id_tipoInvitacion`);

CREATE TABLE IF NOT EXISTS `tb_invitacion` (
	`id_invitacion`         INT(11)      NOT NULL AUTO_INCREMENT,
	`fechaInicio`           DATETIME     NOT NULL,
	`fechaFin`              DATETIME     DEFAULT NULL,
	`nota`                  VARCHAR(500) DEFAULT NULL,
	`abierta`               TINYINT(1)   NOT NULL DEFAULT '0',
	`id_tipoInvitacion`     TINYINT(1)   NOT NULL,
	`contador`              INT(11)      NOT NULL DEFAULT '0',
	`id_usuarioCreador`     INT(11)      DEFAULT NULL,
	`id_usuarioModificador` INT(11)      DEFAULT NULL,
	PRIMARY KEY (`id_invitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de nodos de invitacion';

ALTER TABLE `tb_invitacion`
ADD CONSTRAINT `tb_invitacion__tb_tipoinvitacion` FOREIGN KEY (`id_tipoInvitacion`) REFERENCES `tb_tipoinvitacion` (`id_tipoInvitacion`);

CREATE TABLE IF NOT EXISTS `tb_datosinvitacion` (
	`id_datosInvitacion`    INT(11)                              NOT NULL AUTO_INCREMENT,
	`nombres`               VARCHAR(150) COLLATE utf8_spanish_ci DEFAULT NULL,
	`apellidos`             VARCHAR(150) COLLATE utf8_spanish_ci DEFAULT NULL,
	`identificacion`        VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	`invitacion`            INT(11)                              NOT NULL DEFAULT '1',
	`fechaInicio`           DATETIME                             NOT NULL,
	`fechaFin`              DATETIME                             DEFAULT NULL,
 	`id_invitacion`         INT(11)                              NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	PRIMARY KEY (`id_datosInvitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de datos de invitados';

ALTER TABLE `tb_datosinvitacion`
ADD CONSTRAINT `tb_datosinvitacion__tb_invitacion` FOREIGN KEY (`id_datosInvitacion`) REFERENCES `tb_invitacion` (`id_invitacion`);
/* */




/* TABLAS CONFIGURACION */
CREATE TABLE IF NOT EXISTS `tb_configuracionflujo` (
	`id_configuracionFlujo` INT(11)    NOT NULL AUTO_INCREMENT,
	`nivel`                 INT(11)    NOT NULL,
	`id_tipoNodoActual`     TINYINT(1) NOT NULL,
	`id_tipoNodoPosible`    TINYINT(1) NOT NULL,
	`id_usuarioCreador`     INT(11)    DEFAULT NULL,
	`id_usuarioModificador` INT(11)    DEFAULT NULL,
	PRIMARY KEY (`id_configuracionFlujo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla de configuracion de flujos';

ALTER TABLE `tb_configuracionflujo`
ADD CONSTRAINT `tb_configuracionflujo__tb_tiponodoA` FOREIGN KEY (`id_tipoNodoActual`)  REFERENCES `tb_tiponodo` (`id_tipoNodo`),
ADD CONSTRAINT `tb_configuracionflujo__tb_tiponodoB` FOREIGN KEY (`id_tipoNodoPosible`) REFERENCES `tb_tiponodo` (`id_tipoNodo`);

CREATE TABLE IF NOT EXISTS `tb_configuracionnodo` (
	`id_configuracionNodo`  INT(11)    NOT NULL AUTO_INCREMENT,
	`id_tipoNodo`           TINYINT(1) NOT NULL,
	`cantidadMaxima`        INT(11)    NOT NULL,
	`id_usuarioCreador`     INT(11)    DEFAULT NULL,
	`id_usuarioModificador` INT(11)    DEFAULT NULL,
	PRIMARY KEY (`id_configuracionNodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla de configuracion de nodos';

ALTER TABLE `tb_configuracionnodo`
ADD CONSTRAINT `tb_configuracionnodo__tb_tiponodo` FOREIGN KEY (`id_tipoNodo`)  REFERENCES `tb_tiponodo` (`id_tipoNodo`);

CREATE TABLE IF NOT EXISTS `tb_plantilla` (
	`id_plantilla`          INT(11)                             NOT NULL AUTO_INCREMENT,
	`plantilla`             VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
	`fechaRegistro`         DATETIME                            NOT NULL DEFAULT CURRENT_TIMESTAMP,   	
	`id_nodo`               INT(11)                             NOT NULL,
	`id_distribuidor`       INT(11)                             DEFAULT NULL,
	`id_usuariod`           INT(11)                             NOT NULL,
	`id_usuarioCreador`     INT(11)                             DEFAULT NULL,
	`id_usuarioModificador` INT(11)                             DEFAULT NULL,
	`publico`               TINYINT(1)                          NOT NULL DEFAULT '0',
	PRIMARY KEY (`id_plantilla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de plantillas';

ALTER TABLE `tb_plantilla`
ADD CONSTRAINT `tb_plantilla__tb_nodo`         FOREIGN KEY (`id_nodo`)         REFERENCES `tb_nodo`         (`id_nodo`),
ADD CONSTRAINT `tb_plantilla__tb_distribuidor` FOREIGN KEY (`id_distribuidor`) REFERENCES `tb_distribuidor` (`id_distribuidor`),
ADD CONSTRAINT `tb_plantilla__tb_usuariod`     FOREIGN KEY (`id_usuariod`)     REFERENCES `tb_usuariod`     (`id_usuariod`);
/* */

/* TABLAS LOG */
CREATE TABLE IF NOT EXISTS `tb_eventolog` (
	`id_eventoLog`  INT(11)                          NOT NULL AUTO_INCREMENT,
	`id_evento`     INT(11)                          NOT NULL,
	`id_nodoInicio` INT(11)                          NOT NULL,
	`id_usuariod`   INT(11)                          NOT NULL,
	`fechaRegistro` DATETIME                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`version`       INT(11)                          NOT NULL DEFAULT '1',
	`flujo`         TEXT     COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_eventoLog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para log de eventos con nodos';

CREATE TABLE IF NOT EXISTS `tb_nodolog` (
	`id_nodoLog`       INT(11)                             NOT NULL AUTO_INCREMENT,
	`fechaRegistro`    DATETIME                            NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`respuesta`        VARCHAR(50) COLLATE utf8_spanish_ci DEFAULT NULL,
	`correcto`         TINYINT(1)                          NOT NULL DEFAULT '0',
	`condicion`        TINYINT(1)                          NOT NULL DEFAULT '0',
	`id_evento`        INT(11)                             NOT NULL,
	`id_sucursal`      INT(11)                             NOT NULL,
	`id_dispositivo`   INT(11)                             NOT NULL,
	`id_nodo`          INT(11)                             NOT NULL,
	`id_tipoNodo`      TINYINT(1)                          NOT NULL,
	`id_objeto`        INT(11)                             DEFAULT NULL,
	`id_tipoNodoPadre` TINYINT(1)                          DEFAULT NULL,
	`id_objetoPadre`   INT(11)                             DEFAULT NULL,
	`id_consumidor`    INT(11)                             NOT NULL,
	PRIMARY KEY (`id_nodoLog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para log de nodos';
/* */


CREATE TABLE IF NOT EXISTS `tb_tipocondicion` (
	`id_tipoCondicion`      TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(5)    COLLATE utf8_spanish_ci NOT NULL,
	`id_usuarioCreador`     INT(11)                            DEFAULT NULL,
	`id_usuarioModificador` INT(11)                            DEFAULT NULL,
	`activo`                TINYINT(1)                         NOT NULL DEFAULT '0',
	PRIMARY KEY (`id_tipoCondicion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tipos de condicion';

CREATE TABLE IF NOT EXISTS `tb_tipocondicion_t` (
	`id_tipoCondicion_t`    TINYINT(1)                          NOT NULL AUTO_INCREMENT,
	`tipoCondicion`         VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
	`id_tipoCondicion`      TINYINT(1)                          NOT NULL,
	`id_idioma`             TINYINT(1)                          NOT NULL,
	`id_usuarioCreador`     INT(11)                             DEFAULT NULL,
	`id_usuarioModificador` INT(11)                             DEFAULT NULL,
	`activo`                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoCondicion_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipo de condicion';

ALTER TABLE `tb_tipocondicion_t`
ADD CONSTRAINT `tb_tipocondicion_t__tb_tipocondicion` FOREIGN KEY (`id_tipoCondicion`) REFERENCES `tb_tipocondicion` (`id_tipoCondicion`),
ADD CONSTRAINT `tb_tipocondicion_t__tb_idioma`        FOREIGN KEY (`id_idioma`)        REFERENCES `tb_idioma`        (`id_idioma`);

CREATE TABLE IF NOT EXISTS `tb_tipovariable` (
	`id_tipoVariable`       TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	`codigo`                CHAR(5)    COLLATE utf8_spanish_ci NOT NULL,
	`id_usuarioCreador`     INT(11)                            DEFAULT NULL,
	`id_usuarioModificador` INT(11)                            DEFAULT NULL,
	`activo`                TINYINT(1)                         NOT NULL DEFAULT '0',
	PRIMARY KEY (`id_tipoVariable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tipos de variable';

CREATE TABLE IF NOT EXISTS `tb_tipovariable_t` (
	`id_tipoVariable_t`     TINYINT(1)                          NOT NULL AUTO_INCREMENT,
	`tipoVariable`          VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
	`id_tipoVariable`       TINYINT(1)                          NOT NULL,
	`id_idioma`             TINYINT(1)                          NOT NULL,
	`id_usuarioCreador`     INT(11)                             DEFAULT NULL,
	`id_usuarioModificador` INT(11)                             DEFAULT NULL,
	`activo`                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoVariable_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipos de variable';

ALTER TABLE `tb_tipovariable_t`
ADD CONSTRAINT `tb_tipovariable_t__tb_tipovariable` FOREIGN KEY (`id_tipoVariable`) REFERENCES `tb_tipovariable` (`id_tipoVariable`),
ADD CONSTRAINT `tb_tipovariable_t__tb_idioma`       FOREIGN KEY (`id_idioma`)       REFERENCES `tb_idioma`       (`id_idioma`);

CREATE TABLE IF NOT EXISTS `tb_condicionnodo` (
	`id_condicionNodo`      INT(11)     NOT NULL AUTO_INCREMENT,
	`id_nodo`               INT(11)     NOT NULL,
	`id_nodoHijo`           INT(11)     NOT NULL,
	`id_tipoCondicion`      TINYINT(1)  NOT NULL,
	`id_tipoVariable`       TINYINT(1)  NOT NULL,
	`valor`                 VARCHAR(50) DEFAULT NULL,
	`id_usuarioCreador`     INT(11)     DEFAULT NULL,
	`id_usuarioModificador` INT(11)     DEFAULT NULL,
	PRIMARY KEY (`id_condicionNodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de condiciones de nodos';

ALTER TABLE `tb_condicionnodo`
ADD CONSTRAINT `tb_condicionnodo__tb_nodoA`         FOREIGN KEY (`id_nodo`)          REFERENCES `tb_nodo`          (`id_nodo`),
ADD CONSTRAINT `tb_condicionnodo__tb_nodoB`         FOREIGN KEY (`id_nodoHijo`)      REFERENCES `tb_nodo`          (`id_nodo`),
ADD CONSTRAINT `tb_condicionnodo__tb_tipocondicion` FOREIGN KEY (`id_tipoCondicion`) REFERENCES `tb_tipocondicion` (`id_tipoCondicion`),
ADD CONSTRAINT `tb_condicionnodo__tb_tipovariable`  FOREIGN KEY (`id_tipoVariable`)  REFERENCES `tb_tipovariable`  (`id_tipoVariable`);


/* AUDITORIA */
CREATE TABLE IF NOT EXISTS `tb_tipoauditoria` (
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL AUTO_INCREMENT,
	`codigo`           CHAR(3)    COLLATE utf8_spanish_ci NOT NULL,
	`activo`           TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoAuditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tipo de auditoria';

CREATE TABLE IF NOT EXISTS `tb_tipoauditoria_t` (
	`id_tipoAuditoria_t`    TINYINT(1)                           NOT NULL AUTO_INCREMENT,
	`tipoAuditoria`         VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	`descripcion`           VARCHAR(200) COLLATE utf8_spanish_ci NOT NULL,
	`id_tipoAuditoria`      TINYINT(1)                           NOT NULL,
	`id_idioma`             TINYINT(1)                           NOT NULL,
	`id_usuarioCreador`     INT(11)                              DEFAULT NULL,
	`id_usuarioModificador` INT(11)                              DEFAULT NULL,
	`activo`                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_tipoAuditoria_t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipos de auditoria';

ALTER TABLE `tb_tipoauditoria_t`
ADD CONSTRAINT `tb_tipoauditoria_t__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`),
ADD CONSTRAINT `tb_tipoauditoria_t__tb_idioma`        FOREIGN KEY (`id_idioma`)        REFERENCES `tb_idioma`        (`id_idioma`);

CREATE TABLE IF NOT EXISTS `tb_auditoriaidioma` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de idiomas';

ALTER TABLE `tb_auditoriaidioma`
ADD CONSTRAINT `tb_auditoriaidioma__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriapais` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de paises';

ALTER TABLE `tb_auditoriapais`
ADD CONSTRAINT `tb_auditoriapais__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriaestado` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de estados';

ALTER TABLE `tb_auditoriaestado`
ADD CONSTRAINT `tb_auditoriaestado__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriaciudad` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de ciudades';

ALTER TABLE `tb_auditoriaciudad`
ADD CONSTRAINT `tb_auditoriaciudad__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriaperfil` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de perfiles';

ALTER TABLE `tb_auditoriaperfil`
ADD CONSTRAINT `tb_auditoriaperfil__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriasexo` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de sexos';

ALTER TABLE `tb_auditoriasexo`
ADD CONSTRAINT `tb_auditoriasexo__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriagrupo` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de grupos';

ALTER TABLE `tb_auditoriagrupo`
ADD CONSTRAINT `tb_auditoriagrupo__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriacontrolador` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de controladores';

ALTER TABLE `tb_auditoriacontrolador`
ADD CONSTRAINT `tb_auditoriacontrolador__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriavista` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de vistas';

ALTER TABLE `tb_auditoriavista`
ADD CONSTRAINT `tb_auditoriavista__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriausuario` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de usuarios';

ALTER TABLE `tb_auditoriausuario`
ADD CONSTRAINT `tb_auditoriausuario__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriasuperdistribuidor` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de super distribuidores';

ALTER TABLE `tb_auditoriasuperdistribuidor`
ADD CONSTRAINT `tb_auditoriasuperdistribuidor__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriadistribuidor` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de distribuidores';

ALTER TABLE `tb_auditoriadistribuidor`
ADD CONSTRAINT `tb_auditoriadistribuidor__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriaempresa` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de empresas';

ALTER TABLE `tb_auditoriaempresa`
ADD CONSTRAINT `tb_auditoriaempresa__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriasucursal` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de sucursales';

ALTER TABLE `tb_auditoriasucursal`
ADD CONSTRAINT `tb_auditoriasucursal__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriausuariod` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de informacion de usuarios';

ALTER TABLE `tb_auditoriausuariod`
ADD CONSTRAINT `tb_auditoriausuariod__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriadispositivo` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de dispositivos';

ALTER TABLE `tb_auditoriadispositivo`
ADD CONSTRAINT `tb_auditoriadispositivo__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriamodem` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de modems';

ALTER TABLE `tb_auditoriamodem`
ADD CONSTRAINT `tb_auditoriamodem__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriaconsumidor` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de consumidores';

ALTER TABLE `tb_auditoriaconsumidor`
ADD CONSTRAINT `tb_auditoriaconsumidor__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriamultimedia` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de multimedia';

ALTER TABLE `tb_auditoriamultimedia`
ADD CONSTRAINT `tb_auditoriamultimedia__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriaevento` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de eventos';

ALTER TABLE `tb_auditoriaevento`
ADD CONSTRAINT `tb_auditoriaevento__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditorianodo` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de nodos';

ALTER TABLE `tb_auditorianodo`
ADD CONSTRAINT `tb_auditorianodo__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriatiempoespera` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de tiempos de espera';

ALTER TABLE `tb_auditoriatiempoespera`
ADD CONSTRAINT `tb_auditoriatiempoespera__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriacheckin` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de check in';

ALTER TABLE `tb_auditoriacheckin`
ADD CONSTRAINT `tb_auditoriacheckin__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriapregunta` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de preguntas';

ALTER TABLE `tb_auditoriapregunta`
ADD CONSTRAINT `tb_auditoriapregunta__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriamensaje` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de mensaje';

ALTER TABLE `tb_auditoriamensaje`
ADD CONSTRAINT `tb_auditoriamensaje__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriaformularioconsumidor` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de formularios';

ALTER TABLE `tb_auditoriaformularioconsumidor`
ADD CONSTRAINT `tb_auditoriaformularioconsumidor__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriamensajepantalla` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de mensajes por pantalla';

ALTER TABLE `tb_auditoriamensajepantalla`
ADD CONSTRAINT `tb_auditoriamensajepantalla__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriainvitacion` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de invitaciones';

ALTER TABLE `tb_auditoriainvitacion`
ADD CONSTRAINT `tb_auditoriainvitacion__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriaconfiguracion` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de configuracion de nodos';

ALTER TABLE `tb_auditoriaconfiguracion`
ADD CONSTRAINT `tb_auditoriaconfiguracion__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriaplantilla` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de plantillas';

ALTER TABLE `tb_auditoriaplantilla`
ADD CONSTRAINT `tb_auditoriaplantilla__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);

CREATE TABLE IF NOT EXISTS `tb_auditoriacondicionnodo` (
	`id_auditoria`     INT(11)                               NOT NULL AUTO_INCREMENT,
	`id_usuario`       INT(11)                               DEFAULT NULL,
	`usuario`          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	`id_registro`      INT(11)                               NOT NULL,
	`fechaRegistro`    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`id_tipoAuditoria` TINYINT(1)                            NOT NULL,
	`tabla`            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	`datos_a`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	`datos_d`          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de condiciones de nodo';

ALTER TABLE `tb_auditoriacondicionnodo`
ADD CONSTRAINT `tb_auditoriacondicionnodo__tb_tipoauditoria` FOREIGN KEY (`id_tipoAuditoria`) REFERENCES `tb_tipoauditoria` (`id_tipoAuditoria`);