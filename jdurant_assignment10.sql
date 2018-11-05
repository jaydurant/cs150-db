/* Assignment 10.sql 
  Jason Durant
   CS 150A, Fall 2018
*/

/* put the database name into this command */
USE bookstore;
/* Query 0 */
SELECT user(), current_date();

/* Query 1 */
CREATE OR REPLACE VIEW customer_address 
(customer_id, email_address,
last_name, first_name, ship_line1, ship_line2,
ship_city, ship_state, ship_zip) AS
SELECT  c.customer_id
, c.email_address
, c.last_name
, c.first_name
, a.line1
, a.line2
, a.city
, a.state
, a.zip_code
FROM customer c
JOIN address a ON c.shipping_address_id = a.address_id;

SELECT customer_id
, last_name
, first_name
, ship_city
, ship_state 
FROM customer_address;

/* Query2 */
UPDATE customer_address
SET ship_line1 = "1990 Westwood Blvd."
WHERE customer_id = 11119;

/* Query 3 */
CREATE OR REPLACE VIEW product_summary
(product_id, order_count, order_total) AS
SELECT product_id
, item_price * SUM(quantity) AS total_sales
, SUM(quantity) AS quantity
FROM orderitems
GROUP BY product_id;

SELECT * FROM product_summary;

/* Query 4 */
CREATE OR REPLACE VIEW cheap_products
AS SELECT * FROM PRODUCT 
WHERE list_price < 50 WITH CHECK OPTION;
