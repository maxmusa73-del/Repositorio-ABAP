CLASS zcl_ruta_gastronomica_mms DEFINITION
  PUBLIC
  INHERITING FROM zcl_experiencia_mms
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      BEGIN OF zstructure_datos,
        nombre            TYPE string,
        precio            TYPE zdecimal2_25,
        duracion          TYPE i,
        num_participantes TYPE i,
        num_tapas         TYPE i,
        nocturno          TYPE abap_bool,
      END OF zstructure_datos.

    DATA:
      num_tapas TYPE i,
      nocturno  TYPE abap_bool.

    METHODS:
      constructor IMPORTING i_nombre            TYPE string
                            i_precio            TYPE zdecimal2_25
                            i_duracion          TYPE i
                            i_num_participantes TYPE i
                            i_num_tapas         TYPE i
                            i_nocturno          TYPE abap_bool,

      " Se modifica el método original del padre
      calcular_precio REDEFINITION.
    METHODS get_datos RETURNING VALUE(es_datos) TYPE zstructure_datos.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ruta_gastronomica_mms IMPLEMENTATION.


  METHOD constructor.
    super->constructor( i_nombre            = i_nombre
                        i_precio            = i_precio
                        i_duracion          = i_duracion
                        i_num_participantes = i_num_participantes ).

    num_tapas = i_num_tapas.
    nocturno  = i_nocturno.
  ENDMETHOD.

  METHOD calcular_precio.

    DATA lv_precio_base TYPE zdecimal2_25.
    get_precio_base( IMPORTING o_precio = lv_precio_base ).

    r_total = lv_precio_base * num_participantes.

    IF num_participantes > 5.
      r_total = r_total * '0.8'.
    ENDIF.

    IF num_tapas > 5.
      r_total = r_total * '0.8'.
    ENDIF.
  ENDMETHOD.

    METHOD get_datos.
    es_datos-nombre = me->nombre.
    es_Datos-precio = me->precio.
    es_Datos-duracion = me->duracion.
    es_Datos-num_participantes = me->num_participantes.
    es_Datos-num_tapas = me->num_tapas.
    es_Datos-nocturno = me->nocturno.
  ENDMETHOD.

ENDCLASS.
