CLASS zcl_cp01_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES:
      BEGIN OF ty_vuelo,
        aerolinea     TYPE string,
        num_vuelo     TYPE c LENGTH 4,
        origen        TYPE c LENGTH 3,
        destino       TYPE c LENGTH 3,
        precio        TYPE p LENGTH 8 DECIMALS 2,
        plazas_libres TYPE i,
      END OF ty_vuelo.

    TYPES tt_vuelos TYPE STANDARD TABLE OF ty_vuelo WITH EMPTY KEY.

ENDCLASS.



CLASS zcl_cp01_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " --- Declarar y rellenar la tabla de vuelos ---
    DATA lt_vuelos TYPE tt_vuelos.

    lt_vuelos = VALUE tt_vuelos(
     ( aerolinea = 'LH' num_vuelo = '0400' origen = 'FRA' destino = 'JFK' precio = '899.00'  plazas_libres = 15 )
     ( aerolinea = 'AA' num_vuelo = '0017' origen = 'JFK' destino = 'SFO' precio = '450.50'  plazas_libres = 0  )
     ( aerolinea = 'IB' num_vuelo = '3740' origen = 'MAD' destino = 'BCN' precio = '120.00'  plazas_libres = 42 )
     ( aerolinea = 'LH' num_vuelo = '0455' origen = 'FRA' destino = 'MAD' precio = '310.75'  plazas_libres = 8  )
     ( aerolinea = 'AA' num_vuelo = '0064' origen = 'SFO' destino = 'JFK' precio = '510.00'  plazas_libres = 3  )
     ( aerolinea = 'IB' num_vuelo = '3950' origen = 'BCN' destino = 'LHR' precio = '275.30'  plazas_libres = 0  )
     ( aerolinea = 'LH' num_vuelo = '2030' origen = 'MUC' destino = 'FRA' precio = '95.00'   plazas_libres = 60 )
     ( aerolinea = 'SQ' num_vuelo = '0026' origen = 'SIN' destino = 'FRA' precio = '1250.00' plazas_libres = 5  )
   ).

    " --- Tarea 1.1: Clasificación por precio ---
    out->write( '--- Tarea 1.1: Clasificación por precio ---' ).
    LOOP AT lt_vuelos INTO DATA(ls_vuelo).

      DATA(lv_categoria) = COND string(
        WHEN ls_vuelo-precio < 150   THEN 'Económico'
        WHEN ls_vuelo-precio <= 500  THEN 'Estándar'
        WHEN ls_vuelo-precio <= 1000 THEN 'Premium'
        ELSE 'First Class'
      ).

      out->write( |{ ls_vuelo-aerolinea } { ls_vuelo-num_vuelo }: | &&
                  |{ ls_vuelo-origen } -> { ls_vuelo-destino }, | &&
                  |precio { ls_vuelo-precio } € => { lv_categoria }| ).

    ENDLOOP.


    " --- Tarea 1.2: Filtrado de operadores lógicos ---

    out->write( '' ).
    out->write( '--- Tarea 1.2: Vuelos con plazas, relacionados con FRA y precio <= 1000 € ---' ).

    DATA lt_vuelos_fra TYPE tt_vuelos.

    LOOP AT lt_vuelos INTO ls_vuelo
      WHERE plazas_libres > 0
        AND ( origen = 'FRA' OR destino = 'FRA' )
        AND precio <= 1000.
      APPEND ls_vuelo TO lt_vuelos_fra.
    ENDLOOP.

    LOOP AT lt_vuelos_fra INTO DATA(ls_vuelo_fra).
      out->write( |{ ls_vuelo_fra-aerolinea } { ls_vuelo_fra-num_vuelo }: | &&
                  |{ ls_vuelo_fra-origen } -> { ls_vuelo_fra-destino }, | &&
                  |precio { ls_vuelo_fra-precio } â¬, | &&
                  |plazas libres: { ls_vuelo_fra-plazas_libres }| ).
    ENDLOOP.

    " Tarea 1.3 – Transformación de cadenas
    out->write( '' ).
    out->write( '--- Tarea 1.3: Transformación de cadenas ---' ).

    LOOP AT lt_vuelos_fra INTO DATA(ls_vuelo_13).

      DATA(lv_codigo)       = ls_vuelo_13-aerolinea && '-' && ls_vuelo_13-num_vuelo.
      DATA(lv_destino_min)  = to_lower( ls_vuelo_13-destino ).
      DATA(lv_longitud)     = strlen( lv_codigo ).

      out->write( |{ lv_codigo } | && '|' && | { lv_destino_min } | && '|' && | { lv_longitud }| ).

    ENDLOOP.

    " Tarea 1.4 - Resumen con funciones numéricas
    out->write( '' ).
    out->write( '--- Tarea 1.4: Resumen numérico ---' ).

    " Precio máximo
    DATA(lv_precio_max) = REDUCE #(
      INIT max_val = lt_vuelos[ 1 ]-precio
      FOR ls_v IN lt_vuelos
      NEXT max_val = COND #( WHEN ls_v-precio > max_val THEN ls_v-precio ELSE max_val )
    ).

    " Precio mínimo
    DATA(lv_precio_min) = REDUCE #(
      INIT min_val = lt_vuelos[ 1 ]-precio
      FOR ls_v2 IN lt_vuelos
      NEXT min_val = COND #( WHEN ls_v2-precio < min_val THEN ls_v2-precio ELSE min_val )
    ).

    " Suma de precios y número de vuelos (para la media)
    DATA(lv_suma_precios) = REDUCE #(
      INIT suma = 0
      FOR ls_v3 IN lt_vuelos
      NEXT suma = suma + ls_v3-precio
    ).

    DATA(lv_num_vuelos) = lines( lt_vuelos ).

    " Precio medio redondeado a 2 decimales
    DATA(lv_precio_medio) = round( val = lv_suma_precios / lv_num_vuelos dec = 2 ).

    " Total de plazas libres
    DATA(lv_total_plazas) = REDUCE i(
      INIT total = 0
      FOR ls_v4 IN lt_vuelos
      NEXT total = total + ls_v4-plazas_libres
    ).

    " Mostrar resultados
    out->write( |Precio máximo: { lv_precio_max } €| ).
    out->write( |Precio mínimo: { lv_precio_min } €| ).
    out->write( |Precio medio: { lv_precio_medio } €| ).
    out->write( |Total de plazas libres: { lv_total_plazas }| ).


  ENDMETHOD.
ENDCLASS.
