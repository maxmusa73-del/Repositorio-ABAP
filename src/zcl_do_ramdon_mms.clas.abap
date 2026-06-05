CLASS zcl_do_ramdon_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_do_ramdon_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

DATA lv_alumno type string.




  data lv_random type i.

  lv_random = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )

             min = 1

             max = 15 )->get_next( ).





*dos Danieles con 8:

data lv_num type i value 0.

  do 5 times.

  out->write( 'Daniel' ). "repite hola 5 veces si no ponemos el EXIT.

  lv_num = lv_num + 1.

  exit. " si ponemos el EXIT al final se para cuando lo hace una vez, no repite 5 veces

  enddo.

  out->write( 'Sólo hay un Daniel' ).
  out->write( space ).
  out->write( 'Fin de programa' ).

  ENDMETHOD.
ENDCLASS.
