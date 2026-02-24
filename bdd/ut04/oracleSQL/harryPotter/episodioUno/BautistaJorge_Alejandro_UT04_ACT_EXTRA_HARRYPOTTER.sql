/* =========================================================
   HOGWARTS - 40 EJERCICIOS (ENUNCIADOS EN .SQL)
   - Completa cada consulta debajo de su enunciado.
   Tablas: house, person, course, enrollment, house_points

    =>ALUMNO: Alejandro Bautista Jorges
    =>CURSO: 2025-2026

   ========================================================= */

------------------------------------------------------------
-- NIVEL 1 — SELECT, WHERE, ORDER BY, LIKE, BETWEEN, NULL
------------------------------------------------------------

-- Ejercicio 01: Mostrar todas las casas (todas las columnas) de la tabla HOUSE.
SELECT *
FROM house
;

-- Ejercicio 02: Mostrar name y wing de las casas ordenadas alfabéticamente por name.
SELECT name, wing
FROM house
ORDER BY name ASC
;

-- Ejercicio 03: Mostrar first_name, last_name y email de todas las personas, ordenadas por last_name.
SELECT first_name, last_name, email
FROM person
ORDER BY last_name ASC
;

-- Ejercicio 04: Mostrar todas las personas cuyo rol sea 'student'.
SELECT *
FROM person
WHERE rol = 'student'
;

-- Ejercicio 05: Mostrar todas las personas cuyo rol NO sea 'student'.
SELECT *
FROM person
WHERE rol <> 'student'
;

-- Ejercicio 06: Mostrar los estudiantes de la casa Gryffindor (house_id = 1), ordenados por apellido y nombre.
SELECT *
FROM person
WHERE rol = 'student'
  AND house_id = 1
ORDER BY last_name ASC, first_name ASC
;

-- Ejercicio 07: Mostrar personas cuyo apellido empiece por 'B'.
SELECT *
FROM person
WHERE last_name LIKE 'B%'
;

-- Ejercicio 08: Mostrar personas cuyo email contenga 'hogwarts.com'.
SELECT *
FROM person
WHERE email LIKE '%hogwarts.com%'
;

-- Ejercicio 09: Mostrar personas cuyo id esté entre 20 y 40.
SELECT *
FROM person
WHERE id BETWEEN 20 AND 40
;

-- Ejercicio 10: Mostrar personas con house_id IS NULL.
SELECT *
FROM person
WHERE house_id IS NULL
;


------------------------------------------------------------
-- NIVEL 2 — ALIAS, CONCATENACIÓN Y FUNCIONES DE TEXTO
------------------------------------------------------------

-- Ejercicio 11: Mostrar first_name como NOMBRE y last_name como APELLIDO.
SELECT first_name AS nombre,
       last_name  AS apellido
FROM person
;

-- Ejercicio 12: Mostrar un campo NOMBRE_COMPLETO concatenando first_name + ' ' + last_name.
SELECT first_name || ' ' || last_name AS nombre_completo
FROM person
;

-- Ejercicio 13: Mostrar first_name en minúsculas y last_name en mayúsculas con alias claros.
SELECT LOWER(first_name) AS nombre_minusculas,
       UPPER(last_name)  AS apellido_mayusculas
FROM person
;

-- Ejercicio 14: Mostrar first_name y la longitud del nombre. Ordenar por longitud de mayor a menor.
SELECT first_name,
       LENGTH(first_name) AS longitud_nombre
FROM person
ORDER BY longitud_nombre DESC
;

-- Ejercicio 15: Mostrar last_name y sus 3 primeras letras con alias INICIAL3.
SELECT last_name,
       SUBSTR(last_name, 1, 3) AS inicial3
FROM person
;

-- Ejercicio 16: Mostrar email en mayúsculas y ordenar por ese email.
SELECT UPPER(email) AS email_mayusculas
FROM person
ORDER BY email_mayusculas ASC
;

-- Ejercicio 17: Mostrar personas cuyo nombre tenga 4 letras.
SELECT *
FROM person
WHERE LENGTH(first_name) = 4
;

-- Ejercicio 18: Mostrar personas cuyo apellido contenga un guion '-'.
SELECT *
FROM person
WHERE last_name LIKE '%-%'
;


------------------------------------------------------------
-- NIVEL 3 — AGREGADAS, GROUP BY, HAVING
------------------------------------------------------------

-- Ejercicio 19: Contar cuántas personas hay en total.
SELECT COUNT(*) AS total_personas
FROM person
;

-- Ejercicio 20: Contar cuántas personas hay por rol.
SELECT rol,
       COUNT(*) AS total
FROM person
GROUP BY rol
ORDER BY total DESC
;

-- Ejercicio 21: Contar cuántas personas hay por casa.
SELECT house_id,
       COUNT(*) AS total
FROM person
GROUP BY house_id
ORDER BY house_id ASC
;

-- Ejercicio 22: Contar cuántos estudiantes hay por casa.
SELECT house_id,
       COUNT(*) AS total_estudiantes
FROM person
WHERE rol = 'student'
GROUP BY house_id
ORDER BY house_id ASC
;