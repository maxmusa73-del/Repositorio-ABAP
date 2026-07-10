CLASS z_prueba_examen2_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

ENDCLASS.


CLASS z_prueba_examen2_mms IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(lo_model) = NEW zcl_1717_booking_model( ).
    DATA ls_booking TYPE /dmo/booking.

    " --- Caso 1: IDs EXISTENTES ---
    " Antes de ejecutar, consulta valores reales con SQL Console:
    " SELECT travel_id, booking_id FROM /dmo/booking UP TO 5 ROWS
    TRY.
        ls_booking = lo_model->get_booking(
          iv_travel_id  = '00000001'   " <-- sustituir por valor real
          iv_booking_id = '0001'          " <-- sustituir por valor real
        ).
        out->write( |Reserva encontrada: travel_id={ ls_booking-travel_id }, | &&
                    |booking_id={ ls_booking-booking_id }, | &&
                    |customer_id={ ls_booking-customer_id }| ).
      CATCH zcx_2233_no_booking INTO DATA(lo_exc1).
        out->write( |ERROR: { lo_exc1->get_text( ) }| ).
    ENDTRY.

    " --- Caso 2: IDs INEXISTENTES ---
    TRY.
        ls_booking = lo_model->get_booking(
          iv_travel_id  = '99999999'
          iv_booking_id = '9999'
        ).
        out->write( |Reserva encontrada: travel_id={ ls_booking-travel_id }, | &&
                    |booking_id={ ls_booking-booking_id }| ).
      CATCH zcx_2233_no_booking INTO DATA(lo_exc2).
        out->write( |ERROR esperado: { lo_exc2->get_text( ) }| ).
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
