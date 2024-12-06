#	MODIFICAR INFORMACION DE CATALOGOS
use QualityDB;

#		MODIFICAR TIPO DE CLIENTE
DELIMITER //
Create procedure modificar_tpclientes (
	IN p_id_tpCliente INT,
    IN p_nom_tpcliente  VARCHAR(20), 
    IN p_desc_tpcliente VARCHAR(100)
)
BEGIN
	UPDATE tpCliente
    SET nom_tpcliente = p_nom_tpcliente, 
        desc_tpcliente  =p_desc_tpcliente
        WHERE id_tpCliente = p_id_tpCliente;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el tipo de clietne con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Tipo de Cliente actualizado correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ;

#MODIFICAR CLIENTE  

DELIMITER //
create procedure modificar_clientes(
	IN p_id_registrado INT,
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
	UPDATE cliente
    SET nom_cliente = p_nom_cliente, 
        apPaterno =p_apPaterno, 
        apMaterno =p_apMaterno, 
        const_fiscal = p_const_fiscal, 
        RFC_cliente = p_rfc_cliente, 
        nom_negocio = p_nom_negocio, 
        dom_cliente = p_dom_cliente, 
        telWP_cliente =p_telWP_cliente, 
        telFJ_cliente =p_telFJ_cliente, 
        correo_cliente =p_correo_cliente, 
        id_tpCliente = p_id_tpCliente
        WHERE id_cliente = p_id_registrado; 
        
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el cliente con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Cliente actualizado correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ;


#		MODIFICAR CLASIFICACION
DELIMITER //
create procedure modificar_clasificaciones(
	IN p_id int, 
	IN p_Nuevonombre varchar(40),
	IN p_descripcion varchar(100)
)
BEGIN
	UPDATE clasificacion
    SET nom_clasificacion = p_Nuevonombre,
        desc_clasificacion  = p_descripcion ,
        alta_clasificacion = TRUE
        WHERE id_clasificacion  = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró la clasificación con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Clasificación actualizada correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ;
select * from clasificacion;
Call modificar_clasificaciones(1, "LONA DE VINIL","LONA DE VINIL, EXCLUSIVA PARA CIERTO TIPO DE TRABAJO");
select * from clasificacion;
#	MODIFICAR	SUB---CLASIFICACION

DELIMITER //
create procedure modificar_subclasificaciones(
	IN p_id int, 
	IN p_Nuevonombre varchar(40),
	IN  p_descripcion varchar(100),
    IN p_id_clasificacion int
)
BEGIN
	UPDATE subclasificacion
    SET nom_subclasificacion  = p_Nuevonombre,
        desc_subclasificacion  = p_descripcion,
        alta_subclasificacion = TRUE,
        id_clasificacion = p_id_clasificacion
        WHERE id_subclasificacion  = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró la subclasificación con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Subclasificación actualizada correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 

#		MODIFICAR MATERIAL

DELIMITER //
create procedure modificar_material(
	IN p_id int, 
	IN p_Nuevonombre varchar(40),
	IN p_descripcion varchar(100)
)
BEGIN
	UPDATE material
    SET nom_material = p_Nuevonombre,
        desc_material  = p_descripcion,
        alta_material = TRUE
        WHERE id_material = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el material con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Material actualizado correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 

#		MODIFICAR UNIDAD

DELIMITER //
create procedure mod_unidad(
	IN p_id int, 
	IN p_Nuevonombre varchar(40),
	IN p_descripcion varchar(100)
)
BEGIN
	UPDATE unidad
    SET nom_unidad = p_Nuevonombre,
        desc_unidad  = p_descripcion  
        WHERE id_unidad = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró la unidad con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Unidad actualizada correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 

#MODIFICAR PRODUCTO   
DELIMITER //
create procedure modificar_producto(
	IN p_id int, 
	IN p_id_subclasificacion  INT,
	IN p_id_Material   INT,
	IN p_id_unidad   INT,
    IN p_apl_inst   boolean,
	IN p_precio_sin    float4,
	IN p_precio_con     float4,
    IN p_observaciones  VARCHAR(150),
    IN p_nom_producto varchar(100)
)
BEGIN
	UPDATE producto 
    SET id_subclasificacion  = p_id_subclasificacion,
        id_Material    = p_id_Material  ,
        id_unidad  = p_id_unidad,
        apl_inst  = p_apl_inst,
		precio_sin   = p_precio_sin  ,
        precio_con  = p_precio_con,
        observaciones  = p_observaciones,
        alta_producto = TRUE,
        nombre_prod = p_nom_producto
        WHERE id_producto   = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el producto con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Producto actualizado correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 


#		AGREGAR ACABADO
DELIMITER //
create procedure modificar_acabado(
	IN p_id int, 
	IN p_Nuevonombre varchar(40),
	IN p_descripcion varchar(100)
)
BEGIN
	UPDATE acabado
    SET nom_acabado  = p_Nuevonombre,
        desc_acabado   = p_descripcion  ,
        alta_acabado = TRUE
        WHERE id_acabado  = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el acabado con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Acabado actualizado correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 

#		AGREGAR TIPO DE VENTA
DELIMITER //
create procedure modificar_tipoVenta(
	IN p_id int, 
	IN p_Nuevonombre varchar(40),
	IN p_descripcion varchar(100)
)
BEGIN
	UPDATE tipoVenta
    SET nom_tpVenta = p_Nuevonombre,
        desc_tpVenta  = p_descripcion,
        alta_tpVenta = TRUE
        WHERE id_tpVenta  = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el tipo de venta con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Tipo de Venta actualizado correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 

#		AGREGAR PROCESOS
DELIMITER //
create procedure modificar_proceso(
	IN p_id int, 
	IN p_Nuevonombre varchar(40),
	IN p_descripcion varchar(100)
)
BEGIN
	UPDATE proceso
    SET nom_proceso  = p_Nuevonombre,
        desc_proceso = p_descripcion ,
        alta_proceso = TRUE
        WHERE id_proceso  = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el proceso con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Proceso actualizado correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 

#		AGREGAR TIPO DE PAGO
DELIMITER //
create procedure modificar_tipoPago(
	IN p_id int, 
	IN p_Nuevonombre varchar(40),
	IN p_descripcion varchar(100)
)
BEGIN
	UPDATE tipoPago
    SET nom_tpPago = p_Nuevonombre,
        desc_tpPago   = p_descripcion,
        alta_tpPago  = TRUE
        WHERE id_tpPago   = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el tipo de pago con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Tipo de Pago actualizado correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 

#		AGREGAR FORMA DE PAGO
DELIMITER //
create procedure modificar_formaPago(
	IN p_id int, 
	IN p_Nuevonombre varchar(40),
	IN p_descripcion varchar(100)
)
BEGIN
	UPDATE formaPago
    SET nom_fmPago = p_Nuevonombre,
        desc_fmPago   = p_descripcion  ,
        alta_fmPago = TRUE
        WHERE id_fmPago = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró la forma de pago con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Forma de Pago actualizada correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 


#		AGREGAR ESTATUS DE COBRANZA
DELIMITER //
create procedure modificar_estCobranza(
	IN p_id int, 
	IN p_Nuevonombre varchar(40),
	IN p_descripcion varchar(100)
)
BEGIN
	UPDATE estatusCobranza
    SET nom_estCobranza  = p_Nuevonombre,
        desc_estCobranza  = p_descripcion,
        alta_estCobranza = TRUE
        WHERE id_estCobranza         = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el estatus cobranza con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Estatus Cobranza actualizado correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 


#AGREGAR COTIZACION 

DELIMITER //
create procedure modificar_cotizaciones(
    IN p_id_registrado INT,
    IN p_id_cliente  INT,
    IN p_id_tpVenta  INT,
    IN p_subTotal  INT,
    IN p_iva INT,
    IN p_total  INT,
    IN p_fechaVigencia  date,
    IN p_factura  BOOLEAN,
    IN p_personal  VARCHAR(50),
    IN p_observacion  VARCHAR(400),
    IN p_fechaEmision date,
    IN p_correo_pers varchar(50)
)
BEGIN
    UPDATE cotizacion
    SET id_cliente = p_id_cliente, 
        id_tpVenta = p_id_tpVenta, 
        subTotal = p_subTotal, 
        iva = p_iva, 
        total = p_total, 
        fechaVigencia = p_fechaVigencia, 
        estatus = FALSE, 
        factura = p_factura, 
        personal = p_personal, 
        observacion = p_observacion, 
        eliminacion = FALSE,
        fechaEmision =p_fechaEmision,
        correo_pers = p_correo_pers
        WHERE id_cotizacion = p_id_registrado;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró la cotizacion con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Cotizacion actualizada correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ;

