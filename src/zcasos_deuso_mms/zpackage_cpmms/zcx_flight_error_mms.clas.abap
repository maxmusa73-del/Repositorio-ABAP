CLASS zcx_flight_error_mms DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA mv_message TYPE string.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    METHODS constructor
      IMPORTING
        !textid    LIKE textid OPTIONAL
        !previous  LIKE previous OPTIONAL
        mv_message TYPE string OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_flight_error_mms IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(
    textid = textid
    previous = previous
    ).

    me->mv_message = mv_message.
*    CLEAR me->textid.
*    IF textid IS INITIAL.
*      if_t100_message~t100key = if_t100_message=>default_textid.
*    ELSE.
*      if_t100_message~t100key = textid.
*    ENDIF.
  ENDMETHOD.
ENDCLASS.
