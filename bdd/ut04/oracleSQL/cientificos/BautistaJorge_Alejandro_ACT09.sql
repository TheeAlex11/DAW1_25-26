-- actividad 9 joins y vistas
-- base de datos cientificos

-- creacion de tablas

CREATE TABLE cientificos (
    dni VARCHAR2(8) NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    apellido VARCHAR2(50) NOT NULL,
    CONSTRAINT pk_cientificos PRIMARY KEY (dni)
);

CREATE TABLE proyectos (
    id CHAR(4) NOT NULL,
    titulo VARCHAR2(50) NOT NULL,
    horas NUMBER(11) NOT NULL,
    CONSTRAINT pk_proyectos PRIMARY KEY (id)
);

CREATE TABLE asignacion (
    cientifico VARCHAR2(8) NOT NULL,
    proyecto CHAR(4) NOT NULL,
    CONSTRAINT pk_asignacion PRIMARY KEY (cientifico, proyecto),
    CONSTRAINT fk_cientifico FOREIGN KEY (cientifico) REFERENCES cientificos(dni),
    CONSTRAINT fk_proyecto FOREIGN KEY (proyecto) REFERENCES proyectos(id)
);


-- insercion de datos

INSERT INTO cientificos VALUES ('11111111', 'Javier', 'Rodríguez');
INSERT INTO cientificos VALUES ('22222222', 'Ana', 'Diaz');
INSERT INTO cientificos VALUES ('33333333', 'Juan', 'Perez');
INSERT INTO cientificos VALUES ('44444444', 'David', 'Ortiz');
INSERT INTO cientificos VALUES ('55555555', 'Jennifer', 'Mendoza');
INSERT INTO cientificos VALUES ('66666666', 'Carlos', 'Salgado');

INSERT INTO proyectos VALUES ('1', 'Vacunación COVID-19', 500);
INSERT INTO proyectos VALUES ('2', 'Tratamiento contra el Cáncer', 1500);
INSERT INTO proyectos VALUES ('3', 'Inteligencia artificial', 200);
INSERT INTO proyectos VALUES ('4', 'Agujeros negros', 250);

INSERT INTO asignacion VALUES ('11111111', '1');
INSERT INTO asignacion VALUES ('11111111', '2');
INSERT INTO asignacion VALUES ('22222222', '1');
INSERT INTO asignacion VALUES ('33333333', '2');
INSERT INTO asignacion VALUES ('44444444', '2');
INSERT INTO asignacion VALUES ('44444444', '3');
INSERT INTO asignacion VALUES ('55555555', '2');

COMMIT;


-- consultas

-- consulta 1: todos los cientificos con sus proyectos
-- uso left join para que salgan todos aunque no tengan proyecto (como carlos)
SELECT c.dni, c.nombre, c.apellido, p.id, p.titulo, p.horas
FROM cientificos c
LEFT JOIN asignacion a ON c.dni = a.cientifico
LEFT JOIN proyectos p ON a.proyecto = p.id;


-- consulta 2: cuantos proyectos tiene cada cientifico
-- con left join para que salga carlos con 0
SELECT c.dni, c.nombre, c.apellido, COUNT(a.proyecto) AS Proyectos
FROM cientificos c
LEFT JOIN asignacion a ON c.dni = a.cientifico
GROUP BY c.dni, c.nombre, c.apellido;


-- consulta 3: cuantos cientificos hay en cada proyecto
-- left join desde proyectos para que salgan todos los proyectos
SELECT p.id, p.titulo, COUNT(a.cientifico) AS Cientificos
FROM proyectos p
LEFT JOIN asignacion a ON p.id = a.proyecto
GROUP BY p.id, p.titulo
ORDER BY p.id;


-- consulta 4: horas totales de cada cientifico
SELECT c.dni, c.nombre, c.apellido, SUM(p.horas) AS "Total de horas"
FROM cientificos c
LEFT JOIN asignacion a ON c.dni = a.cientifico
LEFT JOIN proyectos p ON a.proyecto = p.id
GROUP BY c.dni, c.nombre, c.apellido;


-- consulta 5: cientificos con mas de un proyecto y media de horas superior a 850
SELECT c.dni, c.nombre, c.apellido, COUNT(a.proyecto) AS "Total Proyectos", AVG(p.horas) AS "Media de Horas"
FROM cientificos c
JOIN asignacion a ON c.dni = a.cientifico
JOIN proyectos p ON a.proyecto = p.id
GROUP BY c.dni, c.nombre, c.apellido
HAVING COUNT(a.proyecto) > 1 AND AVG(p.horas) > 850;