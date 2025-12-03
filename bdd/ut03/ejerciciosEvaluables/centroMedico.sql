
-- ============================================================================
-- EJERCICIO 2: CENTRO MÉDICO
-- ============================================================================

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
