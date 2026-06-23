@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Asociación con parámetros'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_13_MMS 
with parameters
    pcountryCode : land1, // estamos declarando el parámetro de tipo land1, para recibir un valor antes de ejecutar un programa para metérselo a un variable
    pCiudad : /dmo/city  // el tipo se pone el de la base de datos de ese campo
as select from /dmo/agency
{
    key agency_id as AgencyId,
    name          as Name,
    street        as Street,
    postal_code   as PostalCode,
    city          as City,
    country_code  as CountryCode,
    phone_number  as PhoneNumber,
    email_address as EmailAddress,
    web_address   as WebAddress,
    attachment    as Attachment,
    mime_type     as MimeType,
    filename      as Filename
    
    }
    where
    city = $parameters.pCiudad and country_code = $parameters.pcountryCode; //CountryCode será el valor que se ejecute manualmente
// pCiudad podemos llamarlo como queramos, lo importante es que coincidan ambos al principio y al final.
