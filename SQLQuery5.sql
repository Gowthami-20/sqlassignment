USE sql;

SELECT * FROM orders
WHERE customerId IN (SELECT id FROM customer WHERE phone = '9676543210');

SELECT * FROM product WHERE Category = 'portable';

SELECT * FROM orders
WHERE customerId IN (SELECT id FROM customer WHERE country NOT LIKE 'german');

SELECT * FROM orders
WHERE id IN (SELECT orderId FROM orderitem WHERE productId IN (SELECT id FROM product WHERE productName LIKE 'Television'));