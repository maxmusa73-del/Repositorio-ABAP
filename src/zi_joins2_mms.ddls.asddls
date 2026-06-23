@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ejercicio de clase de joins'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_JOINS2_MMS 

as select from /dmo/travel as Viaje
    inner join /dmo/booking as Reserva on Reserva.travel_id = Viaje.travel_id
{
    key Viaje.travel_id as travelID,
    key Reserva.booking_id as BookingID,
        Reserva.flight_date as FechaReserva,
         @Semantics.amount.currencyCode: 'CurrencyCode'
        Viaje.booking_fee as BookingFee,
       @Semantics.amount.currencyCode: 'CurrencyCode'
        Reserva.flight_price as PrecioReserva,
        Viaje.agency_id as AgencyId,
        Reserva.currency_code as CurrencyCode
    
}
