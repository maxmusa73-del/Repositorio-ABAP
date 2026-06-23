@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ejercicio CDS: Asociaciones y Cardinalidades'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CONNECTION_MMS 
as select from /dmo/connection as Connection
association[1..1] to /dmo/carrier as _Carrier on _Carrier.carrier_id = $projection.CarrierID                                                              
association[1..1] to /dmo/airport as _DepartureAirport on _DepartureAirport.airport_id = $projection.AirportFromID
association[0..*] to /dmo/flight as _Flights on _Flights.connection_id = $projection.ConnectionID
and _Flights.carrier_id = $projection.CarrierID
{
    key Connection.carrier_id as CarrierID,
    key Connection.connection_id as ConnectionID,
        Connection.airport_from_id as AirportFromID,
        Connection.airport_to_id as AirportToID,
        Connection.departure_time as DepartureTime,
        @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
        Connection.distance as Distance,
        Connection.distance_unit as DistanceUnit,
        _Carrier,
        _DepartureAirport,
        _Flights
} 
