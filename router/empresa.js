var connection = require('../config/db'),
    Q          = require('q'),
    utilidades = require('../utils/utilidades'),
	seguridad  = require('../utils/seguridad');
    
exports.buscarEmpresa = function(req, res) {

    try {
        var distributor = parseInt(seguridad.decodeBase64(req.params.distributor));
        var offset      = typeof req.params.offset !== 'undefined' || req.params.offset != null ? parseInt(req.params.offset)                      : 10;
        var company     = typeof req.params.val    !== 'undefined' || req.params.val    != null ? parseInt(seguridad.decodeBase64(req.params.val)) : null;
        
        var sql = '';
        
        if (connection) {
            if ((/\/next\//g).test(req.route)) {
                sql =
                    'SELECT ' +
                        'E.id_empresa, ' +
                        'E.identificacion, ' +
                        'E.nombre, ' +
                        'E.razonSocial, ' +
                        'E.telefono, ' +
                        'E.fax, ' +
                        'E.correo, ' +
                        'E.direccion, ' +
                        'E.id_ciudad, ' +
                        'C.ciudad ' +
                    'FROM ' +
                        'datatabs_main.tb_empresa AS E ' +
                        'INNER JOIN ' +
                        'datatabs_main.tb_ciudad_t AS C ' +
                        'ON E.id_ciudad = C.id_ciudad ' +
                    'WHERE ' +
                        'C.id_idioma = 1 AND ' +
                        'E.id_empresa > ? AND ' +
                        (
                            distributor != 0 ? 'E.id_distribuidor = ? AND ' : ''
                        ) +
                        'E.activo = 1 ' +
                    'LIMIT 0, ?;';
                    
                connection.db.query(
                    sql,
                    (
                        distributor != 0 ? [company, distributor, offset] : [company, offset]
                    ),
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
                        'E.id_empresa, ' +
                        'E.identificacion, ' +
                        'E.nombre, ' +
                        'E.razonSocial, ' +
                        'E.telefono, ' +
                        'E.fax, ' +
                        'E.correo, ' +
                        'E.direccion, ' +
                        'E.id_ciudad, ' +
                        'C.ciudad ' +
                    'FROM ' +
                        'datatabs_main.tb_empresa AS E ' +
                        'INNER JOIN ' +
                        'datatabs_main.tb_ciudad_t AS C ' +
                        'ON E.id_ciudad = C.id_ciudad ' +
                    'WHERE ' +
                        'C.id_idioma = 1 AND ' +
                        'E.id_empresa < ? AND ' +
                        (
                            distributor != 0 ? 'E.id_distribuidor = ? AND ' : ''
                        ) +
                        'E.activo = 1 ' +
                    'LIMIT 0, ?;';
                    
                connection.db.query(
                    sql,
                    (
                        distributor != 0 ? [company, distributor, offset] : [company, offset]
                    ),
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
                        'E.id_empresa, ' +
                        'E.identificacion, ' +
                        'E.nombre, ' +
                        'E.razonSocial, ' +
                        'E.telefono, ' +
                        'E.fax, ' +
                        'E.correo, ' +
                        'E.direccion, ' +
                        'E.id_ciudad, ' +
                        'C.ciudad ' +
                    'FROM ' +
                        'datatabs_main.tb_empresa AS E ' +
                        'INNER JOIN ' +
                        'datatabs_main.tb_ciudad_t AS C ' +
                        'ON E.id_ciudad = C.id_ciudad ' +
                    'WHERE ' +
                        'C.id_idioma = 1 AND ' +
                        (
                            distributor != 0 ? 'E.id_distribuidor = ? AND ' : ''
                        ) +
                        (
                            company != null
                            ?
                                'E.id_empresa < ? AND ' +
                                'E.activo = 1;'
                            :
                                'E.activo = 1 ' +
                                'LIMIT 0, ?;'   
                        );
                
                connection.db.query(
                    sql,
                    (
                        company != null
                        ? 
                            (
                                distributor != 0 ? [distributor, company] : [company]
                            )
                        :
                            (
                                distributor != 0 ? [distributor, offset] : [offset]
                            )
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
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};
    
/**
 *	HttpPost
 *
 *  Creates a company.
 *
 *	@param
 *		A JSON request body:
 *		{
 *			"param"         : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy|1)", A string in Base64 that represents an user session or id related to the user that creates the request.
 *          "identificador" : "XXXXX",                                                  A string that represents an identifier related to the company that we want to create. This field can be optional.
 *          "nombre"        : "XXXXX",                                                  A string that represents the name related the company that we want to create.
 *          "documento"     : "XXXXX",                                                  A string that represents the document identifier related the company that we want to create.
 *          "tlfOficina"    : "XXXXX",                                                  A string that represents the telephone number related to the company that we want to create. This field can be optional.
 *          "tlfFax"        : "XXXXX",                                                  A string that represents the fax telephone number related to the company that we want to create. This field can be optional.
 *          "correo"        : "XXXXX@XXXX.XXX",                                         A string that represents the e-mail related to the company that we want to create. This field can be optional.
 *          "direccion"     : "XXXXX",                                                  A string that represents the address related to the company that we want to create. This field can be optional.
 *          "ciudad"        : 0,                                                        An integer identifier that represents the city related to the company that we want to create.
 *          "distribuidor"  : 0                                                         An integer that represents the distributor related to the company that we want to create.
 *		}
 *	
 *	@return
 *		A JSON string:
 *		{
 *			"msg" : "OK - Base64EncodeString(company id)"
 *		}
 *
 *	@error
 *		A JSON string:
 *		{
 *			"msg" : "Error description"
 *		}
 */
exports.crearEmpresa = function(req, res) {

	try {
        var user = typeof req.body.param !== 'undefined' || req.body.param != null ? seguridad.decodeBase64(req.body.param) : null;
        
        var callback = function(id) {
            var sql = '', mensaje = '', resultado = '';
        
            if (connection) {
                sql =
                    'SET @resultado = ""; ' +
                    'CALL datatabs_main.sp_crearEmpresa(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, @resultado); ' +
                    'SELECT @resultado;';
                
                connection.db.query(
                    sql,
                    [
                        id,
                        typeof req.body.identificador !== undefined || req.body.identificador != null ? req.body.identificador : null,
                        req.body.nombre,
                        req.body.documento,
                        typeof req.body.tlfOficina    !== undefined || req.body.tlfOficina    != null ? req.body.tlfOficina    : null,
                        typeof req.body.tlfFax        !== undefined || req.body.tlfFax        != null ? req.body.tlfFax        : null,
                        typeof req.body.correo        !== undefined || req.body.correo        != null ? req.body.correo        : null,
                        typeof req.body.direccion     !== undefined || req.body.direccion     != null ? req.body.direccion     : null,
                        req.body.ciudad,
                        req.body.distribuidor
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
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};

/**
 *	HttpPut
 *
 *  Updates a company.
 *
 *	@param
 *		A request url parameter (an id in Base64 related to the company that we want to update).
 *	@param
 *		A JSON request body (fields to update should be set with a value):
 *		{
 *			"param"         : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy|1)", A string in Base64 that represents an user session or id related to the user that creates the request.
 *          "identificador" : "XXXXX",                                                  A string that represents an identifier related to the company that we want to create.
 *          "nombre"        : "XXXXX",                                                  A string that represents the name related the company that we want to create.
 *          "documento"     : "XXXXX",                                                  A string that represents the document identifier related the company that we want to create.
 *          "tlfOficina"    : "XXXXX",                                                  A string that represents the telephone number related to the company that we want to create.
 *          "tlfFax"        : "XXXXX",                                                  A string that represents the fax telephone number related to the company that we want to create.
 *          "correo"        : "XXXXX@XXXX.XXX",                                         A string that represents the e-mail related to the company that we want to create.
 *          "direccion"     : "XXXXX",                                                  A string that represents the address related to the company that we want to create.
 *          "ciudad"        : 0,                                                        An integer identifier that represents the city related to the company that we want to create.
 *          "activo"        : 1                                                         An integer that represents the status (1 for active and 0 for inactive) related to the company that we want to create.
 *		}
 *	
 *	@return
 *		A JSON string:
 *		{
 *			"msg" : "OK - Base64EncodeString(company id)"
 *		}
 *
 *	@error
 *		A JSON string:
 *		{
 *			"msg" : "Error description"
 *		}
 */
exports.modificarEmpresa = function(req, res) {

	try {
        var comp = seguridad.decodeBase64(req.params.val);
        
        var callback = function(data) {
            var sql = '', mensaje = '', resultado = '';
            
            if (connection) {
                sql =
                    'SET @resultado = ""; ' +
                    'CALL datatabs_main.sp_modificarEmpresa(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, @resultado); ' +
                    'SELECT @resultado;';
                
                connection.db.query(
                    sql,
                    [
                        data[1],
                        data[0],
                        typeof req.body.identificador !== undefined || req.body.identificador != null ? req.body.identificador : null,
                        typeof req.body.nombre        !== undefined || req.body.nombre        != null ? req.body.nombre        : null,
                        typeof req.body.documento     !== undefined || req.body.documento     != null ? req.body.documento     : null,
                        typeof req.body.tlfOficina    !== undefined || req.body.tlfOficina    != null ? req.body.tlfOficina    : null,
                        typeof req.body.tlfFax        !== undefined || req.body.tlfFax        != null ? req.body.tlfFax        : null,
                        typeof req.body.correo        !== undefined || req.body.correo        != null ? req.body.correo        : null,
                        typeof req.body.direccion     !== undefined || req.body.direccion     != null ? req.body.direccion     : null,
                        typeof req.body.ciudad        !== undefined || req.body.ciudad        != null ? req.body.ciudad        : null,
                        typeof req.body.activo        !== undefined || req.body.activo        != null ? req.body.activo        : null
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
                callback([comp, seguridad.decodeBase64(req.body.param)]);
            else
                Q.all([comp, utilidades.buscarIdUsuario(seguridad.decodeBase64(req.body.param))]).then(
                    callback,
                    function(err) {
                        utilidades.printError(err, res);
                    }
                );
        }
        else
            callback([comp, null]);
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};

//exports.eliminarEmpresa = function(req, res) {

//};