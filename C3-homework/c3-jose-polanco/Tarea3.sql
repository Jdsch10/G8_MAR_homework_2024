CREATE TABLE IF NOT EXISTS tbAuthor (
	author_ID integer PRIMARY KEY,
	name varchar(100) NOT NULL,
	nationality integer NOT NULL,
);

INSERT INTO tbAuthor (author_ID, name, nationality) VALUES
(1, "George Orwell", "British"),
(2, "Jane Austen", "British"),
(3, "Mark Twain", 'American');

-- Tabla contiene la llave foranea de Publisher
CREATE TABLE IF NOT EXISTS tbBook (
	book_ID integer PRIMARY KEY,
	title varchar(100) NOT NULL,
	genre varchar(50) NOT NULL,
    publication_Year integer,
    publisher_ID integer,
    FOREIGN KEY (publisher_ID) REFERENCES tbPublisher(publisher_ID),
);

INSERT INTO tbBook (book_ID, title, genre, publication_Year, publisher_ID) VALUES
(1, "1984", "Dystopian", 1949, 1),
(2, "Pride and Prejudice", "Romance", 1813, 2),
(3, "Adventures of Huckleberry Finn", 'Adventure', 1884, 1);

CREATE TABLE IF NOT EXISTS tbPublisher (
	publisher_ID integer PRIMARY KEY,
	name varchar(100) NOT NULL,
	country varchar(100) NOT NULL
);

INSERT INTO tbPublisher (publisher_ID, name, country) VALUES
(1, "Penguin Books", "United Kingdom"),
(2, "Oxford University Press", "United Kingdom");

-- Tabla detalle libros y autores
CREATE TABLE tbBook_Author (
    book_ID INTEGER,
    author_ID INTEGER,
    FOREIGN KEY (book_ID) REFERENCES tbBook(book_ID),
    FOREIGN KEY (author_ID) REFERENCES tbAuthor(author_ID),
    PRIMARY KEY (book_ID, author_ID)
);

INSERT INTO tbBook_Author (book_ID, author_ID) VALUES
(1, 1),
(2, 2),
(3, 3);