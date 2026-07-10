CLASS zcl_guia_turistica_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_guia_turistica_mms IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "Objeto de la interfaz:
    DATA lo_negocio TYPE REF TO zif_negocio_sanlucar_mms.
    DATA lt_negocio TYPE TABLE OF REF TO zif_negocio_sanlucar_mms.

    lo_negocio = NEW zcl_bodega_sanlucar_mms(
                                             i_nombre = 'Bodega de Maxi'
                                             i_descripcion = 'La mejor' ).

    APPEND lo_negocio TO lt_negocio.

    lo_negocio = NEW zcl_marisqueria_sanlucar_mms(
                                                  i_nombre = 'Mariscos Maxi'
                                                  i_descripcion = 'Buenos mariscos' ).
    APPEND lo_negocio TO lt_negocio.

    LOOP AT lt_negocio INTO lo_negocio.
      out->write( |[{ lo_negocio->get_tipo( ) }] { lo_negocio->get_nombre(  ) } — {
      lo_negocio->get_descripcion(  ) } (Precio: { lo_negocio->calcular_precio(  ) } €) | ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
