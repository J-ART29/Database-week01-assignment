-- Week 1 Database Assignment
-- Topic: Library Management System

CREATE DATABASE library_management;

USE library_management;

-- Authors table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

-- Books table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Members table
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

-- Loans table
CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Insert authors
INSERT INTO authors (name, country)
VALUES
('Chimamanda Ngozi Adichie', 'Nigeria'),
('Ngugi wa Thiong''o', 'Kenya'),
('George Orwell', 'United Kingdom');

-- Insert books
INSERT INTO books (title, author_id, category, price)
VALUES
('Half of a Yellow Sun', 1, 'Fiction', 1500.00),
('Things Fall Apart', 2, 'Literature', 1200.00),
('1984', 3, 'Dystopian', 1000.00);

-- Insert members
INSERT INTO members (name, email, phone)
VALUES
('John Kamau', 'john@example.com', '0712345678'),
('Mary Wanjiku', 'mary@example.com', '0723456789'),
('Peter Otieno', 'peter@example.com', '0734567890');

-- Insert loans
INSERT INTO loans (book_id, member_id, loan_date, return_date)
VALUES
(1, 1, '2026-09-01', '2026-09-15'),
(2, 2, '2026-09-05', NULL),
(3, 3, '2026-09-10', NULL);

-- Display the tables
SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM loans;