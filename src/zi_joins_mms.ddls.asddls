@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'JOINS'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_JOINS_MMS 

as select from /dmo/travel as Viaje
   inner join /dmo/booking as Reserva on Reserva.travel_id = Viaje.travel_id
        
{
key Viaje.travel_id as Travelid,    //con esto estamos cogiendo las columnas de esta tablas sin inventarnos una columna ficticia
key Reserva.booking_id as bookingID,
    Viaje.agency_id as AgencyId,
    Viaje.begin_date as BeginDate,
    Viaje.end_date as enddate,
    Reserva.booking_date as BookingDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Viaje.total_price as totalprice,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Reserva.flight_price as BookingPrice,
    Reserva.currency_code as CurrencyCode

}
