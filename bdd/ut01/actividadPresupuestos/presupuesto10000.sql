-- Creación de base de datos
CREATE DATABASE presupuesto2;
USE presupuesto2;

-- Tabla de tiendas
CREATE TABLE Tiendas (
    idTienda INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50),
    direccion VARCHAR(150)
);

INSERT INTO Tiendas (nombre, ciudad, direccion) VALUES
('Supermercado Central', 'Madrid', 'Calle Mayor 123'),
('Sucursal Norte', 'Barcelona', 'Avenida Diagonal 456'),
('Sucursal Sur', 'Sevilla', 'Calle Feria 789');

-- Tabla de departamentos
CREATE TABLE Departamentos (
    idDepartamento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

INSERT INTO Departamentos (nombre) VALUES
('Ventas'), ('Atención al Cliente'), ('Logística'), ('Administración');

-- Tabla de empleados
CREATE TABLE Empleados (
    idEmpleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(50),
    salario DECIMAL(10,2),
    fechaContratacion DATE,
    idTienda INT,
    idDepartamento INT,
    FOREIGN KEY (idTienda) REFERENCES Tiendas(idTienda),
    FOREIGN KEY (idDepartamento) REFERENCES Departamentos(idDepartamento)
);

INSERT INTO Empleados (nombre, puesto, salario, fechaContratacion, idTienda, idDepartamento) VALUES
('Ana López', 'Cajera', 1300.00, '2022-02-15', 1, 1),
('Carlos Ruiz', 'Atención al Cliente', 1600.00, '2021-10-01', 2, 2),
('María Torres', 'Gerente', 2500.00, '2020-05-10', 1, 4),
('Luis Gómez', 'Almacén', 1400.00, '2023-01-20', 3, 3);

-- Tabla de inventario (por tienda)
CREATE TABLE Inventario (
    idProducto INT PRIMARY KEY AUTO_INCREMENT,
    nombreProducto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    cantidad INT,
    precioCoste DECIMAL(10,2),
    precioVenta DECIMAL(10,2),
    idTienda INT,
    FOREIGN KEY (idTienda) REFERENCES Tiendas(idTienda)
);

INSERT INTO Inventario (nombreProducto, categoria, cantidad, precioCoste, precioVenta, idTienda) VALUES
('Leche Entera 1L', 'Lácteos', 50, 0.80, 1.20, 1),
('Pan Integral 500g', 'Panadería', 100, 0.50, 1.00, 2),
('Arroz 1kg', 'Granos', 200, 0.90, 1.50, 3);

-- Tabla de clientes
CREATE TABLE Clientes (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20)
);

INSERT INTO Clientes (nombre, email, telefono) VALUES
('Javier Martínez', 'javier.mtz@email.com', '600112233'),
('Laura Sánchez', 'laura.sanchez@email.com', '600998877');

-- Tabla de proveedores
CREATE TABLE Proveedores (
    idProveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(20)
);

INSERT INTO Proveedores (nombre, contacto, telefono) VALUES
('Distribuciones Alimenticias S.A.', 'Pedro Ramos', '913223344'),
('Frutas y Verduras Global', 'Carmen Díaz', '914556677');

-- Tabla de ventas
CREATE TABLE Ventas (
    idVenta INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    idCliente INT,
    idEmpleado INT,
    idProducto INT,
    cantidad INT,
    total DECIMAL(10,2),
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
    FOREIGN KEY (idEmpleado) REFERENCES Empleados(idEmpleado),
    FOREIGN KEY (idProducto) REFERENCES Inventario(idProducto)
);

INSERT INTO Ventas (fecha, idCliente, idEmpleado, idProducto, cantidad, total) VALUES
('2023-03-01', 1, 1, 1, 3, 3.60),
('2023-03-05', 2, 2, 2, 2, 2.00);

-- Tabla de compras
CREATE TABLE Compras (
    idCompra INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    idProveedor INT,
    idProducto INT,
    cantidad INT,
    total DECIMAL(10,2),
    FOREIGN KEY (idProveedor) REFERENCES Proveedores(idProveedor),
    FOREIGN KEY (idProducto) REFERENCES Inventario(idProducto)
);

INSERT INTO Compras (fecha, idProveedor, idProducto, cantidad, total) VALUES
('2023-02-20', 1, 3, 100, 90.00),
('2023-02-25', 2, 2, 200, 100.00);
