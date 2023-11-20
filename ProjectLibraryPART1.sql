CREATE TABLE Staff (
  StaffID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100)
);


CREATE TABLE Reader (
  ReaderID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100)
);

/*We can not use the word type because it has its own purpose in SQL language, instead we put category*/
CREATE TABLE Book (
  BookID INT PRIMARY KEY,
  Title VARCHAR(100),
  Author VARCHAR(100),
  Publisher VARCHAR(100),
  Category VARCHAR(50)
);

CREATE TABLE BookCopy (
  BookCopyID INT PRIMARY KEY,
  BookID INT,
  BookCopyLocation VARCHAR(50),
  FOREIGN KEY (BookID) REFERENCES Book(BookID)

);


CREATE TABLE Borrows (
  StaffID INT,
  ReaderID INT,
  BookCopyID INT,
  BorrowDate DATE,
  ReturnDate DATE,
  PRIMARY KEY (StaffID, ReaderID, BookCopyID),
  FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
  FOREIGN KEY (ReaderID) REFERENCES Reader(ReaderID),
  FOREIGN KEY (BookCopyID) REFERENCES BookCopy(BookCopyID)
);


-- Insert data into the staff table
INSERT ALL
  INTO staff (StaffID, FirstName, LastName, Email) VALUES (1,'John', 'Doe', 'jdoe@email.com')
  INTO staff (StaffID, FirstName, LastName, Email) VALUES (2, 'Jane', 'Smith', 'jsmith@email.com')
SELECT 1 FROM DUAL;


-- Insert data into the reader table
INSERT ALL
    INTO  reader (ReaderID,FirstName, LastName, Email) VALUES (1,'Peter', 'Parker', 'pparker@email.com')
    INTO reader (ReaderID,FirstName, LastName, Email) VALUES (2, 'Mary Jane' , 'Watson', 'mjwatson@email.com')
SELECT 1 FROM DUAL;



-- Insert data into the book_copy table
INSERT ALL 
    INTO BookCopy (BookCopyID, BookCopyLocation) VALUES (1, 'Shelf A')
    INTO BookCopy (BookCopyID, BookCopyLocation) VALUES (2, 'Shelf B')
    INTO BookCopy (BookCopyID, BookCopyLocation) VALUES (3, 'Shelf C')
SELECT 1 FROM DUAL;

-- Insert data into the book table
INSERT ALL 
    INTO book (BookID, Title, Author, Publisher, Category) VALUES (1, 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott.', 'Novel')
    INTO book (BookID, Title, Author, Publisher, Category) VALUES (2, 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 'Novel')
SELECT 1 FROM DUAL;    
 
       

-- Insert data into the borrows table
INSERT ALL 
    INTO borrows (StaffID, ReaderID, BookCopyID, BorrowDate, ReturnDate) VALUES (1, 1, 1, TO_DATE('2023-03-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO borrows (StaffID, ReaderID, BookCopyID, BorrowDate, ReturnDate) VALUES (2, 2, 2, TO_DATE('2023-03-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
SELECT 1 FROM DUAL;

-- More insertions into the staff table
INSERT ALL 
    INTO staff (StaffID, FirstName, LastName, Email) VALUES (3,'Paco', 'Osuna', 'paquitoosuna@email.com')
    INTO staff (StaffID, FirstName, LastName, Email) VALUES(4, 'Tuki', 'Adventure', 'tukiadventurous@email.com')
    INTO staff (StaffID, FirstName, LastName, Email) VALUES (5, 'Goody', 'Perez', 'goodype@email.com')
    INTO staff (StaffID, FirstName, LastName, Email) VALUES (6, 'Pablo', 'Aviles', 'pabloaviles20k@email.com')
SELECT 1 FROM DUAL;


--More insertions into the reader table
INSERT ALL 
    INTO reader (ReaderID,FirstName, LastName, Email) VALUES (3,'Chicho', 'Anel', 'chichoanel@email.com')
    INTO reader (ReaderID,FirstName, LastName, Email) VALUES (4, 'Valeria' , 'Borrajo', 'valeborrajo@email.com')
	INTO reader (ReaderID,FirstName, LastName, Email) VALUES   (5,'Alvaro', 'Carrillo', 'cqcarrillo@email.com')
	INTO reader (ReaderID,FirstName, LastName, Email) VALUES   (6,'Jesus', 'Reyes', 'messiyeme@email.com')
	INTO reader (ReaderID,FirstName, LastName, Email) VALUES   (7,'Roberto', 'Arechavala', 'robiarrecha@email.com')
SELECT 1 FROM DUAL;


--More insertions into the book table 
INSERT ALL 
    INTO book (BookID, Title, Author, Publisher, Category) VALUES (3, '1984', 'George Orwell', 'Secker and Warburg', 'Novel')
    INTO book (BookID, Title, Author, Publisher, Category) VALUES (4, 'One Hundred Years of Solitude', 'Gabriel García Márquez', 'Harper and Row', 'Novel')
SELECT 1 FROM DUAL;

--More insertions into book copy table
INSERT ALL 
    INTO BookCopy (BookCopyID, BookCopyLocation, BookID) VALUES (4, 'Shelf A',3)
    INTO BookCopy (BookCopyID, BookCopyLocation, BookID) VALUES (5, 'Shelf B', 4)
    INTO BookCopy (BookCopyID, BookCopyLocation, BookID)  VALUES (6, 'Shelf C', 3)
SELECT 1 FROM DUAL;
     
--Insert values for BookId in the table of bookcopy
UPDATE BookCopy SET BookID = 1 WHERE BookCopyID = 1;
UPDATE BookCopy SET BookID = 2 WHERE BookCopyID = 2;
UPDATE BookCopy SET BookID = 2 WHERE BookCopyID = 3;

--Insert more values for borrows table
INSERT ALL
    INTO borrows (StaffID, ReaderID, BookCopyID, BorrowDate, ReturnDate) VALUES (2, 4, 4, TO_DATE('2023-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-07 00:00:00','YYYY-MM-DD HH24:MI:SS'))
    INTO borrows (StaffID, ReaderID, BookCopyID, BorrowDate, ReturnDate) VALUES (5, 3, 6, TO_DATE('2023-04-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-08 00:00:00','YYYY-MM-DD HH24:MI:SS'))
    INTO borrows (StaffID, ReaderID, BookCopyID, BorrowDate, ReturnDate) VALUES (3, 6, 5, TO_DATE('2023-04-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-15 00:00:00','YYYY-MM-DD HH24:MI:SS'))
SELECT 1 FROM DUAL;   


-- Query 1: Join of two tables (BookCopy and Book) to retrieve book title and copy location
SELECT Book.Title, BookCopy.BookCopyLocation
FROM BookCopy
INNER JOIN Book ON BookCopy.BookID = Book.BookID;

-- Query 2: Join of three tables (Borrows, Staff, and Reader) to retrieve borrow information and staff/reader names
SELECT Borrows.BorrowDate, Borrows.ReturnDate, Staff.FirstName AS StaffFirstName, Staff.LastName AS StaffLastName, Reader.FirstName AS ReaderFirstName, Reader.LastName AS ReaderLastName
FROM Borrows
INNER JOIN Staff ON Borrows.StaffID = Staff.StaffID
INNER JOIN Reader ON Borrows.ReaderID = Reader.ReaderID;

-- Query 3: GROUP BY & JOIN and aggregate function to retrieve the number of borrows per book
SELECT Book.Title, COUNT(Borrows.BookCopyID) AS NumberOfBorrows
FROM Book
INNER JOIN BookCopy ON Book.BookID = BookCopy.BookID
INNER JOIN Borrows ON BookCopy.BookCopyID = Borrows.BookCopyID group by Book.Title;


-- Query 4: EXISTS predicate to retrieve books that have been borrowed at least once
SELECT Book.Title
FROM Book
WHERE EXISTS (SELECT 1 FROM BookCopy INNER JOIN Borrows ON BookCopy.BookCopyID = Borrows.BookCopyID WHERE BookCopy.BookID = Book.BookID);


-- Create VIEW: Using Query 3 to create a view of the number of borrows per book
CREATE VIEW BorrowsPerBook AS
SELECT Book.Title, COUNT(Borrows.BookCopyID) AS NumberOfBorrows
FROM Book
INNER JOIN BookCopy ON Book.BookID = BookCopy.BookID
INNER JOIN Borrows ON BookCopy.BookCopyID = Borrows.BookCopyID
GROUP BY Book.Title;