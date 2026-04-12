SET SERVEROUTPUT ON;

-- ejercicio 1
-- cuenta los articulos de un fabricante
-- uso: declare v number; begin contar_articulos(1, v); dbms_output.put_line(v); end;

CREATE OR REPLACE PROCEDURE contar_articulos(
    p_fab IN NUMBER,
    p_total OUT NUMBER
)
IS
BEGIN
    SELECT COUNT(*) INTO p_total
    FROM articulos
    WHERE fabricante = p_fab;
END;
/

-- ejercicio 2
-- muestra los articulos de un fabricante
-- uso: exec listar_articulos(1);

CREATE OR REPLACE PROCEDURE listar_articulos(
    p_fab IN NUMBER
)
IS
BEGIN
    FOR r IN (SELECT nombre, precio FROM articulos WHERE fabricante = p_fab) LOOP
        DBMS_OUTPUT.PUT_LINE(r.nombre || ' - ' || r.precio || ' euros');
    END LOOP;
END;
/

-- ejercicio 3
-- muestra articulos con precio de un fabricante
-- uso: exec listar_articulos_precio(1);

CREATE OR REPLACE PROCEDURE listar_articulos_precio(
    p_fab IN NUMBER
)
IS
BEGIN
    FOR r IN (SELECT nombre, precio FROM articulos WHERE fabricante = p_fab) LOOP
        DBMS_OUTPUT.PUT_LINE(r.nombre || ' --> ' || r.precio || ' euros');
    END LOOP;
END;
/

-- ejercicio 4
-- igual que antes pero ordenado por precio
-- uso: exec listar_articulos_ordenados(1);

CREATE OR REPLACE PROCEDURE listar_articulos_ordenados(
    p_fab IN NUMBER
)
IS
BEGIN
    FOR r IN (SELECT nombre, precio FROM articulos WHERE fabricante = p_fab ORDER BY precio) LOOP
        DBMS_OUTPUT.PUT_LINE(r.nombre || ' - ' || r.precio || ' euros');
    END LOOP;
END;
/

-- ejercicio 5
-- muestra todos los fabricantes
-- uso: exec listar_fabricantes;

CREATE OR REPLACE PROCEDURE listar_fabricantes
IS
BEGIN
    FOR r IN (SELECT codigo, nombre, ciudad FROM fabricantes) LOOP
        DBMS_OUTPUT.PUT_LINE(r.codigo || ' ' || r.nombre || ' ' || r.ciudad);
    END LOOP;
END;
/

-- ejercicio 6
-- devuelve el max min y la media de precios de un fabricante
-- uso:
-- declare v1 number; v2 number; v3 number;
-- begin calcular_max_min_media(1, v1, v2, v3);
-- dbms_output.put_line(v1 || ' ' || v2 || ' ' || v3); end;

CREATE OR REPLACE PROCEDURE calcular_max_min_media(
    p_fab IN NUMBER,
    p_max OUT NUMBER,
    p_min OUT NUMBER,
    p_media OUT NUMBER
)
IS
BEGIN
    SELECT MAX(precio), MIN(precio), AVG(precio)
    INTO p_max, p_min, p_media
    FROM articulos
    WHERE fabricante = p_fab;
END;
/

-- ejercicio 7
-- comprueba si un fabricante existe, devuelve 1 o 0
-- uso: declare v number; begin existe_fabricante(1, v); dbms_output.put_line(v); end;

CREATE OR REPLACE PROCEDURE existe_fabricante(
    p_fab IN NUMBER,
    p_existe OUT NUMBER
)
IS
    v number;
BEGIN
    SELECT COUNT(*) INTO v FROM fabricantes WHERE codigo = p_fab;
    IF v > 0 THEN
        p_existe := 1;
    ELSE
        p_existe := 0;
    END IF;
END;
/

-- ejercicio 8
-- suma total del precio de los articulos de un fabricante
-- uso: declare v number; begin total_precio_articulos(1, v); dbms_output.put_line(v); end;

CREATE OR REPLACE PROCEDURE total_precio_articulos(
    p_fab IN NUMBER,
    p_total OUT NUMBER
)
IS
BEGIN
    SELECT SUM(precio) INTO p_total
    FROM articulos
    WHERE fabricante = p_fab;
END;
/

-- ejercicio 9
-- muestra articulos que cuesten mas que el precio que le pasas
-- uso: exec articulos_caros(200);

CREATE OR REPLACE PROCEDURE articulos_caros(
    p_precio IN NUMBER
)
IS
BEGIN
    FOR r IN (SELECT nombre, precio FROM articulos WHERE precio > p_precio) LOOP
        DBMS_OUTPUT.PUT_LINE(r.nombre || ' - ' || r.precio || ' euros');
    END LOOP;
END;
/

-- ejercicio 10
-- actualiza el precio de un articulo
-- uso: exec actualizar_precio(1, 99);

CREATE OR REPLACE PROCEDURE actualizar_precio(
    p_cod IN NUMBER,
    p_precio IN NUMBER
)
IS
BEGIN
    UPDATE articulos SET precio = p_precio WHERE codigo = p_cod;
    COMMIT;
END;
/


-- PRUEBAS

-- ej1
DECLARE
    v NUMBER;
BEGIN
    contar_articulos(1, v);
    DBMS_OUTPUT.PUT_LINE('articulos: ' || v);
END;
/

-- ej2
BEGIN
    listar_articulos(1);
END;
/

-- ej3
BEGIN
    listar_articulos_precio(2);
END;
/

-- ej4
BEGIN
    listar_articulos_ordenados(1);
END;
/

-- ej5
BEGIN
    listar_fabricantes;
END;
/

-- ej6
DECLARE
    v1 NUMBER;
    v2 NUMBER;
    v3 NUMBER;
BEGIN
    calcular_max_min_media(1, v1, v2, v3);
    DBMS_OUTPUT.PUT_LINE('max: ' || v1 || ' min: ' || v2 || ' media: ' || v3);
END;
/

-- ej7
DECLARE
    v NUMBER;
BEGIN
    existe_fabricante(1, v);
    DBMS_OUTPUT.PUT_LINE('existe: ' || v);
    existe_fabricante(99, v);
    DBMS_OUTPUT.PUT_LINE('existe: ' || v);
END;
/

-- ej8
DECLARE
    v NUMBER;
BEGIN
    total_precio_articulos(1, v);
    DBMS_OUTPUT.PUT_LINE('total: ' || v);
END;
/

-- ej9
BEGIN
    articulos_caros(200);
END;
/

-- ej10
BEGIN
    actualizar_precio(1, 99);
END;
/


-- PREGUNTAS TEORICAS

-- 1. por que usamos DBMS_OUTPUT?
-- porque en oracle no puedes hacer un print normal desde un procedimiento
-- necesitas activar el serveroutput y usar dbms_output para ver algo por pantalla

-- 2. diferencia entre IN y OUT?
-- IN es lo que le pasas al procedimiento para que lo use
-- OUT es lo que el procedimiento te devuelve cuando termina

-- 3. ventajas de SELECT INTO frente a cursor en ej1 y ej6?
-- select into es mas simple cuando solo necesitas un valor
-- el cursor sirve cuando tienes varias filas pero para un count o un max no hace falta

-- 4. por que usar UPPER en el ejercicio 7?
-- si buscas por texto oracle diferencia mayusculas de minusculas
-- con upper() te aseguras que encuentra el dato aunque este escrito diferente

-- 5. por que es importante el COMMIT o ROLLBACK en ej8 y ej9?
-- si haces un update o insert y no confirmas con commit los cambios no se guardan
-- y si algo falla a medias puedes deshacer todo con rollback para no dejar datos a medias