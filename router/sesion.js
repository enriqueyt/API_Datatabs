var connection = require('../config/db'),
	utilidades = require('../utils/utilidades'),
    seguridad  = require('../utils/seguridad');
	
/**
 *	HttpPost
 *
 *  Creates a session unique id.
 *
 *	@param 
 *		A json request body:
 *		{
 *			"usuario_n" : "example",	A string that represents an user's name.
 *			"usuario_p" : "123456"		A string that represents an user's password.
 *		}
 *	
 *	@return
 *		A json string:
 *		{
 *			"fechaI"  : "YYYY-MM-DD HH:mm:ss",
 *			"fechaUO" : "YYYY-MM-DD HH:mm:ss",
 *			"sesion"  : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy)"
 *		}
 *
 *	@error
 *		A json string:
 *		{
 *			"msg" : "Error description"
 *		}
 *		Or an exception.
 */
exports.autenticar = function(req, res) {
    var sql = '', mensaje = '', resultado = '';
    
    if (connection) {
		sql =
			'SET @resultado = ""; ' +
            'CALL promociones.sp_autenticarUsuario(?, ?, @resultado); ' +
            'SELECT @resultado;';
			
        connection.db.query(
            sql,
			//[
			//	seguridad.encodeAES(seguridad.SHA512(req.body.usuario_n), req.body.usuario_p),
			//	seguridad.encodeAES(seguridad.SHA512(req.body.usuario_p), req.body.usuario_p)
			//],
            [req.body.usuario_n, req.body.usuario_p],
            function(err, result) {
                if (err) throw err;
                mensaje   = result[3][0]['@resultado'];
                resultado = result[1][0]['res'];
                
                if ((/ERROR/g).test(mensaje)) {
                    res.contentType('application/json');
                    res.write(JSON.stringify({ msg : mensaje }));
                    res.end();
                }
                else {
                    (
                        function(id) {
							sql = 
								'SELECT ' +
									'S.sesion AS sesion, ' +
									'DATE_FORMAT(S.fechaInicio, "%Y-%m-%d %H:%i:%s") AS fechaI, ' +
									'DATE_FORMAT(S.fechaUltimaOp, "%Y-%m-%d %H:%i:%s") AS fechaUO ' +
								'FROM ' +
									'promociones.tb_sesion AS S ' +
								'WHERE ' +
									'S.id_sesion = ?;';
						
                            connection.db.query(
                                sql,
                                [id],
                                function(err, result) {
                                    if (err) throw err;
									result[0].sesion = seguridad.encodeBase64(result[0].sesion);								
                                    res.contentType('application/json');
                                    res.write(JSON.stringify(result[0]));
                                    res.end();
                                }
                            );       
                        }
                    )(resultado);
                }
            }
        );
    }
};


/**
 *	HttpPost
 *
 *  Updates a session unique id previuosly created.
 *
 *	@param 
 *		A json request body:
 *		{
 *			"sesion"  : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy)"	A string that represents an user's session in Base64.
 *		}
 *	
 *	@return
 *		A json string:
 *		{
 *			"fechaI"  : "YYYY-MM-DD HH:mm:ss",
 *			"fechaUO" : "YYYY-MM-DD HH:mm:ss",
 *			"sesion"  : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy)"
 *		}
 *
 *	@error
 *		A json string:
 *		{
 *			"msg" : "Error description"
 *		}
 *		Or an exception.
 */
exports.reautenticar = function(req, res) {
	utilidades.buscarIdUsuario(seguridad.decodeBase64(req.body.sesion), function(id) {
		var sql = '', mensaje = '', resultado = '';
		
		if (connection) {
			sql =
				'SET @resultado = ""; ' +
				'CALL promociones.sp_reautenticarUsuario(?, @resultado); ' +
				'SELECT @resultado;';
		
			connection.db.query(
				sql,
				[id],
				function(err, result) {
					if (err) throw err;
					mensaje   = result[3][0]['@resultado'];
					resultado = result[1][0]['res'];
					
					if ((/ERROR/g).test(mensaje)) {
						res.contentType('application/json');
						res.write(JSON.stringify({ msg : mensaje }));
						res.end();
					}
					else {
						(
							function(id) {
								sql =
									'SELECT ' +
										'S.sesion AS sesion, ' +
										'DATE_FORMAT(S.fechaInicio, "%Y-%m-%d %H:%i:%s") AS fechaI, ' +
										'DATE_FORMAT(S.fechaUltimaOp, "%Y-%m-%d %H:%i:%s") AS fechaUO ' +
									'FROM ' +
										'promociones.tb_sesion AS S ' +
									'WHERE ' +
										'S.id_sesion = ?;';
										
								connection.db.query(
									sql,
									[id],
									function(err, result) {
										if (err) throw err;
										res.contentType('application/json');
										result[0].sesion = seguridad.encodeBase64(result[0].sesion);
										res.write(JSON.stringify(result[0]));
										res.end();
									}
								);       
							}
						)(resultado);
					}
				}
			);
		}
	});
};

/**
 *	HttpPost
 *
 *  Disables a session unique id previuosly created.
 *
 *	@param 
 *		A json request body:
 *		{
 *			"sesion"  : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy)"	A string that represents an user's session in Base64.
 *		}
 *	
 *	@return
 *		A json string:
 *		{
 *			"msg" : "OK - Base64EncodeString(session id)"
 *		}
 *
 *	@error
 *		A json string:
 *		{
 *			"msg" : "Error description"
 *		}
 *		Or an exception.
 */
exports.desautenticar = function(req, res) {
	utilidades.buscarIdUsuario(seguridad.decodeBase64(req.body.sesion), function(id) {
		var sql = '', mensaje = '', resultado = '';
		
		if (connection) {
			sql =
				'SET @resultado = ""; ' +
				'CALL promociones.sp_desautenticarUsuario(?, @resultado); ' +
				'SELECT @resultado;';
		
			connection.db.query(
				sql,
				[id],
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
	});
};