


USE classicmodels;

-- Ejercicio 1.
SELECT o.orderNumber, sum(quantityOrdered)
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;

-- Ejercicio 2.
SELECT o.orderNumber, o.status, sum(quantityOrdered * priceEach) AS total
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber, o.status;

-- Ejercicio 3.
SELECT o.orderNumber, requiredDate, orderLineNumber, p.productName, quantityOrdered, priceEach
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
JOIN products p
  ON od.productCode = p.productCode;
  
-- Ejercicio 4
SELECT o.orderNumber, p.productName, MSRP, priceEach
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
JOIN products p
  ON od.productCode = p.productCode;
  
-- Ejercicio 5
SELECT c.customerNumber, c.customerName, orderNumber, status
FROM customers c
LEFT JOIN orders o
  ON c.customerNumber = o.customerNumber;
 
 #Vemos los clientes que no han ordenada nada 
  
-- Ejercicio 6
SELECT c.customerNumber, customerName
FROM customers c
LEFT JOIN orders o
  ON c.customerNumber = o.customerNumber
WHERE orderNumber IS NULL;

-- Ejercicio 7
SELECT lastName, firstName, customerName, checkNumber, amount
FROM employees e
LEFT JOIN customers c 
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments ON 
    payments.customerNumber = c.customerNumber
ORDER BY customerName, checkNumber;

-- Ejercicio 8
SELECT c.customerNumber, customerName, orderNumber, status
FROM customers c
RIGHT JOIN orders o
  ON c.customerNumber = o.customerNumber;
  
SELECT c.customerNumber, customerName
FROM customers c
RIGHT JOIN orders o
  ON c.customerNumber = o.customerNumber
WHERE orderNumber IS NULL;
  
SELECT lastName, firstName, customerName, checkNumber, amount
FROM employees e
RIGHT JOIN customers c 
ON e.employeeNumber = c.salesRepEmployeeNumber
RIGHT JOIN payments ON 
    payments.customerNumber = c.customerNumber
ORDER BY customerName, checkNumber;

#No representan lo mismo, porque ahora toma la segunda tabla y a esta le une los 
# registros de la primera tabla

-- Ejercicio 9 
CREATE VIEW cantidadOrdenada_939 AS (
SELECT o.orderNumber, sum(quantityOrdered) AS cantidad
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber );

SELECT AVG(cantidad) 
FROM cantidadOrdenada_939;


CREATE VIEW costoTotalOrden_939 AS (
SELECT o.orderNumber, o.status, sum(quantityOrdered * priceEach) AS total
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber, o.status  );

SELECT orderNumber,status,total 
FROM costoTotalOrden_939 ct 
WHERE status='Cancelled'; 



CREATE VIEW customerOrders_939 AS (
SELECT c.customerNumber, customerName, orderNumber, status
FROM customers c
RIGHT JOIN orders o
  ON c.customerNumber = o.customerNumber );
 
 
SELECT co.customerName,status,COUNT(customerNumber)
FROM customerOrders_939 co
GROUP BY customerName, status
ORDER BY customerName;

z
 
 

