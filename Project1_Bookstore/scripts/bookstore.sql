CREATE DATABASE bookstore;
USE bookstore;

-- Authors Table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender VARCHAR(25) NOT NULL,
    bio TEXT,
    birth_date DATE
);

-- Genres Table
CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);

-- Book Table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT,
    genre_id INT,
    publisher_id INT,
    sypnopsis VARCHAR(250),
    rating DECIMAL(5 , 2 ),
    price DECIMAL(10 , 2 ) NOT NULL,
    stock INT DEFAULT 0,
    published_date DATE,
    FOREIGN KEY (author_id)
        REFERENCES authors (author_id),
    FOREIGN KEY (genre_id)
        REFERENCES genres (genre_id),
	FOREIGN KEY (publisher_id)
		REFERENCES publishers (publisher_id)
);

-- Publishers Table
CREATE TABLE publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(250),
    email VARCHAR(250),
    phone VARCHAR(15),
    address VARCHAR(250)
);

-- Client Table
CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(250)
);

-- Sales Table
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    author_id INT,
    publisher_id INT,
    client_id INT,
    sale_date DATE,
    quantity INT,
    total_price DECIMAL(10 , 2 ),
    FOREIGN KEY (book_id)
        REFERENCES books (book_id),
    FOREIGN KEY (client_id)
        REFERENCES clients (client_id),
	FOREIGN KEY (author_id)
        REFERENCES authors (author_id),
	FOREIGN KEY (publisher_id)
		REFERENCES publishers (publisher_id)
);

-- Fill Authors Table
INSERT INTO authors (name, gender, bio, birth_date)
VALUES 
('Chinua Achebe', 'Male', 'Nigerian writer, acclaimed for his novel Things Fall Apart', '1930-11-16'),
('Chimamanda Ngozi Adichie', 'Female', 'Nigerian author known for her novels Half of a Yellow Sun and Americanah', '1977-09-15'),
('Ngũgĩ wa Thiong\'o', 'Male', 'Kenyan novelist and theorist of postcolonial literature', '1938-01-05'),
('Ben Okri', 'Male', 'Nigerian author, Booker Prize winner for The Famished Road', '1959-03-15'),
('Mariama Bâ', 'Female', 'Senegalese author, known for So Long a Letter', '1929-04-17'),
('Wole Soyinka', 'Male', 'Nigerian playwright and poet, first African Nobel laureate in literature', '1934-07-13'),
('Maaza Mengiste', 'Female', 'Ethiopian novelist, author of The Shadow King', '1971-01-01'),
('Bessie Head', 'Female', 'Botswana-based South African writer, author of When Rain Clouds Gather', '1937-07-06'),
('Ishmael Beah', 'Male', 'Sierra Leonean author and activist, known for his memoir A Long Way Gone', '1980-11-23'),
('Yaa Gyasi', 'Female', 'Ghanaian-American author of the acclaimed novel Homegoing', '1989-01-01');

-- Fill Genres Table
INSERT INTO genres (genre_name)
VALUES 
('Fantasy'),
('Science Fiction'),
('Mystery'),
('Horror'),
('Literary Fiction'),
('Biography'),
('Historical Fiction'),
('Adventure'),
('Romance'),
('Thriller');

-- Fill Books Table
INSERT INTO books (title, author_id, genre_id, price, stock, published_date)
VALUES 
('Things Fall Apart', 1, 5, 20.99, 40, '1958-06-17'), 
('Half of a Yellow Sun', 2, 7, 22.99, 25, '2006-09-12'), 
('The Famished Road', 3, 1, 24.99, 15, '1991-10-14'), 
('The Shadow King', 4, 7, 23.99, 18, '2019-09-24'),
('So Long a Letter', 5, 9, 18.99, 30, '1979-01-01'), 
('Decolonising the Mind', 6, 6, 21.99, 12, '1986-01-01'), 
('When Rain Clouds Gather', 7, 5, 18.99, 25, '1969-01-01'), 
('A Long Way Gone', 8, 6, 19.99, 20, '2007-02-13'), 
('Petals of Blood', 6, 7, 20.99, 22, '1977-01-01'), 
('Homegoing', 9, 7, 23.99, 18, '2016-06-07'); 

-- Fill Publishers Table
INSERT INTO publishers (publisher_name, email, phone, address)
VALUES 
('Heinemann Publishers', 'support@heinemann.com', '+44 20 555 6789', '1 George Street, London, UK'), -- Published Chinua Achebe's "Things Fall Apart"
('Cassava Republic Press', 'contact@cassavarepublic.biz', '+234 803 456 7890', '15 Adebayo Doherty Rd, Lagos, Nigeria'), -- Published Chimamanda Ngozi Adichie's works
('Penguin Random House', 'info@penguinrandomhouse.com', '+1 212 555 1234', '1745 Broadway, New York, USA'), -- Published Ben Okri's "The Famished Road"
('Kwela Books', 'info@kwelabooks.co.za', '+27 21 555 1234', '10 Roeland Street, Cape Town, South Africa'), -- Published Bessie Head's "When Rain Clouds Gather"
('East African Educational Publishers', 'support@eaepublishers.com', '+254 722 555 678', 'Kijabe Street, Nairobi, Kenya'), -- Published Ngũgĩ wa Thiong\'o's works
('Wits University Press', 'info@witspress.co.za', '+27 11 717 1234', '1 Jan Smuts Ave, Johannesburg, South Africa'), -- Published Maaza Mengiste's "The Shadow King"
('Jacana Media', 'info@jacana.co.za', '+27 12 555 5678', '16 Main Road, Johannesburg, South Africa'), -- Published Yaa Gyasi's "Homegoing"
('Shama Books', 'contact@shamabooks.com', '+251 11 555 2345', 'Bole Sub City, Addis Ababa, Ethiopia'), -- Published Mariama Bâ's "So Long a Letter"
('African Writers Press', 'contact@africanwriterspress.org', '+233 302 789 456', 'Independence Avenue, Accra, Ghana'), -- Published works by Ishmael Beah
('Longhorn Publishers', 'sales@longhornpublishers.com', '+254 20 555 4321', 'Biashara Street, Nairobi, Kenya'); -- Published Ngũgĩ wa Thiong\'o's "Decolonising the Mind"

-- Fill Clients Table
INSERT INTO clients (name, email, phone, address)
VALUES 
('Alice Kimathi', 'alicekimathi@mail.com', '+254 754189123', 'Kiambu, KEN'),
('Phillip Wekesa', 'phillip.wekesa@yahoo.com', '+254 745682609', 'Kakamega, KEN'),
('Mildred Otieno', 'mildred.o@hotmail.com', '+254 788560368', 'Kisumu, KEN'),
('Elvis Kiprop', 'elvis.kip@gmail.com', '+254 786792365', 'Narok, KEN'),
('Amina Mohammed', 'amina.m@hotmail.com', '+254 707418563', 'Kiifi, KEN'),
('Faith Njoroge', 'faith.njoroge@mail.com', '+254 729301234', 'Nairobi, KEN'),
('Kevin Ouma', 'kevin.ouma@yahoo.com', '+254 711452309', 'Kisii, KEN'),
('Grace Kilonzo', 'grace.k@hotmail.com', '+254 723987654', 'Machakos, KEN'),
('Brian Mutua', 'brian.mutua@gmail.com', '+254 745876542', 'Mombasa, KEN'),
('Esther Wakio', 'esther.wakio@mail.co.ke', '+254 707564839', 'Eldoret, KEN');

-- Fill Sales Table
INSERT INTO sales (book_id, client_id, sale_date, quantity, total_price)
VALUES 
(1, 1, '2025-03-20', 2, 51.98),  
(2, 2, '2025-03-21', 1, 29.99),  
(3, 3, '2025-03-22', 3, 59.97),  
(4, 4, '2025-03-23', 2, 49.98),  
(5, 5, '2025-03-24', 1, 22.99),  
(6, 1, '2025-03-25', 1, 24.99),  
(7, 2, '2025-03-26', 2, 43.98),  
(8, 3, '2025-03-27', 1, 19.99),  
(9, 4, '2025-03-28', 2, 46.98),  
(10, 5, '2025-03-29', 1, 23.99); 

-- View Top-Selling book
SELECT b.title, SUM(s.quantity) AS total_sold
FROM books b
JOIN sales s ON b.book_id = s.book_id
GROUP BY b.title
ORDER BY total_sold DESC
LIMIT 1;

 -- View books by Chimamanda Ngozi Adichie
SELECT b.title, b.published_date, g.genre_name, b.price
FROM books b
JOIN authors a ON b.author_id = a.author_id
JOIN genres g ON b.genre_id = g.genre_id
WHERE a.name = 'Chimamanda Ngozi Adichie';

-- View Total Sales Revenue
SELECT SUM(total_price) AS total_revenue
FROM sales;

-- View Total Number of Books Sold per Genre
SELECT g.genre_name, SUM(s.quantity) AS total_sold
FROM genres g
JOIN books b ON g.genre_id = b.genre_id
JOIN sales s ON b.book_id = s.book_id
GROUP BY g.genre_name
ORDER BY total_sold DESC;

-- View Total Amount Spent Per Client
SELECT c.name, SUM(s.total_price) AS total_spent
FROM clients c
JOIN sales s ON c.client_id = s.client_id
GROUP BY c.name
ORDER BY total_spent DESC;

