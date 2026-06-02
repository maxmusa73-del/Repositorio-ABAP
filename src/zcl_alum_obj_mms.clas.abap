CLASS zcl_alum_obj_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_alum_obj_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA(lo_alumno) = NEW zcl_alum_fabr_mms(  ).

*   DELETE FROM ztb_alumnos.

If lo_alumno is bound.
*lo_alumno->cargardegolpe_alumnos(  ).
"LO_ALUMNO->lv_alumno = 'DANIEL'.
lo_alumno->entrada_alumno(  ).

out->write( lo_alumno->random(  ) ).
endif.
*    LOOP AT lt_nombres INTO DATA(lv_nombre).
*      " nº de registros actuales en la BD
*      SELECT COUNT(*) FROM ztb_alumnos INTO @DATA(lv_count). " el select count(*)  "pregunta" a la bd cuantos registros hay ahora mismo
*      " id del nuevo registro = nº de registros + 1
*      lv_id = lv_count + 1.
*      " insertar
*      INSERT ztb_alumnos FROM @( VALUE #( id     = lv_id
*                                          nombre = lv_nombre ) ).    " graba la fila . la @ antes del valor marca que es una variable de ABAP que entra en una
*                                                                     " sentencia SQL ( esto es obligatorio en la sintaxis moderna )
*    ENDLOOP.
*
*    out->write( |--- PARTE 1a: TABLA DE BASE DE DATOS (ztb_alumnos) ---| ).
*    SELECT id, nombre FROM ztb_alumnos ORDER BY id INTO TABLE @DATA(lt_bd).
*    LOOP AT lt_bd INTO DATA(ls_bd).
*      out->write( |{ ls_bd-id WIDTH = 3 }  { ls_bd-nombre }| ).
*    ENDLOOP.
*    out->write( || ).

*
*
*   DELETE FROM ZBD_ALUMNOS_MMS.
*SELECT MAX( registro_id ) FROM ZBD_ALUMNOS_MMS INTO @lv_registro_id.
* LOOP AT lt_alumnos INTO DATA(lv_nombre).
*      lv_registro_id = lv_registro_id + 1.
*      INSERT INTO ZBD_ALUMNOS_MMS VALUES @( VALUE #( registro_id = lv_registro_id nombre = lv_nombre ) ).
*
*    ENDLOOP.
*    COMMIT WORK.
*
*    out->write( |--- PARTE 1a: TABLA DE BASE DE DATOS (ztb_alumnos) ---| ).
**    SELECT id, nombre FROM ztb_alumnos ORDER BY id INTO TABLE @DATA(lt_bd).
**    LOOP AT lt_bd INTO DATA(ls_bd).
**      out->write( |{ ls_bd-id WIDTH = 3 }  { ls_bd-nombre }| ).
**    ENDLOOP.
**    out->write( || ).
*
*    rv_resultado = |{ lines( lt_nombres ) } alumnos cargados en la base de datos|.
*



  ENDMETHOD.
ENDCLASS.
