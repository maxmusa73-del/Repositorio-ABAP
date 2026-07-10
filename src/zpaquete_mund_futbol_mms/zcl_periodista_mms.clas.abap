CLASS zcl_periodista_mms DEFINITION
  PUBLIC
  INHERITING FROM zcl_acreditado_mms
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ENUM ty_tipo_prensa,
             escrita,
             television,
             radio,
             digital,
           END OF ENUM ty_tipo_prensa.

    DATA: medio_com         TYPE string,
          tipo_prensa       TYPE ty_tipo_prensa,
          acceso_zona_mixta TYPE abap_bool.

    METHODS:
      constructor
        IMPORTING
          i_nombre            TYPE string
          i_pais              TYPE string
          i_fecha             TYPE d
          i_num               TYPE string
          i_medio_com         TYPE string
          i_tipo_prensa       TYPE ty_tipo_prensa
          i_acceso_zona_mixta TYPE abap_bool,

      describir_pase REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_periodista_mms IMPLEMENTATION.

  METHOD constructor.

    super->constructor( i_nombre = i_nombre
                        i_pais   = i_pais
                        i_fecha  = i_fecha
                        i_num    = i_num ).

    medio_com         = i_medio_com.
    tipo_prensa       = i_tipo_prensa.
    acceso_zona_mixta = i_acceso_zona_mixta.

  ENDMETHOD.

  METHOD describir_pase.

    DATA(lv_acceso) = |Sala de prensa|.

    IF acceso_zona_mixta = abap_true.
      lv_acceso = lv_acceso && | y Zona Mixta|.
    ENDIF.

    rv_texto = |--- PASE DE PERIODISTA ---\n| &&
                 |Nombre: { nombre_completo } \n| &&
                 |País: { pais } \n| &&
                 |Accesos permitidos: { lv_acceso }.|.

  ENDMETHOD.


ENDCLASS.
