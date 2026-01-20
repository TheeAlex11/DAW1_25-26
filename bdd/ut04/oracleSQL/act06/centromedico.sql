CREATE TABLE medico (
    numCol CHAR(6) PRIMARY KEY,
    dni CHAR(9) NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    direccion VARCHAR2(100),
    telefono VARCHAR2(15),
    anyCol NUMBER(4)
);

CREATE TABLE sala (
    codigoSala CHAR(4) PRIMARY KEY,
    ubicacion VARCHAR2(50) NOT NULL
);

CREATE TABLE paciente (
    cip CHAR(14) PRIMARY KEY,
    nss CHAR(12),
    dni CHAR(9),
    nombre VARCHAR2(50) NOT NULL,
    direccion VARCHAR2(100),
    telefono VARCHAR2(15),
    historial VARCHAR2(200),
    numColMedico CHAR(6),
    CONSTRAINT fk_paciente_medico
        FOREIGN KEY (numColMedico)
        REFERENCES medico(numCol)
);

CREATE TABLE pasaConsulta (
    numColMedico CHAR(6),
    codigoSala CHAR(4),
    horario VARCHAR2(20),
    CONSTRAINT pk_pasaConsulta
        PRIMARY KEY (numColMedico, codigoSala),
    CONSTRAINT fk_pasa_medico
        FOREIGN KEY (numColMedico)
        REFERENCES medico(numCol)
        ON DELETE CASCADE,
    CONSTRAINT fk_pasa_sala
        FOREIGN KEY (codigoSala)
        REFERENCES sala(codigoSala)
        ON DELETE CASCADE
);
