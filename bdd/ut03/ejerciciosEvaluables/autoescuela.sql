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


-- ============================================================================
-- EJERCICIO 3: SUCURSAL BANCARIA
-- ============================================================================

-- Tabla CLIENTE
CREATE TABLE CLIENTE (
    Codigo_cliente INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    DNI VARCHAR(10) UNIQUE,
    Direccion VARCHAR(100),
    Telefono VARCHAR(15)
);

-- Tabla CUENTA
CREATE TABLE CUENTA (
    Numero_cuenta VARCHAR(20) PRIMARY KEY,
    Codigo_cliente INT,
    Tipo_cuenta VARCHAR(20),
    Saldo DECIMAL(12,2),
    Fecha_apertura DATE,
    FOREIGN KEY (Codigo_cliente) REFERENCES CLIENTE(Codigo_cliente)
);

-- Tabla TRANSACCION
CREATE TABLE TRANSACCION (
    Codigo_transaccion INT PRIMARY KEY,
    Numero_cuenta VARCHAR(20),
    Tipo_transaccion VARCHAR(20),
    Importe DECIMAL(12,2),
    Fecha_transaccion DATETIME,
    Concepto VARCHAR(100),
    FOREIGN KEY (Numero_cuenta) REFERENCES CUENTA(Numero_cuenta)
);


-- ============================================================================
-- EJERCICIO 4: GEOGRAFÍA
-- ============================================================================

-- Tabla PAIS
CREATE TABLE PAIS (
    Codigo_pais VARCHAR(3) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Continente VARCHAR(20),
    Superficie INT,
    Poblacion BIGINT,
    Capital VARCHAR(50)
);

-- Tabla CIUDAD
CREATE TABLE CIUDAD (
    Codigo_ciudad INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Codigo_pais VARCHAR(3),
    Poblacion INT,
    FOREIGN KEY (Codigo_pais) REFERENCES PAIS(Codigo_pais)
);

-- Tabla RIO
CREATE TABLE RIO (
    Codigo_rio INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Longitud INT,
    Codigo_pais VARCHAR(3),
    FOREIGN KEY (Codigo_pais) REFERENCES PAIS(Codigo_pais)
);


-- ============================================================================
-- EJERCICIO 5: LIGA DE FÚTBOL
-- ============================================================================

-- Tabla EQUIPO
CREATE TABLE EQUIPO (
    Codigo_equipo INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Estadio VARCHAR(50),
    Ciudad VARCHAR(50),
    Fecha_fundacion DATE
);

-- Tabla JUGADOR
CREATE TABLE JUGADOR (
    Codigo_jugador INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Codigo_equipo INT,
    Posicion VARCHAR(20),
    Fecha_nacimiento DATE,
    Nacionalidad VARCHAR(30),
    FOREIGN KEY (Codigo_equipo) REFERENCES EQUIPO(Codigo_equipo)
);

-- Tabla PARTIDO
CREATE TABLE PARTIDO (
    Codigo_partido INT PRIMARY KEY,
    Equipo_local INT,
    Equipo_visitante INT,
    Fecha_partido DATETIME,
    Goles_local INT,
    Goles_visitante INT,
    Estadio VARCHAR(50),
    FOREIGN KEY (Equipo_local) REFERENCES EQUIPO(Codigo_equipo),
    FOREIGN KEY (Equipo_visitante) REFERENCES EQUIPO(Codigo_equipo)
);