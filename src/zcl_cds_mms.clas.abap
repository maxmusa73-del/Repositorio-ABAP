CLASS zcl_cds_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cds_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

        SELECT FROM zi_20_mms as Booking" para navegar al zi 20 y desde ahí al 19
            FIELDS
            Booking~TravelId,
            Booking~BookingId,
            \_Travel-AgencyId,      "navega al Travel-AgencyId
            \_Travel\_Agency-name as AgencyName, "aquí navega primero a Travel y después a Agency de donde cogemos el name.
            \_Travel\_Customer-customer_id as customer_id,
            concat_with_space( \_Travel\_Customer-first_name, \_Travel\_Customer-last_name, 2 ) as customerName
            where booking~CarrierId eq 'AA'
            into table @data(lt_resultados)
            up to 5 rows.
if sy-subrc = 0.
    out->write( lt_resultados ).
endif.
  ENDMETHOD.
ENDCLASS.


"esto es una clase normal que relaciona CDSs
"para que podamos tenerlo en una tabla y poder trabajar
"con estos datos

