CLASS zcl_objeto2_mms DEFINITION  " ESTA ES LA CLASE FÁBRICA
  PUBLIC
  FINAL
  CREATE PUBLIC .
    " Evitar siempre que se pueda poner componentes públicos
  PUBLIC SECTION. "Todos los atributos y métodos son públicos y accesibles.



  "atributos
  CLASS-DATA lv_moneda type c LENGTH 3. "CLASS -> atributo estático (tiene un CLASS delante del DATA)
  DATA: lv_region TYPE string.

  "método 1
  METHODS set_cliente
    " parámetros de entrada
    IMPORTING iv_cliente type string
              iv_localizacion type string

    " parámetros de salida
    EXPORTING ev_status TYPE string

    " parámetros de cambio
    CHANGING cv_proceso type string.

   "método 2
    METHODS get_cliente
        EXPORTING ev_cliente type string.

   "métodos 3
    CLASS-METHODS  set_cntr_type
      IMPORTING iv_cntr_type type string.

    "metodo 4
     CLASS-METHODS  get_cntr_type
      exporting ev_cntr_type type string.


*   otra forma de hacerlo agrupando:
*   CLASS-METHODS:
*        set_cntr__type IMPORTING iv_cntr_type string
*
*        get_cntr__type EXPORTING ev_cntr_type type string.


  PROTECTED SECTION."Es sólo accesible para esta clase y las clases hijas.

    CLASS-DATA lv_fecha type sydate. "esto es un atributo estático


  PRIVATE SECTION. "Es sólo accesible para esta clase y las clases friends.

  DATA lv_cliente type string. " esto es un atributo de instancia
  CLASS-DATA cntr_type type string.

  ENDCLASS.



CLASS zcl_objeto2_mms IMPLEMENTATION.



    METHOD set_cliente.
      lv_cliente = iv_cliente.
      ev_status = 'ok'.
      cv_proceso = 'Started'.

    ENDMETHOD.


    METHOD get_cliente.
      ev_cliente = lv_cliente.

    ENDMETHOD.


    METHOD get_cntr_type.
      ev_cntr_type = cntr_type.

    ENDMETHOD.


    METHOD set_cntr_type.
      cntr_type = iv_cntr_type.

    ENDMETHOD.


ENDCLASS.
