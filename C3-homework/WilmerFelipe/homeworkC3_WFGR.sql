-- Crear tabla Author
CREATE TABLE Author (
    Author_ID INTEGER PRIMARY KEY,
    Name VARCHAR(100),
    Nationality VARCHAR(50)
);

-- Crear tabla Publisher
CREATE TABLE Publisher (
    Publisher_ID INTEGER PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50)
);

-- Crear tabla Book
CREATE TABLE Book (
    Book_ID INTEGER PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    Publication_Year INTEGER,
    Publisher_ID INTEGER,
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID)
);

-- Crear tabla Book_Author relación muchos a muchos entre Book y Author 
CREATE TABLE Book_Author (
    Book_ID INTEGER,
    Author_ID INTEGER,
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID),
    PRIMARY KEY (Book_ID, Author_ID)
);


-- Insertar datos en Author
INSERT INTO Author (Author_ID, Name, Nationality) VALUES
(1, 'Gabriel García Márquez', 'colombian'),
(2, 'Rafael Pombo', 'colombian'),
(3, 'Antoine de Saint-Exupéry', 'french'),
(4, 'Dante Alighieri', 'italian'),
(5, 'Nicolás Maquiavelo', 'italian'),
(6, 'Julio Cortázar', 'argentinian'),
(7, 'Edgar Allan Poe', 'american');

-- Insertar datos en Publisher
INSERT INTO Publisher (Publisher_ID, Name, Country) VALUES
(1, 'Sudamericana', 'Argentina'),
(2, 'La manchita', 'Colombia'),
(3, 'Reynal & Hitchcock', 'France'),
(4, 'Seix Barral', 'Italian'),
(5, 'Alma', 'Italian'),
(7, 'New-York Mirror', 'United States');

-- Insertar datos en Book
INSERT INTO Book (Book_ID, Title, Genre, Publication_Year, Publisher_ID) VALUES
(1, 'Cien años de soledad', 'novel', 1967, 1),
(2, 'El renacuajo paseador', 'children story', 1867, 2),
(3, 'El principito', 'children story', 1943, 3),
(4, 'The Inferno', 'Fiction', 1321, 4),
(5, 'Rayuela', 'novel', 1963, 5),
(6, 'The Inferno', 'Fiction', 1321, 2),
(7, 'El cuervo', 'Poem', 1845, 7);

-- Insertar datos en Book_Author
INSERT INTO Book_Author (Book_ID, Author_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6), 
(7, 7); 


SELECT * FROM Book;
SELECT * FROM Author;