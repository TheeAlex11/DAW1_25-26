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

-- Inserts para tabla medico
INSERT INTO medico (numCol, dni, nombre, direccion, telefono, anyCol) VALUES ('MED001', '12345678A', 'Juan Perez', 'Calle Mayor 1, Madrid', '600123456', 2010);
INSERT INTO medico (numCol, dni, nombre, direccion, telefono, anyCol) VALUES ('MED002', '23456789B', 'Ana Gomez', 'Calle Luna 5, Barcelona', '600234567', 2012);
INSERT INTO medico (numCol, dni, nombre, direccion, telefono, anyCol) VALUES ('MED003', '34567890C', 'Luis Martinez', 'Av. del Sol 12, Valencia', '600345678', 2015);
INSERT INTO medico (numCol, dni, nombre, direccion, telefono, anyCol) VALUES ('MED004', '45678901D', 'Sofia Ramirez', 'Calle Verde 3, Sevilla', '600456789', 2018);
INSERT INTO medico (numCol, dni, nombre, direccion, telefono, anyCol) VALUES ('MED005', '56789012E', 'Carlos Torres', 'Plaza Azul 7, Bilbao', '600567890', 2020);

-- Inserts para tabla sala
INSERT INTO sala (codigoSala, ubicacion) VALUES ('S001', 'Planta 1, Madrid');
INSERT INTO sala (codigoSala, ubicacion) VALUES ('S002', 'Planta 2, Barcelona');
INSERT INTO sala (codigoSala, ubicacion) VALUES ('S003', 'Planta 3, Valencia');
INSERT INTO sala (codigoSala, ubicacion) VALUES ('S004', 'Planta 4, Sevilla');
INSERT INTO sala (codigoSala, ubicacion) VALUES ('S005', 'Planta 5, Bilbao');

-- Inserts para tabla paciente
INSERT INTO paciente (cip, nss, dni, nombre, direccion, telefono, historial, numColMedico) 
VALUES ('CIP00000000001', 'NSS000001', '12345678A', 'Pedro Lopez', 'Calle Falsa 10, Madrid', '600111222', 'Diabetes', 'MED001');
INSERT INTO paciente (cip, nss, dni, nombre, direccion, telefono, historial, numColMedico) 
VALUES ('CIP00000000002', 'NSS000002', '23456789B', 'Laura Sanchez', 'Calle Real 5, Barcelona', '600222333', 'Hipertension', 'MED002');
INSERT INTO paciente (cip, nss, dni, nombre, direccion, telefono, historial, numColMedico) 
VALUES ('CIP00000000003', 'NSS000003', '34567890C', 'Miguel Torres', 'Av. Sol 12, Valencia', '600333444', 'Asma', 'MED003');
INSERT INTO paciente (cip, nss, dni, nombre, direccion, telefono, historial, numColMedico) 
VALUES ('CIP00000000004', 'NSS000004', '45678901D', 'Sofia Diaz', 'Calle Verde 3, Sevilla', '600444555', 'Alergia', 'MED004');
INSERT INTO paciente (cip, nss, dni, nombre, direccion, telefono, historial, numColMedico) 
VALUES ('CIP00000000005', 'NSS000005', '56789012E', 'Carlos Fernandez', 'Plaza Azul 7, Bilbao', '600555666', 'Colesterol alto', 'MED005');

-- Inserts para tabla pasaConsulta
INSERT INTO pasaConsulta (numColMedico, codigoSala, horario) VALUES ('MED001', 'S001', '08:00-10:00');
INSERT INTO pasaConsulta (numColMedico, codigoSala, horario) VALUES ('MED002', 'S002', '09:00-11:00');
INSERT INTO pasaConsulta (numColMedico, codigoSala, horario) VALUES ('MED003', 'S003', '10:00-12:00');
INSERT INTO pasaConsulta (numColMedico, codigoSala, horario) VALUES ('MED004', 'S004', '11:00-13:00');
INSERT INTO pasaConsulta (numColMedico, codigoSala, horario) VALUES ('MED005', 'S005', '12:00-14:00');
