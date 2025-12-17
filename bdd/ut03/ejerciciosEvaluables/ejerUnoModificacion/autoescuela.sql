CREATE TABLE alumno (
        dniAlumno CHAR(9) PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        edad INT NOT NULL,
        email VARCHAR(100)
    );

CREATE TABLE profesor (
        dniProfesor CHAR(9) PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        direccion VARCHAR(100),
        telefono VARCHAR(15)
    );

CREATE TABLE coche (
        matricula VARCHAR(10) PRIMARY KEY,
        color VARCHAR(20),
        anyCompra SMALLINT,
        dniAlumno CHAR(9),
        FOREIGN KEY (dniAlumno) REFERENCES alumno (dniAlumno)
    );

CREATE TABLE ensena (
        dniAlumno CHAR(9),
        dniProfesor CHAR(9),
        PRIMARY KEY (dniAlumno, dniProfesor),
        FOREIGN KEY (dniAlumno) REFERENCES alumno (dniAlumno),
        FOREIGN KEY (dniProfesor) REFERENCES profesor (dniProfesor)
    );