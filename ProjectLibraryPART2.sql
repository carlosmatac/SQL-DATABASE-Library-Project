
-- Trigger: Updates the return date automatically to the current date whwn a book is returned to make sure the date is correct
CREATE OR REPLACE TRIGGER UpdateReturnDate
BEFORE UPDATE ON Borrows
FOR EACH ROW
WHEN (OLD.ReturnDate IS NULL AND NEW.ReturnDate IS NOT NULL)
BEGIN
  :NEW.ReturnDate := CURRENT_DATE;
END;
/


-- Stored Function: Finds how many books are borrowed at the current moment by a reader. The argument passed to the function is the reader id
CREATE FUNCTION BooksBorrowedByReader(p_ReaderID INT) RETURN INT AS
borrowed_books INT;
BEGIN
SELECT COUNT(*)
INTO borrowed_books
FROM Borrows
WHERE ReaderID = p_ReaderID AND ReturnDate IS NULL;

RETURN borrowed_books;
END;
/

-- Index: It improves the efficiency of the select statements in Book table, column of titles.
CREATE INDEX idx_book_title ON Book (Title);

-- INSERT statement to add a new entry in the Borrow table. This is to show the functionlity of the trigger along with the next update statement
INSERT INTO Borrows (StaffID, ReaderID, BookCopyID, BorrowDate, ReturnDate)
VALUES (1, 1, 3, TO_DATE('2023-04-24', 'YYYY-MM-DD'), NULL);

-- UPDATE statement that will execute the trigger implemented previously
UPDATE Borrows
SET ReturnDate = TO_DATE('2023-05-01', 'YYYY-MM-DD')
WHERE StaffID = 1 AND ReaderID = 1 AND BookCopyID = 3;


-- SELECT statement that uses the stored function
SELECT BooksBorrowedByReader(1) AS "Books Borrowed by Reader 1" FROM DUAL;

-- INSERT statement to show the functionlity of the index 
INSERT INTO Book (BookID, Title, Author, Publisher, Category) 
VALUES (5, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 'Novel');


-- SELECT statement optimized by the index created in Book.title
SELECT * FROM Book WHERE Title LIKE 'The%';