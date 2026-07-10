CLASS lhc_zr_mmsflight2 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR flight2
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
        IMPORTING keys FOR flight2~validatePrice.
ENDCLASS.

CLASS lhc_zr_mmsflight2 IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD validatePrice.

    DATA failed_record   LIKE LINE OF failed-flight2.
    DATA reported_record LIKE LINE OF reported-flight2.

    READ ENTITIES OF ZR_mmsFlight2 IN LOCAL MODE
     ENTITY Flight2
     FIELDS ( Price )
        WITH CORRESPONDING #(  keys )
        RESULT DATA(flights2).

    LOOP AT flights2 INTO DATA(flight2).
      IF flight2-price <= 0.

        failed_record-%tky = flight2-%tky.
        APPEND failed_record TO failed-flight2.

        reported_record-%tky = flight2-%tky.
        reported_record-%msg = new_message(
                            id       = '/LRN/S4D400'
                            number   = '101'
                            severity = ms-error ).

        APPEND reported_record TO reported-flight2.

      ENDIF.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
