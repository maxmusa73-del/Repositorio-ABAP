CLASS zcx_resultado_no_valido_mms DEFINITION
  PUBLIC
  INHERITING FROM cx_no_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        valor     TYPE zdecimal2_25 OPTIONAL. "esto es opcional.

    DATA valor TYPE zdecimal2_25.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_resultado_no_valido_mms IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(
    previous = previous
    ).
    me->valor = valor. "esto hay que añadirlo si añadimos antes el valor.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
