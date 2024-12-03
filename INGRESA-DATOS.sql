

##Datos de la tabla de acabados
insert into acabado( nom_acabado, desc_acabado , alta_acabado) values ('Bastilla', "", TRUE);
insert into acabado( nom_acabado, desc_acabado, alta_acabado) values ('Ojillos', "", TRUE);
insert into acabado( nom_acabado, desc_acabado, alta_acabado) values ('Funda', "", TRUE);
insert into acabado( nom_acabado, desc_acabado, alta_acabado) values ('Fajilla', "", TRUE);

##Datos para la clasificacion
insert into clasificacion( nom_clasificacion, desc_clasificacion , alta_clasificacion ) values ('IMPRESIÓN DE LONA ', "", TRUE);
insert into clasificacion( nom_clasificacion, desc_clasificacion, alta_clasificacion ) values ('VINIL CORTE', "", TRUE);
insert into clasificacion( nom_clasificacion, desc_clasificacion, alta_clasificacion ) values ('ESTRUCTURAS PARA PUBLICIDAD', "", TRUE);

##Datos para la subclasificacion
insert into subClasificacion( id_clasificacion, nom_subclasificacion, desc_subclasificacion  , alta_subclasificacion) values (1,'IMPRESIÓN DE LONA NORMAL', "", TRUE);
insert into subClasificacion( id_clasificacion, nom_subclasificacion, desc_subclasificacion , alta_subclasificacion ) values (2,'ROTULACION DE UNIDAD', "", TRUE);
insert into subClasificacion( id_clasificacion, nom_subclasificacion, desc_subclasificacion , alta_subclasificacion ) values (3,'STANDS', "", TRUE);

#Datos de material
insert into material( nom_material, desc_material , alta_material) values ('LONA DE IMPRESIÓN', "", TRUE);
insert into material( nom_material, desc_material , alta_material) values ('VINIL DE CORTE ', "", TRUE);
insert into material( nom_material, desc_material , alta_material) values ('VINIL REFLEJANTE', "", TRUE);

#Datos de tipos de unidad
insert into unidad( nom_unidad , desc_unidad ) values ('Rollo', "rollo");
insert into unidad( nom_unidad, desc_unidad ) values ('PZ', "pieza");
insert into unidad( nom_unidad, desc_unidad ) values ('MT2', "metros cuadrados");

#Datos de los tipos de pagos
insert into tipoPago( nom_tpPago, desc_tpPago , alta_tpPago) values('Anticipo', "", TRUE);
insert into tipoPago( nom_tpPago, desc_tpPago, alta_tpPago ) values('Pago total', "", TRUE);
insert into tipoPago( nom_tpPago, desc_tpPago , alta_tpPago) values('Abono', "", TRUE);
insert into tipoPago( nom_tpPago, desc_tpPago , alta_tpPago) values('Credito', "", TRUE);

#Datos de la forma de pago
insert into formaPago( nom_fmPago, desc_fmPago , alta_fmPago ) values('Efectivo', "", TRUE);
insert into formaPago( nom_fmPago, desc_fmPago  , alta_fmPago) values('Cheque', "", TRUE);
insert into formaPago( nom_fmPago, desc_fmPago  , alta_fmPago) values('Transaccion san QA', "", TRUE);
insert into formaPago( nom_fmPago, desc_fmPago , alta_fmPago ) values('Transaccion BBVA', "", TRUE);
insert into formaPago( nom_fmPago, desc_fmPago  , alta_fmPago) values('Transaccion san hcr', "", TRUE);

#Datos de  los estatus de las ordenes de trabajo
insert into estatusCobranza( nom_estCobranza, desc_estCobranza , alta_estCobranza) values('Pagada', "", TRUE);
insert into estatusCobranza( nom_estCobranza, desc_estCobranza , alta_estCobranza) values('Saldo pendiente', "", TRUE);
insert into estatusCobranza( nom_estCobranza, desc_estCobranza , alta_estCobranza) values('Cancelada', "", TRUE);
insert into estatusCobranza( nom_estCobranza, desc_estCobranza , alta_estCobranza) values('Descuento nomina', "", TRUE);

#Datos de los procesos
insert into proceso( nom_proceso, desc_proceso , alta_proceso ) values('Diseño', "", TRUE);
insert into proceso(nom_proceso, desc_proceso , alta_proceso ) values('Plotter corte', "", TRUE);
insert into proceso( nom_proceso, desc_proceso, alta_proceso  ) values('Router CNC', "", TRUE);
insert into proceso( nom_proceso, desc_proceso , alta_proceso ) values('Taller', "", TRUE);

#Datos de los tipos de venta
insert into tipoVenta(nom_tpVenta, desc_tpVenta , alta_tpVenta) values ('En mostrador', "", TRUE);
insert into tipoVenta(nom_tpVenta, desc_tpVenta, alta_tpVenta ) values ('Factura', "", TRUE);
insert into tipoVenta(nom_tpVenta, desc_tpVenta , alta_tpVenta) values ('Orden interna QA', "", TRUE);

#Datos de los tipos de Cliente
insert into tpCliente( nom_tpcliente, desc_tpcliente ) values ('Mostrador', "");
insert into tpCliente(nom_tpcliente, desc_tpcliente ) values ('Credito Autorizado', "");
insert into tpCliente( nom_tpcliente, desc_tpcliente ) values ('Trabajador QA', "");
insert into tpCliente(nom_tpcliente, desc_tpcliente ) values ('Orden interna QA', "");

#CALL agg_tipoCliente (nom_tpcliente, desc_tpcliente  );
CALL agg_tipoCliente ("En caja", "El cliente se presento en el mostrador del local"  );

#Call agg_cliente(nom_cliente, apPaterno, apMaterno, const_fiscal, RFC_cliente, nom_negocio, dom_cliente, telWP_cliente, telFJ_cliente, correo_cliente, id_tpCliente);
Call agg_cliente("Wiliam", "Perez", "V", "C://", "PEVW", "CHAWMEIN", "EMPAQUES 36417, BARRANCOS CL. 80480", 6674859669, 6652874586, "w@GMAIL.COM", 1);
Call agg_cliente("Carlos", "Solis", "M", "C://", "PEVW", "CHAWMEIN", "EMPAQUES 36417, BARRANCOS CL. 80480", 6674859669, 6652874586, "w@GMAIL.COM", 1);
Call agg_cliente("Carlos", "Samudio", "M", "C://", "PEVW", "CHAWMEIN", "EMPAQUES 36417, BARRANCOS CL. 80480", 6674859669, 6652874586, "w@GMAIL.COM", 1);


#CALL agg_clasificacion(nom_clasificacion, desc_clasificacion ) 
CALL agg_clasificacion("LONA DE IMPRESION", "Lona de impresion blanca rectangular" ) ;

#CALL agg_subClasificacion(nom_subclasificacion, desc_subclasificacion ) 
CALL agg_subClasificacion(1,"LONA DE IMPRESION", "Lona de impresion blanca rectangular" );

#CALL agg_material (nom_material, desc_material );
CALL agg_material ("LONA DE IMPRESION", "Lona de impresion blanca rectangular" );

#CALL agg_unidad (nom_unidad, desc_unidad );
CALL agg_unidad ("MT", "Metro" );

#CALL agg_producto ( id_subclasificacion , id_tpMaterial , id_unidad , apl_desc , precio_sin , precio_con , observaciones, descripcion); // apl_desc es boolean  para saber si aplica descuento o no
CALL agg_producto ( 1 , 3 , 3 , FAlSE , 250.99 , 368.99 , "No cuenta con instalacion este producto","Impresion de lona normal calidad fotografica estamos de promo con o sin acabados"); #// apl_desc es boolean  para saber si aplica descuento o no

#CALL agg_acabado (nom_acabado, desc_acabado );
CALL agg_acabado ("OJILLOS", "Decoracion de ojillos para lona" );

#CALL agg_tipoVenta (nom_tpVenta, desc_tpVenta );
CALL agg_tipoVenta ("EN MOSTRADOR", "EL CLIENTE ASISTIO AL LOCAL A REALIAZAR SU COMPRA" );

#CALL agg_proceso (nom_proceso, desc_proceso );
CALL agg_proceso ("DISEÑO", "EL CLIENTE REQUIERE QUE SE REALICE EL DISEÑO PARA SU PRODUCTO" );

#CALL agg_estatusCobranza (nom_estCobranza , desc_estCobranza  );
CALL agg_estatusCobranza ("CANCELADA", "EL CLIENTE SOLICITO CANCELAR LA ORDEN DE TRABAJO "  );

#CALL agg_tipoPago (nom_tpPago , desc_tpPago  );
CALL agg_tipoPago ("ABONO", "EL CLIENTE REALIZA UN PAGO DE SU ORDEN DE TRABAJO" );

#CALL agg_formaPago (nom_fmPago , desc_fmPago );
CALL agg_formaPago ("PAGO A LA CUENTA DE BBVA QA", "REALIZO EL PAGO A LA CUENTA BANCARIA BBVA 589641256325 DE LA EMPRESA QUALITYART" );
