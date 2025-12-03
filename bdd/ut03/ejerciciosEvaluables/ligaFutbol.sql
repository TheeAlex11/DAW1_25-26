
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