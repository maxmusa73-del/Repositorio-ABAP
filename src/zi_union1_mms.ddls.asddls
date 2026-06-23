@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'union alumno y empleado'
@Metadata.ignorePropagatedAnnotations: true
define view entity Zi_union1_mms 
as select from zbd_empleado_lbc
{
    key nombre as Nombre,
    $session.client as Cliente
   
}
