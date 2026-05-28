CLASS zcl_alumnos_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_alumnos_mms IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

 TYPES: BEGIN OF ty_alumno,
             id     TYPE i,
             nombre TYPE string,
           END OF ty_alumno.


    DATA lt_alumnos TYPE TABLE OF ty_alumno WITH EMPTY KEY.
    DATA lv_id      TYPE i.
*
*    " Lista con los 18 alumnos de clase
    DATA(lt_nombres) = VALUE string_table(
      ( |Alba Gómez, Sergio| )
      ( |Anangono Tutasig, Karen Denisse| )
      ( |Ayala Doñas, Alejandro| )
      ( |Barnes Calancha, Lidia| )
      ( |Bureo Osuna, Jesús| )
      ( |Criado Romero, Samuel| )
      ( |Delgado Martín, Sarah| )
      ( |González de la Torre, José Antonio| )
      ( |Maldonado Hernández, Luis| )
      ( |Moreno Cabrera, María Dolores| )
      ( |Palacios Canales, Rebeca| )
      ( |Portillo Moral, Gonzalo| )
      ( |Prados Donaire, Miguel| )
      ( |Rojas Moreno, Antonio| )
      ( |Ruiz Rodríguez, Antonia| )
      ( |Sillero Fernández, David| )
      ( |Torres Albillo, Adrián| )
      ( |Vela Martínez, Rafael| ) ).


**    "================================================================
**    " PARTE 1a: RELLENAR LA TABLA DE BASE DE DATOS
**    "================================================================
**    " Vaciar primero para poder re-ejecutar la demo
*
*   DELETE FROM ztb_alumnos.
*
*    LOOP AT lt_nombres INTO DATA(lv_nombre).
*      " nº de registros actuales en la BD
*      SELECT COUNT(*) FROM ztb_alumnos INTO @DATA(lv_count). " el select count(*)  "pregunta" a la bd cuantos registros hay ahora mismo
*      " id del nuevo registro = nº de registros + 1
*      lv_id = lv_count + 1.
*      " insertar
*      INSERT ztb_alumnos FROM @( VALUE #( id     = lv_id
*                                          nombre = lv_nombre ) ).    " graba la fila . la @ antes del valor marca que es una variable de ABAP que entra en una
*                                                                     " sentencia SQL ( esto es obligatorio en la sintaxi moderna )
*    ENDLOOP.
*
*    out->write( |--- PARTE 1a: TABLA DE BASE DE DATOS (ztb_alumnos) ---| ).
*    SELECT id, nombre FROM ztb_alumnos ORDER BY id INTO TABLE @DATA(lt_bd).
*    LOOP AT lt_bd INTO DATA(ls_bd).
*      out->write( |{ ls_bd-id WIDTH = 3 }  { ls_bd-nombre }| ).
*    ENDLOOP.
*    out->write( || ).


       "================================================================
*    " PARTE 3: Subida individual de registros
*    "================================================================
    DATA lv_nuevo_nombre type string value 'Juan'.


     SELECT COUNT(*) FROM ztb_alumnos INTO @DATA(lv_count2).
      lv_id = lv_count2 + 1.
      INSERT ztb_alumnos FROM @( VALUE #( id     = lv_id
                                          nombre = lv_nuevo_nombre ) ).


*    "================================================================
*    " PARTE 1b: MISMA LÓGICA CON TABLA INTERNA (en memoria)
*    "================================================================
*    LOOP AT lt_nombres INTO lv_nombre.
*      " lines( ) cuenta las filas -> equivalente al COUNT(*) de la BD
*      lv_id = lines( lt_alumnos ) + 1.
*      INSERT VALUE #( id     = lv_id
*                      nombre = lv_nombre ) INTO TABLE lt_alumnos.
*    ENDLOOP.
*
*    out->write( |--- PARTE 1b: TABLA INTERNA (en memoria) ---| ).
*    LOOP AT lt_alumnos INTO DATA(ls).
*      out->write( |{ ls-id WIDTH = 3 }  { ls-nombre }| ).
*    ENDLOOP.
*    out->write( || ).


*    "================================================================
*    " PARTE 2: EXTRACCIÓN ALEATORIA (desde la BD)
*    "================================================================
    DATA lv_total TYPE i.
    SELECT COUNT(*) FROM ztb_alumnos INTO @lv_total.

    " Generador de enteros aleatorios entre 1 y lv_total (forma cloud-ready)
    DATA(lo_random) = cl_abap_random_int=>create(
     seed = cl_abap_random=>seed( )
      min  = 1
      max  = lv_total ).

    DATA(lv_rand_id) = lo_random->get_next( ).

    SELECT SINGLE * FROM ztb_alumnos
      WHERE id = @lv_rand_id
      INTO @DATA(ls_alumno).

    out->write( |--- PARTE 2: EXTRACCIÓN ALEATORIA ---| ).
    out->write( |Número aleatorio generado (1..{ lv_total }): { lv_rand_id }| ).
    out->write( |Alumno seleccionado: { ls_alumno-id } - { ls_alumno-nombre }| ).


  ENDMETHOD.
ENDCLASS.
