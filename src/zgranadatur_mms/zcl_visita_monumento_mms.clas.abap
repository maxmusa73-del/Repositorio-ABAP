CLASS zcl_visita_monumento_mms DEFINITION
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
        monumento         TYPE string,
        reserva           TYPE abap_bool,
      END OF zstructure_datos.

    DATA:
      monumento TYPE string,
      reserva   TYPE abap_bool.

    METHODS:
      constructor IMPORTING i_nombre            TYPE string
                            i_precio            TYPE zdecimal2_25
                            i_duracion          TYPE i
                            i_num_participantes TYPE i
                            i_monumento         TYPE string
                            i_reserva           TYPE abap_bool.

    METHODS get_datos RETURNING VALUE(es_datos) TYPE zstructure_datos.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_visita_monumento_mms IMPLEMENTATION.

  METHOD constructor.
    " Llamando al constructor del padre
    " parámetro padre <- parámetro hijo
    super->constructor( i_nombre = i_nombre
                      i_precio = i_precio
                      i_duracion = i_duracion
                      i_num_participantes = i_num_participantes ).

    " Atributo <- parametro
    monumento = i_monumento.
    reserva = i_reserva.
  ENDMETHOD.

  METHOD get_datos.
    es_datos-nombre = me->nombre.
    es_Datos-precio = me->precio.
    es_Datos-duracion = me->duracion.
    es_Datos-num_participantes = me->num_participantes.
    es_Datos-monumento = me->monumento.
    es_Datos-reserva = me->reserva.
  ENDMETHOD.

ENDCLASS.
