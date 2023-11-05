modulo-2-leccion-06-modificacion-insercion-datos

-- Ejercicio 1: Renombra la tabla t1 a t2.

ALTER TABLE t1 RENAME t2;

-- Ejercicio 2: Cambia la columna `a` de tipo `INTEGER` a tipo `TINYINT NOT NULL` (manteniendo el mismo nombre para la columna).

ALTER TABLE t2 MODIFY a TINYINT NOT NULL;

-- Ejercicio 3: Cambia la columna `b` de tipo `CHAR` de 10 caracteres a `CHAR` de 20 caracteres. Además, renombra la columna como `c`.

ALTER TABLE t2 CHANGE b c CHAR(20);

-- Ejercicio 4: Añade una nueva columna llamada `d` de tipo `TIMESTAMP`.

ALTER TABLE t2 ADD d TIMESTAMP;

-- Ejercicio 5: Elimina la columna `c` que definiste en el ejercicio 3.

ALTER TABLE t2 DROP COLUMN c;

-- Ejercicio 6: Crea una tabla llamada `t3` idéntica a la tabla `t2` (de manera automática, no definiéndola columna a columna).

CREATE TABLE t3 LIKE t2;

-- Ejercicio 7: Elimina la tabla original `t2` y en otra sentencia renombra la tabla `t3` como `t1`.

DROP TABLE t2;
ALTER TABLE t3 RENAME t1;

-- Ejercicio 8: Realiza una inserción de datos sobre la tabla `customers_mod`

INSERT INTO customers_mod (customer_number,customer_name, contact_last_name, contact_first_name, phone,address_line1,address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (343,'Adalab','Rodriguez','Julia',672986373,'Calle Falsa 123','Puerta 42','Madrid','España',28000,'España',15,20000000);

-- Ejercicio 9: Realiza una inserción de datos sobre la tabla `customers_mod`

INSERT INTO customers_mod (customer_number,customer_name, contact_last_name, contact_first_name, phone,address_line1,address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (344,'La pegatina After','Santiago','Maricarmen',00000000,'Travesia del rave',NULL,'Palma de mallorca',NULL,07005,'España',10,45673453);

-- Ejercicio 10: Actualiza ahora los datos faltantes correspondientes al `CustomerName` 'La pegatina After'

UPDATE customers_mod
SET address_line1 = 'Poligono Industrial de Son Castelló',address_line2= 'Nave 92', city = 'Palma de mallorca', state = 'España',postal_code = 28123,country ='España', sales_rep_employee_number= 25, credit_limit= 5000000
WHERE customer_name = 'La pegatina After';

-- Ejercicio 11: Vamos ahora a romper a propósito la tabla con la que estamos trabajando, para ello primero vamos a realizar una copia de la misma antes de ejecutar lo siguiente. Con el nombre `customers_destroy`.

CREATE TABLE IF NOT EXISTS customers_destroy
SELECT * FROM
    customers;


UPDATE customers_destroy
SET address_line1 = 'Vamos', address_line2 = 'a', postal_code = 'fastidiar',country='la tabla :D';

-- Ejercicio 12: Actualiza ahora los datos de la tabla customers_mod, para que las 10 primeras empresas sean gestionadas por la representante de ventas numero 2. El resto de empresas no deben ser modificadas.

UPDATE customers_mod
SET sales_rep_employee_number = 2
LIMIT 10;

--Ejercicio 13: Queremos ahora eliminar de los datos de la tabla aquellos registros que contengan un 'null' en el campo 'ContactFirstName'.

DELETE FROM customers_mod
WHERE contact_first_name = NULL;

-- Ejercicio 14:  Ejecuta la instrucción de `DELETE` para la tabla `customers_mod` olvidando el `WHERE` como condición. Y observa lo que ha ocurrido.

DELETE FROM customers_mod;