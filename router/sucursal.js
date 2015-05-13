var connection = require('../config/db'),
    Q          = require('q'),
    utilidades = require('../utils/utilidades'),
	seguridad  = require('../utils/seguridad');

/**
 *	HttpGet
 *
 *  Gets a branch office or many branch offices.
 *
 *  @param
 *		A request url list parameters:
 *          An id in Base64 related to the company, and an integer related to an offset and an id in Base64 related to a branch office (this can be optional).
 *
 *	@return
 *		A JSON string:
 *		[
 *          {
 *              "id_sucursal" : "Base64EncodeString(1)", A string in Base64 that represents the identifier related to a branch office.
 *              "sucursal"    : "XXXXX"                  A string that represents the branch office's name.
 *              "direccion"   : "XXXXX"                  A string that represents the branch office's address.
 *              "id_ciudad"   : 0,                       An integer that represents the city related to the branch office.
 *              "ciudad"      : "XXXXX"                  A string that represents the city's name.
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
exports.buscarSucursal = function(req, res) {
	var company = parseInt(seguridad.decodeBase64(req.params.company));
    var offset  = typeof req.params.offset !== 'undefined' || req.params.offset != null ? parseInt(req.params.offset)                      : 10;
    var office  = typeof req.params.val    !== 'undefined' || req.params.val    != null ? parseInt(seguridad.decodeBase64(req.params.val)) : null;
    
    var sql = '';
	
    if (connection) {
        if ((/\/next\//g).test(req.route)) {
            sql =
                'SELECT ' +
                    'S.id_sucursal, ' +
					'S.sucursal, ' +
					'S.direccion, ' +
					'C.id_ciudad, ' +
					'C.ciudad ' +
                'FROM ' +
                    'datatabs_main.tb_sucursal AS S ' +
					'INNER JOIN ' +
					'datatabs_main.tb_ciudad_t AS C ' +
					'ON S.id_ciudad = C.id_ciudad ' +
                'WHERE ' +
					'C.id_idioma = 1 AND ' +
					'S.id_sucursal > ? AND ' +
					'S.id_empresa = ? AND ' +
                    'S.activo = 1 ' +
				'LIMIT 0, ?;';
                
            connection.db.query(
                sql,
                [office, company, offset],
                function(err, result) {
                    if (err)
                        utilidades.printError(err, res);
                    else {
                        for (i = 0; i < result.length; i++)
                            result[i].id_sucursal = seguridad.encodeBase64(result[i].id_sucursal);
                        
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
                    'S.id_sucursal, ' +
					'S.sucursal, ' +
					'S.direccion, ' +
					'C.id_ciudad, ' +
					'C.ciudad ' +
                'FROM ' +
                    'datatabs_main.tb_sucursal AS S ' +
					'INNER JOIN ' +
					'datatabs_main.tb_ciudad_t AS C ' +
					'ON S.id_ciudad = C.id_ciudad ' +
                'WHERE ' +
					'C.id_idioma = 1 AND ' +
					'S.id_sucursal < ? AND ' +
					'S.id_empresa = ? AND ' +
                    'S.activo = 1 ' +
				'LIMIT 0, ?;';
                
            connection.db.query(
                sql,
                [office, company, offset],
                function(err, result) {
                    if (err)
                        utilidades.printError(err, res);
                    else {
                        for (i = 0; i < result.length; i++)
                            result[i].id_sucursal = seguridad.encodeBase64(result[i].id_sucursal);
                        
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
                    'S.id_sucursal, ' +
					'S.sucursal, ' +
					'S.direccion, ' +
					'C.id_ciudad, ' +
					'C.ciudad ' +
                'FROM ' +
                    'datatabs_main.tb_sucursal AS S ' +
					'INNER JOIN ' +
					'datatabs_main.tb_ciudad_t AS C ' +
					'ON S.id_ciudad = C.id_ciudad ' +
                'WHERE ' +
					'C.id_idioma = 1 AND ' +
                    (
                        office != null
                        ? 
                            'S.id_sucursal = ? AND ' +
                            'S.id_empresa = ? AND ' +
                            'S.activo = 1;'
                        :
                            'S.id_empresa = ? AND ' +
                            'S.activo = 1 ' +
                            'LIMIT 0, ?;'
                    );
            
            connection.db.query(
                sql,
                (
                    office != null ? [office, company] : [company, offset]
                ),
                function(err, result) {
                    if (err) {
                        console.log('error')
                        utilidades.printError(err, res);
                    }
                    else {
                        console.log(JSON.stringify(result))
                        for (i = 0; i < result.length; i++)
                            result[i].id_sucursal = seguridad.encodeBase64(result[i].id_sucursal);
                        
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
 *  Creates a branch office.
 *
 *	@param
 *		A JSON request body:
 *		{
 *			"param"     : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy|1)", A string in Base64 that represents an user session or id related to the user that creates the request.
 *          "nombre"    : "XXXXX",                                                  A string that represents the name related the branch office that we want to create.
 *          "direccion" : "XXXXX",                                                  A string that represents the address related to the branch office that we want to create. This field can be optional.
 *          "ciudad"    : 0,                                                        An integer identifier that represents the city related to the branch office that we want to create.
 *          "empresa"   : 0                                                         An integer that represents the distributor related to the branch office that we want to create.
 *		}
 *	
 *	@return
 *		A JSON string:
 *		{
 *			"msg" : "OK - Base64EncodeString(branch office id)"
 *		}
 *
 *	@error
 *		A JSON string:
 *		{
 *			"msg" : "Error description"
 *		}
 */
exports.crearSucursal = function(req, res) {
	var user = typeof req.body.param !== 'undefined' || req.body.param != null ? seguridad.decodeBase64(req.body.param) : null;
	
	var callback = function(id) {
		var sql = '', mensaje = '', resultado = '';
	
		if (connection) {
			sql =
				'SET @resultado = ""; ' +
				'CALL datatabs_main.sp_crearSucursal(?, ?, ?, ?, ?, @resultado); ' +
				'SELECT @resultado;';
			
			connection.db.query(
				sql,
				[
					id,
					req.body.nombre,
					typeof req.body.direccion !== undefined || req.body.direccion != null ? req.body.direccion : null,
					req.body.ciudad,
                    req.body.empresa
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
 *  Updates a branch office.
 *
 *	@param
 *		A request url parameter (an id in Base64 related to the branch office that we want to update).
 *	@param
 *		A JSON request body (fields to update should be set with a value):
 *		{
 *			"param"         : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy|1)", A string in Base64 that represents an user session or id related to the user that creates the request.
 *          "nombre"        : "XXXXX",                                                  A string that represents the name related the branch office that we want to create.
 *          "direccion"     : "XXXXX",                                                  A string that represents the address related to the branch office that we want to create.
 *          "ciudad"        : 0,                                                        An integer identifier that represents the city related to the branch office that we want to create.
 *          "activo"        : 1                                                         An integer that represents the status (1 for active and 0 for inactive) related to the branch office that we want to create.
 *		}
 *	
 *	@return
 *		A JSON string:
 *		{
 *			"msg" : "OK - Base64EncodeString(branch office id)"
 *		}
 *
 *	@error
 *		A JSON string:
 *		{
 *			"msg" : "Error description"
 *		}
 */
exports.modificarSucursal = function(req, res) {
	var branch = seguridad.decodeBase64(req.params.val);
	
	var callback = function(data) {
		var sql = '', mensaje = '', resultado = '';
		
		if (connection) {
			sql =
				'SET @resultado = ""; ' +
				'CALL datatabs_main.sp_modificarSucursal(?, ?, ?, ?, ?, ?, @resultado); ' +
				'SELECT @resultado;';
			
			connection.db.query(
				sql,
				[
					data[1],
					data[0],
                    typeof req.body.nombre    !== undefined || req.body.nombre    != null ? req.body.nombre    : null,
					typeof req.body.direccion !== undefined || req.body.direccion != null ? req.body.direccion : null,
					typeof req.body.ciudad    !== undefined || req.body.ciudad    != null ? req.body.ciudad    : null,
					typeof req.body.activo    !== undefined || req.body.activo    != null ? req.body.activo    : null
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
			callback([branch, seguridad.decodeBase64(req.body.param)]);
		else
			Q.all([branch, utilidades.buscarIdUsuario(seguridad.decodeBase64(req.body.param))]).then(
				callback,
				function(err) {
					utilidades.printError(err, res);
				}
			);
	}
	else
		callback([branch, null]);
};

//exports.eliminarSucursal = function(req, res) {

//};