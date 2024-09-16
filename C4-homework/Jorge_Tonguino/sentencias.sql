-- Tarea de clase 4 

-- Primer punto, contenido de la tabla book
SELECT * FROM Book;
SELECT * FROM Author;
SELECT * FROM Publisher;
SELECT * FROM Book_Author;

-- Apoyo a practica de busque en like
-- Seleccionando el géneros que comienza con la letra 'R' con el operador LIKE
SELECT Genre
FROM Book
WHERE Genre LIKE 'A%'; -- resultado === Adventure


-- Sugundo punto fitro el año 1849 -- 1849
SELECT title FROM Book
WHERE publication_year > 1849;

-- Aprote de apoyo segundo punto filtro 1949, 1884.
SELECT title, publication_year
FROM Book
WHERE publication_year > 1813;


-- Punto 3  utilizando una subconsulta para los Autores que escribieron el romance.
SELECT Author_name
FROM Author
WHERE Author_id IN (
    SELECT DISTINCT Author_id
    FROM Book
    WHERE Genre = 'Romance'
);

--punto cuatro de la tarea filtrar nombres de liboros
SELECT Title 
FROM Book
WHERE Book_id IN (
    SELECT Author_id 
    FROM Author
    WHERE Author_name LIKE 'P%'
);

-- Verificar IDs de autores cuyos nombres comienzan con 'G' 
SELECT Author_Name
FROM Author
WHERE Author_name LIKE 'G%'; -- = George Orwell

-- Selecciona los títulos de los libros escritos por autores cuyos nombres comienzan con 'J' 
-- u cualquier otra letra de preferencia
SELECT Title FROM Book;
SELECT Book_id FROM Book_Author;

SELECT Title
FROM Book
WHERE Book_id IN (
    SELECT Book_id
    FROM Book_Author
    WHERE Author_id IN (
        SELECT Author_id
        FROM Author
        WHERE Author_name LIKE 'J%'
    )
);

-- Punto opcional Seleccionar los títulos de los libros escritos por autores británicos
SELECT Title FROM Book;
SELECT Book_id FROM Book_Author;
SELECT Author_id FROM Author;

SELECT Title
FROM Book
WHERE Book_id IN (
    SELECT Book_id
    FROM Book_Author
    WHERE Author_id IN (
        SELECT Author_id
        FROM Author
        WHERE Nationality = 'British'
    )
);
-- Actualizado el género del libro '1984' a 'Ciencia ficción'.
UPDATE Book 
SET Genre = 'Ciencia ficción' -- modificado
WHERE Title = '1984';

SELECT * FROM Book; -- ver resultado

-- Su Nacioalidad Mark Twain ahora es = Canadience

UPDATE Author 
SET Nationality = 'Canadiense'
WHERE Author_name = 'Mark Twain';

SELECT * FROM Author;

-- Eliminar "Pride and Prejudice"
-- aqui voy a liminar relciones que puedan aver.
DELETE FROM Book_Author
WHERE Book_id IN (
	SELECT bOOK_id
	FROM Book 
WHERE Title = 'Pride and Prejudice'
);

-- Eliminacion del libro Orgullo y Prejuicio
DELETE FROM Book
WHERE Title = 'Pride and Prejudice';

SELECT * FROM Book;

-- Resuelto satisfactoriamente.
