/* =========================================================
   UT05 - ACT03 - OPOSICIONES (SETUP ORACLE)
   Crea tablas e inserta datos base para practicar UPDATE.
   Incluye opositores, tribunales, exámenes y notas.
   ========================================================= */

CREATE USER oposiciones 
IDENTIFIED BY oposiciones123 
DEFAULT TABLESPACE users 
TEMPORARY TABLESPACE temp;

GRANT CONNECT, RESOURCE TO oposiciones; 
ALTER USER oposiciones QUOTA UNLIMITED ON users;

GRANT CREATE SESSION TO oposiciones;
GRANT CREATE TABLE, CREATE VIEW, CREATE SEQUENCE, CREATE TRIGGER, CREATE SYNONYM TO oposiciones;
ALTER USER oposiciones QUOTA UNLIMITED ON users;

-- ==========================
-- TABLAS
-- ==========================

-- TRIBUNALES
CREATE TABLE tribunales (
  codigotribunal NUMBER(4) CONSTRAINT pk_tribunales PRIMARY KEY,
  presidente     VARCHAR2(50) CONSTRAINT nn_tri_pres NOT NULL,
  secretario     VARCHAR2(50) CONSTRAINT nn_tri_sec  NOT NULL,
  vocal1         VARCHAR2(50),
  vocal2         VARCHAR2(50),
  vocal3         VARCHAR2(50)
);

-- EXAMENES
CREATE TABLE examenes (
  codigoexa     NUMBER(4) CONSTRAINT pk_examenes PRIMARY KEY,
  descripcionexa VARCHAR2(50) CONSTRAINT nn_exa_desc NOT NULL
);

-- OPOSITORES
CREATE TABLE opositores (
  dni             VARCHAR2(14) CONSTRAINT pk_opositores PRIMARY KEY,
  nombre          VARCHAR2(255) CONSTRAINT nn_opo_nom NOT NULL,
  ciudad          VARCHAR2(255) DEFAULT 'Badajoz' CONSTRAINT nn_opo_ciu NOT NULL,
  telefono        VARCHAR2(14),
  tribunalopositor NUMBER(4) CONSTRAINT fk_opo_tri
                    REFERENCES tribunales(codigotribunal)
);

-- NOTAS (tabla intermedia: opositor-examen)
CREATE TABLE notas (
  dniopositor   VARCHAR2(14),
  codigoexamen  NUMBER(4),
  nota          NUMBER(2) CONSTRAINT ck_nota_rango CHECK (nota BETWEEN 0 AND 10),
  CONSTRAINT pk_notas PRIMARY KEY (dniopositor, codigoexamen),
  CONSTRAINT fk_notas_opo FOREIGN KEY (dniopositor) REFERENCES opositores(dni),
  CONSTRAINT fk_notas_exa FOREIGN KEY (codigoexamen) REFERENCES examenes(codigoexa)
);

-- ==========================
-- INSERCIONES BASE
-- ==========================

-- 1) TRIBUNALES (1,2,8) con los nombres del enunciado
INSERT INTO tribunales VALUES (2, 'PEDRO FERNANDEZ', 'ISABEL FRESNEDA', 'LUIS MERLO', 'ANTONIO ROBLES', 'VICENTE ROBLES');
INSERT INTO tribunales VALUES (8, 'ANA LIMA', 'TOMAS RODRIGUEZ', 'ROCIO CINTIA', 'MODESTA HERMOSO', 'JUAN ARGUETA');
INSERT INTO tribunales VALUES (1, 'ANA MATOS', 'PEDRO RODRIGUEZ', 'NOA CINTIA', 'CARMEN HERMOSO', 'JUANI ARGUETA');

-- 2) EXAMENES (100 y 200)
INSERT INTO examenes VALUES (100, 'Base de datos');
INSERT INTO examenes VALUES (200, 'Programación');

-- 3) OPOSITORES (5) con ciudad por defecto Badajoz y teléfono opcional
-- Opositor(1)
INSERT INTO opositores (dni, nombre, ciudad, telefono, tribunalopositor)
VALUES ('AAA1', 'José Luis Almeida Pérez', DEFAULT, '666777888', 2);

-- Opositor(2) sin teléfono
INSERT INTO opositores (dni, nombre, ciudad, telefono, tribunalopositor)
VALUES ('AAA2', 'María Almeida Pérez', DEFAULT, NULL, 2);

-- Opositor(3)
INSERT INTO opositores (dni, nombre, ciudad, telefono, tribunalopositor)
VALUES ('AAA3', 'Carmen Alegría Silva', DEFAULT, NULL, 8);

-- Opositor(4)
INSERT INTO opositores (dni, nombre, ciudad, telefono, tribunalopositor)
VALUES ('AAA4', 'Juan Carlos Perdigón Solís', DEFAULT, '666555444', 8);

-- Opositor(5)
INSERT INTO opositores (dni, nombre, ciudad, telefono, tribunalopositor)
VALUES ('AAA5', 'Javier Ramírez Montero', DEFAULT, NULL, 1);

-- 4) NOTAS: cada opositor hace 2 exámenes (100 y 200) con nota inventada 0..10
-- AAA1
INSERT INTO notas VALUES ('AAA1', 100, 7);
INSERT INTO notas VALUES ('AAA1', 200, 6);

-- AAA2
INSERT INTO notas VALUES ('AAA2', 100, 5);
INSERT INTO notas VALUES ('AAA2', 200, 8);

-- AAA3
INSERT INTO notas VALUES ('AAA3', 100, 9);
INSERT INTO notas VALUES ('AAA3', 200, 4);

-- AAA4
INSERT INTO notas VALUES ('AAA4', 100, 3);
INSERT INTO notas VALUES ('AAA4', 200, 7);

-- AAA5
INSERT INTO notas VALUES ('AAA5', 100, 6);
INSERT INTO notas VALUES ('AAA5', 200, 2);

-- ==========================
-- SELECTS de comprobación
-- ==========================
SELECT * FROM tribunales ORDER BY codigotribunal;
SELECT * FROM examenes ORDER BY codigoexa;
SELECT dni, nombre, ciudad, telefono, tribunalopositor FROM opositores ORDER BY dni;
SELECT * FROM notas ORDER BY dniopositor, codigoexamen;

COMMIT;

/* =========================
    EJERCICIOS
   ========================= */

/* ---------------------------------------------------------
   EJERCICIO 01
   Actualizar la ciudad de los opositores cuyo tribunal sea 8
   al nombre de 'Mérida'.
   --------------------------------------------------------- */
UPDATE opositores
SET ciudad = 'Mérida'
WHERE tribunalopositor = 8;

-- Comprobación
SELECT dni, nombre, ciudad, tribunalopositor
FROM opositores
ORDER BY dni;

COMMIT;


/* ---------------------------------------------------------
   EJERCICIO 02
   Actualizar al opositor con DNI 'AAA1' para que se examine
   en el tribunal nº 8.
   --------------------------------------------------------- */
UPDATE opositores
SET tribunalopositor = 8
WHERE dni = 'AAA1';

-- Comprobación
SELECT dni, nombre, tribunalopositor
FROM opositores
WHERE dni = 'AAA1';

COMMIT;


/* ---------------------------------------------------------
   EJERCICIO 03
   Actualizar el teléfono del opositor con DNI 'AAA2'
   al número '777888999'.
   --------------------------------------------------------- */
UPDATE opositores
SET telefono = '777888999'
WHERE dni = 'AAA2';

-- Comprobación
SELECT dni, nombre, telefono
FROM opositores
WHERE dni = 'AAA2';

COMMIT;


/* ---------------------------------------------------------
   EJERCICIO 04
   Actualizar a 10 las notas de todos los opositores que se
   han examinado del examen de 'Base de datos'.
   Se usa subconsulta para obtener el código del examen por
   su descripción, evitando hardcodear el código.
   --------------------------------------------------------- */
UPDATE notas
SET nota = 10
WHERE codigoexamen = (
    SELECT codigoexa
    FROM examenes
    WHERE UPPER(descripcionexa) = 'BASE DE DATOS'
);

-- Comprobación
SELECT n.dniopositor, e.descripcionexa, n.nota
FROM notas n
JOIN examenes e ON n.codigoexamen = e.codigoexa
WHERE UPPER(e.descripcionexa) = 'BASE DE DATOS';

COMMIT;


/* ---------------------------------------------------------
   EJERCICIO 05
   Actualizar a 0 la nota del opositor con DNI 'AAA3'
   en el examen de 'Programación'.
   --------------------------------------------------------- */
UPDATE notas
SET nota = 0
WHERE dniopositor = 'AAA3'
  AND codigoexamen = (
      SELECT codigoexa
      FROM examenes
      WHERE UPPER(descripcionexa) = 'PROGRAMACIÓN'
  );

-- Comprobación
SELECT n.dniopositor, e.descripcionexa, n.nota
FROM notas n
JOIN examenes e ON n.codigoexamen = e.codigoexa
WHERE n.dniopositor = 'AAA3';

COMMIT;


/* ---------------------------------------------------------
   EJERCICIO 06
   Actualizar a '666666666' el teléfono de todos los
   opositores que lo tengan a NULL.
   --------------------------------------------------------- */
UPDATE opositores
SET telefono = '666666666'
WHERE telefono IS NULL;

-- Comprobación
SELECT dni, nombre, telefono
FROM opositores
ORDER BY dni;

COMMIT;


/* ---------------------------------------------------------
   EJERCICIO 07
   Actualizar el código y la descripción del examen
   'Base de datos': nuevo código 50, nueva descripción
   'Módulo de BBDD'.

   INTENTO (fallará si hay FK activas desde NOTAS):
   --------------------------------------------------------- */
-- UPDATE examenes
-- SET codigoexa = 50, descripcionexa = 'Módulo de BBDD'
-- WHERE UPPER(descripcionexa) = 'BASE DE DATOS';


/* ---------------------------------------------------------
   EJERCICIO 08
   ¿Qué ocurre al ejecutar el UPDATE del ejercicio 07?

   PROBLEMA: Oracle lanza el error ORA-02292 (integrity
   constraint violated - child record found) porque la tabla
   NOTAS tiene filas que referencian codigoexa = 100 mediante
   la FK fk_notas_exa. Al cambiar la PK de EXAMENES, Oracle
   no puede dejar huérfanas esas filas hijas.

   SOLUCIÓN: Actualizar primero las filas hijas en NOTAS para
   que apunten al nuevo código (50), y después actualizar la
   PK en EXAMENES. De este modo se mantiene la integridad
   referencial en todo momento.
   --------------------------------------------------------- */

-- Paso 1: Actualizar el código en la tabla hija NOTAS
UPDATE notas
SET codigoexamen = 50
WHERE codigoexamen = (
    SELECT codigoexa
    FROM examenes
    WHERE UPPER(descripcionexa) = 'BASE DE DATOS'
);

-- Paso 2: Ahora sí podemos actualizar la PK en EXAMENES
UPDATE examenes
SET codigoexa      = 50,
    descripcionexa = 'Módulo de BBDD'
WHERE UPPER(descripcionexa) = 'BASE DE DATOS';

-- Comprobación
SELECT * FROM examenes ORDER BY codigoexa;
SELECT * FROM notas    ORDER BY dniopositor, codigoexamen;

COMMIT;


/* ---------------------------------------------------------
   EJERCICIO 09
   Actualizar a NULL el teléfono del PRIMER opositor
   ordenado alfabéticamente por nombre.
   Se usa subconsulta con MIN sobre nombre para localizar
   al primer opositor sin depender del DNI concreto.
   --------------------------------------------------------- */
UPDATE opositores
SET telefono = NULL
WHERE nombre = (
    SELECT MIN(nombre)
    FROM opositores
);

-- Comprobación
SELECT dni, nombre, telefono
FROM opositores
ORDER BY nombre;

COMMIT;


/* ---------------------------------------------------------
   EJERCICIO 10
   Actualizar a NULL el teléfono del ÚLTIMO opositor
   ordenado alfabéticamente por nombre.
   Se usa subconsulta con MAX sobre nombre.
   --------------------------------------------------------- */
UPDATE opositores
SET telefono = NULL
WHERE nombre = (
    SELECT MAX(nombre)
    FROM opositores
);

-- Comprobación
SELECT dni, nombre, telefono
FROM opositores
ORDER BY nombre;

COMMIT;