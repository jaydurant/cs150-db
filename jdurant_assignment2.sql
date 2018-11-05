/* Assignment 2.sql 
  Jason Durant
   CS 150A, Fall 2018
*/

/* put the database name into this command */
USE university;
/* Query 0 */
SELECT user(), current_date();


/* Query 1 */
SELECT CONCAT(last_name, ',', first_name) AS 'staff names'
, salary as 'salaries'
FROM staff;

/* Query 2 */
SELECT DISTINCT building
FROM classroom;

/* Query 3 */
SELECT *
FROM section
WHERE semester = 'Spring' AND year = 2015;

/* Query 4 */
SELECT course_id AS 'course id'
, title AS 'title'
, credits
FROM course
WHERE credits = 4;

/* Query 5 */
SELECT CONCAT(last_name, ',', first_name) AS 'staff names'
FROM staff
ORDER BY date_hired DESC
LIMIT 10;

/* Query 6 */
SELECT faculty_id AS 'falcuty id'
, dept_id as 'dept id'
, Title as title
FROM Faculty
WHERE faculty_id != 78699;

/* Query 7 */
SELECT first_name AS 'first name'
, last_name AS 'last name'
, tot_cred AS 'total credits'
FROM student
ORDER BY tot_cred DESC

/* Query 8 */
SELECT dept_id AS 'department id'
, dept_name AS 'department name'
, budget 
FROM dept;

/* Query 9 */
SELECT staff_id AS 'staff id'
, address
, CONCAT(city, ',', state) AS 'city state'
, zip_code AS zipcode
FROM staff;

/*  Query 10 */
SELECT staff_id AS 'staff id'
, last_name AS 'last name'
, salary
FROM staff
WHERE salary < 70000;

/* Query 11 */
SELECT DISTINCT(co.title) AS 'course title'
FROM section AS sec
JOIN course AS co ON sec.course_id = co.course_id;

/* Query 12 */
SELECT student_id AS 'student id'
, sec_id AS 'section id'
, semester
, year
FROM registration
ORDER BY year DESC
LIMIT 20;
