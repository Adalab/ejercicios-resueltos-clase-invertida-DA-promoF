modulo-2-leccion-05-creacion-tablas

-- Ejercicio 1:

CREATE SCHEMA ejercicios_2;
USE ejercicios_2;

CREATE TABLE Empleadas
(IDEmpleada INT,
Salario FLOAT,
Nombre VARCHAR(30),
Apellido VARCHAR(30),
Pais VARCHAR(10)
);

-- Ejercicio 2:

CREATE TABLE personasp (
ID INT NOT NULL,
Apellido VARCHAR(255) NOT NULL,
Nombre VARCHAR(255),
Edad INT,
Ciudad varchar(255) DEFAULT 'Madrid',
CONSTRAINT CHK_Persona CHECK (Edad>=16)
);

-- Ejercicio 3:

CREATE TABLE Empleadas
(IDEmpleada INT NOT NULL AUTO_INCREMENT,
Salario FLOAT DEFAULT NULL,
Nombre VARCHAR(30) DEFAULT NULL,
Apellido VARCHAR(30) DEFAULT NULL,
Pais VARCHAR(10) DEFAULT NULL,
PRIMARY KEY (IDEmpleada)
);


CREATE TABLE EmpleadasEnProyectos
(IDEmpleada INT NOT NULL,
IDProyecto INT NOT NULL,
PRIMARY KEY (IDEmpleada,IDProyecto),
CONSTRAINT fk_empleadas FOREIGN KEY (IDEmpleada) REFERENCES Empleadas (IDEmpleada) ON DELETE CASCADE
);

-- Ejercicio 4:

CREATE SCHEMA creacion_tienda;
USE creacion_tienda;

CREATE TABLE customers (
customerNumber int NOT NULL,
customerName varchar(50) NOT NULL,
contactLastName varchar(50) NOT NULL,
contactFirstName varchar(50) NOT NULL,
phone varchar(50) NOT NULL,
addressLine1 varchar(50) NOT NULL,
addressLine2 varchar(50) DEFAULT NULL,
city varchar(50) NOT NULL,
state varchar(50) DEFAULT NULL,
postalCode varchar(15) DEFAULT NULL,
country varchar(50) NOT NULL,
salesRepEmployeeNumber int DEFAULT NULL,
creditLimit decimal(10,2) DEFAULT NULL,
PRIMARY KEY (customerNumber) );

-- Ejercicio 5:

CREATE TABLE employees (
employeeNumber int NOT NULL,
lastName varchar(50) NOT NULL,
firstName varchar(50) NOT NULL,
extension varchar(10) NOT NULL,
email varchar(100) NOT NULL,
officeCode varchar(10) NOT NULL,
reportsTo int DEFAULT NULL,
jobTitle varchar(50) NOT NULL,
PRIMARY KEY (employeeNumber)
);

-- Ejercicio 6:

CREATE TABLE employees1 (
employeeNumber int NOT NULL,
lastName varchar(50) NOT NULL,
firstName varchar(50) NOT NULL,
extension varchar(10) NOT NULL,
email varchar(100) NOT NULL,
officeCode varchar(10) NOT NULL,
reportsTo int DEFAULT NULL,
jobTitle varchar(50) NOT NULL,
PRIMARY KEY (employeeNumber)
);



CREATE TABLE customers2 (
customerNumber int NOT NULL,
customerName varchar(50) NOT NULL,
contactLastName varchar(50) NOT NULL,
contactFirstName varchar(50) NOT NULL,
phone varchar(50) NOT NULL,
addressLine1 varchar(50) NOT NULL,
addressLine2 varchar(50) DEFAULT NULL,
city varchar(50) NOT NULL,
state varchar(50) DEFAULT NULL,
postalCode varchar(15) DEFAULT NULL,
country varchar(50) NOT NULL,
salesRepEmployeeNumber int DEFAULT NULL,
creditLimit decimal(10,2) DEFAULT NULL,
PRIMARY KEY (customerNumber),
KEY salesRepEmployeeNumber (salesRepEmployeeNumber),
CONSTRAINT customers_ibfk_1 FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees (employeeNumber)
);