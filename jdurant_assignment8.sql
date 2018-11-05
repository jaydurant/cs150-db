/* Assignment 8.sql 
  Jason Durant
   CS 150A, Fall 2018
*/

/* put the database name into this command */
USE bookstore;
/* Query 0 */
SELECT user(), current_date();

/* Query 1 */
SELECT COUNT(order_id) as num_orders
, SUM(tax_amount) as total_tax_amount
FROM bookstore.orders;

/* Query 2 */
SELECT product_id
, COUNT(order_id) as NumOrders
FROM orderitems
GROUP BY product_id
ORDER BY NumOrders DESC;

/* Query 3 */
SELECT category.category_name
, COUNT(product_id) AS product_id_count
, MAX(list_price) AS max_price
FROM category
JOIN product ON category.category_id = product.category_id
GROUP BY category.category_id
ORDER BY product_id_count DESC;

/* Query 4 */
SELECT customer.email_address as email_address
, SUM(orderitems.item_price) * orderitems.quantity AS item_price_total
, SUM(orderitems.discount_amount) * orderitems.quantity AS item_discount_total
FROM customer
JOIN orders on orders.customer_id = customer.customer_id
JOIN orderitems on orderitems.order_id = orders.order_id
GROUP BY email_address
ORDER BY item_price_total DESC;

/* Query 5 */
SELECT customer.email_address as email_address
, COUNT(orders.order_id) AS order_count
, SUM(orderitems.item_price - orderitems.discount_amount) * orderitems.quantity AS order_total
FROM customer
JOIN orders on orders.customer_id = customer.customer_id
JOIN orderitems on orderitems.order_id = orders.order_id  
GROUP BY email_address
HAVING order_count > 1
ORDER BY order_total DESC;

/* Query 6 */
SELECT customer.email_address as email_address
, COUNT(orders.order_id) AS order_count
, SUM(orderitems.item_price - orderitems.discount_amount) * orderitems.quantity AS order_total
FROM customer
JOIN orders on orders.customer_id = customer.customer_id
JOIN orderitems on orderitems.order_id = orders.order_id 
WHERE orderitems.item_price > 400
GROUP BY email_address
HAVING order_count > 1
ORDER BY order_total DESC;

/* Query 7 */
SELECT customer.email_address as email_address
, COUNT(orderitems.product_id) AS number_of_products
FROM customer
JOIN orders on orders.customer_id = customer.customer_id
JOIN orderitems on orderitems.order_id = orders.order_id 
GROUP BY customer.email_address
HAVING number_of_products > 1;

/* Query 8 */
SELECT vendor.vendor_id AS vendor_id,
COUNT(product.product_id) AS product_count
FROM vendor
JOIN product ON vendor.vendor_id = product.vendor_id
WHERE product.list_price > 100
GROUP BY vendor_id;

/* Query 9 */
SELECT vendor_id
, category_id
, COUNT(product_id) AS 'number of products'
, AVG(list_price) AS 'Average price'
FROM product
GROUP BY category_id, vendor_id;

/* Query 10 */
SELECT COUNT(product.product_id)
FROM category
JOIN product ON category.category_id = product.category_id
WHERE category.category_name = 'printer';





