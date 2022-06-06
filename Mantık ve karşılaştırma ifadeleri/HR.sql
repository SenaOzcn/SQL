/*
Imagine that this time we discovered that our company's performance increased three times, 
that is why we entrusted our HR to reconsider salaries for the lowest-paid employees or for those who have worked in our company for more than 2 years.

Arrange an SQL query to select from the table staff all employees, except from HR, with either a salary less than 55000 or a working experience of 2 years or more.

id	name	salary	department	experience
1	Wendy Spencer	48000	sales	1
2	Mark Klaiton	52000	sales	2
3	Jack Wilson	60000	IT	3
4	Kate Smith	55000	IT	2
5	Tedd Jonson	68000	IT	5
6	Tracy Walberg	75000	HR	10
7	Min Li	56000	HR	3
8	John Preston	62000	IT	4
*/

SELECT * FROM staff
WHERE department <> 'HR'AND (salary < 55000 OR experience >= 2);
