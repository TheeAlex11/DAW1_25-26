CREATE TABLE alumno (
 dniAlumno CHAR(9) PRIMARY KEY,
 nombre VARCHAR2(50) NOT NULL,
 edad NUMBER(3) NOT NULL,
 email VARCHAR2(100)
);

CREATE TABLE profesor (
 dniProfesor CHAR(9) PRIMARY KEY,
 nombre VARCHAR2(50) NOT NULL,
 direccion VARCHAR2(100),
 telefono VARCHAR2(15)
);

CREATE TABLE coche (
 matricula VARCHAR2(10) PRIMARY KEY,
 color VARCHAR2(20),
 anyCompra NUMBER(4),
 dniAlumno CHAR(9),
 CONSTRAINT fk_coche_alumno
 FOREIGN KEY (dniAlumno) REFERENCES alumno(dniAlumno)
);

CREATE TABLE ensena (
 dniAlumno CHAR(9),
 dniProfesor CHAR(9),
 CONSTRAINT pk_ensena PRIMARY KEY (dniAlumno, dniProfesor),
 CONSTRAINT fk_ensena_alumno
 FOREIGN KEY (dniAlumno) REFERENCES alumno(dniAlumno),
 CONSTRAINT fk_ensena_profesor
 FOREIGN KEY (dniProfesor) REFERENCES profesor(dniProfesor)
);

-- Inserts para tabla alumno
INSERT INTO alumno (dniAlumno, nombre, edad, email) VALUES 
('12345678A', 'Juan Perez', 25, 'juan.perez@example.com'),
('23456789B', 'Ana Gomez', 22, 'ana.gomez@example.com'),
('34567890C', 'Luis Martinez', 28, 'luis.martinez@example.com'),
('45678901D', 'Sofia Ramirez', 24, 'sofia.ramirez@example.com'),
('56789012E', 'Carlos Torres', 27, 'carlos.torres@example.com');

-- Inserts para tabla profesor
INSERT INTO profesor (dniProfesor, nombre, direccion, telefono) VALUES 
('87654321B', 'Maria Lopez', 'Calle Falsa 123', '600123456'),
('98765432C', 'Pedro Sanchez', 'Avenida Real 45', '600234567'),
('76543210D', 'Lucia Fernandez', 'Plaza Mayor 12', '600345678'),
('65432109E', 'Javier Molina', 'Calle Luna 7', '600456789'),
('54321098F', 'Marta Ruiz', 'Camino Verde 21', '600567890');

-- Inserts para tabla coche
INSERT INTO coche (matricula, color, anyCompra, dniAlumno) VALUES 
('1234ABC', 'Rojo', 2020, '12345678A'),
('2345BCD', 'Azul', 2019, '23456789B'),
('3456CDE', 'Negro', 2021, '34567890C'),
('4567DEF', 'Blanco', 2018, '45678901D'),
('5678EFG', 'Gris', 2022, '56789012E');

-- Inserts para tabla ensena
INSERT INTO ensena (dniAlumno, dniProfesor) VALUES 
('12345678A', '87654321B'),
('23456789B', '98765432C'),
('34567890C', '76543210D'),
('45678901D', '65432109E'),
('56789012E', '54321098F');
