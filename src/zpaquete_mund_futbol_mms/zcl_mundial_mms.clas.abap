CLASS zcl_mundial_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mundial_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  "Instanciamos el Jugador
    DATA(lo_jugador) = NEW zcl_jugador_mms(
      i_nombre         = 'Lamine Yamal'
      i_pais           = 'España'
      i_fecha          = '20261231'
      i_num            = 'J-199-FIFA'
      i_dorsal         = 19
      i_posicion       = zcl_jugador_mms=>delantero
      i_convocado      = abap_true
    ).

    "Instanciamos el Periodista
    DATA(lo_periodista) = NEW zcl_periodista_mms(
      i_nombre            = 'Laura Martín'
      i_pais              = 'España'
      i_fecha             = '20261231'
      i_num               = 'P-554-RADIO'
      i_medio_com         = 'Canal Sur Radio'
      i_tipo_prensa       = zcl_periodista_mms=>radio
      i_acceso_zona_mixta = abap_true
    ).

    "Mostrar los resultados
    out->write( '=== SISTEMA DE ACREDITACIONES MUNDIAL ===' ).

    "Muestra la descripción del pase del jugador
    out->write( lo_jugador->describir_pase( ) ).

    out->write( '--------------------------------------------------' ).

    "Muestra la descripción del pase del periodista
    out->write( lo_periodista->describir_pase( ) ).



  ENDMETHOD.
ENDCLASS.
