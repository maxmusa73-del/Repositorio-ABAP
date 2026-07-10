CLASS zcl_flight_manager_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_flight_manager_mms .

    METHODS constructor
      IMPORTING
        it_flights TYPE zif_flight_manager_mms=>tt_flights OPTIONAL .

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA flights TYPE zif_flight_manager_mms=>tt_flights .

ENDCLASS.



CLASS zcl_flight_manager_mms IMPLEMENTATION.

  METHOD constructor.
    IF it_flights IS SUPPLIED.
      me->flights = it_flights.
    ENDIF.
  ENDMETHOD.

  METHOD zif_flight_manager_mms~add_flight.

    " Validación 1: el precio debe ser positivo
    IF is_flight-precio <= 0.
      RAISE EXCEPTION TYPE zcx_flight_error_mms
        EXPORTING
          mv_message = |El precio debe ser positivo (recibido: { is_flight-precio })|.
    ENDIF.

    " Validación 2: no debe existir ya ese vuelo (misma aerolínea + número)
    READ TABLE me->flights TRANSPORTING NO FIELDS
      WITH KEY aerolinea = is_flight-aerolinea
               num_vuelo = is_flight-num_vuelo.

    IF sy-subrc = 0.
      RAISE EXCEPTION TYPE zcx_flight_error_mms
        EXPORTING
          mv_message = |Ya existe el vuelo { is_flight-aerolinea }-{ is_flight-num_vuelo }|.
    ENDIF.

    " Si pasa ambas validaciones, se añade el vuelo
    APPEND is_flight TO me->flights.

  ENDMETHOD.


  METHOD zif_flight_manager_mms~get_cheapest_flight.

    IF me->flights IS INITIAL.
      RAISE EXCEPTION TYPE zcx_flight_error_mms
        EXPORTING
          mv_message = 'No hay vuelos registrados, no se puede calcular el más barato'.
    ENDIF.

    rs_flight = REDUCE #(
      INIT cheapest = me->flights[ 1 ]
      FOR ls_f IN me->flights
      NEXT cheapest = COND #( WHEN ls_f-precio < cheapest-precio THEN ls_f ELSE cheapest )
    ).

  ENDMETHOD.


  METHOD zif_flight_manager_mms~get_flights_by_airline.

    rt_flights = VALUE #(
      FOR ls_f IN me->flights
      WHERE ( aerolinea = iv_aerolinea )
      ( ls_f )
    ).

  ENDMETHOD.


  METHOD zif_flight_manager_mms~get_total_revenue.

    rv_total = REDUCE #(
      INIT total = CONV zif_flight_manager_mms~ty_revenue( '0.00' )
      FOR ls_f IN me->flights
      NEXT total = total + ls_f-precio
    ).

  ENDMETHOD.

ENDCLASS.
