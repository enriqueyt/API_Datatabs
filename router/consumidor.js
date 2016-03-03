var connection = require('../config/db'),
    Q          = require('q'),
    utilidades = require('../utils/utilidades'),
	seguridad  = require('../utils/seguridad'),
    nodo       = require('../router/nodo'),
    request    = require('request'); 
    
exports.buscarConsumidor = function(req, res) {

    try {
        var client = typeof req.params.val !== 'undefined' || req.params.val != null ? seguridad.decodeBase64(req.params.val) : null;
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};

/**
 *  HttpPost
 *
 *  Creates a client.
 *
 *  @param
 *      A JSON request body:
 *      {
 *          "param"           : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy|1)",   A string in Base64 that represents an user session or id related to the user that creates the request.
 *          "nombre"          : "XXXXX",                                                    A string that represents the name related the client that we want to create. This field can be optional.
 *          "apellido"        : "XXXXX",                                                    A string that represents the last name related the client that we want to create. This field can be optional.
 *          "tlfCelular"      : "XXXXX",                                                    A string that represents the mobile telephone number related to the client that we want to create.
 *          "correo"          : "XXXXX@XXXX.XXX",                                           A string that represents the e-mail related to the client that we want to create. This field can be optional.
 *          "twitter"         : "XXXXX",                                                    A string that represents the twitter user name related to the client that we want to create. This field can be optional.
 *          "facebook"        : "XXXXX",                                                    A string that represents the facebook user name related to the client that we want to create. This field can be optional. 
 *          "fechaNacimiento" : "YYYY-MM-DD",                                               A string that represents the birth date related to the client that we want to create. This field can be optional.
 *          "tipoConsumidor"  : 0,                                                          An integer identifier that represents the client type related to the client that we want to create.
 *          "sexo"            : 0,                                                          An integer identifier that represents the sex related to the client that we want to create. This field can be optional.
 *          "ciudad"          : 0                                                           An integer identifier that represents the city related to the client that we want to create. This field can be optional.
 *      }
 *  
 *  @return
 *      A JSON string:
 *      {
 *          "msg" : "OK - Base64EncodeString(client id)"
 *      }
 *
 *  @error
 *      A jSON string:
 *      {
 *          "msg" : "Error description"
 *      }
 */
exports.crearConsumidor = function(req, res) {

    try {
        var user = typeof req.body.param !== 'undefined' || req.body.param != null ? seguridad.decodeBase64(req.body.param) : null;
        
        var callback = function(id) {
            var sql = '', mensaje = '', resultado = '';
        
            if (connection) {
                sql =
                    'SET @resultado = ""; ' +
                    'CALL datatabs_main.sp_crearConsumidor(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, @resultado); ' +
                    'SELECT @resultado;';
                
                connection.db.query(
                    sql,
                    [
                         id,
                        typeof req.body.nombre          !== 'undefined' || req.body.nombre          != null ? req.body.nombre          : null,
                        typeof req.body.apellido        !== 'undefined' || req.body.apellido        != null ? req.body.apellido        : null,
                        req.body.tlfCelular,                                                                                         
                        typeof req.body.correo          !== 'undefined' || req.body.correo          != null ? req.body.correo          : null,
                        typeof req.body.twitter         !== 'undefined' || req.body.twitter         != null ? req.body.twitter         : null,
                        typeof req.body.facebook        !== 'undefined' || req.body.facebook        != null ? req.body.facebook        : null,
                        typeof req.body.fechaNacimiento !== 'undefined' || req.body.fechaNacimiento != null ? req.body.fechaNacimiento : null,
                        req.body.tipoConsumidor,
                        typeof req.body.sexo            !== 'undefined' || req.body.sexo            != null ? req.body.sexo            : null,
                        typeof req.body.ciudad          !== 'undefined' || req.body.ciudad          != null ? req.body.ciudad          : null,
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
 *  HttpPut
 *
 *  Updates a client.
 *
 *  @param
 *      A request url parameter (an id in Base64 related to the client that we want to update).
 *  @param
 *      A JSON request body (fields to update should be set with a value):
 *      {
 *          "param"           : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy|1)",   A string in Base64 that represents an user session or id related to the user that creates the request.
 *          "nombre"          : "XXXXX",                                                    A string that represents the name related the client that we want to create.
 *          "apellido"        : "XXXXX",                                                    A string that represents the last name related the client that we want to create.
 *          "tlfCelular"      : "XXXXX",                                                    A string that represents the mobile telephone number related to the client that we want to create.
 *          "correo"          : "XXXXX@XXXX.XXX",                                           A string that represents the e-mail related to the client that we want to create.
 *          "twitter"         : "XXXXX",                                                    A string that represents the twitter user name related to the client that we want to create.
 *          "facebook"        : "XXXXX",                                                    A string that represents the facebook user name related to the client that we want to create.
 *          "fechaNacimiento" : "YYYY-MM-DD",                                               A string that represents the birth date related to the client that we want to create.
 *          "tipoConsumidor"  : 0,                                                          An integer identifier that represents the client type related to the client that we want to create.
 *          "sexo"            : 0,                                                          An integer identifier that represents the sex related to the client that we want to create.
 *          "ciudad"          : 0                                                           An integer identifier that represents the city related to the client that we want to create.
 *      }
 *  
 *  @return
 *      A JSON string:
 *      {
 *          "msg" : "OK - Base64EncodeString(client id)"
 *      }
 *
 *  @error
 *      A JSON string:
 *      {
 *          "msg" : "Error description"
 *      }
 */

exports.modificarConsumidor = function(req, res) {

    try {
        var client = seguridad.decodeBase64(req.params.val);
        
        var callback = function(data) {
            var sql = '', mensaje = '', resultado = '';
          
            if (connection) {
                sql =
                    'SET @resultado = ""; ' +
                    'CALL datatabs_main.sp_modificarConsumidor(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, @resultado); ' +
                    'SELECT @resultado;';
                
                connection.db.query(
                    sql,
                    [
                        data[1],
                        data[0],
                        typeof req.body.nombre          !== 'undefined' || req.body.nombre          != null ? req.body.nombre          : null,
                        typeof req.body.apellido        !== 'undefined' || req.body.apellido        != null ? req.body.apellido        : null,
                        typeof req.body.tlfCelular      !== 'undefined' || req.body.tlfCelular      != null ? req.body.tlfCelular      : null,
                        typeof req.body.correo          !== 'undefined' || req.body.correo          != null ? req.body.correo          : null,
                        typeof req.body.twitter         !== 'undefined' || req.body.twitter         != null ? req.body.twitter         : null,
                        typeof req.body.facebook        !== 'undefined' || req.body.facebook        != null ? req.body.facebook        : null,
                        typeof req.body.fechaNacimiento !== 'undefined' || req.body.fechaNacimiento != null ? req.body.fechaNacimiento : null,
                        typeof req.body.tipoConsumidor  !== 'undefined' || req.body.tipoConsumidor  != null ? req.body.tipoConsumidor  : null,
                        typeof req.body.sexo            !== 'undefined' || req.body.sexo            != null ? req.body.sexo            : null,
                        typeof req.body.ciudad          !== 'undefined' || req.body.ciudad          != null ? req.body.ciudad          : null
                    ],
                    function(err, result) {
                        console.log(result)
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
                callback([client, seguridad.decodeBase64(req.body.param)]);
            else
                Q.all([client, utilidades.buscarIdUsuario(seguridad.decodeBase64(req.body.param))]).then(
                    callback,
                    function(err) {
                        utilidades.printError(err, res);
                    }
                );
        }
        else{

            Q.all([utilidades.buscarIdClientePorCelular(client), null]).then(
                callback,
                function(err) {
                    utilidades.printError(err, res);
                }
            );
        }
            
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};


/**
 *  HttpPut
 *
 *  Validates a client.
 *
 *  @param
 *      A request url parameter (an contact number in Base64 related to the client that we want to validate).
 *  @param
 *      A JSON request body:
 *      {
 *          
 *          "evento"      : "Base64EncodeString(1)",      An integer identifier in Base64 that represents the event which we want to validate.
 *          "nodo"        : "Base64EncodeString(1)",      An integer identifier in Base64 that represents the check-in node related to the event.
 *          "dispositivo" : "Base64EncodeString(XXXX|1)", An IMEI's device or integer identifier in Base64 that represents the device which is used to validate.
 *      }
 *  
 *  @return
 *      A JSON string:
 *      {
 *          "consumidor"             : "Base64EncodeString(client id)", An integer identifier in Base64 that represents the client who was validated.
 *          "contadorGlobalEmpresa"  : 1,                               An integer that represents the total company visit counter.
 *          "contadorGlobalSucursal" : 1,                               An integer that represents the total branch office visits counter.
 *          "contadorActualSucursal" : 1,                               An integer that represents the actual branch office visits counter.
 *          "contadorGlobalEvento"   : 1,                               An integer that represents the total event visits counter.
 *          "contadorActualEvento"   : 1                                An integer that represents the actual event visits counter.
 *      }
 *
 *  @error
 *      A JSON string:
 *      {
 *          "msg" : "Error description"
 *      }
 */
exports.validarConsumidor = function(req, res) {

    try {
        var contact = seguridad.decodeBase64(req.params.val);
        var device  = seguridad.decodeBase64(req.body.dispositivo);
        
        var callback = function(id) {
            var sql = '', mensaje = '', resultado = '';

            if (connection) {
                sql =
                    'SET @resultado = ""; ' +
                    'CALL datatabs_main.sp_validarConsumidor(?, ?, ?, ?, @resultado); ' +
                    'SELECT @resultado;';
            
                connection.db.query(
                    sql,
                    [
                        contact,
                        seguridad.decodeBase64(req.body.evento),
                        seguridad.decodeBase64(req.body.nodo),
                        id
                    ],
                    function(err, result) {
                         console.log(err)
                        console.log(resultado)
                        if (err)
                            utilidades.printError(err, res);
                        else {
                            mensaje   = result[3][0]['@resultado'];
                            resultado = result[1][0];
                            console.log(mensaje)

                            if ((/ERROR/g).test(mensaje))
                                utilidades.printError(mensaje, res);
                            else {   

                                request({
                                    uri: 'http://104.131.102.105:6968/actualizar_lista_clientes',
                                    method: 'GET',
                                }, function(error, response, body) {
                                    console.log(error);      
                                });

                                res.contentType('application/json');
                                res.write(JSON.stringify(resultado));
                                res.end();
                            }
                        }
                    }
                );
            }
        };

        if ((/^\d+$/g).test(device))
            callback(device);
        else
            utilidades.buscarIdDispositivo(device).then(
                callback,
                function(err) {
                    utilidades.printError(err, res);
                }
            );
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};



exports.crearConsumo = function(req, res) {

    try {
        
        var sql = '', mensaje = '', resultado = '',
            data = [
                req.body.Celular,
                req.body.Identificacion,
                req.body.Nombre,
                req.body.Id_transaccion,
                req.body.Fecha_transaccion,
                req.body.Id_registradora,
                req.body.Registradora,
                req.body.Id_sucursal,
                req.body.Sucursal
            ],
            items = req.body.Compra
            item = [];

        if(connection){

            sql = 'set @resultado = ""; ' +
                  'call datatabs_main.sp_generar_consumo(?, ?, ?, ?, ?, ?, ?, ?, ?, @resultado); ' +
                  'select @resultado;';
        
            connection.db.query(sql, data, function(err, resultado) {
                    
                    var id_visitaevento_compra = 0, mensaje = '';
                    
                    if (err)
                        utilidades.printError(err, res);
                    else {
                        
                        mensaje = JSON.parse(resultado[3][0]['@resultado']);
                        id_visitaevento_compra = resultado[1][0];
                        
                        if(mensaje.tipo == 'error')
                            utilidades.printError(mensaje.mensaje, res);
                        else {
                            
                            if(items != null || typeof items != 'undefined'){

                                

                                for (var i = 0; i < items.length; i++) {

                                    item = [
                                        id_visitaevento_compra.res,
                                        parseInt(items[i].Id_item),
                                        items[i].Description_item,
                                        parseFloat(items[i].Monto),
                                        parseInt(items[i].Cantidad)
                                    ];  
                                    
                                    utilidades.almacenarConsumo(item, i).then(function(resul, err){                                    
                                        if(err) utilidades.printError(err, res);

                                        if(items.length-1==resul.i){
                                            res.json({exito:id_visitaevento_compra.res>0});
                                            res.end();
                                        }

                                    });



                                };

                            };
                            
                        };
                    };
                });
        };
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};

