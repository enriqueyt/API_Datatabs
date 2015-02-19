var connection = require('../config/db');

exports.buscarIdPerfilUsuario = function(sesion, callback, campo) {
    var sql = '';
	var resultado = {
		usuario  : -1,
		perfil   : -1,
		usuariod : -1
	};
	
	campo = typeof campo === undefined ? null : campo;
	
    if (connection) {
		sql =
			'SELECT ' +
				'IFNULL(S.id_usuario   , -1) AS usuario, ' +
				'IFNULL(UP.id_perfil   , -1) AS perfil, ' +
				'IFNULL(UUD.id_usuariod, -1) AS usuariod ' +
			'FROM ' +
				'promociones.tb_sesion AS S ' +
				'INNER JOIN ' +
				'promociones.tb_usuario_perfil UP ' +
				'ON S.id_usuario = UP.id_usuario ' +
				'LEFT OUTER JOIN ' +
				'promociones.tb_usuario_usuarioD UUD ' +
				'ON S.id_usuario = UUD.id_usuario ' +
			'WHERE ' +
				'S.sesion = ? AND S.activo = 1;';
		
        connection.db.query(
            sql,
            [sesion],
            function(err, result) {
                if (err) throw err;
				if (result.length > 0) resultado = result[0];
				
				if (campo == null)
					callback(resultado);
				else if (campo == 'usuario')
					callback(resultado.usuario);
				else if (campo == 'perfil')
					callback(resultado.perfil);
				else if (campo == 'usuariod')
					callback(resultado.usuariod);
            }
        );
    }
};

exports.buscarIdUsuario = function(sesion, callback) {
	this.buscarIdPerfilUsuario(sesion, callback, 'usuario');
};

exports.buscarIdPerfil = function(sesion, callback) {
	this.buscarIdPerfilUsuario(sesion, callback, 'perfil');
};

exports.buscarIdUsuarioD = function(sesion, callback) {
	this.buscarIdPerfilUsuario(sesion, callback, 'usuariod');
};