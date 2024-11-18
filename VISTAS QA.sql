## VISTAS TABLA
use prueba2;

# 		CLASIFICACION
CREATE VIEW view_clasificacion  AS
Select id_clasificacion, nom_clasificacion , desc_clasificacion, alta_clasificacion
from clasificacion 
where alta_clasificacion = TRUE;

select * from view_clasificacion;

# 		SUB--CLASIFICACION               
CREATE VIEW view_subclasificacion  AS
Select c.id_clasificacion, nom_clasificacion,id_subclasificacion , nom_subclasificacion, desc_subclasificacion, alta_subclasificacion 
from subClasificacion sc
inner join clasificacion c on c.id_clasificacion = sc.id_clasificacion
where sc.alta_subclasificacion = TRUE;

select * from view_subclasificacion;

# 		MATERIAL
CREATE VIEW view_material AS
Select id_material  , nom_material, desc_material, alta_material  
from material  
where alta_material = TRUE;

select * from view_material;
# 		UNIDAD
CREATE VIEW view_unidad AS
Select id_unidad   , nom_unidad ,desc_unidad    
from unidad ;

select * from view_unidad;

CREATE VIEW view_productos AS
Select id_producto , c.nom_clasificacion  , subc.nom_subclasificacion , p.nombre_prod,  m.nom_material , u.nom_unidad ,apl_inst  , precio_sin ,  precio_con , observaciones , alta_producto 
from producto p
inner join subclasificacion subc on subc.id_subclasificacion  = p.id_subclasificacion 
inner join clasificacion c on c.id_clasificacion = subc.id_clasificacion
inner join unidad u on u.id_unidad = p.id_unidad
inner join material m on m.id_material = p.id_material
where p.alta_producto = TRUE;
    
select * from view_productos;

CREATE VIEW view_cliente AS
Select id_cliente ,concat(nom_cliente ," ", apPaterno ," ",apMaterno ) AS "Nombre Completo", tpc.nom_tpcliente,const_fiscal ,  RFC_cliente , nom_negocio , dom_cliente , telWP_cliente ,  telFJ_cliente , correo_cliente 
FROM cliente c
inner join tpCliente tpc on tpc.id_tpCliente = c.id_tpCliente 
order by nom_cliente ASC, apPaterno ASC, apMaterno ASC;

select * from view_cliente;

CREATE VIEW view_cotizacion AS
Select c.id_cotizacion, concat(nom_cliente ," ", apPaterno ," ",apMaterno ) AS "Nombre Completo",  tpv.nom_tpVenta, c.subTotal, c.iva, c.total, c.fechaEmision ,c.fechaVigencia, c.estatus, c.factura, c.personal, c.correo_pers, c.observacion
from cotizacion c
inner join tipoVenta tpv on tpv.id_tpVenta = c.id_tpVenta
inner join cliente cl on cl.id_cliente = c.id_cliente
where eliminacion = false
ORDER BY c.id_cotizacion DESC;

select * from view_cotizacion;

CREATE VIEW view_ordenTrabajo AS
Select ot.id_ordenTrabajo, concat(nom_cliente ," ", apPaterno ," ",apMaterno ) AS "Nombre Completo", cl.nom_negocio, ot.correo_pers, ot.personal_acep, ot.fechaEmision , nom_estCobranza, c.total as "Total Venta", totalPagado, c.observacion
from ordenTrabajo ot
inner join cotizacion c on c.id_cotizacion = ot.id_cotizacion
inner join cliente cl on cl.id_cliente =c.id_cliente
inner join estatusCobranza ec on ec.id_estCobranza = ot.id_estCobranza
ORDER BY ot.id_ordenTrabajo DESC;

select * from view_ordenTrabajo;

# 		ACABADO
Create view view_acabado  as
Select id_acabado   , nom_acabado ,desc_acabado ,alta_acabado 
from acabado  
where alta_acabado = true;
    
    
# 		TIPO DE VENTA
Create view view_tipoVenta as
Select id_tpVenta , nom_tpVenta ,desc_tpVenta  ,alta_tpVenta 
from tipoVenta  
where alta_tpVenta = true;

# 		PROCESOS

Create view view_proceso as
Select id_proceso  , nom_proceso,  desc_proceso, alta_proceso 
from proceso   
where alta_proceso = true;


# 		TIPO DE PAGO

Create view view_tipoPago as
Select id_tpPago , nom_tpPago, desc_tpPago, alta_tpPago 
from tipoPago    
where alta_tpPago = true;

# 		FORMA  DE PAGO

Create view view_formaPago as
Select id_fmPago , nom_fmPago, desc_fmPago, alta_fmPago 
from formaPago  
where alta_fmPago = true;

# 		ESTATUS DE COBRANZA

Create view view_estatusCobranza as
Select id_estCobranza , nom_estCobranza ,  desc_estCobranza ,alta_estCobranza  
from estatusCobranza   
where alta_estCobranza = true;




