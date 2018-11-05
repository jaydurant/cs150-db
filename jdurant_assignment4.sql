/* Assignment 4.sql 
  Jason Durant
   CS 150A, Fall 2018
*/

/* put the database name into this command */
USE library;
/* Query 0 */
SELECT user(), current_date();

/* Query 1 */
CREATE TABLE COMPUTER (
    serial_number INT(7),
    make VARCHAR(50),
    model VARCHAR(50),
    processor_type VARCHAR(50),
    memory_type VARCHAR(50),
    disk_size VARCHAR(50),
    PRIMARY KEY (serial_number)
)Engine = INNODB;

DESC COMPUTER;

/* Query 2 */
INSERT INTO COMPUTER VALUES(
 9871234, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530',
 '6.0 GBytes', '1.0 TBytes');
INSERT INTO COMPUTER VALUES(
 9871245, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530',
 '6.0 GBytes', '1.0 TBytes');
INSERT INTO COMPUTER VALUES(
 9871256, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530',
 '6.0 GBytes', '1.0 TBytes');
INSERT INTO COMPUTER VALUES(
 9871267, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530',
 '6.0 GBytes', '1.0 TBytes');
INSERT INTO COMPUTER VALUES(
 9871278, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530',
 '6.0 GBytes', '1.0 TBytes');

 /* Query 3 */
 ALTER TABLE COMPUTER
 ADD processor_speed DECIMAL(5,2);

 /* Query 4 */
 SELECT *
 FROM COMPUTER;

 /* Query 5 */
DESC COMPUTER;

/* Query 6*/
ALTER TABLE COMPUTER
DROP COLUMN processor_speed;

/* Query 7 */
RENAME TABLE COMPUTER
TO COMPUTER_BACKUP;

/* Query 8 */
SHOW TABLES;

/* Query 9 */
DROP TABLE IF EXISTS COMPUTER_BACKUP;
SHOW TABLES;

/* Query 10 */
ALTER TABLE branch
ADD phone_number INT(10);

/* Query 11 */
ALTER TABLE branch
DROP COLUMN phone_number;
