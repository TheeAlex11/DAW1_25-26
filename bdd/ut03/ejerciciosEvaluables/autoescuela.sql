-- ============================================================================
-- EJERCICIO 1: AUTOESCUELA
-- ============================================================================

-- Tabla ALUMNO
CREATE TABLE ALUMNO (
    Codigo_alumno INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100),
    Telefono VARCHAR(15),
    Fecha_nacimiento DATE
);

-- Tabla PROFESOR
CREATE TABLE PROFESOR (
    Codigo_profesor INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15),
    Especialidad VARCHAR(50)
);

-- Tabla VEHICULO
CREATE TABLE VEHICULO (
    Matricula VARCHAR(10) PRIMARY KEY,
    Marca VARCHAR(30),
    Modelo VARCHAR(30),
    Tipo VARCHAR(20)
);

-- Tabla CLASE
CREATE TABLE CLASE (
    Codigo_alumno INT,
    Codigo_profesor INT,
    Matricula VARCHAR(10),
    Fecha DATE,
    Hora TIME,
    PRIMARY KEY (Codigo_alumno, Codigo_profesor, Fecha, Hora),
    FOREIGN KEY (Codigo_alumno) REFERENCES ALUMNO(Codigo_alumno),
    FOREIGN KEY (Codigo_profesor) REFERENCES PROFESOR(Codigo_profesor),
    FOREIGN KEY (Matricula) REFERENCES VEHICULO(Matricula)
);