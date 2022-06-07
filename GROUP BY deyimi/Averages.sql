/*
In this task, you need to write a query that computes average budget and average box office for every year presented in table movies. Sort the result by year in ascending order.

title	release_year	budget	box_office
The Aviator	2004	110	121
The Big Short	2015	28	133
The Legend of Tarzan	2016	180	356
Spotlight	2015	20	98
Ex Machina	2015	10	36
The Shape of Water	2017	19	195
The Accountant	2016	44	155
*/

SELECT (release_year), AVG(budget), AVG(box_office) FROM movies
GROUP BY release_year ORDER BY release_year;
