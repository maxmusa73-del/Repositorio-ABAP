CLASS zcl_jugador_mms DEFINITION
  PUBLIC
  INHERITING FROM zcl_acreditado_mms
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  TYPES: BEGIN OF ENUM ty_posicion,
           portero,
           defensa,
           centrocampista,
           delantero,
         END OF ENUM ty_posicion.

    DATA:
      dorsal     TYPE i,
      posicion   TYPE ty_posicion,
      convocado  TYPE abap_bool.

    METHODS:
      constructor IMPORTING i_nombre            TYPE string
                            i_pais              TYPE string
                            i_fecha             TYPE d
                            i_num               TYPE string
                            i_dorsal            TYPE i
                            i_posicion          TYPE ty_posicion
                            i_convocado         TYPE abap_bool,


      describir_pase REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_jugador_mms IMPLEMENTATION.
METHOD constructor.

    super->constructor( i_nombre             = i_nombre
                        i_pais               = i_pais
                        i_fecha              = i_fecha
                        i_num                = i_num ).

    me->dorsal       = me->dorsal.
    me->posicion     = me->posicion.
    me->convocado    = me->convocado.

  ENDMETHOD.

  METHOD describir_pase.

    rv_texto = |--- PASE DE JUGADOR ---\n| &&
               |Nombre: { nombre_completo } \n| &&
               |País: { pais } \n| &&
               |Accesos permitidos: Campo y Vestuarios.|.

  ENDMETHOD.

ENDCLASS.
