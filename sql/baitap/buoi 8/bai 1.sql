SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='Travel_Management')
		drop database Travel_Management
go

CREATE DATABASE Travel_Management
GO
USE Travel_Management
GO

CREATE TABLE Travels(
	trID int NOT NULL,
	name varchar(100) NOT NULL,
	price float NULL,
	days int NOT NULL,
	catID int NOT NULL,
	startDATE datetime NULL
)
GO
CREATE TABLE Categories(
	catID int NOT NULL,
	catname varchar(100) NOT NULL,
	counts int NULL
)
GO
-- q3 tạo khóa 
ALTER TABLE Travels
ADD CONSTRAINT mTral PRIMARY KEY(trID)
GO 
ALTER TABLE Categories
ADD CONSTRAINT mCat PRIMARY KEY(catID)
GO
ALTER TABLE Travels
ADD CONSTRAINT ngoai  FOREIGN KEY(catID) REFERENCES Categories(catID) 
GO
--q4 ràng buộc 
ALTER TABLE Travels
ADD CONSTRAINT range_days CHECK(days>0 AND days<15)
GO
ALTER TABLE Travels
ADD CONSTRAINT uni_name UNIQUE(name)
GO
ALTER TABLE Travels
ADD CONSTRAINT def_s_date DEFAULT GETDATE() FOR startDATE
GO
--q5 thêm dữ liệu 
INSERT INTO Categories(catID,catname)
VALUES (100,'Beaches'),
(200,'Family Travel'),
(300,'Food and Drink'),
(400,'Skiling')
GO
INSERT INTO Travels
VALUES (10,'Menele Bay.Hawai',200,2,100,'2011-04-30'),
(11,'Hilton Waitkiloa Village',250,4,200,'2011-04-16'),
(12,'Cleanwater Beach. Florida',300,7,100,'2011-02-11'),
(13,'Sandwich Paradise',180,2,300,'2011-01-10'),
(14,'Cape May.New Jersey',380,4,100,'2011-01-18')
GO
-- q6 update - tăng 10% giá Travels
UPDATE Travels 
SET price *= 1.1
WHERE days>5 AND 
		Travels.catID = (SELECT catID FROM Categories
			WHERE catname='Food and Drink')

--q7 
SELECT c.catID, c.catname AS 'Category',ISNULL(COUNT(t.catID),0) AS 'Quantity' FROM Travels t
RIGHT JOIN Categories c
	ON t.catID = c.catID
GROUP BY t.catID,c.catname,c.catID

-- q8 advance

UPDATE Categories
SET counts = (SELECT counts FROM (SELECT c.catID AS ID,ISNULL(COUNT(t.catID),0) AS 'counts' FROM Travels t
	RIGHT JOIN Categories c ON t.catID = c.catID
	GROUP BY t.catID,c.catID) AS q
	WHERE ID = Categories.catID)
GO
UPDATE Categories
SET counts = (SELECT ISNULL(COUNT(t.catID),0) FROM Travels t
	RIGHT JOIN Categories c ON t.catID = c.catID
	GROUP BY t.catID,c.catID
	HAVING Categories.catID = c.catID  )
GO


SELECT * FROM Categories

