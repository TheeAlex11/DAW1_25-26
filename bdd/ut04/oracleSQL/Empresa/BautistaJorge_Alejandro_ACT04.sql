-------------------------------------------------------------
-- UT04 - ACTIVIDAD 04: Where, Select, Order By
-- Alumno: Alejandro Bautista Jorge
-- Fecha: 10/02/2026
-- Base de datos: EMPRESA (Oracle SQL)
-------------------------------------------------------------

-- Parte 1: CONSULTAS SIMPLES Y DE FILTRADO (5)

-- CONSULTA 01 (SIMPLE):
-- Mostrar apellido, oficio y salario de los empleados que trabajan en el departamento 30
SELECT apellido, oficio, salario
FROM empleado
WHERE dept_no = 30;

-- CONSULTA 02 (SIMPLE):
-- Mostrar empleados cuyo apellido comienza con 'M' o 'S'
SELECT emp_no, apellido, oficio, fecha_alt
FROM empleado
WHERE apellido LIKE 'M%' OR apellido LIKE 'S%';

-- CONSULTA 03 (SIMPLE):
-- Listar los empleados que tienen comisión y ganan entre 1500 y 2500
SELECT apellido, salario, comision, dept_no
FROM empleado
WHERE comision IS NOT NULL 
AND salario BETWEEN 1500 AND 2500;

-- CONSULTA 04 (SIMPLE):
-- Mostrar departamentos que NO están en Madrid ni en Sevilla
SELECT DISTINCT dept_no, dnombre, loc
FROM departamento
WHERE loc NOT IN ('MADRID', 'SEVILLA');

-- CONSULTA 05 (SIMPLE):
-- Listar empleados sin director asignado (presidente de la empresa)
SELECT emp_no AS "Número Empleado", 
       apellido AS "Apellido", 
       oficio AS "Cargo"
FROM empleado
WHERE dir IS NULL;

-- Parte 2: CONSULTAS CON SUBCONSULTAS (5)

-- CONSULTA 06 (SUBCONSULTA):
-- Mostrar datos de los empleados que ganan más que el salario promedio
SELECT apellido, oficio, salario, dept_no
FROM empleado
WHERE salario > (
    SELECT AVG(salario)
    FROM empleado
);

-- CONSULTA 07 (SUBCONSULTA):
-- Listar empleados que trabajan en el mismo departamento que 'FERNANDEZ'
SELECT apellido, oficio, dept_no
FROM empleado
WHERE dept_no = (
    SELECT dept_no
    FROM empleado
    WHERE apellido = 'FERNANDEZ'
)
AND apellido != 'FERNANDEZ';

-- CONSULTA 08 (SUBCONSULTA):
-- Mostrar el apellido y salario del empleado con el salario más bajo
SELECT apellido, salario, oficio, fecha_alt
FROM empleado
WHERE salario = (
    SELECT MIN(salario)
    FROM empleado
);

-- CONSULTA 09 (SUBCONSULTA):
-- Listar empleados que tienen un salario superior al de cualquier vendedor
SELECT apellido, oficio, salario
FROM empleado
WHERE salario > (
    SELECT MAX(salario)
    FROM empleado
    WHERE oficio = 'VENDEDOR'
);

-- CONSULTA 10 (SUBCONSULTA):
-- Mostrar departamentos que tienen al menos un empleado
SELECT dept_no, dnombre, loc
FROM departamento
WHERE dept_no IN (
    SELECT DISTINCT dept_no
    FROM empleado
);

-- Parte 3: CONSULTAS CON ORDENACIÓN (5)

-- CONSULTA 11 (ORDENACIÓN):
-- Listar todos los empleados ordenados por salario de mayor a menor
SELECT apellido, oficio, salario, dept_no
FROM empleado
ORDER BY salario DESC;

-- CONSULTA 12 (ORDENACIÓN):
-- Mostrar empleados ordenados por departamento (ascendente) y luego por apellido (ascendente)
SELECT dept_no, apellido, oficio, salario
FROM empleado
ORDER BY dept_no ASC, apellido ASC;

-- CONSULTA 13 (ORDENACIÓN):
-- Listar vendedores con comisión, ordenados por comisión descendente
SELECT apellido, salario, comision, 
       (salario + comision) AS "Salario Total"
FROM empleado
WHERE oficio = 'VENDEDOR' 
AND comision IS NOT NULL
ORDER BY comision DESC;

-- CONSULTA 14 (ORDENACIÓN):
-- Mostrar empleados contratados en 1981, ordenados por fecha de alta (más antiguos primero)
SELECT apellido, oficio, fecha_alt, dept_no
FROM empleado
WHERE fecha_alt >= TO_DATE('01/01/1981', 'DD/MM/YYYY')
AND fecha_alt <= TO_DATE('31/12/1981', 'DD/MM/YYYY')
ORDER BY fecha_alt ASC;

-- CONSULTA 15 (ORDENACIÓN):
-- Listar todos los departamentos ordenados alfabéticamente por nombre y luego por localización
SELECT dept_no, dnombre, loc
FROM departamento
ORDER BY dnombre ASC, loc ASC;