------------------------------------------------------------------------
-- ESQUEMA: TIENDA INFORMÁTICA
------------------------------------------------------------------------

CREATE USER tiendaInformatica 
IDENTIFIED BY tiendaInformatica123 
DEFAULT TABLESPACE users 
TEMPORARY TABLESPACE temp;

GRANT CONNECT, RESOURCE TO tiendaInformatica; 
ALTER USER tiendaInformatica QUOTA UNLIMITED ON users;

GRANT CREATE SESSION TO tiendaInformatica;
GRANT CREATE TABLE, CREATE VIEW, CREATE SEQUENCE, CREATE TRIGGER, 
      CREATE SYNONYM, CREATE PROCEDURE TO tiendaInformatica;
ALTER USER tiendaInformatica QUOTA UNLIMITED ON users;

------------------------------------------------------------------------
-- TABLAS
------------------------------------------------------------------------

CREATE TABLE fabricantes (
   codigo   NUMBER(5)    CONSTRAINT pk_fabricantes PRIMARY KEY,
   nombre   VARCHAR2(20) NOT NULL,
   ciudad   VARCHAR2(20) NOT NULL
);

CREATE TABLE articulos (
   codigo     NUMBER(8)    CONSTRAINT pk_articulos PRIMARY KEY,
   nombre     VARCHAR2(60) NOT NULL,
   precio     NUMBER(10,2) NOT NULL,
   fabricante NUMBER(5)    NOT NULL,
   CONSTRAINT fk_art_fabricante FOREIGN KEY (fabricante)
      REFERENCES fabricantes(codigo)
);

------------------------------------------------------------------------
-- DATOS DE PRUEBA
------------------------------------------------------------------------

INSERT INTO fabricantes VALUES (1, 'Xiaomi', 'Madrid');
INSERT INTO fabricantes VALUES (2, 'Sony',   'Madrid');
INSERT INTO fabricantes VALUES (3, 'LG',     'Sevilla');
INSERT INTO fabricantes VALUES (4, 'Asus',   'Barcelona');

INSERT INTO articulos VALUES (1, 'Mi band 6',                       25,  1);
INSERT INTO articulos VALUES (2, 'Robot aspirador',                250,  1);
INSERT INTO articulos VALUES (3, 'Xiaomi 11 Lite 5G NE',           250,  1);
INSERT INTO articulos VALUES (4, 'Xiaomi Mi Smart Clock',           45,  1);
INSERT INTO articulos VALUES (5, 'Sony WH1000XM3 - Auriculares',   205,  2);
INSERT INTO articulos VALUES (6, 'Sony Xperia 5 III',              999,  2);
INSERT INTO articulos VALUES (7, 'LG 43UP7500-ALEXA - Smart TV 4K',354,  3);

COMMIT;

SELECT ar.codigo, ar.nombre, ar.precio, fa.nombre AS fabricante
FROM   articulos ar
JOIN   fabricantes fa ON fa.codigo = ar.fabricante
ORDER  BY ar.codigo;

--ej1

CREATE OR REPLACE FUNCTION calcular_max (
   p_fab_nombre IN VARCHAR2
) RETURN NUMBER
AS
   v_max_precio NUMBER;
BEGIN
   SELECT MAX(ar.precio)
   INTO   v_max_precio
   FROM   articulos ar
   JOIN   fabricantes fa ON fa.codigo = ar.fabricante
   WHERE  fa.nombre = p_fab_nombre;

   RETURN v_max_precio;
END calcular_max;
/


--ej2

CREATE OR REPLACE FUNCTION articulo_lowcost
RETURN NUMBER
AS
   v_contador NUMBER;
BEGIN
   SELECT COUNT(*)
   INTO   v_contador
   FROM   articulos
   WHERE  precio < 100;

   RETURN v_contador;
END articulo_lowcost;
/

--ej3

CREATE OR REPLACE FUNCTION articulo_precios (
   p_min IN NUMBER,
   p_max IN NUMBER
) RETURN NUMBER
AS
   v_resultado NUMBER;
BEGIN
   SELECT COUNT(*)
   INTO   v_resultado
   FROM   articulos
   WHERE  precio BETWEEN p_min AND p_max;

   RETURN v_resultado;
END articulo_precios;
/


--ej4

CREATE OR REPLACE FUNCTION articulo_barato
RETURN VARCHAR2
AS
   v_art_nombre VARCHAR2(60);
BEGIN
   SELECT nombre
   INTO   v_art_nombre
   FROM   articulos
   WHERE  precio = (SELECT MIN(precio) FROM articulos);

   RETURN v_art_nombre;
END articulo_barato;
/

--ej 5

CREATE OR REPLACE FUNCTION media_precios
RETURN NUMBER
AS
   v_promedio NUMBER;
BEGIN
   SELECT AVG(precio)
   INTO   v_promedio
   FROM   articulos;

   RETURN v_promedio;
END media_precios;
/

-- ej6

CREATE OR REPLACE FUNCTION fabricante_total_articulos (
   p_cod_fab IN NUMBER
) RETURN NUMBER
AS
   v_total NUMBER;
BEGIN
   SELECT COUNT(*)
   INTO   v_total
   FROM   articulos
   WHERE  fabricante = p_cod_fab;

   RETURN v_total;
END fabricante_total_articulos;
/


--ej7

CREATE OR REPLACE FUNCTION nombre_fabricante_articulo (
   p_cod_art IN NUMBER
) RETURN VARCHAR2
AS
   v_fab_nombre VARCHAR2(20);
BEGIN
   SELECT fa.nombre
   INTO   v_fab_nombre
   FROM   fabricantes fa
   JOIN   articulos ar ON ar.fabricante = fa.codigo
   WHERE  ar.codigo = p_cod_art;

   RETURN v_fab_nombre;
END nombre_fabricante_articulo;
/

--ej8

CREATE OR REPLACE FUNCTION precio_total_fabricante (
   p_codigo_fabricante IN NUMBER
) RETURN NUMBER AS v_precio_total NUMBER;
BEGIN
   SELECT SUM(precio)
   INTO v_precio_total
   FROM articulos
   WHERE fabricante = p_codigo_fabricante;
   RETURN v_precio_total;
END;
/

--ej9

CREATE OR REPLACE FUNCTION articulo_caro_nombre (
) RETURN VARCHAR2 AS v_nombre_articulo VARCHAR2(60);
BEGIN
   SELECT nombre
   INTO v_nombre_articulo
   FROM articulos
   WHERE precio = (SELECT MAX(precio) FROM articulos);
   RETURN v_nombre_articulo;
END;
/

-- ej10
CREATE OR REPLACE FUNCTION precio_con_iva (
   p_codigo_articulo IN NUMBER
) RETURN NUMBER AS v_precio_con_iva NUMBER;
BEGIN
   SELECT precio * 1.21
   INTO v_precio_con_iva
   FROM articulos
   WHERE codigo = p_codigo_articulo;
   RETURN v_precio_con_iva;
END;
/
