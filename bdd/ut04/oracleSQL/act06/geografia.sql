CREATE TABLE provincia (
    nombre VARCHAR2(50) PRIMARY KEY,
    capital VARCHAR2(50)
);

CREATE TABLE mar (
    nombre VARCHAR2(50) PRIMARY KEY
);

CREATE TABLE ciudad (
    cp CHAR(5) PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    numHab NUMBER,
    provincia VARCHAR2(50),
    CONSTRAINT fk_ciudad_provincia
        FOREIGN KEY (provincia)
        REFERENCES provincia(nombre)
);

CREATE TABLE baña (
    nomMar VARCHAR2(50),
    nomPro VARCHAR2(50),
    km_costa NUMBER,
    CONSTRAINT pk_baña PRIMARY KEY (nomMar, nomPro),
    CONSTRAINT fk_baña_mar
        FOREIGN KEY (nomMar)
        REFERENCES mar(nombre),
    CONSTRAINT fk_baña_provincia
        FOREIGN KEY (nomPro)
        REFERENCES provincia(nombre)
);

CREATE TABLE rio (
    nombre VARCHAR2(50) PRIMARY KEY,
    nomMar VARCHAR2(50),
    nomPro VARCHAR2(50),
    nomRio VARCHAR2(50) NULL,
    CONSTRAINT fk_rio_mar
        FOREIGN KEY (nomMar)
        REFERENCES mar(nombre),
    CONSTRAINT fk_rio_provincia
        FOREIGN KEY (nomPro)
        REFERENCES provincia(nombre),
    CONSTRAINT fk_rio_autorrio
        FOREIGN KEY (nomRio)
        REFERENCES rio(nombre)
        ON DELETE SET NULL
);

CREATE TABLE rioPasa (
    nomRio VARCHAR2(50),
    cpCiudad CHAR(5),
    CONSTRAINT pk_rioPasa PRIMARY KEY (nomRio, cpCiudad),
    CONSTRAINT fk_rioPasa_rio
        FOREIGN KEY (nomRio)
        REFERENCES rio(nombre)
        ON DELETE CASCADE,
    CONSTRAINT fk_rioPasa_ciudad
        FOREIGN KEY (cpCiudad)
        REFERENCES ciudad(cp)
        ON DELETE CASCADE
);

-- Inserts para tabla provincia
INSERT INTO provincia (nombre, capital) VALUES ('Andalucia', 'Sevilla');
INSERT INTO provincia (nombre, capital) VALUES ('Cataluña', 'Barcelona');
INSERT INTO provincia (nombre, capital) VALUES ('Galicia', 'Santiago');
INSERT INTO provincia (nombre, capital) VALUES ('Valencia', 'Valencia');
INSERT INTO provincia (nombre, capital) VALUES ('Madrid', 'Madrid');

-- Inserts para tabla mar
INSERT INTO mar (nombre) VALUES ('Mediterraneo');
INSERT INTO mar (nombre) VALUES ('Cantabrico');
INSERT INTO mar (nombre) VALUES ('Atlantico');
INSERT INTO mar (nombre) VALUES ('Balear');
INSERT INTO mar (nombre) VALUES ('Alboran');

-- Inserts para tabla ciudad
INSERT INTO ciudad (cp, nombre, numHab, provincia) VALUES ('41001', 'Sevilla', 700000, 'Andalucia');
INSERT INTO ciudad (cp, nombre, numHab, provincia) VALUES ('08001', 'Barcelona', 1600000, 'Cataluña');
INSERT INTO ciudad (cp, nombre, numHab, provincia) VALUES ('15701', 'Santiago', 95000, 'Galicia');
INSERT INTO ciudad (cp, nombre, numHab, provincia) VALUES ('46001', 'Valencia', 800000, 'Valencia');
INSERT INTO ciudad (cp, nombre, numHab, provincia) VALUES ('28001', 'Madrid', 3300000, 'Madrid');

-- Inserts para tabla baña
INSERT INTO baña (nomMar, nomPro, km_costa) VALUES ('Mediterraneo', 'Cataluña', 580);
INSERT INTO baña (nomMar, nomPro, km_costa) VALUES ('Mediterraneo', 'Valencia', 500);
INSERT INTO baña (nomMar, nomPro, km_costa) VALUES ('Atlantico', 'Galicia', 1200);
INSERT INTO baña (nomMar, nomPro, km_costa) VALUES ('Cantabrico', 'Galicia', 800);
INSERT INTO baña (nomMar, nomPro, km_costa) VALUES ('Alboran', 'Andalucia', 300);

-- Inserts para tabla rio
INSERT INTO rio (nombre, nomMar, nomPro, nomRio) VALUES ('Guadalquivir', 'Alboran', 'Andalucia', NULL);
INSERT INTO rio (nombre, nomMar, nomPro, nomRio) VALUES ('Ebro', 'Mediterraneo', 'Cataluña', NULL);
INSERT INTO rio (nombre, nomMar, nomPro, nomRio) VALUES ('Miño', 'Atlantico', 'Galicia', NULL);
INSERT INTO rio (nombre, nomMar, nomPro, nomRio) VALUES ('Jucar', 'Mediterraneo', 'Valencia', NULL);
INSERT INTO rio (nombre, nomMar, nomPro, nomRio) VALUES ('Manzanares', 'Mediterraneo', 'Madrid', 'Jucar');

-- Inserts para tabla rioPasa
INSERT INTO rioPasa (nomRio, cpCiudad) VALUES ('Guadalquivir', '41001');
INSERT INTO rioPasa (nomRio, cpCiudad) VALUES ('Ebro', '08001');
INSERT INTO rioPasa (nomRio, cpCiudad) VALUES ('Miño', '15701');
INSERT INTO rioPasa (nomRio, cpCiudad) VALUES ('Jucar', '46001');
INSERT INTO rioPasa (nomRio, cpCiudad) VALUES ('Manzanares', '28001');
