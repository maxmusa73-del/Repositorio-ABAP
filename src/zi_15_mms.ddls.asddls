@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Asociación a otros CDS'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_15_MMS 
with parameters
    pcountryCode : land1
as select from /dmo/travel as Travel

association[1..1] to zi_cds_13_der as _Agency on _Agency.AgencyId = $projection.AgencyId
{
    key travel_id                                                                as TravelId,
        Travel.agency_id                                                         as AgencyId,
        _Agency(pCountryCode : $parameters.pcountryCode )[City = 'Chicago'].Name as AgencyName
}
