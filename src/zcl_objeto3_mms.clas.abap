CLASS zcl_objeto3_mms DEFINITION " ESTA ES LA CLASE PARA PROGRAMAR LA FÁBRICA zcl_objeto2_mms
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_objeto3_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

     DATA(lo_contrato) = NEW zcl_objeto2_mms( ). " creamos o declaremos un objeto. no olvidarse de los paréntesis
     DATA lv_proceso type string.



    if lo_contrato is bound.

         lo_contrato->set_cliente(

            EXPORTING
                iv_cliente = 'Experis'
                iv_localizacion = 'calle X' " también se puede poner iv_localizacion = space

            IMPORTING
                ev_status = DATA(lv_status)

            CHANGING
                cv_proceso = lv_proceso

          ).

            lo_contrato->get_cliente(

                IMPORTING ev_cliente = DATA(lv_cliente)
            ).

            lo_contrato->lv_region = 'EU'.

        ENDIF.

        out->write( | { lv_cliente }-{ lv_status }-{ lv_proceso }-{ lo_contrato->lv_region } | ).

  ENDMETHOD.
ENDCLASS.
