CLASS zcl_ejemplodani_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejemplodani_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data lv_edad type i value 5.

" ofrecer descuento de un 10% a personas entre los 1 -12 años, descuento de del 5% a personas entre 12 - 18 , precio normal a personas entre 18-65
" descuento del 5% a personas mayores de 65.






data lv_peso type p LENGTH 8 DECIMALS 2 value 0.
data lv_zona type string value 'T'.
data lv_tipo_cliente type string value 'Normal'. " normal premium
data lv_urgente type i VALUE 1. " 1 o 0
data lv_peligroso type i VALUE 1. " 1 o 0

DATA lv_coste type  p LENGTH 8 DECIMALS 2.
DATA lv_codigo type string.

DATA lv_coste_extra type i.
data lv_comdin type p LENGTH 8 DECIMALS 2.



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





if  lv_zona <> 'A' AND lv_zona <> 'B' AND lv_zona <> 'C'.

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

    if  lv_peligroso = 1  .


       lv_codigo = 'PELIGROSO_ZONA_C'.
       lv_coste = 0.
    else.

       if lv_urgente = 1 .

            lv_coste = 15 + 30.
       else.
            lv_coste = 15.

       endif.

      lv_coste = lv_coste * '1.4'.

     endif.




      if lv_tipo_cliente = 'Premium'.

               if  lv_peligroso = abap_true or lv_coste > 200.

                     "NOOO se aplica aplica descuento

               else.

                         lv_coste = lv_coste * '0.8'.

               endif.

        endif.

ENDIF.



if lv_coste < 10  .

  if lv_codigo = 'PELIGROSO_ZONA_C' or lv_codigo =  'PESO INVALIDO'.
     lv_coste = 0.

  else.
    lv_comdin = 10 - lv_coste.
    lv_coste = lv_coste + lv_comdin.

    "lv_coste = 10.

   ENDIF.
endif.


" si lv_peligros = peligroso -> se hace el 40%
" en caso de lv_peligros -> NOOO sea peligros no se hacer el 40%
" si lv_peligros = ES peligros y ademas C es un evio prohibido ev_codigo = 'PELIGROSO_ZONA_C', ev_coste = 0.














*types: BEGIN OF ty_cliente,
*       nombre TYPE string,
*       edad TYPE i,
*       telefono TYPE string,
*       correo TYPE string,
*
*END of TY_cliente.
*
*DATA ls_cliente TYPE ty_cliente.
*
*if lv_nombre = 'daniel'.
*
*    ls_cliente-nombre = 'Daniel'.
*    ls_cliente-edad = 44.
*    ls_cliente-telefono = '+526885555'.
*    ls_cliente-correo = '@@@'.
*
*    lv_nombre = 'juan'.
*
*ENDIF.
*
*
*out->write( ls_cliente ).
*
*
*if lv_nombre = 'juan'.
*
*    ls_cliente-nombre = 'Juan'.
*    ls_cliente-edad = 54.
*    ls_cliente-telefono = '+5268ads85555'.
*    ls_cliente-correo = '@@@'.
*
*ENDIF.
*
*out->write( ls_cliente ).

  ENDMETHOD.

ENDCLASS.


