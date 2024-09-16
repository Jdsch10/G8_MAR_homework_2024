CREATE TABLE Author (
    Author_id SERIAL, 
	PRIMARY KEY (Author_id),
    Author_name VARCHAR(100) NOT NULL,
    Nationality VARCHAR(50)
);

CREATE TABLE Book (
    Book_id SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    Publication_year INTEGER
);

CREATE TABLE Publisher(
	Publisher_id SERIAL PRIMARY KEY,
	Publisher_name VARCHAR(100),
	Country VARCHAR(50)
);

CREATE TABLE Book_Author (
	Book_id INTEGER,
	Author_id INTEGER,
	PRIMARY KEY (Book_id, Author_id),
	FOREIGN KEY (Book_id) REFERENCES book(Book_id),
	FOREIGN KEY (Author_id) REFERENCES Author(Author_id)
);

INSERT INTO Author (Author_id, Author_name, Nationality) VALUES
(1, 'George Orwell', 'British'),
(2, 'Jane Austen', 'British'),
(3, 'Mark Twain', 'American');

INSERT INTO Book (Title, Genre, Publication_year, Publisher_id) VALUES
('1984', 'Dystopian', 1949, 1),
('Pride and Prejudice', 'Romance', 1813, 2),
('Adventures of Huckleberry Finn', 'Adventure', 1884, 1);

INSERT INTO Publisher (Publisher_name, Country) VALUES
('Penguin Books', 'United Kingdom'),
('Oxford University Press','United Kingdom');

INSERT INTO Book_Author(Book_id, Author_id) VALUES
(1, 1),
(2, 2),
(3, 3);

SELECT * FROM Book_Author;

/*ADD COLUMN Publisher_ID INTEGER; para integra lineas//