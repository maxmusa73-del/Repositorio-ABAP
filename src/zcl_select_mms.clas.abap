CLASS zcl_select_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_select_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  SELECT FROM /dmo/airport
*    FIELDS *
*    where country = 'DE'
*    into table @data(lt_airport).
*
*if sy-subrc = 0.
*
*
*  out->write( lt_airport ).

*   endif.


*SELECT FROM /dmo/airport
*    FIELDS *
*    where country = 'US'
*    into table @data(lt_airport).
*
* out->write( lt_airport ).
*
* Data: lt_airport_2 TYPE TABLE of /dmo/airport.
* Data: lv_inicial TYPE c LENGTH 1.
*
* LOOP AT lt_airport INTO data(ls_airport).
*        lv_inicial = ls_airport-city.
*
*        if lv_inicial = 'L'.
*            INSERT ls_airport into table lt_airport_2.
*     ENDIF.
* ENDLOOP.

* out->write( lt_airport_2 ).

* if sy-subrc = 0.
*   out->write( lt_pais ).
* endif.

*SELECT FROM /dmo/airport
*    FIELDS *
*    where name like 'L%'
*    into table @data(lt_nombre).

*DATA: lt_airport
*
*if sy-subrc = 0.
*  out->write( lt_nombre ).
*endif.

*READ TABLE lt_aeropuerto into data(ls_vuelo) INDEX 1.
*
*out->write(ls_vuelo).
*endif.

SELECT from zbd_empleado_mms
    FIELDS *
    into table @data(lt_ordenar).

LOOP AT lt_ordenar into data(ls_ordenar).
    ls_ordenar-edad = 18.

    MODIFY lt_ordenar from ls_ordenar.


ENDLOOP.

 out->write( lt_ordenar ).


  ENDMETHOD.
ENDCLASS.
