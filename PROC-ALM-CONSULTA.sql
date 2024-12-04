
#  CONSULTAR TABLAS 
use QualityDB;
# 		CLASIFICACION
DELIMITER //
Create procedure consulta_clasificacion (
    IN nombre varchar(20)
)
BEGIN
	Select id_clasificacion, nom_clasificacion , desc_clasificacion, alta_clasificacion  
    from clasificacion
    where nom_clasificacion like  CONCAT('%', nombre, '%')
    and alta_clasificacion = true;
END //
DELIMITER ;
# 		SUB--CLASIFICACION
DELIMITER //                   
Create procedure consulta_subclasificacion (
    IN nombre varchar(20)
)
BEGIN
	Select id_subclasificacion , nom_subclasificacion, desc_subclasificacion, alta_subclasificacion 
    from subClasificacion 
    where nom_subclasificacion  like  CONCAT('%', nombre, '%')
    and alta_subclasificacion = true;
END //
DELIMITER ;

# 		MATERIAL
DELIMITER //
Create procedure consulta_material (
    IN nombre varchar(20)
)
BEGIN

	Select id_material  , nom_material, desc_material, alta_material 
    from material
    where nom_material   like  CONCAT('%', nombre, '%')
    and alta_material = true;
END //
DELIMITER ;

# 		UNIDAD
DELIMITER //
Create procedure consulta_unidad (
    IN nombre varchar(20)
)
BEGIN

	Select id_unidad   , nom_unidad ,desc_unidad  
    from unidad  
    where nom_unidad    like  CONCAT('%', nombre, '%');
END //
DELIMITER ;

# 		producto
DELIMITER //
Create procedure consulta_producto (
    IN nombre varchar(20)
)
BEGIN

	Select id_producto , c.nom_clasificacion  , subc.nom_subclasificacion , p.nombre_prod,  m.nom_material , u.nom_unidad ,apl_inst  , precio_sin ,  precio_con , observaciones , alta_producto 
    from producto p
    inner join subclasificacion subc on subc.id_subclasificacion  = p.id_subclasificacion 
	inner join clasificacion c on c.id_clasificacion = subc.id_clasificacion
    inner join unidad u on u.id_unidad = p.id_unidad
    inner join material m on m.id_material = p.id_material 
    where m.nom_material  like  CONCAT('%', nombre, '%') or
    c.nom_clasificacion like  CONCAT('%', nombre, '%') or
    subc.nom_subclasificacion like  CONCAT('%', nombre, '%') 
    and alta_producto = true;
    
END //
DELIMITER ;

# 		TIPO DE CLIENTE
DELIMITER //
Create procedure consulta_tpCliente (
    IN nombre varchar(20)
)
BEGIN
	Select id_tpCliente ,nom_tpcliente ,desc_tpcliente 
    FROM tpCliente
    where nom_tpcliente  like  CONCAT('%', nombre, '%');
END //
DELIMITER ;

# 		CLIENTE
DELIMITER //
Create procedure consulta_cliente (
    IN nombre varchar(20)
)
BEGIN

	Select c.id_cliente ,concat(apPaterno ," ",apMaterno , " ", nom_cliente) AS "Nombre Completo", ec.adeudo ,tpc.nom_tpcliente,const_fiscal ,  RFC_cliente , nom_negocio , dom_cliente , telWP_cliente ,  telFJ_cliente , correo_cliente 
    FROM cliente c
    inner join tpCliente tpc on tpc.id_tpCliente = c.id_tpCliente 
    inner join estadoCliente ec on ec.id_cliente = c.id_cliente
    where "Nombre Completo" like  CONCAT('%', nombre, '%')
    order by nom_cliente ASC, apPaterno ASC, apMaterno ASC;
END //
DELIMITER ;

# 		ACABADO
DELIMITER //
Create procedure consulta_acabado (
    IN nombre varchar(20)
)
BEGIN

	Select id_acabado   , nom_acabado ,desc_acabado ,alta_acabado 
    from acabado  
    where nom_acabado like  CONCAT('%', nombre, '%')
    and alta_acabado = true;
END //
DELIMITER ;

# 		TIPO DE VENTA
DELIMITER //
Create procedure consulta_tipoVenta (
    IN nombre varchar(20)
)
BEGIN

	Select id_tpVenta , nom_tpVenta ,desc_tpVenta  ,alta_tpVenta 
    from tipoVenta  
    where nom_tpVenta     like  CONCAT('%', nombre, '%')
    and alta_tpVenta = true;
END //
DELIMITER ;

# 		PROCESOS
DELIMITER //
Create procedure consulta_proceso (
    IN nombre varchar(20)
)
BEGIN

	Select id_proceso  , nom_proceso,  desc_proceso, alta_proceso 
    from proceso   
    where nom_proceso like  CONCAT('%', nombre, '%')
    and alta_proceso = true;
END //
DELIMITER ;


# 		TIPO DE PAGO
DELIMITER //
Create procedure consulta_tipoPago (
    IN nombre varchar(20)
)
BEGIN
	Select id_tpPago , nom_tpPago, desc_tpPago, alta_tpPago 
    from tipoPago    
    where nom_tpPago like  CONCAT('%', nombre, '%')
    and alta_tpPago = true;
END //
DELIMITER ;

# 		FORMA  DE PAGO
DELIMITER //
Create procedure consulta_formaPago (
    IN nombre varchar(20)
)
BEGIN
	Select id_fmPago , nom_fmPago, desc_fmPago, alta_fmPago 
    from formaPago  
    where nom_fmPago like  CONCAT('%', nombre, '%')
    and alta_fmPago = true;
END //
DELIMITER ;

# 		ESTATUS DE COBRANZA
DELIMITER //
Create procedure consulta_estatusCobranza (
    IN nombre varchar(20)
)
BEGIN
	Select id_estCobranza , nom_estCobranza ,  desc_estCobranza ,alta_estCobranza  
    from estatusCobranza   
    where nom_estCobranza   like  CONCAT('%', nombre, '%')
    and alta_estCobranza = true;
END //
DELIMITER ;

# 		COTIZACION
DELIMITER //
Create procedure consulta_cotizacion (
    IN nombre varchar(20)
)
BEGIN

	Select c.id_cotizacion, concat(apPaterno ," ",apMaterno, " ", nom_cliente ) AS "Nombre Completo",  cl.nom_negocio ,tpv.nom_tpVenta, c.subTotal, c.iva, c.total, c.fechaEmision ,c.fechaVigencia, c.estatus, c.factura, c.personal, c.correo_pers, c.observacion
    from cotizacion c
    inner join tipoVenta tpv on tpv.id_tpVenta = c.id_tpVenta
    inner join cliente cl on cl.id_cliente = c.id_cliente
    where "Nombre Completo"         
    like  CONCAT('%', nombre, '%') or cl.nom_negocio  like  CONCAT('%', nombre, '%') 
    and eliminacion = false
    ORDER BY c.id_cotizacion DESC;
END //
DELIMITER ;

# 		ACABADOS  POR  COTIZACION de cada producto
DELIMITER //
Create procedure consulta_acab_cotizacion (
    IN ID INT
)
BEGIN
	Select c.id_cotizacion, ac.id_prod_cot,  a.id_acabado ,a.nom_acabado, a.desc_acabado 
    from acab_cotizacion ac
    inner join prod_cotizacion pc on pc.id_prod_cot = ac.id_prod_cot
    inner join cotizacion c on c.id_cotizacion = pc.id_cotizacion
    inner join acabado a on ac.id_acabado = a.id_acabado 
    where c.id_cotizacion = ID;
END //
DELIMITER ;

# 		PROCESOS  POR  COTIZACION
DELIMITER //
Create procedure consulta_proc_cotizacion (
    IN ID INT
)
BEGIN
	Select pc.id_cotizacion,  p.id_proceso   ,p.nom_proceso  , p.desc_proceso 
    from proc_cotizacion pc
    inner join cotizacion c on pc.id_cotizacion = c.id_cotizacion
    inner join proceso p on pc.id_proceso  = p.id_proceso 
    where pc.id_cotizacion = ID;
END //
DELIMITER ;


# 		PRODUCTOS  POR  COTIZACION
DELIMITER //
Create procedure consulta_productos_cotizacion (
    IN ID INT
)
BEGIN
	Select pc.id_cotizacion,  pc.id_prod_cot , pc.id_producto,  pc.cantidad, sc.nom_subclasificacion , p.nombre_prod as "Descripcion", pc.prod_base, pc.prod_altura, pc.precio_Uni, pc.importe
    from prod_cotizacion pc
    inner join cotizacion c on pc.id_cotizacion = c.id_cotizacion
    inner join producto p on p.id_producto= pc.id_producto
    inner join material m on m.id_material = p.id_material
    inner join subClasificacion sc on sc.id_subclasificacion =p.id_subclasificacion
    where pc.id_cotizacion = ID;
END //
DELIMITER ;

# 		ORDEN	DE	TRABAJO
DELIMITER //
Create procedure consulta_ordenTrabajo(
    IN nombre varchar(100)
)
BEGIN

	Select ot.id_ordenTrabajo, concat(apPaterno ," ",apMaterno, " ", nom_cliente ) AS "Nombre Completo", cl.nom_negocio, ot.correo_pers, ot.personal_acep, ot.fechaEmision , nom_estCobranza, c.total as "Total Venta", totalPagado
    from ordenTrabajo ot
    inner join cotizacion c on c.id_cotizacion = ot.id_cotizacion
    inner join cliente cl on cl.id_cliente =c.id_cliente
    inner join estatusCobranza ec on ec.id_estCobranza = ot.id_estCobranza
	where "Nombre Completo"         
    like  CONCAT('%', nombre, '%') or cl.nom_negocio  like  CONCAT('%', nombre, '%')
    ORDER BY ot.id_ordenTrabajo DESC;
END //
DELIMITER ;

# 		CONSULTA DE PRODUCTOS ORDEN	DE	TRABAJO
DELIMITER //
Create procedure consulta_Prod_ordenTrabajo(
    IN ID INT
)
BEGIN
	Select ot.id_ordenTrabajo, pc.id_cotizacion, pc.id_prod_cot , pc.id_producto,  pc.cantidad,  sc.nom_subclasificacion , p.nombre_prod as "Descripcion", FORMAT(pc.prod_base, 2) AS base, FORMAT(pc.prod_altura, 2) AS altura, FORMAT(pc.prod_base * pc.prod_altura, 2) AS m2, pc.precio_Uni, pc.importe
    from prod_cotizacion pc
    inner join cotizacion c on pc.id_cotizacion = c.id_cotizacion
    inner join ordenTrabajo ot on ot.id_cotizacion = c.id_cotizacion
    inner join producto p on p.id_producto= pc.id_producto
    inner join material m on m.id_material = p.id_material
    inner join subClasificacion sc on sc.id_subclasificacion =p.id_subclasificacion
    where ot.id_ordenTrabajo = ID;
END //
DELIMITER ;

# 		PAGO	ORDEN	DE	TRABAJO
DELIMITER //
Create procedure consulta_pagoOrdenTrabajo(
    IN ID INT
)
BEGIN

	Select pot.id_ordenTrabajo, pot.id_pagoOrdenTrabajo, nom_tpPago , nom_fmPago ,fecha_pago, montoPago,comprobante
    from pagoOrdenTrabajo pot
    inner join ordenTrabajo ot on ot.id_ordenTrabajo = pot.id_ordenTrabajo
    inner join tipoPago tp on tp.id_tpPago  = pot.id_tpPago 
    inner join formaPago fp on fp.id_fmPago  = pot.id_fmPago 
    where pot.id_ordenTrabajo = ID;
END //
DELIMITER ;
