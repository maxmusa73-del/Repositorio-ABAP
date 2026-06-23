CLASS zcl_cliente_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

   INTERFACES if_oo_adt_classrun .


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cliente_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*     DELETE from zbd_cliente_mms.
*
*    MODIFY zbd_cliente_mms from table @(
*        value #(
*
*        ( client    = sy-mandt
*          id        = '0001'
*          nombre    = 'Daniel'
*          apellido  = 'Rodríguez'
*          direccion = 'Sevilla, 5'
*          correo    = 'daniel@cliente.com'
*          telefono  = '645398849' )
*
*        ( client    = sy-mandt
*          id        = '0002'
*          nombre    = 'Marcos'
*          apellido  = 'Vázquez'
*          direccion = 'Granada, 8'
*          correo    = 'marcos@cliente.com'
*          telefono  = '645598849' )
*
*        ( client    = sy-mandt
*          id        = '0003'
*          nombre    = 'Ana'
*          apellido  = 'Márquez'
*          direccion = 'Cádiz, 6'
*          correo    = 'ana@cliente.com'
*          telefono  = '645398449' )
*
*
*        ( client    = sy-mandt
*          id        = '0004'
*          nombre    = 'Pedro'
*          apellido  = 'Rosal'
*          direccion = 'Málaga, 1'
*          correo    = 'pedro@cliente.com'
*          telefono  = '625398849' )
*
*        ( client    = sy-mandt
*          id        = '0005'
*          nombre    = 'María'
*          apellido  = 'Díaz'
*          direccion = 'Huelva, 2'
*          correo    = 'maria@cliente.com'
*          telefono  = '645398749' )
*
*        ( client    = sy-mandt
*          id        = '0006'
*          nombre    = 'Beatriz'
*          apellido  = 'López'
*          direccion = 'Jaén, 10'
*          correo    = 'beatriz@cliente.com'
*          telefono  = '645298849' )
*
*     )
*     ).

data ls_new_registro type zbd_cliente_mms.

ls_new_registro = value #( id        = 8
                           nombre    = 'Juan'
                           apellido  = 'García'
                           direccion = 'Madrid, 10'
                           correo    = 'juan@cliente.com'
                           telefono  = '645398849' ).

wait up to 20 seconds.
    MODIFY zbd_cliente_mms from @ls_new_registro.

*
*SELECT * FROM zbd_cliente_mms INTO TABLE @DATA(lt_clientes).
*  out->write( lt_clientes ).
*




  ENDMETHOD.
ENDCLASS.
