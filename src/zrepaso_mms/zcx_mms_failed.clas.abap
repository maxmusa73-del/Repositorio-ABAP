CLASS zcx_mms_failed DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .


    CONSTANTS:
      BEGIN OF carrier_not_found,
        msgid TYPE symsgid        VALUE 'Z##_MESSAGES',
        msgno TYPE symsgno        VALUE '010',
        attr1 TYPE scx_attrname   VALUE 'carrier_id',
        attr2 TYPE scx_attrname   VALUE 'attr2',
        attr3 TYPE scx_attrname   VALUE 'attr3',
        attr4 TYPE scx_attrname   VALUE 'attr4',
      END OF carrier_not_found.


    CONSTANTS:
      BEGIN OF carrier_no_read_auth,
        msgid TYPE symsgid      VALUE 'zmms_messages', " msgid -> es clase de mensaje
        msgno TYPE symsgno      VALUE '020', " msgno -> es el numero del mensaje
        attr1 TYPE scx_attrname VALUE 'carrier_id', "  attr1 -> es el atributo 1 de excepción
        attr2 TYPE scx_attrname VALUE 'attr2',
        attr3 TYPE scx_attrname VALUE 'attr3',
        attr4 TYPE scx_attrname VALUE 'attr4',
      END OF carrier_no_read_auth.

    DATA carrier_id TYPE /dmo/carrier_id READ-ONLY.

    METHODS constructor
      IMPORTING
        !textid    LIKE if_t100_message=>t100key OPTIONAL
        !previous  LIKE previous OPTIONAL
        carrier_id LIKE carrier_id OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_mms_failed IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(
    previous = previous
    ).
*    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    IF carrier_id IS NOT INITIAL.
      me->carrier_id = carrier_id.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
