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
    -- FK Codigo_pais:
    -- ON DELETE SET NULL: Si se elimina un país, las ciudades no se eliminan,
    --                     solo se les asigna NULL al país (preserva información geográfica)
    -- ON UPDATE CASCADE: Si cambia el código del país, se actualiza automáticamente
    --                    en todas sus ciudades
    FOREIGN KEY (Codigo_pais) REFERENCES PAIS(Codigo_pais)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Tabla RIO
CREATE TABLE RIO (
    Codigo_rio INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Longitud INT,
    Codigo_pais VARCHAR(3),
    -- FK Codigo_pais:
    -- ON DELETE SET NULL: Si se elimina un país, los ríos no se eliminan,
    --                     solo se les asigna NULL al país (preserva datos geográficos)
    -- ON UPDATE CASCADE: Si cambia el código del país, se actualiza automáticamente
    --                    en todos sus ríos
    FOREIGN KEY (Codigo_pais) REFERENCES PAIS(Codigo_pais)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);