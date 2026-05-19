CLASS zcl_ejemplo_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejemplo_mms IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.

DATA lv_edad TYPE i VALUE 25.

OUT->write( lv_edad ).

lv_edad = 20.

out->write( lv_edad ).



  ENDMETHOD.

ENDCLASS.
