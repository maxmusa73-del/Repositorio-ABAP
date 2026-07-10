CLASS zcl_marisqueria_sanlucar_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_negocio_sanlucar_mms.

    CONSTANTS:
         tipo TYPE string VALUE 'Marisquería'.

    DATA:
      Nombre      TYPE string,
      Descripcion TYPE string.

    METHODS constructor
      IMPORTING
        i_nombre      TYPE string
        i_descripcion TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_marisqueria_sanlucar_mms IMPLEMENTATION.

  METHOD constructor.
    me->nombre = i_nombre.
    me->descripcion = i_descripcion.
  ENDMETHOD.

  METHOD zif_negocio_sanlucar_mms~calcular_precio.
    rv_precio = 25.
  ENDMETHOD.


  METHOD zif_negocio_sanlucar_mms~get_descripcion.
    rv_descripcion = descripcion.
  ENDMETHOD.


  METHOD zif_negocio_sanlucar_mms~get_nombre.
    rv_nombre = nombre.
  ENDMETHOD.


  METHOD zif_negocio_sanlucar_mms~get_tipo.
    rv_tipo = tipo.
  ENDMETHOD.
ENDCLASS.
