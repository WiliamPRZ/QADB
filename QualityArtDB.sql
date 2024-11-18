use prueba;
drop database prueba2;

create database prueba2;
use prueba2;

##########################################
########################################
########################################

## Zona Productos
create table clasificacion (
	id_clasificacion int AUTO_INCREMENT not null,
    nom_clasificacion varchar(40) not null,
    desc_clasificacion varchar(100) not null,
    alta_clasificacion boolean,
    PRIMARY KEY (id_clasificacion)
);

create table subClasificacion (
	id_subclasificacion int AUTO_INCREMENT not null,
    id_clasificacion int not null,
    nom_subclasificacion varchar(80) not null,
	desc_subclasificacion varchar(100) not null,
    alta_subclasificacion boolean,
    PRIMARY KEY (id_subclasificacion),
	FOREIGN KEY (id_clasificacion) REFERENCES clasificacion(id_clasificacion)
);

create table material (
	id_material int AUTO_INCREMENT not null,
    nom_material varchar(80) not null,
	desc_material varchar(100) not null,
	alta_material boolean,
    PRIMARY KEY (id_material)
);

create table unidad (
	id_unidad int AUTO_INCREMENT not null,
    nom_unidad varchar(20) not null,    
    desc_unidad varchar(100) not null,
    PRIMARY KEY (id_unidad)
);


create table  producto 
(
	id_producto int AUTO_INCREMENT not null,
    id_subclasificacion int not null,
	id_Material int not null,
	id_unidad int not null,
    apl_inst boolean not null,
    precio_sin decimal(8,2) not null, ## precion sin instalacion
    precio_con decimal(8,2) not null, ## precion con instalacion
    observaciones varchar(150), ## Observaciones del producto en general
	alta_producto boolean,
    nombre_prod varchar(100) not null, ## Nombre caracteristico del producto
	PRIMARY KEY (id_producto),
    FOREIGN KEY (id_subclasificacion) REFERENCES subClasificacion(id_subclasificacion),
    FOREIGN KEY (id_Material) REFERENCES material(id_Material),
    FOREIGN KEY (id_unidad) REFERENCES unidad(id_unidad)
);

########################################
########################################
########################################
# Zona Clientes

create table tpCliente
(
	id_tpCliente int AUTO_INCREMENT not null,
    nom_tpcliente varchar (20) not null,
	desc_tpcliente varchar(100) not null,
    PRIMARY KEY (id_tpCliente)
);

create table cliente 
(
	id_cliente int AUTO_INCREMENT not null,
    id_tpCliente int not null,
    nom_cliente varchar (50) not null,
    apPaterno varchar (20) not null,
    apMaterno varchar (20) not null, 
    const_fiscal varchar(100), #Direcion de la imagen
    RFC_cliente varchar (15) ,
    nom_negocio varchar (50) ,
    dom_cliente varchar (50) ,
    telWP_cliente numeric(10,0) ,
    telFJ_cliente numeric(10,0) ,
    correo_cliente varchar (50) ,
	PRIMARY KEY (id_cliente),
    FOREIGN KEY (id_tpCliente) REFERENCES tpCliente(id_tpCliente) 
);

create table estadoCliente
(
	id_cliente int unique not null,
    adeudo decimal(10,2) not null, # ver el estado de cuenta del cliente 
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) 
);
# #############################
########################################
########################################
########################################

# Zona Catalogos
create table acabado
(
	id_acabado int AUTO_INCREMENT not null,
	nom_acabado varchar (20) not null,
	desc_acabado varchar(100) not null,
	alta_acabado boolean,
    PRIMARY KEY (id_acabado)
);

create table tipoVenta
(
	id_tpVenta  int AUTO_INCREMENT not null,
    nom_tpVenta varchar (20) not null,
	desc_tpVenta varchar(100) not null,
    alta_tpVenta boolean,
    PRIMARY KEY (id_tpVenta)
);

create table proceso
(
	id_proceso int AUTO_INCREMENT not null,
    nom_proceso varchar (20) not null,
    desc_proceso varchar(100) not null,
    alta_proceso boolean,
    PRIMARY KEY (id_proceso)
);

create table tipoPago
(
	id_tpPago int AUTO_INCREMENT not null,
    nom_tpPago varchar (20) not null,
    desc_tpPago varchar(100) not null,
	alta_tpPago boolean,
    PRIMARY KEY (id_tpPago)
);

create table formaPago
(
	id_fmPago int AUTO_INCREMENT not null,
    nom_fmPago varchar (30) not null,
    desc_fmPago varchar(100) not null,
    alta_fmPago boolean,
    PRIMARY KEY (id_fmPago)
);

create table estatusCobranza
(
	id_estCobranza int AUTO_INCREMENT not null,
    nom_estCobranza varchar (20) not null,
    desc_estCobranza varchar(100) not null,
    alta_estCobranza boolean,
    PRIMARY KEY (id_estCobranza)
);

########################################
########################################
########################################

#Tabla Cotizacion

create table cotizacion
(
	id_cotizacion int AUTO_INCREMENT not null,
    id_cliente int not null,
    id_tpVenta int not null,
    subTotal decimal(12,2) not null,
    iva decimal(10,2) not null, 
    total decimal(12,2) not null,
    fechaVigencia date,  # fecha  de vigencia de la cotizacion
    estatus boolean not null,
    factura boolean not null, 
    personal varchar(100) not null,
    observacion varchar(400),
    eliminacion boolean not null, # Activacion despues de la fecha de vigencia cuando el estatus no sea aceptada = true
    fechaEmision date not null,
    correo_pers varchar(50) not null,
    PRIMARY KEY (id_cotizacion),
	FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ,
	FOREIGN KEY (id_tpVenta) REFERENCES tipoVenta(id_tpVenta) 
);

create table prod_cotizacion
(	
	id_prod_cot int AUTO_INCREMENT not null,
	id_cotizacion int not null,
    id_producto int not null,
    cantidad int not null, # 	numero de productos que se compraran
    prod_base float not null, 
    prod_altura float not null,
	precio_Uni decimal(10,2) not null, # precio del producto por mt2
    importe decimal(10,2) not null, #precio individual de cada producto, para futuros reportes de saber los productos mas vendidos    cantidad* (precio_Uni * medidas)
	PRIMARY KEY (id_prod_cot),
	FOREIGN KEY (id_cotizacion) REFERENCES cotizacion(id_cotizacion) ,
	FOREIGN KEY (id_producto) REFERENCES producto(id_producto) 
);
########################################
########################################
########################################

#Tabla relacionadas a cotizacion

create table acab_cotizacion
(
	id_prod_cot int not null,
    id_acabado int not null,
	FOREIGN KEY (id_prod_cot) REFERENCES prod_cotizacion(id_prod_cot) ,
	FOREIGN KEY (id_acabado) REFERENCES acabado(id_acabado) 
);

create table proc_cotizacion
(
	id_cotizacion int not null,
    id_proceso int not null,
	FOREIGN KEY (id_cotizacion) REFERENCES cotizacion(id_cotizacion) ,
	FOREIGN KEY (id_proceso) REFERENCES proceso(id_proceso) 
);

########################################
########################################
########################################

#Tabla orden de trabajo
create table ordenTrabajo
(
	id_ordenTrabajo int AUTO_INCREMENT not null,
    id_cotizacion int not null,
    id_estCobranza int not null,
    totalPagado decimal(12,2) not null, ## para llevar el control del monto total pagado
	fechaEmision date not null,
    correo_pers varchar(50) not null,
    personal_acep varchar(100) not null,
	PRIMARY KEY (id_ordenTrabajo),
	FOREIGN KEY (id_cotizacion) REFERENCES cotizacion(id_cotizacion),
	FOREIGN KEY (id_estCobranza) REFERENCES estatusCobranza(id_estCobranza) 
);

create table pagoOrdenTrabajo
(
	id_pagoOrdenTrabajo int AUTO_INCREMENT not null,
    id_ordenTrabajo int not null,
    id_tpPago int not null,
    id_fmPago int not null,
    comprobante varchar(100),   # Imagen de posibles transferencias
    fecha_pago date not null, # para saber que dias se registraron cada pago
    montoPago 	decimal(10,2) not null, ## Para los diferentes pagos saber de cuanto es cada uno
    PRIMARY KEY (id_pagoOrdenTrabajo),
	FOREIGN KEY (id_ordenTrabajo) REFERENCES ordenTrabajo(id_ordenTrabajo),
	FOREIGN KEY (id_tpPago) REFERENCES tipoPago(id_tpPago),
	FOREIGN KEY (id_fmPago) REFERENCES formaPago(id_fmPago) 
);

