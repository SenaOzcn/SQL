/*
The staff table

Let's consider the full version of the staff table. 
We want to arrange a conference for all experienced IT specialists in the company to discuss the launch of a new product.

Arrange an SQL query to select from the table staff all the employees, who work in the IT department with 3 or more years of experience.
*/

SELECT *
FROM staff
WHERE (experience = 3 OR experience > 3) AND department = 'IT'
