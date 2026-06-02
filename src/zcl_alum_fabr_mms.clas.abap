CLASS zcl_alum_fabr_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

   DATA lv_alumno type string.
  METHODS: cargardegolpe_alumnos returning value(rv_resultado) TYPE string. " metodo / funcion
  METHODS: entrada_alumno RETURNING VALUE(rv_accion) type zbd_alumnos_mms. " metodo / funcion
  METHODS: random RETURNING VALUE(rv_random) type string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_alum_fabr_mms IMPLEMENTATION.


 METHOD cargardegolpe_alumnos.

* DECLARACIÓN DE ESTRUCTURAS:
    TYPES: BEGIN OF ty_alumno,
             registro_id TYPE i,
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


 LOOP AT lt_nombres INTO DATA(lv_nombre).
      " nº de registros actuales en la BD
      SELECT COUNT(*) FROM zbd_alumnos_MMS INTO @DATA(lv_count). " el select count(*)  "pregunta" a la bd cuantos registros hay ahora mismo
      " id del nuevo registro = nº de registros + 1
      lv_id = lv_count + 1.
      " insertar
      INSERT zbd_alumnos_MMS FROM @( VALUE #( registro_id     = lv_id
                                          nombre = lv_nombre ) ).    " graba la fila . la @ antes del valor marca que es una variable de ABAP que entra en una
                                                                     " sentencia SQL ( esto es obligatorio en la sintaxis moderna )
    ENDLOOP.



*SELECT id, nombre FROM ztb_alumnos_mms ORDER BY id INTO TABLE @DATA(lt_bd).
*    LOOP AT lt_bd INTO DATA(ls_bd).
*
*    ENDLOOP.
*

  ENDMETHOD.


  METHOD entrada_alumno.


        Data lv_chek type i value 0.
        DATA lv_id      TYPE i.
        " lv_nombre es el nombre que vas a insertar

        SELECT FROM zbd_alumnos_MMS
        FIELDS *
        INTO TABLE @DATA(lv_existe).

       loop at lv_existe into data(ls_nueva).

        if ls_nueva-nombre = lv_alumno.
             lv_chek = 1.

        endif.


       ENDLOOP.


          if lv_chek = 0.

          SELECT COUNT(*) FROM zbd_alumnos_MMS INTO @DATA(lv_count2).
              lv_id = lv_count2 + 1.
              INSERT zbd_alumnos_MMS FROM @( VALUE #( registro_id     = lv_id
                                                  nombre = lv_alumno ) ).
          endif.


  ENDMETHOD.

  METHOD random.

   DATA lv_total TYPE i.
    SELECT COUNT(*) FROM zbd_alumnos_MMS INTO @lv_total.

        " Generador de enteros aleatorios entre 1 y lv_total (forma cloud-ready)
        DATA(lv_random) = cl_abap_random_int=>create(
         seed = cl_abap_random=>seed( )
          min  = 1
          max  = lv_total ).

        DATA(lv_rand_id) = lv_random->get_next( ).

        SELECT SINGLE * FROM zbd_alumnos_MMS
          WHERE registro_id = @lv_rand_id
          INTO @DATA(ls_alumno).



       rv_random = | El numero aleatorio es: { lv_rand_id }  el alumno ganador es: { ls_alumno-nombre }    | .

  ENDMETHOD.

ENDCLASS.
