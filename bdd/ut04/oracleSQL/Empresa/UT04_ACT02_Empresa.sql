--Ut04 Act 02 Empresa (27/01/2026)
--Creacion de tablas
CREATE TABLE departamento (
    dept_no NUMBER(2) PRIMARY KEY,
    dNombre VARCHAR2(50) NOT NULL,
    loc VARCHAR2(10) NOT NULL
);
CREATE TABLE empleado(
    emp_no NUMBER(4) PRIMARY KEY,
    apellido VARCHAR2(15) NOT NULL,
    oficio VARCHAR2(15) NOT NULL,
    dir NUMBER(4),
    fecha_alt DATE NOT NULL,
    salario NUMBER(7) NOT NULL,
    comision NUMBER(4),
    dept_no NUMBER(2) NOT NULL,
    CONSTRAINT dept_no_fk
    FOREIGN KEY (dept_no) REFERENCES departamento (dept_no)
);
--Insercion de datos en departamento
INSERT INTO departamento (dept_no,dnombre,loc) VALUES (10, 'CONTABILIDAD', 'SEVILLA');
INSERT INTO departamento (dept_no,dnombre,loc) VALUES (20, 'INVESTIGACION', 'MADRID');
INSERT INTO departamento (dept_no,dnombre,loc) VALUES (30, 'VENTAS', 'BARCELONA');
INSERT INTO departamento (dept_no,dnombre,loc) VALUES (40, 'PRODUCCION', 'BILBAO');
COMMIT;
--Insercion de datos en empleado
INSERT INTO empleado (emp_no,apellido,oficio,dir,fecha_alt,salario,comision,dept_no) VALUES
(7839,'REY','PRESIDENTE',NULL,TO_DATE('17/11/1981','DD/MM/YYYY'),6500,NULL,10);
INSERT INTO empleado (emp_no,apellido,oficio,dir,fecha_alt,salario,comision,dept_no) VALUES
(7566,'JIMENEZ','DIRECTOR',7839,TO_DATE('02/04/1981','DD/MM/YYYY'),3867,NULL,20);
INSERT INTO empleado (emp_no,apellido,oficio,dir,fecha_alt,salario,comision,dept_no) VALUES
(7698,'NEGRO','DIRECTOR',7839,TO_DATE('01/05/1981','DD/MM/YYYY'),3705,NULL,30);
INSERT INTO empleado (emp_no,apellido,oficio,dir,fecha_alt,salario,comision,dept_no) VALUES
(7902,'FERNANDEZ','ANALISTA',7566,TO_DATE('03/12/1981','DD/MM/YYYY'),3900,NULL,20);
INSERT INTO empleado (emp_no,apellido,oficio,dir,fecha_alt,salario,comision,dept_no) VALUES
(7499,'ARROYO','VENDEDOR',7698,TO_DATE('20/02/1980','DD/MM/YYYY'),2080,390,30);
INSERT INTO empleado (emp_no,apellido,oficio,dir,fecha_alt,salario,comision,dept_no) VALUES
(7521,'SALA','VENDEDOR',7698,TO_DATE('22/02/1981','DD/MM/YYYY'),1625,1625,30);
INSERT INTO empleado (emp_no,apellido,oficio,dir,fecha_alt,salario,comision,dept_no) VALUES
(7654,'MARTIN','VENDEDOR',7698,TO_DATE('28/09/1981','DD/MM/YYYY'),1625,1820,30);
INSERT INTO empleado (emp_no,apellido,oficio,dir,fecha_alt,salario,comision,dept_no) VALUES
(7844,'TOVAR','VENDEDOR',7698,TO_DATE('08/09/1981','DD/MM/YYYY'),1950,0,30);
INSERT INTO empleado (emp_no,apellido,oficio,dir,fecha_alt,salario,comision,dept_no) VALUES
(7900,'JIMENO','EMPLEADO',7698,TO_DATE('23/09/1981','DD/MM/YYYY'),12350,NULL,30);
INSERT INTO empleado  (emp_no,apellido,oficio,dir,fecha_alt,salario,comision,dept_no) VALUES
(7369,'SANCHEZ','EMPLEADO',7902,TO_DATE('17/12/1980','DD/MM/YYYY'),1040,NULL,20);
INSERT INTO empleado (emp_no,apellido,oficio,dir,fecha_alt,salario,comision,dept_no) VALUES
(7788,'GIL','ANALISTA',7566,TO_DATE('09/11/1981','DD/MM/YYYY'),3900,NULL,20);
INSERT INTO empleado (emp_no,apellido,oficio,dir,fecha_alt,salario,comision,dept_no) VALUES
(7876,'ALONSO','EMPLEADO',7788,TO_DATE('23/09/1981','DD/MM/YYYY'),1430,NULL,20);
INSERT INTO empleado (emp_no,apellido,oficio,dir,fecha_alt,salario,comision,dept_no) VALUES
(7934,'MU�OZ','EMPLEADO',7788,TO_DATE('23/01/1982','DD/MM/YYYY'),3900,NULL,10);
COMMIT;
--Creacion de consultas
CREATE VIEW departamentosEmpresa AS 
SELECT * FROM departamento;
CREATE VIEW empleadosEmpresa AS
SELECT * FROM empleado;
COMMIT;