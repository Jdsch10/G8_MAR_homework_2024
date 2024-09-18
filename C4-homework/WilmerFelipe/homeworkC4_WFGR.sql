-- Crear tabla Author
CREATE TABLE Author (
    Author_ID INTEGER PRIMARY KEY,
    Name VARCHAR(100),
    Nationality VARCHAR(50)
);

-- Insertar datos en Author
INSERT INTO Author (Author_ID, Name, Nationality) VALUES
(1, 'George Orwell', 'British'),
(2, 'Jane Austen', 'British'),
(3, 'Mark Twain', 'American'),
(4, 'J.K. Rowling', 'British'),
(5, 'J.R.R. Tolkien', 'British');

-- Crear tabla Publisher
CREATE TABLE Publisher (
    Publisher_ID INTEGER PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50)
);

-- Insertar datos en Publisher
INSERT INTO Publisher (Publisher_ID, Name, Country) VALUES
(1, 'Penguin Books', 'United Kingdom'),
(2, 'Oxford University Press', 'United Kingdom'),
(3, 'HarperCollins', 'United States');

-- Crear tabla Book
CREATE TABLE Book (
    Book_ID INTEGER PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    Publication_Year INTEGER,
    Publisher_ID INTEGER,
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID)
);

-- Insertar datos en Book
INSERT INTO Book (Book_ID, Title, Genre, Publication_Year, Publisher_ID) VALUES
(1, '1984', 'Dystopian', 1949, 1),
(2, 'Pride and Prejudice', 'Romance', 1813, 2),
(3, 'Adventures of Huckleberry Finn', 'Adventure', 1884, 3),
(4, 'Harry Potter and the Philosopher''s Stone', 'Fantasy', 1997, 1),
(5, 'The Hobbit', 'Fantasy', 1937, 1);

-- Crear tabla Book_Author (relación muchos a muchos entre Book y Author)
CREATE TABLE Book_Author (
    Book_ID INTEGER,
    Author_ID INTEGER,
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID),
    PRIMARY KEY (Book_ID, Author_ID)
);

-- Insertar datos en Book_Author
INSERT INTO Book_Author (Book_ID, Author_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(4, 1), -- George Orwell también es coautor de "Harry Potter and the Philosopher's Stone"
(5, 2); -- Jane Austen también es coautora de "The Hobbit"





-- ********** Punto 1 ********************

-- *** Reporte 1:
SELECT * FROM BOOK
	WHERE publisher_id IN (
		SELECT publisher_id FROM Publisher
			WHERE name = 'Penguin Books'
); -- id =1


-- *** Reporte 2:
SELECT * FROM BOOK
WHERE Publication_Year > 1950;

SELECT * FROM Author

-- *** Reporte 3:
SELECT * FROM BOOK WHERE Genre = 'Fantasy';  --book_id (4-5)
SELECT Author_ID FROM Book_Author WHERE Book_ID IN (4,5);   -- Author_ID (1,2,4,5)
SELECT name FROM Author WHERE Author_ID IN (1,2,4,5);


SELECT name FROM Author 
WHERE Author_ID IN (
	SELECT Author_ID FROM Book_Author 
	WHERE Book_ID IN (
		SELECT Book_ID FROM BOOK 
		WHERE Genre = 'Fantasy'
	)
);

-- *** Reporte 4:
SELECT title FROM BOOK

SELECT * FROM Author WHERE name LIKE '%J.K%';  -- Author_ID 4
SELECT book_ID FROM Book_Author WHERE Author_ID IN (4);  -- book_ID 4
SELECT title FROM BOOK WHERE book_ID IN (4);

SELECT title FROM BOOK 
WHERE book_ID IN (
	SELECT book_ID FROM Book_Author 
	WHERE Author_ID IN (
		SELECT Author_ID FROM Author 
		WHERE name LIKE '%J.K%'
	)
);


-- *** Reporte 5:
SELECT title FROM BOOK 
WHERE book_ID IN (
	SELECT book_ID FROM Book_Author 
	WHERE Author_ID IN (
		SELECT Author_ID FROM Author 
		WHERE nationality LIKE 'British'
	)
);


-- ********** Punto 2 ********************

SELECT * FROM BOOK;

UPDATE BOOK
	SET genre = 'Science Fiction'	-- Before genre -> 'Dystopian'
	WHERE book_id = 1;



UPDATE Author
	SET Nationality = 'Canadian'	-- Before genre -> 'American'
	WHERE Author_ID = 1;



-- ********** Punto 3 ********************

SELECT * FROM BOOK WHERE title = 'Pride and Prejudice';

SELECT * FROM Book_Author

-- Desasociar las conexiones del libro 'Pride and Prejudice' hacia los autores

DELETE FROM Book_Author
WHERE book_id = 2;

-- Delete el libro
DELETE FROM BOOK
WHERE title = 'Pride and Prejudice';

--Eliminar los autores que no han escrito ningún libro.

SELECT * FROM Author
WHERE author_id IN (
	SELECT author_id FROM Book_Author
	WHERE  author_id IS NOT NULL
);


SELECT * FROM Book_Author
SELECT * FROM Book_Author WHERE author_id IS NOT NULL

SELECT * FROM Author
LEFT JOIN Book_Author
ON Author.author_id = Book_Author.author_id;

-- Todos los autores han escrito libros. Por lo tanto, no se eliminaran autores

DELETE FROM Author
WHERE Author_ID = 'x';