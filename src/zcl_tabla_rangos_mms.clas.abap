CLASS zcl_tabla_rangos_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tabla_rangos_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  " sing -> dice si la condicion es incluir (I) o excluir (E).
        " I = lo quiero
        " E = no lo quiero
  " option ->  Dice el tipo de comparación
        " EQ = igial a
        " NE = diferente a
        " GT = mayor que
        " LT = menor que
        " BT = entre
        " CP = patron ( como un "like" )
   " low -> el valor mínimo o valor exacto
   " high = el valor máximo ( solo se usa con un "entre" )



  " imaginar una lista de coches y quieres los rojos y también los azules pero no los amarillos

  " a nivel visual no de código sería algo así:
  " sing        option     low    high
  " i             eq       rojo
  " i             eq       azul
  " E             eq       amarillo

  DATA lr_asientos type RANGE OF /dmo/plane_seats_occupied.

  out->write( lr_asientos ).

"quiero vuelos con asientos entre 50 y 100.

append VALUE #( sign = 'I' option = 'BT' low = 50 high = 100 ) to lr_asientos.

" tambien quiero vuelos exactamente con 150 asientos

append VALUE #( sign = 'I' option = 'EQ' low = 150 ) to lr_asientos.

" no quiero vuelos con menos de 10 asientos
append VALUE #( sign = 'E' option = 'LT' low = 10 ) to lr_asientos.


DATA lt_vuelos type table of /dmo/flight.

SELECT * FROM /dmo/flight
    where seats_occupied in @lr_asientos
    INTO TABLE @lt_vuelos.

loop at lt_vuelos into DATA(ls_vuelos).

out->write( ls_vuelos ).



endloop.

  ENDMETHOD.
ENDCLASS.
