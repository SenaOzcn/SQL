/*
Write a query to compute minimum, average and maximum street lengths in the table streets.

street_name	bus_stops	crossings	is_one_way	length
Brickstone	2	0	no	3
Red Woods	4	5	no	10
Water Sports Arena	1	0	yes	3
Sun Valley	10	10	no	15
River Shore	3	3	yes	8
*/

SELECT MIN(length) AS MIN, AVG(length) AS AVG, MAX(length) AS MAX FROM streets;
