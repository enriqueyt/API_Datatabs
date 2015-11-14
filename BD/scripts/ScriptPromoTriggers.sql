USE `datatabs_main`;

/* TABLAS IDIOMA */
DROP TRIGGER IF EXISTS tr_idioma_createA;

DELIMITER //
CREATE TRIGGER tr_idioma_createA AFTER INSERT ON tb_idioma
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaidioma
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_idioma,
		NOW(),
		1,
		'[datatabs_main].[tb_idioma]',
		CONCAT_WS('|', NEW.id_idioma, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_idioma_updateA;

DELIMITER //
CREATE TRIGGER tr_idioma_updateA AFTER UPDATE ON tb_idioma
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaidioma
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_idioma,
		NOW(),
		2,
		'[datatabs_main].[tb_idioma]',
		CONCAT_WS('|', OLD.id_idioma, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_idioma, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_idioma_deleteA;

DELIMITER //
CREATE TRIGGER tr_idioma_deleteA AFTER DELETE ON tb_idioma
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaidioma
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_idioma,
		NOW(),
		3,
		'[datatabs_main].[tb_idioma]',
		CONCAT_WS('|', OLD.id_idioma, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_idioma_t_createA;

DELIMITER //
CREATE TRIGGER tr_idioma_t_createA AFTER INSERT ON tb_idioma_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaidioma
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_idioma_t,
		NOW(),
		1,
		'[datatabs_main].[tb_idioma_t]',
		CONCAT_WS('|', NEW.id_idioma_t, NEW.idioma, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_idioma_t_updateA;

DELIMITER //
CREATE TRIGGER tr_idioma_t_updateA AFTER UPDATE ON tb_idioma_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaidioma
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_idioma_t,
		NOW(),
		2,
		'[datatabs_main].[tb_idioma_t]',
		CONCAT_WS('|', OLD.id_idioma_t, OLD.idioma, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_idioma_t, NEW.idioma, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_idioma_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_idioma_t_deleteA AFTER DELETE ON tb_idioma_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaidioma
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_idioma_t,
		NOW(),
		3,
		'[datatabs_main].[tb_idioma_t]',
		CONCAT_WS('|', OLD.id_idioma_t, OLD.idioma, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS IDIOMA */


/* TABLAS PAIS */
DROP TRIGGER IF EXISTS tr_pais_createA;

DELIMITER //
CREATE TRIGGER tr_pais_createA AFTER INSERT ON tb_pais
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriapais
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_pais,
		NOW(),
		1,
		'[datatabs_main].[tb_pais]',
		CONCAT_WS('|', NEW.id_pais, NEW.codigoNUM, NEW.codigoALP2, NEW.codigoALP3, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_pais_updateA;

DELIMITER //
CREATE TRIGGER tr_pais_updateA AFTER UPDATE ON tb_pais
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriapais
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_pais,
		NOW(),
		2,
		'[datatabs_main].[tb_pais]',
		CONCAT_WS('|', OLD.id_pais, OLD.codigoNUM, OLD.codigoALP2, OLD.codigoALP3, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_pais, NEW.codigoNUM, NEW.codigoALP2, NEW.codigoALP3, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_pais_deleteA;

DELIMITER //
CREATE TRIGGER tr_pais_deleteA AFTER DELETE ON tb_pais
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriapais
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_pais,
		NOW(),
		3,
		'[datatabs_main].[tb_pais]',
		CONCAT_WS('|', OLD.id_pais, OLD.codigoNUM, OLD.codigoALP2, OLD.codigoALP3, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_pais_t_createA;

DELIMITER //
CREATE TRIGGER tr_pais_t_createA AFTER INSERT ON tb_pais_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriapais
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_pais_t,
		NOW(),
		1,
		'[datatabs_main].[tb_pais_t]',
		CONCAT_WS('|', NEW.id_pais_t, NEW.pais, NEW.id_pais, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_pais_t_updateA;

DELIMITER //
CREATE TRIGGER tr_pais_t_updateA AFTER UPDATE ON tb_pais_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriapais
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_pais_t,
		NOW(),
		2,
		'[datatabs_main].[tb_pais_t]',
		CONCAT_WS('|', OLD.id_pais_t, OLD.pais, OLD.id_pais, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_pais_t, NEW.pais, NEW.id_pais, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_pais_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_pais_t_deleteA AFTER DELETE ON tb_pais_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriapais
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_pais_t,
		NOW(),
		3,
		'[datatabs_main].[tb_pais_t]',
		CONCAT_WS('|', OLD.id_pais_t, OLD.pais, OLD.id_pais, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS PAIS */


/* TABLAS ESTADO */
DROP TRIGGER IF EXISTS tr_estado_createA;

DELIMITER //
CREATE TRIGGER tr_estado_createA AFTER INSERT ON tb_estado
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaestado
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_estado,
		NOW(),
		1,
		'[datatabs_main].[tb_estado]',
		CONCAT_WS('|', NEW.id_estado, NEW.codigo, NEW.id_pais, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_estado_updateA;

DELIMITER //
CREATE TRIGGER tr_estado_updateA AFTER UPDATE ON tb_estado
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaestado
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_estado,
		NOW(),
		2,
		'[datatabs_main].[tb_estado]',
		CONCAT_WS('|', OLD.id_estado, OLD.codigo, OLD.id_pais, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_estado, NEW.codigo, NEW.id_pais, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_estado_deleteA;

DELIMITER //
CREATE TRIGGER tr_estado_deleteA AFTER DELETE ON tb_estado
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaestado
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_estado,
		NOW(),
		3,
		'[datatabs_main].[tb_estado]',
		CONCAT_WS('|', OLD.id_estado, OLD.codigo, OLD.id_pais, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_estado_t_createA;

DELIMITER //
CREATE TRIGGER tr_estado_t_createA AFTER INSERT ON tb_estado_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaestado
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_estado_t,
		NOW(),
		1,
		'[datatabs_main].[tb_estado_t]',
		CONCAT_WS('|', NEW.id_estado_t, NEW.estado, NEW.id_estado, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_estado_t_updateA;

DELIMITER //
CREATE TRIGGER tr_estado_t_updateA AFTER UPDATE ON tb_estado_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaestado
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_estado_t,
		NOW(),
		2,
		'[datatabs_main].[tb_estado_t]',
		CONCAT_WS('|', OLD.id_estado_t, OLD.estado, OLD.id_estado, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_estado_t, NEW.estado, NEW.id_estado, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_estado_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_estado_t_deleteA AFTER DELETE ON tb_estado_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaestado
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_estado_t,
		NOW(),
		3,
		'[datatabs_main].[tb_estado_t]',
		CONCAT_WS('|', OLD.id_estado_t, OLD.estado, OLD.id_estado, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS ESTADO */


/* TABLAS CIUDAD */
DROP TRIGGER IF EXISTS tr_ciudad_createA;

DELIMITER //
CREATE TRIGGER tr_ciudad_createA AFTER INSERT ON tb_ciudad
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaciudad
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_ciudad,
		NOW(),
		1,
		'[datatabs_main].[tb_ciudad]',
		CONCAT_WS('|', NEW.id_ciudad, NEW.codigo, NEW.id_estado, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_ciudad_updateA;

DELIMITER //
CREATE TRIGGER tr_ciudad_updateA AFTER UPDATE ON tb_ciudad
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaciudad
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_ciudad,
		NOW(),
		2,
		'[datatabs_main].[tb_ciudad]',
		CONCAT_WS('|', OLD.id_ciudad, OLD.codigo, OLD.id_estado, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_ciudad, NEW.codigo, NEW.id_estado, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_ciudad_deleteA;

DELIMITER //
CREATE TRIGGER tr_ciudad_deleteA AFTER DELETE ON tb_ciudad
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaciudad
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_ciudad,
		NOW(),
		3,
		'[datatabs_main].[tb_ciudad]',
		CONCAT_WS('|', OLD.id_ciudad, OLD.codigo, OLD.id_estado, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_ciudad_t_createA;

DELIMITER //
CREATE TRIGGER tr_ciudad_t_createA AFTER INSERT ON tb_ciudad_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaciudad
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_ciudad_t,
		NOW(),
		1,
		'[datatabs_main].[tb_ciudad_t]',
		CONCAT_WS('|', NEW.id_ciudad_t, NEW.ciudad, NEW.id_ciudad, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_ciudad_t_updateA;

DELIMITER //
CREATE TRIGGER tr_ciudad_t_updateA AFTER UPDATE ON tb_ciudad_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaciudad
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_ciudad_t,
		NOW(),
		2,
		'[datatabs_main].[tb_ciudad_t]',
		CONCAT_WS('|', OLD.id_ciudad_t, OLD.ciudad, OLD.id_ciudad, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_ciudad_t, NEW.ciudad, NEW.id_ciudad, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_ciudad_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_ciudad_t_deleteA AFTER DELETE ON tb_ciudad_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaciudad
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_ciudad_t,
		NOW(),
		3,
		'[datatabs_main].[tb_ciudad_t]',
		CONCAT_WS('|', OLD.id_ciudad_t, OLD.ciudad, OLD.id_ciudad, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS CIUDAD */


/* TABLAS PERFIL */
DROP TRIGGER IF EXISTS tr_perfil_createA;

DELIMITER //
CREATE TRIGGER tr_perfil_createA AFTER INSERT ON tb_perfil
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaperfil
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_perfil,
		NOW(),
		1,
		'[datatabs_main].[tb_perfil]',
		CONCAT_WS('|', NEW.id_perfil, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_perfil_updateA;

DELIMITER //
CREATE TRIGGER tr_perfil_updateA AFTER UPDATE ON tb_perfil
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaciudad
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_perfil,
		NOW(),
		2,
		'[datatabs_main].[tb_perfil]',
		CONCAT_WS('|', OLD.id_perfil, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_perfil, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_perfil_deleteA;

DELIMITER //
CREATE TRIGGER tr_perfil_deleteA AFTER DELETE ON tb_perfil
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaperfil
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_perfil,
		NOW(),
		3,
		'[datatabs_main].[tb_perfil]',
		CONCAT_WS('|', OLD.id_perfil, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_perfil_t_createA;

DELIMITER //
CREATE TRIGGER tr_perfil_t_createA AFTER INSERT ON tb_perfil_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaperfil
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_perfil_t,
		NOW(),
		1,
		'[datatabs_main].[tb_perfil_t]',
		CONCAT_WS('|', NEW.id_perfil_t, NEW.perfil, IFNULL(NEW.descripcion, ''), NEW.id_perfil, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_perfil_t_updateA;

DELIMITER //
CREATE TRIGGER tr_perfil_t_updateA AFTER UPDATE ON tb_perfil_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaciudad
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_perfil_t,
		NOW(),
		2,
		'[datatabs_main].[tb_perfil_t]',
		CONCAT_WS('|', OLD.id_perfil_t, OLD.perfil, IFNULL(OLD.descripcion, ''), OLD.id_perfil, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_perfil_t, NEW.perfil, IFNULL(NEW.descripcion, ''), NEW.id_perfil, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_perfil_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_perfil_t_deleteA AFTER DELETE ON tb_perfil_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaperfil
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_perfil_t,
		NOW(),
		3,
		'[datatabs_main].[tb_perfil_t]',
		CONCAT_WS('|', OLD.id_perfil_t, OLD.perfil, IFNULL(OLD.descripcion, ''), OLD.id_perfil, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS PERFIL */


/* TABLAS SEXO */
DROP TRIGGER IF EXISTS tr_sexo_createA;

DELIMITER //
CREATE TRIGGER tr_sexo_createA AFTER INSERT ON tb_sexo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriasexo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_sexo,
		NOW(),
		1,
		'[datatabs_main].[tb_sexo]',
		CONCAT_WS('|', NEW.id_sexo, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_sexo_updateA;

DELIMITER //
CREATE TRIGGER tr_sexo_updateA AFTER UPDATE ON tb_sexo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriasexo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_sexo,
		NOW(),
		2,
		'[datatabs_main].[tb_sexo]',
		CONCAT_WS('|', OLD.id_sexo, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_sexo, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_sexo_deleteA;

DELIMITER //
CREATE TRIGGER tr_sexo_deleteA AFTER DELETE ON tb_sexo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriasexo
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_sexo,
		NOW(),
		3,
		'[datatabs_main].[tb_sexo]',
		CONCAT_WS('|', OLD.id_sexo, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_sexo_t_createA;

DELIMITER //
CREATE TRIGGER tr_sexo_t_createA AFTER INSERT ON tb_sexo_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriasexo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_sexo_t,
		NOW(),
		1,
		'[datatabs_main].[tb_sexo_t]',
		CONCAT_WS('|', NEW.id_sexo_t, NEW.sexo, NEW.id_sexo, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_sexo_t_updateA;

DELIMITER //
CREATE TRIGGER tr_sexo_t_updateA AFTER UPDATE ON tb_sexo_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriasexo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_sexo_t,
		NOW(),
		2,
		'[datatabs_main].[tb_sexo_t]',
		CONCAT_WS('|', OLD.id_sexo_t, OLD.sexo, OLD.id_sexo, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_sexo_t, NEW.sexo, NEW.id_sexo, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_sexo_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_sexo_t_deleteA AFTER DELETE ON tb_sexo_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriasexo
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_sexo_t,
		NOW(),
		3,
		'[datatabs_main].[tb_sexo_t]',
		CONCAT_WS('|', OLD.id_sexo_t, OLD.sexo, OLD.id_sexo, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS SEXO */


/* TABLAS GRUPO */
DROP TRIGGER IF EXISTS tr_grupo_createA;

DELIMITER //
CREATE TRIGGER tr_grupo_createA AFTER INSERT ON tb_grupo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriagrupo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_grupo,
		NOW(),
		1,
		'[datatabs_main].[tb_grupo]',
		CONCAT_WS('|', NEW.id_grupo, NEW.codigo, NEW.grupo, IFNULL(NEW.descripcion, ''), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_grupo_updateA;

DELIMITER //
CREATE TRIGGER tr_grupo_updateA AFTER UPDATE ON tb_grupo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriagrupo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_grupo,
		NOW(),
		2,
		'[datatabs_main].[tb_grupo]',
		CONCAT_WS('|', OLD.id_grupo, OLD.codigo, OLD.grupo, IFNULL(OLD.descripcion, ''), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_grupo, NEW.codigo, NEW.grupo, IFNULL(NEW.descripcion, ''), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_grupo_deleteA;

DELIMITER //
CREATE TRIGGER tr_grupo_deleteA AFTER DELETE ON tb_grupo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriagrupo
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_grupo,
		NOW(),
		3,
		'[datatabs_main].[tb_grupo]',
		CONCAT_WS('|', OLD.id_grupo, OLD.codigo, OLD.grupo, IFNULL(OLD.descripcion, ''), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS GRUPO */

/* TABLAS CONTROLADOR */
DROP TRIGGER IF EXISTS tr_controlador_createA;

DELIMITER //
CREATE TRIGGER tr_controlador_createA AFTER INSERT ON tb_controlador
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacontrolador
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_controlador,
		NOW(),
		1,
		'[datatabs_main].[tb_controlador]',
		CONCAT_WS('|', NEW.id_controlador, NEW.nombre, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_controlador_updateA;

DELIMITER //
CREATE TRIGGER tr_controlador_updateA AFTER UPDATE ON tb_controlador
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacontrolador
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_controlador,
		NOW(),
		2,
		'[datatabs_main].[tb_controlador]',
		CONCAT_WS('|', OLD.id_controlador, OLD.nombre, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_controlador, NEW.nombre, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_controlador_deleteA;

DELIMITER //
CREATE TRIGGER tr_controlador_deleteA AFTER DELETE ON tb_controlador
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacontrolador
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_controlador,
		NOW(),
		3,
		'[datatabs_main].[tb_controlador]',
		CONCAT_WS('|', OLD.id_controlador, OLD.nombre, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_controlador_t_createA;

DELIMITER //
CREATE TRIGGER tr_controlador_t_createA AFTER INSERT ON tb_controlador_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacontrolador
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_controlador_t,
		NOW(),
		1,
		'[datatabs_main].[tb_controlador_t]',
		CONCAT_WS('|', NEW.id_controlador_t, NEW.controlador, IFNULL(NEW.descripcion, ''), NEW.id_controlador, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_controlador_t_updateA;

DELIMITER //
CREATE TRIGGER tr_controlador_t_updateA AFTER UPDATE ON tb_controlador_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacontrolador
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_controlador_t,
		NOW(),
		2,
		'[datatabs_main].[tb_controlador_t]',
		CONCAT_WS('|', OLD.id_controlador_t, OLD.controlador, IFNULL(OLD.descripcion, ''), OLD.id_controlador, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_controlador_t, NEW.controlador, IFNULL(NEW.descripcion, ''), NEW.id_controlador, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_controlador_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_controlador_t_deleteA AFTER DELETE ON tb_controlador_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacontrolador
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_controlador_t,
		NOW(),
		3,
		'[datatabs_main].[tb_controlador_t]',
		CONCAT_WS('|', OLD.id_controlador_t, OLD.controlador, IFNULL(OLD.descripcion, ''), OLD.id_controlador, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS CONTROLADOR */


/* TABLAS VISTA */
DROP TRIGGER IF EXISTS tr_vista_createA;

DELIMITER //
CREATE TRIGGER tr_vista_createA AFTER INSERT ON tb_vista
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriavista
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_vista,
		NOW(),
		1,
		'[datatabs_main].[tb_vista]',
		CONCAT_WS('|', NEW.id_vista, NEW.nombre, NEW.id_controlador, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_vista_updateA;

DELIMITER //
CREATE TRIGGER tr_vista_updateA AFTER UPDATE ON tb_vista
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriavista
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_vista,
		NOW(),
		2,
		'[datatabs_main].[tb_vista]',
		CONCAT_WS('|', OLD.id_vista, OLD.nombre, OLD.id_controlador, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_vista, NEW.nombre, NEW.id_controlador, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_vista_deleteA;

DELIMITER //
CREATE TRIGGER tr_vista_deleteA AFTER DELETE ON tb_vista
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriavista
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_vista,
		NOW(),
		3,
		'[datatabs_main].[tb_vista]',
		CONCAT_WS('|', OLD.id_vista, OLD.nombre, OLD.id_controlador, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_vista_t_createA;

DELIMITER //
CREATE TRIGGER tr_vista_t_createA AFTER INSERT ON tb_vista_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriavista
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_vista_t,
		NOW(),
		1,
		'[datatabs_main].[tb_vista_t]',
		CONCAT_WS('|', NEW.id_vista_t, NEW.vista, IFNULL(NEW.descripcion, ''), NEW.id_vista, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_vista_t_updateA;

DELIMITER //
CREATE TRIGGER tr_vista_t_updateA AFTER UPDATE ON tb_vista_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriavista
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_vista_t,
		NOW(),
		2,
		'[datatabs_main].[tb_vista_t]',
		CONCAT_WS('|', OLD.id_vista_t, OLD.vista, IFNULL(OLD.descripcion, ''), OLD.id_vista, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_vista_t, NEW.vista, IFNULL(NEW.descripcion, ''), NEW.id_vista, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_vista_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_vista_t_deleteA AFTER DELETE ON tb_vista_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriavista
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_vista_t,
		NOW(),
		3,
		'[datatabs_main].[tb_vista_t]',
		CONCAT_WS('|', OLD.id_vista_t, OLD.vista, IFNULL(OLD.descripcion, ''), OLD.id_vista, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS VISTA */


/* TABLAS USUARIO */
DROP TRIGGER IF EXISTS tr_usuario_createA;

DELIMITER //
CREATE TRIGGER tr_usuario_createA AFTER INSERT ON tb_usuario
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriausuario
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_usuario,
		NOW(),
		1,
		'[datatabs_main].[tb_usuario]',
		CONCAT_WS('|', NEW.id_usuario, NEW.usuario, NEW.usuarioCorreo, NEW.contrasena, NEW.fechaRegistro, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_usuario_updateA;

DELIMITER //
CREATE TRIGGER tr_usuario_updateA AFTER UPDATE ON tb_usuario
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriausuario
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_usuario,
		NOW(),
		2,
		'[datatabs_main].[tb_usuario]',
		CONCAT_WS('|', OLD.id_usuario, OLD.usuario, OLD.usuarioCorreo, OLD.contrasena, OLD.fechaRegistro, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_usuario, NEW.usuario, NEW.usuarioCorreo, NEW.contrasena, NEW.fechaRegistro, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_usuario_deleteA;

DELIMITER //
CREATE TRIGGER tr_usuario_deleteA AFTER DELETE ON tb_usuario
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriausuario
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_usuario,
		NOW(),
		3,
		'[datatabs_main].[tb_usuario]',
		CONCAT_WS('|', OLD.id_usuario, OLD.usuario, OLD.usuarioCorreo, OLD.contrasena, OLD.fechaRegistro, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_usuarioactivo_createA;

DELIMITER //
CREATE TRIGGER tr_usuarioactivo_createA AFTER INSERT ON tb_usuarioactivo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriausuario
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_usuarioActivo,
		NOW(),
		1,
		'[datatabs_main].[tb_usuarioactivo]',
		CONCAT_WS('|', NEW.id_usuarioActivo, NEW.id_usuario, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_usuarioactivo_updateA;

DELIMITER //
CREATE TRIGGER tr_usuarioactivo_updateA AFTER UPDATE ON tb_usuarioactivo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriausuarioactivo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_usuarioActivo,
		NOW(),
		2,
		'[datatabs_main].[tb_usuarioactivo]',
		CONCAT_WS('|', OLD.id_usuarioActivo, OLD.id_usuario, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_usuarioActivo, NEW.id_usuario, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_usuarioactivo_deleteA;

DELIMITER //
CREATE TRIGGER tr_usuarioactivo_deleteA AFTER DELETE ON tb_usuarioactivo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriausuarioactivo
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_usuarioActivo,
		NOW(),
		3,
		'[datatabs_main].[tb_usuarioactivo]',
		CONCAT_WS('|', OLD.id_usuarioActivo, OLD.id_usuario, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS USUARIO */


/* TABLAS SUPERDISTRIBUIDOR */
DROP TRIGGER IF EXISTS tr_superdistribuidor_createA;

DELIMITER //
CREATE TRIGGER tr_superdistribuidor_createA AFTER INSERT ON tb_superdistribuidor
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriasuperdistribuidor
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_superDistribuidor,
		NOW(),
		1,
		'[datatabs_main].[tb_superdistribuidor]',
		CONCAT_WS('|', NEW.id_superDistribuidor, IFNULL(NEW.identificacion, ''), NEW.nombre, NEW.razonSocial, IFNULL(NEW.telefono, ''), IFNULL(NEW.fax, ''), IFNULL(NEW.correo, ''), IFNULL(NEW.direccion, ''), NEW.fechaRegistro, NEW.id_ciudad, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_superdistribuidor_updateA;

DELIMITER //
CREATE TRIGGER tr_superdistribuidor_updateA AFTER UPDATE ON tb_superdistribuidor
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriasuperdistribuidor
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_superDistribuidor,
		NOW(),
		2,
		'[datatabs_main].[tb_superdistribuidor]',
		CONCAT_WS('|', OLD.id_superDistribuidor, IFNULL(OLD.identificacion, ''), OLD.nombre, OLD.razonSocial, IFNULL(OLD.telefono, ''), IFNULL(OLD.fax, ''), IFNULL(OLD.correo, ''), IFNULL(OLD.direccion, ''), OLD.fechaRegistro, OLD.id_ciudad, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_superDistribuidor, IFNULL(NEW.identificacion, ''), NEW.nombre, NEW.razonSocial, IFNULL(NEW.telefono, ''), IFNULL(NEW.fax, ''), IFNULL(NEW.correo, ''), IFNULL(NEW.direccion, ''), NEW.fechaRegistro, NEW.id_ciudad, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_superdistribuidor_deleteA;

DELIMITER //
CREATE TRIGGER tr_superdistribuidor_deleteA AFTER DELETE ON tb_superdistribuidor
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriasuperdistribuidor
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_superDistribuidor,
		NOW(),
		3,
		'[datatabs_main].[tb_superdistribuidor]',
		CONCAT_WS('|', OLD.id_superDistribuidor, IFNULL(OLD.identificacion, ''), OLD.nombre, OLD.razonSocial, IFNULL(OLD.telefono, ''), IFNULL(OLD.fax, ''), IFNULL(OLD.correo, ''), IFNULL(OLD.direccion, ''), OLD.fechaRegistro, OLD.id_ciudad, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS SUPERDISTRIBUIDOR */


/* TABLAS DISTRIBUIDOR */
DROP TRIGGER IF EXISTS tr_distribuidor_createA;

DELIMITER //
CREATE TRIGGER tr_distribuidor_createA AFTER INSERT ON tb_distribuidor
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriadistribuidor
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_distribuidor,
		NOW(),
		1,
		'[datatabs_main].[tb_distribuidor]',
		CONCAT_WS('|', NEW.id_distribuidor, IFNULL(NEW.identificacion, ''), NEW.nombre, NEW.razonSocial, IFNULL(NEW.telefono, ''), IFNULL(NEW.fax, ''), IFNULL(NEW.correo, ''), IFNULL(NEW.direccion, ''), NEW.fechaRegistro, NEW.id_ciudad, IFNULL(NEW.id_superDistribuidor, 0),  IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_distribuidor_updateA;

DELIMITER //
CREATE TRIGGER tr_distribuidor_updateA AFTER UPDATE ON tb_distribuidor
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriadistribuidor
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_distribuidor,
		NOW(),
		2,
		'[datatabs_main].[tb_distribuidor]',
		CONCAT_WS('|', OLD.id_distribuidor, IFNULL(OLD.identificacion, ''), OLD.nombre, OLD.razonSocial, IFNULL(OLD.telefono, ''), IFNULL(OLD.fax, ''), IFNULL(OLD.correo, ''), IFNULL(OLD.direccion, ''), OLD.fechaRegistro, OLD.id_ciudad, IFNULL(OLD.id_superDistribuidor, 0),  IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_distribuidor, IFNULL(NEW.identificacion, ''), NEW.nombre, NEW.razonSocial, IFNULL(NEW.telefono, ''), IFNULL(NEW.fax, ''), IFNULL(NEW.correo, ''), IFNULL(NEW.direccion, ''), NEW.fechaRegistro, NEW.id_ciudad, IFNULL(NEW.id_superDistribuidor, 0),  IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_distribuidor_deleteA;

DELIMITER //
CREATE TRIGGER tr_distribuidor_deleteA AFTER DELETE ON tb_distribuidor
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriadistribuidor
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_distribuidor,
		NOW(),
		3,
		'[datatabs_main].[tb_distribuidor]',
		CONCAT_WS('|', OLD.id_distribuidor, IFNULL(OLD.identificacion, ''), OLD.nombre, OLD.razonSocial, IFNULL(OLD.telefono, ''), IFNULL(OLD.fax, ''), IFNULL(OLD.correo, ''), IFNULL(OLD.direccion, ''), OLD.fechaRegistro, OLD.id_ciudad, IFNULL(OLD.id_superDistribuidor, 0), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS DISTRIBUIDOR */


/* TABLAS EMPRESA */
DROP TRIGGER IF EXISTS tr_empresa_createA;

DELIMITER //
CREATE TRIGGER tr_empresa_createA AFTER INSERT ON tb_empresa
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaempresa
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_empresa,
		NOW(),
		1,
		'[datatabs_main].[tb_empresa]',
		CONCAT_WS('|', NEW.id_empresa, IFNULL(NEW.identificacion, ''), NEW.nombre, NEW.razonSocial, IFNULL(NEW.telefono, ''), IFNULL(NEW.fax, ''), IFNULL(NEW.correo, ''), IFNULL(NEW.direccion, ''), NEW.fechaRegistro, NEW.id_ciudad, NEW.id_distribuidor,  IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_empresa_updateA;

DELIMITER //
CREATE TRIGGER tr_empresa_updateA AFTER UPDATE ON tb_empresa
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaempresa
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_empresa,
		NOW(),
		2,
		'[datatabs_main].[tb_empresa]',
		CONCAT_WS('|', OLD.id_empresa, IFNULL(OLD.identificacion, ''), OLD.nombre, OLD.razonSocial, IFNULL(OLD.telefono, ''), IFNULL(OLD.fax, ''), IFNULL(OLD.correo, ''), IFNULL(OLD.direccion, ''), OLD.fechaRegistro, OLD.id_ciudad, OLD.id_distribuidor, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_empresa, IFNULL(NEW.identificacion, ''), NEW.nombre, NEW.razonSocial, IFNULL(NEW.telefono, ''), IFNULL(NEW.fax, ''), IFNULL(NEW.correo, ''), IFNULL(NEW.direccion, ''), NEW.fechaRegistro, NEW.id_ciudad, NEW.id_distribuidor, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_empresa_deleteA;

DELIMITER //
CREATE TRIGGER tr_empresa_deleteA AFTER DELETE ON tb_empresa
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaempresa
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_empresa,
		NOW(),
		3,
		'[datatabs_main].[tb_empresa]',
		CONCAT_WS('|', OLD.id_empresa, IFNULL(OLD.identificacion, ''), OLD.nombre, OLD.razonSocial, IFNULL(OLD.telefono, ''), IFNULL(OLD.fax, ''), IFNULL(OLD.correo, ''), IFNULL(OLD.direccion, ''), OLD.fechaRegistro, OLD.id_ciudad, OLD.id_distribuidor, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS EMPRESA */


/* TABLAS SUCURSAL */
DROP TRIGGER IF EXISTS tr_sucursal_createA;

DELIMITER //
CREATE TRIGGER tr_sucursal_createA AFTER INSERT ON tb_sucursal
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriasucursal
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_sucursal,
		NOW(),
		1,
		'[datatabs_main].[tb_sucursal]',
		CONCAT_WS('|', NEW.id_sucursal, NEW.sucursal, IFNULL(NEW.direccion, ''), NEW.fechaRegistro, NEW.id_ciudad, NEW.id_empresa, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_sucursal_updateA;

DELIMITER //
CREATE TRIGGER tr_sucursal_updateA AFTER UPDATE ON tb_sucursal
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriasucursal
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_sucursal,
		NOW(),
		2,
		'[datatabs_main].[tb_sucursal]',
		CONCAT_WS('|', OLD.id_sucursal, OLD.sucursal, IFNULL(OLD.direccion, ''), OLD.fechaRegistro, OLD.id_ciudad, OLD.id_empresa, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_sucursal, NEW.sucursal, IFNULL(NEW.direccion, ''), NEW.fechaRegistro, NEW.id_ciudad, NEW.id_empresa, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_sucursal_deleteA;

DELIMITER //
CREATE TRIGGER tr_sucursal_deleteA AFTER DELETE ON tb_sucursal
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriasucursal
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_sucursal,
		NOW(),
		3,
		'[datatabs_main].[tb_sucursal]',
		CONCAT_WS('|', OLD.id_sucursal, OLD.sucursal, IFNULL(OLD.direccion, ''), OLD.fechaRegistro, OLD.id_ciudad, OLD.id_empresa, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS SUCURSAL */


/* TABLAS USUARIOD */
DROP TRIGGER IF EXISTS tr_tipousuariod_createA;

DELIMITER //
CREATE TRIGGER tr_tipousuariod_createA AFTER INSERT ON tb_tipousuariod
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriausuariod
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoUsuarioD,
		NOW(),
		1,
		'[datatabs_main].[tb_tipousuariod]',
		CONCAT_WS('|', NEW.id_tipoUsuarioD, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipousuariod_updateA;

DELIMITER //
CREATE TRIGGER tr_tipousuariod_updateA AFTER UPDATE ON tb_tipousuariod
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriausuariod
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoUsuarioD,
		NOW(),
		2,
		'[datatabs_main].[tb_tipousuariod]',
		CONCAT_WS('|', OLD.id_tipoUsuarioD, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoUsuarioD, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipousuariod_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipousuariod_deleteA AFTER DELETE ON tb_tipousuariod
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriausuariod
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoUsuarioD,
		NOW(),
		3,
		'[datatabs_main].[tb_tipousuariod]',
		CONCAT_WS('|', OLD.id_tipoUsuarioD, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipousuariod_t_createA;

DELIMITER //
CREATE TRIGGER tr_tipousuariod_t_createA AFTER INSERT ON tb_tipousuariod_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriausuariod
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoUsuarioD_t,
		NOW(),
		1,
		'[datatabs_main].[tb_tipousuariod_t]',
		CONCAT_WS('|', NEW.id_tipoUsuarioD_t, NEW.tipoUsuarioD, IFNULL(NEW.descripcion, ''), NEW.id_tipoUsuarioD, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipousuariod_t_updateA;

DELIMITER //
CREATE TRIGGER tr_tipousuariod_t_updateA AFTER UPDATE ON tb_tipousuariod_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriausuariod
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoUsuarioD_t,
		NOW(),
		2,
		'[datatabs_main].[tb_tipousuariod_t]',
		CONCAT_WS('|', OLD.id_tipoUsuarioD_t, OLD.tipoUsuarioD, IFNULL(OLD.descripcion, ''), OLD.id_tipoUsuarioD, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoUsuarioD_t, NEW.tipoUsuarioD, IFNULL(NEW.descripcion, ''), NEW.id_tipoUsuarioD, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipousuariod_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipousuariod_t_deleteA AFTER DELETE ON tb_tipousuariod_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriausuariod
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoUsuarioD_t,
		NOW(),
		3,
		'[datatabs_main].[tb_tipousuariod_t]',
		CONCAT_WS('|', OLD.id_tipoUsuarioD_t, OLD.tipoUsuarioD, IFNULL(OLD.descripcion, ''), OLD.id_tipoUsuarioD, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_usuariod_createA;

DELIMITER //
CREATE TRIGGER tr_usuariod_createA AFTER INSERT ON tb_usuariod
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriausuariod
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_usuarioD,
		NOW(),
		1,
		'[datatabs_main].[tb_usuariod]',
		CONCAT_WS('|', NEW.id_usuarioD, IFNULL(NEW.identificacion, ''), IFNULL(NEW.nombres, ''), IFNULL(NEW.apellidos, ''), NEW.correo, IFNULL(NEW.tlfCasa, ''), IFNULL(NEW.tlfOficina, ''), IFNULL(NEW.tlfCelular, ''), IFNULL(NEW.avatar, ''), NEW.id_sexo, NEW.id_tipoUsuarioD, NEW.id_ciudad, IFNULL(NEW.id_idioma, ''), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_usuariod_updateA;

DELIMITER //
CREATE TRIGGER tr_usuariod_updateA AFTER UPDATE ON tb_usuariod
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriausuariod
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_usuarioD,
		NOW(),
		2,
		'[datatabs_main].[tb_usuariod]',
		CONCAT_WS('|', OLD.id_usuarioD, IFNULL(OLD.identificacion, ''), IFNULL(OLD.nombres, ''), IFNULL(OLD.apellidos, ''), OLD.correo, IFNULL(OLD.tlfCasa, ''), IFNULL(OLD.tlfOficina, ''), IFNULL(OLD.tlfCelular, ''), IFNULL(OLD.avatar, ''), OLD.id_sexo, OLD.id_tipoUsuarioD, OLD.id_ciudad, IFNULL(OLD.id_idioma, ''), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_usuarioD, IFNULL(NEW.identificacion, ''), IFNULL(NEW.nombres, ''), IFNULL(NEW.apellidos, ''), NEW.correo, IFNULL(NEW.tlfCasa, ''), IFNULL(NEW.tlfOficina, ''), IFNULL(NEW.tlfCelular, ''), IFNULL(NEW.avatar, ''), NEW.id_sexo, NEW.id_tipoUsuarioD, NEW.id_ciudad, IFNULL(NEW.id_idioma, ''), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_usuariod_deleteA;

DELIMITER //
CREATE TRIGGER tr_usuariod_deleteA AFTER DELETE ON tb_usuariod
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriausuariod
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_usuarioD,
		NOW(),
		3,
		'[datatabs_main].[tb_usuariod]',
		CONCAT_WS('|', OLD.id_usuarioD, IFNULL(OLD.identificacion, ''), IFNULL(OLD.nombres, ''), IFNULL(OLD.apellidos, ''), OLD.correo, IFNULL(OLD.tlfCasa, ''), IFNULL(OLD.tlfOficina, ''), IFNULL(OLD.tlfCelular, ''), IFNULL(OLD.avatar, ''), OLD.id_sexo, OLD.id_tipoUsuarioD, OLD.id_ciudad, IFNULL(OLD.id_idioma, ''), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS USUARIOD */


/* TABLAS DISPOSITIVO */
DROP TRIGGER IF EXISTS tr_tipodispositivo_createA;

DELIMITER //
CREATE TRIGGER tr_tipodispositivo_createA AFTER INSERT ON tb_tipodispositivo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriadispositivo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoDispositivo,
		NOW(),
		1,
		'[datatabs_main].[tb_tipodispositivo]',
		CONCAT_WS('|', NEW.id_tipoDispositivo, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipodispositivo_updateA;

DELIMITER //
CREATE TRIGGER tr_tipodispositivo_updateA AFTER UPDATE ON tb_tipodispositivo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriadispositivo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoDispositivo,
		NOW(),
		2,
		'[datatabs_main].[tb_tipodispositivo]',
		CONCAT_WS('|', OLD.id_tipoDispositivo, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoDispositivo, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipodispositivo_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipodispositivo_deleteA AFTER DELETE ON tb_tipodispositivo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriadispositivo
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoDispositivo,
		NOW(),
		3,
		'[datatabs_main].[tb_tipodispositivo]',
		CONCAT_WS('|', OLD.id_tipoDispositivo, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipodispositivo_t_createA;

DELIMITER //
CREATE TRIGGER tr_tipodispositivo_t_createA AFTER INSERT ON tb_tipodispositivo_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriadispositivo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoDispositivo_t,
		NOW(),
		1,
		'[datatabs_main].[tb_tipodispositivo_t]',
		CONCAT_WS('|', NEW.id_tipoDispositivo_t, NEW.tipoDispositivo, IFNULL(NEW.descripcion, ''), NEW.id_tipoDispositivo, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipodispositivo_t_updateA;

DELIMITER //
CREATE TRIGGER tr_tipodispositivo_t_updateA AFTER UPDATE ON tb_tipodispositivo_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriadispositivo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoDispositivo_t,
		NOW(),
		2,
		'[datatabs_main].[tb_tipodispositivo_t]',
		CONCAT_WS('|', OLD.id_tipoDispositivo_t, OLD.tipoDispositivo, IFNULL(OLD.descripcion, ''), OLD.id_tipoDispositivo, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoDispositivo_t, NEW.tipoDispositivo, IFNULL(NEW.descripcion, ''), NEW.id_tipoDispositivo, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipodispositivo_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipodispositivo_t_deleteA AFTER DELETE ON tb_tipodispositivo_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriadispositivo
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoDispositivo_t,
		NOW(),
		3,
		'[datatabs_main].[tb_tipodispositivo_t]',
		CONCAT_WS('|', OLD.id_tipoDispositivo_t, OLD.tipoDispositivo, IFNULL(OLD.descripcion, ''), OLD.id_tipoDispositivo, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_dispositivo_createA;

DELIMITER //
CREATE TRIGGER tr_dispositivo_createA AFTER INSERT ON tb_dispositivo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriadispositivo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_dispositivo,
		NOW(),
		1,
		'[datatabs_main].[tb_dispositivo]',
		CONCAT_WS('|', NEW.id_dispositivo, NEW.nombre, NEW.identificacion, NEW.marca, NEW.modelo, NEW.serial, IFNULL(NEW.sistemaOperativo, ''), IFNULL(NEW.version, ''), NEW.fechaRegistro, NEW.id_tipoDispositivo, NEW.id_sucursal, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo, New.borrado)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_dispositivo_updateA;

DELIMITER //
CREATE TRIGGER tr_dispositivo_updateA AFTER UPDATE ON tb_dispositivo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriadispositivo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_dispositivo,
		NOW(),
		2,
		'[datatabs_main].[tb_dispositivo]',
		CONCAT_WS('|', OLD.id_dispositivo, OLD.nombre, OLD.identificacion, OLD.marca, OLD.modelo, OLD.serial, IFNULL(OLD.sistemaOperativo, ''), IFNULL(OLD.version, ''), NEW.fechaRegistro, OLD.id_tipoDispositivo, OLD.id_sucursal, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo, OLD.borrado),
		CONCAT_WS('|', NEW.id_dispositivo, NEW.nombre, NEW.identificacion, NEW.marca, NEW.modelo, NEW.serial, IFNULL(NEW.sistemaOperativo, ''), IFNULL(NEW.version, ''), NEW.fechaRegistro, NEW.id_tipoDispositivo, NEW.id_sucursal, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo, NEW.borrado)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_dispositivo_deleteA;

DELIMITER //
CREATE TRIGGER tr_dispositivo_deleteA AFTER DELETE ON tb_dispositivo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriadispositivo
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_dispositivo,
		NOW(),
		3,
		'[datatabs_main].[tb_dispositivo]',
		CONCAT_WS('|', OLD.id_dispositivo, OLD.nombre, OLD.identificacion, OLD.marca, OLD.modelo, OLD.serial, IFNULL(OLD.sistemaOperativo, ''), IFNULL(OLD.version, ''), OLD.fechaRegistro, OLD.id_tipoDispositivo, OLD.id_sucursal, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo, OLD.borrado)
	);
END;
//
DELIMITER ;
/* TABLAS DISPOSITIVO */


/* TABLAS MODEM*/
DROP TRIGGER IF EXISTS tr_modem_createA;

DELIMITER //
CREATE TRIGGER tr_modem_createA AFTER INSERT ON tb_modem
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamodem
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_modem,
		NOW(),
		1,
		'[datatabs_main].[tb_modem]',
		CONCAT_WS('|', NEW.id_modem, NEW.modem, IFNULL(NEW.descripcion, ''), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_modem_updateA;

DELIMITER //
CREATE TRIGGER tr_modem_updateA AFTER UPDATE ON tb_modem
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamodem
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_modem,
		NOW(),
		2,
		'[datatabs_main].[tb_modem]',
		CONCAT_WS('|', OLD.id_modem, OLD.modem, IFNULL(OLD.descripcion, ''), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_modem, NEW.modem, IFNULL(NEW.descripcion, ''), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_modem_deleteA;

DELIMITER //
CREATE TRIGGER tr_modem_deleteA AFTER DELETE ON tb_modem
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamodem
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_modem,
		NOW(),
		3,
		'[datatabs_main].[tb_modem]',
		CONCAT_WS('|', OLD.id_modem, OLD.modem, IFNULL(OLD.descripcion, ''), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS MODEM */


/* TABLAS CONSUMIDOR */
DROP TRIGGER IF EXISTS tr_tipoconsumidor_createA;

DELIMITER //
CREATE TRIGGER tr_tipoconsumidor_createA AFTER INSERT ON tb_tipoconsumidor
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaconsumidor
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoConsumidor,
		NOW(),
		1,
		'[datatabs_main].[tb_tipoconsumidor]',
		CONCAT_WS('|', NEW.id_tipoConsumidor, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipoconsumidor_updateA;

DELIMITER //
CREATE TRIGGER tr_tipoconsumidor_updateA AFTER UPDATE ON tb_tipoconsumidor
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaconsumidor
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoConsumidor,
		NOW(),
		2,
		'[datatabs_main].[tb_tipoconsumidor]',
		CONCAT_WS('|', OLD.id_tipoConsumidor, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoConsumidor, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipoconsumidor_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipoconsumidor_deleteA AFTER DELETE ON tb_tipoconsumidor
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaconsumidor
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoConsumidor,
		NOW(),
		3,
		'[datatabs_main].[tb_tipoconsumidor]',
		CONCAT_WS('|', OLD.id_tipoConsumidor, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipoconsumidor_t_createA;

DELIMITER //
CREATE TRIGGER tr_tipoconsumidor_t_createA AFTER INSERT ON tb_tipoconsumidor_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaconsumidor
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoConsumidor_t,
		NOW(),
		1,
		'[datatabs_main].[tb_tipoconsumidor_t]',
		CONCAT_WS('|', NEW.id_tipoConsumidor_t, NEW.tipoConsumidor, IFNULL(NEW.descripcion, ''), NEW.id_tipoConsumidor, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipoconsumidor_t_updateA;

DELIMITER //
CREATE TRIGGER tr_tipoconsumidor_t_updateA AFTER UPDATE ON tb_tipoconsumidor_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaconsumidor
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoConsumidor_t,
		NOW(),
		2,
		'[datatabs_main].[tb_tipoconsumidor_t]',
		CONCAT_WS('|', OLD.id_tipoConsumidor_t, OLD.tipoConsumidor, IFNULL(OLD.descripcion, ''), OLD.id_tipoConsumidor, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoConsumidor_t, NEW.tipoConsumidor, IFNULL(NEW.descripcion, ''), NEW.id_tipoConsumidor, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipoconsumidor_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipoconsumidor_t_deleteA AFTER DELETE ON tb_tipoconsumidor_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaconsumidor
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoConsumidor_t,
		NOW(),
		3,
		'[datatabs_main].[tb_tipoconsumidor_t]',
		CONCAT_WS('|', OLD.id_tipoConsumidor_t, OLD.tipoConsumidor, IFNULL(OLD.descripcion, ''), OLD.id_tipoConsumidor, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_consumidor_createA;

DELIMITER //
CREATE TRIGGER tr_consumidor_createA AFTER INSERT ON tb_consumidor
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaconsumidor
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_consumidor,
		NOW(),
		1,
		'[datatabs_main].[tb_consumidor]',
		CONCAT_WS('|', NEW.id_consumidor, IFNULL(NEW.nombres, ''), IFNULL(NEW.apellidos, ''), NEW.celular, IFNULL(NEW.correo, ''), IFNULL(NEW.twitter, ''), IFNULL(NEW.facebook, ''), IFNULL(NEW.fechaNacimiento, '01-01-1900'), NEW.fechaRegistro, IFNULL(NEW.id_tipoConsumidor, 0), IFNULL(NEW.id_sexo, 0), IFNULL(NEW.id_ciudad, ''), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_consumidor_updateA;

DELIMITER //
CREATE TRIGGER tr_consumidor_updateA AFTER UPDATE ON tb_consumidor
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaconsumidor
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_consumidor,
		NOW(),
		2,
		'[datatabs_main].[tb_consumidor]',
		CONCAT_WS('|', OLD.id_consumidor, IFNULL(OLD.nombres, ''), IFNULL(OLD.apellidos, ''), OLD.celular, IFNULL(OLD.correo, ''), IFNULL(OLD.twitter, ''), IFNULL(OLD.facebook, ''), IFNULL(OLD.fechaNacimiento, '01-01-1900'), OLD.fechaRegistro, IFNULL(OLD.id_tipoConsumidor, 0), IFNULL(OLD.id_sexo, 0), IFNULL(OLD.id_ciudad, ''), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_consumidor, IFNULL(NEW.nombres, ''), IFNULL(NEW.apellidos, ''), NEW.celular, IFNULL(NEW.correo, ''), IFNULL(NEW.twitter, ''), IFNULL(NEW.facebook, ''), IFNULL(NEW.fechaNacimiento, '01-01-1900'), NEW.fechaRegistro, IFNULL(NEW.id_tipoconsumidor, 0), IFNULL(NEW.id_sexo, 0), IFNULL(NEW.id_ciudad, ''), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_consumidor_deleteA;

DELIMITER //
CREATE TRIGGER tr_consumidor_deleteA AFTER DELETE ON tb_consumidor
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaconsumidor
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_consumidor,
		NOW(),
		3,
		'[datatabs_main].[tb_consumidor]',
		CONCAT_WS('|', OLD.id_consumidor, IFNULL(OLD.nombres, ''), IFNULL(OLD.apellidos, ''), OLD.celular, IFNULL(OLD.correo, ''), IFNULL(OLD.twitter, ''), IFNULL(OLD.facebook, ''), IFNULL(OLD.fechaNacimiento, '01-01-1900'), OLD.fechaRegistro, IFNULL(OLD.id_tipoConsumidor, 0), IFNULL(OLD.id_sexo, 0), IFNULL(OLD.id_ciudad, ''), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;
/* TABLAS CONSUMIDOR */


/* TABLAS MULTIMEDIA */
DROP TRIGGER IF EXISTS tr_tipoimagen_createA;

DELIMITER //
CREATE TRIGGER tr_tipoimagen_createA AFTER INSERT ON tb_tipoimagen
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamultimedia
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoImagen,
		NOW(),
		1,
		'[datatabs_main].[tb_tipoimagen]',
		CONCAT_WS('|', NEW.id_tipoImagen, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipoimagen_updateA;

DELIMITER //
CREATE TRIGGER tr_tipoimagen_updateA AFTER UPDATE ON tb_tipoimagen
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamultimedia
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoImagen,
		NOW(),
		2,
		'[datatabs_main].[tb_tipoimagen]',
		CONCAT_WS('|', OLD.id_tipoImagen, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoImagen, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipoimagen_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipoimagen_deleteA AFTER DELETE ON tb_tipoimagen
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamultimedia
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoImagen,
		NOW(),
		3,
		'[datatabs_main].[tb_tipoimagen]',
		CONCAT_WS('|', OLD.id_tipoImagen, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipoimagen_t_createA;

DELIMITER //
CREATE TRIGGER tr_tipoimagen_t_createA AFTER INSERT ON tb_tipoimagen_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamultimedia
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoImagen_t,
		NOW(),
		1,
		'[datatabs_main].[tb_tipoimagen_t]',
		CONCAT_WS('|', NEW.id_tipoImagen_t, NEW.tipoImagen, IFNULL(NEW.descripcion, ''), NEW.id_tipoImagen, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipoimagen_t_updateA;

DELIMITER //
CREATE TRIGGER tr_tipoimagen_t_updateA AFTER UPDATE ON tb_tipoimagen_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamultimedia
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoImagen_t,
		NOW(),
		2,
		'[datatabs_main].[tb_tipoimagen_t]',
		CONCAT_WS('|', OLD.id_tipoImagen_t, OLD.tipoImagen, IFNULL(OLD.descripcion, ''), OLD.id_tipoImagen, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoImagen_t, NEW.tipoImagen, IFNULL(NEW.descripcion, ''), NEW.id_tipoImagen, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipoimagen_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipoimagen_t_deleteA AFTER DELETE ON tb_tipoimagen_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamultimedia
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoImagen_t,
		NOW(),
		3,
		'[datatabs_main].[tb_tipoimagen_t]',
		CONCAT_WS('|', OLD.id_tipoImagen_t, OLD.tipoImagen, IFNULL(OLD.descripcion, ''), OLD.id_tipoImagen, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_imagen_createA;

DELIMITER //
CREATE TRIGGER tr_imagen_createA AFTER INSERT ON tb_imagen
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamultimedia
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_imagen,
		NOW(),
		1,
		'[datatabs_main].[tb_imagen]',
		CONCAT_WS('|', NEW.id_imagen, NEW.imagen, NEW.fechaRegistro, IFNULL(NEW.fechaActualizacion, '1900-01-01 00:00:00.000'), NEW.id_tipoImagen, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_imagen_updateA;

DELIMITER //
CREATE TRIGGER tr_imagen_updateA AFTER UPDATE ON tb_imagen
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamultimedia
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_imagen,
		NOW(),
		2,
		'[datatabs_main].[tb_imagen]',
		CONCAT_WS('|', OLD.id_imagen, OLD.imagen, OLD.fechaRegistro, IFNULL(OLD.fechaActualizacion, '1900-01-01 00:00:00.000'), OLD.id_tipoImagen, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_imagen, NEW.imagen, NEW.fechaRegistro, IFNULL(NEW.fechaActualizacion, '1900-01-01 00:00:00.000'), NEW.id_tipoImagen, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_imagen_deleteA;

DELIMITER //
CREATE TRIGGER tr_imagen_deleteA AFTER DELETE ON tb_imagen
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamultimedia
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_imagen,
		NOW(),
		3,
		'[datatabs_main].[tb_imagen]',
		CONCAT_WS('|', OLD.id_imagen, OLD.imagen, OLD.fechaRegistro, IFNULL(OLD.fechaActualizacion, '1900-01-01 00:00:00.000'), OLD.id_tipoImagen, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_video_createA;

DELIMITER //
CREATE TRIGGER tr_video_createA AFTER INSERT ON tb_video
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamultimedia
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_video,
		NOW(),
		1,
		'[datatabs_main].[tb_video]',
		CONCAT_WS('|', NEW.id_video, NEW.video, NEW.fechaRegistro, IFNULL(NEW.fechaActualizacion, '1900-01-01 00:00:00.000'), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_video_updateA;

DELIMITER //
CREATE TRIGGER tr_video_updateA AFTER UPDATE ON tb_video
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamultimedia
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_video,
		NOW(),
		2,
		'[datatabs_main].[tb_video]',
		CONCAT_WS('|', OLD.id_video, OLD.video, OLD.fechaRegistro, IFNULL(OLD.fechaActualizacion, '1900-01-01 00:00:00.000'), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_video, NEW.video, NEW.fechaRegistro, IFNULL(NEW.fechaActualizacion, '1900-01-01 00:00:00.000'), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_video_deleteA;

DELIMITER //
CREATE TRIGGER tr_video_deleteA AFTER DELETE ON tb_video
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamultimedia
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_video,
		NOW(),
		3,
		'[datatabs_main].[tb_video]',
		CONCAT_WS('|', OLD.id_video, OLD.video, OLD.fechaRegistro, IFNULL(OLD.fechaActualizacion, '1900-01-01 00:00:00.000'), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;
/* TABLAS MULTIMEDIA */


/* TABLAS EVENTO */
DROP TRIGGER IF EXISTS tr_evento_createA;

DELIMITER //
CREATE TRIGGER tr_evento_createA AFTER INSERT ON tb_evento
FOR EACH ROW
BEGIN
	DECLARE id_nodo INT         DEFAULT -1;
	DECLARE mensaje VARCHAR(50) DEFAULT '';

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN 
			SIGNAL SQLSTATE 'ERROR'
			SET MESSAGE_TEXT = 'ERROR - 0 - Ocurrio una excepcion';
		END;

	INSERT INTO tb_nodo(id_evento, inicio, id_tipoNodo, id_usuarioCreador)
	VALUES (NEW.id_evento, 1, 1, NEW.id_usuarioCreador);

	SET id_nodo = LAST_INSERT_ID();

	IF id_nodo <= 0 THEN
		SET mensaje = CONCAT('ERROR - 1 - Creando nodo nodo inicial para el evento', NEW.id_evento, ' - ', NEW.evento);
		SIGNAL SQLSTATE 'ERROR'
		SET MESSAGE_TEXT = mensaje;
	END IF;

	/* AUDITORIA */
	INSERT INTO tb_auditoriaevento
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_evento,
		NOW(),
		1,
		'[datatabs_main].[tb_evento]',
		CONCAT_WS('|', NEW.id_evento, NEW.evento, IFNULL(NEW.descripcion, ''), NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), IFNULL(NEW.id_usuariod, 0), NEW.id_empresa, IFNULL(NEW.id_imagen, 0), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_evento_updateA;

DELIMITER //
CREATE TRIGGER tr_evento_updateA AFTER UPDATE ON tb_evento
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaevento
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_evento,
		NOW(),
		2,
		'[datatabs_main].[tb_evento]',
		CONCAT_WS('|', OLD.id_evento, OLD.evento, IFNULL(OLD.descripcion, ''), OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), IFNULL(OLD.id_usuariod, 0), OLD.id_empresa, IFNULL(OLD.id_imagen, 0), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_evento, NEW.evento, IFNULL(NEW.descripcion, ''), NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), IFNULL(NEW.id_usuariod, 0), NEW.id_empresa, IFNULL(NEW.id_imagen, 0), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_evento_deleteA;

DELIMITER //
CREATE TRIGGER tr_evento_deleteA AFTER DELETE ON tb_evento
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaevento
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_evento,
		NOW(),
		3,
		'[datatabs_main].[tb_evento]',
		CONCAT_WS('|', OLD.id_evento, OLD.evento, IFNULL(OLD.descripcion, ''), OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), IFNULL(OLD.id_usuariod, 0), OLD.id_empresa, IFNULL(OLD.id_imagen, 0), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS EVENTO */


/* TABLAS NODO */
DROP TRIGGER IF EXISTS tr_tiponodo_createA;

DELIMITER //
CREATE TRIGGER tr_tiponodo_createA AFTER INSERT ON tb_tiponodo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditorianodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoNodo,
		NOW(),
		1,
		'[datatabs_main].[tb_tiponodo]',
		CONCAT_WS('|', NEW.id_tipoNodo, NEW.codigo, IFNULL(NEW.id_imagen, 0), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tiponodo_updateA;

DELIMITER //
CREATE TRIGGER tr_tiponodo_updateA AFTER UPDATE ON tb_tiponodo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditorianodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoNodo,
		NOW(),
		2,
		'[datatabs_main].[tb_tiponodo]',
		CONCAT_WS('|', OLD.id_tipoNodo, OLD.codigo, IFNULL(OLD.id_imagen, 0), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoNodo, NEW.codigo, IFNULL(NEW.id_imagen, 0), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tiponodo_deleteA;

DELIMITER //
CREATE TRIGGER tr_tiponodo_deleteA AFTER DELETE ON tb_tiponodo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditorianodo
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoNodo,
		NOW(),
		3,
		'[datatabs_main].[tb_tiponodo]',
		CONCAT_WS('|', OLD.id_tipoNodo, OLD.codigo, IFNULL(OLD.id_imagen, 0), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tiponodo_t_createA;

DELIMITER //
CREATE TRIGGER tr_tiponodo_t_createA AFTER INSERT ON tb_tiponodo_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditorianodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoNodo_t,
		NOW(),
		1,
		'[datatabs_main].[tb_tipodispositivo_t]',
		CONCAT_WS('|', NEW.id_tipoNodo_t, NEW.tipoNodo, IFNULL(NEW.descripcion, ''), NEW.id_tipoNodo, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tiponodo_t_updateA;

DELIMITER //
CREATE TRIGGER tr_tiponodo_t_updateA AFTER UPDATE ON tb_tiponodo_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditorianodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoNodo_t,
		NOW(),
		2,
		'[datatabs_main].[tb_tiponodo_t]',
		CONCAT_WS('|', OLD.id_tipoNodo_t, OLD.tipoNodo, IFNULL(OLD.descripcion, ''), OLD.id_tipoNodo, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoNodo_t, NEW.tipoNodo, IFNULL(NEW.descripcion, ''), NEW.id_tipoNodo, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tiponodo_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_tiponodo_t_deleteA AFTER DELETE ON tb_tiponodo_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditorianodo
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoNodo_t,
		NOW(),
		3,
		'[datatabs_main].[tb_tiponodo_t]',
		CONCAT_WS('|', OLD.id_tipoNodo_t, OLD.tipoNodo, IFNULL(OLD.descripcion, ''), OLD.id_tipoNodo, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_nodo_createA;

DELIMITER //
CREATE TRIGGER tr_nodo_createA AFTER INSERT ON tb_nodo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditorianodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_nodo,
		NOW(),
		1,
		'[datatabs_main].[tb_nodo]',
		CONCAT_WS('|', NEW.id_nodo, NEW.inicio, NEW.condicion, NEW.id_evento, NEW.id_tipoNodo, IFNULL(NEW.id_objeto, 0), IFNULL(NEW.id_tipoNodoPadre, 0), IFNULL(NEW.id_objetoPadre, 0), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_nodo_updateA;

DELIMITER //
CREATE TRIGGER tr_nodo_updateA AFTER UPDATE ON tb_nodo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditorianodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_nodo,
		NOW(),
		2,
		'[datatabs_main].[tb_nodo]',
		CONCAT_WS('|', OLD.id_nodo, OLD.inicio, OLD.condicion, OLD.id_evento, OLD.id_tipoNodo, IFNULL(OLD.id_objeto, 0), IFNULL(OLD.id_tipoNodoPadre, 0), IFNULL(OLD.id_objetoPadre, 0), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_nodo, NEW.inicio, NEW.condicion, NEW.id_evento, NEW.id_tipoNodo, IFNULL(NEW.id_objeto, 0), IFNULL(NEW.id_tipoNodoPadre, 0), IFNULL(NEW.id_objetoPadre, 0), IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_nodo_deleteA;

DELIMITER //
CREATE TRIGGER tr_nodo_deleteA AFTER DELETE ON tb_nodo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditorianodo
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_nodo,
		NOW(),
		3,
		'[datatabs_main].[tb_nodo]',
		CONCAT_WS('|', OLD.id_nodo, OLD.inicio, OLD.condicion, OLD.id_evento, OLD.id_tipoNodo, IFNULL(OLD.id_objeto, 0), IFNULL(OLD.id_tipoNodoPadre, 0), IFNULL(OLD.id_objetoPadre, 0), IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;
/* TABLAS NODO */


/* TABLAS TIEMPOESPERA */
DROP TRIGGER IF EXISTS tr_tipotiempoespera_createA;

DELIMITER //
CREATE TRIGGER tr_tipotiempoespera_createA AFTER INSERT ON tb_tipotiempoespera
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriatiempoespera
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoTiempoEspera,
		NOW(),
		1,
		'[datatabs_main].[tb_tipotiempoespera]',
		CONCAT_WS('|', NEW.id_tipoTiempoEspera, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipotiempoespera_updateA;

DELIMITER //
CREATE TRIGGER tr_tipotiempoespera_updateA AFTER UPDATE ON tb_tipotiempoespera
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriatiempoespera
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoTiempoEspera,
		NOW(),
		2,
		'[datatabs_main].[tb_tipotiempoespera]',
		CONCAT_WS('|', OLD.id_tipoTiempoEspera, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoTiempoEspera, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipotiempoespera_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipotiempoespera_deleteA AFTER DELETE ON tb_tipotiempoespera
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriatiempoespera
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoTiempoEspera,
		NOW(),
		3,
		'[datatabs_main].[tb_tipotiempoespera]',
		CONCAT_WS('|', OLD.id_tipoTiempoEspera, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipotiempoespera_t_createA;

DELIMITER //
CREATE TRIGGER tr_tipotiempoespera_t_createA AFTER INSERT ON tb_tipotiempoespera_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriatiempoespera
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoTiempoEspera_t,
		NOW(),
		1,
		'[datatabs_main].[tb_tipotiempoespera_t]',
		CONCAT_WS('|', NEW.id_tipoTiempoEspera_t, NEW.tipoTiempoEspera, IFNULL(NEW.descripcion, ''), NEW.id_tipoTiempoEspera, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipotiempoespera_t_updateA;

DELIMITER //
CREATE TRIGGER tr_tipotiempoespera_t_updateA AFTER UPDATE ON tb_tipotiempoespera_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriatiempoespera
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoTiempoEspera_t,
		NOW(),
		2,
		'[datatabs_main].[tb_tipotiempoespera_t]',
		CONCAT_WS('|', OLD.id_tipoTiempoEspera_t, OLD.tipoTiempoEspera, IFNULL(OLD.descripcion, ''), OLD.id_tipoTiempoEspera, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoTiempoEspera_t, NEW.tipoTiempoEspera, IFNULL(NEW.descripcion, ''), NEW.id_tipoTiempoEspera, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipotiempoespera_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipotiempoespera_t_deleteA AFTER DELETE ON tb_tipotiempoespera_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriatiempoespera
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoTiempoEspera_t,
		NOW(),
		3,
		'[datatabs_main].[tb_tipotiempoespera_t]',
		CONCAT_WS('|', OLD.id_tipoTiempoEspera_t, OLD.tipoTiempoEspera, IFNULL(OLD.descripcion, ''), OLD.id_tipoTiempoEspera, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tiempoespera_createA;

DELIMITER //
CREATE TRIGGER tr_tiempoespera_createA AFTER INSERT ON tb_tiempoespera
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriatiempoespera
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tiempoEspera,
		NOW(),
		1,
		'[datatabs_main].[tb_tiempoespera]',
		CONCAT_WS('|', NEW.id_tiempoEspera, NEW.tiempoEspera, NEW.id_tipoTiempoEspera, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tiempoespera_updateA;

DELIMITER //
CREATE TRIGGER tr_tiempoespera_updateA AFTER UPDATE ON tb_tiempoespera
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriatiempoespera
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tiempoEspera,
		NOW(),
		2,
		'[datatabs_main].[tb_tiempoespera]',
		CONCAT_WS('|', OLD.id_tiempoEspera, OLD.tiempoEspera, OLD.id_tipoTiempoEspera, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_tiempoEspera, NEW.tiempoEspera, NEW.id_tipoTiempoEspera, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tiempoespera_deleteA;

DELIMITER //
CREATE TRIGGER tr_tiempoespera_deleteA AFTER DELETE ON tb_tiempoespera
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriatiempoespera
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tiempoEspera,
		NOW(),
		3,
		'[datatabs_main].[tb_tiempoespera]',
		CONCAT_WS('|', OLD.id_tiempoEspera, OLD.tiempoEspera, OLD.id_tipoTiempoEspera, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;
/* TABLAS TIEMPOESPERA */


/* TABLAS CHECKIN */
DROP TRIGGER IF EXISTS tr_checkin_createA;

DELIMITER //
CREATE TRIGGER tr_checkin_createA AFTER INSERT ON tb_checkin
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacheckin
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_checkin,
		NOW(),
		1,
		'[datatabs_main].[tb_checkin]',
		CONCAT_WS('|', NEW.id_checkin, IFNULL(NEW.background, ''), IFNULL(NEW.teclado, ''), NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), NEW.contador, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_checkin_updateA;

DELIMITER //
CREATE TRIGGER tr_checkin_updateA AFTER UPDATE ON tb_checkin
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacheckin
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_checkin,
		NOW(),
		2,
		'[datatabs_main].[tb_checkin]',
		CONCAT_WS('|', OLD.id_checkin, IFNULL(OLD.background, ''), IFNULL(OLD.teclado, ''), OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), OLD.contador, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_checkin, IFNULL(NEW.background, ''), IFNULL(NEW.teclado, ''), NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), NEW.contador, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_checkin_deleteA;

DELIMITER //
CREATE TRIGGER tr_checkin_deleteA AFTER DELETE ON tb_checkin
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacheckin
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_checkin,
		NOW(),
		3,
		'[datatabs_main].[tb_checkin]',
		CONCAT_WS('|', OLD.id_checkin, IFNULL(OLD.background, ''), IFNULL(OLD.teclado, ''), OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), OLD.contador, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;
/* TABLAS CHECKIN */


/* TABLAS PREGUNTA */
DROP TRIGGER IF EXISTS tr_tipopregunta_createA;

DELIMITER //
CREATE TRIGGER tr_tipopregunta_createA AFTER INSERT ON tb_tipopregunta
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriapregunta
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoPregunta,
		NOW(),
		1,
		'[datatabs_main].[tb_tipopregunta]',
		CONCAT_WS('|', NEW.id_tipoPregunta, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipopregunta_updateA;

DELIMITER //
CREATE TRIGGER tr_tipopregunta_updateA AFTER UPDATE ON tb_tipopregunta
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriapregunta
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoPregunta,
		NOW(),
		2,
		'[datatabs_main].[tb_tipoconsumidor]',
		CONCAT_WS('|', OLD.id_tipoPregunta, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoPregunta, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipopregunta_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipopregunta_deleteA AFTER DELETE ON tb_tipopregunta
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriapregunta
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoPregunta,
		NOW(),
		3,
		'[datatabs_main].[tb_tipoconsumidor]',
		CONCAT_WS('|', OLD.id_tipoPregunta, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipopregunta_t_createA;

DELIMITER //
CREATE TRIGGER tr_tipopregunta_t_createA AFTER INSERT ON tb_tipopregunta_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriapregunta
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoPregunta_t,
		NOW(),
		1,
		'[datatabs_main].[tb_tipopregunta_t]',
		CONCAT_WS('|', NEW.id_tipoPregunta_t, NEW.tipoPregunta, IFNULL(NEW.descripcion, ''), NEW.id_tipoPregunta, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipopregunta_t_updateA;

DELIMITER //
CREATE TRIGGER tr_tipopregunta_t_updateA AFTER UPDATE ON tb_tipopregunta_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriapregunta
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoPregunta_t,
		NOW(),
		2,
		'[datatabs_main].[tb_tipopregunta_t]',
		CONCAT_WS('|', OLD.id_tipoPregunta_t, OLD.tipoPregunta, IFNULL(OLD.descripcion, ''), OLD.id_tipoPregunta, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoPregunta_t, NEW.tipoPregunta, IFNULL(NEW.descripcion, ''), NEW.id_tipoPregunta, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipopregunta_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipopregunta_t_deleteA AFTER DELETE ON tb_tipopregunta_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriapregunta
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoPregunta_t,
		NOW(),
		3,
		'[datatabs_main].[tb_tipopregunta_t]',
		CONCAT_WS('|', OLD.id_tipoPregunta_t, OLD.tipoPregunta, IFNULL(OLD.descripcion, ''), OLD.id_tipoPregunta, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_pregunta_createA;

DELIMITER //
CREATE TRIGGER tr_pregunta_createA AFTER INSERT ON tb_pregunta
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriapregunta
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_pregunta,
		NOW(),
		1,
		'[datatabs_main].[tb_pregunta]',
		CONCAT_WS('|', NEW.id_pregunta, IFNULL(NEW.background, 0), NEW.pregunta, NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), NEW.id_tipoPregunta, IFNULL(NEW.id_tiempoEspera, 0), NEW.contador, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_pregunta_updateA;

DELIMITER //
CREATE TRIGGER tr_pregunta_updateA AFTER UPDATE ON tb_pregunta
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriapregunta
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_pregunta,
		NOW(),
		2,
		'[datatabs_main].[tb_pregunta]',
		CONCAT_WS('|', OLD.id_pregunta, IFNULL(OLD.background, 0), OLD.pregunta, OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), OLD.id_tipoPregunta, IFNULL(OLD.id_tiempoEspera, 0), OLD.contador, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_pregunta, IFNULL(NEW.background, 0), NEW.pregunta, NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), NEW.id_tipoPregunta, IFNULL(NEW.id_tiempoEspera, 0), NEW.contador, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_pregunta_deleteA;

DELIMITER //
CREATE TRIGGER tr_pregunta_deleteA AFTER DELETE ON tb_pregunta
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriapregunta
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_pregunta,
		NOW(),
		3,
		'[datatabs_main].[tb_pregunta]',
		CONCAT_WS('|', OLD.id_pregunta, IFNULL(OLD.background, 0), OLD.pregunta, OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), OLD.id_tipoPregunta, IFNULL(OLD.id_tiempoEspera, 0), OLD.contador, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_respuestaopcion_createA;

DELIMITER //
CREATE TRIGGER tr_respuestaopcion_createA AFTER INSERT ON tb_respuestaopcion
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriarespuesta
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_respuestaOpcion,
		NOW(),
		1,
		'[datatabs_main].[tb_respuestaopcion]',
		CONCAT_WS('|', NEW.id_respuestaOpcion, NEW.respuestaOpcion, NEW.correcta, NEW.id_pregunta, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_respuestaopcion_updateA;

DELIMITER //
CREATE TRIGGER tr_respuestaopcion_updateA AFTER UPDATE ON tb_respuestaopcion
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriarespuesta
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_respuestaOpcion,
		NOW(),
		2,
		'[datatabs_main].[tb_respuestaopcion]',
		CONCAT_WS('|', OLD.id_respuestaOpcion, OLD.respuestaOpcion, OLD.correcta, OLD.id_pregunta, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_respuestaOpcion, NEW.respuestaOpcion, NEW.correcta, NEW.id_pregunta, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_respuestaopcion_deleteA;

DELIMITER //
CREATE TRIGGER tr_respuestaopcion_deleteA AFTER DELETE ON tb_respuestaopcion
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriarespuesta
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_respuestaOpcion,
		NOW(),
		3,
		'[datatabs_main].[tb_respuestaopcion]',
		CONCAT_WS('|', OLD.id_respuestaOpcion, OLD.respuestaOpcion, OLD.correcta, OLD.id_pregunta, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_respuestaopcion_createB;

DELIMITER //
CREATE TRIGGER tr_respuestaopcion_createB BEFORE INSERT ON tb_respuestaopcion
FOR EACH ROW
BEGIN
	DECLARE max_respuestas, contador INT         DEFAULT 0;
	DECLARE mensaje                  VARCHAR(50) DEFAULT '';
	SET max_respuestas = 5;

	SELECT COUNT(*) INTO contador 
	FROM tb_respuestaopcion
	WHERE id_pregunta = NEW.id_pregunta AND activo = 1;

	IF contador >= max_respuestas THEN
		SET mensaje = CONCAT('No se pueden insertar mas de ', max_respuestas, ' respuestas por pregunta.');
		SIGNAL SQLSTATE 'ERROR'
		SET MESSAGE_TEXT = mensaje;	
	END IF;
END;
//
DELIMITER ;
/* TABLAS PREGUNTA */


/* TABLAS MENSAJE */
DROP TRIGGER IF EXISTS tr_tipomensaje_createA;

DELIMITER //
CREATE TRIGGER tr_tipomensaje_createA AFTER INSERT ON tb_tipomensaje
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamensaje
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoMensaje,
		NOW(),
		1,
		'[datatabs_main].[tb_tipomensaje]',
		CONCAT_WS('|', NEW.id_tipoMensaje, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipomensaje_updateA;

DELIMITER //
CREATE TRIGGER tr_tipomensaje_updateA AFTER UPDATE ON tb_tipomensaje
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamensaje
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoMensaje,
		NOW(),
		2,
		'[datatabs_main].[tb_tipomensaje]',
		CONCAT_WS('|', OLD.id_tipoMensaje, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoMensaje, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipomensaje_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipomensaje_deleteA AFTER DELETE ON tb_tipomensaje
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamensaje
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoMensaje,
		NOW(),
		3,
		'[datatabs_main].[tb_tipomensaje]',
		CONCAT_WS('|', OLD.id_tipoMensaje, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipomensaje_t_createA;

DELIMITER //
CREATE TRIGGER tr_tipomensaje_t_createA AFTER INSERT ON tb_tipomensaje_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamensaje
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoMensaje_t,
		NOW(),
		1,
		'[datatabs_main].[tb_tipomensaje_t]',
		CONCAT_WS('|', NEW.id_tipoMensaje_t, NEW.tipoMensaje, IFNULL(NEW.descripcion, ''), NEW.id_tipoMensaje, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipomensaje_t_updateA;

DELIMITER //
CREATE TRIGGER tr_tipomensaje_t_updateA AFTER UPDATE ON tb_tipomensaje_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamensaje
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoMensaje_t,
		NOW(),
		2,
		'[datatabs_main].[tb_tipopregunta_t]',
		CONCAT_WS('|', OLD.id_tipoMensaje_t, OLD.tipoMensaje, IFNULL(OLD.descripcion, ''), OLD.id_tipoMensaje, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoMensaje_t, NEW.tipoMensaje, IFNULL(NEW.descripcion, ''), NEW.id_tipoMensaje, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipomensaje_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipomensaje_t_deleteA AFTER DELETE ON tb_tipomensaje_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamensaje
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoMensaje_t,
		NOW(),
		3,
		'[datatabs_main].[tb_tipomensaje_t]',
		CONCAT_WS('|', OLD.id_tipoMensaje_t, OLD.tipoMensaje, IFNULL(OLD.descripcion, ''), OLD.id_tipoMensaje, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_mensaje_createA;

DELIMITER //
CREATE TRIGGER tr_mensaje_createA AFTER INSERT ON tb_mensaje
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamensaje
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_mensaje,
		NOW(),
		1,
		'[datatabs_main].[tb_mensaje]',
		CONCAT_WS('|', NEW.id_mensaje, NEW.mensaje, NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), NEW.id_tipoMensaje, IFNULL(NEW.id_tiempoEspera, 0), NEW.contador, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_mensaje_updateA;

DELIMITER //
CREATE TRIGGER tr_mensaje_updateA AFTER UPDATE ON tb_mensaje
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamensaje
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_mensaje,
		NOW(),
		2,
		'[datatabs_main].[tb_mensaje]',
		CONCAT_WS('|', OLD.id_mensaje, OLD.mensaje, OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), OLD.id_tipoMensaje, IFNULL(OLD.id_tiempoEspera, 0), OLD.contador, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_mensaje, NEW.mensaje, NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), NEW.id_tipoMensaje, IFNULL(NEW.id_tiempoEspera, 0), NEW.contador, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_mensaje_deleteA;

DELIMITER //
CREATE TRIGGER tr_mensaje_deleteA AFTER DELETE ON tb_mensaje
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamensaje
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_mensaje,
		NOW(),
		3,
		'[datatabs_main].[tb_mensaje]',
		CONCAT_WS('|', OLD.id_mensaje, OLD.mensaje, OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), OLD.id_tipoMensaje, IFNULL(OLD.id_tiempoEspera, 0), OLD.contador, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;
/* TABLAS MENSAJE */


/* TABLAS FORMULARIOCONSUMIDOR */
DROP TRIGGER IF EXISTS tr_formularioconsumidor_createA;

DELIMITER //
CREATE TRIGGER tr_formularioconsumidor_createA AFTER INSERT ON tb_formularioconsumidor
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaformularioconsumidor
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_formularioConsumidor,
		NOW(),
		1,
		'[datatabs_main].[tb_formularioconsumidor]',
		CONCAT_WS('|', NEW.id_formularioconsumidor, NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), NEW.nombres, NEW.apellidos, NEW.correo, NEW.twitter, NEW.facebook, NEW.edad, NEW.sexo, NEW.ciudad, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_formularioconsumidor_updateA;

DELIMITER //
CREATE TRIGGER tr_formularioconsumidor_updateA AFTER UPDATE ON tb_formularioconsumidor
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaformularioconsumidor
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_formularioConsumidor,
		NOW(),
		2,
		'[datatabs_main].[tb_formularioconsumidor]',
		CONCAT_WS('|', OLD.id_formularioconsumidor, OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), OLD.nombres, OLD.apellidos, OLD.correo, OLD.twitter, OLD.facebook, OLD.edad, OLD.sexo, OLD.ciudad, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_formularioconsumidor, NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), NEW.nombres, NEW.apellidos, NEW.correo, NEW.twitter, NEW.facebook, NEW.edad, NEW.sexo, NEW.ciudad, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_formularioconsumidor_deleteA;

DELIMITER //
CREATE TRIGGER tr_formularioconsumidor_deleteA AFTER DELETE ON tb_formularioconsumidor
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaformularioconsumidor
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_formularioConsumidor,
		NOW(),
		3,
		'[datatabs_main].[tb_formularioconsumidor]',
		CONCAT_WS('|', OLD.id_formularioconsumidor, OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), OLD.nombres, OLD.apellidos, OLD.correo, OLD.twitter, OLD.facebook, OLD.edad, OLD.sexo, OLD.ciudad, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;
/* TABLAS FORMULARIOCONSUMIDOR */


/* TABLAS MENSAJEPANTALLA */
DROP TRIGGER IF EXISTS tr_mensajepantalla_createA;

DELIMITER //
CREATE TRIGGER tr_mensajepantalla_createA AFTER INSERT ON tb_mensajepantalla
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamensajepantalla
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_mensajepantalla,
		NOW(),
		1,
		'[datatabs_main].[tb_mensajepantalla]',
		CONCAT_WS('|', NEW.id_mensajepantalla, IFNULL(NEW.background, 0), IFNULL(NEW.video, 0), NEW.mensaje, NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), IFNULL(NEW.id_tiempoEspera, 0), NEW.contador, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_mensajepantalla_updateA;

DELIMITER //
CREATE TRIGGER tr_mensajepantalla_updateA AFTER UPDATE ON tb_mensajepantalla
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamensajepantalla
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_mensajepantalla,
		NOW(),
		2,
		'[datatabs_main].[tb_mensajepantalla]',
		CONCAT_WS('|', OLD.id_mensajepantalla, IFNULL(OLD.background, 0), IFNULL(OLD.video, 0), OLD.mensaje, OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), IFNULL(OLD.id_tiempoEspera, 0), OLD.contador, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_mensajepantalla, IFNULL(NEW.background, 0), IFNULL(NEW.video, 0), NEW.mensaje, NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), IFNULL(NEW.id_tiempoEspera, 0), NEW.contador, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_mensajepantalla_deleteA;

DELIMITER //
CREATE TRIGGER tr_mensajepantalla_deleteA AFTER DELETE ON tb_mensajepantalla
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriamensajepantalla
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_mensajepantalla,
		NOW(),
		3,
		'[datatabs_main].[tb_mensajepantalla]',
		CONCAT_WS('|', OLD.id_mensajepantalla, IFNULL(OLD.background, 0), IFNULL(OLD.video, 0), OLD.mensaje, OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), IFNULL(OLD.id_tiempoEspera, 0), OLD.contador, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;
/* TABLAS MENSAJEPANTALLA */


/* TABLAS INVITACION */
DROP TRIGGER IF EXISTS tr_tipoinvitacion_createA;

DELIMITER //
CREATE TRIGGER tr_tipoinvitacion_createA AFTER INSERT ON tb_tipoinvitacion
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriainvitacion
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoInvitacion,
		NOW(),
		1,
		'[datatabs_main].[tb_tipoinvitacion]',
		CONCAT_WS('|', NEW.id_tipoInvitacion, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipoinvitacion_updateA;

DELIMITER //
CREATE TRIGGER tr_tipoinvitacion_updateA AFTER UPDATE ON tb_tipoinvitacion
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriainvitacion
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoInvitacion,
		NOW(),
		2,
		'[datatabs_main].[tb_tipoinvitacion]',
		CONCAT_WS('|', OLD.id_tipoInvitacion, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoInvitacion, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipoinvitacion_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipoinvitacion_deleteA AFTER DELETE ON tb_tipoinvitacion
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriainvitacion
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoInvitacion,
		NOW(),
		3,
		'[datatabs_main].[tb_tipoinvitacion]',
		CONCAT_WS('|', OLD.id_tipoInvitacion, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipoinvitacion_t_createA;

DELIMITER //
CREATE TRIGGER tr_tipoinvitacion_t_createA AFTER INSERT ON tb_tipoinvitacion_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriainvitacion
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoInvitacion_t,
		NOW(),
		1,
		'[datatabs_main].[tb_tipoinvitacion_t]',
		CONCAT_WS('|', NEW.id_tipoInvitacion_t, NEW.tipoInvitacion, IFNULL(NEW.descripcion, ''), NEW.id_tipoInvitacion, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipoinvitacion_t_updateA;

DELIMITER //
CREATE TRIGGER tr_tipoinvitacion_t_updateA AFTER UPDATE ON tb_tipoinvitacion_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriainvitacion
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoInvitacion_t,
		NOW(),
		2,
		'[datatabs_main].[tb_tipoinvitacion_t]',
		CONCAT_WS('|', OLD.id_tipoInvitacion_t, OLD.tipoInvitacion, IFNULL(OLD.descripcion, ''), OLD.id_tipoInvitacion, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoInvitacion_t, NEW.tipoInvitacion, IFNULL(NEW.descripcion, ''), NEW.id_tipoInvitacion, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipoinvitacion_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipoinvitacion_t_deleteA AFTER DELETE ON tb_tipoinvitacion_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriainvitacion
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoInvitacion_t,
		NOW(),
		3,
		'[datatabs_main].[tb_tipomensaje_t]',
		CONCAT_WS('|', OLD.id_tipoInvitacion_t, OLD.tipoInvitacion, IFNULL(OLD.descripcion, ''), OLD.id_tipoInvitacion, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_invitacion_createA;

DELIMITER //
CREATE TRIGGER tr_invitacion_createA AFTER INSERT ON tb_invitacion
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriainvitacion
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_invitacion,
		NOW(),
		1,
		'[datatabs_main].[tb_invitacion]',
		CONCAT_WS('|', NEW.id_invitacion, NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), IFNULL(NEW.nota, ''), NEW.abierta, NEW.id_tipoInvitacion, NEW.contador, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_invitacion_updateA;

DELIMITER //
CREATE TRIGGER tr_invitacion_updateA AFTER UPDATE ON tb_invitacion
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriainvitacion
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_invitacion,
		NOW(),
		2,
		'[datatabs_main].[tb_invitacion]',
		CONCAT_WS('|', OLD.id_invitacion, OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), IFNULL(OLD.nota, ''), OLD.abierta, OLD.id_tipoInvitacion, OLD.contador, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_invitacion, NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), IFNULL(NEW.nota, ''), NEW.abierta, NEW.id_tipoInvitacion, NEW.contador, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_invitacion_deleteA;

DELIMITER //
CREATE TRIGGER tr_invitacion_deleteA AFTER DELETE ON tb_invitacion
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriainvitacion
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_invitacion,
		NOW(),
		3,
		'[datatabs_main].[tb_invitacion]',
		CONCAT_WS('|', OLD.id_invitacion, OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), IFNULL(OLD.nota, ''), OLD.abierta, OLD.id_tipoInvitacion, OLD.contador, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_datosinvitacion_createA;

DELIMITER //
CREATE TRIGGER tr_datosinvitacion_createA AFTER INSERT ON tb_datosinvitacion
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriainvitacion
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_datosInvitacion,
		NOW(),
		1,
		'[datatabs_main].[tb_datosInvitacion]',
		CONCAT_WS('|', NEW.id_datosInvitacion, IFNULL(NEW.nombres, ''), IFNULL(NEW.apellidos, ''), IFNULL(NEW.identificacion, ''), NEW.invitacion, NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), NEW.id_invitacion, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_datosinvitacion_updateA;

DELIMITER //
CREATE TRIGGER tr_datosinvitacion_updateA AFTER UPDATE ON tb_datosinvitacion
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriainvitacion
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_datosInvitacion,
		NOW(),
		2,
		'[datatabs_main].[tb_datosInvitacion]',
		CONCAT_WS('|', OLD.id_datosInvitacion, IFNULL(OLD.nombres, ''), IFNULL(OLD.apellidos, ''), IFNULL(OLD.identificacion, ''), OLD.invitacion, OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), OLD.id_invitacion, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_datosInvitacion, IFNULL(NEW.nombres, ''), IFNULL(NEW.apellidos, ''), IFNULL(NEW.identificacion, ''), NEW.invitacion, NEW.fechaInicio, IFNULL(NEW.fechaFin, '1900-01-01 00:00:00.000'), NEW.id_invitacion, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_datosinvitacion_deleteA;

DELIMITER //
CREATE TRIGGER tr_datosinvitacion_deleteA AFTER DELETE ON tb_datosinvitacion
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriainvitacion
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_datosinvitacion,
		NOW(),
		3,
		'[datatabs_main].[tb_datosinvitacion]',
		CONCAT_WS('|', OLD.id_datosInvitacion, IFNULL(OLD.nombres, ''), IFNULL(OLD.apellidos, ''), IFNULL(OLD.identificacion, ''), OLD.invitacion, OLD.fechaInicio, IFNULL(OLD.fechaFin, '1900-01-01 00:00:00.000'), OLD.id_invitacion, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;
/* TABLAS INVITACION */


/* TABLAS CONFIGURACION */
DROP TRIGGER IF EXISTS tr_configuracionflujo_createA;

DELIMITER //
CREATE TRIGGER tr_configuracionflujo_createA AFTER INSERT ON tb_configuracionflujo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaconfiguracion
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_configuracionFlujo,
		NOW(),
		1,
		'[datatabs_main].[tb_configuracionflujo]',
		CONCAT_WS('|', NEW.id_configuracionFlujo, NEW.nivel, NEW.id_tipoNodoActual, NEW.id_tipoNodoPosible, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_configuracionflujo_updateA;

DELIMITER //
CREATE TRIGGER tr_configuracionflujo_updateA AFTER UPDATE ON tb_configuracionflujo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaconfiguracion
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_configuracionFlujo,
		NOW(),
		2,
		'[datatabs_main].[tb_configuracionflujo]',
		CONCAT_WS('|', OLD.id_configuracionFlujo, OLD.nivel, OLD.id_tipoNodoActual, OLD.id_tipoNodoPosible, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_configuracionFlujo, NEW.nivel, NEW.id_tipoNodoActual, NEW.id_tipoNodoPosible, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_configuracionflujo_deleteA;

DELIMITER //
CREATE TRIGGER tr_configuracionflujo_deleteA AFTER DELETE ON tb_configuracionflujo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaconfiguracion
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_configuracionFlujo,
		NOW(),
		3,
		'[datatabs_main].[tb_configuracionflujo]',
		CONCAT_WS('|', OLD.id_configuracionFlujo, OLD.nivel, OLD.id_tipoNodoActual, OLD.id_tipoNodoPosible, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_configuracionnodo_createA;

DELIMITER //
CREATE TRIGGER tr_configuracionnodo_createA AFTER INSERT ON tb_configuracionnodo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaconfiguracion
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_configuracionNodo,
		NOW(),
		1,
		'[datatabs_main].[tb_configuracionnodo]',
		CONCAT_WS('|', NEW.id_configuracionNodo, NEW.id_tipoNodo, NEW.cantidadMaxima, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_configuracionnodo_updateA;

DELIMITER //
CREATE TRIGGER tr_configuracionnodo_updateA AFTER UPDATE ON tb_configuracionnodo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaconfiguracion
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_configuracionNodo,
		NOW(),
		2,
		'[datatabs_main].[tb_configuracionnodo]',
		CONCAT_WS('|', OLD.id_configuracionNodo, OLD.id_tipoNodo, OLD.cantidadMaxima, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_configuracionNodo, NEW.id_tipoNodo, NEW.cantidadMaxima, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_configuracionnodo_deleteA;

DELIMITER //
CREATE TRIGGER tr_configuracionnodo_deleteA AFTER DELETE ON tb_configuracionnodo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaconfiguracion
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_configuracionNodo,
		NOW(),
		3,
		'[datatabs_main].[tb_configuracionnodo]',
		CONCAT_WS('|', OLD.id_configuracionNodo, OLD.id_tipoNodo, OLD.cantidadMaxima, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;
/* TABLAS CONFIGURACION */


/* TABLAS PLANTILLA */
DROP TRIGGER IF EXISTS tr_plantilla_createA;

DELIMITER //
CREATE TRIGGER tr_plantilla_createA AFTER INSERT ON tb_plantilla
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaplantilla
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_plantilla,
		NOW(),
		1,
		'[datatabs_main].[tb_plantilla]',
		CONCAT_WS('|', NEW.id_plantilla, NEW.plantilla, NEW.fechaRegistro, NEW.id_nodo, IFNULL(NEW.id_distribuidor, 0), NEW.id_usuariod, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.publico)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_plantilla_updateA;

DELIMITER //
CREATE TRIGGER tr_plantilla_updateA AFTER UPDATE ON tb_plantilla
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaplantilla
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_plantilla,
		NOW(),
		2,
		'[datatabs_main].[tb_plantilla]',
		CONCAT_WS('|', OLD.id_plantilla, OLD.plantilla, OLD.fechaRegistro, OLD.id_nodo, IFNULL(OLD.id_distribuidor, 0), OLD.id_usuariod, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.publico),
		CONCAT_WS('|', NEW.id_plantilla, NEW.plantilla, NEW.fechaRegistro, NEW.id_nodo, IFNULL(NEW.id_distribuidor, 0), NEW.id_usuariod, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.publico)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_plantilla_deleteA;

DELIMITER //
CREATE TRIGGER tr_plantilla_deleteA AFTER DELETE ON tb_plantilla
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriaplantilla
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_plantilla,
		NOW(),
		3,
		'[datatabs_main].[tb_plantilla]',
		CONCAT_WS('|', OLD.id_plantilla, OLD.plantilla, OLD.fechaRegistro, OLD.id_nodo, IFNULL(OLD.id_distribuidor, 0), OLD.id_usuariod, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.publico)
	);
END;
//
DELIMITER ;
/* TABLAS PLANTILLA */


/* TABLAS CONDICIONNODO */
DROP TRIGGER IF EXISTS tr_tipocondicion_createA;

DELIMITER //
CREATE TRIGGER tr_tipocondicion_createA AFTER INSERT ON tb_tipocondicion
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacondicionnodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoCondicion,
		NOW(),
		1,
		'[datatabs_main].[tb_tipocondicion]',
		CONCAT_WS('|', NEW.id_tipoCondicion, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipocondicion_updateA;

DELIMITER //
CREATE TRIGGER tr_tipocondicion_updateA AFTER UPDATE ON tb_tipocondicion
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacondicionnodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoCondicion,
		NOW(),
		2,
		'[datatabs_main].[tb_tipocondicion]',
		CONCAT_WS('|', OLD.id_tipoCondicion, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoCondicion, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipocondicion_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipocondicion_deleteA AFTER DELETE ON tb_tipocondicion
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacondicionnodo
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoCondicion,
		NOW(),
		3,
		'[datatabs_main].[tb_tipocondicion]',
		CONCAT_WS('|', OLD.id_tipoCondicion, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipocondicion_t_createA;

DELIMITER //
CREATE TRIGGER tr_tipocondicion_t_createA AFTER INSERT ON tb_tipocondicion_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacondicionnodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoCondicion_t,
		NOW(),
		1,
		'[datatabs_main].[tb_tipocondicion_t]',
		CONCAT_WS('|', NEW.id_tipoCondicion_t, NEW.id_tipoCondicion, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipocondicion_t_updateA;

DELIMITER //
CREATE TRIGGER tr_tipocondicion_t_updateA AFTER UPDATE ON tb_tipocondicion_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacondicionnodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoCondicion_t,
		NOW(),
		2,
		'[datatabs_main].[tb_tipocondicion_t]',
		CONCAT_WS('|', OLD.id_tipoCondicion_t, OLD.id_tipoCondicion, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoCondicion_t, NEW.id_tipoCondicion, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipocondicion_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipocondicion_t_deleteA AFTER DELETE ON tb_tipocondicion_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacondicionnodo
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoCondicion_t,
		NOW(),
		3,
		'[datatabs_main].[tb_tipocondicion_t]',
		CONCAT_WS('|', OLD.id_tipoCondicion_t, OLD.id_tipoCondicion, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipovariable_createA;

DELIMITER //
CREATE TRIGGER tr_tipovariable_createA AFTER INSERT ON tb_tipovariable
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacondicionnodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoVariable,
		NOW(),
		1,
		'[datatabs_main].[tb_tipovariable]',
		CONCAT_WS('|', NEW.id_tipoVariable, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipovariable_updateA;

DELIMITER //
CREATE TRIGGER tr_tipovariable_updateA AFTER UPDATE ON tb_tipovariable
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacondicionnodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoVariable,
		NOW(),
		2,
		'[datatabs_main].[tb_tipovariable]',
		CONCAT_WS('|', OLD.id_tipoVariable, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoVariable, NEW.codigo, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipovariable_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipovariable_deleteA AFTER DELETE ON tb_tipovariable
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacondicionnodo
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoVariable,
		NOW(),
		3,
		'[datatabs_main].[tb_tipovariable]',
		CONCAT_WS('|', OLD.id_tipoVariable, OLD.codigo, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipovariable_t_createA;

DELIMITER //
CREATE TRIGGER tr_tipovariable_t_createA AFTER INSERT ON tb_tipovariable_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacondicionnodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_tipoVariable_t,
		NOW(),
		1,
		'[datatabs_main].[tb_tipovariable_t]',
		CONCAT_WS('|', NEW.id_tipoVariable_t, NEW.id_tipoVariable, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipovariable_t_updateA;

DELIMITER //
CREATE TRIGGER tr_tipovariable_t_updateA AFTER UPDATE ON tb_tipovariable_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacondicionnodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_tipoVariable_t,
		NOW(),
		2,
		'[datatabs_main].[tb_tipovariable_t]',
		CONCAT_WS('|', OLD.id_tipoVariable_t, OLD.id_tipoVariable, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo),
		CONCAT_WS('|', NEW.id_tipoVariable_t, NEW.id_tipoVariable, NEW.id_idioma, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0), NEW.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_tipovariable_t_deleteA;

DELIMITER //
CREATE TRIGGER tr_tipovariable_t_deleteA AFTER DELETE ON tb_tipovariable_t
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacondicionnodo
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_tipoVariable_t,
		NOW(),
		3,
		'[datatabs_main].[tb_tipovariable_t]',
		CONCAT_WS('|', OLD.id_tipoVariable_t, OLD.id_tipoVariable, OLD.id_idioma, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0), OLD.activo)
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_condicionnodo_createA;

DELIMITER //
CREATE TRIGGER tr_condicionnodo_createA AFTER INSERT ON tb_condicionnodo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacondicionnodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioCreador,
		NEW.id_condicionNodo,
		NOW(),
		1,
		'[datatabs_main].[tb_condicionnodo]',
		CONCAT_WS('|', NEW.id_condicionNodo, NEW.id_nodo, NEW.id_nodoHijo, NEW.id_tipoCondicion, NEW.id_tipoVariable, NEW.valor, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_condicionnodo_updateA;

DELIMITER //
CREATE TRIGGER tr_condicionnodo_updateA AFTER UPDATE ON tb_condicionnodo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacondicionnodo
	(
		id_usuario,
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a,
		datos_d
	)
	VALUES
	(
		NEW.id_usuarioModificador,
		OLD.id_condicionNodo,
		NOW(),
		2,
		'[datatabs_main].[tb_condicionnodo]',
		CONCAT_WS('|', OLD.id_condicionNodo, OLD.id_nodo, OLD.id_nodoHijo, OLD.id_tipoCondicion, OLD.id_tipoVariable, OLD.valor, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0)),
		CONCAT_WS('|', NEW.id_condicionNodo, NEW.id_nodo, NEW.id_nodoHijo, NEW.id_tipoCondicion, NEW.id_tipoVariable, NEW.valor, IFNULL(NEW.id_usuarioCreador, 0), IFNULL(NEW.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tr_condicionnodo_deleteA;

DELIMITER //
CREATE TRIGGER tr_condicionnodo_deleteA AFTER DELETE ON tb_condicionnodo
FOR EACH ROW
BEGIN
	INSERT INTO tb_auditoriacondicionnodo
	(
		id_registro,
		fechaRegistro,
		id_tipoAuditoria,
		tabla,
		datos_a
	)
	VALUES
	(
		OLD.id_condicionNodo,
		NOW(),
		3,
		'[datatabs_main].[tb_condicionnodo]',
		CONCAT_WS('|', OLD.id_condicionNodo, OLD.id_nodo, OLD.id_nodoHijo, OLD.id_tipoCondicion, OLD.id_tipoVariable, OLD.valor, IFNULL(OLD.id_usuarioCreador, 0), IFNULL(OLD.id_usuarioModificador, 0))
	);
END;
//
DELIMITER ;
/* TABLAS CONDICIONNODO */

