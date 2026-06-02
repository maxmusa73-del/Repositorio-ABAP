CLASS zcl_global_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  TYPES tty_emp type TABLE of zbd_usuario_mms.

    METHODS constructor
        IMPORTING
            iv_nombre type zbd_usuario_mms-nombre "sustituir el string por el elemento de datos
            iv_apellido type zbd_usuario_mms-apellido "sustituir el string por el elemento de datos
            iv_telefono type zbd_usuario_mms-telefono
            iv_experiencia type i
            iv_certificaciones type i.
    METHODS calcular_sueldo.
    METHODS id_empleado.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: lv_experiencia type i,
          lv_nombre type string,
          lv_apellido type string,
          lv_certificaciones type i,
          lv_telefono type i,
          lv_sueldo type i.



ENDCLASS.



CLASS zcl_global_mms IMPLEMENTATION.



METHOD constructor.

ENDMETHOD.

METHOD calcular_sueldo.

    DATA: lv_sueldo type i.

    lv_sueldo = 1000 + ( lv_certificaciones * 50 ) + ( lv_experiencia * 100 ).

    lv_sueldo = lv_sueldo.

ENDMETHOD.

METHOD id_empleado.

ENDMETHOD.



ENDCLASS.
