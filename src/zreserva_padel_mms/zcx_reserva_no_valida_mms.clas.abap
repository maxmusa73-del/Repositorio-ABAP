CLASS zcx_reserva_no_valida_mms DEFINITION
  PUBLIC
  INHERITING FROM cx_no_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    DATA motivo TYPE string.

    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        hora      TYPE i OPTIONAL
        num_jug   TYPE i OPTIONAL
        nom_pista TYPE string OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_reserva_no_valida_mms IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).

    " Solución separada
*    IF hora IS NOT INITIAL.
*      me->motivo = | A las { hora } no se puede reservar. El horario es de 8 a 23. |.
*    ENDIF.
*
*    IF num_jug IS SUPPLIED.
*      me->motivo = | Se necesitan 4 jugadores y no { num_jug } |.
*    ENDIF.
*
*    IF nom_pista IS NOT INITIAL.
*      me->motivo = | La pista { nom_pista } está ocupada |.
*    ENDIF.

    " Solución conjunta
    IF hora < 8 OR hora > 23.
      me->motivo = | A las { hora } no se puede reservar. El horario es de 8 a 23. |.
    ENDIF.

    IF num_jug <> 4.
      me->motivo = | { me->motivo } Se necesitan 4 jugadores y no { num_jug }. |.
    ENDIF.

    IF nom_pista = 'PISTA_1'.
      me->motivo = | { me->motivo } La pista { nom_pista } está ocupada |.
    ENDIF.

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
