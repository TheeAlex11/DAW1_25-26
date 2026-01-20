CREATE TABLE sucursal (
    numSuc CHAR(4) PRIMARY KEY,
    ciudad VARCHAR2(50),
    activo CHAR(1)
);

CREATE TABLE cliente (
    dni CHAR(9) PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    direccion VARCHAR2(100),
    ciudad VARCHAR2(50)
);

CREATE TABLE cuenta (
    numCuenta CHAR(10) PRIMARY KEY,
    saldo NUMBER(12,2)
);

CREATE TABLE transaccion (
    numTran NUMBER PRIMARY KEY,
    fecha DATE,
    tipoOp VARCHAR2(20),
    cantidad NUMBER(12,2),
    numCuenta CHAR(10),
    CONSTRAINT fk_transaccion_cuenta
        FOREIGN KEY (numCuenta)
        REFERENCES cuenta(numCuenta)
        ON DELETE CASCADE
);

CREATE TABLE abrir_en (
    numSuc CHAR(4),
    dni CHAR(9),
    numCuenta CHAR(10),
    CONSTRAINT pk_abrir_en
        PRIMARY KEY (numSuc, dni, numCuenta),
    CONSTRAINT fk_abrir_sucursal
        FOREIGN KEY (numSuc)
        REFERENCES sucursal(numSuc),
    CONSTRAINT fk_abrir_cliente
        FOREIGN KEY (dni)
        REFERENCES cliente(dni),
    CONSTRAINT fk_abrir_cuenta
        FOREIGN KEY (numCuenta)
        REFERENCES cuenta(numCuenta)
        ON DELETE CASCADE
);

-- Inserts para tabla sucursal
INSERT INTO sucursal (numSuc, ciudad, activo) VALUES ('S001', 'Madrid', 'S');
INSERT INTO sucursal (numSuc, ciudad, activo) VALUES ('S002', 'Barcelona', 'S');
INSERT INTO sucursal (numSuc, ciudad, activo) VALUES ('S003', 'Valencia', 'S');
INSERT INTO sucursal (numSuc, ciudad, activo) VALUES ('S004', 'Sevilla', 'S');
INSERT INTO sucursal (numSuc, ciudad, activo) VALUES ('S005', 'Bilbao', 'N');

-- Inserts para tabla cliente
INSERT INTO cliente (dni, nombre, direccion, ciudad) VALUES ('12345678A', 'Juan Perez', 'Calle Mayor 1, Madrid', 'Madrid');
INSERT INTO cliente (dni, nombre, direccion, ciudad) VALUES ('23456789B', 'Ana Gomez', 'Calle Luna 5, Barcelona', 'Barcelona');
INSERT INTO cliente (dni, nombre, direccion, ciudad) VALUES ('34567890C', 'Luis Martinez', 'Av. del Sol 12, Valencia', 'Valencia');
INSERT INTO cliente (dni, nombre, direccion, ciudad) VALUES ('45678901D', 'Sofia Ramirez', 'Calle Verde 3, Sevilla', 'Sevilla');
INSERT INTO cliente (dni, nombre, direccion, ciudad) VALUES ('56789012E', 'Carlos Torres', 'Plaza Azul 7, Bilbao', 'Bilbao');

-- Inserts para tabla cuenta
INSERT INTO cuenta (numCuenta, saldo) VALUES ('CU00000001', 1500.00);
INSERT INTO cuenta (numCuenta, saldo) VALUES ('CU00000002', 2500.50);
INSERT INTO cuenta (numCuenta, saldo) VALUES ('CU00000003', 3200.75);
INSERT INTO cuenta (numCuenta, saldo) VALUES ('CU00000004', 1200.00);
INSERT INTO cuenta (numCuenta, saldo) VALUES ('CU00000005', 5000.25);

-- Inserts para tabla abrir_en
INSERT INTO abrir_en (numSuc, dni, numCuenta) VALUES ('S001', '12345678A', 'CU00000001');
INSERT INTO abrir_en (numSuc, dni, numCuenta) VALUES ('S002', '23456789B', 'CU00000002');
INSERT INTO abrir_en (numSuc, dni, numCuenta) VALUES ('S003', '34567890C', 'CU00000003');
INSERT INTO abrir_en (numSuc, dni, numCuenta) VALUES ('S004', '45678901D', 'CU00000004');
INSERT INTO abrir_en (numSuc, dni, numCuenta) VALUES ('S005', '56789012E', 'CU00000005');

-- Inserts para tabla transaccion
INSERT INTO transaccion (numTran, fecha, tipoOp, cantidad, numCuenta) VALUES (1, TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'Ingreso', 500.00, 'CU00000001');
INSERT INTO transaccion (numTran, fecha, tipoOp, cantidad, numCuenta) VALUES (2, TO_DATE('2026-01-02', 'YYYY-MM-DD'), 'Retiro', 200.00, 'CU00000002');
INSERT INTO transaccion (numTran, fecha, tipoOp, cantidad, numCuenta) VALUES (3, TO_DATE('2026-01-03', 'YYYY-MM-DD'), 'Ingreso', 800.00, 'CU00000003');
INSERT INTO transaccion (numTran, fecha, tipoOp, cantidad, numCuenta) VALUES (4, TO_DATE('2026-01-04', 'YYYY-MM-DD'), 'Retiro', 300.00, 'CU00000004');
INSERT INTO transaccion (numTran, fecha, tipoOp, cantidad, numCuenta) VALUES (5, TO_DATE('2026-01-05', 'YYYY-MM-DD'), 'Ingreso', 1000.00, 'CU00000005');
