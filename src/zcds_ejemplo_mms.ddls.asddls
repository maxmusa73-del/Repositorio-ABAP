@AbapCatalog.viewEnhancementCategory: [ #NONE ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_EJEMPLO_MMS 
as select from /dmo/flight
{
    key carrier_id as AirlineId,
    key connection_id as ConnectionID,
    key flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'Currency'
    @EndUserText.label: 'Price'
    price as Price,
    currency_code as Currency,
    
    'USD' as Mia,
    '20300101' as Mia2,
    
    cast( '20300101' as abap.dats ) as dateDate,
    1.2 as FloatingPointElement,
    fltp_to_dec(1.2 as abap.dec(4, 2)) as DecimalElement 
    
    
}
