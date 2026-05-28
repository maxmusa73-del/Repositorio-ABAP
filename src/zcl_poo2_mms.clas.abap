CLASS zcl_poo2_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_poo2_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA(lo_perro) = new ZCL_POO_MMS(  ).
  DATA(lo_perro2) = new ZCL_POO_MMS(  ).

  IF lo_perro2 is bound.

  lo_perro2->lv_nombre = 'Paco'. " esto es un objeto independiente

  out->write( lo_perro2->lanzar_pelota( ) ).
  out->write( lo_perro2->ladrar( ) ).
     ENDIF.

  IF lo_perro is bound.
  lo_perro->lv_nombre = 'Dante'.
 lo_perro->lv_color = 'negro'.

  out->write( lo_perro->da_salto( ) ).

   out->write( | de  color : { lo_perro->lv_color } | ).
     ENDIF.


  ENDMETHOD.
ENDCLASS.
