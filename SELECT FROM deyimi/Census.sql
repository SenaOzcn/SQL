/*
A table is defined by the following statement:

CREATE TABLE Census (id INTEGER, 
                     name VARCHAR(20), 
                     birth_year INTEGER, 
                     gender VARCHAR(1));
Write a query that selects all the columns without the usage of a * symbol.
*/

SELECT
    id         AS "id",
    name       AS "name",
    birth_year AS "birth year",
    gender     AS "gender"
FROM
    Census
;
