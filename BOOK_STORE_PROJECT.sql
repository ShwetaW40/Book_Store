CREATE DATABASE BOOK_STORE;

USE BOOK_STORE;

-- Basic Queries
-- 1) Retrieve all books in the "Fiction" genre

SELECT * FROM BOOKS
WHERE GENRE = 'FICTION';

-- 2) Find books published after the year 1950

SELECT * FROM BOOKS
WHERE Published_Year > 1950;


-- 3) List all customers from the Canada

SELECT * FROM CUSTOMERS
WHERE COUNTRY = 'CANADA';

 

-- 4) Show orders placed in November 2023

SELECT * FROM ORDERS
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';


-- 5) Retrieve the total stock of books available

SELECT sum(STOCK) AS TOTAL_STOCK FROM BOOKS;

-- 6) Find the details of the most expensive book

SELECT * FROM BOOKS
ORDER BY PRICE DESC
LIMIT 1;


-- 7) Show all customers who ordered more than 1 quantity of a book

SELECT C.Name,	C.Email,	C.Phone,	C.City,	 C.Country, O.QUANTITY FROM CUSTOMERS AS C
RIGHT JOIN ORDERS AS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.QUANTITY > 1;


-- 8) Retrieve all orders where the total amount exceeds $20

SELECT B.Book_ID,	B.Title	Author,	 B.Genre,	B.Published_Year,	B.Price,  B.Stock, O.Total_Amount FROM BOOKS AS B
LEFT JOIN ORDERS AS O ON B.BOOK_ID = O.BOOK_ID
WHERE O.TOTAL_AMOUNT > 20;



-- 9) List all genres available in the Books table

SELECT Genre FROM BOOKS
GROUP BY GENRE;



-- 10) Find the book with the lowest stock
SELECT * FROM BOOKS
ORDER BY STOCK;


-- 11) Calculate the total revenue generated from all orders

SELECT SUM(tOTAL_AMOUNT) AS TOTAL_REVENUE FROM ORDERS;



-- Advance Queries
-- 1) Retrieve the total number of books sold for each genre

SELECT B.GENRE, SUM(O.QUANTITY) FROM ORDERS AS O
LEFT JOIN BOOKS AS B ON B.BOOK_ID = O.BOOK_ID
GROUP BY GENRE;


-- 2) Find the average price of books in the "Fantasy" genre

SELECT AVG(PRICE) AS AVERAGE_PRICE
FROM BOOKS
WHERE GENRE = 'FANTASY';



-- 3) List customers who have placed at least 2 orders

SELECT C.Name,	 C.Email,	C.Phone,	C.City,	 C.Country, O.QUANTITY FROM CUSTOMERS AS C
LEFT JOIN ORDERS AS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.QUANTITY > 2;
 



-- 4) Find the most frequently ordered book

SELECT B.BOOK_ID, B.TITLE, COUNT(O.ORDER_ID) AS FREQUENTLY_ORDERED FROM BOOKS AS B
LEFT JOIN ORDERS AS O ON O.BOOK_ID = B.BOOK_ID
GROUP BY B.BOOK_ID, B.TITLE
ORDER BY FREQUENTLY_ORDERED DESC LIMIT 1;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre

SELECT * FROM BOOKS
WHERE GENRE = 'FANTASY'
ORDER BY PRICE DESC
LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author

SELECT B.AUTHOR, SUM(O.QUANTITY) AS TOTAL_QUANTITY FROM BOOKS AS B
LEFT JOIN ORDERS AS O ON B.BOOK_ID = O.bOOK_ID
GROUP BY B.AUTHOR;


-- 7) List the cities where customers who spent over $30 are located

SELECT C.CITY, C.NAME, O.TOTAL_AMOUNT FROM CUSTOMERS AS C
LEFT JOIN ORDERS AS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.TOTAL_AMOUNT > 30;


-- 8) Find the customer who spent the most on orders

SELECT C.CITY, C.NAME, O.TOTAL_AMOUNT FROM CUSTOMERS AS C
LEFT JOIN ORDERS AS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
ORDER BY O.TOTAL_AMOUNT DESC


-- 9) Calculate the stock remaining after fulfilling all orders

SELECT  B.BOOK_ID, B.TITLE,  B.STOCK, B.STOCK - O.QUANTITY AS REMAINING FROM BOOKS AS B
LEFT JOIN ORDERS AS O ON B.BOOK_ID = O.BOOK_ID;





