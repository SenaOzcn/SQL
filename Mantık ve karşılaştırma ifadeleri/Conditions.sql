/*
Imagine that you need to find out which employees in the company are doing well.

Arrange an SQL query to select from table staff all employees, whose annual salary is more than or equal to 60 000.

id	name	salary
1	Wendy Spencer John Preston	48000
2	Mark Klaiton	52000
3	Jack Wilson	60000
4	Kate Smith	55000
5	Tedd Jonson	68000
6	Tracy Walberg	75000
7	Min Li	56000
8	John Preston	62000
*/

SELECT
    *
FROM
    staff
WHERE
    salary = 60000
    OR
    salary > 60000
;
