
#  CONSULTAR TABLAS POR ID
use QualityDB;
# 		CLASIFICACION
DELIMITER //
Create procedure consulta_clasificacion_ID (
    IN ID INT
)
BEGIN
	Select id_clasificacion, nom_clasificacion , desc_clasificacion, alta_clasificacion
    from clasificacion 
    where id_clasificacion like  ID;
END //
DELIMITER ;

# 		SUB--CLASIFICACION
DELIMITER //                   
Create procedure consulta_subclasificacion_ID (
    IN ID INT
)
BEGIN
	Select c.id_clasificacion, nom_clasificacion,id_subclasificacion , nom_subclasificacion, desc_subclasificacion, alta_subclasificacion 
    from subClasificacion sc
    inner join clasificacion c on c.id_clasificacion = sc.id_clasificacion
    where sc.id_subclasificacion like  ID;
END //
DELIMITER ;

# 		MATERIAL
DELIMITER //
Create procedure consulta_material_ID (
    IN ID INT
)
BEGIN

	Select id_material  , nom_material, desc_material, alta_material  
    from material  
    where id_material like  ID;
END //
DELIMITER ;

# 		UNIDAD
DELIMITER //
Create procedure consulta_unidad_ID (
    IN ID INT
)
BEGIN
	Select id_unidad   , nom_unidad ,desc_unidad    
    from unidad  
    where id_unidad  =ID;
END //
DELIMITER ;

# 		producto
DELIMITER //
Create procedure consulta_producto_ID (
    IN ID INT
)
BEGIN
	Select id_producto , c.id_clasificacion, c.nom_clasificacion  , subc.id_subclasificacion, subc.nom_subclasificacion , p.nombre_prod, m.id_material, m.nom_material , u.id_unidad, u.nom_unidad ,apl_inst  , precio_sin ,  precio_con , observaciones , alta_producto 
    from producto p
    inner join subclasificacion subc on subc.id_subclasificacion  = p.id_subclasificacion 
	inner join clasificacion c on c.id_clasificacion = subc.id_clasificacion
    inner join unidad u on u.id_unidad = p.id_unidad
    inner join material m on m.id_material = p.id_material 
    where id_producto = ID;
END //
DELIMITER ;

# 		TIPO DE CLIENTE
DELIMITER //
Create procedure consulta_tpCliente_ID (
    IN ID INT
)
BEGIN

	Select id_tpCliente ,nom_tpcliente ,desc_tpcliente 
    FROM tpCliente
    where id_tpCliente = ID;
END //
DELIMITER ;

# 		CLIENTE
DELIMITER //
Create procedure consulta_cliente_ID (
    IN ID INT
)
BEGIN
	Select c.id_cliente ,concat(apPaterno ," ",apMaterno, " ", nom_cliente ) AS "Nombre Completo", ec.adeudo ,tpc.nom_tpcliente,const_fiscal ,  RFC_cliente , nom_negocio , dom_cliente , telWP_cliente ,  telFJ_cliente , correo_cliente 
    FROM cliente c
    inner join tpCliente tpc on tpc.id_tpCliente = c.id_tpCliente 
    inner join estadoCliente ec on ec.id_cliente = c.id_cliente
    where c.id_cliente = ID;
END //
DELIMITER ;

# 		ACABADO
DELIMITER //
Create procedure consulta_acabado_ID (
    IN ID INT
)
BEGIN
	Select id_acabado   , nom_acabado ,desc_acabado ,alta_acabado 
    from acabado  
    where id_acabado = ID;
END //
DELIMITER ;

# 		TIPO DE VENTA
DELIMITER //
Create procedure consulta_tipoVenta_ID(
    IN  ID INT
)
BEGIN

	Select id_tpVenta , nom_tpVenta ,desc_tpVenta  ,alta_tpVenta 
    from tipoVenta  
    where id_tpVenta =ID;
END //
DELIMITER ;

# 		PROCESOS
DELIMITER //
Create procedure consulta_proceso_ID (
    IN ID INT
)
BEGIN

	Select id_proceso  , nom_proceso,  desc_proceso, alta_proceso 
    from proceso   
    where id_proceso = ID;
END //
DELIMITER ;


# 		TIPO DE PAGO
DELIMITER //
Create procedure consulta_tipoPago_ID(
    IN ID INT
)
BEGIN

	Select id_tpPago , nom_tpPago, desc_tpPago, alta_tpPago 
    from tipoPago    
    where id_tpPago = ID;
END //
DELIMITER ;

# 		FORMA  DE PAGO
DELIMITER //
Create procedure consulta_formaPago_ID (
    IN ID INT 
)
BEGIN

	Select id_fmPago , nom_fmPago, desc_fmPago, alta_fmPago 
    from formaPago  
    where id_fmPago = ID;
END //
DELIMITER ;

# 		ESTATUS DE COBRANZA
DELIMITER //
Create procedure consulta_estatusCobranza_ID (
    IN ID INT
)
BEGIN

	Select id_estCobranza , nom_estCobranza ,  desc_estCobranza ,alta_estCobranza  
    from estatusCobranza   
    where id_estCobranza = ID;
END //
DELIMITER ;

# 		COTIZACION
DELIMITER //
Create procedure consulta_cotizacion_ID (
    IN ID INT 
)
BEGIN
	Select c.id_cotizacion, concat(apPaterno ," ",apMaterno, " ", nom_cliente ) AS "Nombre Completo",  cl.nom_negocio, tpv.nom_tpVenta, c.subTotal, c.iva, c.total, c.fechaEmision ,c.fechaVigencia, c.estatus, c.factura, c.personal, c.correo_pers, c.observacion
    from cotizacion c
    inner join tipoVenta tpv on tpv.id_tpVenta = c.id_tpVenta
    inner join cliente cl on cl.id_cliente = c.id_cliente
    where c.id_cotizacion = ID;
END //
DELIMITER ;

# 		ORDEN	DE	TRABAJO
DELIMITER //
Create procedure consulta_ordenTrabajo_ID (
    IN ID INT
)
BEGIN
	Select ot.id_ordenTrabajo, concat(apPaterno ," ",apMaterno, " ", nom_cliente ) AS "Nombre Completo", cl.nom_negocio, ot.correo_pers, ot.personal_acep, ot.fechaEmision , nom_estCobranza, c.subTotal, c.iva , c.total as "Total Venta", totalPagado
    from ordenTrabajo ot
    inner join cotizacion c on c.id_cotizacion = ot.id_cotizacion
    inner join cliente cl on cl.id_cliente =c.id_cliente
    inner join estatusCobranza ec on ec.id_estCobranza = ot.id_estCobranza
	where ot.id_ordenTrabajo = ID;
END //
DELIMITER ;

# 		ACABADOS ORDEN	DE	TRABAJO
DELIMITER //
Create procedure consulta_acab_OrdenTrabajo (
    IN ID INT
)
BEGIN
	Select  
    ot.id_ordenTrabajo AS OrdenTrabajo,
    pc.id_prod_cot AS Producto,
    GROUP_CONCAT(a.nom_acabado ORDER BY a.nom_acabado SEPARATOR ', ') AS Acabados
    from acab_cotizacion ac
    inner join prod_cotizacion pc on pc.id_prod_cot = ac.id_prod_cot
    inner join cotizacion c on c.id_cotizacion = pc.id_cotizacion
    inner join acabado a on ac.id_acabado = a.id_acabado 
    inner join ordenTrabajo ot on c.id_cotizacion = ot.id_cotizacion
    where ot.id_ordenTrabajo = ID
    group by  ot.id_ordenTrabajo, pc.id_prod_cot;
END //
DELIMITER ; 
# 		PROCESOS ORDEN	DE	TRABAJO
DELIMITER //
Create procedure consultar_proc_OrdenTrabajo (
    IN ID INT
)
BEGIN
	Select ot.id_ordenTrabajo, pc.id_cotizacion,  p.id_proceso   ,p.nom_proceso 
    from proc_cotizacion pc
    inner join cotizacion c on pc.id_cotizacion = c.id_cotizacion
    inner join proceso p on pc.id_proceso  = p.id_proceso    
    inner join ordenTrabajo ot on c.id_cotizacion = ot.id_cotizacion 
    where ot.id_ordenTrabajo = ID;
END //
DELIMITER ;