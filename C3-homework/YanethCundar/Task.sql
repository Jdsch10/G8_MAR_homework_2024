CREATE TABLE Author (
Author_ID INT PRIMARY KEY, 
fullname VARCHAR(100)NOT NULL,
Nationality VARCHAR (50)
);

SELECT * FROM Author;

CREATE TABLE Publisher (
Publisher_ID INT PRIMARY KEY, 
Fullname VARCHAR(100)NOT NULL,
Country VARCHAR (50)

);

SELECT * FROM Publisher;

CREATE TABLE Book (
Book_ID INT PRIMARY KEY, 
Title VARCHAR(100)NOT NULL,
Genre VARCHAR (50)NOT NULL,
Publication_Year INT
	
);

SELECT * FROM Book;



ALTER TABLE Book
ADD Publisher_ID INT;

SELECT * FROM Book;

ALTER TABLE Book
ADD CONSTRAINT fk_publisher
FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID);

SELECT * FROM Book;


INSERT INTO Book_Author (Author_ID, Book_ID)
VALUES (3, 3);

SELECT * FROM Book_Author;
CREATE TABLE Book_Author(
Author_ID INT,
Book_ID INT,
FOREIGN KEY (Author_ID) REFERENCES Author (Author_ID),
FOREIGN KEY (Book_ID) REFERENCES Book (Book_ID)
);

SELECT * FROM Book_Author;


SELECT * FROM Author;
INSERT INTO Author(
Author_ID, fullname, Nationality)
VALUES(
3,
'Mark Twain',
'American'
);

SELECT * FROM Author;

INSERT INTO Publisher(
Publisher_ID, Fullname, Country)
VALUES(
2,
'Oxford University Press',
'United Kingdom'
)
;

SELECT * FROM Publisher;


INSERT INTO Book(
Book_ID, Title, Genre, Publication_Year, Publisher_ID)
VALUES(
1,
'1984',
'Dystopian',
'1949',
2
);
SELECT * FROM Book;

INSERT INTO Book_Author (Author_ID, Book_ID)
VALUES (3, 1);

SELECT * FROM Book_Author;
