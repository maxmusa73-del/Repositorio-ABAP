@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Reservas de vuelo'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_12_BOOKING_MMS 
as select from /dmo/booking as Booking

association [1..1] to /dmo/carrier as _Carrier on _Carrier.carrier_id = $projection.CarrierID
{
    key Booking.travel_id                                           as TravelID,
        Booking.carrier_id                                          as CarrierID,
        Booking.flight_date                                         as FlightDate,
        concat_with_space( _Carrier.carrier_id, _Carrier.name, 2 )  as CarrierInfo
}

