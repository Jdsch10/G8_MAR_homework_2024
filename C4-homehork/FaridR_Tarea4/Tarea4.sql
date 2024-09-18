SELECT * FROM Author;
SELECT * FROM Publisher;
SELECT * FROM Book;
SELECT * FROM Book_Author;
WHERE book_id INCLUDE (4,5);;

-- Punto 1: Generar Reportes con SELECT
-- Reporte 1: Seleccionar todos los libros publicados por 'Penguin Books'

SELECT publisher_id FROM Publisher
WHERE name = 'Penguin Books';

SELECT * FROM Book
WHERE publisher_id = (
SELECT publisher_id FROM Publisher
WHERE name = 'Penguin Books'
);

-- Reporte 2: Seleccionar todos los libros publicados después del año 1950.

SELECT * FROM Book
WHERE publication_year > 1950;

-- Reporte 3: Seleccionar los nombres de los autores que han escrito libros de género 'Fantasy' utilizando una subconsulta

SELECT book_id, publisher_id FROM Book
WHERE genre = 'Fantasy'; -- (4,5), (1,1)

SELECT Author_id FROM Book_Author
WHERE book_id IN (4,5); -- (1,2,4,5)

SELECT name FROM Author
WHERE author_id IN (1,2,4,5);

SELECT name FROM Author
WHERE author_id IN (
	SELECT author_id FROM Book_Author
	WHERE book_id IN (
		SELECT book_id FROM Book
		WHERE genre = 'Fantasy'
	)
);

-- Reporte 4: Seleccionar los títulos de los libros escritos por autores cuyo nombre contiene 'J.K.' utilizando una subconsulta

SELECT author_id FROM Author
WHERE name LIKE '%J.K%'; -- (4)

SELECT book_id FROM Book_Author
WHERE author_id IN (4); -- (4)

SELECT title FROM Book
WHERE book_id IN (4);

SELECT title FROM Book
WHERE book_id IN (
	SELECT book_id FROM Book_Author
	WHERE author_id IN (
		SELECT author_id FROM Author
		WHERE name LIKE '%J.K%'
	)
);

-- Reporte 5: Utilizando una subconsulta, seleccionar los títulos de los libros escritos por autores británicos.

SELECT author_id FROM Author
WHERE nationality = 'British'; -- (1,2,4,5)

SELECT book_id FROM Book_Author
WHERE author_id IN (1,2,4,5); -- (1,2,4,5,4,5)

SELECT title FROM Book
WHERE book_id IN (1,2,4,5,4,5);

SELECT title FROM Book
WHERE book_id IN (
	SELECT book_id FROM Book_Author
	WHERE author_id IN (
		SELECT author_id FROM Author
		WHERE nationality = 'British'
	)
);

-- Punto 2: Modificar Información con UPDATE

-- Actualizar el género del libro '1984' a 'Science Fiction'

UPDATE Book
SET genre = 'Science Fiction'
WHERE title = '1984';

-- Cambiar la nacionalidad de 'Mark Twain' a 'Canadian'

UPDATE Author
SET nationality = 'Canadian'
WHERE name = 'Mark Twain';

-- Punto 3: Eliminar Información con DELETE

-- Eliminar el libro 'Pride and Prejudice' de la base de datos

SELECT book_id FROM Book
WHERE title = 'Pride and Prejudice'; --(2)

SELECT author_id FROM Book_Author
WHERE book_id = 2; -- (2)

DELETE FROM Book_Author
WHERE book_id IN (
	SELECT book_id FROM Book
	WHERE title = 'Pride and Prejudice'
);

DELETE FROM Book
WHERE title = 'Pride and Prejudice';


