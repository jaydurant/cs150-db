/* Assignment 7.sql 
  Jason Durant
   CS 150A, Fall 2018
*/

/* put the database name into this command */
USE bookstore;
/* Query 0 */
SELECT user(), current_date();

/* Query 1 */

SELECT  category.category_name
, product.product_name
, product.list_price
FROM category
LEFT JOIN product ON  category.category_id = product.category_id
ORDER BY category.category_name ASC, product.product_name ASC;

/* Query 2 */
SELECT customer.first_name
, customer.last_name
, address.line1
, address.city
, address.state
, address.zip_code 
FROM customer
LEFT JOIN address ON customer.customer_id = address.customer_id
WHERE email_address = 'allan.sherwood@yahoo.com';

/* Query 3 */
SELECT customer.first_name
, customer.last_name
, address.line1
, address.city
, address.state
, address.zip_code 
FROM customer
LEFT JOIN address ON customer.shipping_address_id = address.address_id
WHERE customer.shipping_address_id IS NOT NULL;

/* Query 4 */
SELECT customer.last_name
, customer.first_name
, orders.order_date
, product.product_name
, orderitems.item_price
, orderitems.quantity
FROM customer
JOIN orders ON customer.customer_id = orders.customer_id
JOIN orderitems ON orders.order_id = orderitems.order_id
JOIN product ON orderitems.product_id = product.product_id
ORDER BY customer.last_name ASC, orders.order_date ASC;

/* Query 5 */
SELECT DISTINCT(p1.product_name)
, p1.list_price  
FROM product p1, product p2
WHERE p1.product_id != p2.product_id AND p1.list_price = p2.list_price
ORDER BY p1.product_name ASC;

/* Query 6 */
SELECT product.product_id
, product.product_name
, product.list_price
, vendor.company_name AS vendor_name
, category.category_name
FROM product
JOIN category ON category.category_id = product.category_id
JOIN vendor ON vendor.vendor_id = product.vendor_id
ORDER BY product.product_id DESC;

/* Query 7 */
SELECT product.product_id
, product.product_name
, product.list_price
, category.category_name
FROM product
JOIN category ON category.category_id = product.category_id
WHERE category.category_name = 'Computer'
ORDER BY product.product_id DESC;

/* Query 8 */
SELECT orders.order_id
, orders.order_date
, product.product_name
, orderitems.quantity
, orderitems.quantity * product.list_price AS amount
FROM orders
LEFT JOIN orderitems ON orderitems.order_id = orders.order_id
LEFT JOIN product  ON orderitems.product_id = product.product_id;

/* Query 9 */
SELECT customer.first_name
, customer.last_name
, orders.order_id
, orders.order_date
, orders.ship_date 
FROM orders
LEFT JOIN customer ON orders.customer_id = customer.customer_id
WHERE ship_date IS NULL;

/* Query 10 */
SELECT customer.last_name
, customer.first_name
FROM orders
LEFT JOIN customer ON orders.customer_id = customer.customer_id
LEFT JOIN orderitems ON orders.order_id = orderitems.order_id
LEFT JOIN product ON orderitems.product_id = product.product_id
WHERE product.list_price > 1500;

/* Query 11 */
SELECT product.product_name
,product.product_id 
FROM customer
LEFT JOIN orders on orders.customer_id = customer.customer_id
LEFT JOIN orderitems on orders.order_id = orderitems.order_id
LEFT JOIN product on product.product_id  = orderitems.product_id
WHERE customer.first_name = 'Christine' and customer.last_name = 'Brown';









