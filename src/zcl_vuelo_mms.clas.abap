CLASS zcl_vuelo_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_vuelo_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    data: lt_bukrs type standard TABLE OF zbd_empleado_mms,
          ls_bukrs type zbd_empleado_mms.

types: BEGIN OF ty_mios,
         nombre type zbd_empleado_mms-nombre,
         calle(40) type c,
       end of ty_mios.


    data: lt_mios type standard TABLE OF ty_mios,
          ls_mios type ty_mios.


*    SELECT FROM t001 FIELDS bukrs INTO @data(ls_bukrs).
    select  nombre, correo
      from zbd_empleado_mms
      into CORRESPONDING FIELDS OF table @lt_bukrs package size 10000.

         loop at lt_bukrs into ls_bukrs.
               if ls_bukrs-nombre(1) = 'D'.
                     move-CORRESPONDING ls_bukrs to ls_mios.
                     append ls_mios to lt_mios.
               endif.
         endloop.

    ENDSELECT.

    loop at lt_mios into ls_mios.


    endloop.

    data: ls_alumn type zbd_alumnos_mms.

    select COUNT(*) from zbd_empleado_mms into @data(lv_contar). " cuenta el numero de registros de la tabla
    select max( registro_id ) from zbd_alumnos_mms into @data(lv_maximo_id). " devuelve el registro más alto de la tabla.
    ls_alumn-registro_id = lv_maximo_id + 1.
    ls_alumn-nombre = 'Juan'.
    insert zbd_alumnos_mms from @ls_alumn.


*    out->write( lv_contar ).

  ENDMETHOD.
ENDCLASS.
