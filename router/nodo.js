var connection = require('../config/db'),
    Q          = require('q'),
    utilidades = require('../utils/utilidades'),
	seguridad  = require('../utils/seguridad')
    nodo       = require('../router/nodo');
  
/**
* 
*
*
*/
exports.buscarNodo = function(req, res) {

    try {
    
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};
    
/**
*
*
*
*/
exports.crearNodo = function(req, res) {
	try {
        
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};

/**
*
*
*
*/
exports.modificarNodo = function(req, res) {
    try {
    
    }
    catch (err) {
        utilidades.printError(err, res);
    }
};

/**
*
*
*
*/
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

                            if(!(/ERROR/g).test(mensaje)) vn(req, res);
                                

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

/**
*
*
*
*/
exports.validarFormulario = function(req, res){

    var sql = '', resultado = '';

    try{

        var id = seguridad.decodeBase64(req.params.id);
                
        if (connection) {
            sql =
                'select '+ 
                    'ifnull(c.nombres,0) as nombre '+
                'from '+
                    'datatabs_main.tb_consumidor as c '+
                'where '+ (req.params.modo == 0 ? 'c.celular = ?;' : 'c.id_consumidor = ?;');
            
            connection.db.query(
                sql,
                [id],
                function(err, result) {
                    
                    if (err)
                        utilidades.printError(err, res);
                    else {

                        if(result.length == 0 || result[0].nombre == 0)
                            result = true;
                        else
                            result = false;   

                        res.contentType('application/json');
                        res.json(result)
                        res.end();
                    }
                }
            );
        }

    }
    catch(err){
        utilidades.printError(err, res);
    }
};

/**
*
*
*
*/
exports.visitaNodo = function(req, res) {
    vn(req, res);
};

/**
*   
*
*
*/
var vn = function(req, res){

    var sql = '', resultado = '', params = [];

    try{
        console.log('guardando la visita idNodo: ' + seguridad.decodeBase64(req.body.id_nodo) + ' id_nodo: ' + seguridad.decodeBase64(req.body.id_nodo));
        params = [
            seguridad.decodeBase64(req.body.idConsumidor),
            seguridad.decodeBase64(req.body.idNodo),
            seguridad.decodeBase64(req.body.idVisitaEvento)
        ];
          
        if(connection){

            sql =
                'SET @resultado = ""; ' +
                'CALL datatabs_main.sp_guardarVisitaNodo(?, ?, ?, @resultado); ' +
                'SELECT @resultado;';

            connection.db.query(sql, params, function(err, result){
                if (err)
                    utilidades.printError(err, res);
                else {
                    mensaje   = result[3][0]['@resultado'];
                    resultado = result[1][0]['res'];

                    res.json({msg:mensaje, resultado: resultado});
                    res.end();
                }
            });
        }

    }
    catch(err){
        utilidades.printError(err, res);
    }
}

