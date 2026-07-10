@AbapCatalog.sqlViewName: 'ZV_ALUMNOS'    // Nombre tecnico para la vista SQL
@AbapCatalog.compiler.compareFilter: true // Optimiza sincronizacion de filtros
@AccessControl.authorizationCheck: #NOT_REQUIRED // Sin control de autorizaciones (ajusta segun tus necesidades)
@EndUserText.label: 'Vista CDS de Alumnos'
define view ZALUMNOS_MMS_V
       as select from zalumnos_mms 
{
  key alumno_id,
      nombre,
      apellidos,
      email,
      fecha_nac,
      ciudad,
      curso_actual,
      nota_media,
      activo
}
