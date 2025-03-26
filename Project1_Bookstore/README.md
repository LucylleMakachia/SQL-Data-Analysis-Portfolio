# Bookstore Database Project
This project demonstrates the creation of a relational database for a bookstore, designed to handle authors, genres, books, publishers, clients, and sales. Below is a summary of the database structure and key functionality:

## Database Structure
### Tables:

1. authors: Stores information about authors, including name, gender, biography, and birthdate.

2. genres: Manages book categories such as fantasy, historical fiction, etc.

3. books: Contains details about books, including title, price, stock, rating, and foreign keys for authors, genres, and publishers.

4. publishers: Holds publisher details, such as name, contact information, and address.

5. clients: Tracks client information, including name, email, phone, and address.

6. sales: Records sales transactions with book details, clients, quantity sold, total price, and dates.

### Key Features
Data Relationships:
1. Foreign keys connect books with authors, genres, and publishers, ensuring referential integrity.

2. sales table ties books, clients, authors, and publishers to track transactions comprehensively.

Data Insertion: Pre-populated tables with sample data for authors, genres, books, publishers, clients, and sales.

### Sample Queries:

Find the top-selling book:
sql
  SELECT b.title, SUM(s.quantity) AS total_sold
  FROM books b
  INNER JOIN sales s ON b.book_id = s.book_id
  GROUP BY b.title
  ORDER BY total_sold DESC
  LIMIT 1;

View books by a specific author (e.g., Chimamanda Ngozi Adichie):
sql
  SELECT b.title, b.published_date, g.genre_name, b.price
  FROM books b
  INNER JOIN authors a ON b.author_id = a.author_id
  INNER JOIN genres g ON b.genre_id = g.genre_id
  WHERE a.name = 'Chimamanda Ngozi Adichie';

Calculate total sales revenue:
sql
  SELECT SUM(total_price) AS total_revenue FROM sales;

Determine total books sold by genre:
sql
  SELECT g.genre_name, SUM(s.quantity) AS total_sold
  FROM genres g
  INNER JOIN books b ON g.genre_id = b.genre_id
  INNER JOIN sales s ON b.book_id = s.book_id
  GROUP BY g.genre_name
  ORDER BY total_sold DESC;
  
View total spending per client:
sql
  SELECT c.name, SUM(s.total_price) AS total_spent
  FROM clients c
  JOIN sales s ON c.client_id = s.client_id
  GROUP BY c.name
  ORDER BY total_spent DESC;

### How to Use: 
1. Execute the provided CREATE statements to build the database structure.

2. Populate the tables using the INSERT statements.

3. Run the sample queries to explore and analyze the dataset.

This project showcases the integration of a bookstore's key operations into a structured, queryable database for effective data management and analysis.
