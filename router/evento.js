var connection = require('../config/db'),
    Q          = require('q'),
    utilidades = require('../utils/utilidades'),
	seguridad  = require('../utils/seguridad');

/**
 *	HttpGet
 *
 *  Gets an event or various events.
 *
 *  @param
 *		A request url list parameters (an id in Base64 related to the company, an integer related to an offset and an id in Base64 related to an event, it could be optional.)
 *
 *	@return
 *		A JSON string:
 *		[
 *          {
 *              "id_evento"   : "Base64EncodeString(XXXXX)",    A string in Base64 that represents the identifier related to an event.
 *              "evento"      : "XXXXX",                        A string that represents the event's name.
 *              "descripcion" : "XXXXX",                        A string that represents the event's description.
 *              "fechaInicio" : "YYYY-MM-DD HH:mm:ss",          A string that represents the event's start date.
 *              "fechaFin"    : "YYYY-MM-DD HH:mm:ss",          A string that represents the event's end date.
 *              "flujo"       : [{ XXXXX }],                    A JSON string that represents the event's flow.
 *              "imagen"      : "XXXXX",                        A string that represents the image file name related to an event.
 *              "id_empresa"  : "Base64EncodeString(XXXXX)",    A string in Base64 that represents the identifier related to an company.
 *              "empresa"     : "XXXXX"                         A string that represents the company's name.
 *          },
 *          ...
 *      ]
 *
 *	@error
 *		A JSON string:
 *		{
 *			"msg" : "Error description"
 *		}
 */
exports.buscarEvento = function(req, res) {
	var company = seguridad.decodeBase64(req.params.company);
    var offset  = typeof req.params.offset  !== undefined || req.params.offset  != null ? req.params.offset                      : 10;
    var event   = typeof req.params.val     !== undefined || req.params.val     != null ? seguridad.decodeBase64(req.params.val) : null;
    
    var sql = '';
	
    if (connection) {
        if ((/\/next\//g).test(req.route)) {
            sql =
                'SELECT ' +
                    'id_evento, ' +
                    'evento, ' +
                    'descripcion, ' +
                    'fechaInicio, ' +
                    'fechaFin, ' +
                    'flujo, ' +
                    'id_empresa, ' +
                    'id_imagen ' +
                'FROM ' +
                    'promociones.tb_evento AS E ' +
                'WHERE ' +
                    'E.id_evento > ? AND ' +
                    'E.id_empresa = ? AND ' +
                    'E.activo = 1 ' +
                'LIMIT 0, ?;';
                
            connection.db.query(
                sql,
                [event, company, offset],
                function(err, result) {
                    if (err)
                        utilidades.printError(err, res);
                    else {
                        for (i = 0; i < result.length; i++) {
                            result[i].id_evento  = seguridad.encodeBase64(result[i].id_evento);
                            result[i].id_empresa = seguridad.encodeBase64(result[i].id_empresa);
                        }
                        
                        res.contentType('application/json');
                        res.write(JSON.stringify(result));
                        res.end();
                    }
                }
            );
        }
        else if ((/\/previous\//g).test(req.route)) {
            sql =
                'SELECT ' +
                    'id_evento, ' +
                    'evento, ' +
                    'descripcion, ' +
                    'fechaInicio, ' +
                    'fechaFin, ' +
                    'flujo, ' +
                    'id_empresa, ' +
                    'id_imagen ' +
                'FROM ' +
                    'promociones.tb_evento AS E ' +
                'WHERE ' +
                    'E.id_evento < ? AND ' +
                    'E.id_empresa = ? AND ' +
                    'E.activo = 1 ' +
                'LIMIT 0, ?;';
                
            connection.db.query(
                sql,
                [event, company, offset],
                function(err, result) {
                    if (err)
                        utilidades.printError(err, res);
                    else {
                        for (i = 0; i < result.length; i++) {
                            result[i].id_evento  = seguridad.encodeBase64(result[i].id_evento);
                            result[i].id_empresa = seguridad.encodeBase64(result[i].id_empresa);
                        }
                        
                        res.contentType('application/json');
                        res.write(JSON.stringify(result));
                        res.end();
                    }
                }
            );
        }
        else {
            sql =
                'SELECT ' +
                    'id_evento, ' +
                    'evento, ' +
                    'descripcion, ' +
                    'fechaInicio, ' +
                    'fechaFin, ' +
                    'flujo, ' +
                    'id_empresa, ' +
                    'id_imagen ' +
                'FROM ' +
                    'promociones.tb_evento AS E ' +
                'WHERE ' +
                    (
                        event != null
                        ? 'E.id_evento = ? AND E.id_empresa = ? AND E.activo = 1;'
                        : 'E.id_empresa = ? AND E.activo = 1 LIMIT 0, ?;'
                    );
                    
            connection.db.query(
                sql,
                (event != null ? [event, company] : [company, offset]),
                function(err, result) {
                    if (err)
                        utilidades.printError(err, res);
                    else {
                        for (i = 0; i < result.length; i++) {
                            result[i].id_evento  = seguridad.encodeBase64(result[i].id_evento);
                            result[i].id_empresa = seguridad.encodeBase64(result[i].id_empresa);
                        }
                        
                        res.contentType('application/json');
                        res.write(JSON.stringify(result));
                        res.end();
                    }
                }
            );
        }
    }
};
    
/**
 *	HttpPost
 *
 *  Creates an event.
 *
 *	@param
 *		A JSON request body:
 *		{
 *			"param"       : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy|1)",  A string in Base64 that represents an user session or id related to the user that creates the request.
 *          "nombre"      : "XXXXX",                                                   A string that represents the name related the event which we want to create.
 *          "descripcion" : "XXXXX",                                                   A string that represents the resume related to the event which we want to create. This field can be optional.
 *          "fechaInicio" : "YYYY-MM-DD HH:mm:ss",                                     A string that represents the start datetime related to the event which we want to create.
 *          "fechaFin"    : "YYYY-MM-DD HH:mm:ss"                                      A string that represents the end datetime related to the event which we want to create. This field can be optional.
 *		}
 *	
 *	@return
 *		A JSON string:
 *		{
 *			"msg" : "OK - Base64EncodeString(event id)"
 *		}
 *
 *	@error
 *		A JSON string:
 *		{
 *			"msg" : "Error description"
 *		}
 */
exports.crearEvento = function(req, res) {
	var user = typeof req.body.param !== undefined || req.body.param != null ? seguridad.decodeBase64(req.body.param) : null;
	
	var callback = function(id) {
		var sql = '', mensaje = '', resultado = '';
	
		if (connection) {
			sql =
				'SET @resultado = ""; ' +
				'CALL promociones.sp_crearEvento(?, ?, ?, ?, ?, @resultado); ' +
				'SELECT @resultado;';
			
			connection.db.query(
				sql,
				[
					id,
					req.body.nombre,
					typeof req.body.descripcion !== undefined || req.body.descripcion != null ? req.body.descripcion : null,
					req.body.fechaInicio,                                                                                                
					typeof req.body.fechaFin    !== undefined || req.body.fechaFin    != null ? req.body.fechaFin    : null
				],
				function(err, result) {
					if (err)
                        utilidades.printError(err, res);
                    else {
                        mensaje   = result[3][0]['@resultado'];
                        resultado = result[1][0]['res'];
                
                        res.contentType('application/json');
                        res.write(JSON.stringify({ msg : (/ERROR/g).test(mensaje) ? mensaje : "OK - " + seguridad.encodeBase64(resultado) }));
                        res.end();
                    }
				}
			);
		}
	};
    
    if (user != null) {
        if ((/^\d+$/g).test(user))
            callback(user);
        else
            utilidades.buscarIdUsuario(user).then(
                callback,
                function(err) {
                    utilidades.printError(err, res);
                }
            );
    }
	else
		callback(null);
};

/**
 *	HttpPut
 *
 *  Updates an event.
 *
 *	@param
 *		A request url parameter (an id in Base64 related to the event that we want to update).
 *	@param
 *		A JSON request body (fields to update should be set with a value):
 *		{
 *			"param"       : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy|1)",  A string in Base64 that represents an user session or id related to the user that creates the request.
 *          "nombre"      : "XXXXX",                                                   A string that represents the name related the event which we want to create.
 *          "descripcion" : "XXXXX",                                                   A string that represents the resume related to the event which we want to create.
 *          "fechaInicio" : "YYYY-MM-DD HH:mm:ss",                                     A string that represents the start datetime related to the event which we want to create.
 *          "fechaFin"    : "YYYY-MM-DD HH:mm:ss",                                     A string that represents the end datetime related to the event which we want to create.
 *          "activo"      : 0                                                          An integer that represents the status (1 for active and 0 for inactive) related to the event which we want to create.
 *		}
 *	
 *	@return
 *		A JSON string:
 *		{
 *			"msg" : "OK - Base64EncodeString(event id)"
 *		}
 *
 *	@error
 *		A JSON string:
 *		{
 *			"msg" : "Error description"
 *		}
 */
exports.modificarEvento = function(req, res) {
	var event = seguridad.decodeBase64(req.params.val);
	
	var callback = function(data) {
		var sql = '', mensaje = '', resultado = '';
		
		if (connection) {
			sql =
				'SET @resultado = ""; ' +
				'CALL promociones.sp_modificarEvento(?, ?, ?, ?, ?, ?, ?, @resultado); ' +
				'SELECT @resultado;';
			
			connection.db.query(
				sql,
				[
					data[1],
					data[0],
                    typeof req.body.nombre      !== undefined || req.body.nombre      != null ? req.body.nombre      : null,
					typeof req.body.descripcion !== undefined || req.body.descripcion != null ? req.body.descripcion : null,
					typeof req.body.fechaInicio !== undefined || req.body.fechaInicio != null ? req.body.fechaInicio : null,
					typeof req.body.fechaFin    !== undefined || req.body.fechaFin    != null ? req.body.fechaFin    : null,
                    typeof req.body.activo      !== undefined || req.body.activo      != null ? req.body.activo      : null
				],
				function(err, result) {
					if (err)
                        utilidades.printError(err, res);
                    else {
                        mensaje   = result[3][0]['@resultado'];
                        resultado = result[1][0]['res'];
                                            
                        res.contentType('application/json');
                        res.write(JSON.stringify({ msg : (/ERROR/g).test(mensaje) ? mensaje : "OK - " + seguridad.encodeBase64(resultado) }));
                        res.end();
                    }
				}
			);
		}
    };
	
	if (typeof req.body.param !== undefined || req.body.param != null) {
		if ((/^\d+$/g).test(seguridad.decodeBase64(req.body.param)))
			callback([event, seguridad.decodeBase64(req.body.param)]);
		else
			Q.all([event, utilidades.buscarIdUsuario(seguridad.decodeBase64(req.body.param))]).then(
				callback,
				function(err) {
					utilidades.printError(err, res);
				}
			);
	}
	else
		callback([event, null]);
};

/**
 *	HttpPut
 *
 *  Creates a relation between an event and a branch office.
 *
 *	@param
 *		A request url parameter (an id in Base64 related to the event that we want to associate to the branch office).
 *	@param
 *		A JSON request body (fields to update should be set with a value):
 *		{
 *		    "param"    : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy|1)",  A string in Base64 that represents an user session or id related to the user that creates the request.
 *          "sucursal" : "XXXXX"                                                    An integer identifier that represents the branch office that we will associate to the event.
 *		}
 *	
 *	@return
 *		A JSON string:
 *		{
 *			"msg" : "OK - Base64EncodeString(relation id)"
 *		}
 *
 *	@error
 *		A JSON string:
 *		{
 *			"msg" : "Error description"
 *		}
 */
exports.asociarEventoSucursal = function(req, res) {
	var event = seguridad.decodeBase64(req.params.val);
	
	var callback = function(id) {
		var sql = '', mensaje = '', resultado = '';
		
		if (connection) {
			sql =
				'SET @resultado = ""; ' +
				'CALL promociones.sp_asociarEventoSucursal(?, ?, ?, @resultado); ' +
				'SELECT @resultado;';
			
			connection.db.query(
				sql,
				[
					id,
                    event,
                    req.body.sucursal
				],
				function(err, result) {
					if (err)
                        utilidades.printError(err, res);
                    else {
                        mensaje   = result[3][0]['@resultado'];
                        resultado = result[1][0]['res'];
                                            
                        res.contentType('application/json');
                        res.write(JSON.stringify({ msg : (/ERROR/g).test(mensaje) ? mensaje : "OK - " + seguridad.encodeBase64(resultado) }));
                        res.end();
                    }
				}
			);
		}
    };
	
	if (typeof req.body.param !== undefined || req.body.param != null) {
		if ((/^\d+$/g).test(seguridad.decodeBase64(req.body.param)))
			callback(seguridad.decodeBase64(req.body.param));
        else
			utilidades.buscarIdUsuario(seguridad.decodeBase64(req.body.param)).then(
                callback,
                function(err) {
                    utilidades.printError(err, res);
                }
            );
	}
	else
		callback(null);
};

//exports.eliminarEvento = function(req, res) {

//};