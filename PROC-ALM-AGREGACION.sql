########################################
########################################
########################################
# Procedimiento Almacenado 
use QualityDB;
#		AGREGAR TIPO DE CLIENTE
DELIMITER //
Create procedure agg_tipoCliente (
    IN p_nom_tpcliente    VARCHAR(20), 
    IN p_desc_tpcliente VARCHAR(100)
)
BEGIN
	insert into tpCliente (  nom_tpcliente  ,  desc_tpcliente ) 
    values( p_nom_tpcliente, p_desc_tpcliente);
END //
DELIMITER ;

#AGREGAR CLIENTE  -- REGRESA EL ID DEL CLIENTE AGREGADO
DELIMITER //
create procedure agg_cliente (
    IN p_nom_cliente VARCHAR(50),
    IN p_apPaterno VARCHAR(20),
    IN p_apMaterno VARCHAR(20),
	IN p_const_fiscal varchar(100),
    IN p_rfc_cliente VARCHAR(15),
    IN p_nom_negocio VARCHAR(50),
    IN p_dom_cliente VARCHAR(50),
    IN p_telWP_cliente numeric(10,0),
    IN p_telFJ_cliente numeric(10,0),
    IN p_correo_cliente VARCHAR(50), 
    IN p_id_tpCliente INT
)
BEGIN

	Declare id_registrado int;
	insert into cliente (nom_cliente, apPaterno, apMaterno, const_fiscal, RFC_cliente, nom_negocio, dom_cliente, telWP_cliente, telFJ_cliente, correo_cliente, id_tpCliente) 
    values( p_nom_cliente, p_apPaterno, p_apMaterno, p_const_fiscal,p_rfc_cliente, p_nom_negocio, p_dom_cliente, p_telWP_cliente, p_telFJ_cliente, p_correo_cliente, p_id_tpCliente);
    
    SET id_registrado = LAST_INSERT_ID();
	
    insert into estadoCliente(id_cliente , adeudo ) values(id_registrado, 0); # Se inicializa el estado del cliente
    
    select id_registrado;
    
END //
DELIMITER ;

# DAR DE ALTA CATALOGOS DE PRODUCTOS

#		AGREGAR CLASIFICACION
DELIMITER //
Create procedure agg_clasificacion (
    IN p_nom_clasificacion VARCHAR (40),
	IN p_desc_clasificacion VARCHAR(100)
)
BEGIN
	insert into clasificacion ( nom_clasificacion , desc_clasificacion, alta_clasificacion  ) 
    values( p_nom_clasificacion, p_desc_clasificacion, TRUE);
END //
DELIMITER ;

#	AGREGAR	SUB---CLASIFICACION
DELIMITER //
Create procedure agg_subClasificacion (
	IN p_id_clasificacion int,
    IN p_nom_subclasificacion VARCHAR (80),
	IN p_desc_subclasificacion VARCHAR(100)
)
BEGIN
	insert into subClasificacion ( id_clasificacion ,nom_subclasificacion, desc_subclasificacion, alta_subclasificacion  ) 
    values( p_id_clasificacion, p_nom_subclasificacion, p_desc_subclasificacion, TRUE);
END //
DELIMITER ;

#		AGREGAR MATERIAL
DELIMITER //
Create procedure agg_material (
    IN p_nom_material VARCHAR (80),
    IN p_desc_material VARCHAR(100)
)
BEGIN
	insert into material ( nom_material, desc_material , alta_material ) 
    values( p_nom_material, p_desc_material ,TRUE);
END //
DELIMITER ;

#		AGREGAR UNIDAD
DELIMITER //
Create procedure agg_unidad (
    IN p_nom_unidad VARCHAR(10),
    IN p_desc_unidad  VARCHAR(100)
)
BEGIN
	insert into unidad ( nom_unidad, desc_unidad ) 
    values( p_nom_unidad, p_desc_unidad);
END //
DELIMITER ;

#AGREGAR PRODUCTO   - REGRESA EL ID DEL PRODUCTO
DELIMITER //
create procedure agg_producto (
    IN p_id_subclasificacion INT,
    IN p_id_Material  INT,
	IN p_id_unidad  INT,
    IN p_apl_inst BOOLEAN,
	IN p_precio_sin  float4,
    IN p_precio_con   float4,
	IN p_observaciones varchar(200),
    IN p_nombre_prod varchar (100)
)
BEGIN

	insert into producto  ( id_subclasificacion , id_Material , id_unidad , apl_inst , precio_sin , precio_con , observaciones, alta_producto , nombre_prod ) 
    values( p_id_subclasificacion, p_id_Material, p_id_unidad,p_apl_inst, p_precio_sin, p_precio_con, p_observaciones, TRUE, p_nombre_prod);
	
END //
DELIMITER ;

#		AGREGAR ACABADO
DELIMITER //
Create procedure agg_acabado (
    IN p_nom_acabado VARCHAR(20),
    IN p_desc_acabado  VARCHAR(100)
)
BEGIN
	insert into acabado ( nom_acabado, desc_acabado, alta_acabado ) 
    values( p_nom_acabado, p_desc_acabado, TRUE);
END //
DELIMITER ;

#		AGREGAR TIPO DE VENTA
DELIMITER //
Create procedure agg_tipoVenta (
    IN p_nom_tpVenta VARCHAR(20),
    IN p_desc_tpVenta   VARCHAR(100)
)
BEGIN
	insert into tipoVenta ( nom_tpVenta, desc_tpVenta, alta_tpVenta  ) 
    values( p_nom_tpVenta, p_desc_tpVenta, TRUE);
END //
DELIMITER ;

#		AGREGAR PROCESOS
DELIMITER //
Create procedure agg_proceso (
    IN p_nom_proceso  VARCHAR(20),
	IN p_desc_proceso    VARCHAR(100)
)
BEGIN
	insert into proceso ( nom_proceso , desc_proceso, alta_proceso ) 
    values( p_nom_proceso, p_desc_proceso, TRUE);
END //
DELIMITER ;

#		AGREGAR TIPO DE PAGO
DELIMITER //
Create procedure agg_tipoPago (
    IN p_nom_tpPago  VARCHAR(20),
	IN p_desc_tpPago     VARCHAR(100)
)
BEGIN
	insert into tipoPago (  nom_tpPago,  desc_tpPago, alta_tpPago ) 
    values( p_nom_tpPago ,p_desc_tpPago, TRUE );
END //
DELIMITER ;

#		AGREGAR FORMA DE PAGO
DELIMITER //
Create procedure agg_formaPago (
    IN p_nom_fmPago   VARCHAR(30),
	IN p_desc_fmPago      VARCHAR(100)
)
BEGIN
	insert into formaPago (  nom_fmPago  , desc_fmPago, alta_fmPago    ) 
    values( p_nom_fmPago, p_desc_fmPago, TRUE);
END //
DELIMITER ;

#		AGREGAR ESTATUS DE COBRANZA
DELIMITER //
Create procedure agg_estatusCobranza (
    IN p_nom_estCobranza    VARCHAR(20),
	IN p_desc_estCobranza      VARCHAR(100)
)
BEGIN
	insert into estatusCobranza (  nom_estCobranza  , desc_estCobranza, alta_estCobranza  ) 
    values( p_nom_estCobranza, p_desc_estCobranza, TRUE);
END //
DELIMITER ;


#AGREGAR COTIZACION   -- REGRESA EL ULTIMO ID REGISTRADO PARA PODER LLAMAR A LOS OTROS PROCEDIMIENTOS CON EL
DELIMITER //
create procedure agg_cotizacion (
    IN p_id_cliente  INT,
    IN p_id_tpVenta  INT,
    IN p_subTotal  float8,
	IN p_iva float8,
    IN p_total  float8,
    IN p_fechaVigencia  date,
    IN p_factura  BOOLEAN,
    IN p_personal  VARCHAR(100),
    IN p_observacion  VARCHAR(400),
    IN p_correo_pers varchar(50)
)
BEGIN

	insert into cotizacion (id_cliente , id_tpVenta , subTotal , iva , total , fechaVigencia , estatus , factura , personal , observacion , eliminacion, fechaEmision, correo_pers) 
    values( p_id_cliente, p_id_tpVenta, p_subTotal, p_iva,p_total, p_fechaVigencia, FALSE, p_factura, p_personal, p_observacion, FALSE, CURDATE(), p_correo_pers);

    select LAST_INSERT_ID();   # RETORNA EL  ULTIMO ID REGISTRADO
END //
DELIMITER ;

#		AGREGAR PRODUCTOS POR COTIZACION
DELIMITER //
Create procedure agg_product_cotizacion (
    IN p_id_cotizacion INT,
    IN p_id_producto  INT,
    IN P_cantidad INT,
    IN p_prod_base float4,
    IN p_prod_altura float4,
    IN p_precio_Uni  float4,
    IN p_importe float8
)
BEGIN
	insert into prod_cotizacion (  id_cotizacion  ,  id_producto   ,cantidad   ,prod_base , prod_altura ,precio_Uni , importe ) 
    values( p_id_cotizacion, p_id_producto, P_cantidad, p_prod_base, p_prod_altura, p_precio_Uni ,p_importe);
     
    select LAST_INSERT_ID();   # RETORNA EL  ULTIMO ID REGISTRADO
    
END //
DELIMITER ;

#		AGREGAR ACABADO POR COTIZACION POR PRODUCTO
DELIMITER //
Create procedure agg_acab_cotizacion (
    IN p_id_prod_cot INT,
    IN p_id_acabado  INT
)
BEGIN
	insert into acab_cotizacion (  id_prod_cot  ,  id_acabado ) 
    values( p_id_prod_cot, p_id_acabado);
END //
DELIMITER ;

#		AGREGAR PROCESOS POR COTIZACION
DELIMITER //
Create procedure agg_proc_cotizacion (
    IN p_id_cotizacion INT,
    IN p_id_proceso   INT
)
BEGIN
	insert into proc_cotizacion (  id_cotizacion  ,  id_proceso   ) 
    values( p_id_cotizacion, p_id_proceso);
END //
DELIMITER ;

#		AGREGAR ORDEN DE TRABAJO  // VENTA
DELIMITER //
Create procedure agg_ordenTrabajo (
    IN p_id_cotizacion INT,
    IN p_correo_pers varchar(50),
    IN p_personal_acep varchar(100)
)
BEGIN
	insert into ordenTrabajo (  id_cotizacion  ,  id_estCobranza    ,totalPagado, fechaEmision, correo_pers, personal_acep) 
    values( p_id_cotizacion, 1, 0, CURDATE(), p_correo_pers,  p_personal_acep);
    
    UPDATE Cotizacion
    set estatus = TRUE
    where id_cotizacion = p_id_cotizacion;
END //
DELIMITER ;


#		AGREGAR PAGO POR ORDEN DE TRABAJO
DELIMITER //
Create procedure agg_pagoOrdenTrabajo (
    IN p_id_ordenTrabajo  INT,
    IN p_id_tpPago     INT,
    IN p_id_fmPago  INT,
    IN p_comprobante VARCHAR(100),
    IN p_fechaPago DATE,
    IN p_monto float4 
)
BEGIN
	insert into pagoOrdenTrabajo (  id_ordenTrabajo   ,  id_tpPago     ,id_fmPago , comprobante , fecha_pago , montoPago ) 
    values( p_id_ordenTrabajo, p_id_tpPago, p_id_fmPago , p_comprobante, p_fechaPago, p_monto);
    
    UPDATE ordenTrabajo
	SET totalPagado = (SELECT SUM(montoPago) FROM pagoOrdenTrabajo where id_ordenTrabajo = p_id_ordenTrabajo) where id_ordenTrabajo = p_id_ordenTrabajo;
        
END //
DELIMITER ;
