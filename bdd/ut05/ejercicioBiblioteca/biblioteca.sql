/*
=================================================================================================
  1. Creación de tablas.
=================================================================================================
*/

CREATE TABLE SOCIOS (
    id_socio    NUMBER PRIMARY KEY,
    nombre      VARCHAR2(50),
    email       VARCHAR2(100),
    fecha_alta  DATE
);

CREATE TABLE LIBROS (
    id_libro  NUMBER PRIMARY KEY,
    titulo    VARCHAR2(100),
    autor     VARCHAR2(100),
    genero    VARCHAR2(50),
    stock     NUMBER
);

CREATE TABLE PRESTAMOS (
    id_prestamo     NUMBER PRIMARY KEY,
    id_socio        NUMBER,
    id_libro        NUMBER,
    fecha_prestamo  DATE,
    fecha_devolucion DATE,
    CONSTRAINT fk_socio FOREIGN KEY (id_socio) REFERENCES SOCIOS(id_socio),
    CONSTRAINT fk_libro FOREIGN KEY (id_libro) REFERENCES LIBROS(id_libro)
);

/*
=================================================================================================
  2. Creación de secuencias.
=================================================================================================
*/

CREATE SEQUENCE seq_socios
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_libros
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_prestamos
START WITH 1
INCREMENT BY 1
NOCACHE;

/*
=================================================================================================
  3. Creación de triggers.
=================================================================================================
*/

CREATE OR REPLACE TRIGGER trg_socios_id
BEFORE INSERT ON SOCIOS
FOR EACH ROW
BEGIN
    :NEW.id_socio := seq_socios.NEXTVAL;
END;
/

/* =============================== SEPARADOR =============================== */

CREATE OR REPLACE TRIGGER trg_fecha_alta
BEFORE INSERT ON SOCIOS
FOR EACH ROW
BEGIN
    :NEW.fecha_alta := SYSDATE;
END;
/

/* =============================== SEPARADOR =============================== */

CREATE OR REPLACE TRIGGER trg_id_prestamos
BEFORE INSERT ON PRESTAMOS
FOR EACH ROW
BEGIN
    :NEW.id_prestamo := seq_prestamos.NEXTVAL;
END;
/

/* =============================== SEPARADOR =============================== */

CREATE OR REPLACE TRIGGER trg_id_libro
BEFORE INSERT ON LIBROS
FOR EACH ROW
BEGIN
    :NEW.id_libro := seq_libros.NEXTVAL;
END;
/

/*
=================================================================================================
  4. Inserciones de datos.
=================================================================================================
*/

-- Tabla libros
INSERT INTO libros VALUES (seq_libros.NEXTVAL,'1984','George Orwell','Novela',5);
INSERT INTO libros VALUES (seq_libros.NEXTVAL,'El Hobbit','J.R.R. Tolkien','Fantasia',3);
INSERT INTO libros VALUES (seq_libros.NEXTVAL,'Clean Code','Robert Martin','Programación',4);
INSERT INTO libros VALUES (seq_libros.NEXTVAL,'Dune','Frank Herbert','Ciencia ficción',6);
INSERT INTO libros VALUES (seq_libros.NEXTVAL,'Fundacion','Isaac Asimov','Ciencia ficción',4);
INSERT INTO libros VALUES (seq_libros.NEXTVAL,'Neuromante','William Gibson','Ciencia ficción',2);
INSERT INTO libros VALUES (seq_libros.NEXTVAL,'La Odisea','Homero','Clásico',3);
INSERT INTO libros VALUES (seq_libros.NEXTVAL,'Dracula','Bram Stoker','Terror',5);
INSERT INTO libros VALUES (seq_libros.NEXTVAL,'El nombre del viento','Patrick Rothfuss','Fantasia',4);
INSERT INTO libros VALUES (seq_libros.NEXTVAL,'Sapiens','Yuval Noah Harari','Historia',6);
INSERT INTO libros VALUES (seq_libros.NEXTVAL,'La sombra del viento','Carlos Ruiz Zafón','Novela',5);
INSERT INTO libros VALUES (seq_libros.NEXTVAL,'Los juegos del hambre','Suzanne Collins','Juvenil',3); 

-- Tabla socios
INSERT INTO socios (nombre,email) VALUES ('Laura Garcia','laura@mail.com');
INSERT INTO socios (nombre,email) VALUES ('Pedro Lopez','pedro@mail.es');
INSERT INTO socios (nombre,email) VALUES ('Ana Ruiz','ana@mail.com');
INSERT INTO socios (nombre,email) VALUES ('Carlos Moreno','carlos@mail.com');
INSERT INTO socios (nombre,email) VALUES ('Lucia Fernandez','lucia@mail.com');
INSERT INTO socios (nombre,email) VALUES ('Miguel Torres','miguel@mail.es');
INSERT INTO socios (nombre,email) VALUES ('Sara Jimenez','sara@mail.com');
INSERT INTO socios (nombre,email) VALUES ('David Navarro','david@mail.es');
INSERT INTO socios (nombre,email) VALUES ('Elena Martin','elena@mail.com');
INSERT INTO socios (nombre,email) VALUES ('Pablo Ortega','pablo@mail.com'); 

-- Tabla prestamos
INSERT INTO prestamos (id_socio,id_libro,fecha_prestamo,fecha_devolucion) VALUES (1,100,SYSDATE,NULL);
INSERT INTO prestamos (id_socio,id_libro,fecha_prestamo,fecha_devolucion) VALUES (2,101,SYSDATE,NULL);
INSERT INTO prestamos (id_socio,id_libro,fecha_prestamo,fecha_devolucion) VALUES (1,102,SYSDATE,NULL);
INSERT INTO prestamos (id_socio,id_libro,fecha_prestamo,fecha_devolucion) VALUES (2,103,SYSDATE,NULL);
INSERT INTO prestamos (id_socio,id_libro,fecha_prestamo,fecha_devolucion) VALUES (3,104,SYSDATE,NULL);
INSERT INTO prestamos (id_socio,id_libro,fecha_prestamo,fecha_devolucion) VALUES (4,105,SYSDATE,NULL);
INSERT INTO prestamos (id_socio,id_libro,fecha_prestamo,fecha_devolucion) VALUES (5,106,SYSDATE,NULL);
INSERT INTO prestamos (id_socio,id_libro,fecha_prestamo,fecha_devolucion) VALUES (3,101,SYSDATE,NULL);
INSERT INTO prestamos (id_socio,id_libro,fecha_prestamo,fecha_devolucion) VALUES (6,102,SYSDATE,NULL);
INSERT INTO prestamos (id_socio,id_libro,fecha_prestamo,fecha_devolucion) VALUES (7,107,SYSDATE,NULL);
INSERT INTO prestamos (id_socio,id_libro,fecha_prestamo,fecha_devolucion) VALUES (8,108,SYSDATE,NULL);

/*
=================================================================================================
  5. Consultas de datos.
=================================================================================================
*/

-- Consulta 1 Mostrar el nombre del socio y la fecha del prestamo
SELECT s.nombre, p.fecha_prestamo
FROM socios s
INNER JOIN prestamos p ON s.id_socio = p.id_socio;

-- Consulta 2 Mostrar el identificador del prestamo y el nombre del socio
SELECT p.id_prestamo, s.nombre
FROM prestamos p
INNER JOIN socios s ON p.id_socio = s.id_socio;

-- Consulta 3 Mostrar los prestamos ordenados por nombre del socio
SELECT p.id_prestamo, s.nombre
FROM prestamos p
INNER JOIN socios s ON p.id_socio = s.id_socio
ORDER BY s.nombre;

-- Consulta 4 Mostrar los socios que han realizado algun prestamo
SELECT DISTINCT s.nombre
FROM socios s
INNER JOIN prestamos p ON s.id_socio = p.id_socio;

-- Consulta 5 Mostrar todos los socios con sus prestamos hayan hecho prestamos o no
SELECT s.nombre, p.id_prestamo
FROM socios s
LEFT JOIN prestamos p ON s.id_socio = p.id_socio;

-- Consulta 6 Mostrar los prestamos activos con el nombre del socio
SELECT s.nombre, p.fecha_prestamo
FROM socios s
INNER JOIN prestamos p ON s.id_socio = p.id_socio
WHERE p.fecha_devolucion IS NULL;

-- Consulta 7 Mostrar todos los prestamos y si existe el socio asociado
SELECT p.id_prestamo, s.nombre
FROM prestamos p
LEFT JOIN socios s ON p.id_socio = s.id_socio;

-- Consulta 8 Mostrar todos los socios y todos los prestamos
SELECT s.nombre, p.id_prestamo
FROM socios s
FULL OUTER JOIN prestamos p ON s.id_socio = p.id_socio;

-- Consulta 9 Mostrar los socios que han realizado algun prestamo sin asociacion
SELECT s.nombre
FROM socios s
WHERE s.id_socio IN (SELECT id_socio FROM prestamos);

-- Consulta 10 Mostrar los socios que no han realizado ningun prestamo
SELECT s.nombre
FROM socios s
WHERE s.id_socio NOT IN (SELECT id_socio FROM prestamos);

-- Consulta 11 Mostrar todos los prestamos con la informacion de todos los libros
SELECT p.id_prestamo, l.titulo, l.autor
FROM prestamos p
RIGHT JOIN libros l ON p.id_libro = l.id_libro;

-- Consulta 12 Mostrar todos los socios y todos los prestamos, aunque no coincidan
SELECT s.nombre, p.id_prestamo
FROM socios s
FULL JOIN prestamos p ON s.id_socio = p.id_socio;

-- Consulta 13 Mostrar todos los libros y todos los prestamos aunque no coincidan
SELECT l.titulo, p.id_prestamo
FROM libros l
FULL JOIN prestamos p ON l.id_libro = p.id_libro;

-- Consulta 14 Mostrar los libros que han sido prestados al menos una vez (Sin asociacion)
SELECT l.titulo
FROM libros l
WHERE l.id_libro IN (SELECT id_libro FROM prestamos);

-- Consulta 15 Mostrar los libros que nunca han sido prestados(Sin asociacion)
SELECT l.titulo
FROM libros l
WHERE l.id_libro NOT IN (SELECT id_libro FROM prestamos);

-- Consulta 16 Mostrar los socios que han pedido el libro con la id "101" (Sin asociacion)
SELECT s.nombre
FROM socios s
WHERE s.id_socio IN (SELECT id_socio FROM prestamos WHERE id_libro = 101);

-- Consulta 17 Mostrar los libros pedidos por el socio con la id "1" (Sin asociacion)
SELECT id_libro
FROM prestamos
WHERE id_socio = 1;

-- Consulta 18 mostrar los libros cuyo stock es mayor que el stock medio de todos los libros
SELECT titulo
FROM libros
WHERE stock > (SELECT AVG(stock) FROM libros);

-- Consulta 19 Mostrar el nombre del socio, el titulo del libro y la fecha del prestamo
SELECT s.nombre, l.titulo, p.fecha_prestamo
FROM socios s
INNER JOIN prestamos p ON s.id_socio = p.id_socio
INNER JOIN libros l ON p.id_libro = l.id_libro;

-- Consulta 20 Mostrar todos los socios y los prestamos que han realizado, junto con el titulo del libro
SELECT s.nombre, p.id_prestamo, l.titulo
FROM prestamos p
FULL JOIN socios s ON p.id_socio = s.id_socio
INNER JOIN libros l ON p.id_libro = l.id_libro;