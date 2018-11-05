/* Assignment 9.sql 
  Jason Durant
   CS 150A, Fall 2018
*/

/* put the database name into this command */
USE bookstore;
/* Query 0 */
SELECT user(), current_date();

/* Query 1 */
SELECT DISTINCT category_name
FROM category c
WHERE c.category_id IN (SELECT product.category_id FROM product)
ORDER BY category_name;

/* Query 2 */
SELECT product_name
, list_price 
FROM product
WHERE list_price > (SELECT avg(list_price) FROM product)
ORDER BY list_price DESC;

/* Query 3 */
SELECT category.category_name, product.product_name
FROM category
WHERE EXISTS (SELECT * FROM product 
WHERE  product.category_id = category_id);

/* Query 4 */
SELECT email_address
, (SELECT orders.order_id FROM orders
    WHERE orders.customer_id = customer.customer_id
    ORDER BY orders.order_date ASC
    LIMIT 1
) AS order_id
, (SELECT orders.order_date FROM orders
    WHERE orders.customer_id = customer.customer_id
    ORDER BY orders.order_date ASC
    LIMIT 1
) AS order_date
FROM customer;

/* Query 5 */
SELECT product_id
, product_name
, list_price
FROM product
WHERE (SELECT COUNT(*) 
        FROM orderitems 
        WHERE product.product_id = orderitems.product_id ) > 1;

/* Query 6 */
SELECT last_name, first_name 
FROM customer
WHERE customer.customer_id IN (SELECT DISTINCT customer_id FROM orders
    JOIN orderitems ON orders.order_id = orderitems.order_id
    WHERE item_price > 300);

/* Query 7 */
SELECT first_name
, last_name
, email_address
FROM customer 
WHERE customer.customer_id IN (SELECT orders.customer_id 
                                FROM orders 
                                WHERE orders.order_id IN(1,2,3));

/* Query 8 */

/* Quer 9 */
SELECT product_id
, product_name
, list_price 
FROM product
WHERE product_id IN (SELECT product_id FROM orderitems
GROUP BY product_id
HAVING SUM(quantity) > 2);




