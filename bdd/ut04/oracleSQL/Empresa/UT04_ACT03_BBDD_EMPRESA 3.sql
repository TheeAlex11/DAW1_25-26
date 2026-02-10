--__________________________________________________________________________________________
--IES CASTELAR, BADAJOZ
--Bases de Datos - DAW1
--__________________________________________________________________________________________
--ACTIVIDAD UT04_ACT03_BBDD_EMPRESA_3
/*El objetivo de esta actividad es que el alumnado practique la realización de consultas
 y modificaciones en SQL sobre la base de datos EMPRESA, aplicando las instrucciones y 
 funciones trabajadas en clase hasta el momento.*/
--__________________________________________________________________________________________
 --ALUMNO: Alejandro Bautista Jorge
 --FECHA: Miércoles 4 de febrero de 2026
--__________________________________________________________________________________________
--__________________________________________________________________________________________

-- TODO HA SIDO TESTEADO DESDE https://onecompiler.com/oracle/44cmtagju

--EJERCICIO 01: Mostrar el apellido en mayúsculas, el oficio en minúsculas y el salario de todos los empleados.

SELECT UPPER(apellido) AS apellido_mayusculas,
       LOWER(oficio) AS oficio_minusculas,
       salario
FROM empleado;

--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 02: Mostrar un “identificador” con el formato APELLIDO - OFICIO en una sola columna (alias: "Etiqueta").

SELECT apellido || '-' || oficio AS "Etiqueta"
FROM empleado;


--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 03: Mostrar el apellido de cada empleado y el número de letras que tiene el apellido indicado en una columna con el alias: "Longitud".

SELECT apellido,
       LENGTH(apellido) AS "Longitud"
FROM empleado;

--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 04: Mostrar el apellido de cada empleado y las 3 primeras letras del apellido (alias: "Iniciales").

SELECT apellido,
       SUBSTR(apellido, 1, 3) AS "Iniciales"
FROM empleado;

-- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 05: Mostrar los empleados cuyo apellido tenga 5 letras exactamente.

SELECT *
FROM empleado
WHERE LENGTH(apellido) = 5;
-- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 06: Mostrar los empleados cuyo apellido tenga más de 6 letras, ordenados por longitud (desc) y luego por apellido (asc).
SELECT apellido,
       LENGTH(apellido) AS LONGITUD
FROM empleado
WHERE LENGTH(apellido) > 6
ORDER BY LENGTH(apellido) DESC, apellido ASC;

--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 07: Mostrar apellido y oficio de los empleados cuyo oficio termine en “OR” (por ejemplo DIRECTOR, VENDEDOR), sin importar may/min.

SELECT apellido, oficio
FROM empleado
WHERE UPPER(oficio) LIKE '%OR';

--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 08: Mostrar los empleados cuyo apellido contenga la letra E (en cualquier posición), sin distinguir may/min.

SELECT *
FROM empleado
WHERE UPPER(apellido) LIKE '%E%';


--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 09: Mostrar apellido y salario, y una columna calculada con el salario anual (salario*12) con alias "Salario anual".

SELECT apellido, salario, salario * 12 AS "Salario anual"
FROM empleado;

--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 10: Mostrar apellido y salario, y una columna “subida” del 15% (salario * 1.15), redondeada a 2 decimales.

SELECT apellido, salario,
       ROUND(salario * 1.15, 2) AS subida
FROM empleado;

--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 11: Igual que el anterior, pero sin redondear (truncar a 2 decimales).

SELECT apellido,salario,
       TRUNC(salario * 1.15, 2) AS subida
FROM empleado;

--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 12: Mostrar apellido y salario formateado como texto con 2 decimales, indicándolo con el alias "Salario texto".

SELECT apellido,
       TO_CHAR(salario, '9999999.99') AS "Salario texto"
FROM empleado;

--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 13: Mostrar los empleados cuyo salario, convertido a texto, termine en 50 (pista: TO_CHAR + LIKE).

SELECT apellido, salario
FROM empleado
WHERE TO_CHAR(salario) LIKE '%50';

--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 14: Mostrar los empleados cuyo salario, convertido a texto, contenga el dígito 3.

SELECT apellido, salario
FROM empleado
WHERE TO_CHAR(salario) LIKE '%3%';

--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 15: Mostrar empleados con comisión NO nula, indicando además el total (salario + comisión) como alias "Total".

SELECT apellido, salario, comision, (salario + comision) AS "Total"
FROM empleado
WHERE comision IS NOT NULL;

--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 16: Mostrar empleados con comisión NO nula y mayor que 500, ordenados por “Total” descendente.

SELECT apellido, salario, comision, salario + comision AS "Total"
FROM empleado
WHERE comision IS NOT NULL 
  AND comision > 500
ORDER BY "Total" DESC;


--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 17: Poner la comisión a 0 a todos los empleados que actualmente la tengan NULL. Confirmar con COMMIT.

UPDATE empleado
SET comision = 0
WHERE comision IS NULL;
COMMIT;


--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 18: Subir el salario un 10% a los empleados del departamento 20. Confirmar con COMMIT.

UPDATE empleado
SET salario = salario * 1.10
WHERE dept_no = 20;

COMMIT;

--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--EJERCICIO 19: Cambiar el oficio EMPLEADO a AUXILIAR (para todos los que sean EMPLEADO). Confirmar con COMMIT.
UPDATE empleado
SET oficio = 'AUXILIAR'
WHERE UPPER(oficio) = 'EMPLEADO';

COMMIT;

--_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

