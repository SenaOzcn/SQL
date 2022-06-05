/*
A table "Titanic_passengers" that stores info about Titanic passengers has the following columns:

integer passenger_id
boolean survived
integer passenger_class
varchar(20) first_name
varchar(20) last_name
boolean is_male
integer age (in 1912)
Write a query that selects the info about each passenger in the following three columns:

full name (first name and last name in one column, they should be separated by a space)
birth year (year of birth, not age)
class
The "Titanic_passengers" table does not need to be created, it already exists. Be sure to follow the order of the columns. 
Also, note that the year of birth is calculated relative to 1912. Use CONCAT() to get full name from first_name and last_name.
*/

SELECT
    CONCAT(first_name, ' ', last_name) AS "full name",
    1912 - age                         AS "birth year",
    passenger_class                    AS "class"
FROM
    Titanic_passengers
;
