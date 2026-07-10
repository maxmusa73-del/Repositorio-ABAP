CLASS zcx_2233_no_booking DEFINITION
  PUBLIC
  INHERITING FROM cx_no_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      BEGIN OF no_booking_found,
        msgid TYPE symsgid          VALUE 'ZC_MENSAJES_25',
        msgno TYPE symsgno          VALUE '001',
        attr1 TYPE scx_attrname     VALUE 'TRAVEL_ID',
        attr2 TYPE scx_attrname     VALUE 'BOOKING_ID',
        attr3 TYPE scx_attrname     VALUE '',
        attr4 TYPE scx_attrname     VALUE '',
      END OF no_booking_found .

    DATA travel_id  TYPE /dmo/travel_id .
    DATA booking_id TYPE /dmo/booking_id .

    METHODS constructor
      IMPORTING
        textid     LIKE if_t100_message=>t100key OPTIONAL
        previous   LIKE previous OPTIONAL
        travel_id  TYPE /dmo/travel_id  OPTIONAL
        booking_id TYPE /dmo/booking_id OPTIONAL .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcx_2233_no_booking IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).

    me->travel_id  = travel_id.
    me->booking_id = booking_id.

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = no_booking_found.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
