CLASS zcl_estructura_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_estructura_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  types:BEGIN Of ty_persona,
        nombre type ZDE_NOMBRE_MMS,
        edad type ZDE_EDAD_MMS,
        correo type ZDE_CORREO_MMS,
        telefono type ZDE_TELEFONO_MMS,
  END of ty_persona.



   data(lv_var) = 'y'.
  DATA ls_persona type ty_persona.

  "ls_persona-correo = 'jdfjlkf'.




  ls_persona = value #( correo = 'daniel@gmail.com'
                        edad = 23
                        nombre = 'Daniel'
                        telefono = '456 345 345' ). " declaraciones en línea, #->el tipo ha sido declarado previamente
" si no está declarado el tipo previamente, entonces se pone directamente:
" ls_persona = value ty_persona (.....)



    out->write( ls_persona ).


  ENDMETHOD.
ENDCLASS.
