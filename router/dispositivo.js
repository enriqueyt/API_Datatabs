var connection = require('../config/db'),
    Q          = require('q'),
    utilidades = require('../utils/utilidades'),
    seguridad  = require('../utils/seguridad');

exports.buscarDispositivo = function(req, res) {
    var user    = typeof req.params.val     !== 'undefined' || req.params.val     != null ? seguridad.decodeBase64(req.params.val)     : null,
        device  = typeof req.params.device  !== 'undefined' || req.params.device  != null ? seguridad.decodeBase64(req.params.device)  : null,
        company = typeof req.params.company !== 'undefined' || req.params.company != null ? seguridad.decodeBase64(req.params.company) : null,
        office  = typeof req.params.office  !== 'undefined' || req.params.office  != null ? seguridad.decodeBase64(req.params.office)  : null;
        
    
};

/**
 *  HttpGet
 *
 *  Checks if a device exists.
 *
 *  @param
 *      A request url parameter (a device identifier).
 *  
 *  @return
 *      A JSON string:
 *      {
 *          "msg" : true (or false)
 *      }
 *
 *  @error
 *      A JSON string:
 *      {
 *          "msg" : "Error description"
 *      }
 */
exports.existeDispositivo = function(req, res) {
    try {
        var device = seguridad.decodeBase64(req.params.val);
        var sql = '';
        
        if (connection) {
            sql =
                'SELECT * ' +
                'FROM ' +
                    'datatabs_main.tb_dispositivo AS D ' +
                'WHERE ' +
                    'D.identificacion = ?;';
                
            connection.db.query(
                sql,
                [device],
                function(err, result) {
                    if (err)
                        utilidades.printError(err, res);
                    else {
                        res.contentType('application/json');
                        res.write(JSON.stringify({ msg : result.length > 0 ? true : false }));
                        res.end();
                    }
                }
            );
        }
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};

/**
 *  HttpGet
 *
 *  Gets active device's events.
 *
 *  @param
 *      A request url parameter (an IMEI's device or id in Base64 related to the device that we want to get their events).
 *  
 *  @return
 *      A JSON string:
 *      [
 *          {
 *              "id_evento"   : "Base64EncodeString(1)",        A string in Base64 that represents the identifier related to an event.
 *              "evento"      : "XXXXX",                        A string that represents the event's name.
 *              "descripcion" : "XXXXX",                        A string that represents the event's description.
 *              "fechaInicio" : "YYYY-MM-DD HH:mm:ss",          A string that represents the event's start date.
 *              "fechaFin"    : "YYYY-MM-DD HH:mm:ss",          A string that represents the event's end date.
 *              "flujo"       : [{ XXXXX }],                    A JSON string that represents the event's flow.
 *              "imagen"      : "XXXXX",                        A string that represents the image file name related to an event.
 *              "id_empresa"  : "Base64EncodeString(1)",        A string in Base64 that represents the identifier related to an company.
 *              "empresa"     : "XXXXX"                         A string that represents the company's name.
 *          },
 *          ...
 *      ]
 *
 *  @error
 *      A JSON string:
 *      {
 *          "msg" : "Error description"
 *      }
 */
exports.buscarEventos = function(req, res) {

    try {
        var device = seguridad.decodeBase64(req.params.val);
            
        var callback = function(id) {
            var sql = '', id_empresa = 0;

            if (connection) {
                sql =
                    'SELECT ' +
                        'Evento.id_evento, ' +
                        'Evento.evento, ' +
                        'Evento.descripcion, ' +
                        'Evento.fechaInicio, ' +
                        'Evento.fechaFin, ' +
                        'Evento.flujo, ' +
                        'Imagen.imagen, ' +
                        'Empresa.id_empresa, ' +
                        'Empresa.nombre AS empresa ' +
                    'FROM ' +
                        'tb_evento AS Evento ' +
                        'LEFT JOIN ' +
                        'tb_evento_dispositivo AS EventoDisp ' +
                        'ON Evento.id_evento = EventoDisp.id_evento ' +
                        'LEFT JOIN ' +
                        'tb_empresa AS Empresa ' +
                        'ON Evento.id_empresa = Empresa.id_empresa ' +
                        'LEFT OUTER JOIN ' +
                        'tb_imagen AS Imagen ' +
                        'ON Evento.id_imagen = Imagen.id_imagen ' +
                    'WHERE ' +
                        'EventoDisp.id_dispositivo = ? AND ' +
                        'Evento.activo = 1;';
                
                connection.db.query(
                    sql,
                    [id],
                    function(err, result) {
                        'use stict';

                        if (err)
                            utilidades.printError(err, res);
                        else {                          
                            connection.db.query(
                                'select ' +
                                    's.id_empresa ' +
                                'from ' +
                                    'tb_dispositivo as d ' +
                                    'join tb_sucursal as s on d.id_sucursal = s.id_sucursal ' +
                                'where ' +
                                    'd.id_dispositivo = ?', [id],
                                    function(err, resultado){
                                        
                                        console.log(resultado)
                                        if(resultado.length == 0){
                                            res.json({id_empresa: seguridad.encodeBase64(resultado[0].id_empresa), eventos: []});
                                            res.end();
                                        }
                                        else{
                                            
                                            for (i = 0; i < result.length; i++) {
                                                result[i].id_evento  = seguridad.encodeBase64(result[i].id_evento);
                                                result[i].id_empresa = seguridad.encodeBase64(result[i].id_empresa);
                                                result[i].flujo = JSON.stringify(utilidades.agregarImagenFlujo(JSON.parse(result[i].flujo)));
                                            }
                                            
                                            res.json({id_empresa:seguridad.encodeBase64(resultado[0].id_empresa), eventos: result}); 
                                            res.end();
                                            
                                        }                                            
                                        
                                    }
                            )
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
  
    
/**
 *  HttpPost
 *
 *  Creates a device.
 *
 *  @param
 *      A JSON request body:
 *      {
 *          "param"            : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy|1)",  A string in Base64 that represents an user session or id related to the user that creates the request.
 *          "identificador"    : "XXXXX",                                                   A string that represents the identifier (e.g. IMEI) related to the device which we want to create.
 *          "nombre"           : "XXXXX",                                                   A string that represents the name related to the device which we want to create.
 *          "marca"            : "XXXXX",                                                   A string that represents the brand related to the device which we want to create.
 *          "modelo"           : "XXXXX",                                                   A string that represents the model related to the device which we want to create.
 *          "serial"           : "XXXXX",                                                   A string that represents the serial number related to the device which we want to create.
 *          "sistemaOperativo" : "XXXXX",                                                   A string that represents the operative system related to the device which we want to create. This field can be optional.
 *          "version"          : "XXXXX",                                                   A string that represents the operative system version related to the device which we want to create. This field can be optional.
 *          "tipoDispositivo"  : 0                                                          An integer identifier that represents the device type related to the device which we want to create.
 *      }
 *  
 *  @return
 *      A JSON string:
 *      {
 *          "msg" : "OK - Base64EncodeString(device id)"
 *      }
 *
 *  @error
 *      A JSON string:
 *      {
 *          "msg" : "Error description"
 *      }
 */
exports.crearDispositivo = function(req, res) {

    try {
        var user = typeof req.body.param !== 'undefined' || req.body.param != null ? seguridad.decodeBase64(req.body.param) : null;
        
        var callback = function(id) {

            var sql = '', mensaje = '', resultado = '';
        
            if (connection) {
                sql =
                    'SET @resultado = ""; ' +
                    'CALL datatabs_main.sp_crearDispositivo(?, ?, ?, ?, ?, ?, ?, ?, ?, @resultado); ' +
                    'SELECT @resultado;';
                
                connection.db.query(
                    sql,
                    [
                        id,
                        req.body.identificador,
                        req.body.nombre,
                        req.body.marca,
                        req.body.modelo,                                                                                                
                        req.body.serial,
                        typeof req.body.sistemaOperativo !== 'undefined' || req.body.sistemaOperativo != null ? req.body.sistemaOperativo : null,
                        typeof req.body.version          !== 'undefined' || req.body.version          != null ? req.body.version          : null,
                        req.body.tipoDispositivo
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
 *  Updates a device.
 *
 *  @param
 *      A request url parameter (an IMEI's device or id in Base64 related to the device that we want to update).
 *  @param
 *      A JSON request body (Fields to update should be set with a value):
 *      {
 *          "param"            : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy|1)",  A string in Base64 that represents an user session or id related to the user that creates the request.
 *          "identificador"    : "XXXXX",                                                   A string that represents the identifier (e.g. IMEI) related to the device which we want to create.
 *          "nombre"           : "XXXXX",                                                   A string that represents the name related to the device which we want to create.
 *          "marca"            : "XXXXX",                                                   A string that represents the brand related to the device which we want to create.
 *          "modelo"           : "XXXXX",                                                   A string that represents the model related to the device which we want to create.
 *          "serial"           : "XXXXX",                                                   A string that represents the serial number related to the device which we want to create.
 *          "sistemaOperativo" : "XXXXX",                                                   A string that represents the operative system related to the device which we want to create.
 *          "version"          : "XXXXX",                                                   A string that represents the operative system version related to the device which we want to create.
 *          "activo"           : 0                                                          An integer that represents the status (1 for active and 0 for inactive) related to the device which we want to create.
 *      }
 *  
 *  @return
 *      A JSON string:
 *      {
 *          "msg" : "OK - Base64EncodeString(device id)"
 *      }
 *
 *  @error
 *      A JSON string:
 *      {
 *          "msg" : "Error description"
 *      }
 */
exports.modificarDispositivo = function(req, res) {

    try {
        var device = seguridad.decodeBase64(req.params.val);
        
        var callback = function(data) {
            var sql = '', mensaje = '', resultado = '';
            
            if (connection) {
                sql =
                    'SET @resultado = ""; ' +
                    'CALL datatabs_main.sp_modificarDispositivo(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, @resultado); ' +
                    'SELECT @resultado;';
                
                connection.db.query(
                    sql,
                    [
                        data[1],
                        data[0],
                        typeof req.body.identificador    !== 'undefined' || req.body.identificador    != null ? req.body.identificador    : null,
                        typeof req.body.nombre           !== 'undefined' || req.body.nombre           != null ? req.body.nombre           : null,
                        typeof req.body.marca            !== 'undefined' || req.body.marca            != null ? req.body.marca            : null,
                        typeof req.body.modelo           !== 'undefined' || req.body.modelo           != null ? req.body.modelo           : null,
                        typeof req.body.serial           !== 'undefined' || req.body.serial           != null ? req.body.serial           : null,
                        typeof req.body.sistemaOperativo !== 'undefined' || req.body.sistemaOperativo != null ? req.body.sistemaOperativo : null,
                        typeof req.body.version          !== 'undefined' || req.body.version          != null ? req.body.version          : null,
                        typeof req.body.activo           !== 'undefined' || req.body.activo           != null ? req.body.activo           : null
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
            if ((/^\d+$/g).test(seguridad.decodeBase64(req.body.param))) {
                if ((/^\d+$/g).test(device))
                    callback([device, seguridad.decodeBase64(req.body.param)]);
                else
                    Q.all([utilidades.buscarIdDispositivo, seguridad.decodeBase64(req.body.param)]).then(
                        callback,
                        function(err) {
                            utilidades.printError(err, res);
                        }
                    );
            }
            else {
                if ((/^\d+$/g).test(device))
                    Q.all([device, utilidades.buscarIdUsuario(seguridad.decodeBase64(req.body.param))]).then(
                        callback,
                        function(err) {
                            utilidades.printError(err, res);
                        }
                    );
                else
                    Q.all([utilidades.buscarIdDispositivo(device), utilidades.buscarIdUsuario(seguridad.decodeBase64(req.body.param))]).then(
                        callback,
                        function(err) {
                            utilidades.printError(err, res);
                        }
                    );
            }
        }
        else {
            if ((/^\d+$/g).test(device))
                callback([device, null]);
            else
                Q.all([utilidades.buscarIdDispositivo(device), null]).then(
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
 *  Creates a relation between a device and a branch office.
 *
 *  @param
 *      A request url parameter (an IMEI's device or id in Base64 related to the device that we want to associate to branch office).
 *  @param
 *      A JSON request body (fields to update should be set with a value):
 *      {
 *          "param"    : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy|1)",  A string in Base64 that represents an user session or id related to the user that creates the request.
 *          "sucursal" : "XXXXX"                                                    An integer identifier that represents the branch office that we will associate to the device.
 *      }
 *  
 *  @return
 *      A JSON string:
 *      {
 *          "msg" : "OK - Base64EncodeString(relation id)"
 *      }
 *
 *  @error
 *      A JSON string:
 *      {
 *          "msg" : "Error description"
 *      }
 */
exports.asociarDispositivoSucursal = function(req, res) {

    try {
        var device = seguridad.decodeBase64(req.params.val);
        
        var callback = function(data) {
            var sql = '', mensaje = '', resultado = '';
            
            if (connection) {
                sql =
                    'SET @resultado = ""; ' +
                    'CALL datatabs_main.sp_asociarDispositivoSucursal(?, ?, ?, @resultado); ' +
                    'SELECT @resultado;';
                
                connection.db.query(
                    sql,
                    [
                        data[1],
                        data[0],
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
            if ((/^\d+$/g).test(seguridad.decodeBase64(req.body.param))) {
                if ((/^\d+$/g).test(device))
                    callback([device, seguridad.decodeBase64(req.body.param)]);
                else
                    Q.all([utilidades.buscarIdDispositivo(device), seguridad.decodeBase64(req.body.param)]).then(
                        callback,
                        function(err) {
                            utilidades.printError(err, res);
                        }
                    );
            }
            else {
                if ((/^\d+$/g).test(device))
                    Q.all([device, utilidades.buscarIdUsuario(seguridad.decodeBase64(req.body.param))]).then(
                        callback,
                        function(err) {
                            utilidades.printError(err, res);
                        }
                    );
                else
                    Q.all([utilidades.buscarIdDispositivo(device), utilidades.buscarIdUsuario(seguridad.decodeBase64(req.body.param))]).then(
                        callback,
                        function(err) {
                            utilidades.printError(err, res);
                        }
                    );
            }
        }
        else {
            if ((/^\d+$/g).test(device))
                callback([device, null]);
            else
                Q.all([utilidades.buscarIdDispositivo(device), null]).then(
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
 *  Creates a relation between a device and an event.
 *
 *  @param
 *      A request url parameter (an IMEI's device or id in Base64 related to the device that we want to update).
 *  @param
 *      A JSON request body (fields to update should be set with a value):
 *      {
 *          "param"       : "Base64EncodeString(xxxxy0z1-0000-zzz0-xyxy-10yy0xxy|1)",  A string in Base64 that represents an user session or id related to the user that creates the request.
 *          "evento"      : "XXXXX"                                                    An integer identifier that represents the event that we will associate to the device.
 *      }
 *  
 *  @return
 *      A JSON string:
 *      {
 *          "msg" : "OK - Base64EncodeString(relation id)"
 *      }
 *
 *  @error
 *      A JSON string:
 *      {
 *          "msg" : "Error description"
 *      }
 */
exports.asociarEventoDispositivo = function(req, res) {

    try {
        var device = seguridad.decodeBase64(req.params.val);
       
        var callback = function(data) {
            var sql = '', mensaje = '', resultado = '';

            if (connection) {
                sql =
                    'SET @resultado = ""; ' +
                    'CALL datatabs_main.sp_asociarEventoDispositivo(?, ?, ?, @resultado); ' +
                    'SELECT @resultado;';
                
                connection.db.query(
                    sql,
                    [
                        data[1],
                        req.body.evento,
                        data[0]
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
            
            if ((/^\d+$/g).test(seguridad.decodeBase64(req.body.param))) {
                if ((/^\d+$/g).test(device))
                    callback([device, seguridad.decodeBase64(req.body.param)]);
                else
                    Q.all([utilidades.buscarIdDispositivo(device), seguridad.decodeBase64(req.body.param)]).then(
                        callback,
                        function(err) {
                            utilidades.printError(err, res);
                        }
                    );
            }
            else {
                if ((/^\d+$/g).test(device))
                    Q.all([device, utilidades.buscarIdUsuario(seguridad.decodeBase64(req.body.param))]).then(
                        callback,
                        function(err) {
                            utilidades.printError(err, res);
                        }
                    );
                else
                    Q.all([utilidades.buscarIdDispositivo(device), utilidades.buscarIdUsuario(seguridad.decodeBase64(req.body.param))]).then(
                        callback,
                        function(err) {
                            utilidades.printError(err, res);
                        }
                    );
            }
        }
        else {

            if ((/^\d+$/g).test(device))
                callback([device, null]);
            else{
                                
                Q.all([utilidades.buscarIdDispositivo(device), null]).then(
                    callback,
                    function(err) {
                        utilidades.printError(err, res);
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
 *  HttpPut
 *
 *  Checks if a device stills on-line and updates its revision date.
 *
 *  @param
 *      A request url parameter (an IMEI's device or id in Base64 related to the device that we want to update).
 *  
 *  @return
 *      A JSON string:
 *      {
 *          "msg" : "OK - Base64EncodeString(device id)"
 *      }
 *
 *  @error
 *      A JSON string:
 *      {
 *          "msg" : "Error description"
 *      }
 */
exports.validarDispositivo = function(req, res) {
    try {
        var device = seguridad.decodeBase64(req.params.val);
        
        var callback = function(id) {
            var sql = '', mensaje = '', resultado = '';
        
            if (connection) {
                sql =
                    'SET @resultado = ""; ' +
                    'CALL datatabs_main.sp_validarDispositivo(?, @resultado); ' +
                    'SELECT @resultado;';
                
                connection.db.query(
                    sql,
                    [id],
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

exports.buscarDispositivosPorEventos = function(req, res) {

    try{

        var id_evento = seguridad.decodeBase64(req.params.val),
            sql = '';

        sql = 
            'select ' +
                'd.id_dispositivo as id_dispositivo, ' +
                'd.identificacion as identificacion, ' +
                'e.flujo as flujo ' +
            'from ' +
                'datatabs_main.tb_evento e ' +
                'join datatabs_main.tb_evento_dispositivo ed on e.id_evento = ed.id_evento ' +
                'join datatabs_main.tb_dispositivo d on ed.id_dispositivo = d.id_dispositivo ' +
            'where ' +
                'e.flujo is not null and ' +
                'e.id_evento = ?;';

        if(connection){

            connection.db.query(
                sql,
                [id_evento],
                function(err, result) {
                    if (err)
                        utilidades.printError(err, res);
                    else {
                        res.json(result);
                        res.end();
                    }
                }
            );

        }

    }catch(err){
        utilidades.printError(err, res);
    } 
};