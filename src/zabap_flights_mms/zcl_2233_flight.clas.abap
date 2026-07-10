CLASS zcl_2233_flight DEFINITION
  PUBLIC
*  FINAL (se quita porque es una clase padre y para que se pueda heredar de ella)
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:
      carrier_id    TYPE /dmo/carrier_id READ-ONLY,
      connection_id TYPE /dmo/connection_id READ-ONLY,
      airport_from  TYPE /dmo/airport_from_id READ-ONLY,
      airport_to    TYPE /dmo/airport_to_id READ-ONLY.

    METHODS:
        constructor
          IMPORTING
              i_carrier_id TYPE /dmo/carrier_id
              i_connection_id TYPE /dmo/connection_id
              i_plane_type TYPE /dmo/plane_type_id
           RAISING zcx_c_abapd_no_connection.

  PROTECTED SECTION.
    DATA plane_type TYPE /dmo/plane_type_id.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_2233_flight IMPLEMENTATION.

METHOD constructor.
    me->carrier_id = i_carrier_id.
    me->connection_id = i_connection_id.
    me->plane_type = i_plane_type.
ENDMETHOD.
ENDCLASS.
