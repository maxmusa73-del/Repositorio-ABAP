@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_5_MMS 
as select from /dmo/customer
{
  key customer_id as CustomerID,
  
    case country_code 
        when 'US' then concat('United States - ', concat_with_space( last_name, first_name, 4))
        when 'DE' then 'Germany'
        when ' ES' then 'Spain'
        else 'es otro código'
     end as Case1,
   
    $session.client as Cliente,   //  el mandante
    $session.system_date as ClientField,  //  fecha actual del servidor SAP
    $session.system_language as systemidioma,  //  idioma del sistema
    $session.user as UserField,    // es el ID del usuario logeado
    $session.user_date as userDate,   //  fecha local del usuario
    $session.user_timezone as userTZ   //  zona horaria del usuario
   
}
