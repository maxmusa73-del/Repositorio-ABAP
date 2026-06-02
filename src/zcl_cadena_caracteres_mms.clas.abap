CLASS zcl_cadena_caracteres_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cadena_caracteres_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data(lv_num) = strlen( 'luis angel' ). "esto cuenta las letras y espacios.

*        out->write( lv_num ).

*  lv_num = numofchar( ' daniel ' ). "cuenta las letras y los espacios
*
*        out->write( lv_num ).

  DATA lv_var TYPE string VALUE 'experpentismo'.

        lv_num = count( val = lv_var sub = 'ex' )."devuelve el nº de veces que aparece "ex".

*        out->write( lv_num ).


  lv_num = count_any_of( val = lv_var sub = 'ex' )."count_any_of "devuelve nº caracteres donde aparece "ex"
*  y cuenta lo  que no sea "ex".

*        out->write( lv_num ).

  lv_num = count_any_not_of( val = lv_var sub = 'ex' )."cuenta lo que no sea "ex" sin discriminar
*  mayusculas/minusculas incluidos espacios en blanco.
*      out->write( lv_num ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "FIND.
  lv_num = find( val = lv_var sub = 'is' ).

        out->write( lv_num ).


 lv_num  = find_any_of( val = lv_var sub = 'is' ). "find_any_of  devuelve la posicion en que esta la i y la s

        out->write( lv_num ).

lv_num  = find_any_not_of( val = lv_var sub = 'is' ). "devuelve todo lo que no sea is.

        out->write( lv_num ).

        data(lv_ejemplo) = 'experpentismento'.













  ENDMETHOD.
ENDCLASS.
