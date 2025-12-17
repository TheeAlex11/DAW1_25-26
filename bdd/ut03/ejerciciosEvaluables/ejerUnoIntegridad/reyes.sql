-- Tabla persona
CREATE TABLE persona (
    idPersona INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(150) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20)
);

-- Subtipo niño
CREATE TABLE nino (
    idPersona INT PRIMARY KEY,
    comportamiento VARCHAR(100),
    direccion VARCHAR(200),
    ciudad VARCHAR(100),
    cp VARCHAR(10),
    FOREIGN KEY (idPersona) REFERENCES persona(idPersona)
);

-- Subtipo rey
CREATE TABLE rey (
    idPersona INT PRIMARY KEY,
    camelloNombre VARCHAR(100),
    zonaPreferida VARCHAR(100),
    FOREIGN KEY (idPersona) REFERENCES persona(idPersona)
);

-- Subtipo ayudante
CREATE TABLE ayudante (
    idPersona INT PRIMARY KEY,
    turno VARCHAR(50),
    habilidad VARCHAR(100),
    FOREIGN KEY (idPersona) REFERENCES persona(idPersona)
);

-- Tabla carta
CREATE TABLE carta (
    idCarta INT PRIMARY KEY,
    fechaEscritura DATE NOT NULL,
    mensaje TEXT,
    idNino INT NOT NULL,
    FOREIGN KEY (idNino) REFERENCES nino(idPersona)
);

-- Tabla regalo
CREATE TABLE regalo (
    idRegalo INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(100),
    edadRecomendada INT,
    peligroso BOOLEAN
);

-- Tabla almacén
CREATE TABLE almacen (
    idAlmacen INT PRIMARY KEY,
    direccion VARCHAR(200),
    ciudad VARCHAR(100)
);

-- Tabla entrega
CREATE TABLE entrega (
    idEntrega INT PRIMARY KEY,
    fechaEntrega DATE NOT NULL,
    franjaHoraria VARCHAR(50),
    observaciones TEXT,
    idRey INT NOT NULL,
    idNino INT NOT NULL,
    FOREIGN KEY (idRey) REFERENCES rey(idPersona),
    FOREIGN KEY (idNino) REFERENCES nino(idPersona)
);

-- Relación pide (Carta - Regalo)
CREATE TABLE pide (
    idCarta INT,
    idRegalo INT,
    prioridad INT,
    cantidadPedida INT,
    PRIMARY KEY (idCarta, idRegalo),
    FOREIGN KEY (idCarta) REFERENCES carta(idCarta),
    FOREIGN KEY (idRegalo) REFERENCES regalo(idRegalo)
);

-- Relación seEntrega (Entrega - Regalo)
CREATE TABLE seEntrega (
    idEntrega INT,
    idRegalo INT,
    cantidad INT,
    envuelto BOOLEAN,
    PRIMARY KEY (idEntrega, idRegalo),
    FOREIGN KEY (idEntrega) REFERENCES entrega(idEntrega),
    FOREIGN KEY (idRegalo) REFERENCES regalo(idRegalo)
);

-- Relación almacena (Almacén - Regalo)
CREATE TABLE almacena (
    idAlmacen INT,
    idRegalo INT,
    stockActual INT,
    pasillo VARCHAR(50),
    PRIMARY KEY (idAlmacen, idRegalo),
    FOREIGN KEY (idAlmacen) REFERENCES almacen(idAlmacen),
    FOREIGN KEY (idRegalo) REFERENCES regalo(idRegalo)
);
