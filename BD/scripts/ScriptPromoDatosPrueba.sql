USE `datatabs_main`;

SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE tb_superdistribuidor;
TRUNCATE tb_distribuidor;
TRUNCATE tb_empresa;
TRUNCATE tb_sucursal;
TRUNCATE tb_usuario;
TRUNCATE tb_usuarioactivo;
TRUNCATE tb_usuario_perfil;
TRUNCATE tb_usuariod;
TRUNCATE tb_usuariod_superdistribuidor;
TRUNCATE tb_usuariod_distribuidor;
TRUNCATE tb_usuariod_empresa;
TRUNCATE tb_usuariod_sucursal;
TRUNCATE tb_evento;
TRUNCATE tb_consumidor;
SET FOREIGN_KEY_CHECKS = 1;

/* SUPERDISTRIBUIDORES */
INSERT INTO `tb_superDistribuidor` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`) VALUES ("6421","In LLP","2513","58-212-894-5697","58-212-381-2426","sed@tortorat.edu","P.O. Box 433, 5748 Rhoncus. Road","1");
INSERT INTO `tb_superDistribuidor` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`) VALUES ("8628","Lacinia Sed Congue Corporation","8263","58-212-778-4291","58-212-371-5150","adipiscing@bibendum.edu","516-7349 Luctus St.","1");
INSERT INTO `tb_superDistribuidor` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`) VALUES ("7391","Vulputate Posuere Vulputate PC","7367","58-212-192-7498","58-212-910-3987","vitae.diam@Aliquamnec.co.uk","799-3659 Vivamus Rd.","1");

/* DISTRIBUIDORES */
INSERT INTO `tb_distribuidor` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`,`id_superDistribuidor`) VALUES ("8114","Sed Sem Industries","6104","58-212-395-4933","58-212-174-9960","consequat@egestas.ca","P.O. Box 785, 8891 Pede Ave","1","1");
INSERT INTO `tb_distribuidor` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`,`id_superDistribuidor`) VALUES ("3725","Vel PC","6749","58-212-351-7769","58-212-678-0975","massa@tincidunt.edu","7014 Quam, Av.","1","2");
INSERT INTO `tb_distribuidor` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`,`id_superDistribuidor`) VALUES ("1681","Mauris Quis LLP","7411","58-212-618-7009","58-212-356-4134","a@molestie.co.uk","7279 Porttitor Avenue","1",NULL);
INSERT INTO `tb_distribuidor` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`,`id_superDistribuidor`) VALUES ("2540","Laoreet Ipsum Curabitur Incorporated","2918","58-212-100-3816","58-212-142-9047","molestie.tellus.Aenean@parturientmontesnascetur.net","9437 Ac St.","1",NULL);
INSERT INTO `tb_distribuidor` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`,`id_superDistribuidor`) VALUES ("1955","Quisque Ac Associates","7778","58-212-664-2125","58-212-532-3896","vitae@sagittisfelis.ca","7490 Non Avenue","1",NULL);

/* EMPRESAS */
INSERT INTO `tb_empresa` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`,`id_distribuidor`) VALUES ("2362","Duis Ltd","6462","58-212-405-0403","58-212-807-3859","molestie.tellus@iaculislacus.ca","529-7090 At Av.","1","1");
INSERT INTO `tb_empresa` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`,`id_distribuidor`) VALUES ("2153","Duis LLP","3507","58-212-103-1374","58-212-928-7955","vulputate.dui@nisi.org","P.O. Box 168, 2638 Porttitor Ave","1","1");
INSERT INTO `tb_empresa` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`,`id_distribuidor`) VALUES ("3612","Blandit At Nisi Company","1747","58-212-684-5441","58-212-492-5872","amet@pharetraNam.edu","8282 Sodales. Road","1","2");
INSERT INTO `tb_empresa` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`,`id_distribuidor`) VALUES ("3686","Faucibus Ut Nulla Company","7302","58-212-563-2998","58-212-437-1969","magna.a@mauris.org","177-9669 Aliquam Avenue","1","2");
INSERT INTO `tb_empresa` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`,`id_distribuidor`) VALUES ("7443","Nec Industries","2850","58-212-137-3218","58-212-794-4966","cursus.in@sagittissemperNam.ca","292-5716 Consectetuer, Ave","1","3");
INSERT INTO `tb_empresa` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`,`id_distribuidor`) VALUES ("8473","Lectus LLC","6051","58-212-624-8175","58-212-511-9148","neque.Nullam.nisl@vitae.co.uk","8527 Blandit Rd.","1","3");
INSERT INTO `tb_empresa` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`,`id_distribuidor`) VALUES ("1302","Erat Volutpat Nulla Company","8203","58-212-710-1651","58-212-989-9380","luctus.felis@tincidunt.net","P.O. Box 556, 2355 Purus. Av.","1","4");
INSERT INTO `tb_empresa` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`,`id_distribuidor`) VALUES ("2790","Maecenas Incorporated","6927","58-212-175-2316","58-212-652-0333","risus.Morbi@posuereat.ca","234-8079 Montes, Road","1","4");
INSERT INTO `tb_empresa` (`identificacion`,`nombre`,`razonSocial`,`telefono`,`fax`,`correo`,`direccion`,`id_ciudad`,`id_distribuidor`) VALUES ("9969","Lectus Company","7083","58-212-149-1408","58-212-655-8749","vel.arcu.eu@enim.co.uk","Ap #722-5597 Ut St.","1","5");

/* SUCURSALES */
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Dui Nec LLC","P.O. Box 203, 3267 Dis Ave","1","1");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Consequat Auctor Nunc Institute","922-3219 Pretium St.","1","1");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Mi Incorporated","5441 Gravida. Road","1","2");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Lobortis Inc.","6193 Magna, Rd.","1","2");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Dictum Cursus Nunc LLP","390-7952 Dui Av.","1","3");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Purus Ac Tellus LLP","P.O. Box 268, 4399 Nibh Avenue","1","3");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Non Inc.","P.O. Box 218, 1048 Mauris Ave","1","4");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Vehicula Risus Company","Ap #846-298 Neque Rd.","1","4");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Luctus Lobortis Foundation","7801 Nunc Rd.","1","5");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Urna Nec Inc.","408-7627 Tellus Avenue","1","5");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Imperdiet Ullamcorper Industries","P.O. Box 597, 4688 Nulla Rd.","1","6");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Tellus Consulting","9556 Semper Road","1","6");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Cras Dictum LLC","Ap #618-570 Egestas. Rd.","1","7");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Nisi Consulting","345-826 Amet Rd.","1","7");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Egestas Aliquam Consulting","P.O. Box 212, 6739 Molestie Road","1","8");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Ut Inc.","P.O. Box 595, 9241 A Av.","1","8");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Integer Incorporated","134-9839 Proin Ave","1","9");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Mollis Corporation","2459 Mollis. Avenue","1","9");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Phasellus Limited","P.O. Box 785, 5991 Malesuada St.","1","1");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Tincidunt Nunc Corp.","633-6658 Auctor Rd.","1","1");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Posuere Cubilia Curae; Foundation","240-5721 Erat St.","1","2");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Vel Vulputate PC","Ap #517-3772 Duis Road","1","2");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Aliquet Lobortis Associates","173-6184 Ante St.","1","3");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Lobortis Mauris Suspendisse Inc.","Ap #804-1298 Ac St.","1","3");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Lorem Ipsum Industries","Ap #972-979 Aliquam St.","1","4");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Interdum LLC","Ap #859-982 Non Av.","1","4");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Facilisis Facilisis Magna Company","P.O. Box 988, 5637 Sodales St.","1","5");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Elit Pretium Et PC","Ap #889-5295 Ipsum. Avenue","1","5");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Mi Consulting","Ap #928-4520 Maecenas Avenue","1","6");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("In Tempus Consulting","326-4087 Dui Street","1","6");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Purus Ac Institute","P.O. Box 512, 880 Risus. Street","1","7");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Ut Sagittis Associates","Ap #755-153 Dictum. Rd.","1","7");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Id Ante Dictum Incorporated","P.O. Box 525, 1217 Tempor St.","1","8");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Sem Mollis Foundation","Ap #363-357 Vitae, St.","1","8");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Ornare Lectus Industries","Ap #122-726 Egestas Av.","1","9");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Nunc Inc.","1394 Mattis Rd.","1","9");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Hendrerit Ltd","9154 Varius Ave","1","1");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Faucibus Id Libero LLC","867-6885 Nunc Rd.","1","1");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Enim PC","Ap #185-2587 Ut, Road","1","2");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("At Consulting","1923 Turpis. Street","1","2");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Tincidunt Corporation","925-6612 Nunc, St.","1","3");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Dui Lectus Rutrum Foundation","3167 Convallis, St.","1","3");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Eget Mollis Lectus Incorporated","P.O. Box 436, 9789 Donec Avenue","1","4");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Accumsan Laoreet Ipsum LLP","P.O. Box 890, 7703 Faucibus Ave","1","4");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Elit Aliquam Institute","Ap #674-8315 Morbi St.","1","5");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Nibh Foundation","275-9192 Nostra, Rd.","1","5");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Ornare Sagittis Felis Industries","5514 Purus. St.","1","6");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Ornare LLC","P.O. Box 575, 3918 Tincidunt, St.","1","6");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Eget Metus Eu Ltd","946-2120 Erat St.","1","7");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Sed Limited","885-497 Convallis Av.","1","7");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Fusce Aliquet Magna Incorporated","P.O. Box 913, 5620 Elit, Avenue","1","8");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Nascetur Ridiculus LLC","3419 Ut Street","1","8");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Nunc LLC","1241 Accumsan Road","1","9");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Placerat LLC","771-2383 Nam Road","1","9");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Elementum Dui Quis Corporation","Ap #941-7360 Primis St.","1","1");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Nisl Quisque Fringilla Corporation","2043 Velit. Avenue","1","1");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Fermentum Associates","7334 Feugiat Ave","1","2");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("In Mi Company","P.O. Box 708, 5594 Ac Ave","1","2");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Cras Eget Nisi Limited","Ap #228-7610 Vivamus Rd.","1","3");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Sapien PC","Ap #159-6077 Parturient Rd.","1","3");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Lorem Ipsum Dolor Ltd","P.O. Box 701, 413 Enim. Ave","1","4");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Mi Enim Condimentum Industries","469-305 Aenean Rd.","1","4");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Non Nisi Aenean Corp.","6601 Scelerisque Road","1","5");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Vel Convallis In Institute","8263 Velit Ave","1","5");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Nam Interdum Associates","P.O. Box 729, 5447 Fusce Av.","1","6");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Quis Accumsan Convallis Corp.","469-2750 Tincidunt, Avenue","1","6");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Arcu Morbi Sit Corp.","Ap #659-782 A Road","1","7");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Cursus Institute","1585 Etiam St.","1","7");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Sapien Institute","439-9026 Sem Street","1","8");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Morbi Associates","Ap #163-6611 Ad Rd.","1","8");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Cursus PC","9786 Mi. Rd.","1","9");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Sollicitudin Orci Sem LLC","Ap #977-9437 Purus, St.","1","9");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Eget Massa Associates","478-158 Vel, St.","1","1");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Curabitur Corporation","159 Sit Avenue","1","1");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Ullamcorper Duis Cursus Company","P.O. Box 701, 6924 Quis, Rd.","1","2");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Orci Lacus Limited","473-8302 At St.","1","2");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Interdum Ltd","345-8538 Id, St.","1","3");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Dictum Mi Ac LLC","8566 Fusce St.","1","3");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Commodo Limited","533-8156 Aenean Rd.","1","4");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Eget Magna PC","P.O. Box 666, 6128 Amet, Rd.","1","4");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Venenatis Vel Faucibus Corp.","5414 Nisl Ave","1","5");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Iaculis Nec Corporation","P.O. Box 225, 711 Mauris Rd.","1","5");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("A Magna Lorem Consulting","9516 Nec Street","1","6");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Lorem Ac LLP","4744 Lectus. Av.","1","6");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Augue LLP","Ap #541-8767 In Street","1","7");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Eget Magna Suspendisse LLP","Ap #470-5390 Amet, Av.","1","7");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Metus Eu Corporation","6666 Lacus. Ave","1","8");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Mauris Id Sapien PC","569-6105 Imperdiet Av.","1","8");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Arcu Et Corporation","246-1178 Sollicitudin St.","1","9");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Mauris Eu Elit Corporation","P.O. Box 270, 648 Aliquam Av.","1","9");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Lectus Sit Amet Ltd","366-8086 Dis Rd.","1","1");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Eleifend Egestas Sed Company","881-8989 Nam St.","1","1");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Nulla Interdum Consulting","P.O. Box 655, 4411 Eleifend Avenue","1","2");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Massa Associates","Ap #153-7130 Cursus St.","1","2");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Amet Corp.","Ap #897-320 Dolor, Rd.","1","3");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Fusce Fermentum Associates","P.O. Box 990, 9183 Malesuada Av.","1","3");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Sed Molestie Inc.","6678 Sem. Street","1","4");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Nunc Consulting","324-9144 Luctus. Rd.","1","4");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Aenean Egestas Hendrerit LLC","821 Libero. St.","1","5");
INSERT INTO `tb_sucursal` (`sucursal`,`direccion`,`id_ciudad`,`id_empresa`) VALUES ("Leo Incorporated","584-3425 In St.","1","5");

/* USUARIOS */
/* ADMINISTRADORES */
INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("JamesAdmin","JamesAdmin","tristique.neque.venenatis@scelerisquenequesed.net","tristique.neque.venenatis@scelerisquenequesed.net","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (1, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (1, 1);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("7102","James","Patrick","tristique.neque.venenatis@scelerisquenequesed.net","58-212-257-4905","58-212-907-0728","58-416-187-8960","1","1","1","1");
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("1","1");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("ZoeAdmin","ZoeAdmin","vitae.mauris.sit@lectusNullam.ca","vitae.mauris.sit@lectusNullam.ca","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`, `activo`)
VALUES (2, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`, `id_perfil`)
VALUES (2, 1);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("7753","Zoe","Carney","vitae.mauris.sit@lectusNullam.ca","58-212-900-1198","58-212-427-5927","58-412-756-5327","2","1","1","1");
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("2","2");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("MiaAdmin","MiaAdmin","vel.est@ridiculusmusDonec.ca","vel.est@ridiculusmusDonec.ca","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`, `activo`)
VALUES (3, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`, `id_perfil`)
VALUES (3, 1);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("6785","Mia","Horton","vel.est@ridiculusmusDonec.ca","58-212-108-6063","58-212-700-7634","58-414-207-5955","2","1","1","2");
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("3","3");

/* SUPERDISTRIBUIDORES */
INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("XavierSD","XavierSD","Quisque.ac@vitaealiquam.org","Quisque.ac@vitaealiquam.org","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (4, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (4, 2);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("9160","Xavier","Gardner","Quisque.ac@vitaealiquam.org","58-212-223-2970","58-212-895-8387","58-424-322-8802","1","1","1","2");
INSERT INTO `tb_usuariod_superdistribuidor` (`id_usuariod`,`id_superDistribuidor`)
VALUES (4, 1);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("4","4");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("LacySD","LacySD","dolor.sit.amet@in.ca","dolor.sit.amet@in.ca","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (5, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (5, 2);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("7753","Laura","Carney","dolor.sit.amet@in.ca","58-212-900-1198","58-212-427-5927","58-412-756-5327","2","1","1","1");
INSERT INTO `tb_usuariod_superdistribuidor` (`id_usuariod`,`id_superDistribuidor`)
VALUES (5, 2);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("5","5");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("JinSD","JinSD","enim@velit.co.uk","enim@velit.co.uk","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (6, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (6, 2);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("4089","Gil","Morrow","enim@velit.co.uk","58-212-261-6669","58-212-445-7925","58-412-824-7547","1","1","1","1");
INSERT INTO `tb_usuariod_superdistribuidor` (`id_usuariod`,`id_superDistribuidor`)
VALUES (6, 3);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("6","6");

/* DISTRIBUIDOR */
INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("JasonD","JasonD","amet.risus.Donec@fringillaestMauris.edu","amet.risus.Donec@fringillaestMauris.edu","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (7, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (7, 3);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("4557","Jason","Colon","amet.risus.Donec@fringillaestMauris.edu","58-212-907-2735","58-212-886-9617","58-426-593-8315","1","1","1","2");
INSERT INTO `tb_usuariod_distribuidor` (`id_usuariod`,`id_distribuidor`)
VALUES (7, 1);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("7","7");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("EricaD","EricaD","nonummy.ac.feugiat@urnaVivamusmolestie.com","nonummy.ac.feugiat@urnaVivamusmolestie.com","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (8, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (8, 3);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("3629","Erica","Adkins","nonummy.ac.feugiat@urnaVivamusmolestie.com","58-212-966-8374","58-212-590-3997","58-412-625-4580","2","1","1","2");
INSERT INTO `tb_usuariod_distribuidor` (`id_usuariod`,`id_distribuidor`)
VALUES (8, 3);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("8","8");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("AdeleD","AdeleD","Ut@acsemut.org","Ut@acsemut.org","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (9, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (9, 3);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("3464","Adele","Albert","Ut@acsemut.org","58-212-530-4507","58-212-451-1841","58-424-354-3095","2","1","1","1");
INSERT INTO `tb_usuariod_distribuidor` (`id_usuariod`,`id_distribuidor`)
VALUES (9, 4);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("9","9");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("VictorD","VictorD","cursus.non.egestas@libero.ca","cursus.non.egestas@libero.ca","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (10, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (10, 3);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("5320","Victor","Tyson","cursus.non.egestas@libero.ca","58-212-254-0013","58-212-414-0883","58-416-891-9237","1","1","1","1");
INSERT INTO `tb_usuariod_distribuidor` (`id_usuariod`,`id_distribuidor`)
VALUES (10, 5);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("10","10");

/* EMPRESAS */
INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("PeterE","PeterE","laoreet@nisi.net","laoreet@nisi.net","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (11, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (11, 4);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("6201","Peter","Craig","laoreet@nisi.net","58-212-696-0237","58-212-145-1966","58-416-683-8791","1","1","1","1");
INSERT INTO `tb_usuariod_empresa` (`id_usuariod`,`id_empresa`)
VALUES (11, 1);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("11","11");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("KeelyE","KeelyE","consequat@lacusNulla.org","consequat@lacusNulla.org","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (12, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (12, 4);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("9259","Keeyly","Thomas","consequat@lacusNulla.org","58-212-601-9920","58-212-391-2537","58-412-229-8325","2","1","1","1");
INSERT INTO `tb_usuariod_empresa` (`id_usuariod`,`id_empresa`)
VALUES (12, 2);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("12","12");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("AdriaE","AdriaE","mauris.sapien@Nullatempor.com","mauris.sapien@Nullatempor.com","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (13, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (13, 4);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("3138","Adria","Mendoza","mauris.sapien@Nullatempor.com","58-212-928-6387","58-212-260-2397","58-412-549-7756","2","1","1","1");
INSERT INTO `tb_usuariod_empresa` (`id_usuariod`,`id_empresa`)
VALUES (13, 3);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("13","13");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("SelmaE","SelmaE","vulputate.nisi.sem@IntegermollisInteger.edu","vulputate.nisi.sem@IntegermollisInteger.edu","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (14, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (14, 4);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("7367","Selma","Dale","vulputate.nisi.sem@IntegermollisInteger.edu","58-212-402-6517","58-212-280-7933","58-414-254-2727","2","1","1","2");
INSERT INTO `tb_usuariod_empresa` (`id_usuariod`,`id_empresa`)
VALUES (14, 4);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("14","14");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("FinnE","FinnE","orci.luctus.et@elitpedemalesuada.edu","orci.luctus.et@elitpedemalesuada.edu","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (15, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (15, 4);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("8153","Finn","Dejesus","orci.luctus.et@elitpedemalesuada.edu","58-212-298-2299","58-212-268-4210","58-412-439-9438","1","1","1","2");
INSERT INTO `tb_usuariod_empresa` (`id_usuariod`,`id_empresa`)
VALUES (15, 5);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("15","15");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("SkylerE","SkylerE","pede@quamdignissimpharetra.com","pede@quamdignissimpharetra.com","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (16, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (16, 4);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("8594","Skyler","Calhoun","pede@quamdignissimpharetra.com","58-212-926-7767","58-212-582-8807","58-412-730-8416","2","1","1","1");
INSERT INTO `tb_usuariod_empresa` (`id_usuariod`,`id_empresa`)
VALUES (16, 6);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("16","16");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("CarlosE","CarlosE","enim.consequat@dolor.com","enim.consequat@dolor.com","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (17, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (17, 4);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("4195","Carlos","Cline","enim.consequat@dolor.com","58-212-666-7644","58-212-986-2634","58-416-428-2821","1","1","1","2");
INSERT INTO `tb_usuariod_empresa` (`id_usuariod`,`id_empresa`)
VALUES (17, 7);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("17","17");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("NathanielE","NathanielE","nonummy@odioEtiam.net","nonummy@odioEtiam.net","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (18, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (18, 4);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("8504","NathanielE","Schmidt","nonummy@odioEtiam.net","58-212-210-3008","58-212-267-5414","58-424-577-3973","1","1","1","1");
INSERT INTO `tb_usuariod_empresa` (`id_usuariod`,`id_empresa`)
VALUES (18, 8);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("18","18");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("DoraE","DoraE","velit.Aliquam@nisisemsemper.co.uk","velit.Aliquam@nisisemsemper.co.uk","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (19, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (19, 4);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("4537","Dora","Shelton","velit.Aliquam@nisisemsemper.co.uk","58-212-892-1776","58-212-758-3282","58-416-560-5767","2","1","1","2");
INSERT INTO `tb_usuariod_empresa` (`id_usuariod`,`id_empresa`)
VALUES (19, 9);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("19","19");

/* SUCURSALES */
INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("ReeceS","ReeceS","malesuada.malesuada.Integer@atauctor.com","malesuada.malesuada.Integer@atauctor.com","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (20, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (20, 5);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("4537","Reece","Shelton","malesuada.malesuada.Integer@atauctor.com","58-212-892-1776","58-212-758-3282","58-416-560-5767","1","1","1","1");
INSERT INTO `tb_usuariod_sucursal` (`id_usuariod`,`id_sucursal`)
VALUES (20, 1);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("20","20");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("HillaryS","HillaryS","luctus@Proin.org","luctus@Proin.org","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (21, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (21, 5);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("9259","Hillary","Thomas","luctus@Proin.org","58-212-601-9920","58-212-391-2537","58-412-229-8325","2","1","1","1");
INSERT INTO `tb_usuariod_sucursal` (`id_usuariod`,`id_sucursal`)
VALUES (21, 11);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("21","21");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("SandraS","SandraS","cursus.Integer@ac.ca","cursus.Integer@ac.ca","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (22, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (22, 5);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("1555","Sandra","Sexton","cursus.Integer@ac.ca","58-212-384-3413","58-212-404-5599","58-414-794-0496","2","1","1","1");
INSERT INTO `tb_usuariod_sucursal` (`id_usuariod`,`id_sucursal`)
VALUES (22, 30);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("22","22");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("RhodaS","RhodaS","lorem.ut.aliquam@nonfeugiat.net","lorem.ut.aliquam@nonfeugiat.net","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (23, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (23, 5);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("7028","Rhoda","Patterson","lorem.ut.aliquam@nonfeugiat.net","58-212-188-3646","58-212-804-7532","58-426-818-6439","2","1","1","1");
INSERT INTO `tb_usuariod_sucursal` (`id_usuariod`,`id_sucursal`)
VALUES (23, 45);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("23","23");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("BradyS","BradyS","nisi.Aenean.eget@disparturient.co.uk","nisi.Aenean.eget@disparturient.co.uk","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (24, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (24, 5);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("9528","Brady","Lee","nisi.Aenean.eget@disparturient.co.uk","58-212-753-3954","58-212-177-0542","58-412-396-0619","1","1","1","2");
INSERT INTO `tb_usuariod_sucursal` (`id_usuariod`,`id_sucursal`)
VALUES (24, 1);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("24","24");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("KendallS","KendallS","tempus@pretiumaliquet.co.uk","tempus@pretiumaliquet.co.uk","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (25, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (25, 5);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("7057","Kendall","Lambert","tempus@pretiumaliquet.co.uk","58-212-126-0979","58-212-121-2661","58-412-373-5693","1","1","1","1");
INSERT INTO `tb_usuariod_sucursal` (`id_usuariod`,`id_sucursal`)
VALUES (25, 11);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("25","25");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("UrsaS","UrsaS","dui@nec.org","dui@nec.org","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (26, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (26, 5);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("7057","Ursa","Lambert","dui@nec.org","58-212-126-0979","58-212-121-2661","58-412-373-5693","1","1","1","1");
INSERT INTO `tb_usuariod_sucursal` (`id_usuariod`,`id_sucursal`)
VALUES (26, 3);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("26","26");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("XerxesS","XerxesS","euismod@estmauris.net","euismod@estmauris.net","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (27, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (27, 5);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("2075","Xerses","Bryan","magna@magna.co.uk","58-212-480-6484","58-212-864-9557","58-412-501-6875","1","1","1","1");
INSERT INTO `tb_usuariod_sucursal` (`id_usuariod`,`id_sucursal`)
VALUES (27, 51);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("27","27");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("KyleS","KyleeS","auctor.velit.Aliquam@tellus.co.uk","auctor.velit.Aliquam@tellus.co.uk","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (28, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (28, 5);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("1802","Kyle","Miranda","auctor.velit.Aliquam@tellus.co.uk","58-212-438-8872","58-212-363-7529","58-412-261-2855","1","1","1","1");
INSERT INTO `tb_usuariod_sucursal` (`id_usuariod`,`id_sucursal`)
VALUES (28, 55);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("28","28");

INSERT INTO `tb_usuario` (`usuario`,`usuario_`,`usuarioCorreo`,`usuarioCorreo_`,`contrasena`)
VALUES ("PatrickS","PatrickS","arcu@vestibulumnequesed.com","arcu@vestibulumnequesed.com","123456");
INSERT INTO `tb_usuarioactivo` (`id_usuario`,`activo`)
VALUES (29, 1);
INSERT INTO `tb_usuario_perfil` (`id_usuario`,`id_perfil`)
VALUES (29, 5);
INSERT INTO `tb_usuariod` (`identificacion`,`nombres`,`apellidos`,`correo`,`tlfCasa`,`tlfOficina`,`tlfCelular`,`id_sexo`,`id_tipoUsuarioD`,`id_ciudad`,`id_idioma`)
VALUES ("1959","Patrick","Reyes","arcu@vestibulumnequesed.com","58-212-965-9673","58-212-501-3746","58-416-404-8294","1","1","1","2");
INSERT INTO `tb_usuariod_sucursal` (`id_usuariod`,`id_sucursal`)
VALUES (29, 90);
INSERT INTO `tb_usuario_usuariod` (`id_usuario`,`id_usuarioD`)
VALUES ("29","29");

/* CONSUMIDORES */
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Simon","Heath","04123372288","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Arsenio","Fuentes","04247044545","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Doris","Singleton","04262316840","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Arden","Petersen","04143902273","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Kennedy","Guy","04166530874","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Ashely","Sanford","04148709784","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Lois","Mcmahon","04125005082","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Andrew","Cooley","04122692845","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Hannah","Stone","04167846753","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Phillip","Tyson","04126594267","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Juliet","Cleveland","04142803355","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Yoshi","Hurley","04164319923","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Naida","Madden","04263702018","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Dean","Hernandez","04164777872","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Stacey","Morse","04242587559","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Maggy","Donovan","04267462603","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Ebony","Pratt","04168774684","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Winifred","Hester","04149442851","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Colby","Tyson","04161761192","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Micah","Bird","04249322757","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Aidan","French","04143021571","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Oren","Patrick","04144337265","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Lawrence","Shaffer","04166221814","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Aubrey","Fulton","04249862835","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Harlan","Gates","04149558138","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Merritt","Moreno","04248135341","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Claire","Allison","04166476542","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Tyrone","Head","04143048605","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Darrel","Guzman","04128764786","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Shaeleigh","Burris","04167281459","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Florence","Holland","04269628250","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Evelyn","Snow","04122468805","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Ezra","Duke","04123605966","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Kenneth","Horne","04127456120","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Elliott","Weeks","04267959806","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Kadeem","Espinoza","04149647200","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Rae","Simmons","04144043803","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Morgan","Potts","04142110313","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Kane","Bailey","04164046924","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Lillith","Shields","04166572721","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Hall","Vasquez","04163057271","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Gregory","Hart","04161789559","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Keiko","Gibbs","04166215912","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Fredericka","Burt","04243194453","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Grady","Tate","04246590241","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Timon","Reynolds","04165777783","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Demetria","Farmer","04169493746","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Stewart","Lindsay","04163513130","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Helen","Schultz","04244976455","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Hedda","Gregory","04166230924","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Dorian","Palmer","04262579623","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Geraldine","Hewitt","04263474473","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Rylee","Long","04261153339","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Fatima","Hodges","04146006649","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Sybill","Day","04143337066","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Ainsley","Daugherty","04244592216","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Rogan","Burks","04122941991","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Sybill","Wood","04167676065","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Kitra","Robbins","04121557359","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Florence","Orr","04168506776","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Renee","Tillman","04248048412","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Brian","Gordon","04245108021","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Ashely","Beck","04143170809","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Olivia","Livingston","04267908248","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Wilma","Valentine","04144169326","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Harlan","Bruce","04267949393","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Savannah","Gamble","04145151513","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Aspen","Christian","04149054467","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Leroy","Eaton","04266298845","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Cassandra","Mckenzie","04141377421","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Eugenia","Goodwin","04267482804","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Jermaine","Foreman","04128736166","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Wade","Kirby","04269214953","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Rylee","Gallegos","04166142153","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Aileen","Rivera","04162120019","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Kaye","Lindsey","04129484609","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Anjolie","Diaz","04246427652","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Hammett","Finch","04265265019","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Brody","Harrington","04149520735","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Silas","Clements","04269643979","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Miranda","Gaines","04248557147","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Trevor","Gamble","04163828385","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Cathleen","Preston","04123368672","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Rowan","Thompson","04123436352","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Fuller","Silva","04167948548","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Flynn","Walton","04125597490","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Cheryl","Cannon","04166590490","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Brynne","Franks","04128233451","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Aurora","Gonzales","04142981980","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Amos","Henson","04125014639","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Thor","Petersen","04249302650","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Blaine","Hester","04264172063","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Tallulah","Carrillo","04267781677","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Brendan","Potts","04267776146","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Gregory","Rose","04122931955","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Shaeleigh","Blair","04127717809","2");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Derek","Tate","04269613051","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("MacKenzie","Chan","04146772718","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Rebecca","Sweet","04263970296","1");
INSERT INTO `tb_consumidor` (`nombres`,`apellidos`,`celular`,`id_tipoConsumidor`) VALUES ("Rahim","Ballard","04164560606","2");

/* EVENTO */
INSERT INTO `tb_evento` (`evento`,`descripcion`,`fechaInicio`,`id_usuariod`,`id_empresa`) VALUES ("indigo","Prueba de evento","2015-04-01","11","1");
INSERT INTO `tb_evento` (`evento`,`descripcion`,`fechaInicio`,`id_usuariod`,`id_empresa`) VALUES ("orange","Prueba de evento","2015-04-01","12","2");
INSERT INTO `tb_evento` (`evento`,`descripcion`,`fechaInicio`,`id_usuariod`,`id_empresa`) VALUES ("black","Prueba de evento","2015-04-01","13","3");
INSERT INTO `tb_evento` (`evento`,`descripcion`,`fechaInicio`,`id_usuariod`,`id_empresa`) VALUES ("red","Prueba de evento","2015-04-01","14","4");
INSERT INTO `tb_evento` (`evento`,`descripcion`,`fechaInicio`,`id_usuariod`,`id_empresa`) VALUES ("yellow","Prueba de evento","2015-04-01","15","5");
INSERT INTO `tb_evento` (`evento`,`descripcion`,`fechaInicio`,`id_usuariod`,`id_empresa`) VALUES ("green","Prueba de evento","2015-04-01","16","6");
INSERT INTO `tb_evento` (`evento`,`descripcion`,`fechaInicio`,`id_usuariod`,`id_empresa`) VALUES ("white","Prueba de evento","2015-04-01","17","7");
INSERT INTO `tb_evento` (`evento`,`descripcion`,`fechaInicio`,`id_usuariod`,`id_empresa`) VALUES ("blue","Prueba de evento","2015-04-01","18","8");
INSERT INTO `tb_evento` (`evento`,`descripcion`,`fechaInicio`,`id_usuariod`,`id_empresa`) VALUES ("purple","Prueba de evento","2015-04-01","19","9");

INSERT INTO `tb_evento_sucursal` (`id_evento`,`id_sucursal`) VALUES ("1","1");
INSERT INTO `tb_evento_sucursal` (`id_evento`,`id_sucursal`) VALUES ("2","11");
INSERT INTO `tb_evento_sucursal` (`id_evento`,`id_sucursal`) VALUES ("3","30");
INSERT INTO `tb_evento_sucursal` (`id_evento`,`id_sucursal`) VALUES ("4","45");
INSERT INTO `tb_evento_sucursal` (`id_evento`,`id_sucursal`) VALUES ("5","3");
INSERT INTO `tb_evento_sucursal` (`id_evento`,`id_sucursal`) VALUES ("6","51");
INSERT INTO `tb_evento_sucursal` (`id_evento`,`id_sucursal`) VALUES ("7","55");
INSERT INTO `tb_evento_sucursal` (`id_evento`,`id_sucursal`) VALUES ("8","90");
INSERT INTO `tb_evento_sucursal` (`id_evento`,`id_sucursal`) VALUES ("9","1");



INSERT INTO `tb_dispositivo` (`nombre`,`identificacion`,`marca`,`modelo`,`serial`,`id_tipodispositivo`,`id_sucursal`)
VALUES ("TEST","123456789124587","Samsung","TEST","TEST","1","1");

INSERT INTO `tb_evento_dispositivo` (`id_evento`,`id_dispositivo`)
VALUES ("1","1");

INSERT INTO `tb_imagen` (`imagen`,`id_tipoImagen`)
VALUES ("FondoTest","1");
INSERT INTO `tb_imagen` (`imagen`,`id_tipoImagen`)
VALUES ("TecladoTest","1");

INSERT INTO `tb_checkin` (`background`,`teclado`,`fechaInicio`)
VALUES ("1","2","2015-01-01");

INSERT INTO `tb_nodo` (`id_evento`,`id_tipoNodo`,`id_objeto`,`id_tipoNodoPadre`,`id_objetoPadre`)
VALUES ("1","2","1","1","1");