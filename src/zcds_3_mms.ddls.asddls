@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unión'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_3_MMS 
as select from /dmo/travel
{
    key travel_id as TravelID,
    cast('' as abap.numc( 4 )) as bookingID 
}

union select distinct from /dmo/booking // evita registros duplicados de TravelID, que es la unión entre las tablas, que es el key de TravelID

{ 
key travel_id as TravelID,
    booking_id as BookingID
}
