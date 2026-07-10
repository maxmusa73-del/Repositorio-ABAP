CLASS zcl_granadatur_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_granadatur_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_experiencia) = NEW zcl_experiencia_mms( i_nombre = 'Visita Granada Centro'
                                                    i_precio = '12.75'
                                                    i_duracion = 60
                                                    i_num_participantes = 15 ).
*    esto es una forma de ponerlo:
*    DATA(lv_total) = lo_experiencia->calcular_precio(  ).
*    out->write( lv_total ).

*    y así se pondría en una línea directamente:
    out->write( 'Primera línea' ).
    out->write( ' ' ).
    out->write( 'Segunda línea' ).
    out->write( '==== GRANADA TOUR ====' ).

    out->write( |--------------------------------------| ).


    out->write( | El precio es {  lo_experiencia->calcular_precio( ) } | ).

    DATA lv_precio_base TYPE zdecimal2_25.
    lo_experiencia->get_precio_base( IMPORTING o_precio = lv_precio_base ).

    out->write( | El precio base es { lv_precio_base } | ).

    out->write( |================================| ).


    DATA(lo_monumento) = NEW zcl_visita_monumento_mms( i_nombre = 'Visita'
                                                       i_precio = '20'
                                                       i_duracion = 45
                                                       i_num_participantes = 25
                                                       i_monumento = 'La Alhambra'
                                                       i_reserva = abap_false ).

    DATA(lv_total) = lo_monumento->calcular_precio(  ).
    out->write( '' ).
    out->write( | VISITA A MONUMENTO | ).
    out->write( lo_monumento->get_datos( ) ).
    out->write( | El precio es { lv_total } | ).
    IF lo_monumento->reserva = abap_true.
      out->write( | El monumento { lo_monumento->monumento } tiene reserva obligatoria | ).
    ENDIF.

    out->write( |================================| ).


    DATA(lo_ruta_gastro) = NEW zcl_ruta_gastronomica_mms( i_nombre = 'Tapas en Granada'
                                                           i_precio = '23.75'
                                                           i_duracion = 45
                                                           i_num_participantes = 10
                                                           i_num_tapas = 5
                                                           i_nocturno = abap_false ).

    lv_total = lo_ruta_gastro->calcular_precio( ).
    out->write( '' ).
    out->write( | VISITA GASTRONOMICA | ).
    out->write( lo_ruta_gastro->get_datos( ) ).
    out->write( | El precio es { lv_total } | ).
    out->write( |================================| ).
    IF lo_ruta_gastro->nocturno = abap_true.
      out->write( | La ruta { lo_ruta_gastro->nombre } es una cena | ).
    ELSE.
      out->write( | La ruta { lo_ruta_gastro->nombre } es un almuerzo | ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
