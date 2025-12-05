-- ============================================================================
-- EJERCICIO 4: GEOGRAFÍA
-- ============================================================================

-- Modelo relacional
--
-- PAIS(Codigo_pais PK, Nombre, Continente, Superficie, Poblacion, Capital)
-- CIUDAD(Codigo_ciudad PK, Nombre, Codigo_pais FK, Poblacion)
-- RIO(Codigo_rio PK, Nombre, Longitud, Codigo_pais FK)

-----------------------------------------------------------------------------------------
-- SQL
-----------------------------------------------------------------------------------------

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

