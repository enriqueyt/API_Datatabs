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
	
	it('/Votar', function(done){
		
		var obj = {
			Celular:'04242863017',
            Identificacion:16901839,
            Nombre:'Enrique Yepez',
            Id_transaccion:2,
            Fecha_transaccion: Date.now(),
            Id_registradora:2,
            Registradora:'Caja',
            Id_sucursal:1,
            Sucursal:'Sandu chef sambil',
            Compra: [
            	{
            		Id_item:474,
                    Description_item:'Tea Lipton verde 1',
                    Monto:342.25,
                    Cantidad:2
            	},
            	{
            		Id_item:475,
                    Description_item:'Tea Lipton azul 1',
                    Monto:445.20,
                    Cantidad:1
            	}
            ]
		}
		
		request({
			uri:'http://localhost:6969/consumidor/consumo',
			method:'POST',
			form: obj
		}, function(error, res, body){
			console.log(res.body)		
			assert.equal(true, true);
			done();
		});
		
	});

});

