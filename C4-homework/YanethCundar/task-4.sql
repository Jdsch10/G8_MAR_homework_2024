-- Punto 1



/*Reporte 1: Seleccionar todos los libros publicados por 'Penguin Books'.*/

SELECT * FROM book
	where publisher_id = ( 
		SELECT publisher_id FROM publisher
		WHERE name like  'Penguin Books'
	) ;




/*Reporte 2: Seleccionar todos los libros publicados después del año 1950.*/
SELECT title, publication_year FROM book
	WHERE publication_year > 1950;



/*Reporte 3: Seleccionar los nombres de los autores que han escrito libros de género 'Fantasy' utilizando una subconsulta.*/


SELECT * FROM author; 
SELECT * FROM book; 


/* aqui busco donde esta fantasy*/

SELECT book_id FROM book
	WHERE genre = 'Fantasy';

/*aqui busco el id_del autor*/

SELECT * FROM book_author
	where book_id in (4,5) ;

SELECT * FROM author
 where author_id IN (
	SELECT author_id FROM book_author
		WHERE book_id IN (
			SELECT book_id FROM book
			where genre = 'Fantasy'
 )
);

/*Reporte 4: Seleccionar los títulos de los libros escritos por autores cuyo nombre contiene 'J.K.' utilizando una subconsulta.*/

-- Primero, seleccionamos los autores cuyo nombre contiene 'J.K'
SELECT author_id FROM author
WHERE name LIKE '%J.K%';

-- Luego, usamos esos author_id para encontrar los book_id correspondientes en la tabla book_author
SELECT book_id FROM book_author
WHERE author_id IN (
    SELECT author_id FROM author
    WHERE name LIKE '%J.K%'
);

-- Finalmente, seleccionamos los libros usando los book_id obtenidos
SELECT * FROM book
WHERE book_id IN (
    SELECT book_id FROM book_author
    WHERE author_id IN (
        SELECT author_id FROM author
        WHERE name LIKE '%J.K%'
    )
);
/*(Opcional) Reporte 5: Utilizando una subconsulta, seleccionar los títulos de los libros 
escritos por autores británicos.*/


select * from author;
select * from publisher;
select * from book;
select * from book_author;

-- Primero, seleccionamos los autores britanicos'
SELECT * FROM author
WHERE nationality LIKE 'British';

-- Luego, usamos esos author_id para encontrar los book_id correspondientes en la tabla book_author
SELECT book_id FROM book_author
WHERE author_id IN (
    SELECT author_id FROM author
    WHERE nationality = 'British'
);

-- Finalmente, seleccionamos los libros usando los book_id obtenidos
SELECT * FROM book
WHERE book_id IN (
	SELECT book_id FROM book_author
WHERE author_id IN (
    SELECT author_id FROM author
    WHERE nationality = 'British'
   )
);



SELECT * FROM book
WHERE book_id IN (
    SELECT book_id FROM book_author
    WHERE author_id IN (
        SELECT author_id FROM author
        WHERE nationality = 'British'
    )
);


/*Punto 2: Modificar Información con UPDATE*/

/*Actualizar el género del libro '1984' a 'Science Fiction'.*/

SELECT * FROM book;

UPDATE Book
SET Genre = 'Science Fiction'
WHERE Title = '1984';

/*otra opcion de hacerlo.*/

UPDATE Book
SET Genre = 'Science Fiction'
WHERE book_id = 1;

/*Cambiar la nacionalidad de 'Mark Twain' a 'Canadian'.*/

SELECT * FROM author; 

UPDATE author
SET nationality= 'Canadian'
WHERE name = 'Mark Twain';

/*otra opcion de hacerlo.*/

UPDATE author
SET nationality= 'Canadian'
WHERE author_id = 3;



/*Punto 3: Eliminar Información con DELETE*/

SELECT * FROM Book;
SELECT * FROM book_author;

DELETE FROM book_author
WHERE book_id = 2;

DELETE FROM Book
WHERE Book_ID = 2;


SELECT * FROM author;

SELECT * FROM Book;

SELECT * FROM book_author;

/*Eliminar los autores que no han escrito ningún libro.*/

-- Selecciona los Author_ID de la tabla Author que no están en la tabla Book_Author
SELECT Author_ID
FROM Author
WHERE Author_ID NOT IN (SELECT DISTINCT Author_ID FROM Book_Author);

-- Elimina los autores de la tabla Author que no tienen libros asociados en la tabla Book_Author
DELETE FROM Author
WHERE Author_ID NOT IN (SELECT DISTINCT Author_ID FROM Book_Author);