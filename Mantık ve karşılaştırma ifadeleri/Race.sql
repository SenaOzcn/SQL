/*
The table "cars" is defined by the following statement:

CREATE TABLE cars (
    manufacturer VARCHAR(20),
    model VARCHAR(20),
    top_speed FLOAT,
    capacity INTEGER,
    acceleration FLOAT
);
Let's choose an electric car for a race! Write a query that selects all info about cars with the top speed 
higher than 240 kilometers per hour and acceleration lower than 3 seconds. 
Please, use the order of columns from the CREATE TABLE statement.
*/

SELECT
    *
FROM
    cars
WHERE
    top_speed > 240
    AND
    acceleration < 3
