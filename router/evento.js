var connection = require('../config/db'),
    Q          = require('q'),
    utilidades = require('../utils/utilidades'),
	seguridad  = require('../utils/seguridad');

/**
 *	HttpGet
 *
 *  Gets an event or many events.
 *
 *  @param
 *		A request url list parameters:
 *          An id in Base64 related to the company (this can be 0), an id in Base64 related to the branch office (this can be 0), an integer related to an offset and an id in Base64 related to an event (this can be optional).
 *
 *	@return
 *		A JSON string:
 *		[
 *          {
 *              "id_evento"   : "Base64EncodeString(1)",        A string in Base64 that represents the identifier related to an event.
 *              "evento"      : "XXXXX",                        A string that represents the event's name.
 *              "descripcion" : "XXXXX",                        A string that represents the event's description.
 *              "fechaInicio" : "YYYY-MM-DD HH:mm:ss",          A string that represents the event's start date.
 *              "fechaFin"    : "YYYY-MM-DD HH:mm:ss",          A string that represents the event's end date.
 *              "flujo"       : [{ XXXXX }],                    A JSON string that represents the event's flow.
 *              "imagen"      : "XXXXX",                        A string that represents the image file name related to an event.
 *              "id_empresa"  : "Base64EncodeString(1)",        A string in Base64 that represents the identifier related to a company. This field can be optional if the company request parameter value is 0.
 *              "empresa"     : "XXXXX"                         A string that represents the company's name. This field can be optional if the company request parameter value is 0.
 *              "id_sucursal" : "Base64EncodeString(1)",        A string in Base64 that represents the identifier related to a branch office. This field can be optional if the office request parameter value is 0.
 *              "sucursal"    : "XXXXX"                         A string that represents the branch office's name. This field can be optional if the office request parameter value is 0.
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

	try {
        var company = parseInt(seguridad.decodeBase64(req.params.company));
        var office  = parseInt(seguridad.decodeBase64(req.params.office));
        var offset  = typeof req.params.offset  !== 'undefined' || req.params.offset  != null ? parseInt(req.params.offset)                      : 10;
        var event   = typeof req.params.val     !== 'undefined' || req.params.val     != null ? parseInt(seguridad.decodeBase64(req.params.val)) : null;
        
        var sql = '';
        
        if (connection) {
            if ((/\/next\//g).test(req.route)) {
                sql =
                    'SELECT ' +
                        'E.id_evento, ' +
                        'E.evento, ' +
                        'E.descripcion, ' +
                        'E.fechaInicio, ' +
                        'E.fechaFin, ' +
                        'E.flujo, ' +
                        (
                            company != 0
                            ?
                                'E.id_empresa, ' +
                                'C.nombre, '
                            :
                                ''
                        ) +
                        (
                            office != 0
                            ?
                                'ES.id_sucursal, ' +
                                'S.sucursal, '
                            :
                                ''
                        ) +
                        'I.imagen ' +
                    'FROM ' +
                        'datatabs_main.tb_evento AS E ' +
                        'INNER JOIN ' +
                        'datatabs_main.tb_empresa AS C ' +
                        'ON E.id_empresa = C.id_empresa ' +
                        (
                            office != 0
                            ?
                                'LEFT OUTER JOIN ' +
                                'datatabs_main.tb_evento_sucursal AS ES ' +
                                'ON E.id_evento = ES.id_evento ' +
                                'INNER JOIN ' +
                                'datatabs_main.tb_sucursal AS S ' +
                                'ON ES.id_sucursal = S.id_sucursal '
                            :
                                ''
                        ) +
                        'LEFT OUTER JOIN ' +
                        'datatabs_main.tb_imagen AS I ' +
                        'ON E.id_imagen = I.id_imagen ' +
                    'WHERE ' +
                        'E.id_evento > ? AND ' +
                        (company != 0 ? 'E.id_empresa = ? AND ' : '') +
                        (office  != 0 ? 'ES.id_sucursal = ? AND ' : '') +
                        'E.activo = 1 ' +
                    'LIMIT 0, ?;';
                    
                connection.db.query(
                    sql,
                    (
                        company != 0 && office != 0
                        ?
                            [event, company, office, offset]
                        :   
                            (
                                company != 0
                                ? [event, company, offset]
                                : [event, office, offset]
                            )
                    ),
                    function(err, result) {
                        if (err)
                            utilidades.printError(err, res);
                        else {
                            for (i = 0; i < result.length; i++) {
                                result[i].id_evento  = seguridad.encodeBase64(result[i].id_evento);
                                if (company != 0)
                                    result[i].id_empresa = seguridad.encodeBase64(result[i].id_empresa);
                                if (office != 0)
                                    result[i].id_sucursal = seguridad.encodeBase64(result[i].id_sucursal);
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
                        'E.id_evento, ' +
                        'E.evento, ' +
                        'E.descripcion, ' +
                        'E.fechaInicio, ' +
                        'E.fechaFin, ' +
                        'E.flujo, ' +
                        (
                            company != 0
                            ?
                                'E.id_empresa, ' +
                                'C.nombre, '
                            :
                                ''
                        ) +
                        (
                            office != 0
                            ?
                                'ES.id_sucursal, ' +
                                'S.sucursal, '
                            :
                                ''
                        ) +
                        'I.imagen ' +
                    'FROM ' +
                        'datatabs_main.tb_evento AS E ' +
                        'INNER JOIN ' +
                        'datatabs_main.tb_empresa AS C ' +
                        'ON E.id_empresa = C.id_empresa ' +
                        (
                            office != 0
                            ?
                                'LEFT OUTER JOIN ' +
                                'datatabs_main.tb_evento_sucursal AS ES ' +
                                'ON E.id_evento = ES.id_evento ' +
                                'INNER JOIN ' +
                                'datatabs_main.tb_sucursal AS S ' +
                                'ON ES.id_sucursal = S.id_sucursal '
                            :
                                ''
                        ) +
                        'LEFT OUTER JOIN ' +
                        'datatabs_main.tb_imagen AS I ' +
                        'ON E.id_imagen = I.id_imagen ' +
                    'WHERE ' +
                        'E.id_evento < ? AND ' +
                        (company != 0 ? 'E.id_empresa = ? AND ' : '') +
                        (office != 0 ? 'ES.id_sucursal = ? AND ' : '') +
                        'E.activo = 1 ' +
                    'LIMIT 0, ?;';
                    
                connection.db.query(
                    sql,
                    (
                        company != 0 && office != 0
                        ?
                            [event, company, office, offset]
                        :   
                            (
                                company != 0
                                ? [event, company, offset]
                                : [event, office, offset]
                            )
                    ),
                    function(err, result) {
                        if (err)
                            utilidades.printError(err, res);
                        else {
                            for (i = 0; i < result.length; i++) {
                                result[i].id_evento  = seguridad.encodeBase64(result[i].id_evento);
                                if (company != 0)
                                    result[i].id_empresa = seguridad.encodeBase64(result[i].id_empresa);
                                if (office != 0)
                                    result[i].id_sucursal = seguridad.encodeBase64(result[i].id_sucursal);
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
                        'E.id_evento, ' +
                        'E.evento, ' +
                        'E.descripcion, ' +
                        'E.fechaInicio, ' +
                        'E.fechaFin, ' +
                        'E.flujo, ' +
                        (
                            company != 0
                            ?
                                'E.id_empresa, ' +
                                'C.nombre, '
                            :
                                ''
                        ) +
                        (
                            office != 0
                            ?
                                'ES.id_sucursal, ' +
                                'S.sucursal, '
                            :
                                ''
                        ) +
                        'I.imagen ' +
                    'FROM ' +
                        'datatabs_main.tb_evento AS E ' +
                        'INNER JOIN ' +
                        'datatabs_main.tb_empresa AS C ' +
                        'ON E.id_empresa = C.id_empresa ' +
                        (
                            office != 0
                            ?
                                'LEFT OUTER JOIN ' +
                                'datatabs_main.tb_evento_sucursal AS ES ' +
                                'ON E.id_evento = ES.id_evento ' +
                                'INNER JOIN ' +
                                'datatabs_main.tb_sucursal AS S ' +
                                'ON ES.id_sucursal = S.id_sucursal '
                            :
                                ''
                        ) +
                        'LEFT OUTER JOIN ' +
                        'datatabs_main.tb_imagen AS I ' +
                        'ON E.id_imagen = I.id_imagen ' +
                    'WHERE ' +
                        (
                            event != null
                            ? 
                                'E.id_evento = ? AND ' +
                                (company != 0 ? 'E.id_empresa = ? AND ' : '') +
                                (office != 0 ? 'ES.id_sucursal = ? AND ' : '') +
                                'E.activo = 1;'
                            :
                                (company != 0 ? 'E.id_empresa = ? AND ' : '') +
                                (office != 0 ? 'ES.id_sucursal = ? AND ' : '') +
                                'E.activo = 1 ' +
                                'LIMIT 0, ?;'
                        );
                
                connection.db.query(
                    sql,
                    (
                        event != null
                        ?
                            (
                                company != 0 && office != 0
                                ? [event, company, office]
                                : 
                                    (
                                        company != 0
                                        ? [event, company]
                                        : [event, office]
                                    )
                            )
                        :
                            (
                                company != 0 && office != 0
                                ? [company, office, offset]
                                : 
                                    (
                                        company != 0
                                        ? [company, offset]
                                        : [office, offset]
                                    )
                            )
                    ),
                    function(err, result) {
                        if (err) {
                            console.log('error')
                            utilidades.printError(err, res);
                        }
                        else {
                            console.log(JSON.stringify(result))
                            for (i = 0; i < result.length; i++) {
                                result[i].id_evento  = seguridad.encodeBase64(result[i].id_evento);
                                if (company != 0)
                                    result[i].id_empresa = seguridad.encodeBase64(result[i].id_empresa);
                                if (office != 0)
                                    result[i].id_sucursal = seguridad.encodeBase64(result[i].id_sucursal);
                            }
                            
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

	try {
        var user = typeof req.body.param !== 'undefined' || req.body.param != null ? seguridad.decodeBase64(req.body.param) : null;
        
        var callback = function(id) {
            var sql = '', mensaje = '', resultado = '';
        
            if (connection) {
                sql =
                    'SET @resultado = ""; ' +
                    'CALL datatabs_main.sp_crearEvento(?, ?, ?, ?, ?, @resultado); ' +
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
    }
    catch (err) {
        utilidades.printError(err, res);
    }
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

	try {
        var event = seguridad.decodeBase64(req.params.val);
        
        var callback = function(data) {
            var sql = '', mensaje = '', resultado = '';
            
            if (connection) {
                sql =
                    'SET @resultado = ""; ' +
                    'CALL datatabs_main.sp_modificarEvento(?, ?, ?, ?, ?, ?, ?, @resultado); ' +
                    'SELECT @resultado;';
                
                connection.db.query(
                    sql,
                    [
                        data[1],
                        data[0],
                        typeof req.body.nombre      !== 'undefined' || req.body.nombre      != null ? req.body.nombre      : null,
                        typeof req.body.descripcion !== 'undefined' || req.body.descripcion != null ? req.body.descripcion : null,
                        typeof req.body.fechaInicio !== 'undefined' || req.body.fechaInicio != null ? req.body.fechaInicio : null,
                        typeof req.body.fechaFin    !== 'undefined' || req.body.fechaFin    != null ? req.body.fechaFin    : null,
                        typeof req.body.activo      !== 'undefined' || req.body.activo      != null ? req.body.activo      : null
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
        
        if (typeof req.body.param !== 'undefined' || req.body.param != null) {
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
    }
    catch (err) {
        utilidades.printError(err, res);
    }
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

	try {
        var event = seguridad.decodeBase64(req.params.val);
        
        var callback = function(id) {
            var sql = '', mensaje = '', resultado = '';
            
            if (connection) {
                sql =
                    'SET @resultado = ""; ' +
                    'CALL datatabs_main.sp_asociarEventoSucursal(?, ?, ?, @resultado); ' +
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
        
        if (typeof req.body.param !== 'undefined' || req.body.param != null) {
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
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};

//exports.eliminarEvento = function(req, res) {

//};