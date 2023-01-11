CREATE DATABASE sql;

USE sql;

CREATE TABLE product
(id int NOT NULL PRIMARY KEY,
 productName nvarchar(50),
 unitPrice decimal(12,2),
 package nvarchar(30),
 isDiscontinued bit);

CREATE TABLE customer
(id int NOT NULL PRIMARY KEY,
firstName nvarchar(40) NOT NULL,
lastName nvarchar(40),
city nvarchar(40),
country nvarchar(40),
phone nvarchar(40));

CREATE TABLE orders
(id int NOT NULL PRIMARY KEY,
 orderDate datetime NOT NULL,
 orderNumber nvarchar(10),
customerId int REFERENCES customer(id),
totalAmount decimal(12,2));

CREATE TABLE orderItem
(id int NOT NULL PRIMARY KEY,
 orderId int REFERENCES orders(id),
 productId int REFERENCES product(id),
 unitPrice decimal(12,2),
 quantity int);

INSERT INTO product
VALUES (101, 'Television', 50000, 'Cardboard', 0),
(102, 'Table', 1000, 'Box', 0),
(103, 'specs', 2000, 'Box', 0),
(104, 'Bag', 1500, 'Cardboard', 0),
(105, 'Mobile', 15000, 'Box', 0),
(106, 'Mouse', 1000, 'Box', 1);

INSERT INTO product
VALUES (NULL,'GGHC',43234, 'FF',1);

SELECT * FROM product

INSERT INTO customer
VALUES (201, 'Gowthami', 'Reddy', 'Tirupathi', 'India', '9676543210'),
(202, 'Chani', 'Nani', 'Banglore', 'India', '8454345778'),
(203, 'Thrishya', 'Chevvu', 'Kadapa', 'India', '9657483945');
delete from customer where Id = 3;
SELECT * FROM customer;

INSERT INTO orders
VALUES (301, '2023-01-11 09:30', '789523', '201', 54000),
(302, '2023-01-11 07:45', '654732', '202', 10000),
(303, '2023-01-10 05:34', '354687', '203', 25000);

delete from orders where Id = 303;
SELECT * FROM orders;

INSERT INTO orderItem
VALUES (401, 301, 101, 50000, 1),
(402, 301, 106, 1000, 1),
(403, 302, 102, 20000, 1),
(404, 303, 103, 22000, 1),
(405, 303, 104, 30000, 1),
(406, 303, 105, 2000, 1);

SELECT * FROM orderItem;
SELECT * FROM orders;
SELECT * FROM customer;
SELECT * FROM product;


INSERT INTO customer
VALUES (205, NULL, NULL, 'somewhere', 'India', '3456366666');

INSERT INTO orders
VALUES (434, NULL, 222, 201, 2333);

SELECT country FROM customer 
WHERE firstName LIKE 'I%' OR firstName LIKE 'S%';

SELECT * FROM customer 
-WHERE firstName LIKE '__t%';

SELECT country FROM customer WHERE country = 'india';

SELECT firstname,lastname,firstname+' '+lastname AS FullName FROM customer; 


ALTER TABLE customer
ADD FaxNumber nvarchar(15);

SELECT * FROM customer;

UPDATE customer set FaxNumber =  +1-312-6667785
WHERE Id = 203;

SELECT * FROM customer WHERE FaxNumber is not null;

SELECT * FROM customer WHERE FaxNumber is null;

SELECT * FROM CUSTOMER WHERE firstname LIKE '__a%';

SELECT * FROM orders
WHERE Id IN (SELECT OrderId from orderitem WHERE UnitPrice BETWEEN 1000 AND 20000);

ALTER TABLE orders
ADD shipment datetime;

SELECT * FROM orders;

UPDATE orders SET shipment = '2022-08-05'
WHERE Id = 303;

SELECT * FROM orders 
WHERE shipment is not null
ORDER BY shipment desc;

ALTER TABLE orders 
ADD ShipName varchar(20);

UPDATE orders SET ShipName = 'lonar'
WHERE Id = 303;

SELECT * FROM orders 
WHERE ShipName LIKE 'Shark' AND (shipment BETWEEN 2022-09-05 AND 2022-09-07);

SELECT * FROM product;
SELECT * FROM orders;
SELECT * FROM orderitem;
SELECT productId, avg(quantity) AS average FROM orderitem
GROUP BY productId;


ALTER TABLE orders 
ADD ShippingCompany varchar(20);

UPDATE orders SET ShippingCompany = 'IBM'
WHERE Id = 301;

SELECT ShippingCompany, ShipName FROM orders WHERE ShipName is not null;

Alter TABLE product
ADD duscount int;

UPDATE product 
SET duscount = 20
WHERE id = 103;



ALTER TABLE product 
ADD Category varchar(20);

UPDATE product
SET Category = 'portable'
WHERE Id = 106;

SELECT productName, Category, unitPrice - duscount AS price FROM product;


SELECT ShippingCompany, totalAmount AS totalPrice FROM orders
WHERE ShippingCompany LIKE 'IBM' AND totalAmount > 20000;