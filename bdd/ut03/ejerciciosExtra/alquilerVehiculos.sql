CREATE TABLE Vehiculo (
    matricula VARCHAR(15) PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindrada INT,
    potencia INT,
    precio_diario DECIMAL(10,2) NOT NULL,
    fecha_compra DATE NOT NULL,
    tipo_vehiculo ENUM('turismo', 'furgoneta') NOT NULL
);

CREATE TABLE Turismo (
    matricula VARCHAR(15) PRIMARY KEY,
    num_puertas INT NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    FOREIGN KEY (matricula) REFERENCES Vehiculo(matricula)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Furgoneta (
    matricula VARCHAR(15) PRIMARY KEY,
    metros_cubicos DECIMAL(10,2) NOT NULL,
    carga_max_kg INT NOT NULL,
    FOREIGN KEY (matricula) REFERENCES Vehiculo(matricula)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Cliente (
    dni VARCHAR(15) PRIMARY KEY,
    cod_cliente VARCHAR(10) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(100),
    localidad VARCHAR(50),
    telefono VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Alquiler (
    id_alquiler INT AUTO_INCREMENT PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    dias INT NOT NULL,
    matricula VARCHAR(15) NOT NULL,
    dni_cliente VARCHAR(15) NOT NULL,
    FOREIGN KEY (matricula) REFERENCES Vehiculo(matricula)
        ON UPDATE CASCADE,
    FOREIGN KEY (dni_cliente) REFERENCES Cliente(dni)
        ON UPDATE CASCADE
);

CREATE TABLE Pieza (
    cod_pieza INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio_compra DECIMAL(10,2) NOT NULL
);

CREATE TABLE Reparacion (
    id_reparacion INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    descripcion TEXT,
    matricula VARCHAR(15) NOT NULL,
    FOREIGN KEY (matricula) REFERENCES Vehiculo(matricula)
        ON UPDATE CASCADE
);

CREATE TABLE Reparacion_Pieza (
    id_reparacion INT NOT NULL,
    cod_pieza INT NOT NULL,
    unidades INT NOT NULL,
    PRIMARY KEY (id_reparacion, cod_pieza),
    FOREIGN KEY (id_reparacion) REFERENCES Reparacion(id_reparacion)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (cod_pieza) REFERENCES Pieza(cod_pieza)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

---------------------------------------------------------------------------------------------
--      De aquí en adelante, chatGPT, puro y duro.                                         --
---------------------------------------------------------------------------------------------
INSERT INTO Vehiculo (matricula, marca, modelo, cilindrada, potencia, precio_diario, fecha_compra, tipo_vehiculo)
VALUES 
('1234ABC', 'Toyota', 'Corolla', 1600, 132, 30.00, '2022-05-15', 'turismo'),
('5678DEF', 'Ford', 'Transit', 2500, 140, 50.00, '2021-08-20', 'furgoneta'),
('9012GHI', 'Renault', 'Clio', 1200, 90, 28.00, '2023-01-10', 'turismo'),
('3456JKL', 'Mercedes', 'Sprinter', 2200, 150, 55.00, '2022-11-05', 'furgoneta');

INSERT INTO Turismo (matricula, num_puertas, tipo)
VALUES 
('1234ABC', 5, 'compacto'),
('9012GHI', 3, 'hatchback');

INSERT INTO Furgoneta (matricula, metros_cubicos, carga_max_kg)
VALUES 
('5678DEF', 8.5, 1200),
('3456JKL', 10.0, 1500);

INSERT INTO Cliente (dni, cod_cliente, nombre, apellidos, direccion, localidad, telefono, email)
VALUES
('11111111A', 'C001', 'Ana', 'Ruiz Pérez', 'Calle Falsa 123', 'Madrid', '600111222', 'ana@example.com'),
('22222222B', 'C002', 'Luis', 'García López', 'Av. Siempre Viva 456', 'Barcelona', '600333444', 'luis@example.com'),
('33333333C', 'C003', 'Marta', 'Sánchez Díaz', 'Plaza Mayor 7', 'Sevilla', '600555666', 'marta@example.com');


INSERT INTO Alquiler (fecha_inicio, dias, matricula, dni_cliente)
VALUES
('2025-12-01', 5, '1234ABC', '11111111A'),
('2025-12-02', 3, '5678DEF', '22222222B'),
('2025-12-03', 7, '9012GHI', '33333333C');


INSERT INTO Pieza (nombre, precio_compra)
VALUES
('Filtro aceite', 15.00),
('Pastillas freno', 40.00),
('Aceite motor', 25.50),
('Bateria', 80.00);


INSERT INTO Reparacion (fecha, descripcion, matricula)
VALUES
('2025-11-15', 'Cambio de aceite y filtro', '1234ABC'),
('2025-11-18', 'Sustitución de pastillas de freno', '9012GHI'),
('2025-11-20', 'Revisión general', '5678DEF');


INSERT INTO Reparacion_Pieza (id_reparacion, cod_pieza, unidades)
VALUES
(1, 1, 1),  -- Filtro aceite
(1, 3, 5),  -- Aceite motor
(2, 2, 4),  -- Pastillas freno
(3, 4, 1);  -- Batería

---------------------------------------------------------------------------------------------
-- Consultas de ejemplo sin filtros                                                        --
---------------------------------------------------------------------------------------------

-- Listar todos los vehículos
SELECT * FROM Vehiculo;

-- Listar todos los clientes
SELECT * FROM Cliente;

-- Listar todos los alquileres con información del cliente y del vehículo
SELECT a.id_alquiler, a.fecha_inicio, a.dias,
       v.marca, v.modelo, v.tipo_vehiculo,
       c.nombre, c.apellidos
FROM Alquiler a
JOIN Vehiculo v ON a.matricula = v.matricula
JOIN Cliente c ON a.dni_cliente = c.dni;

-- Listar todas las reparaciones con las piezas utilizadas
SELECT r.id_reparacion, r.fecha, r.descripcion, r.matricula,
       p.nombre AS pieza, rp.unidades
FROM Reparacion r
JOIN Reparacion_Pieza rp ON r.id_reparacion = rp.id_reparacion
JOIN Pieza p ON rp.cod_pieza = p.cod_pieza;


---------------------------------------------------------------------------------------------
--                  Consultas de ejemplo con filtros                                       --
---------------------------------------------------------------------------------------------


-- Vehículos tipo turismo
SELECT * FROM Vehiculo WHERE tipo_vehiculo = 'turismo';

-- Alquileres de un cliente concreto
SELECT * FROM Alquiler WHERE dni_cliente = '11111111A';

-- Reparaciones realizadas a un vehículo específico
SELECT * FROM Reparacion WHERE matricula = '1234ABC';

-- Piezas que cuestan más de 30€
SELECT * FROM Pieza WHERE precio_compra > 30;
