CLASS zcl_probar_calc_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.




CLASS zcl_probar_calc_mms IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "si no sale buscar en las clases del profesor que acaban en "_25".

    DATA(lo_calculadora) = NEW zcl_calculadora_mms(  ).
    out->write( lo_calculadora->sumar( num1 = 1 num2 = 2 ) ).
    out->write( lo_calculadora->restar( num1 = 1 num2 = 3 ) ).
    out->write( lo_calculadora->multiplicar( num1 = 1 num2 = 4 ) ).
    out->write( lo_calculadora->dividir( num1 = 100 num2 = 5 ) ).

    TRY.
*    out->write( lo_calculadora->dividir( num1 =100 num2 = 0 ) ).
        out->write( lo_calculadora->dividir( num1 = 200 num2 = 2 ) ).
      CATCH cx_sy_zerodivide INTO DATA(lo_excepcion).
        out->write( lo_excepcion->get_text(  ) ).
      CATCH zcx_resultado_no_valido_mms INTO DATA(lo_excepcion2).
        out->write( | El valor { lo_excepcion2->valor } no está permitido | ).
*      CATCH cx_root. "esto no se ejecuta porque se ha capturado la anterior.
*        out->write( 'No se puede dividir por zero' ).
    ENDTRY.

*    " Recuperando de la BD
*    SELECT * FROM /dmo/connection INTO TABLE @DATA(lt_conexiones).
*    IF sy-subrc = 0.
*
*      " Leemos de la tabla interna --> FORMA TRADICIONAL. EL SY-SUBRC NO SIRVE CON LA DECLARACIÓN MODERNA.
*      READ TABLE lt_conexiones INTO DATA(ls_conexion)
*      WITH KEY connection_id = 0060.
*      IF sy-subrc = 0.
*        out->write( ls_conexion ).
*      ELSE.
*        out->write( 'No se ha encontrado ninguna conexión' ).
*      ENDIF.
*
*      " Leemos de la tabla interna --> FORMA NUEVA. ESTAMOS OBLIGADOS A USAR LA EXCEPCION.
*      TRY.
*          DATA(ls_conexion) = lt_conexiones[ connection_id = 0060 ].
*          out->write( ls_conexion ).
*        CATCH cx_root. "ESTA EXCEPCION ES PADRE, CAPTURA TODAS.
*        CATCH cx_sy_itab_line_not_found INTO DATA(lo_excepcion).
*          out->write( 'No se ha encontrado la conexión' ).
*          out->write( lo_excepcion->get_text(  ) ).
*      ENDTRY.
*
*    ENDIF.

  ENDMETHOD.
ENDCLASS.
