@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'union travel y booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_coste_viajes_MMS 
as select from /dmo/travel
{
    key travel_id as TravelID,
    cast('0000' as abap.numc(4)) as BookingID,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    cast( total_price as abap.curr(16,2) ) as Total_Price,   
    currency_code as CurrencyCode
    
}

union select distinct from /dmo/booking

{
key travel_id as TravelID,
    booking_id as BookingID,
    
cast( flight_price as abap.curr(16,2) ) as Total_Price,
          currency_code as CurrencyCode
    
}



