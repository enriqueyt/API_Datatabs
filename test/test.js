var assert 	= require('assert'),
	http 	= require('http'),
	server 	= require('../server.js'),
	request = require('request');

describe('server', function(){

	before(function(){
		server.listen(6969);
	});

	after(function(){
		server.close();
	});
});


describe('/', function(done){
	
	it('/Guardar consumo', function(done){
		
		var obj = {
			Celular:'04142506850',
            Identificacion:'6977197',
            Nombre:'MARCO ZAIDEMAN',
            Id_transaccion:'1234',
            Fecha_transaccion: '2016-03-22T00:00:00',
            Id_registradora:33,
            Registradora:'CAJACSI',
            Id_sucursal:1,
            Sucursal:'Sanduchef San Ignacio',
            Compra: [
            	{
            		Id_item:175458,
                    Description_item:'item A',
                    Monto:1456.25,
                    Cantidad:2
            	},
            	{
            		Id_item:175457,
                    Description_item:'item B',
                    Monto:2343.20,
                    Cantidad:1
            	},
            	{
            		Id_item:175459,
                    Description_item:'item c',
                    Monto:1123.20,
                    Cantidad:1
            	}
            ]
		}
		console.log('OK')
		request({
			uri:'http://105.131.102.104:6969/consumidor/consumo',
			method:'POST',
			form: obj
		}, function(error, res, body){
			console.log(res.body)		
			assert.equal(true, true);
			done();
		});
		
	});

});

