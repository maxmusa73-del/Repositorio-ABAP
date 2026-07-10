CLASS zcl_assigning_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_assigning_mms IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

*DATA lt_flight TYPE TABLE OF /dmo/flight.

SELECT FROM /dmo/flight
FIELDS *
INTO TABLE @dATA(lt_flight).

SORT lt_flight BY carrier_id.

LOOP AT lt_flight ASSIGNING FIELD-SYMBOL(<fs_flight>).
    <fs_flight>-price = <fs_flight>-price * 2.
ENDLOOP.

out->write( lt_flight ).

ENDMETHOD.
ENDCLASS.
