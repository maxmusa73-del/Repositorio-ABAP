CLASS zcl_acreditado_mms DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: nombre_completo   TYPE string,
          pais              TYPE string,
          fecha             TYPE d.

    METHODS:

      constructor IMPORTING i_nombre            TYPE string
                            i_pais              TYPE string
                            i_fecha             TYPE d
                            i_num               TYPE string,

      get_num_acreditacion
      RETURNING VALUE(rv_num) type string,

      describir_pase
        RETURNING VALUE(rv_texto) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA:
      num_acreditacion   TYPE string.

ENDCLASS.



CLASS zcl_acreditado_mms IMPLEMENTATION.

  METHOD constructor.

    nombre_completo             = i_nombre.
    pais                        = i_pais.
    me->num_acreditacion        = i_num.
    fecha                       = i_fecha.

  ENDMETHOD.

  METHOD get_num_acreditacion.
    rv_num = me->num_acreditacion.
  ENDMETHOD.

  METHOD describir_pase.
    rv_texto = |Acreditación general|.
  ENDMETHOD.

ENDCLASS.
