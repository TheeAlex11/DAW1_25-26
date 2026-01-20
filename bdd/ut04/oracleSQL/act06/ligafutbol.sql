CREATE TABLE equipo (
    nomEqui VARCHAR2(40) PRIMARY KEY
);

CREATE TABLE arbitro (
    numCol NUMBER PRIMARY KEY,
    nombre VARCHAR2(50)
);

CREATE TABLE partido (
    cod NUMBER PRIMARY KEY,
    fecha DATE
);

CREATE TABLE futbolista (
    numFicha NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    apellidos VARCHAR2(80),
    fechaNac DATE,
    estatura NUMBER(3),
    peso NUMBER(3),
    nomEqui VARCHAR2(40),
    CONSTRAINT fk_futbolista_equipo
        FOREIGN KEY (nomEqui)
        REFERENCES equipo(nomEqui)
);

CREATE TABLE ha_militado (
    numFichaFut NUMBER,
    nombreEquipo VARCHAR2(40),
    duracion NUMBER,
    fechaCom DATE,
    clausResc NUMBER,
    CONSTRAINT pk_ha_militado PRIMARY KEY (numFichaFut, nombreEquipo),
    CONSTRAINT fk_ha_militado_futbolista
        FOREIGN KEY (numFichaFut)
        REFERENCES futbolista(numFicha)
        ON DELETE CASCADE,
    CONSTRAINT fk_ha_militado_equipo
        FOREIGN KEY (nombreEquipo)
        REFERENCES equipo(nomEqui)
);

CREATE TABLE disputa (
    nomEquipo VARCHAR2(40),
    codPartido NUMBER,
    CONSTRAINT pk_disputa PRIMARY KEY (nomEquipo, codPartido),
    CONSTRAINT fk_disputa_equipo
        FOREIGN KEY (nomEquipo)
        REFERENCES equipo(nomEqui),
    CONSTRAINT fk_disputa_partido
        FOREIGN KEY (codPartido)
        REFERENCES partido(cod)
        ON DELETE CASCADE
);

CREATE TABLE participa (
    numMinutos NUMBER,
    goles NUMBER,
    tarjetas NUMBER,
    codPartido NUMBER,
    numFichaFutb NUMBER,
    CONSTRAINT pk_participa PRIMARY KEY (codPartido, numFichaFutb),
    CONSTRAINT fk_participa_partido
        FOREIGN KEY (codPartido)
        REFERENCES partido(cod)
        ON DELETE CASCADE,
    CONSTRAINT fk_participa_futbolista
        FOREIGN KEY (numFichaFutb)
        REFERENCES futbolista(numFicha)
        ON DELETE CASCADE
);

CREATE TABLE arbitra (
    funcion VARCHAR2(20),
    codPartido NUMBER,
    numCol NUMBER,
    CONSTRAINT pk_arbitra PRIMARY KEY (codPartido, numCol),
    CONSTRAINT fk_arbitra_partido
        FOREIGN KEY (codPartido)
        REFERENCES partido(cod)
        ON DELETE CASCADE,
    CONSTRAINT fk_arbitra_arbitro
        FOREIGN KEY (numCol)
        REFERENCES arbitro(numCol)
        ON DELETE CASCADE
);
