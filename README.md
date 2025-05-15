# Bookstore SQL Project

## Overview

This project demonstrates a complete relational database design and querying for a bookstore management system. It covers creating tables, establishing relationships, and writing SQL queries to analyze and retrieve meaningful business insights.

---

## Database Schema

The database consists of three main tables:

- **Books**: Stores book details such as title, author, genre, publication year, price, and stock.
- **Customers**: Contains customer information including name, email, phone, city, and country.
- **Orders**: Records customer orders, linking customers and books with order date, quantity, and total amount.

---

## Features

- Creation of tables with appropriate primary and foreign keys.
- Use of data types like `INT`, `VARCHAR`, `DECIMAL`, and `DATE`.
- Various SQL queries demonstrating:
  - Filtering, aggregation, and grouping.
  - Joins across multiple tables.
  - Advanced queries with subqueries and `HAVING` clauses.
- Calculation of total stock, revenue, top-selling books, customer insights, and more.

---

## Getting Started

1. **Setup the database**

   Run the SQL script `bookstore_database.sql` to create the database, tables, and constraints.

2. **Populate sample data**

   Insert sample records into the tables (you can add your own data or use provided CSV files).

3. **Run queries**

   Use your preferred SQL client to execute queries for analysis and reporting.

---

## Example Queries

- Retrieve all books in the "Fiction" genre.  
- Calculate total revenue generated per month in 2023.  
- Find the most frequently ordered book.  
- List customers who ordered from every genre.  

(See the full SQL script for detailed queries.)

---

## Author

[Unnati Gupta]  

---

## License

This project is open source and free to use.

