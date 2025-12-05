-- ============================================================================
-- EJERCICIO 2: CENTRO MÉDICO
-- ============================================================================

-- Modelo relacional
--
-- MEDICO(Codigo_medico PK, Nombre, Apellidos, Especialidad, Telefono)
-- PACIENTE(Codigo_paciente PK, Nombre, Apellidos, Direccion, Telefono, Fecha_nacimiento, Numero_seguridad_social)
-- CONSULTA(Codigo_consulta PK, Codigo_medico FK, Codigo_paciente FK, Fecha_consulta, Diagnostico, Tratamiento)

-----------------------------------------------------------------------------------------
-- SQL
-----------------------------------------------------------------------------------------

-- Tabla MEDICO
CREATE TABLE MEDICO (
    Codigo_medico INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Especialidad VARCHAR(50),
    Telefono VARCHAR(15)
);

-- Tabla PACIENTE
CREATE TABLE PACIENTE (
    Codigo_paciente INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100),
    Telefono VARCHAR(15),
    Fecha_nacimiento DATE,
    Numero_seguridad_social VARCHAR(20)
);

-- Tabla CONSULTA
CREATE TABLE CONSULTA (
    Codigo_consulta INT PRIMARY KEY,
    Codigo_medico INT,
    Codigo_paciente INT,
    Fecha_consulta DATETIME,
    Diagnostico VARCHAR(200),
    Tratamiento VARCHAR(200),
    FOREIGN KEY (Codigo_medico) REFERENCES MEDICO(Codigo_medico),
    FOREIGN KEY (Codigo_paciente) REFERENCES PACIENTE(Codigo_paciente)
);
