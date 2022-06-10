/*
A table is defined by the following statement:

CREATE TABLE Census (id INTEGER, 
                     name VARCHAR(20), 
                     birth_year INTEGER, 
                     gender VARCHAR(1));
Write a query that selects all data from the table sorted by birth_year in descending order and by name in ascending order. Do not change the order of the columns.
*/

SELECT * FROM Census
ORDER BY birth_year DESC, name ASC;
