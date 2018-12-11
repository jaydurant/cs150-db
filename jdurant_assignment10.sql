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
AS SELECT * FROM product 
WHERE list_price < 50 WITH CHECK OPTION;

SELECT * FROM cheap_products;

/* Query 5 */
INSERT INTO cheap_products
VALUES(17888
    , 41
    , 'book db'
    , 'Fundamental of Database Systems'
    , 'Fundamental of Database Systems Elmasri'
    , 45.99
    , 20.00
    ,'2015-06-01 11:12:59'
    , 2);

/* Query 6 */
CREATE OR REPLACE VIEW contact
(first_name, phone_number ) AS
SELECT DISTINCT(contact_fname), phone 
FROM vendor;

SELECT * FROM contact;

/* Query 7 */
CREATE OR REPLACE VIEW order_items
(order_id
, order_date
, tax_amount
, ship_date
, item_price
, discount_amount
, final_price
, quantity
, item_total
, product_name ) AS 
SELECT o.order_id
, o.order_date
, o.tax_amount
, o.ship_date
, oi.item_price
, oi.discount_amount
, oi.item_price - oi.discount_amount
, oi.quantity
, (oi.item_price - oi.discount_amount) * oi.quantity
, p.product_name
FROM orders AS o 
JOIN orderitems AS oi ON o.order_id = oi.order_id
JOIN product AS p ON p.product_id = oi.product_id;

SELECT * FROM order_items;

/* Query 8 */
CREATE OR REPLACE VIEW reorder_info
(product_id
, product_name
, first_name
, phone_number) AS
SELECT product.product_id
, product.product_name
, vendor.contact_fname
, vendor.phone
FROM product 
JOIN vendor ON product.vendor_id = vendor.vendor_id;

SELECT * FROM reorder_info;

/* Query 9 */
SELECT card_number
, LENGTH(card_number) AS card_number_length
, SUBSTR(card_number, LENGTH(card_number) - 4, 4 ) AS  last_four_digits
, CONCAT('XXXX-XXXX-XXXX-' , SUBSTR(card_number, LENGTH(card_number) - 4, 4 )) AS formatted_number 
FROM orders;