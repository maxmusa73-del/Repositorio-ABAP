@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS base datos empleados'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_EMPLEADOS_MMS 
as select from zbd_empleado_der
{
    key nombre as Nombre,
    key edad as Edad,
    
    case correo
        when 'pepa@com' then 'Correo_Pepe'
        when 'daniel@com' then 'Correo_Daniel'
        when 'julia@com' then 'Correo_Julia'
        else 'es otro correo distinto'
     end as Case1
}
