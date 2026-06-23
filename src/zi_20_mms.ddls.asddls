@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_20_MMS 
as select from /dmo/booking


association[1..1] to ZI_19_MMS as _Travel on _Travel.TravelId = $projection.TravelId
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    _Travel     // con esto podemos proyectar los datos
    
    }
