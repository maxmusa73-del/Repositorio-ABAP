@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exposición'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_14_MMS 
as select from /dmo/travel as Travel

// cada viaje tiene exactamente un cliente, mínimo 1 ( siempre hay cliente, no puede faltar) y máximo 1 (no puede haber dos).
// ES UNA RELACION OBLIGATORIA Y UNICA
association[1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerID 

// IGUAL QUE EL ANTERIOR. Cada viaje pertenece a EXACTAMENTE UNA agencia. Siempre hay una y solo una.
association[1..1] to /dmo/agency as _Agency on _Agency.agency_id = $projection.AgencyID

// Cada viaje puede tener DESDE CERO HASTA MUCHAS reservas. El 0 significa que un viaje podría no tener ninguna reserva todavía,
// el * significa que puede acumular tantas como haga falta
association[0..*] to /dmo/booking as _Booking on _Booking.travel_id = $projection.TravelID


// un viaje (travel) apunta a un cliente y una agencia -> son los "padres" o datos maestros. Por eso [1..1] el viaje no tiene sentido sin ellos
// las reservas (Booking) son los "hijos" que cuelgan del viaje. Un viaje agrupa varias reservas -> por eso [0..*].
{
    key Travel.travel_id as TravelID,
        Travel.customer_id as CustomerID,
        Travel.agency_id as AgencyID,
        _Customer, // estas 3 filas indican la posibilidad de exponer esa asociacion, 
        _Agency,   // se pone aquí para que aparezca como opción en la flechita al lado del nombre y podamos elegirla
        _Booking
}
// en la asociación hay que definir primero las asociaciones y después se definen los campos
