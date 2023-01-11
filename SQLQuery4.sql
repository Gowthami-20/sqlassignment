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