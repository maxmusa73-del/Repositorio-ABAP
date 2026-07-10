CLASS zcl_2233_agency_model DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_agency
      IMPORTING
        i_agency_id     TYPE /dmo/agency_id
      RETURNING
        VALUE(r_agency) TYPE /dmo/agency
      RAISING
        zcx_2233_no_agency.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_2233_agency_model IMPLEMENTATION.

  METHOD get_agency.

    SELECT SINGLE *
      FROM /dmo/agency
      WHERE agency_id = @i_agency_id
      INTO @r_agency.

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcx_2233_no_agency
        EXPORTING
          agency_id = i_agency_id.
    ENDIF.

  ENDMETHOD.




ENDCLASS.
