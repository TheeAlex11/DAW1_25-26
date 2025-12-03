
-- ============================================================================
-- EJERCICIO 3: SUCURSAL BANCARIA
-- ============================================================================

-- Tabla CLIENTE
CREATE TABLE CLIENTE (
    Codigo_cliente INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    DNI VARCHAR(10) UNIQUE,
    Direccion VARCHAR(100),
    Telefono VARCHAR(15)
);

-- Tabla CUENTA
CREATE TABLE CUENTA (
    Numero_cuenta VARCHAR(20) PRIMARY KEY,
    Codigo_cliente INT,
    Tipo_cuenta VARCHAR(20),
    Saldo DECIMAL(12,2),
    Fecha_apertura DATE,
    FOREIGN KEY (Codigo_cliente) REFERENCES CLIENTE(Codigo_cliente)
);

-- Tabla TRANSACCION
CREATE TABLE TRANSACCION (
    Codigo_transaccion INT PRIMARY KEY,
    Numero_cuenta VARCHAR(20),
    Tipo_transaccion VARCHAR(20),
    Importe DECIMAL(12,2),
    Fecha_transaccion DATETIME,
    Concepto VARCHAR(100),
    FOREIGN KEY (Numero_cuenta) REFERENCES CUENTA(Numero_cuenta)
);

