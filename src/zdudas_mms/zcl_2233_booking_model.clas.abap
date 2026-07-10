CLASS zcl_2233_booking_model DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_booking
      IMPORTING
        iv_travel_id      TYPE /dmo/travel_id
        iv_booking_id     TYPE /dmo/booking_id
      RETURNING
        VALUE(rs_booking) TYPE /dmo/booking
      RAISING
        zcx_2233_no_booking .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_2233_booking_model IMPLEMENTATION.

  METHOD get_booking.

    SELECT SINGLE *
      FROM /dmo/booking
      WHERE travel_id  = @iv_travel_id
        AND booking_id = @iv_booking_id
      INTO @rs_booking.

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcx_2233_no_booking
        EXPORTING
          travel_id  = iv_travel_id
          booking_id = iv_booking_id.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
