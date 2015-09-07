var connection = require('../config/db'),
    Q          = require('q'),
    utilidades = require('../utils/utilidades'),
	seguridad  = require('../utils/seguridad');
    
exports.buscarNodo = function(req, res) {

    try {
    
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};
    
exports.crearNodo = function(req, res) {
	try {
    
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};

exports.modificarNodo = function(req, res) {
    try {
    
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};

exports.crearRespuesta = function(req, res){
  try {

        var parametros, aux;
        
        var callback = function(id, obj) {
            var sql = '', mensaje = '', resultado = '';
            
            if (connection) {
                sql =
                    'SET @resultado = ""; ' +
                    'CALL datatabs_main.sp_crearRespuesta(?, ?, ?, ?, ?, ?, @resultado); ' +
                    'SELECT @resultado;';
                
                connection.db.query(
                    sql,
                    (obj != undefined
                        ?
                         obj
                        :
                        [
                            id,
                            typeof req.body.pregunta    !== 'undefined' || req.body.pregunta    != null ? req.body.pregunta     : null,
                            typeof req.body.consumidor  !== 'undefined' || req.body.consumidor  != null ? req.body.consumidor   : null,
                            typeof req.body.modo        !== 'undefined' || req.body.modo        != null ? req.body.modo         : null,
                            typeof req.body.respuesta   !== 'undefined' || req.body.respuesta   != null ? req.body.respuesta    : null,
                            typeof req.body.puntuacion  !== 'undefined' || req.body.puntuacion  != null ? req.body.puntuacion   : null
                        ]
                    ),
                    function(err, result) {
                        
                        if (err)
                            utilidades.printError(err, res);
                        else {
                            mensaje   = result[3][0]['@resultado'];
                            resultado = result[1][0]['res'];
                            res.json(({ msg : (/ERROR/g).test(mensaje) ? mensaje : "OK - " + seguridad.encodeBase64(resultado) }));

                        }
                    }
                );
            }
        };

        if (typeof req.body.param !== 'undefined' || req.body.param != null) {

            if ((/^\d+$/g).test(seguridad.decodeBase64(req.body.param)))
                callback(seguridad.decodeBase64(req.body.param));
            else
                Q.all(utilidades.buscarIdUsuario(seguridad.decodeBase64(req.body.param))).then(
                    callback,
                    function(err) {
                        utilidades.printError(err, res);
                    }
                );
        }
        else{
            if(typeof req.body.respuesta == 'object'){
                aux = req.body.respuesta;
                for(var i in aux){
                        
                    parametros = [
                        0,
                        typeof req.body.pregunta    !== 'undefined' || req.body.pregunta    != null ? req.body.pregunta     : null,
                        typeof req.body.consumidor  !== 'undefined' || req.body.consumidor  != null ? req.body.consumidor   : null,
                        typeof req.body.modo        !== 'undefined' || req.body.modo        != null ? req.body.modo         : null,
                        aux[i],
                        typeof req.body.puntuacion  !== 'undefined' || req.body.puntuacion  != null ? req.body.puntuacion   : null                        
                    ]

                    callback(0, parametros); 
                }
            }
            else{
                callback(0);    
            }
        }
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};

//exports.eliminarNodo = function(req, res) {

//};