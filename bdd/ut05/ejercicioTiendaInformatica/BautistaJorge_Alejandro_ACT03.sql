-- TIENDA INFORMATICA - FUNCIONES
-- Alumno: Alejandro Bautista

SET SERVEROUTPUT ON;

-- TABLAS
CREATE TABLE fabricantes (
  codigo NUMBER PRIMARY KEY,
  nombre VARCHAR2(20),
  ciudad VARCHAR2(20)
);

CREATE TABLE articulos (
  codigo NUMBER PRIMARY KEY,
  nombre VARCHAR2(60),
  precio NUMBER,
  fabricante NUMBER,
  FOREIGN KEY (fabricante) REFERENCES fabricantes(codigo)
);

-- DATOS
INSERT INTO fabricantes VALUES (1,'Xiaomi','Madrid');
INSERT INTO fabricantes VALUES (2,'Sony','Madrid');

INSERT INTO articulos VALUES (1,'Mi band',25,1);
INSERT INTO articulos VALUES (2,'Aspirador',250,1);
INSERT INTO articulos VALUES (3,'Auriculares',200,2);

COMMIT;

-------------------------------------------------
-- FUNCIONES
-------------------------------------------------

-- 1. Precio máximo por fabricante
CREATE OR REPLACE FUNCTION articulo_maxim(p_nombre VARCHAR2)
RETURN NUMBER
AS v_precio NUMBER;
BEGIN
  SELECT MAX(precio) INTO v_precio
  FROM articulos a JOIN fabricantes f ON a.fabricante=f.codigo
  WHERE f.nombre=p_nombre;
  RETURN v_precio;
END;
/

-- 2. Artículos < 100€
CREATE OR REPLACE FUNCTION articulo_lowcoste
RETURN NUMBER
AS v_total NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_total FROM articulos WHERE precio<100;
  RETURN v_total;
END;
/

-- 3. Artículos entre precios
CREATE OR REPLACE FUNCTION articulo_preciosos(p_min NUMBER,p_max NUMBER)
RETURN NUMBER
AS v_total NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_total FROM articulos
  WHERE precio BETWEEN p_min AND p_max;
  RETURN v_total;
END;
/

-- 4. Artículo más barato
CREATE OR REPLACE FUNCTION articulo_baratox
RETURN NUMBER
AS v_cod NUMBER;
BEGIN
  SELECT codigo INTO v_cod FROM articulos
  WHERE precio=(SELECT MIN(precio) FROM articulos);
  RETURN v_cod;
END;
/

-- 5. Precio medio
CREATE OR REPLACE FUNCTION media_precios
RETURN NUMBER
AS v_media NUMBER;
BEGIN
  SELECT AVG(precio) INTO v_media FROM articulos;
  RETURN v_media;
END;
/

-------------------------------------------------
-- PRUEBAS
-------------------------------------------------

SELECT articulo_maxim('Xiaomi') FROM dual;
SELECT articulo_lowcoste() FROM dual;
SELECT articulo_preciosos(0,200) FROM dual;
SELECT articulo_baratox() FROM dual;
SELECT media_precios() FROM dual;

-------------------------------------------------
-- TEORIA (RESUMEN)
-------------------------------------------------

-- 1. RETURN: obligatorio porque la función devuelve un valor.
-- 2. Función vs procedimiento: función devuelve valor, procedimiento no.
-- 3. DUAL: tabla para ejecutar SELECT sin datos reales.
-- 4. JOIN: necesario porque datos están en dos tablas.