/*
Write a query that returns average users_ratings and critics_ratings for games with both ratings higher than or equal to 8 points. The table name is games.

title	publisher	developer	users_rating	critics_rating
Vanguards	Art of Electro	Diamond Games	8.6	8.2
Hooligans 14	Macrofiber	Turn 9 Studios	8.5	8.4
Ship Simulator 2	Yson	Giraffe Tongue	7.3	7.6
Call of Honor	Art of Electro	Anvil & Hammer	6.8	6.8
Bridges	Kamino	Toroto Productions	9.6	9.3
*/

SELECT AVG(users_rating) AS "User Rating", AVG(critics_rating) AS "Critics Rating" FROM games
WHERE users_rating >= 8 AND critics_rating >= 8;
