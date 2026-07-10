CLASS zcl_cp04_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PRIVATE SECTION.
    TYPES:
      BEGIN OF zst_booking_mms,
        id_reserva TYPE i,
        aerolinea  TYPE c LENGTH 2,
        num_vuelo  TYPE n LENGTH 4,
        pasajero   TYPE string,
        fecha      TYPE d,
        precio     TYPE p LENGTH 8 DECIMALS 2,
        estado     TYPE c LENGTH 1,
      END OF zst_booking_mms.

    TYPES ztt_bookings_mms TYPE STANDARD TABLE OF zst_booking_mms
      WITH KEY id_reserva.

    " --- Añadir esto para que compile la Tarea 2.5 ---
    TYPES:
      BEGIN OF ty_resumen,
        aerolinea    TYPE c LENGTH 2,
        num_reservas TYPE i,
        precio_total TYPE p LENGTH 10 DECIMALS 2,
        precio_medio TYPE p LENGTH 10 DECIMALS 2,
      END OF ty_resumen.

    TYPES tt_resumen TYPE STANDARD TABLE OF ty_resumen WITH EMPTY KEY.


ENDCLASS.
CLASS zcl_cp04_mms IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " --- Cargar datos iniciales ---
    DATA lt_reservas TYPE ztt_bookings_mms.

    lt_reservas = VALUE ztt_bookings_mms(
      ( id_reserva = 1  aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Ana García'    fecha = '20260515' precio = '899.00'  estado = 'A' )
      ( id_reserva = 2  aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Carlos López'  fecha = '20260515' precio = '120.00'  estado = 'A' )
      ( id_reserva = 3  aerolinea = 'AA' num_vuelo = '0017' pasajero = 'John Smith'    fecha = '20260520' precio = '450.50'  estado = 'A' )
      ( id_reserva = 4  aerolinea = 'LH' num_vuelo = '0455' pasajero = 'María Pérez'   fecha = '20260520' precio = '310.75'  estado = 'A' )
      ( id_reserva = 5  aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Pedro Ruiz'    fecha = '20260515' precio = '120.00'  estado = 'C' )
      ( id_reserva = 6  aerolinea = 'SQ' num_vuelo = '0026' pasajero = 'Lisa Tan'      fecha = '20260601' precio = '1250.00' estado = 'A' )
      ( id_reserva = 7  aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Hans Müller'   fecha = '20260515' precio = '899.00'  estado = 'A' )
      ( id_reserva = 8  aerolinea = 'AA' num_vuelo = '0064' pasajero = 'Sarah Jones'   fecha = '20260525' precio = '510.00'  estado = 'A' )
    ).

    " --- Tarea 2.1 – Altas de reservas ---

    APPEND VALUE zst_booking_mms(
      id_reserva = 9  aerolinea = 'IB' num_vuelo = '3950' pasajero = 'Elena Martín' fecha = '20260601' precio = '275.30' estado = 'A'
    ) TO lt_reservas.

    APPEND VALUE zst_booking_mms(
      id_reserva = 10 aerolinea = 'LH' num_vuelo = '2030' pasajero = 'Franz Weber'  fecha = '20260610' precio = '95.00'  estado = 'A'
    ) TO lt_reservas.

    out->write( '--- Tarea 2.1: Tabla completa tras las altas ---' ).
    out->write( lt_reservas ).


    " --- Tarea 2.2 – Modificaciones ---
    out->write( '' ).
    out->write( '--- Tarea 2.2: Modificaciones ---' ).

    " 1. Cambiar el precio de la reserva con ID 3
    READ TABLE lt_reservas ASSIGNING FIELD-SYMBOL(<fs_reserva>)
     WITH KEY id_reserva = 3.

    IF sy-subrc = 0.
      <fs_reserva>-precio = '480.00'.
    ENDIF.

    " 2. Aplicar descuento del 10% a todas las reservas de LH
    LOOP AT lt_reservas ASSIGNING FIELD-SYMBOL(<fs_lh>)
      WHERE aerolinea = 'LH'.
      <fs_lh>-precio = <fs_lh>-precio * '0.9'.
    ENDLOOP.

    " Mostrar los registros modificados
    LOOP AT lt_reservas INTO DATA(ls_mod)
      WHERE id_reserva = 3 OR aerolinea = 'LH'.

      out->write( |ID { ls_mod-id_reserva }: { ls_mod-aerolinea }-{ ls_mod-num_vuelo }, | &&
                  |{ ls_mod-pasajero }, nuevo precio: { ls_mod-precio } €| ).
    ENDLOOP.


    " Tarea 2.3 – Cancelaciones y borrados
    out->write( '' ).
    out->write( '--- Tarea 2.3: Cancelaciones y borrados ---' ).

    " 1. Cambiar el estado de la reserva ID 4 a cancelada
    READ TABLE lt_reservas ASSIGNING FIELD-SYMBOL(<fs_cancelar>)
      WITH KEY id_reserva = 4.

    IF sy-subrc = 0.
      <fs_cancelar>-estado = 'C'.
    ENDIF.

    " 2. Eliminar físicamente todas las reservas canceladas
    DELETE lt_reservas WHERE estado = 'C'.

    DATA(lv_eliminados) = sy-dbcnt.

    " 3. Mostrar resultado
    out->write( |Registros eliminados: { lv_eliminados }| ).
    out->write( lt_reservas ).


    " Tarea 2.4 – Búsquedas
    out->write( '' ).
    out->write( '--- Tarea 2.4: Búsquedas ---' ).

    " 1. Comprobar existencia de reserva para "Lisa Tan"
    READ TABLE lt_reservas TRANSPORTING NO FIELDS
      WITH KEY pasajero = 'Lisa Tan'.

    IF sy-subrc = 0.
      out->write( 'Existe una reserva para Lisa Tan.' ).
    ELSE.
      out->write( 'No existe ninguna reserva para Lisa Tan.' ).
    ENDIF.

    " 2. Referencia a la reserva con ID 6
    READ TABLE lt_reservas REFERENCE INTO DATA(lr_reserva6)
      WITH KEY id_reserva = 6.

    IF sy-subrc = 0.
      out->write( |Reserva ID { lr_reserva6->id_reserva }: | &&
                  |{ lr_reserva6->aerolinea }-{ lr_reserva6->num_vuelo }, | &&
                  |pasajero: { lr_reserva6->pasajero }, | &&
                  |precio: { lr_reserva6->precio } €, estado: { lr_reserva6->estado }| ).
    ENDIF.

    " 3. Acceso directo con expresión de tabla
    DATA(lv_pasajero_id1) = VALUE #( lt_reservas[ id_reserva = 1 ]-pasajero DEFAULT 'No encontrado' ).

    out->write( |Pasajero de la reserva ID 1: { lv_pasajero_id1 }| ).


    " Tarea 2.5 – Agrupación y agregados
    out->write( '' ).
    out->write( '--- Tarea 2.5: Informe por aerolínea ---' ).

    DATA lt_resumen TYPE tt_resumen.

    LOOP AT lt_reservas INTO DATA(ls_res) WHERE estado = 'A'
      GROUP BY ls_res-aerolinea ASCENDING
      INTO DATA(group_key).

      DATA(lv_num_reservas) = REDUCE i(
        INIT n = 0
        FOR ls_g IN GROUP group_key
        NEXT n = n + 1
      ).

      DATA(lv_precio_total) = REDUCE #(
        INIT t = CONV zst_booking_mms-precio( '0.00' )
        FOR ls_g2 IN GROUP group_key
        NEXT t = t + ls_g2-precio
      ).

      DATA(lv_precio_medio) = round( val = lv_precio_total / lv_num_reservas dec = 2 ).

      APPEND VALUE ty_resumen(
        aerolinea    = group_key
        num_reservas = lv_num_reservas
        precio_total = lv_precio_total
        precio_medio = lv_precio_medio
      ) TO lt_resumen.

    ENDLOOP.

    " Mostrar el informe
    LOOP AT lt_resumen INTO DATA(ls_resumen).
      out->write( |Aerolínea { ls_resumen-aerolinea }: | &&
                  |{ ls_resumen-num_reservas } reservas, | &&
                  |total { ls_resumen-precio_total } €, | &&
                  |media { ls_resumen-precio_medio } €| ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
*&---------------------------------------------------------------*
*& Reflexión Tarea 4.6
*&---------------------------------------------------------------*
* 1) Ventajas de tipos del diccionario vs. tipos locales:
*    - Reutilización: el mismo tipo lo puede usar cualquier clase,
*      CDS view, BAPI, RAP business object, etc.
*    - Consistencia: si cambia la longitud de "aerolinea", se cambia
*      en UN solo sitio (el elemento de datos) y se propaga a todo
*      el sistema que lo use.
*    - Semántica y documentación: etiquetas de campo, ayuda F1,
*      textos que se muestran automáticamente en UIs (Fiori, ALV).
*    - Mejor integración con CDS views, Fiori Elements y RAP, que
*      "leen" las etiquetas y tipos del DDIC para generar pantallas.
*    - Facilita el análisis de impacto (where-used) a nivel de
*      sistema completo, no solo dentro de una clase.
*
* 2) ¿Cuándo seguir usando TYPES locales?
*    - Tipos auxiliares de uso interno, sin significado de negocio
*      (p.ej. una tabla temporal de resultados intermedios de un
*      algoritmo, solo usada dentro de un método privado).
*    - Prototipos rápidos o pruebas de concepto, donde crear objetos
*      DDIC sería sobrecarga innecesaria.
*    - Tipos que dependen de la lógica del propio programa y no
*      tienen sentido fuera de él (no se van a reutilizar).
*
* 3) Elementos de datos y dominios (ABAP clásico) vs. ABAP Cloud:
*    - En ABAP clásico: un DOMINIO define el tipo técnico y los
*      valores fijos/rango (p.ej. dominio con longitud 1 y valores
*      fijos 'A'/'C'). El ELEMENTO DE DATOS referencia un dominio
*      y añade las etiquetas de campo y textos de ayuda.
*      Relación: Dominio (técnico) -> Elemento de datos (semántico)
*                -> Campo de estructura/tabla.
*    - En ABAP Cloud: el concepto de "dominio" clásico normalmente
*      NO se expone/usa; los elementos de datos se basan
*      directamente en tipos predefinidos (Built-in Types como
*      CHAR, NUMC, INT4, DEC, etc.), sin domino intermedio.
*      La validación de valores fijos ('A'/'C') se suele resolver
*      con listas de valores fijos vía anotaciones CDS
*      (@ObjectModel.text.element, value help/CDS con
*      @Consumption.valueHelpDefinition) en vez de con dominios.
*    - Es decir: SÍ existe la idea de "tipo técnico + semántica",
*      pero en Cloud se simplifica a "elemento de datos sobre
*      tipo predefinido", sin la capa de dominio clásica.
*&---------------------------------------------------------------*

