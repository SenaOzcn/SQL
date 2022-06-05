/*
A table is defined by the following statement:

CREATE TABLE Weather (
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
Write a SELECT statement that lists the following values in the same order:

hour
the ratio of feels_like to temperature
pressure
*/

SELECT
    hour AS "hour",
    feels_like / temperature AS "ratio",
    pressure AS "pressure"
FROM
    Weather
;
