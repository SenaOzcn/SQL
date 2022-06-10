/*
A table is defined by the following statement:

CREATE TABLE Titanic_passengers (
    passenger_id INTEGER,
    survived BOOLEAN,
    passenger_class INTEGER,
    first_name varchar(20),
    last_name varchar(20),
    is_male BOOLEAN,
    age INTEGER,
    sibsp INTEGER,
    parch INTEGER
);
Write a query that selects the following info about each passenger:

first_name;
last_name;
age;
passenger_class.
Sort the results by class with younger passengers at the beginning.
*/

SELECT
    first_name,
    last_name,
    age,
    passenger_class
FROM 
    Titanic_passengers
ORDER BY
    
    passenger_class,
    age;
