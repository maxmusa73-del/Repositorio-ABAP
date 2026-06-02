CLASS zcl_fabrica_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: lv_nuevo_nombre TYPE string VALUE 'Juan'.
    data lv_total type i.

    METHODS:
        r_masivos RETURNING VALUE(rv_accion) TYPE string,

      r_individual RETURNING VALUE(rv_accion) TYPE string,

      e_random RETURNING VALUE(rv_accion) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fabrica_mms IMPLEMENTATION.




  METHOD r_masivos.
         DATA lt_nombres TYPE STANDARD TABLE OF string.  " Creamos una tabla interna de nombres

                                                     " Metemos los nombres de los alumnos en la tabla interna
    APPEND 'Sergio' TO lt_nombres.
    APPEND 'Alejandro' TO lt_nombres.
    APPEND 'Lidia' TO lt_nombres.
    APPEND 'Samuel' TO lt_nombres.
    APPEND 'Sarah' TO lt_nombres.
    APPEND 'Jose' TO lt_nombres.
    APPEND 'Luis' TO lt_nombres.
    APPEND 'Loli' TO lt_nombres.
    APPEND 'Rebeca' TO lt_nombres.
    APPEND 'Gonzalo' TO lt_nombres.
    APPEND 'Miguel' TO lt_nombres.
    APPEND 'Antonio' TO lt_nombres.
    APPEND 'Toñi' TO lt_nombres.
    APPEND 'David' TO lt_nombres.
    APPEND 'Adrián' TO lt_nombres.
    APPEND 'Rafa' TO lt_nombres.
    APPEND 'Cristian' TO lt_nombres.
    APPEND 'Alberto' TO lt_nombres.
    APPEND 'Juan' TO lt_nombres.


    DATA lv_id TYPE n LENGTH 4.


    LOOP AT lt_nombres INTO DATA(lv_nombre).        " Recorremos la tabla interna de nombres


      SELECT FROM zdb_alumnos_lbc                   " Contamos cuantos registros hay actualmente en la base de datos
        FIELDS COUNT( * )
        INTO @lv_total.


      lv_total = lv_total + 1.                  " El nuevo ID será el total de registros + 1
      lv_id = lv_total.


      INSERT zdb_alumnos_lbc FROM @(                " Insertamos el alumno en la base de datos
        VALUE #(
          client    = sy-mandt          "mandt o cliente se suele llamar
          id_alumno = lv_id
          nombre    = lv_nombre
        )
      ).

    ENDLOOP.

    COMMIT WORK.            "confirma por si mandamos  datos raros


    SELECT FROM zdb_alumnos_lbc         " Mostramos la tabla para comprobar que se han insertado los alumnos
      FIELDS client,
             id_alumno,
             nombre
      INTO TABLE @DATA(lt_alumnos).


  ENDMETHOD.




  METHOD r_individual.
DATA lv_nuevo_nombre TYPE string value 'Daniel'.
 DATA lv_id TYPE n LENGTH 4.
" Contamos registros actuales de la BD
    SELECT FROM zdb_alumnos_lbc
    FIELDS @abap_true           "si hay filas devuelveme una x
    INTO @DATA(lv_existe).

    IF lv_existe = abap_true.
                    " ya hay alguien con ese nombre -> NO insertar, avisar al usuario.
    ELSE.

    SELECT COUNT( * ) FROM zdb_alumnos_lbc INTO @DATA(lv_count2).
        lv_count2 = lv_count2 + 1.

        INSERT zdb_alumnos_lbc FROM @(
            VALUE #(
              id_alumno = lv_id
              nombre    = lv_nuevo_nombre
            )
          ).

    ENDIF.
    ENDSELECT.

  ENDMETHOD.




  METHOD e_random.

          SELECT FROM zdb_alumnos_lbc                   " Contamos cuantos registros hay actualmente en la base de datos
        FIELDS COUNT( * )
        INTO @lv_total.
         " Contamos cuantos alumnos hay


        DATA(lo_random) = cl_abap_random_int=>create(         " Creamos numero random
             seed = cl_abap_random=>seed( )
             min  = 1
             max  = lv_total ).


        DATA(lv_random) = lo_random->get_next( ).       " Generamos numero aleatorio

            SELECT FROM zdb_alumnos_lbc         " Mostramos la tabla para comprobar que se han insertado los alumnos
      FIELDS client,
             id_alumno,
             nombre
      INTO TABLE @DATA(lt_alumnos).

        READ TABLE lt_alumnos INTO DATA(ls_alumno_random) INDEX lv_random.      " Leemos esa posicion de la tabla

  ENDMETHOD.


ENDCLASS.

