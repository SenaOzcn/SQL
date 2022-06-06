/*
The table "books" in the bookstore is defined by the following statement:

CREATE TABLE books (
    id INT,
    title VARCHAR(100),
    author VARCHAR(20),
    rating INTEGER,
    price DECIMAL(10,3),
    quantity INTEGER
);
Write a query that selects id, title, author, rating, and price (keep the order of columns) 
for available (quantity > 0) books with a low (<3) rating and high price (>5). 
These books should probably go on sale!
*/

SELECT
    id,
    title,
    author,
    rating,
    price
FROM
    books
WHERE
    rating < 3
    AND
    price > 5
    AND
    quantity > 0
;
