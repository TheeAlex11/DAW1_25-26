-- ============================================================================
-- EJERCICIO 3: SUCURSAL BANCARIA
-- ============================================================================

-- Modelo relacional
--
-- CLIENTE(Codigo_cliente PK, Nombre, Apellidos, DNI, Direccion, Telefono)
-- CUENTA(Numero_cuenta PK, Codigo_cliente FK, Tipo_cuenta, Saldo, Fecha_apertura)
-- TRANSACCION(Codigo_transaccion PK, Numero_cuenta FK, Tipo_transaccion, Importe, Fecha_transaccion, Concepto)

-----------------------------------------------------------------------------------------
-- SQL
-----------------------------------------------------------------------------------------

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
    -- FK Codigo_cliente:
    -- ON DELETE RESTRICT: No se puede eliminar un cliente si tiene cuentas activas
    --                     (protege el patrimonio y evita pérdida de información financiera)
    -- ON UPDATE CASCADE: Si cambia el código del cliente, se actualiza automáticamente
    --                    en todas sus cuentas
    FOREIGN KEY (Codigo_cliente) REFERENCES CLIENTE(Codigo_cliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Tabla TRANSACCION
CREATE TABLE TRANSACCION (
    Codigo_transaccion INT PRIMARY KEY,
    Numero_cuenta VARCHAR(20),
    Tipo_transaccion VARCHAR(20),
    Importe DECIMAL(12,2),
    Fecha_transaccion DATETIME,
    Concepto VARCHAR(100),
    -- FK Numero_cuenta:
    -- ON DELETE CASCADE: Si se elimina una cuenta, se eliminan automáticamente todas
    --                    sus transacciones (las transacciones no tienen sentido sin cuenta)
    -- ON UPDATE CASCADE: Si cambia el número de cuenta, se actualiza automáticamente
    --                    en todas sus transacciones
    FOREIGN KEY (Numero_cuenta) REFERENCES CUENTA(Numero_cuenta)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);