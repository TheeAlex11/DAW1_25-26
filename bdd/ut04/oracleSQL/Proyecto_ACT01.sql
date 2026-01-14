CREATE TABLE empleados (
    id_empleado NUMBER(5),
    nombre VARCHAR2(50),
    apellido VARCHAR2(50),
    dni CHAR(9),
    edad NUMBER(3),
    salario NUMBER(10,2),
    activo CHAR(1),
    fecha_alta DATE
);

INSERT INTO empleados VALUES
(1,'Ana','Martínez','12345678A',30,1850.50,'S',DATE '2024-10-15');

INSERT INTO empleados VALUES
(2,'Luis','Gómez','87654321B',45,2300,'N',DATE '2023-03-10');


