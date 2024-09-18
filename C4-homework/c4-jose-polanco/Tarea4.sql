-- Reporte 1: Seleccionar todos los libros publicados por 'Penguin Books'.
select * from Book
where Publisher_ID in
(
	select Publisher_ID
	from Publisher
	where Name='Penguin Books'
);

-- Reporte 2: Seleccionar todos los libros publicados después del año 1950.
select * from Book where Publication_Year >= 1950;

-- Reporte 3: Seleccionar los nombres de los autores que han escrito libros de género 'Fantasy' utilizando una subconsulta.
select * from Author 
where Author_ID in 
    (
        select author_id from Book_Author
        where book_id in
            (
                select book_id from Book 
                where genre like '%Fantasy%'

            )
    );

-- Reporte 4: Seleccionar los títulos de los libros escritos por autores cuyo nombre contiene 'J.K.' utilizando una subconsulta.
select * from Book 
where book_id in 
    (
        select book_id from Book_Author
        where author_id in
        (
            select author_id from Author 
            where Name like '%J.K.%'
        )
    );

-- (Opcional) Reporte 5: Utilizando una subconsulta, seleccionar los títulos de los libros escritos por autores británicos.
select * from Book 
where book_id in 
    (
        select book_id from Book_Author
        where author_id in
        (
            select author_id from Author 
            where Nationality like '%British%'
        )
    );


-- Punto 2: Modificar Información con UPDATE
-- Actualizar el género del libro '1984' a 'Science Fiction'.

UPDATE book
SET genre = 'Science Fiction'
WHERE Title = '1984';

-- Cambiar la nacionalidad de 'Mark Twain' a 'Canadian'.

UPDATE author
SET Nationality = 'Canadian'
WHERE Name = 'Mark Twain';

-- Punto 3: Eliminar Información con DELETE
-- Eliminar el libro 'Pride and Prejudice' de la base de datos.

DELETE FROM book
WHERE title = 'Pride and Prejudice';

-- En teoria esta sentencia borraria el libro, pero este libro esta en una tabla de detalle por lo tanto no se recomienda borrar este libro si no crear un campo estado en libro para inactivarlo o no mostrarlo.

-- Eliminar los autores que no han escrito ningún libro.
DELETE FROM Author
WHERE Author_id = 
(
    SELECT a.author_id
    FROM Author a
    LEFT JOIN Book_Author ba ON a.Author_ID = ba.Author_ID
    WHERE ba.Author_ID IS NULL
);



