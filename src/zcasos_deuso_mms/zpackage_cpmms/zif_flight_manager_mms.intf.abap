  INTERFACE zif_flight_manager_mms
  PUBLIC.

    TYPES:
      BEGIN OF ty_flight,
        aerolinea TYPE c LENGTH 2,
        num_vuelo TYPE n LENGTH 4,
        origen    TYPE c LENGTH 3,
        destino   TYPE c LENGTH 3,
        precio    TYPE p LENGTH 8 DECIMALS 2,
        plazas    TYPE i,
      END OF ty_flight.

    TYPES tt_flights TYPE STANDARD TABLE OF ty_flight WITH EMPTY KEY.
    TYPES ty_revenue  TYPE p LENGTH 12 DECIMALS 2.

    METHODS add_flight
      IMPORTING
        is_flight TYPE ty_flight
      RAISING
        zcx_flight_error_mms.

    METHODS get_flights_by_airline
      IMPORTING
        iv_aerolinea      TYPE c
      RETURNING
        VALUE(rt_flights) TYPE tt_flights.

    METHODS get_cheapest_flight
      RETURNING
        VALUE(rs_flight) TYPE ty_flight
      RAISING
        zcx_flight_error_mms.

    METHODS get_total_revenue
      RETURNING
        VALUE(rv_total) TYPE /dmo/total_price.

  ENDINTERFACE.
