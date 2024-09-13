CREATE TABLE Authors(
	Name VARCHAR(100),
	Nationality VARCHAR(50),
	Author_ID INTEGER,
	PRIMARY KEY (Author_ID)
);

CREATE TABLE Books(
	Title VARCHAR(100),
	Genre VARCHAR(50),
	Publiation_Year INTEGER,
	Book_ID INTEGER,
	PRIMARY KEY (Book_ID)
);

ALTER TABLE Books 
ADD Publisher_ID INTEGER,
ADD FOREIGN KEY (Publisher_ID) REFERENCES Publishers (Publisher_ID);

ALTER TABLE Books
RENAME COLUMN Publiation_Year TO Publication_Year;

CREATE TABLE Publishers(
	Name VARCHAR(100),
	Country VARCHAR(100),
	Publisher_ID INTEGER,
	PRIMARY KEY (Publisher_ID)
);

CREATE TABLE Books_Authors(
	Book_ID INTEGER NOT NULL,
	Author_ID INTEGER NOT NULL,
	FOREIGN KEY (Book_ID) REFERENCES Books (Book_ID),
	FOREIGN KEY (Author_ID) REFERENCES Authors (Author_ID)
);

INSERT INTO Authors (Author_ID, Name, Nationality)
	VALUES ('1','George Orwell','British'),
		   ('2', 'Jane Austen','British'),
		   ('3', 'Mark Twain','American');

UPDATE Authors
	SET Author_ID = 3
	WHERE Author_ID = '3';

SELECT * FROM Authors;
SELECT * FROM Books;

INSERT INTO Books (Book_ID, Title, Genre, Publication_Year, Publisher_ID)
	VALUES (1,'1984','Dystopian',1949,1),
	 		(2,'Pride and Prejudice','Romance',1813,2),
			 (3,'Adventures of Huckleberry Finn','Adventure',1884,1);

INSERT INTO Publishers (Publisher_ID, Name, Country)
	VALUES (1,'Penguin Books','United Kingdom'),
			 (2,'Oxford University Press','United Kingdom');

SELECT * FROM Publishers;

INSERT INTO Books_Authors (Book_ID, Author_ID)
	VALUES (1,1),
			 (2,2),
			 (3,3);

SELECT * FROM Books_Authors;
