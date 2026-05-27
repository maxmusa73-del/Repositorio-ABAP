CLASS zcl_estruc3_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_estruc3_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  types:BEGIN OF ty_persona, " primero hay que crear el tipo
    nombre type string,
    edad type i,
    telefono type string,
    correo type string,
    END of ty_persona.

 DATA(lv_var) = 5.

 DATA(ls_persona) = value ty_persona( correo = 'daniel@gmail.com'
                                      edad = 23
                                      nombre = 'Daniel' ).

DATA ls_persona2 type ty_persona.

ls_persona2 = value ty_persona( correo = 'juan@gmail.com'
                                edad = 56
                                nombre = 'Juan' ).


  out->write( ls_persona ).
  out->write( ls_persona2 ).

  DATA(lv_persona) =
  out->write( ls_persona2-nombre ).

  ENDMETHOD.
ENDCLASS.
