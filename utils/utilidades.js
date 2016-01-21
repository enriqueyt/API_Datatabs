var connection = require('../config/db'),
    Q          = require('q'),
   request = require('sync-request');

exports.printError = function(err, res) {
    res.contentType('application/json');
    res.write(JSON.stringify({ msg : err }));
    res.end();
};
    
exports.buscarIdPerfilUsuario = function(sesion) {
    var deferred = Q.defer();
    var sql = '';
	var resultado = {
		usuario  : -1,
		perfil   : -1,
		usuariod : -1
	};
		
    if (connection) {
		sql =
			'SELECT ' +
				'IFNULL(S.id_usuario   , -1) AS usuario, ' +
				'IFNULL(UP.id_perfil   , -1) AS perfil, ' +
				'IFNULL(UUD.id_usuariod, -1) AS usuariod ' +
			'FROM ' +
				'datatabs_main.tb_sesion AS S ' +
				'INNER JOIN ' +
				'datatabs_main.tb_usuario_perfil UP ' +
				'ON S.id_usuario = UP.id_usuario ' +
				'LEFT OUTER JOIN ' +
				'datatabs_main.tb_usuario_usuariod UUD ' +
				'ON S.id_usuario = UUD.id_usuario ' +
			'WHERE ' +
				'S.sesion = ? AND S.activo = 1;';
		
        connection.db.query(
            sql,
            [sesion],
            function(err, result) {
                if (err)
                    deferred.reject(err);
                else {
                    if (result.length > 0)
                        resultado = result[0];
                    deferred.resolve(resultado);
                }
            }
        );
        
        return deferred.promise;
    }
};
    
exports.buscarIdUsuario = function(sesion) {
    var deferred = Q.defer();

    this.buscarIdPerfilUsuario(sesion).then(
        function(data) {
            deferred.resolve(data.usuario);
        },
        function(err) {
            deferred.reject(err);
        }
    );
    
    return deferred.promise;
};

exports.buscarIdPerfil = function(sesion, callback) {
	var deferred = Q.defer();

    this.buscarIdPerfilUsuario(sesion).then(
        function(data) {
            deferred.resolve(data.perfil);
        },
        function(err) {
            deferred.reject(err);
        }
    );
    
    return deferred.promise;
};

exports.buscarIdUsuarioD = function(sesion, callback) {
	var deferred = Q.defer();

    this.buscarIdPerfilUsuario(sesion).then(
        function(data) {
            deferred.resolve(data.usuariod);
        },
        function(err) {
            deferred.reject(err);
        }
    );
    
    return deferred.promise;
};

exports.buscarIdDispositivo = function(identificador) {
    var deferred = Q.defer();
    var sql = '';
		
    if (connection) {
		sql =
			'SELECT ' +
				'IFNULL(D.id_dispositivo, -1) AS dispostivo ' +
			'FROM ' +
				'datatabs_main.tb_dispositivo AS D ' +
			'WHERE ' +
				'D.identificacion = ?;';

        connection.db.query(
            sql,
            [identificador],
            function(err, result) {

                if (err)
                    deferred.reject(err);
                else {
                    if (result.length == 0)
                        deferred.reject('ERROR - Dispositivo no existe');
                    else
                        deferred.resolve(result[0].dispostivo);
                }
            }
        );
    }
    
    return deferred.promise;
};

exports.buscarIdClientePorCelular = function(celular){
    'use strict';

    var deferred = Q.defer();
    var sql = '';

    if(connection){

        sql = 
            'SELECT '+
                'IFNULL(consumidor.id_consumidor, -1) AS consumidor '+
            'FROM '+
                'datatabs_main.tb_consumidor as consumidor '+
            'WHERE '+
                'consumidor.celular = ?;';

        connection.db.query(
            sql,
            [celular],
            function(err, result){
                if(err){
                    deferred.reject(err);
                }
                else{

                    if(result.length == 0)
                        deferred.reject('ERROR - Consumidor no existe');
                    else
                        deferred.resolve(result[0].consumidor);

                }
            }
        );
    }

    return deferred.promise;
};

exports.buscarEmpresaXdispositivo = function(id){
    'use strict';

    var deferred = Q.defer();
    var sql = '';

    if(connection){

        sql = 
            'select '+
                ' e.id_empresa as id_empresa '+
            ' from '+
                ' datatabs_main.tb_dispositivo d '+
            ' join '+
                ' datatabs_main.tb_sucursal s on d.id_sucursal = s.id_sucursal '+
            ' join '+
                ' datatabs_main.tb_empresa e on s.id_empresa = e.id_empresa '+
            ' where '+
                ' d.id_dispositivo = ?;';

        connection.db.query(
            sql,
            [id],
            function(err, result){
                console.log(result)
                if(err){
                    deferred.reject(err);
                }
                else{
                    if(result.length == 0)
                        deferred.reject('ERROR - Consumidor no empresa asociada al dispositivo');
                    else
                        deferred.resolve(result[0].id_empresa);
                }
            }
        );
    }

    return deferred.promise;
};

exports.agregarImagenFlujo = function(flujos){
    'use strict';
    var f;

    try{

        var recorrerFlujo = function(_flujo){
            'use strict';

            var data = '',flujo;            
            if(_flujo.children.length > 0){

                flujo = _flujo.children;

                for (var i = 0; i < flujo.length; i++) {

                    if(flujo[i].backgroundUrl.length > 0){
                        var res = request('GET', flujo[i].backgroundUrl);
                        console.log(JSON.stringify(res))
                        flujo[i].backgroundImg = ("data:" + res.headers["content-type"] + ";base64," + new Buffer(res.getBody()).toString('base64'));
                    }

                    if(flujo[i].children.length > 0){
                        flujo = recorrerFlujo(flujo[i]);
                    }
                  
                };

                return flujo;
            }
        };
            
        if( flujos.children.length > 0 ){
            f = flujos;
            recorrerFlujo(f);
        }

    }catch(err){
        console.log('error: ' + err)
    }

    return f;
};

