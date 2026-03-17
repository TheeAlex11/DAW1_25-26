-- ============================================================
-- BBDD VIDEOCLUB PLUSDEDE
-- CFGS DAW - Bases de Datos - UT05 ACTIVIDAD 04
-- IES Castelar - Curso 25-26
-- ============================================================


-- ============================================================
-- 1.1.1  CREACION DE LA BASE DE DATOS
-- ============================================================

-- Eliminamos tablas en orden inverso (hijas antes que madres)
DROP TABLE Actua      CASCADE CONSTRAINTS;
DROP TABLE Alquila    CASCADE CONSTRAINTS;
DROP TABLE Actores    CASCADE CONSTRAINTS;
DROP TABLE Socio      CASCADE CONSTRAINTS;
DROP TABLE Ejemplar   CASCADE CONSTRAINTS;
DROP TABLE Pelicula   CASCADE CONSTRAINTS;
DROP TABLE Director   CASCADE CONSTRAINTS;


-- ---- Tabla Director ----
CREATE TABLE Director (
    Nombre       VARCHAR2(50)  CONSTRAINT pk_director PRIMARY KEY,
    Nacionalidad VARCHAR2(30)
);

-- ---- Tabla Pelicula ----
CREATE TABLE Pelicula (
    ID           NUMBER(5)     CONSTRAINT pk_pelicula PRIMARY KEY,
    Titulo       VARCHAR2(100) CONSTRAINT nn_titulo NOT NULL,
    Productora   VARCHAR2(50),
    Nacionalidad VARCHAR2(30),
    Fecha        DATE,
    Director     VARCHAR2(50)  CONSTRAINT fk_peli_director
                               REFERENCES Director(Nombre)
);

-- ---- Tabla Ejemplar ----
CREATE TABLE Ejemplar (
    ID_Peli  NUMBER(5)  CONSTRAINT fk_ejem_pelicula REFERENCES Pelicula(ID),
    Numero   NUMBER(3),
    Estado   VARCHAR2(20),
    CONSTRAINT pk_ejemplar PRIMARY KEY (ID_Peli, Numero)
);

-- ---- Tabla Socio (autorreferencia para Avalista) ----
CREATE TABLE Socio (
    DNI       VARCHAR2(9)   CONSTRAINT pk_socio PRIMARY KEY,
    Nombre    VARCHAR2(50)  CONSTRAINT nn_nombre_socio NOT NULL,
    Direccion VARCHAR2(100),
    Telefono  VARCHAR2(9),
    Avalista  VARCHAR2(9)   CONSTRAINT fk_socio_avalista REFERENCES Socio(DNI)
);

-- ---- Tabla Actores ----
CREATE TABLE Actores (
    Nombre       VARCHAR2(50) CONSTRAINT pk_actores PRIMARY KEY,
    Nacionalidad VARCHAR2(30),
    Sexo         CHAR(1)      CONSTRAINT chk_sexo CHECK (Sexo IN ('H','M'))
);

-- ---- Tabla Alquila ----
CREATE TABLE Alquila (
    DNI             VARCHAR2(9),
    ID_Peli         NUMBER(5),
    Numero          NUMBER(3),
    FechaAlquiler   DATE,
    FechaDevolucion DATE,
    CONSTRAINT pk_alquila      PRIMARY KEY (DNI, ID_Peli, Numero, FechaAlquiler),
    CONSTRAINT fk_alq_socio    FOREIGN KEY (DNI) REFERENCES Socio(DNI),
    CONSTRAINT fk_alq_ejemplar FOREIGN KEY (ID_Peli, Numero)
                               REFERENCES Ejemplar(ID_Peli, Numero),
    CONSTRAINT chk_fechas      CHECK (FechaDevolucion > FechaAlquiler)
);

-- ---- Tabla Actua ----
CREATE TABLE Actua (
    Actor   VARCHAR2(50),
    ID_Peli NUMBER(5),
    Prota   CHAR(1) DEFAULT 'N' CONSTRAINT chk_prota CHECK (Prota IN ('S','N')),
    CONSTRAINT pk_actua          PRIMARY KEY (Actor, ID_Peli),
    CONSTRAINT fk_actua_actor    FOREIGN KEY (Actor)   REFERENCES Actores(Nombre),
    CONSTRAINT fk_actua_pelicula FOREIGN KEY (ID_Peli) REFERENCES Pelicula(ID)
);


-- ============================================================
-- 1.1.2  INSERCIONES (PUNTO 1)
-- ============================================================

-- ---- 2 Directores ----
INSERT INTO Director VALUES ('Steven Spielberg',  'Estadounidense');
INSERT INTO Director VALUES ('Christopher Nolan', 'Britanico');

-- ---- 4 Peliculas ----
INSERT INTO Pelicula VALUES (1, 'Jurassic Park',         'Universal Pictures', 'Estadounidense', TO_DATE('11/06/1993','DD/MM/YYYY'), 'Steven Spielberg');
INSERT INTO Pelicula VALUES (2, 'La Lista de Schindler', 'Universal Pictures', 'Estadounidense', TO_DATE('30/11/1993','DD/MM/YYYY'), 'Steven Spielberg');
INSERT INTO Pelicula VALUES (3, 'El Origen',             'Warner Bros',        'Britanico',      TO_DATE('16/07/2010','DD/MM/YYYY'), 'Christopher Nolan');
INSERT INTO Pelicula VALUES (4, 'El Caballero Oscuro',   'Warner Bros',        'Britanico',      TO_DATE('18/07/2008','DD/MM/YYYY'), 'Christopher Nolan');

-- ---- 2 Ejemplares por pelicula ----
INSERT INTO Ejemplar VALUES (1, 1, 'Disponible');
INSERT INTO Ejemplar VALUES (1, 2, 'Alquilado');
INSERT INTO Ejemplar VALUES (2, 1, 'Disponible');
INSERT INTO Ejemplar VALUES (2, 2, 'Alquilado');
INSERT INTO Ejemplar VALUES (3, 1, 'Alquilado');
INSERT INTO Ejemplar VALUES (3, 2, 'Disponible');
INSERT INTO Ejemplar VALUES (4, 1, 'Disponible');
INSERT INTO Ejemplar VALUES (4, 2, 'Alquilado');

-- ---- 4 Socios (sin avalista; se asignara en Modificacion 3) ----
--  Ana:   telefono empieza por 9 (>= 5)
--  Luis:  telefono empieza por 3 (<  5)
--  Maria: telefono empieza por 6 (>= 5)
--  Pedro: telefono empieza por 4 (<  5)
INSERT INTO Socio VALUES ('12345678A', 'Ana Garcia',    'Calle Mayor 1, Madrid',  '912345678', NULL);
INSERT INTO Socio VALUES ('23456789B', 'Luis Martinez', 'Av. Libertad 2, Madrid', '312345678', NULL);
INSERT INTO Socio VALUES ('34567890C', 'Maria Lopez',   'Calle Sol 3, Madrid',    '634567890', NULL);
INSERT INTO Socio VALUES ('45678901D', 'Pedro Sanchez', 'Calle Luna 4, Madrid',   '412345678', NULL);

-- ---- 7 Actores ----
INSERT INTO Actores VALUES ('Jeff Goldblum',        'Estadounidense', 'H');
INSERT INTO Actores VALUES ('Laura Dern',           'Estadounidense', 'M');
INSERT INTO Actores VALUES ('Tom Hanks',            'Estadounidense', 'H');
INSERT INTO Actores VALUES ('Leonardo DiCaprio',    'Estadounidense', 'H');
INSERT INTO Actores VALUES ('Joseph Gordon-Levitt', 'Estadounidense', 'H');
INSERT INTO Actores VALUES ('Heath Ledger',         'Australiano',    'H');
INSERT INTO Actores VALUES ('Cate Blanchett',       'Australiana',    'M');

-- ---- Actua: cada pelicula con al menos un protagonista ----
INSERT INTO Actua VALUES ('Jeff Goldblum',        1, 'S');  -- Jurassic Park - protagonista
INSERT INTO Actua VALUES ('Laura Dern',           1, 'S');  -- Jurassic Park - protagonista
INSERT INTO Actua VALUES ('Tom Hanks',            2, 'S');  -- La Lista de Schindler - protagonista
INSERT INTO Actua VALUES ('Leonardo DiCaprio',    3, 'S');  -- El Origen - protagonista
INSERT INTO Actua VALUES ('Joseph Gordon-Levitt', 3, 'N');  -- El Origen - secundario
INSERT INTO Actua VALUES ('Heath Ledger',         4, 'S');  -- El Caballero Oscuro - protagonista
INSERT INTO Actua VALUES ('Cate Blanchett',       4, 'N');  -- El Caballero Oscuro - secundaria

-- ---- Alquileres: todos los ejemplares con al menos 1 alquiler ----
INSERT INTO Alquila VALUES ('12345678A', 1, 1, TO_DATE('01/01/2025','DD/MM/YYYY'), TO_DATE('05/01/2025','DD/MM/YYYY'));
INSERT INTO Alquila VALUES ('23456789B', 1, 2, TO_DATE('02/01/2025','DD/MM/YYYY'), TO_DATE('06/01/2025','DD/MM/YYYY'));
INSERT INTO Alquila VALUES ('34567890C', 2, 1, TO_DATE('03/01/2025','DD/MM/YYYY'), TO_DATE('07/01/2025','DD/MM/YYYY'));
INSERT INTO Alquila VALUES ('45678901D', 2, 2, TO_DATE('04/01/2025','DD/MM/YYYY'), TO_DATE('08/01/2025','DD/MM/YYYY'));
INSERT INTO Alquila VALUES ('12345678A', 3, 1, TO_DATE('05/01/2025','DD/MM/YYYY'), TO_DATE('09/01/2025','DD/MM/YYYY'));
INSERT INTO Alquila VALUES ('23456789B', 3, 2, TO_DATE('06/01/2025','DD/MM/YYYY'), TO_DATE('10/01/2025','DD/MM/YYYY'));
INSERT INTO Alquila VALUES ('34567890C', 4, 1, TO_DATE('07/01/2025','DD/MM/YYYY'), TO_DATE('11/01/2025','DD/MM/YYYY'));
INSERT INTO Alquila VALUES ('45678901D', 4, 2, TO_DATE('08/01/2025','DD/MM/YYYY'), TO_DATE('12/01/2025','DD/MM/YYYY'));

COMMIT;


-- ============================================================
-- PRUEBAS DE RESTRICCIONES (PUNTOS 2 - 5)
-- Las sentencias que deben FALLAR estan comentadas.
-- Descomenta de una en una para ver el error esperado.
-- ============================================================

-- ---- PUNTO 2: NOT NULL (NombreSocio, TituloPelicula) ----
-- ERROR esperado: ORA-01400: cannot insert NULL into (...)
-- INSERT INTO Socio    VALUES ('99999999Z', NULL, 'Calle Test', '600000001', NULL);
-- INSERT INTO Pelicula VALUES (99, NULL, 'Test Prod', 'Espanola', SYSDATE, 'Steven Spielberg');


-- ---- PUNTO 3: CHECK Sexo IN ('H','M') ----
-- ERROR esperado: ORA-02290: check constraint (CHK_SEXO) violated
-- INSERT INTO Actores VALUES ('Actor Invalido', 'Espanola', 'X');


-- ---- PUNTO 4: DEFAULT Prota = 'N' ----
-- Esta insercion SI debe funcionar; Prota quedara como 'N'
INSERT INTO Actua (Actor, ID_Peli) VALUES ('Tom Hanks', 1);
SELECT Actor, ID_Peli, Prota FROM Actua WHERE Actor = 'Tom Hanks' AND ID_Peli = 1;
-- Resultado esperado: Prota = N

-- ERROR esperado: ORA-02290: check constraint (CHK_PROTA) violated
-- INSERT INTO Actua VALUES ('Jeff Goldblum', 2, 'X');


-- ---- PUNTO 5: CHECK FechaDevolucion > FechaAlquiler ----
-- ERROR esperado: ORA-02290: check constraint (CHK_FECHAS) violated
-- INSERT INTO Alquila VALUES ('12345678A', 1, 1,
--     TO_DATE('10/02/2025','DD/MM/YYYY'),
--     TO_DATE('05/02/2025','DD/MM/YYYY'));

COMMIT;


-- ============================================================
-- 1.1.3  MODIFICACIONES
-- ============================================================

-- ---- MODIFICACION 1: Nacionalidad de DIRECTORES ----
SELECT Nombre, Nacionalidad FROM Director;  -- ANTES

UPDATE Director SET Nacionalidad = 'USA' WHERE Nacionalidad = 'Estadounidense';
UPDATE Director SET Nacionalidad = 'UK'  WHERE Nacionalidad = 'Britanico';

SELECT Nombre, Nacionalidad FROM Director;  -- DESPUES
COMMIT;


-- ---- MODIFICACION 2: Nacionalidad de ACTORES ----
SELECT Nombre, Nacionalidad FROM Actores;  -- ANTES

UPDATE Actores SET Nacionalidad = 'USA' WHERE Nacionalidad = 'Estadounidense';
UPDATE Actores SET Nacionalidad = 'AUS'
    WHERE Nacionalidad IN ('Australiano', 'Australiana');

SELECT Nombre, Nacionalidad FROM Actores;  -- DESPUES
COMMIT;


-- ---- MODIFICACION 3: Avalista unico para todos los socios ----
-- Todos los socios tendran a Ana Garcia ('12345678A') como avalista,
-- excepto Ana misma, que no tendra avalista (NULL).
SELECT DNI, Nombre, Avalista FROM Socio;  -- ANTES

UPDATE Socio SET Avalista = '12345678A' WHERE DNI <> '12345678A';
UPDATE Socio SET Avalista = NULL        WHERE DNI  = '12345678A';

SELECT DNI, Nombre, Avalista FROM Socio;  -- DESPUES
COMMIT;


-- ---- MODIFICACION 4: Eliminar socios con telefono que empieza < 5 ----
-- Afecta a: Luis (312...) y Pedro (412...)
SELECT DNI, Nombre, Telefono FROM Socio
WHERE SUBSTR(Telefono, 1, 1) < '5';

DELETE FROM Socio WHERE SUBSTR(Telefono, 1, 1) < '5';

-- QUE SUCEDE:  ORA-02292: integrity constraint violated - child record found
-- POR QUE:     Luis y Pedro tienen alquileres en la tabla Alquila.
--              La FK fk_alq_socio impide borrar un socio con alquileres asociados.
--              Al no haberse usado ON DELETE CASCADE, Oracle aplica el comportamiento
--              por defecto: rechaza el borrado.


-- ---- MODIFICACION 5: Eliminar socios con telefono que empieza >= 5 ----
-- Afecta a: Ana (912...) y Maria (634...)
SELECT DNI, Nombre, Telefono FROM Socio
WHERE SUBSTR(Telefono, 1, 1) >= '5';

DELETE FROM Socio WHERE SUBSTR(Telefono, 1, 1) >= '5';

-- QUE SUCEDE:  ORA-02292: integrity constraint violated - child record found
-- POR QUE:     - Ana es referenciada como avalista de Luis y Pedro
--                (FK fk_socio_avalista en la propia tabla Socio).
--              - Ademas, Ana y Maria tienen alquileres en Alquila.
--              Oracle impide borrar cualquiera de los dos socios.


-- ---- MODIFICACION 6: Como resolver los problemas de borrado ----
/*
  SOLUCION A - Borrado manual en orden correcto:

  Para borrar socios con telefono < 5 (Luis y Pedro):
    DELETE FROM Alquila
        WHERE DNI IN (SELECT DNI FROM Socio WHERE SUBSTR(Telefono,1,1) < '5');
    DELETE FROM Socio WHERE SUBSTR(Telefono, 1, 1) < '5';

  Para borrar socios con telefono >= 5 (Ana y Maria):
    -- 1. Desreferenciar a Ana como avalista:
    UPDATE Socio SET Avalista = NULL
        WHERE Avalista IN (SELECT DNI FROM Socio WHERE SUBSTR(Telefono,1,1) >= '5');
    -- 2. Borrar sus alquileres:
    DELETE FROM Alquila
        WHERE DNI IN (SELECT DNI FROM Socio WHERE SUBSTR(Telefono,1,1) >= '5');
    -- 3. Borrar los socios:
    DELETE FROM Socio WHERE SUBSTR(Telefono, 1, 1) >= '5';

  SOLUCION B - Diseno fisico alternativo:
    Definir ON DELETE CASCADE en FK de Alquila.DNI -> Socio.DNI:
      al borrar un socio, sus alquileres se eliminan automaticamente.
    Definir ON DELETE SET NULL en FK de Socio.Avalista -> Socio.DNI:
      al borrar un socio que es avalista, los socios avalados quedan con Avalista = NULL.
    Esto simplifica el mantenimiento pero puede provocar perdidas de datos en cascada.
*/


-- ---- MODIFICACION 7: Eliminar todos los directores ----
SELECT * FROM Director;

DELETE FROM Director;

-- QUE SUCEDE:  ORA-02292: integrity constraint violated - child record found
-- POR QUE:     Las peliculas referencian a los directores mediante
--              la FK fk_peli_director (Pelicula.Director -> Director.Nombre).
--              Oracle impide borrar un director que dirija alguna pelicula.


-- ---- MODIFICACION 8: Eliminar 2 peliculas (ID 3 y 4) ----
SELECT ID, Titulo FROM Pelicula WHERE ID IN (3,4);

DELETE FROM Pelicula WHERE ID IN (3,4);

-- QUE SUCEDE:  ORA-02292: integrity constraint violated - child record found
-- POR QUE:     Las peliculas 3 y 4 tienen hijos en Ejemplar y en Actua.
--              Los ejemplares de esas peliculas tienen a su vez hijos en Alquila.
--              Oracle impide borrar mientras existan registros hijo dependientes.

-- COMO SOLUCIONARLO (orden correcto):
--   DELETE FROM Alquila  WHERE ID_Peli IN (3,4);
--   DELETE FROM Actua    WHERE ID_Peli IN (3,4);
--   DELETE FROM Ejemplar WHERE ID_Peli IN (3,4);
--   DELETE FROM Pelicula WHERE ID      IN (3,4);

-- DISENO ALTERNATIVO:
--   Definir ON DELETE CASCADE en Ejemplar.fk_ejem_pelicula,
--   Actua.fk_actua_pelicula y Alquila.fk_alq_ejemplar.
--   Asi, al borrar la pelicula se eliminarian en cadena sus ejemplares,
--   participaciones y alquileres. Reduce codigo manual pero aumenta el
--   riesgo de borrados accidentales masivos.

COMMIT;