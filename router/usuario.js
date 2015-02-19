var connection = require('../config/db'),
    utilidades = require('../utils/utilidades'),
	seguridad  = require('../utils/seguridad');

/**
 *	HttpGet
 *
 *  Creates an admin user.
 *	
 *	@return
 *		A json string:
 *		{
 *			"msg" : "OK - Base64EncodeString(user id)"
 *		}
 *
 *	@error
 *		A json string:
 *		{
 *			"msg" : "Error description"
 *		}
 *		Or an exception.
 */
exports.crearAdmin = function(req, res) {
    var admin = {
        usuario_n : 'admin',
        usuario_p : 'qwerty256'
    };
	var sql = '', mensaje = '', resultado = '';
	
    if (connection) {
        sql =
			'SET @resultado = ""; ' +
            'CALL promociones.sp_crearUsuarioAdmin(?, ?, ?, @resultado); ' +
            'SELECT @resultado;';
		
		connection.db.query(
            sql,
            //[
			//	seguridad.AES(seguidad.SHA512(admin.usuario_n), usuario_p),
			//	seguridad.SHA512(admin.usuario_n),
			//	seguridad.AES(seguidad.SHA512(admin.usuario_p), usuario_p)
			//],
			[admin.usuario_n, admin.usuario_n, admin.usuario_p],
            function(err, result) {
                if (err) throw err;
				mensaje   = result[3][0]['@resultado'];
				resultado = result[1][0]['res'];
		
                res.contentType('application/json');
                res.write(JSON.stringify({ msg : (/ERROR/g).test(mensaje) ? mensaje : "OK - " + seguridad.encodeBase64(resultado) }));
                res.end();
            }
        );
    }
};

/**
 *	HttpGet
 *
 *  Checks if an user name exists.
 *
 *	@param
 *		A request url param (an username).
 *	
 *	@return
 *		A json string:
 *		{
 *			"msg" : true (or false)
 *		}
 *
 *	@error
 *		An exception.
 */
exports.existeUsuario = function(req, res) {
	//var param = seguridad.SHA512(req.params.val);
	var param = req.params.val;
	var sql = '';
		
	if (connection) {
		sql =
			'SELECT * ' +
			'FROM ' +
				'promociones.tb_usuario AS U ' +
			'WHERE ' +
				'U.usuario_ = ? OR U.usuarioCorreo_ = ?;';
		
		connection.db.query(
			sql,
			[param, param],
			function(err, result) {
				if (err) throw err;					
				res.contentType('application/json');
				res.write(JSON.stringify({ msg : result.length > 0 ? true : false }));
				res.end();
			}
		);
	}
};

/**
 *	HttpGet
 *
 *  Checks if an email exists.
 *
 *	@param
 *		A request url param (an email).
 *	
 *	@return
 *		A json string:
 *		{
 *			"msg" : true (or false)
 *		}
 *
 *	@error
 *		An exception.
 */
exports.existeCorreo = function(req, res) {
	//var param = seguridad.SHA512(req.params.val);
	var param = req.params.val;
	var sql = '';
		
	if (connection) {
		sql =
			'SELECT * ' +
			'FROM ' +
				'promociones.tb_usuario AS U ' +
			'WHERE ' +
				'U.usuarioCorreo_ = ?;';
		
		connection.db.query(
			sql,
			[param],
			function(err, result) {
				if (err) throw err;					
				res.contentType('application/json');
				res.write(JSON.stringify( { msg : result.length > 0 ? true : false }));
				res.end();
			}
		);
	}
};

/**
 *	HttpPost
 *
 *  Creates an user.
 *
 *	@param
 *		A json request body:
 *		{
 *			"usuario"   : 1,                										An integer identifier that represents an user's id related to the user who creates the request. This field can be optional.
 *			"sesion"    : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy)"	A string that represents an user's session in Base64 related to the user who creates the request. This field can be used instead "usuario" and it can be optional too.
 *			"usuario_n" : "test",													A string that represents the username.
 *			"usuario_m" : "test@test.com",											A string that represents the email. This field can be optional.
 *			"usuario_p" : "qwerty42",												A string that represents The password.
 *			"activo"    : 1,														A integer that represents the status (1 for active and 0 for inactive). This field can be optional.
 *			"perfil"    : 1															A integer that represents the profile to be associated.
 *		}
 *	
 *	@return
 *		A json string:
 *		{
 *			"msg" : "OK - Base64EncodeString(user id)"
 *		}
 *
 *	@error
 *		A json string:
 *		{
 *			"msg" : "Error description"
 *		}
 *		Or an exception.
 */
exports.crearUsuario = function(req, res) {
	var param = null;
	
	var callback = function(id) {
		var sql = '', mensaje = '', resultado = '';
	
		if (connection) {
			sql =
				'SET @resultado = ""; ' +
				'CALL promociones.sp_crearUsuario(?, ?, ?, ?, ?, ?, ?, ?, @resultado); ' +
				'SELECT @resultado;';
			
			connection.db.query(
				sql,
				//[
				//	id,
				//	seguridad.encodeAES(seguridad.SHA512(req.body.usuario_n), req.body.usuario_p),
				//	seguridad.SHA512(req.body.usuario_n),
				//	typeof req.body.usuario_m !== undefined || req.body.usuario_m != null ? seguridad.encodeAES(seguridad.SHA512(req.body.usuario_m), req.body.usuario_p) : null,
				//	typeof req.body.usuario_m !== undefined || req.body.usuario_m != null ? seguridad.SHA512(req.body.usuario_m) : null,
				//	seguridad.encodeAES(seguridad.SHA512(req.body.usuario_p), req.body.usuario_p),
				//	typeof req.body.activo !== undefined || req.body.activo != null ? req.body.activo : null,
				//	req.body.perfil
				//],
				[
					id,
					req.body.usuario_n,
					req.body.usuario_n,
					typeof req.body.usuario_m !== undefined || req.body.usuario_m != null ? req.body.usuario_m : null,
					typeof req.body.usuario_m !== undefined || req.body.usuario_m != null ? req.body.usuario_m : null,
					req.body.usuario_p,
					typeof req.body.activo !== undefined || req.body.activo != null ? req.body.activo : null,
					req.body.perfil
				],
				function(err, result) {
					if (err) throw err;
					mensaje   = result[3][0]['@resultado'];
					resultado = result[1][0]['res'];
			
					res.contentType('application/json');
					res.write(JSON.stringify({ msg : (/ERROR/g).test(mensaje) ? mensaje : "OK - " + seguridad.encodeBase64(resultado) }));
					res.end();
				}
			);
		}
	};
	
	if ((typeof req.body.usuario !== undefined || req.body.usuario != null) && (/^\d+$/g).test(req.body.usuario))
		callback(req.body.usuario);
	else if ((typeof req.body.sesion !== undefined || req.body.sesion != null) && (/^\w{8}\-w{4}\-w{4}\-w{8}$/g).test(param = seguridad.decodeBase64(req.body.sesion)))
		utilidades.buscarIdUsuario(param, callback);
	else
		callback(null);
};

/**
 *	HttpPut
 *
 *  Updates an username related to an user.
 *
 *	@param
 *		A request url param (an user session in Base64 or id related to user that we want to update).
 *	@param
 *		A request body:
 *		{
 *			"usuario_n" : "test",			A string that represents the new username.
 *			"usuario_m" : "test@test.com",	A string that represents the new email. This field can be optional.
 *			"usuario_p" : "qwerty42"		A string that represents the user's password.
 *		}
 *	
 *	@return
 *		A json string:
 *		{
 *			"msg" : "OK - Base64EncodeString(user id)"
 *		}
 *
 *	@error
 *		A json string:
 *		{
 *			"msg" : "Error description"
 *		}
 *		Or an exception.
 */
exports.modificarUsuario = function(req, res) {
	var param = seguridad.decodeBase64(req.params.val);
	
	var callback = function(id) {
		var sql = '', mensaje = '', resultado = '';
		
		if (connection) {
			sql =
				'SET @resultado = ""; ' +
				'CALL promociones.sp_modificarUsuario(?, ?, ?, ?, ?, ?, NULL, NULL, @resultado); ' +
				'SELECT @resultado;';
			
			connection.db.query(
				sql,
				//[
				//	id,
				//	id,
				//	seguridad.AES(seguridad.SHA512(req.body.usuario_n), req.body.usuario_p),
				//	seguridad.SHA512(req.body.usuario_n),
				//	typeof req.body.usuario_m !== undefined || req.body.usuario_m != null ? seguridad.AES(seguridad.SHA512(req.body.usuario_m), req.body.usuario_p) : null,
				//	typeof req.body.usuario_m !== undefined || req.body.usuario_m != null ? seguridad.SHA512(req.body.usuario_m) : null
				//],
				[
					id,
					id,
					req.body.usuario_n,
					req.body.usuario_n,
					typeof req.body.usuario_m !== undefined || req.body.usuario_m != null ? req.body.usuario_m : null,
					typeof req.body.usuario_m !== undefined || req.body.usuario_m != null ? req.body.usuario_m : null,
				],
				function(err, result) {
					if (err) throw err;
					mensaje   = result[3][0]['@resultado'];
					resultado = result[1][0]['res'];
										
					res.contentType('application/json');
					res.write(JSON.stringify({ msg : (/ERROR/g).test(mensaje) ? mensaje : "OK - " + seguridad.encodeBase64(resultado) }));
					res.end();
				}
			);
		}
    };
	
	if (!(/^\d+$/g).test(param))
		utilidades.buscarIdUsuario(param, callback);
	else
		callback(param);
};

/**
 *	HttpPut
 *
 *  Updates a password related to an user.
 *
 *	@param
 *		A request url param (an user session or id related to user that we want to update).
 *	@param
 *		A request body:
 *		{
 *			"usuario_p"  : "qwerty42",	A string that represents the user's password.
 *			"usuario_np" : "42qwerty"	A string that represents the user's new password.
 *		}
 *	
 *	@return
 *		A json string:
 *		{
 *			"msg" : "OK - Base64EncodeString(user id)"
 *		}
 *
 *	@error
 *		A json string:
 *		{
 *			"msg" : "Error description"
 *		}
 *		Or an exception.
 */
exports.modificarContrasena = function(req, res) {
	var param = seguridad.decodeBase64(req.params.val);
	
	var callback_1 = function(id, callback) {
		var sql = '';
		
		callback = typeof callback === undefined ? callback_2 : callback;
		
		if (connection) {
			sql =
				'SELECT ' +
					'U.usuario AS usuario, U.usuarioCorreo AS usuarioCorreo ' +
				'FROM ' +
					'promociones.tb_usuario AS U ' +
				'WHERE ' +
					'U.id_usuario = ?;';
			
			connection.db.query(
				sql,
				[id],
				function(err, result) {
					if (err) throw err;
					
					if (result.length <= 0) {
						res.contentType('application/json');
						res.write(JSON.stringify({ msg : 'ERROR - ! - Error buscando datos' }));
						res.end();
					}					
					else
						callback(id, result[0].usuario, result[0].usuarioCorreo);
				}
			);
		}
	};
	
	var callback_2 = function(id, usuario, usuarioCorreo) {
		var sql = '', mensaje = '', resultado = '';
		
		if (connection) {
			sql =
				'SET @resultado = ""; ' +
				'CALL promociones.sp_modificarUsuario(?, ?, ?, NULL, ?, NULL, ?, NULL, @resultado); ' +
				'SELECT @resultado;';
			
			connection.db.query(
				sql,
				//[
				//	id,
				//	id,
				//	seguridad.encodeAES(seguridad.decodeAES(usuario, req.body.usuario_p), req.body.usuario_np),
				//	usuarioCorreo != null ? seguridad.encodeAES(seguridad.decodeAES(usuarioCorreo, req.body.usuario_p), req.body.usuario_np) : null,
				//	seguridad.encodeAES(seguridad.SHA512(req.body.usuario_np), req.body.usuario_np)
				//],
				[
					id,
					id,
					usuario,
					usuarioCorreo != null ? usuarioCorreo : null,
					req.body.usuario_np
				],
				function(err, result) {
					if (err) throw err;
					mensaje   = result[3][0]['@resultado'];
					resultado = result[1][0]['res'];
										
					res.contentType('application/json');
					res.write(JSON.stringify({ msg : (/ERROR/g).test(mensaje) ? mensaje : "OK - " + seguridad.encodeBase64(resultado) }));
					res.end();
				}
			);
		}
    };
	
	if (!(/^\d+$/g).test(param))
		utilidades.buscarIdUsuario(param, callback_1);
	else 
		callback_1(param, callback_2);
};

//exports.eliminarUsuario = function(req, res) {

//};