/*
A table is defined by the following statement:

CREATE TABLE weather (
    hour INTEGER,
    temperature INTEGER,
    feels_like INTEGER,
    wind_speed INTEGER,
    wind_direction VARCHAR(2),
    wind_gusts INTEGER,
    humidity DECIMAL(3,2),
    phenomena VARCHAR(50),
    pressure INTEGER
);
Write a query that selects all the data related to the wind and corresponding hour. Columns in your query must go in alphabetical order.
*/

SELECT 
    hour,
    wind_direction AS "Wind Direction",
    wind_gusts     AS "Wind Gusts",
    wind_speed     AS "Wind Speed"
FROM
    weather
;
