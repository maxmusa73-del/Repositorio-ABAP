*"* use this source file for your ABAP unit test classes
CLASS ltc_get_agency DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_mms_agency_model.  "Class Under Test

    METHODS:
      setup,
      test_agency_found FOR TESTING RAISING cx_static_check,
      test_agency_not_found FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltc_get_agency IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW zcl_mms_agency_model( ).
  ENDMETHOD.


  METHOD test_agency_found.
    DATA lv_agency_id TYPE /dmo/agency_id.  "ajusta el tipo real
    DATA ls_agency    TYPE /dmo/agency. "ajusta el tipo real de retorno

    " Usa un ID de agencia que SÍ exista en la tabla de datos de prueba
    lv_agency_id = '070010'.  " <-- sustituye por un ID válido real

    TRY.
        ls_agency = mo_cut->get_agency( i_agency_id = lv_agency_id ).

        cl_abap_unit_assert=>assert_not_initial(
          act = ls_agency
          msg = 'Se esperaba encontrar la agencia' ).

      CATCH zcx_mms_no_agency.
        cl_abap_unit_assert=>fail(
          msg = 'No debería lanzarse excepción para una agencia existente' ).
    ENDTRY.
  ENDMETHOD.


  METHOD test_agency_not_found.
    DATA lv_agency_id TYPE /dmo/agency_id.
    DATA ls_agency    TYPE /dmo/agency.
    DATA lx_agency    TYPE REF TO zcx_mms_no_agency.

    " Usa un ID que con seguridad NO exista
    lv_agency_id = '000000'.

    TRY.
        ls_agency = mo_cut->get_agency( i_agency_id = lv_agency_id ).

        cl_abap_unit_assert=>fail(
          msg = 'Se esperaba la excepción ZCX_MMS_NO_AGENCY' ).

      CATCH zcx_mms_no_agency INTO lx_agency.

        cl_abap_unit_assert=>assert_equals(
          act = lx_agency->agency_id
          exp = lv_agency_id
          msg = 'El ID de agencia en la excepción no coincide' ).

        " Opcional: comprobar el texto del mensaje generado
        cl_abap_unit_assert=>assert_equals(
          act = lx_agency->get_text( )
          exp = |Agencia { lv_agency_id } no existe.|
          msg = 'El texto del mensaje no coincide' ).

    ENDTRY.
  ENDMETHOD.

ENDCLASS.

