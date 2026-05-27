CLASS zcl_if_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_if_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.






data lv_peso type p LENGTH 8 DECIMALS 2 value 0.
data lv_zona type string value 'T'. " A , B , C
data lv_tipo_cliente type string value 'Normal'. " normal premium
data lv_urgente type i VALUE 1. " 1 o 0
data lv_peligroso type i VALUE 0. " 1 o 0

DATA lv_coste type  p LENGTH 8 DECIMALS 2.
DATA lv_codigo type string.

DATA lv_coste_extra type i.







if lv_peso <= 0.

    lv_codigo = 'PESO INVALIDO'.
    lv_coste = 0.


elseif lv_peso <= 5.

         lv_coste = 5.

elseif lv_peso > 5 and lv_peso <= 20.

         lv_coste = 20.

elseif lv_peso > 20 and lv_peso <= 50.

         lv_coste = 25.
else.

        lv_coste_extra = lv_peso - 50.
        lv_coste = 25 + lv_coste_extra.

endif.
out->write( lv_coste ).






if lv_zona <> 'A' or lv_zona <> 'B' or lv_zona <> 'C'.

    lv_coste = 0.
    lv_codigo = 'PESO INVALIDO'.



   elseif lv_zona = 'A'.
       if lv_urgente = 1 .
            lv_coste = 0 * '1.5'.
       else.
            lv_coste = 0.

       endif.

   elseif lv_zona = 'B'.

        if lv_urgente = 1 .
            lv_coste = 8 * '1.5'.
        else.
            lv_coste = 8.
        endif.

   ELSEif lv_zona = 'C' .

       if lv_urgente = 1 .

            lv_coste = 15 + 30.
       else.
            lv_coste = 15.

       endif.
 endif.


*if lv_tipo_cliente = 'PREMIUM'.
*
*
*if lv_peligroso = 1.
*
*    lv_coste = lv_coste + lv_coste * 20 / 100.
*
*endif.
*out->write(  )
*if lv_coste > 200.
*
*    lv_coste = lv_coste + lv_coste * 20 / 100.
*
*endif.

*out->write( lv_coste ).


if lv_tipo_cliente = 'PREMIUM'.

if lv_peligroso = abap_true or lv_coste > 200.

"no se aplica el descuento
else.

 "se aplica el descuento
endif.


if lv_peligroso = abap_true.

    lv_coste = Lv_coste * '1.4'.

    out->write( 'RECARGO DEL 40%' ).

endif.

if lv_peligroso = abap_true and lv_zona = 'C'.

    lv_coste = 0.

    out->write( 'PELIGRO ZONA C' ).


ENDIF.


ENDIF.

  ENDMETHOD.
ENDCLASS.


