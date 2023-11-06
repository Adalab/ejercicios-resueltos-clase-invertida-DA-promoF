-- modulo-2-leccion-08-queries-avanzadas

## Ejercicio 1:

-- Realiza una consulta `SELECT` que obtenga el número identificativo de cliente más bajo de la base de datos.

SELECT MIN(customer_number) AS NumeroMinimo
FROM customers;

## Ejercicio 2:

-- Selecciona el limite de crédito medio para los clientes de España.

SELECT AVG(credit_limit)
FROM customers
WHERE country = 'Spain';

## Ejercicio 3:

-- Selecciona el numero de clientes en Francia(France):

SELECT COUNT(customer_name)
FROM customers
WHERE country = 'France';

## Ejercicio 4:

-- Selecciona el máximo de credito que tiene cualquiera de los clientes del empleado con número 1323:

SELECT MAX(credit_limit)
FROM customers
WHERE sales_rep_employee_number = 1323;

## Ejercicio 5:

-- ¿Cuál es el número máximo de empleado de la tabla Customers?

SELECT MAX(sales_rep_employee_number)
FROM customers;

## Ejercicio 6:

-- Realiza una consulta SELECT que seleccione el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno:*/

SELECT sales_rep_employee_number AS NumEmpleado, COUNT(distinct customer_number) AS NumClientes
FROM customers
GROUP BY(sales_rep_employee_number);

## Ejercicio 7:

-- Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos:*/

SELECT sales_rep_employee_number AS NumEmpleado, COUNT(distinct customer_number) AS NumClientes
FROM customers
GROUP BY(sales_rep_employee_number)
HAVING COUNT(distinct customer_number) > 7;

## Ejercicio 8:

/* Selecciona el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno. 
 Asigna una etiqueta de "AltoRendimiento" a aquellos empleados con mas de 7 clientes distintos */

SELECT sales_rep_employee_number AS Empleado, COUNT(distinct customer_number) AS NumClientes,
CASE WHEN COUNT(distinct customer_number) > 7 THEN "AltoRendimiento" END AS Etiqueta
FROM customers
GROUP BY(sales_rep_employee_number);

-- Solución con CASE más completo:

SELECT sales_rep_employee_number AS Empleado, COUNT(distinct customer_number) AS NumClientes,
	CASE 	
		WHEN COUNT(distinct customer_number) > 7 THEN "AltoRendimiento" 
        ELSE "BajoRendimiento"
			END AS Etiqueta
FROM customers
GROUP BY(sales_rep_employee_number);

## Ejercicio 9:

-- Selecciona el número de clientes en cada pais

SELECT COUNT(customer_number) AS NumClientes, country AS Pais
FROM customers
GROUP BY(country);

## Ejercicio 10:

-- Selecciona aquellos paises que tienen clientes de más de 3 ciudades diferentes*/

SELECT country AS Pais, COUNT(distinct city)
 FROM customers
 GROUP BY(country)
 HAVING COUNT(distinct city) > 3;