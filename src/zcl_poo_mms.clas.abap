CLASS zcl_poo_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  DATA lv_nombre type string.
  METHODS: ladrar returning value(rv_accion) TYPE string. " metodo / funcion
  METHODS: lanzar_pelota RETURNING VALUE(rv_accion) type string. " metodo / funcion


  DATA lv_color type string.
  METHODS: da_salto RETURNING VALUE(rv_accion) type string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_poo_mms IMPLEMENTATION.

METHOD ladrar.
        rv_accion = 'ladrar'.

        rv_accion = |{ lv_nombre } dice: Guau guau|.



ENDMETHOD.


 METHOD lanzar_pelota.
        rv_accion = |{ lv_nombre } corre a por la pelota|.

 ENDMETHOD.

METHOD da_salto.
        rv_accion = |{ lv_nombre } salta la vaya|.

 ENDMETHOD.


ENDCLASS.
