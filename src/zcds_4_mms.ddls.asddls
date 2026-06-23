@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_4_MMS 
as select from /dmo/flight
{
    key carrier_id as AerolineaID, //AerolineaID es un mote o alias que tiene 
                                    //relación con el campo que estamos vinculando
    key connection_id as ConnectionID,
    key flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'Moneda'
    @EndUserText.label: 'Precio'
    price as Precio,
    currency_code as Moneda,
    'USD' as Manual,
    '20300101' as Fecha,
    cast('20200202' as abap.dats ) as FechaC, // el fechaC es el alias
    1.2 as flotante,
    fltp_to_dec(3.2 as abap.dec(4,2)) as NumeroDecimal


}
