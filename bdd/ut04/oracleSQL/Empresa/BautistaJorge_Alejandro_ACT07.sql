-- ============================================================
-- BLOQUE A -- FUNCIONES Y AGRUPACIONES CON HAVING (5 consultas)
-- ============================================================

-- CONSULTA 01 (HAVING)
-- Mostrar el número de departamento y el salario medio de cada departamento,
-- mostrando solo aquellos cuyo salario medio sea superior a 2500.
SELECT
    dept_no,
    ROUND(AVG(salario), 2) AS salario_medio
FROM
    empleado
GROUP BY
    dept_no
HAVING
    AVG(salario) > 2500;


-- CONSULTA 02 (HAVING)
-- Mostrar los oficios que tienen más de 1 empleado asignado,
-- junto con el número total de empleados en ese oficio.
SELECT
    oficio,
    COUNT(emp_no) AS num_empleados
FROM
    empleado
GROUP BY
    oficio
HAVING
    COUNT(emp_no) > 1;


-- CONSULTA 03 (HAVING)
-- Mostrar los departamentos cuya suma total de salarios supere 5000,
-- indicando el total acumulado de salarios.
SELECT
    dept_no,
    SUM(salario) AS salario_total
FROM
    empleado
GROUP BY
    dept_no
HAVING
    SUM(salario) > 5000;


-- CONSULTA 04 (HAVING)
-- Mostrar los oficios cuyo salario máximo sea superior al salario mínimo
-- del conjunto de todos los empleados multiplicado por 3,
-- es decir, oficios con empleados muy bien pagados.
SELECT
    oficio,
    MAX(salario) AS salario_maximo,
    MIN(salario) AS salario_minimo
FROM
    empleado
GROUP BY
    oficio
HAVING
    MAX(salario) > 3 * MIN(salario);


-- CONSULTA 05 (HAVING)
-- Mostrar los departamentos que tienen más de 2 empleados,
-- junto con la suma total de comisiones de ese departamento.
-- Se usa NVL para tratar los valores NULL de comision como 0.
SELECT
    dept_no,
    COUNT(emp_no)       AS num_empleados,
    SUM(NVL(comision, 0)) AS total_comisiones
FROM
    empleado
GROUP BY
    dept_no
HAVING
    COUNT(emp_no) > 2;


-- ============================================================
-- BLOQUE B -- ASOCIACIÓN DE TABLAS (JOIN) (5 consultas)
-- ============================================================

-- CONSULTA 06 (JOIN)
-- Mostrar el apellido de cada empleado junto con el nombre
-- y la localización del departamento al que pertenece.
SELECT
    e.apellido,
    e.oficio,
    d.dnombre   AS departamento,
    d.loc       AS localidad
FROM
    empleado e
    INNER JOIN departamento d ON e.dept_no = d.dept_no;


-- CONSULTA 07 (JOIN)
-- Mostrar los empleados que trabajan en la ciudad de MADRID,
-- incluyendo su apellido, oficio y salario.
SELECT
    e.apellido,
    e.oficio,
    e.salario,
    d.loc       AS localidad
FROM
    empleado e
    INNER JOIN departamento d ON e.dept_no = d.dept_no
WHERE
    d.loc = 'MADRID';


-- CONSULTA 08 (JOIN)
-- Mostrar los empleados que son VENDEDOR junto con el nombre
-- del departamento, ordenados por salario descendente.
SELECT
    e.apellido,
    e.oficio,
    e.salario,
    e.comision,
    d.dnombre   AS departamento
FROM
    empleado e
    INNER JOIN departamento d ON e.dept_no = d.dept_no
WHERE
    e.oficio = 'VENDEDOR'
ORDER BY
    e.salario DESC;


-- CONSULTA 09 (JOIN + FUNCIONES DE GRUPO)
-- Mostrar el nombre de cada departamento junto con el número
-- de empleados que tiene y su salario medio, ordenado por
-- número de empleados de mayor a menor.
SELECT
    d.dnombre           AS departamento,
    COUNT(e.emp_no)     AS num_empleados,
    ROUND(AVG(e.salario), 2) AS salario_medio
FROM
    empleado e
    INNER JOIN departamento d ON e.dept_no = d.dept_no
GROUP BY
    d.dnombre
ORDER BY
    num_empleados DESC;


-- CONSULTA 10 (JOIN + FUNCIONES DE GRUPO)
-- Mostrar el nombre del departamento y la localidad de aquellos
-- departamentos cuyo salario total de sus empleados supere 6000,
-- incluyendo también el salario máximo y mínimo del departamento.
SELECT
    d.dnombre               AS departamento,
    d.loc                   AS localidad,
    SUM(e.salario)          AS salario_total,
    MAX(e.salario)          AS salario_maximo,
    MIN(e.salario)          AS salario_minimo
FROM
    empleado e
    INNER JOIN departamento d ON e.dept_no = d.dept_no
GROUP BY
    d.dnombre,
    d.loc
HAVING
    SUM(e.salario) > 6000;