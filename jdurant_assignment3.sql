/* Assignment 3.sql 
  Jason Durant
   CS 150A, Fall 2018
*/

/* put the database name into this command */
USE university;
/* Query 0 */
SELECT user(), current_date();


/* Query 1 */
SELECT student_id 
, first_name
, last_name
, student.dept_id
, tot_cred
FROM student 
JOIN dept ON dept.dept_id = student.dept_id
WHERE dept.dept_id IN (1,3);

/* Query 2 */
SELECT faculty_id
, Title
, Status
FROM Faculty
WHERE Title = 'Associate Professor'
AND Status = 'Full Time';

/* Query 3 */
SELECT staff_id
, last_name
, salary 
FROM staff
WHERE last_name LIKE 'C%';

/* Query 4 */
SELECT *
FROM staff
WHERE salary BETWEEN 50000 AND 70000;

/* Query 5 */
SELECT  course_id
, sec_id
, semester
, year
, building
, room_number 
FROM section
WHERE semester = 'Fall' AND year = 2015
LIMIT 40;

/* Query 6 */
SELECT * 
FROM dept
WHERE building LIKE '%Palm%';

/* Query 7 */
SELECT reg.student_id  AS student_id
, reg.course_id AS course_id
, reg.sec_id AS sec_id
, reg.semester AS semester
, reg.year AS year
, reg.grade AS grade
FROM student
JOIN registration AS reg ON reg.student_id = student.student_id
WHERE reg.grade IS NULL;

/* Query 8 */
SELECT course_id
, title 
FROM course
WHERE title LIKE 'Intro%';

/* Query 9 */
SELECT course_id AS 'course id'
, sec_id AS 'section id'
, year
, building
FROM section
WHERE semester = 'Fall';

/*  Query 10 */
SELECT building,
room_number,
capacity 
FROM classroom
WHERE capacity BETWEEN 30 AND 70;

/* Query 11 */
SELECT * 
FROM classroom
WHERE capacity > 30 AND building = 'Taylor';

/* Query 12 */
SELECT last_name
, dept_id 
FROM student
WHERE NOT (last_name = 'Evan' OR last_name = 'William');

/* Query 13 */
SELECT first_name
, last_name
FROM staff
WHERE date_hired BETWEEN '1990-01-01' AND '1990-12-31';

/* Query 14 */
SELECT last_name
, first_name
, dept_id 
FROM student
WHERE last_name LIKE '_o%';
