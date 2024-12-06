# 	BORRAR (cambiar el alta de los catalogos)
use QualityDB;

#		BAJA CLASIFICACION
DELIMITER //
create procedure baja_clasificacion(
	IN p_id int
)
BEGIN
	UPDATE clasificacion
    SET  alta_clasificacion = FALSE
        WHERE id_clasificacion  = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró la clasificación con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Clasificación actualizada correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ;
call baja_clasificacion(1);
select * from view_clasificacion;
#	BAJA	SUB---CLASIFICACION

DELIMITER //
create procedure baja_subclasificacion(
	IN p_id int
)
BEGIN
	UPDATE subclasificacion
    SET alta_subclasificacion = FALSE
        WHERE id_subclasificacion  = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró la Subclasificación con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Subclasificación actualizada correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 

#		BAJA MATERIAL

DELIMITER //
create procedure baja_material(
	IN p_id int 
)
BEGIN
	UPDATE material
    SET alta_material = FALSE
        WHERE id_material = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el material con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Material actualizado correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ;

#BAJA PRODUCTO  
DELIMITER //
create procedure baja_producto(
	IN p_id int
)
BEGIN
	UPDATE producto 
    SET  alta_producto = FALSE
        WHERE id_producto   = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el producto con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Producto actualizado correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 


#		BAJA ACABADO
DELIMITER //
create procedure baja_acabado(
	IN p_id int
)
BEGIN
	UPDATE acabado
    SET alta_acabado = FALSE
        WHERE id_acabado  = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el acabado con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Acabado actualizado correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 

#		BAJA TIPO DE VENTA
DELIMITER //
create procedure baja_tipoVenta(
	IN p_id int
)
BEGIN
	UPDATE tipoVenta
    SET alta_tpVenta = FALSE
        WHERE id_tpVenta  = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el tipo de venta con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Tipo de Venta actualizado correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 

#		BAJA PROCESOS
DELIMITER //
create procedure baja_proceso(
	IN p_id int
)
BEGIN
	UPDATE proceso
    SET alta_proceso = FALSE
        WHERE id_proceso  = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el proceso  con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Proceso actualizada correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 

#		BAJA TIPO DE PAGO
DELIMITER //
create procedure baja_tipoPago(
	IN p_id int
)
BEGIN
	UPDATE tipoPago
    SET alta_tpPago  = FALSE
        WHERE id_tpPago   = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el tipo de pago con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Tipo de pago actualizado correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 

#		BAJA FORMA DE PAGO
DELIMITER //
create procedure baja_formaPago(
	IN p_id int
)
BEGIN
	UPDATE formaPago
    SET alta_fmPago =FALSE
        WHERE id_fmPago = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró la forma de pago con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Forma de Pago actualizada correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 


#		BAJA ESTATUS DE COBRANZA
DELIMITER //
create procedure baja_estCobranza(
	IN p_id int
)
BEGIN
	UPDATE estatusCobranza
    SET alta_estCobranza = FALSE
        WHERE id_estCobranza         = p_id;  
    -- Opcional: Verifica si se actualizó algún registro
    IF ROW_COUNT() = 0 THEN
        SELECT 'No se encontró el estatus de cobranza con el ID proporcionado.' AS mensaje;
    ELSE
        SELECT 'Estatus de Cobranza actualizada correctamente.' AS mensaje;
    END IF;
END //
DELIMITER ; 
