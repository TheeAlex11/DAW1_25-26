-- ============================================================
-- 1.3.1. FUNCIONES SQL
-- ============================================================

-- EJERCICIO 1
-- Mostrar el apellido de cada empleado en mayusculas
SELECT UPPER(apellido) AS apellido_mayus
FROM empleado;

-- EJERCICIO 2
-- Mostrar el apellido y el numero de caracteres que tiene
SELECT apellido,
       LENGTH(apellido) AS num_caracteres
FROM empleado;

-- EJERCICIO 3
-- Mostrar el apellido y el salario redondeado a dos decimales
SELECT apellido,
       ROUND(salario, 2) AS salario_redondeado
FROM empleado;

-- EJERCICIO 4
-- Mostrar el apellido y el anio de contratacion del empleado
SELECT apellido,
       EXTRACT(YEAR FROM fecha_alt) AS anio_contratacion
FROM empleado;

-- EJERCICIO 5
-- Mostrar el apellido y la fecha de contratacion con formato DD/MM/YYYY
SELECT apellido,
       TO_CHAR(fecha_alt, 'DD/MM/YYYY') AS fecha_contratacion
FROM empleado;


-- ============================================================
-- 1.3.2. FUNCIONES DE GRUPO (Sin GROUP BY)
-- ============================================================

-- EJERCICIO 6
-- Mostrar el salario maximo, minimo y salario medio de todos los empleados
SELECT MAX(salario) AS salario_max,
       MIN(salario) AS salario_min,
       ROUND(AVG(salario), 2) AS salario_medio
FROM empleado;

-- EJERCICIO 7
-- Mostrar el numero total de empleados de la empresa
SELECT COUNT(*) AS total_empleados
FROM empleado;

-- EJERCICIO 8
-- Mostrar el numero de empleados que tienen comision
SELECT COUNT(comision) AS empleados_con_comision
FROM empleado;

-- EJERCICIO 9
-- Mostrar la suma total de los salarios
SELECT SUM(salario) AS suma_total_salarios
FROM empleado;

-- EJERCICIO 10
-- Mostrar el salario medio de los empleados del departamento 20
SELECT ROUND(AVG(salario), 2) AS salario_medio_dept20
FROM empleado
WHERE dept_no = 20;


-- ============================================================
-- 1.3.3. AGRUPACIONES (GROUP BY)
-- ============================================================

-- EJERCICIO 11
-- Mostrar el salario medio de cada departamento
SELECT dept_no,
       ROUND(AVG(salario), 2) AS salario_medio
FROM empleado
GROUP BY dept_no
ORDER BY dept_no;

-- EJERCICIO 12
-- Mostrar el numero de empleados de cada departamento
SELECT dept_no,
       COUNT(*) AS num_empleados
FROM empleado
GROUP BY dept_no
ORDER BY dept_no;

-- EJERCICIO 13
-- Mostrar el salario maximo por cada oficio
SELECT oficio,
       MAX(salario) AS salario_max
FROM empleado
GROUP BY oficio
ORDER BY oficio;

-- EJERCICIO 14
-- Mostrar el numero de empleados por oficio
SELECT oficio,
       COUNT(*) AS num_empleados
FROM empleado
GROUP BY oficio
ORDER BY oficio;

-- EJERCICIO 15
-- Mostrar el salario medio por oficio
SELECT oficio,
       ROUND(AVG(salario), 2) AS salario_medio
FROM empleado
GROUP BY oficio
ORDER BY oficio;


-- ============================================================
-- 1.3.4. HAVING (Filtrado de grupos)
-- ============================================================

-- EJERCICIO 16
-- Mostrar los departamentos cuyo salario medio sea superior a 2000
SELECT dept_no,
       ROUND(AVG(salario), 2) AS salario_medio
FROM empleado
GROUP BY dept_no
HAVING AVG(salario) > 2000
ORDER BY dept_no;

-- EJERCICIO 17
-- Mostrar los oficios que tengan mas de 2 empleados
SELECT oficio,
       COUNT(*) AS num_empleados
FROM empleado
GROUP BY oficio
HAVING COUNT(*) > 2
ORDER BY oficio;

-- EJERCICIO 18
-- Mostrar los departamentos con mas de 3 empleados
SELECT dept_no,
       COUNT(*) AS num_empleados
FROM empleado
GROUP BY dept_no
HAVING COUNT(*) > 3
ORDER BY dept_no;

-- EJERCICIO 19
-- Mostrar los oficios cuyo salario medio sea superior a 2500
SELECT oficio,
       ROUND(AVG(salario), 2) AS salario_medio
FROM empleado
GROUP BY oficio
HAVING AVG(salario) > 2500
ORDER BY oficio;

-- EJERCICIO 20
-- Mostrar los departamentos cuyo salario total supere los 10000
SELECT dept_no,
       SUM(salario) AS salario_total
FROM empleado
GROUP BY dept_no
HAVING SUM(salario) > 10000
ORDER BY dept_no;


-- ============================================================
-- 1.3.5. ASOCIACION DE TABLAS (JOIN)
-- ============================================================

-- EJERCICIO 21
-- Mostrar el apellido del empleado y el nombre de su departamento
SELECT e.apellido,
       d.dnombre AS departamento
FROM empleado e
JOIN departamento d ON e.dept_no = d.dept_no
ORDER BY d.dnombre, e.apellido;

-- EJERCICIO 22
-- Mostrar el nombre del departamento y el salario medio de sus empleados
SELECT d.dnombre AS departamento,
       ROUND(AVG(e.salario), 2) AS salario_medio
FROM empleado e
JOIN departamento d ON e.dept_no = d.dept_no
GROUP BY d.dnombre
ORDER BY d.dnombre;

-- EJERCICIO 23
-- Mostrar el nombre del departamento y el numero de empleados que tiene
SELECT d.dnombre AS departamento,
       COUNT(e.emp_no) AS num_empleados
FROM empleado e
JOIN departamento d ON e.dept_no = d.dept_no
GROUP BY d.dnombre
ORDER BY d.dnombre;

-- EJERCICIO 24
-- Mostrar el nombre del departamento con mayor salario medio
SELECT d.dnombre AS departamento,
       ROUND(AVG(e.salario), 2) AS salario_medio
FROM empleado e
JOIN departamento d ON e.dept_no = d.dept_no
GROUP BY d.dnombre
HAVING AVG(e.salario) = (
    SELECT MAX(AVG(salario))
    FROM empleado
    GROUP BY dept_no
);

-- EJERCICIO 25
-- Mostrar el nombre del departamento y el empleado que mas cobra en cada uno
SELECT d.dnombre AS departamento,
       e.apellido,
       e.salario
FROM empleado e
JOIN departamento d ON e.dept_no = d.dept_no
WHERE e.salario = (
    SELECT MAX(salario)
    FROM empleado e2
    WHERE e2.dept_no = e.dept_no
)
ORDER BY d.dnombre;