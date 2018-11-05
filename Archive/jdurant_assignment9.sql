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
SELECT category.category_name
FROM category
WHERE EXISTS (SELECT * FROM product 
WHERE  product.category_id = category_id);

/* Query 4 */

