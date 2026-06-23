@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'union travel y booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_coste_viajes_MMS 
as select from /dmo/travel
{
    key travel_id as TravelID,
    cast('0000' as abap.numc(4)) as BookingID,                //rellena campos vacíos con ceros
    @Semantics.amount.currencyCode: 'CurrencyCode'  //para indicarle qué tipo de moneda utiliza la tabla TRAVEL
    cast( total_price as abap.curr(16,2) ) as Total_Price,   //homogeneizar el campo precio
    currency_code as CurrencyCode                            //Convierte total_price al tipo de moneda y pinta el código de moneda correspondiente
    
}

union select distinct from /dmo/booking                      //utiliza la instrucción 'Select distinct' para evitar entradas duplicadas de travel_id

{
    key travel_id as TravelID,
    booking_id as BookingID,                                 
    
    cast( flight_price as abap.curr(16,2) ) as Total_Price,   //Convierte flight_price al mismo tipo de moneda que el anterior y asigna su código de moneda
          currency_code as CurrencyCode
    
}



