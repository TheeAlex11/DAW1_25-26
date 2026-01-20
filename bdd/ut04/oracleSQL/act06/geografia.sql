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
