
SET SERVEROUTPUT ON;

-- EJERCICIO 1
-- Procedimiento que muestra datos de un articulo y su fabricante

CREATE OR REPLACE PROCEDURE mostrar_articulo_fabricante (
    p_codigo IN NUMBER
)
IS
    v_nombre     VARCHAR2(100);
    v_precio     NUMBER;
    v_fabricante VARCHAR2(100);
BEGIN
    SELECT a.nombre, a.precio, f.nombre
    INTO v_nombre, v_precio, v_fabricante
    FROM articulos a
    JOIN fabricantes f ON a.fabricante = f.codigo
    WHERE a.codigo = p_codigo;

    DBMS_OUTPUT.PUT_LINE('Articulo: ' || v_nombre);
    DBMS_OUTPUT.PUT_LINE('Precio: ' || v_precio);
    DBMS_OUTPUT.PUT_LINE('Fabricante: ' || v_fabricante);
END;
/

-- Prueba Ejercicio 1
BEGIN
    mostrar_articulo_fabricante(1);
END;
/


-- EJERCICIO 2
-- Funcion que devuelve el total de ventas de un articulo

CREATE OR REPLACE FUNCTION total_ventas_articulo (
    p_codigo IN NUMBER
)
RETURN NUMBER
IS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM ventas
    WHERE articulo = p_codigo;

    RETURN v_total;
END;
/

-- Prueba Ejercicio 2
BEGIN
    DBMS_OUTPUT.PUT_LINE('Total ventas: ' || total_ventas_articulo(1));
END;
/


-- EJERCICIO 3
-- Procedimiento que devuelve la fecha y cantidad de la ultima venta

CREATE OR REPLACE PROCEDURE datos_ultima_venta (
    p_codigo   IN NUMBER,
    p_fecha    OUT DATE,
    p_cantidad OUT NUMBER
)
IS
BEGIN
    SELECT fecha_venta, cantidad
    INTO p_fecha, p_cantidad
    FROM ventas
    WHERE articulo = p_codigo
    AND fecha_venta = (SELECT MAX(fecha_venta) FROM ventas WHERE articulo = p_codigo);
END;
/

-- Prueba Ejercicio 3
DECLARE
    v_fecha    DATE;
    v_cantidad NUMBER;
BEGIN
    datos_ultima_venta(1, v_fecha, v_cantidad);
    DBMS_OUTPUT.PUT_LINE('Ultima venta: ' || v_fecha);
    DBMS_OUTPUT.PUT_LINE('Cantidad: ' || v_cantidad);
END;
/