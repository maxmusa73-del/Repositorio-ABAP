CLASS zcl_cp03_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

ENDCLASS.


CLASS zcl_cp03_mms IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " 1. Crear instancia del gestor de vuelos
    DATA(lo_manager) = NEW zcl_flight_manager_mms( ).

    " 2. Añadir al menos 5 vuelos
    TRY.
        lo_manager->zif_flight_manager_mms~add_flight(
          VALUE #( aerolinea = 'LH' num_vuelo = '0400' origen = 'FRA' destino = 'JFK' precio = '899.00' plazas = 15 ) ).

        lo_manager->zif_flight_manager_mms~add_flight(
          VALUE #( aerolinea = 'AA' num_vuelo = '0017' origen = 'JFK' destino = 'SFO' precio = '450.50' plazas = 0 ) ).

        lo_manager->zif_flight_manager_mms~add_flight(
          VALUE #( aerolinea = 'IB' num_vuelo = '3740' origen = 'MAD' destino = 'BCN' precio = '120.00' plazas = 42 ) ).

        lo_manager->zif_flight_manager_mms~add_flight(
          VALUE #( aerolinea = 'LH' num_vuelo = '0455' origen = 'FRA' destino = 'MAD' precio = '310.75' plazas = 8 ) ).

        lo_manager->zif_flight_manager_mms~add_flight(
          VALUE #( aerolinea = 'SQ' num_vuelo = '0026' origen = 'SIN' destino = 'FRA' precio = '1250.00' plazas = 5 ) ).

        out->write( 'Se han añadido 5 vuelos correctamente.' ).

      CATCH zcx_flight_error_mms INTO DATA(lo_err_carga).
        out->write( |Error inesperado al cargar vuelos: { lo_err_carga->mv_message }| ).
    ENDTRY.

    " 3. Intentar añadir un vuelo con precio negativo
    out->write( '' ).
    TRY.
        lo_manager->zif_flight_manager_mms~add_flight(
          VALUE #( aerolinea = 'LH' num_vuelo = '9999' origen = 'FRA' destino = 'BER' precio = '-50.00' plazas = 10 ) ).

        out->write( 'Este mensaje no debería aparecer (precio negativo aceptado indebidamente).' ).

      CATCH zcx_flight_error_mms INTO DATA(lo_err_precio).
        out->write( |Error esperado (precio negativo): { lo_err_precio->mv_message }| ).
    ENDTRY.

    " 4. Intentar añadir un vuelo duplicado
    TRY.
        lo_manager->zif_flight_manager_mms~add_flight(
          VALUE #( aerolinea = 'LH' num_vuelo = '0400' origen = 'FRA' destino = 'JFK' precio = '950.00' plazas = 20 ) ).

        out->write( 'Este mensaje no debería aparecer (duplicado aceptado indebidamente).' ).

      CATCH zcx_flight_error_mms INTO DATA(lo_err_dup).
        out->write( |Error esperado (vuelo duplicado): { lo_err_dup->mv_message }| ).
    ENDTRY.

    " 5. Mostrar los vuelos de una aerolínea concreta
    out->write( '' ).
    out->write( '--- Vuelos de la aerolínea LH ---' ).

    DATA(lt_lh) = lo_manager->zif_flight_manager_mms~get_flights_by_airline( 'LH' ).

    LOOP AT lt_lh INTO DATA(ls_lh).
      out->write( |{ ls_lh-aerolinea }-{ ls_lh-num_vuelo }: { ls_lh-origen } -> { ls_lh-destino }, | &&
                  |precio { ls_lh-precio } €| ).
    ENDLOOP.

    " 6. Mostrar el vuelo más barato
    out->write( '' ).
    out->write( '--- Vuelo más barato ---' ).

    TRY.
        DATA(ls_barato) = lo_manager->zif_flight_manager_mms~get_cheapest_flight( ).

        out->write( |{ ls_barato-aerolinea }-{ ls_barato-num_vuelo }: | &&
                    |{ ls_barato-origen } -> { ls_barato-destino }, | &&
                    |precio { ls_barato-precio } €| ).

      CATCH zcx_flight_error_mms INTO DATA(lo_err_barato).
        out->write( |Error: { lo_err_barato->mv_message }| ).
    ENDTRY.

    " 7. Mostrar la facturación total
    out->write( '' ).
    out->write( '--- Facturación total ---' ).

    DATA(lv_total) = lo_manager->zif_flight_manager_mms~get_total_revenue( ).

    out->write( |Facturación total: { lv_total } €| ).

  ENDMETHOD.

ENDCLASS.
