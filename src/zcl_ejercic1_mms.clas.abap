CLASS zcl_ejercic1_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejercic1_mms IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.


*  DELETE from ZBD_EJERCIC1_MMS.

MODIFY ZBD_EJERCIC1_MMS from table @(
        value #(

        ( client = '100'
        correo = 'daniel@com'
        nombre = 'Daniel'
        edad = 18
        telefono = '66666666' )


        ( client = '100'
        correo = 'julia@com'
        nombre = 'Julia'
        edad = 40
        telefono = '777777777' )

        ( client = '100'
        correo = 'marcos@com'
        nombre = 'Marcos'
        edad = 43
        telefono = '777777777' )


        ( client = '100'
        correo = 'alejandro@com'
        nombre = 'Alejandro'
        edad = 18
        telefono = '33333333' )


)
).

SELECT * FROM zbd_ejercic1_mms INTO TABLE @DATA(lt_empleados).
  out->write( lt_empleados ).


  ENDMETHOD.
ENDCLASS.
