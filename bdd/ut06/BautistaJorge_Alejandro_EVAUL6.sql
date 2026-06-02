
CREATE TABLE ventas(
    codigo NUMBER(8) PRIMARY KEY,
    articulo NUMBER(8) NOT NULL,
    fecha_venta DATE NOT NULL,
    cantidad NUMBER(5) NOT NULL,
    cliente VARCHAR2(50) NOT NULL,
    CONSTRAINT ventas_articulo_fk
        FOREIGN KEY (articulo)
        REFERENCES articulos(codigo)
);

-- Ejercicio 1


CREATE OR REPLACE PROCEDURE mostrar_articulo_fabricante (
    p_codigo IN NUMBER -- En este primer bloque lo que estamos haciendo es crear el procedimiento y además estamos usando alias para que sea más fácil de escribir
)
IS
    v_nombre     VARCHAR2(100);
    v_precio     NUMBER;
    v_fabricante VARCHAR2(100);
    -- En este segundo bloque lo que vamos a hacer es definir los nombres y campos que vamos a utilizar
BEGIN
    SELECT a.nombre, a.precio, f.nombre
    INTO v_nombre, v_precio, v_fabricante
    FROM articulos a
    JOIN fabricantes f ON a.fabricante = f.codigo
    WHERE a.codigo = p_codigo;
    -- En esta primera seccion del begin lo que estamos es recogiendo los datos de otras tablas para utilizarlos despues al volcar datos

    DBMS_OUTPUT.PUT_LINE('Articulo: ' || v_nombre);
    DBMS_OUTPUT.PUT_LINE('Precio: ' || v_precio);
    DBMS_OUTPUT.PUT_LINE('Fabricante: ' || v_fabricante);
    -- Aqui en esta ultima seccion lo unico qu eestamos haciendo son las salidas a pantalla de lo solicitado
END;
/

-- Esto solamente sería una prueba de ejecución para comprobar el correcto funcionamiento del ejercicio
BEGIN
    DBMS_OUTPUT.PUT_LINE('Articulo: ' || mostrar_articulo_fabricante(1));
END;
/

-- Ejercicio 2

CREATE OR REPLACE FUNCTION total_ventas_articulo (
    p_codigo IN NUMBER -- En este primer bloque lo que haremos será definir lo le pasaremos a la funcion
)
RETURN NUMBER -- Con el number estaremos haciendo un return para devolver el propio valor
IS
    v_total NUMBER;
    -- Definimos el tipo dentro del IS 
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM ventas
    WHERE articulo = p_codigo;

    RETURN v_total;
    -- En el begin lo que haremos será procesar los datos de todos los datos anteriores y los volcaremos con el return a la variable v_total
END;
/

-- Esto solamente sería una prueba de ejecución para comprobar el correcto funcionamiento del ejercicio

BEGIN
    DBMS_OUTPUT.PUT_LINE('Total ventas: ' || total_ventas_articulo(1));
END;
/

-- Ejercicio 3
CREATE OR REPLACE PROCEDURE datos_ultima_venta (
    p_codigo   IN NUMBER,
    p_fecha    OUT DATE,
    p_cantidad OUT NUMBER
    -- En este primer apartado lo que vamos a hacer es recoger los datos e indicar su entrada o salida del procedimiento
)
IS
BEGIN
    SELECT fecha_venta, cantidad
    INTO p_fecha, p_cantidad
    FROM ventas
    WHERE p_codigo AND fecha_venta = (SELECT MAX(fecha_venta) FROM ventas WHERE articulo = p_codigo);
    -- Aqui lo que estamos haciendo es hacer una subconsulta para retomar los datos y ordenar de diferentes tablas para poder mantener una logica coherente entre ellos
END;
