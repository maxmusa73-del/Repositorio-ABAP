CLASS zcl_mms_connections DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

    METHODS:
      get_connections IMPORTING i_departure          TYPE /dmo/airport_from_id
                      RETURNING VALUE(r_connections) TYPE zcert_connections.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mms_connections IMPLEMENTATION.

  METHOD get_connections.
    SELECT carrier_id,
           connection_id,
           airport_from_id,
           airport_to_id
           FROM /dmo/connection
     INTO TABLE @DATA(lt_connections) .
    r_connections = CORRESPONDING #( lt_connections ).
  ENDMETHOD.
ENDCLASS.
