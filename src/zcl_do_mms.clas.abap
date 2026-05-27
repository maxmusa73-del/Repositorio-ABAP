CLASS zcl_do_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_do_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data lv_random type i.

  lv_random = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )

             min = 1
  max = 15 )->get_next( ).





*  data lv_num type i value 0.
*
*  do 5 times.
*
*  out->write( 'lv_num' ). "repite hola 5 veces
*  lv_num =lv_num + 1.
*  exit.
*  enddo.
*  out->write( 'fin de programa' ).

  ENDMETHOD.
ENDCLASS.
