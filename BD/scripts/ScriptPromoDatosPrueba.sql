/* SUPERDISTRIBUIDOR */
INSERT INTO promociones.tb_superdistribuidor (identificacion, nombre, razonSocial, telefono, fax, correo, direccion, id_ciudad)
VALUES ('');

/* DISTRIBUIDOR */
INSERT INTO promociones.tb_distribuidor (identificacion, nombre, razonSocial, telefono, fax, correo, direccion, id_ciudad, id_superDistribuidor)
VALUES ('');

/* EMPRESA */
INSERT INTO promociones.tb_empresa (identificacion, nombre, razonSocial, telefono, fax, correo, direccion, id_ciudad, id_distribuidor)
VALUES ('');

/* SUCURSAL */
INSERT INTO promociones.tb_sucursal (sucursal, direccion, id_ciudad, id_empresa)
VALUES ('');

INSERT INTO promociones.tb_sucursal (sucursal, direccion, id_ciudad, id_empresa)
VALUES ('');

INSERT INTO promociones.tb_sucursal (sucursal, direccion, id_ciudad, id_empresa)
VALUES ('');

INSERT INTO promociones.tb_sucursal (sucursal, direccion, id_ciudad, id_empresa)
VALUES ('');

/* USUARIOS */
/* ADMIN */
INSERT INTO promociones.tb_usuario (usuario, usuario_, usuarioCorreo, usuarioCorreo_, contrasena)
VALUES ('admin', 'admin', 'admin@prueba.com', 'admin@prueba.com', '123456');

INSERT INTO promociones.tb_usuarioactivo (id_usuario, activo)
VALUES (1, 1);

INSERT INTO promociones.tb_usuario_perfil (id_usuario, id_perfil)
VALUES (1, 1);

INSERT INTO promociones.tb_usuariod (identificacion, nombres, apellidos, correo, tlfCasa, tlfOficina, tlfCelular, id_sexo, id_tipoUsuarioD, id_ciudad, id_idioma)
VALUES ('');

/* SUPERDISTRIBUIDOR */
INSERT INTO promociones.tb_usuario (usuario, usuario_, usuarioCorreo, usuarioCorreo_, contrasena)
VALUES ('pruebaSD', 'pruebaSD', 'pruebaSD@prueba.com', 'pruebaSD@prueba.com', '123456');

INSERT INTO promociones.tb_usuarioactivo (id_usuario, activo)
VALUES (2, 1);

INSERT INTO promociones.tb_usuario_perfil (id_usuario, id_perfil)
VALUES (2, 2);

INSERT INTO promociones.tb_usuariod (identificacion, nombres, apellidos, correo, tlfCasa, tlfOficina, tlfCelular, id_sexo, id_tipoUsuarioD, id_ciudad, id_idioma)
VALUES ('');

INSERT INTO promociones.tb_usuariod_superdistribuidor (id_usuariod, id_superDistribuidor)
VALUES (2, 1);


INSERT INTO promociones.tb_usuario (usuario, usuario_, usuarioCorreo, usuarioCorreo_, contrasena)
VALUES ('pruebaD', 'pruebaD', 'pruebaD@prueba.com', 'pruebaD@prueba.com', '123456');

INSERT INTO promociones.tb_usuarioactivo (id_usuario, activo)
VALUES (3, 1);

INSERT INTO promociones.tb_usuario_perfil (id_usuario, id_perfil)
VALUES (3, 3);


INSERT INTO promociones.tb_usuario (usuario, usuario_, usuarioCorreo, usuarioCorreo_, contrasena)
VALUES ('pruebaE', 'pruebaE', 'pruebaE@prueba.com', 'pruebaE@prueba.com', '123456');

INSERT INTO promociones.tb_usuarioactivo (id_usuario, activo)
VALUES (4, 1);

INSERT INTO promociones.tb_usuario_perfil (id_usuario, id_perfil)
VALUES (4, 4);


INSERT INTO promociones.tb_usuario (usuario, usuario_, usuarioCorreo, usuarioCorreo_, contrasena)
VALUES ('pruebaS1', 'pruebaS1', 'pruebaS1@prueba.com', 'pruebaS1@prueba.com', '123456');

INSERT INTO promociones.tb_usuarioactivo (id_usuario, activo)
VALUES (5, 1);

INSERT INTO promociones.tb_usuario_perfil (id_usuario, id_perfil)
VALUES (5, 5);


INSERT INTO promociones.tb_usuario (usuario, usuario_, usuarioCorreo, usuarioCorreo_, contrasena)
VALUES ('pruebaS2', 'pruebaS2', 'pruebaS2@prueba.com', 'pruebaS2@prueba.com', '123456');

INSERT INTO promociones.tb_usuarioactivo (id_usuario, activo)
VALUES (6, 1);

INSERT INTO promociones.tb_usuario_perfil (id_usuario, id_perfil)
VALUES (6, 5);


INSERT INTO promociones.tb_usuario (usuario, usuario_, usuarioCorreo, usuarioCorreo_, contrasena)
VALUES ('pruebaS3', 'pruebaS3', 'pruebaS3@prueba.com', 'pruebaS3@prueba.com', '123456');

INSERT INTO promociones.tb_usuarioactivo (id_usuario, activo)
VALUES (7, 1);

INSERT INTO promociones.tb_usuario_perfil (id_usuario, id_perfil)
VALUES (7, 5);