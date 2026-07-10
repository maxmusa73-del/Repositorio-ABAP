CLASS zcl_probar_reservas_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_probar_reservas_mms IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(lo_reservas) = NEW zcl_gestor_reservas_mms(  ).

    TRY.
        out->write( lo_reservas->reservar_pista(
                                                i_hora = 9
                                                i_num_jug = 4
                                                i_nombre_pista = 'PISTA_2' ) ).
      CATCH zcx_reserva_no_valida_mms INTO DATA(lo_excepcion).
        out->write( lo_excepcion->motivo ).
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
