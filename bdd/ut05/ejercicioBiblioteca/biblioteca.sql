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

