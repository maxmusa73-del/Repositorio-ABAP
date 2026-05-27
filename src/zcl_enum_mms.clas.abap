CLASS zcl_enum_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_enum_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  types: BEGIN OF enum ty_color,

        rojo,
        verde,
        azul,

        end of enum ty_color.

  DATA lv_color type ty_color.

  lv_color = rojo. " -> no pasa nada

  " lv_color = amarillo. -> me da un fallo, hay que ponerlo arriba el amarillo en las opciones debajo de azul.

  """"""""""""""""""""""""""""""""""""""""""""""""""""""
  types: BEGIN OF enum ty_vuelos,

            nacional, " vuelos dentro de tu mismo país
            internacional, " vuelos entre países
            charter, " vuelo especial/privado

  end of enum ty_vuelos.



  DATA lv_vuelo type ty_vuelos.

  lv_vuelo = internacional.



  case lv_vuelo.

        when nacional.
            out->write( 'vuelos dentro de tu mismo país' ).
        when internacional.
            out->write( 'vuelos entre países' ).
        when charter.
            out->write( 'vuelo especial/privado' ).

  endcase.



  ENDMETHOD.
ENDCLASS.
