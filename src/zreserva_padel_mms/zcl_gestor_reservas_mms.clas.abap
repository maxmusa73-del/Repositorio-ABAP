CLASS zcl_gestor_reservas_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      reservar_pista IMPORTING i_hora           TYPE i
                               i_num_jug        TYPE i
                               i_nombre_pista   TYPE string
                     RETURNING VALUE(r_mensaje) TYPE string
                     RAISING   zcx_reserva_no_valida_mms.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_gestor_reservas_mms IMPLEMENTATION.

  METHOD reservar_pista.

    " Solución separada
*    IF i_hora < 8 OR i_hora > 23.
*      RAISE EXCEPTION TYPE zcx_reserva_no_valida_25
*        EXPORTING
*          hora = i_hora.
*    ENDIF.
*
*    IF i_num_jug <> 4.
*      RAISE EXCEPTION TYPE zcx_reserva_no_valida_25
*        EXPORTING
*          num_jug = i_num_jug.
*    ENDIF.
*
*    IF i_nombre_pista = 'PISTA_1'.
*      RAISE EXCEPTION TYPE zcx_reserva_no_valida_25
*        EXPORTING
*          nom_pista = i_nombre_pista.
*    ENDIF.

    " Solución conjunta
    IF ( i_hora < 8 OR i_hora > 23 ) OR i_num_jug <> 4 OR i_nombre_pista = 'PISTA_1'.
      RAISE EXCEPTION TYPE zcx_reserva_no_valida_mms
        EXPORTING
          hora      = i_hora
          num_jug   = i_num_jug
          nom_pista = i_nombre_pista.
    ENDIF.

    r_mensaje = 'Reserva realizada'.

  ENDMETHOD.

ENDCLASS.
