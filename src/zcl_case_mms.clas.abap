CLASS zcl_case_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_case_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  data lv_edad type i value 20.
  data lv_nombre type string value 'Daniel'.
data lv_pelo type string value 'moreno'.
  "Hay 20 niños en la clase, 4 niños se llaman Daniel, Daniel 8 -> Ricardo, 6-> Pedro, 5-> Fernando, 9-> Luis

  "if lv_edad = 8
if lv_nombre = 'Daniel'.

  case lv_edad.


    when 8.

    if lv_pelo = 'castaño'.
    out->write( 'el padre es Ricardo' ).
    else.
    out->write( 'el padre es Gonzalo' ).
    endif.

    when 6.
     out->write( 'el padre es Pedro' ).
    when 5.
     out->write( 'el padre es Fernando' ).
    when 9.
   out->write( 'el padre es Luis' ).
   when others.
    out->write( 'el padre no es ni Luis, ni Ricardo, ni Pedro, ni Fernando' ).


  endcase.



  else.

  out->write( 'no es ningún niño que se llame Daniel').

  endif.
  ENDMETHOD.
ENDCLASS.
