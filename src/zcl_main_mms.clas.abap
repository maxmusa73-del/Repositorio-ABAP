CLASS zcl_main_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_main_mms IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA lt_accion type i value 4.
    DATA(lo_employee) = new zcl_creadora_mms(
        iv_nombre = 'Natalia'
        iv_apellido = 'Ruiz'
        iv_telefono = '666555777'
        iv_experiencia = 4
        iv_certificaciones = 2
    ).

    case lt_accion.
      when 1.
        out->write( lo_employee->alta_empleado(  ) ).
      when 2.
        out->write( lo_employee->modificacion(  iv_nombre = 'Marcos'
                                                iv_apellido = 'Ruiz'
                                                iv_telefono = '666555777'
                                                iv_experiencia = 4
                                                iv_certificaciones = 2
                                                iv_id_empleado = 999 ) ).
      when 3.
        out->write( lo_employee->traer_lt( iv_id_empleado = 0 ) ).
      when 4.
        out->write( lo_employee->traer_n_filas( iv_n_filas = 2 ) ).

    ENDCASE.
  ENDMETHOD.
ENDCLASS.
