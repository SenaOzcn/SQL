/*
A table "Titanic_passengers" that stores info about the passengers of the Titanic has the following columns:

integer passenger_id
boolean survived
integer passenger_class
varchar(20) first_name
varchar(20) last_name
boolean is_male
integer age (in 1912)
integer sibsp (number of siblings/spouses aboard)
integer parch (number of parents/children aboard)
Write a query that selects all the info about each passenger. Sort the results by the number of relatives aboard (large families should go first).
*/

SELECT * FROM Titanic_passengers
ORDER BY sibsp DESC, parch DESC;
