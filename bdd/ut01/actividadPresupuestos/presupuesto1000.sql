-- Creación de base de datos
CREATE DATABASE presupuesto1;
USE presupuesto1;

-- Tabla de empleados
CREATE TABLE Empleados (
    idEmpleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    puesto VARCHAR(50),
    salario DECIMAL(10,2),
    fechaContratacion DATE
);

INSERT INTO Empleados (nombre, puesto, salario, fechaContratacion) VALUES
('Ana López', 'Cajera', 1200.00, '2023-01-15'),
('Carlos Ruiz', 'Atención al Cliente', 1500.00, '2022-10-01'),
('María Torres', 'Gerente', 2000.00, '2021-05-10');

-- Tabla de inventario
CREATE TABLE Inventario (
    idProducto INT PRIMARY KEY AUTO_INCREMENT,
    nombreProducto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    cantidad INT,
    precioCoste DECIMAL(10,2),
    precioVenta DECIMAL(10,2)
);

INSERT INTO Inventario (nombreProducto, categoria, cantidad, precioCoste, precioVenta) VALUES
('Leche Entera 1L', 'Lácteos', 50, 0.80, 1.20),
('Pan Integral 500g', 'Panadería', 100, 0.50, 1.00),
('Arroz 1kg', 'Granos', 200, 0.90, 1.50),
('Aceite de Oliva 1L', 'Aceites', 40, 3.00, 5.00);

-- Tabla de clientes
CREATE TABLE Clientes (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20)
);

INSERT INTO Clientes (nombre, email, telefono) VALUES
('Luis Pérez', 'luis.perez@email.com', '600123456'),
('Marta Sánchez', 'marta.sanchez@email.com', '600654321');

-- Tabla de proveedores
CREATE TABLE Proveedores (
    idProveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(20)
);

INSERT INTO Proveedores (nombre, contacto, telefono) VALUES
('Distribuciones Alimenticias S.A.', 'Juan Romero', '911223344'),
('Frutas y Verduras Global', 'Laura Fernández', '912334455');

-- Tabla de gestión económica (ventas y compras)
CREATE TABLE GestionEconomica (
    idOperacion INT PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('VENTA','COMPRA') NOT NULL,
    fecha DATE,
    idProducto INT,
    cantidad INT,
    total DECIMAL(10,2),
    FOREIGN KEY (idProducto) REFERENCES Inventario(idProducto)
);

INSERT INTO GestionEconomica (tipo, fecha, idProducto, cantidad, total) VALUES
('VENTA', '2023-03-01', 1, 3, 3.60),
('VENTA', '2023-03-05', 2, 2, 2.00),
('COMPRA', '2023-03-10', 3, 100, 90.00);
