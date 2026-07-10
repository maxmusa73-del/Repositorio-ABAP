CLASS zcx_2233_no_agency DEFINITION
  PUBLIC
  INHERITING FROM cx_no_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CONSTANTS:
      BEGIN OF no_agency,
        msgid TYPE symsgid VALUE 'ZC_MENSAJES_25',
        msgno TYPE symsgno VALUE '002',
      END OF no_agency.

*    DATA agency_id TYPE /dmo/agency_id READ-ONLY.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        agency_id TYPE /dmo/agency_id OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_2233_no_agency IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
*    me->agency_id = agency_id.

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key-msgid = no_agency-msgid.
      if_t100_message~t100key-msgno = no_agency-msgno.
      if_t100_message~t100key-attr1 = agency_id.

    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
