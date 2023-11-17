modulo-2-leccion-10-multiples-tablas-II

1. Selecciona los apellidos que se encuentren en ambas tablas para employees y customers, con alias 'Apellidos'.

SELECT last_name AS 'Apellido'
FROM employees
UNION
SELECT contact_last_name AS 'Apellido'
FROM customers;

2. Selecciona los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados de las tablas employees y customers.

SELECT first_name AS 'Nombre' ,last_name AS 'Apellido'
FROM employees
UNION
SELECT contact_first_name AS 'Nombre',contact_last_name AS 'Apellido'
FROM customers;

3. Selecciona todos los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados de las tablas employees y customers.

SELECT first_name AS 'Nombre' ,last_name AS 'Apellido'
FROM employees
UNION ALL
SELECT contact_first_name AS 'Nombre',contact_last_name AS 'Apellido'
FROM customers;

4. Queremos ver ahora que empleados tienen algún contrato asignado con alguno de los clientes existentes. Para ello selecciona employeeNumber como 'Número empleado', firstName como 'nombre Empleado' y lastName como 'Apellido Empleado'

SELECT  employee_number AS 'Número empleado', first_name AS 'Nombre Empleado' , last_name AS 'Apellido Empleado'
FROM employees
WHERE employee_number IN (
SELECT sales_rep_employee_number 
FROM customers);

5. Queremos ver ahora en cuantas ciudades en las cuales tenemos clientes, no también una oficina de nuestra empresa para ello: Selecciona aquellas ciudades como 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, sin repeticiones, que no tengan una oficina en dicha ciudad de la tabla offices.

SELECT city AS 'ciudad', customer_name AS 'nombre de la empresa'
FROM customers
WHERE city NOT IN (
SELECT city FROM offices);

6. Encuentra los campos nombre del cliente y ciudad, de aquellas ciudades de la tabla de customers que terminen en 'on'.

SELECT customerName, city
FROM customers
WHERE city LIKE 'on';

7. Encuentra los campos nombre del cliente, ciudad de aquellas ciudades de la tabla de customers que terminen en 'on' y que unicamente sean de longitud 4.

SELECT customerName, city
FROM customers
WHERE city LIKE '__on';

8. Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal (o lo que es lo mismo, su primera dirección).

SELECT customerName,addressLine1, city
FROM customers
WHERE addressLine1 LIKE '%3%' AND city;

9. Encuentra el nombre del cliente, primera dirección  y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal y la ciudad no empiece por T.

SELECT customerName,addressLine1, city
FROM customers
WHERE addressLine1 LIKE '%3%' AND city not LIKE 'T%';

10. Selecciona, haciendo uso de expresiones regulares, los campos nombre del cliente, primera dirección  y ciudad. Unicamente en el caso que la dirección postal, posea algún número en dicho campo.

SELECT customerName,addressLine1, city, phone
FROM customers
WHERE addressLine1 REGEXP '[0-9]';