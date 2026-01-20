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
