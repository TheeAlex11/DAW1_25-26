CREATE TABLE alumno (
 dniAlumno CHAR(9) PRIMARY KEY,
 nombre VARCHAR2(50) NOT NULL,
 edad NUMBER(3) NOT NULL,
 email VARCHAR2(100)
);

CREATE TABLE profesor (
 dniProfesor CHAR(9) PRIMARY KEY,
 nombre VARCHAR2(50) NOT NULL,
 direccion VARCHAR2(100),
 telefono VARCHAR2(15)
);

CREATE TABLE coche (
 matricula VARCHAR2(10) PRIMARY KEY,
 color VARCHAR2(20),
 anyCompra NUMBER(4),
 dniAlumno CHAR(9),
 CONSTRAINT fk_coche_alumno
 FOREIGN KEY (dniAlumno) REFERENCES alumno(dniAlumno)
);

CREATE TABLE ensena (
 dniAlumno CHAR(9),
 dniProfesor CHAR(9),
 CONSTRAINT pk_ensena PRIMARY KEY (dniAlumno, dniProfesor),
 CONSTRAINT fk_ensena_alumno
 FOREIGN KEY (dniAlumno) REFERENCES alumno(dniAlumno),
 CONSTRAINT fk_ensena_profesor
 FOREIGN KEY (dniProfesor) REFERENCES profesor(dniProfesor)
);