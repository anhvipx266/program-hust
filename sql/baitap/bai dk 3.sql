SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='BookStore')
		drop database BookStore
go
--1
CREATE DATABASE BookStore
GO
USE BookStore 
GO
-------------------------------------------------
--2
CREATE TABLE Students(
	StudentID int NOT NULL,
	Name nvarchar(50),
	Age tinyint,
	Gender bit
)
GO
CREATE TABLE Books(
	BookID int NOT NULL,
	Name varchar(50),
	TotalPage int,
	Type varchar(10),
	Quantity int
)
GO
CREATE TABLE Borrows(
	BorrowID int NOT NULL,
	StudentID int,
	BookID int,
	BorrowDate datetime
)
GO
CREATE TABLE DropOuts(
	DrpID int IDENTITY(1,1),
	StudentID int,
	DrpDate datetime,
)
GO
INSERT INTO Students VALUES
	(1,N'Nguyễn Thị Huyền',19,0),
	(2,N'Mai Thanh Minh',33,1),
	(3,N'Đào Thiên Hải',26,1),
	(4,N'Trịnh Chân Trân',24,0),
	(5,N'Diễm Quỳnh',30,NULL)
GO
INSERT INTO Books VALUES
	(1,'Word',50,'Normal',10),
	(2,'Excel',60,'Normal',20),
	(3,'DDSQL',71,'Thick',7),
	(4,'LGC',42,'Thin',1),
	(5,'HTML',71,'Thick',2)
GO
INSERT INTO Borrows VALUES
	(1,1,1,'2012-07-29'),
	(2,4,4,'2012-06-27')
--3
ALTER TABLE Students 
ADD CONSTRAINT pk_Student PRIMARY KEY(StudentID)

ALTER TABLE Books 
ADD CONSTRAINT pk_Book PRIMARY KEY(BookID)

ALTER TABLE Borrows
ADD CONSTRAINT pk_Borrow PRIMARY KEY(BorrowID)

ALTER TABLE DropOuts
ADD CONSTRAINT pk_Drp PRIMARY KEY(DrpID)

----
ALTER TABLE Borrows
ADD CONSTRAINT fk_Student  FOREIGN KEY (StudentID) REFERENCES Students(StudentID)

ALTER TABLE Borrows
ADD CONSTRAINT fk_Book FOREIGN KEY (StudentID) REFERENCES Books(BookID)

----
ALTER TABLE Students 
ADD CONSTRAINT ch_Age CHECK(Age>0 AND Age<50)

--4
INSERT INTO Borrows VALUES
	(3,4,3,'2012-07-30'),
	(4,2,5,'2012-06-30'),
	(5,4,1,GETDATE()),
	(6,4,1,GETDATE())

--5

-- Hiển thị danh sách Books có TotalPage lớn hơn 50, danh sách này sắp xếp
-- theo thứ tự tăng dần của TotalPage và Name.
SELECT * FROM Books
WHERE TotalPage>50
ORDER BY TotalPage,Name ASC

-- Hiển thị danh sách tên học viên và tên sách đã mượn tương ứng

SELECT s.Name,bk.Name FROM Students s
RIGHT JOIN Borrows b ON s.StudentID = b.StudentID 
RIGHT JOIN Books bk ON bk.BookID = b.BookID
ORDER BY s.Name

-- Hiển thị danh sách tên tất cả học viên và tổng số sách đã mượn
SELECT s.Name,COUNT(*) AS 'Total Borrow' FROM Students s
RIGHT JOIN Borrows b ON s.StudentID = b.StudentID 
GROUP BY s.Name

-- Hiển thị tên học viên mà giới tính là Null
SELECT s.Name FROM Students s 
WHERE s.Gender IS NULL

-- Hiển thị tên của sách được mượn nhiều nhất và tổng số lượng đã mượn của cuốn đó.
SELECT TOP 1 bk.Name,COUNT(*) AS 'Max Borrow' FROM Borrows b 
LEFT JOIN Books bk ON bk.BookID = b.BookID
GROUP BY b.BookID, bk.Name
ORDER BY COUNT(*) DESC

