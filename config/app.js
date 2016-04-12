var express    = require('express'),
    http       = require('http'),
    path       = require('path'),
    bodyParser = require('body-parser');
    
var env               = 'dev', 
    app_config        = require('./app_config')[env],
    sesion            = require('../router/sesion'),
    usuario           = require('../router/usuario'),
	usuariod          = require('../router/usuariod'),
    dispositivo       = require('../router/dispositivo'),
    evento            = require('../router/evento'),
    superdistribuidor = require('../router/superdistribuidor'),
    distribuidor      = require('../router/distribuidor'),
    empresa           = require('../router/empresa'),
    sucursal          = require('../router/sucursal'),
    consumidor        = require('../router/consumidor'),
    nodo              = require('../router/nodo');
    
var app = express();

app.set('port', process.env.PORT || app_config.port);

// view engine setup
var rutas = require('../router/main')(app);

app.set('views', path.join(__dirname, '../views'));
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);

app.use(function(req, res, next) {
	res.header('Access-Control-Allow-Origin', '*');
	res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    res.header('Access-Control-Allow-Methods', 'GET, POST, PUT');
    res.header('Cache-Control', 'no-cache, private, no-store, must-revalidate, max-stale=0, post-check=0, pre-check=0');
	next();
});

//app.use(favicon(__dirname + '/public/favicon.ico'));
app.use(bodyParser.json({limit: '50mb'}));
app.use(bodyParser.urlencoded({ extended: true, limit: '50mb' }));
app.use(bodyParser({limit: '50mb'}));
app.use(express.static(path.join(__dirname, 'public')));

/*************************************************************************************************/
/******************************************** SESION *********************************************/
/*************************************************************************************************/

/* [HttpGet] */
/* [HttpPost] */
app.post('/sesion/autenticar'   , sesion.autenticar   );
app.post('/sesion/reautenticar' , sesion.reautenticar );
app.post('/sesion/desautenticar', sesion.desautenticar);
/* [HttpPut] */
/* [HttpDelete] */

/*************************************************************************************************/
/******************************************* USUARIO *********************************************/
/*************************************************************************************************/
/* HttpGet */
app.get   ('/usuario/admin'          , usuario.crearAdmin         );
app.get   ('/usuario/usuario/:val'   , usuario.existeUsuario      );
app.get   ('/usuario/correo/:val'    , usuario.existeCorreo       );
/* [HttpPost] */                                               
app.post  ('/usuario'                , usuario.crearUsuario       );
/* [HttpPut] */
app.put   ('/usuario/:val'           , usuario.modificarUsuario   );
app.put   ('/usuario/contrasena/:val', usuario.modificarContrasena);
/* [HttpDelete] */
//app.delete('/usuario/:id'            , usuario.eliminarUsuario    );


/*************************************************************************************************/
/******************************************* USUARIOD ********************************************/
/*************************************************************************************************/
/* HttpGet */
app.get   ('/usuariod/:val?'    , usuariod.buscarUsuarioD    );
app.get   ('/usuariod/info/:val', usuariod.buscarInfoUsuarioD);
/* [HttpPost] */
app.post  ('/usuariod'          , usuariod.crearUsuarioD     );
/* [HttpPut] */
app.put   ('/usuariod/:val'     , usuariod.modificarUsuarioD );
/* [HttpDelete] */
//app.delete('/usuariod/:id'      , usuariod.eliminarUsuarioD  );


/*************************************************************************************************/
/***************************************** DISPOSITIVO *******************************************/
/*************************************************************************************************/
/* HttpGet */
app.get   ('/dispositivo/:val?'           , dispositivo.buscarDispositivo         );
app.get   ('/dispositivo/dispositivo/:val', dispositivo.existeDispositivo         );
app.get   ('/dispositivo/evento/:val?'    , dispositivo.buscarEventos             );
app.get   ('/dispositivo/dispositivo/evento/:val', dispositivo.buscarDispositivosPorEventos);
/* [HttpPost] */                                                                
app.post  ('/dispositivo'                 , dispositivo.crearDispositivo           );
/* [HttpPut] */                           
app.put   ('/dispositivo/:val'            , dispositivo.modificarDispositivo      );
app.put   ('/dispositivo/sucursal/:val'   , dispositivo.asociarDispositivoSucursal);
app.put   ('/dispositivo/evento/:val'     , dispositivo.asociarEventoDispositivo  );
app.put   ('/dispositivo/validar/:val'    , dispositivo.validarDispositivo        );
/* [HttpDelete] */                        
//app.delete('/dispositivo/:id'             , dispositivo.eliminarDispositivo       );


/*************************************************************************************************/
/******************************************** EVENTO *********************************************/
/*************************************************************************************************/
/* HttpGet */
app.get   ('/evento/:company/:office/:offset/:val?'        , evento.buscarEvento         );
app.get   ('/evento/:company/:office/next/:offset/:val'    , evento.buscarEvento         );
app.get   ('/evento/:company/:office/previous/:offset/:val', evento.buscarEvento         );
/* [HttpPost] */                                                 
app.post  ('/evento'                                       , evento.crearEvento          );
/* [HttpPut] */                                                                                
app.put   ('/evento/:val'                                  , evento.modificarEvento      );
app.put   ('/evento/sucursal/:val'                         , evento.asociarEventoSucursal);
/* [HttpDelete] */                                         
//app.delete('/evento/:id'                                   , evento.eliminarEvento       );

/*************************************************************************************************/
/************************************** SUPERDISTRIBUIDOR ****************************************/
/*************************************************************************************************/
/* HttpGet */
app.get   ('/superdistribuidor/:val?', superdistribuidor.buscarSuperDistribuidor   );
/* [HttpPost] */
app.post  ('/superdistribuidor'      , superdistribuidor.crearSuperDistribuidor    );
/* [HttpPut] */
app.put   ('/superdistribuidor/:val' , superdistribuidor.modificarSuperDistribuidor);
/* [HttpDelete] */
//app.delete('/superdistribuidor/:id'  , superdistribuidor.eliminarSuperDistribuidor );


/*************************************************************************************************/
/***************************************** DISTRIBUIDOR ******************************************/
/*************************************************************************************************/
/* HttpGet */
app.get   ('/distribuidor/:val?', distribuidor.buscarDistribuidor   );
/* [HttpPost] */
app.post  ('/distribuidor'      , distribuidor.crearDistribuidor    );
/* [HttpPut] */
app.put   ('/distribuidor/:val' , distribuidor.modificarDistribuidor);
/* [HttpDelete] */
//app.delete('/distribuidor/:id'  , distribuidor.eliminarDistribuidor );


/*************************************************************************************************/
/******************************************** EMPRESA ********************************************/
/*************************************************************************************************/
/* HttpGet */
app.get   ('/empresa/:distributor/:offset/:val?'        , empresa.buscarEmpresa );
app.get   ('/empresa/:distributor/next/:offset/:val'    , empresa.buscarEmpresa );
app.get   ('/empresa/:distributor/previous/:offset/:val', empresa.buscarEmpresa );
/* [HttpPost] */
app.post  ('/empresa'                                   , empresa.crearEmpresa    );
/* [HttpPut] */
app.put   ('/empresa/:val'                              , empresa.modificarEmpresa);
/* [HttpDelete] */
//app.delete('/empresa/:id'                               , empresa.eliminarEmpresa );


/*************************************************************************************************/
/******************************************** SUCURSAL *******************************************/
/*************************************************************************************************/
/* HttpGet */
app.get   ('/sucursal/:company/:offset/:val?'        , sucursal.buscarSucursal );
app.get   ('/sucursal/:company/next/:offset/:val'    , sucursal.buscarSucursal );
app.get   ('/sucursal/:company/previous/:offset/:val', sucursal.buscarSucursal );
/* [HttpPost] */
app.post  ('/sucursal'                               , sucursal.crearSucursal    );
/* [HttpPut] */                                      
app.put   ('/sucursal/:val'                          , sucursal.modificarSucursal);
/* [HttpDelete] */
//app.delete('/sucursal/:id'                           , sucursal.eliminarSucursal );


/*************************************************************************************************/
/******************************************* CONSUMIDOR ******************************************/
/*************************************************************************************************/
/* HttpGet */
app.get   ('/consumidor/:val?'       , consumidor.buscarConsumidor   );
/* [HttpPost] */                     
app.post  ('/consumidor'             , consumidor.crearConsumidor    );
app.post  ('/consumidor/consumo'     , consumidor.crearConsumo       );
app.put  ('/consumidor/consumo'     , consumidor.modificarConsumo    );
/* [HttpPut] */                      
app.put   ('/consumidor/:val'        , consumidor.modificarConsumidor);
app.put   ('/consumidor/validar/:val', consumidor.validarConsumidor  );
app.get   ('/consumidor/validar'     , consumidor.validarConsumidor  );
/* [HttpDelete] */
//app.delete('/consumidor/:id'  , consumidor.eliminarConsumidor );

/*************************************************************************************************/
/******************************************* NODO ************************************************/
/*************************************************************************************************/
/* [HttpPost] */ 
app.post('/nodo/respuesta/:val?', nodo.crearRespuesta);

app.post('/nodo/visita', nodo.visitaNodo);

app.get('/nodo/validarformulario/:modo/:id', nodo.validarFormulario);

exports.app    = app;
exports.http   = http;