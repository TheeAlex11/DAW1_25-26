SET SERVEROUTPUT ON;

-- CFGS DAW - BASES DE DATOS | UT06 ACT04
-- Alumno: Jorge Alejandro Bautista | Curso 25-26

-- ============================================================
-- EJ1: IF - aplicar_descuento(p_cod)
-- precio <= 50 -> -5% | precio > 50 -> -2%
-- uso: exec aplicar_descuento(1);
-- ============================================================

CREATE OR REPLACE PROCEDURE aplicar_descuento(p_cod IN NUMBER)
IS
    v_precio NUMBER;
BEGIN
    SELECT precio INTO v_precio FROM articulos WHERE codigo = p_cod;

    IF v_precio <= 50 THEN
        UPDATE articulos SET precio = precio * 0.95 WHERE codigo = p_cod;
        DBMS_OUTPUT.PUT_LINE('Descuento 5% aplicado. Antes: ' || v_precio || ' euros');
    ELSE
        UPDATE articulos SET precio = precio * 0.98 WHERE codigo = p_cod;
        DBMS_OUTPUT.PUT_LINE('Descuento 2% aplicado. Antes: ' || v_precio || ' euros');
    END IF;

    COMMIT;
END;
/

-- ============================================================
-- EJ2: CASE - accion_articulo(p_accion, p_cod)
-- 1 = mostrar | 2 = borrar | otro = datos completos
-- uso: exec accion_articulo(1, 3);
-- ============================================================

CREATE OR REPLACE PROCEDURE accion_articulo(p_accion IN NUMBER, p_cod IN NUMBER)
IS
    v_nombre  articulos.nombre%TYPE;
    v_precio  articulos.precio%TYPE;
    v_fab     articulos.fabricante%TYPE;
BEGIN
    SELECT nombre, precio, fabricante INTO v_nombre, v_precio, v_fab
    FROM articulos WHERE codigo = p_cod;

    CASE p_accion
        WHEN 1 THEN
            DBMS_OUTPUT.PUT_LINE('Articulo: ' || v_nombre || ' - ' || v_precio || ' euros');
        WHEN 2 THEN
            DELETE FROM articulos WHERE codigo = p_cod;
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Articulo ' || v_nombre || ' eliminado.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Codigo: '     || p_cod);
            DBMS_OUTPUT.PUT_LINE('Nombre: '     || v_nombre);
            DBMS_OUTPUT.PUT_LINE('Precio: '     || v_precio || ' euros');
            DBMS_OUTPUT.PUT_LINE('Fabricante: ' || v_fab);
    END CASE;
END;
/

-- ============================================================
-- EJ3: WHILE - contador_suma(p_num, p_suma OUT)
-- cuenta desde p_num hasta 0 y devuelve la suma acumulada
-- uso: declare v number; begin contador_suma(5, v); dbms_output.put_line(v); end;
-- ============================================================

CREATE OR REPLACE PROCEDURE contador_suma(p_num IN NUMBER, p_suma OUT NUMBER)
IS
    v_cont NUMBER := p_num;
    v_acum NUMBER := 0;
BEGIN
    WHILE v_cont > 0 LOOP
        DBMS_OUTPUT.PUT_LINE('Contador: ' || v_cont);
        v_acum := v_acum + v_cont;
        v_cont := v_cont - 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Contador llego a 0.');
    p_suma := v_acum;
END;
/

-- ============================================================
-- EJ4: FUNCION - incremento_global(p_valor)
-- calcula p_valor*2, lo suma a todos los precios y lo devuelve
-- uso: declare v number; begin v := incremento_global(10); dbms_output.put_line(v); end;
-- ============================================================

CREATE OR REPLACE FUNCTION incremento_global(p_valor IN NUMBER)
RETURN NUMBER
IS
    v_inc NUMBER := p_valor * 2;
BEGIN
    UPDATE articulos SET precio = precio + v_inc;
    COMMIT;
    RETURN v_inc;
END;
/


-- ============================================================
-- PRUEBAS
-- ============================================================

-- ej1: descuento 5% (precio bajo)
BEGIN aplicar_descuento(3); END;
/
-- ej1: descuento 2% (precio alto)
BEGIN aplicar_descuento(1); END;
/

-- ej2: accion 1 - mostrar
BEGIN accion_articulo(1, 2); END;
/
-- ej2: accion otro - datos completos
BEGIN accion_articulo(5, 2); END;
/
-- ej2: accion 2 - borrar (comentado por seguridad)
-- BEGIN accion_articulo(2, 9); END;
-- /

-- ej3: suma acumulada del 5 al 1
DECLARE v NUMBER;
BEGIN contador_suma(5, v); DBMS_OUTPUT.PUT_LINE('Suma: ' || v); END;
/

-- ej4: suma 20 euros a todos los articulos
DECLARE v NUMBER;
BEGIN v := incremento_global(10); DBMS_OUTPUT.PUT_LINE('Incremento: ' || v || ' euros'); END;
/


-- ============================================================
-- PREGUNTAS TEORICAS
-- ============================================================

-- 1. Diferencia entre IF y CASE?
-- IF evalua cualquier condicion booleana, mas flexible.
-- CASE compara un valor contra opciones fijas, mas legible para valores concretos.

-- 2. Cuando usar WHILE?
-- Cuando no se sabe de antemano cuantas veces se repite.
-- Si el numero de iteraciones es fijo, mejor un FOR.

-- 3. Por que SELECT INTO antes del UPDATE en ej1?
-- Necesitamos el precio actual para que el IF pueda decidir que descuento aplicar.
-- Sin leerlo antes, no tenemos el dato para la condicion.

-- 4. Que pasa si el bucle no esta bien controlado?
-- Bucle infinito: bloquea la sesion y hay que matarla manualmente.
-- Por eso decrementamos v_cont en cada iteracion para que llegue a 0.

-- 5. Por que la funcion del ej4 modifica datos?
-- En Oracle es posible hacer UPDATE dentro de una funcion.
-- No es buena practica si se llama desde un SELECT, pero aqui se usa de forma directa.
-- El ejercicio pide funcion con RETURN, de lo contrario seria mas correcto un procedimiento.