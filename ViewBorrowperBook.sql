-- Create VIEW: Using Query 3 to create a view of the number of borrows per book
CREATE VIEW BorrowsPerBook AS
SELECT Book.Title, COUNT(Borrows.BookCopyID) AS NumberOfBorrows
FROM Book
INNER JOIN BookCopy ON Book.BookID = BookCopy.BookID
INNER JOIN Borrows ON BookCopy.BookCopyID = Borrows.BookCopyID
GROUP BY Book.Title;

