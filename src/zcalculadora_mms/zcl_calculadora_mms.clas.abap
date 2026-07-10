CLASS zcl_calculadora_mms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      sumar IMPORTING num1          TYPE zdecimal2_25
                      num2          TYPE zdecimal2_25
            RETURNING VALUE(result) TYPE zdecimal2_25,

      restar IMPORTING num1          TYPE zdecimal2_25
                       num2          TYPE zdecimal2_25
             RETURNING VALUE(result) TYPE zdecimal2_25,

      multiplicar IMPORTING num1          TYPE zdecimal2_25
                            num2          TYPE zdecimal2_25
                  RETURNING VALUE(result) TYPE zdecimal2_25,

      dividir IMPORTING num1          TYPE zdecimal2_25
                        num2          TYPE zdecimal2_25
              RETURNING VALUE(result) TYPE zdecimal2_25
              RAISING   cx_sy_zerodivide zcx_resultado_no_valido_mms.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calculadora_mms IMPLEMENTATION.

  METHOD sumar.

    result = num1 + num2.

  ENDMETHOD.

  METHOD restar.

    result = num1 - num2.

  ENDMETHOD.

  METHOD multiplicar.

    result = num1 * num2.

  ENDMETHOD.

  METHOD dividir.
    IF num2 = 0.
      RAISE EXCEPTION TYPE cx_sy_zerodivide.
    ENDIF.
    result = num1 / num2.

    " si la calculadora no pudiera dar el resultado 100.

    IF result = 100.

      RAISE EXCEPTION NEW zcx_resultado_no_valido_mms( valor = result ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
