CLASS zcl_estruc2_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_estruc2_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  types:BEGIN OF ty_cliente, " primero hay que crear el tipo
    nombre type string,
    edad type i,
    telefono type string,
    correo type string,
    END of ty_cliente.

DATA ls_cliente type ty_cliente. " después creamos la estructura

ls_cliente-nombre = 'Daniel'.
ls_cliente-edad = 44.
ls_cliente-telefono = '+34 34567888'.
ls_cliente-correo = 'daniel@gmail.com'.

out->write( ls_cliente ).


ls_cliente-nombre = 'Alejandro'.
ls_cliente-edad = 30.
ls_cliente-telefono = '+34 34567778'.
ls_cliente-correo = 'alejandro@gmail.com'.

out->write( ls_cliente ).

ls_cliente-nombre = 'Tere'.
ls_cliente-edad = 18.
ls_cliente-telefono = '+34 34737888'.
ls_cliente-correo = 'tere@gmail.com'.

out->write( ls_cliente ).

ls_cliente-nombre = 'Maria'.
ls_cliente-edad = 18.
ls_cliente-telefono = '+34 34562388'.
ls_cliente-correo = 'maria@gmail.com'.

out->write( ls_cliente ).





  ENDMETHOD.
ENDCLASS.
