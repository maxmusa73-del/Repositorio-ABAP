CLASS zcl_creadora_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  TYPES TTY_EMP type TABLE of ztab_eje_obj_mms WITH EMPTY KEY.

   METHODS  constructor
              IMPORTING
                iv_nombre type ZDE_NOMBREAPELL_MMS
                iv_apellido type ZDE_NOMBREAPELL_MMS
                iv_telefono type ZDE_TELE_MMS
                iv_experiencia type i
                iv_certificaciones type i.
   METHODS: calcular_sueldo,
            ex_id_empleado,
            alta_empleado
              RETURNING VALUE(rv_mensaje) type string,
            modificacion
              IMPORTING
                iv_nombre type ZDE_NOMBREAPELL_MMS
                iv_apellido type ZDE_NOMBREAPELL_MMS
                iv_telefono type ZDE_TELE_MMS
                iv_experiencia type i
                iv_certificaciones type i
                iv_id_empleado type i
              RETURNING VALUE(rv_mensaje) type string,
            traer_lt
              IMPORTING
                iv_id_empleado TYPE i
              RETURNING VALUE(rv_tabla) TYPE tty_emp,
            traer_n_filas
              IMPORTING
                iv_n_filas TYPE i
              RETURNING VALUE(rv_tabla) TYPE tty_emp.

  PROTECTED SECTION.
  PRIVATE SECTION.

  DATA: lt_registro type tty_emp,
        ls_prueba type ztab_eje_obj_mms,
        experiencia type i,
        id_empleado type i,
        certificaciones type i.

ENDCLASS.

CLASS zcl_creadora_mms IMPLEMENTATION.

  METHOD constructor.
     me->ls_prueba-nombre = iv_nombre.
     me->ls_prueba-apellido = iv_apellido.
     me->ls_prueba-telefono = iv_telefono.
     me->experiencia = iv_experiencia.
     me->certificaciones = iv_certificaciones.
     me->ls_prueba-currency_code = 'EUR'.
  ENDMETHOD.

  METHOD calcular_sueldo.
    me->ls_prueba-sueldo = ( me->certificaciones * 50 + me->experiencia * 100 ) + 1000.
  ENDMETHOD.

  METHOD ex_id_empleado.

    SELECT MAX( id_empleado ) FROM ztab_eje_obj_mms INTO @DATA(id_maximo).
    if sy-subrc = 0.
      me->ls_prueba-id_empleado = id_maximo + 1.
    else.
      me->ls_prueba-id_empleado = 1.
    endif.

  ENDMETHOD.

  METHOD alta_empleado.
    calcular_sueldo( ).
    IF me->id_empleado is not INITIAL.
      me->ls_prueba-id_empleado = me->id_empleado.
    ELSE.
      ex_id_empleado( ).
    ENDIF.
    MODIFY ztab_eje_obj_mms FROM @me->ls_prueba.
    if sy-subrc = 0.
      COMMIT WORK.
      rv_mensaje = 'Subida correcta'.
    else.
      rv_mensaje = 'Error en la subida'.
    endif.

  ENDMETHOD.

  METHOD modificacion.
    me->ls_prueba-nombre = iv_nombre.
    me->ls_prueba-apellido = iv_apellido.
    me->ls_prueba-telefono = iv_telefono.
    me->experiencia = iv_experiencia.
    me->certificaciones = iv_certificaciones.
    me->ls_prueba-currency_code = 'EUR'.
    me->id_empleado = iv_id_empleado.

    SELECT SINGLE @abap_true FROM ztab_eje_obj_mms
           WHERE id_empleado = @me->id_empleado INTO @DATA(lv_existe).
    if sy-subrc = 0.
        alta_empleado(  ).
    else.
        rv_mensaje = 'El ID no existe en la base de datos, no se ha podido hacer la modificación'.
    endif.

  ENDMETHOD.

  METHOD traer_lt.

    if iv_id_empleado = 0.
      SELECT * FROM ztab_eje_obj_mms ORDER BY id_empleado INTO TABLE @data(lt_registro).
    else.
      SELECT * FROM ztab_eje_obj_mms WHERE id_empleado = @iv_id_empleado INTO TABLE @lt_registro.
    endif.
    clear rv_tabla.
    rv_tabla = lt_registro.

  ENDMETHOD.

  METHOD traer_n_filas.
    SELECT * FROM ztab_eje_obj_mms ORDER BY id_empleado INTO TABLE @rv_tabla up to @iv_n_filas rows.
  ENDMETHOD.

ENDCLASS.
