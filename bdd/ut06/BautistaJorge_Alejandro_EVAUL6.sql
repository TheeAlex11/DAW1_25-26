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

