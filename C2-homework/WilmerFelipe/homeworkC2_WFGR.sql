FIRST POINT

CREATE TABLE course (
    Course_ID SERIAL PRIMARY KEY,
    Title VARCHAR(50),
    Description VARCHAR(100)
);

CREATE TABLE Student (
    Student_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);


CREATE TABLE Course_Student (
    Course_ID INTEGER,
    Student_ID INTEGER,
    FOREIGN KEY (Course_ID) REFERENCES course(Course_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    PRIMARY KEY (Student_ID, Course_ID)
);



INSERT INTO course (Title, Description) VALUES
('math', 'math course'),
('natural sciences', 'natural sciences course'),
('physical education', 'physical education course'),
('physics', 'physics course'),
('chemistry', 'chemistry course');

SELECT * FROM course;

INSERT INTO Student (Name, Email) VALUES
('Henry Smith', 'HenrySmith@student.com'),
('Mary Johnson', 'MaryJohnson@student.com'),
('Joseph Williams', 'Joseph Williams@student.com'),
('Isabelle Brown', 'IsabelleBrown@student.com'),
('Michael Obama', 'MichaelObama@student.com');


INSERT INTO Course_Student (Student_ID, Course_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(5, 4), -- 
(5, 3); -- Michael Obama is assigned many classes


Ejercicio:
Mostrar las clases que ve Michael Obama

SELECT Student_ID FROM Student WHERE Name = 'Michael Obama';   id 5
SELECT Course_ID FROM Course_Student WHERE Student_ID IN (5); id´s 5,4,3
SELECT title FROM course WHERE Course_ID IN (5,4,3);

SELECT title FROM course
	WHERE Course_ID IN (
		SELECT Course_ID FROM Course_Student
			WHERE Student_ID IN (
			SELECT Student_ID FROM Student
				WHERE Name = 'Michael Obama'
			)
);




second point

CREATE TABLE Project (
    Project_ID SERIAL PRIMARY KEY,
    Name VARCHAR(50),
    Start_Date DATE,
    End_Date DATE 
);

CREATE TABLE Employee (
    Employee_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(100),
    Department VARCHAR(100)
);


CREATE TABLE Project_Employee (
    Project_ID INTEGER,
    Employee_ID  INTEGER,
    FOREIGN KEY (Project_ID) REFERENCES course(Project_ID),
    FOREIGN KEY (Employee_ID ) REFERENCES Student(Employee_ID ),
    PRIMARY KEY (Employee_ID , Project_ID)
);