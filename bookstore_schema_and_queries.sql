-- Create database
CREATE DATABASE IF NOT EXISTS bookstore;
USE bookstore;

-- Books table
CREATE TABLE Books (
    Book_ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price DECIMAL(10, 2),
    Stock INT
);

-- Customers table
CREATE TABLE Customers (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

-- Orders table
CREATE TABLE Orders (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

-- Viewing Data
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- 1) Retrieve all books in the "Fiction" genre:
SELECT * FROM Books 
WHERE Genre = "Fiction";

-- 2) Find books published after the year 1950:
SELECT * FROM Books 
WHERE Published_Year > 1950;

-- 3) List all customers from the Canada:
SELECT * FROM Customers 
WHERE Country = "Canada";

-- 4) Show orders placed in November 2023:
SELECT * FROM Orders 
WHERE YEAR(Order_Date) = 2023 AND MONTH(Order_Date) = 11;

-- 5) Retrieve the total stock of books available:
SELECT SUM(Stock) AS TOTAL_BOOKS
FROM Books;

-- 6) Find the details of the most expensive book:
SELECT * FROM Books 
WHERE Price = (SELECT MAX(Price) FROM Books);

-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT * FROM Orders 
WHERE Quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM Orders 
WHERE Total_Amount > 20;

-- 9) List all genres available in the Books table:
SELECT DISTINCT(Genre) AS Genres 
FROM Books;

-- 10) Find the book with the lowest stock:
SELECT * FROM Books
ORDER BY Stock
LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(Total_Amount) AS REVENUE
FROM Orders;

-- 12) Retrieve the total number of books sold for each genre:
SELECT b.Genre, SUM(o.Quantity) AS total_books_sold
FROM Orders o 
JOIN Books b ON o.Book_ID = b.Book_ID
GROUP BY b.Genre;

-- 13) Find the average price of books in the "Fantasy" genre:
SELECT AVG(Price) AS AVERAGE_PRICE
FROM Books
WHERE Genre = "Fantasy";

-- 14) List customers who have placed at least 2 orders:
SELECT c.Customer_ID, c.Name, COUNT(o.Order_ID) AS TOTAL_ORDERS
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY o.Customer_ID
HAVING COUNT(o.Order_ID) >= 2;

-- 15) Find the most frequently ordered book:
SELECT b.Book_ID, b.Title, COUNT(o.Book_ID) AS order_count
FROM Books b
JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID
ORDER BY order_count DESC
LIMIT 1;

-- 16) Show the top 3 most expensive books of 'Fantasy' Genre:
SELECT * FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;

-- 17) Retrieve the total quantity of books sold by each author:
SELECT b.Author, SUM(o.Quantity) AS books_sold
FROM Books b
JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Author;

-- 18) List the cities where customers who spent over $30 are located:
SELECT DISTINCT c.City
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.City
HAVING SUM(o.Total_Amount) > 30;

-- 19) Find the customer who spent the most on orders:
SELECT c.Name, SUM(o.Total_Amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Name
ORDER BY total_spent DESC
LIMIT 1;

-- 20) Calculate the stock remaining after fulfilling all orders:
SELECT b.Book_ID, b.Stock, SUM(o.Quantity) AS TOTAL_SOLD, (b.Stock - SUM(o.Quantity)) AS remaining_stock
FROM Books b
JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID;

-- 21) Find the top 3 customers who ordered the highest quantity of books
SELECT c.Name, SUM(o.Quantity) AS Books_Ordered
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Name
ORDER BY Books_Ordered DESC
LIMIT 3;

-- 22) List the genres and average price of books for each genre where average price is above $20

SELECT Genre, AVG(Price) as Average_Price
FROM Books
GROUP BY Genre
HAVING Average_Price > 20;

-- 23) Retrieve customers who have not placed any orders

SELECT c.Customer_ID, c.Name
FROM Customers c
LEFT JOIN Orders o ON c.Customer_ID = o.Customer_ID
WHERE o.Order_ID IS NULL;

-- 24) Show total revenue generated per month in the year 2023

SELECT MONTH(Order_Date) AS month, SUM(Total_Amount) as REVENUE
FROM Orders
WHERE year(Order_Date)=2023
GROUP BY month(Order_Date)
ORDER BY month;

-- 25) Find customers who have ordered books from every genre available in the bookstore.

SELECT c.Customer_ID, c.Name
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN Books b ON o.Book_ID = b.Book_ID
GROUP BY c.Customer_ID, c.Name
HAVING COUNT(DISTINCT b.Genre) = (SELECT COUNT(DISTINCT Genre) FROM Books);



