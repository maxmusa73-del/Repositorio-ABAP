CLASS zcl_experiencia_mms DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: nombre            TYPE string,
          duracion          TYPE i,
          num_participantes TYPE i,
          precio            TYPE zdecimal2_25.

    METHODS:

      constructor IMPORTING i_nombre            TYPE string
                            i_precio            TYPE zdecimal2_25
                            i_duracion          TYPE i
                            i_num_participantes TYPE i,

      calcular_precio RETURNING VALUE(r_total) TYPE zdecimal2_25,

      get_precio_base EXPORTING o_precio TYPE zdecimal2_25.

  PROTECTED SECTION.
  PRIVATE SECTION.
*    DATA:
*      precio    TYPE zdecimal2_25.


ENDCLASS.

CLASS zcl_experiencia_mms IMPLEMENTATION.


  METHOD constructor. " Solo tiene parámetros de IMPORTING
    " Atributo <- parámetro
    nombre     = i_nombre.
    precio     = i_precio.
    duracion     = i_duracion.
    num_participantes  = i_num_participantes.

  ENDMETHOD.

  METHOD calcular_precio.

    r_total = precio * num_participantes.

    IF num_participantes > 8.
      r_total = r_total * '0.9'.
    ENDIF.

  ENDMETHOD.

  METHOD get_precio_base.

    " Parámetro  <- atributo
    o_precio = precio.


  ENDMETHOD.


ENDCLASS.
