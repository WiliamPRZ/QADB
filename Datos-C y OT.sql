

#CALL agg_cotizacion(id_cliente , id_tpVenta , subTotal , iva , total , fechaVigencia  , factura , personal , observacion , correo_pers) ; ## estatus = False y Eliminacion = False, al iniciar la cotizacion ## Regresa el ultimo id registrado 
CALL agg_cotizacion(1 , 3 , 2574.45 , 411.92 , 2986.37 , "2024-12-12"  , false , "Veronica Palazuelos" , "El cliente solicito un diseño para el logo y el fondo del folleto " , "correo@gmail.com") ;

#CALL agg_product_cotizacion( id_cotizacion  ,  id_producto   ,cantidad,  prod_base, prod_altura, precio_Uni , importe  );
CALL agg_product_cotizacion( 1  ,  1   , 2,  3, 5.2, 25 , 780  );
CALL agg_product_cotizacion( 1  ,  1   , 5,  2.50, 3.5, 30 , 1312.5  );
CALL agg_product_cotizacion( 1  ,  1   , 2,  3.5, 2.7, 25.5 , 481.95  );

#CALL agg_proc_cotizacion(  id_cotizacion  ,  id_proceso);
cALL agg_proc_cotizacion(  1  ,  3);
CALL agg_proc_cotizacion(  1  ,  2);

#CALL agg_acab_cotizacion( id_prod_cot  ,  id_acabado);
CALL agg_acab_cotizacion( 1  ,  1);
CALL agg_acab_cotizacion( 1  ,  2);

#CALL agg_ordenTrabajo(  p_id_cotizacion  ,  p_correo_pers    ,p_personal_acep);
CALL agg_ordenTrabajo(  1  ,  "correo@gmail.com"    ,"veronica carrillo");
CALL agg_ordenTrabajo(  1  ,  "correo@gmail.com"    ,"veronica carrillo");

#CALL agg_pagoOrdenTrabajo(  id_ordenTrabajo   ,  id_tpPago     ,id_fmPago , comprobante , fecha_pago , montoPago);
CALL agg_pagoOrdenTrabajo(  1   ,  1     ,1 , "" , "2024-12-30" , 250.6);
CALL agg_pagoOrdenTrabajo(  1  ,  2     ,1 , "" , "2024-12-30" ,  130.5);