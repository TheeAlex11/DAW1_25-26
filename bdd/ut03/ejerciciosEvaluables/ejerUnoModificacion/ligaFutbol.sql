-- ============================================================================
-- EJERCICIO 5: LIGA DE FÚTBOL
-- ============================================================================

-- Modelo relacional
--
-- EQUIPO(Codigo_equipo PK, Nombre, Estadio, Ciudad, Fecha_fundacion)
-- JUGADOR(Codigo_jugador PK, Nombre, Apellidos, Codigo_equipo FK, Posicion, Fecha_nacimiento, Nacionalidad)
-- PARTIDO(Codigo_partido PK, Equipo_local FK, Equipo_visitante FK, Fecha_partido, Goles_local, Goles_visitante, Estadio)

-----------------------------------------------------------------------------------------
-- SQL
-----------------------------------------------------------------------------------------

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
    -- FK Codigo_equipo:
    -- ON DELETE SET NULL: Si se elimina un equipo, los jugadores no se eliminan,
    --                     quedan como "agentes libres" (permite mantener el registro histórico)
    -- ON UPDATE CASCADE: Si cambia el código del equipo, se actualiza automáticamente
    --                    en todos sus jugadores
    FOREIGN KEY (Codigo_equipo) REFERENCES EQUIPO(Codigo_equipo)
        ON DELETE SET NULL
        ON UPDATE CASCADE
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
    -- FK Equipo_local:
    -- ON DELETE RESTRICT: No se puede eliminar un equipo si tiene partidos registrados como local
    --                     (preserva el historial deportivo completo)
    -- ON UPDATE CASCADE: Si cambia el código del equipo, se actualiza automáticamente
    --                    en todos sus partidos como local
    FOREIGN KEY (Equipo_local) REFERENCES EQUIPO(Codigo_equipo)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    -- FK Equipo_visitante:
    -- ON DELETE RESTRICT: No se puede eliminar un equipo si tiene partidos registrados como visitante
    --                     (mantiene la integridad del historial de partidos)
    -- ON UPDATE CASCADE: Si cambia el código del equipo, se actualiza automáticamente
    --                    en todos sus partidos como visitante
    FOREIGN KEY (Equipo_visitante) REFERENCES EQUIPO(Codigo_equipo)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);