CLASS zcl_ejerc_rangos_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejerc_rangos_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

" punto 1
DATA lr_compannia type RANGE OF /dmo/carrier_id.
*  out->write( lr_compannia ).


*  append VALUE #( sign = 'I' option = 'BT' low = 50 high = 100 ) to lr_asientos.
    APPEND value #( sign = 'I' option = 'EQ' low = 'LH' ) to lr_compannia.
    APPEND value #( sign = 'I' option = 'EQ' low = 'AA' ) to lr_compannia.
    APPEND value #( sign = 'I' option = 'EQ' low = 'SQ' ) to lr_compannia.

*    lr_compannia =  value #( ( sign = 'I' option = 'EQ' low = 'LH' )
*                             ( sign = 'I' option = 'EQ' low = 'AA' )
*                             ( sign = 'I' option = 'EQ' low = 'SQ' ) ).

" punto 2
DATA lr_fechas type RANGE OF /dmo/flight_date.
*out->write( lr_fechas ).

    APPEND value #( sign = 'I' option = 'BT' low = '20250101' high = '20260630' ) to lr_fechas.

" punto 3
DATA lr_conexion type RANGE OF /dmo/connection_id.
*  out->write( lr_conexion ).

    APPEND value #( sign = 'I' option = 'CP' low = '1*' ) to lr_conexion.
    " append value #( sign = 'I' option = 'BT' low = '1000' high = '1999' ) to lr_conexion. " -> es otra forma de hacerlo

" punto 4
DATA lr_exclusion type RANGE OF /dmo/carrier_id.
*  out->write( lr_exclusion ).

    APPEND value #( sign = 'E' option = 'EQ' low = 'UA' ) to lr_exclusion.

"punto 5
DATA lr_precio type RANGE OF /dmo/flight_price.
*  out->write( lr_precio ).

    APPEND value #( sign = 'I' option = 'BT' low = '50' high = '100' ) to lr_precio.


 " punto 6: consulta combinada del 1, 2 y 4.

 DATA lt_combinada type table of /dmo/flight.

 SELECT FROM /dmo/flight
    FIELDS carrier_id, connection_id, flight_date, price
    WHERE  carrier_id  IN @lr_compannia
      AND carrier_id  IN @lr_exclusion
      AND flight_date IN @lr_fechas
      INTO TABLE @DATA(flights).



out->write( | Vuelos encontrados:  { lines( flights ) }| ).
out->write( flights ).







  ENDMETHOD.
ENDCLASS.
