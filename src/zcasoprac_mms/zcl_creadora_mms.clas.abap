CLASS zcl_creadora_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES tty_emp TYPE TABLE OF ztab_eje_obj_mms WITH EMPTY KEY.

    METHODS  constructor
      IMPORTING
        iv_nombre          TYPE zde_nombreapell_mms
        iv_apellido        TYPE zde_nombreapell_mms
        iv_telefono        TYPE zde_tele_mms
        iv_experiencia     TYPE i
        iv_certificaciones TYPE i.

    METHODS:
      modificacion
        IMPORTING
                  iv_nombre          TYPE zde_nombreapell_mms
                  iv_apellido        TYPE zde_nombreapell_mms
                  iv_telefono        TYPE zde_tele_mms
                  iv_experiencia     TYPE i
                  iv_id_empleado     TYPE i
                  iv_certificaciones TYPE i
        RETURNING VALUE(rv_mensaje)  TYPE string,
      alta_empleado
        RETURNING VALUE(rv_mensaje) TYPE string,
      calcular_sueldo,
      ex_id_empleado,
      traer_n_filas
        IMPORTING
                  iv_n_filas      TYPE i
        RETURNING VALUE(rv_tabla) TYPE tty_emp,
      traer_lt
        IMPORTING
                  iv_id_empleado  TYPE i
        RETURNING VALUE(rv_tabla) TYPE tty_emp.


  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: lt_registro     TYPE tty_emp,
          ls_prueba       TYPE ztab_eje_obj_mms,
          experiencia     TYPE i,
          id_empleado     TYPE i,
          certificaciones TYPE i,
          iv_Nombre       TYPE string.

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
    IF sy-subrc = 0.
      me->ls_prueba-id_empleado = id_maximo + 1.
    ELSE.
      me->ls_prueba-id_empleado = 1.
    ENDIF.

  ENDMETHOD.

  METHOD alta_empleado.
    calcular_sueldo( ).
    IF me->id_empleado IS NOT INITIAL.
      me->ls_prueba-id_empleado = me->id_empleado.
    ELSE.
      ex_id_empleado( ).
    ENDIF.
    MODIFY ztab_eje_obj_mms FROM @me->ls_prueba.
    IF sy-subrc = 0.
      COMMIT WORK.
      rv_mensaje = 'Subida correcta'.
    ELSE.
      rv_mensaje = 'Error en la subida'.
    ENDIF.

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
    IF sy-subrc = 0.
      alta_empleado(  ).
    ELSE.
      rv_mensaje = 'El ID no existe en la base de datos, no se ha podido hacer la modificación'.
    ENDIF.

  ENDMETHOD.

  METHOD traer_lt.

    IF iv_id_empleado = 0.
      SELECT * FROM ztab_eje_obj_mms ORDER BY id_empleado INTO TABLE @DATA(lt_registro).
    ELSE.
      SELECT * FROM ztab_eje_obj_mms WHERE id_empleado = @iv_id_empleado INTO TABLE @lt_registro.
    ENDIF.
    CLEAR rv_tabla.
    rv_tabla = lt_registro.

  ENDMETHOD.

  METHOD traer_n_filas.
    SELECT * FROM ztab_eje_obj_mms ORDER BY id_empleado INTO TABLE @rv_tabla UP TO @iv_n_filas ROWS.
  ENDMETHOD.

ENDCLASS.
