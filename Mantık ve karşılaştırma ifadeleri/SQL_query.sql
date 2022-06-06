/*
This time we want to find all the customers from Berlin in order to contact them and to withdraw the defective item that was previously sent to them.

Arrange an SQL query to select from the table customers all the clients from city Berlin.

id	name	city
1	Mary K	Lonon
2	James P	New York
3	Kate W	Paris
4	Victoria D	Berlin
5	Michael B	Los Angeles
6	Martin G	Berlin
7	Wang Ming	Shanghai
8	Sara P	Toronto
*/

SELECT
    *
FROM
    customers
WHERE
    city = 'Berlin'
;
