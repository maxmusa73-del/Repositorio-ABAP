CLASS zcl_objeto_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_objeto_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA(lo_bd) = NEW zcl_alum_fabr_mms( ).

"DELETE FROM zdb_alumnos_lbc.
  IF lo_bd IS BOUND.
      lo_bd->cargardegolpe_alumnos(  ).

    "lo_bd->r_individual(  ).

   ENDIF.


  ENDMETHOD.
ENDCLASS.
