
-- Retos
USE tienda;

SELECT *
FROM articulo
WHERE nombre LIKE '%PASTA%';

SELECT *
FROM articulo
WHERE nombre LIKE '%Cannelloni%';

SELECT *
FROM articulo
WHERE nombre LIKE '% - %';

SELECT avg(salario)
FROM puesto;

SELECT count(*)
FROM articulo
WHERE nombre LIKE '%pasta%';

SELECT min(salario), max(salario)
FROM puesto;

SELECT max(id_puesto) - 5
FROM puesto;

SELECT sum(salario)
FROM puesto
WHERE id_puesto >= 995;

SELECT nombre, count(*)
FROM puesto
GROUP BY nombre;

SELECT nombre, sum(salario)
FROM puesto
GROUP BY nombre;

SELECT id_empleado, count(clave) AS ventas
FROM venta
GROUP BY id_empleado;

SELECT id_articulo, count(*)
FROM venta
GROUP BY id_articulo;

SELECT nombre, apellido_paterno
FROM empleado
WHERE id_puesto IN
 (SELECT id_puesto
      FROM puesto
      WHERE salario > 10000);
     
SELECT id_empleado, min(total_ventas), max(total_ventas)
FROM
 (SELECT clave, id_empleado, count(*) total_ventas
      FROM venta
      GROUP BY clave, id_empleado) AS sq
GROUP BY id_empleado;

SELECT nombre, apellido_paterno, (SELECT nombre FROM puesto WHERE id_puesto = e.id_puesto)
FROM empleado e;


USE classicmodels;
-- Ejercicio 1.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE 'A%';

-- Ejercicio 2
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE lastName LIKE '%on';

-- Ejercicio 3
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE '%on%';

-- Ejercicio 4
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE 'G_____';

-- Ejercicio 5
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE lastName NOT LIKE '%B';

-- Ejercicio 6
SELECT productCode, productName
FROM products
WHERE productCode LIKE '%\_20%';

-- Ejercicio 7
SELECT orderNumber, sum(priceEach) total
FROM orderdetails
GROUP BY orderNumber;

-- Ejercicio 8
SELECT year(orderDate) anio, count(*)
FROM orders
GROUP BY anio;

-- Ejercicio 9
SELECT lastName, firstName
FROM employees
WHERE officeCode IN (SELECT officeCode FROM offices WHERE country = 'USA');

-- Ejercicio 10
SELECT customerNumber, checkNumber, amount
FROM payments
WHERE amount = (SELECT max(amount) FROM payments);

-- Ejercicio 11
SELECT customerNumber, checkNumber, amount
FROM payments
WHERE amount > (SELECT avg(amount) FROM payments);

-- Ejercicio 12
SELECT customerName
FROM customers
WHERE customerNumber NOT IN (SELECT customerNumber FROM orders);

-- Ejercicio 13
SELECT max(quantityOrdered), min(quantityOrdered), avg(quantityOrdered)
FROM orderdetails;

-- Ejercicio 14
SELECT status, count(*)
FROM orders
GROUP BY status;

