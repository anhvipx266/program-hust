SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='Buoi11')
		drop database Buoi11
go

CREATE DATABASE Buoi11
GO
USE Buoi11 
GO
-- bài 1
CREATE TABLE Student(
	MaHV int PRIMARY KEY IDENTITY(1,1),
	Ten nvarchar(15) NOT NULL,
	Ho nvarchar(15) NOT NULL,
	Dem nvarchar(15),
	Province nvarchar(50) NOT NULL,
	Sex nvarchar(5) DEFAULT N'Nam',
	Birthday date NOT NULL
)
GO

-- chèn 10 dòng dữ liệu
INSERT INTO Student VALUES
	(N'Trung',N'Thái',N'Quốc',N'Lào Cai',N'Nam','2004-01-23'),
	(N'Hoàng',N'Trần',N'Huy',N'Hà Nội',N'Nam','2004-02-23'),
	(N'Nam',N'Nguyễn',N'Cao',N'Hà Nam',N'Nam','2004-03-23'),
	(N'Huy',N'Nguyễn',N'Tiến',N'Cao Bằng',N'Nam','2003-04-23'),
	(N'Lệ',N'Phạm',N'Mỹ',N'Bắc Cạn',N'Nữ','2004-05-23'),
	(N'Tươi',N'Thái',N'Quốc',N'Lào Cai',N'Nữ','2004-06-23'),
	(N'Vũ',N'Thái',N'Quốc',N'Lào Cai',N'Nam','2004-07-23'),
	(N'Nhân',N'Thái',N'Quốc',N'Lào Cai',N'Nữ','2004-08-23'),
	(N'Trang',N'Thái',N'Quốc',N'Lào Cai',N'Nam','2004-09-23'),
	(N'Tâm',N'Thái',N'Quốc',N'Lào Cai',N'Nữ','2004-10-23')
GO 

-- SELECT * FROM Student
-- thông tin sắp xếp theo ngày sinh
SELECT * FROM Student 
ORDER BY Birthday
-- thông tin tên đầy đủ 
SELECT CONCAT(Ho,' ',Dem,' ',Ten) FROM Student
-- thông tin về sv sinh năm 2003
SELECT * FROM Student 
WHERE YEAR(Birthday) = 2003
-- thông tin sinh viên có quê ở Lào Cai 
SELECT * FROM Student 
WHERE Province = N'Lào Cai'
-- thông tin sv nữ tên bắt đầu bằng L 
SELECT * FROM Student 
WHERE Ten LIKE N'L%' AND Sex = N'Nữ'
--Sửa thông tin về sinh viên có mã là 5: 
--Sửa Ten thành ‘Tĩnh’ và họ thành ’Quách’

UPDATE Student SET 
	Ten = N'Tĩnh',
	Ho = N'Quách'
WHERE MaHV =5
-- xóa thông tin mã 3-5 
DELETE FROM Student
WHERE MaHV BETWEEN 3 AND 5

-- thêm cột DiemTongKet 
ALTER TABLE Student
ADD DiemTongKet float
GO
-- thêm ràng buộc cho DiemTongKet
ALTER TABLE Student 
ADD CONSTRAINT ch_DiemTongKet CHECK(DiemTongKet BETWEEN 10 AND 100)

-- bài 2
CREATE TABLE Employee(
	Id int IDENTITY(1,1),
	Name varchar(30),
	Address varchar(50),
	Grade varchar(5),
	Sex varchar(6),
	Birthday date
)
GO
CREATE TABLE Grade(
	GradeID varchar(5),
	Salary float
)
GO

-- chèn 10 dòng dữ liệu 

INSERT INTO Employee VALUES
	('Joe Duo','aa American','END','male','1999-01-01'),
	('Peter Parker','aa UK','AND','male','1990-10-25'),
	('Joe Duo','aa American','END','male','1999-01-01'),
	('Joe Duo','aa American','END','male','1999-01-01'),
	('Joe Duo','aa American','END','female','1999-01-01'),
	('Joe Duo','aa American','END','female','1999-01-01'),
	('Joe Duo','aa American','END','female','1999-01-01'),
	('Joe Duo','aa American','END','female','1999-01-01'),
	('Joe Duo','aa American','END','female','1999-01-01')

INSERT INTO Grade VALUES
	('END',10000),
	('AND',20000),
	('TEST',5000),
	('CHICK',30000),
	('NO',60000),
	('ABC',10000),
	('BBC',10000),
	('GO',10000),
	('MUSIC',10000),
	('DANCE',10000)
GO

-- hiện tên, địa chỉ, tuổi của các nhân viên
SELECT Name,Address,(YEAR(GETDATE())- YEAR(Birthday)) AS 'Age' FROM Employee
-- xóa thông tin về nhân viên có mã 3 
DELETE FROM Employee 
WHERE Id =3
-- xóa thông tin về tất cả nhân viên Nam
DELETE FROM Employee 
WHERE Sex ='male'
-- sửa thông tin về nhân viên có mã 4, Grade thành 'B'
UPDATE Employee 
SET Grade = 'B'
WHERE Id = 4
-- sửa thông tin về Grade, cập nhật salary 10000 -> 10111
UPDATE Grade 
SET Salary = 10111 
WHERE Salary = 10000
GO
-- hiện thong tin về nv trẻ nhất, già nhất 
-- nv già nhất
SELECT MAX(YEAR(GETDATE())-YEAR(Birthday)) FROM Employee
-- nv trẻ nhất 
SELECT MIN(YEAR(GETDATE())-YEAR(Birthday)) FROM Employee

SELECT MAX(YEAR(GETDATE())-YEAR(Birthday)) AS 'Oldest',
		MIN(YEAR(GETDATE())-YEAR(Birthday)) AS 'Youngest' 
		FROM Employee

-- tổng, tbc tuổi 
SELECT SUM(YEAR(GETDATE())-YEAR(Birthday)) AS 'Age Total',
		AVG(YEAR(GETDATE())-YEAR(Birthday)) AS 'Age Avg'
	FROM Employee
-- tổng số nv 
SELECT COUNT(*) AS 'Total' FROM Employee
-- thông tin nv Nữ, tuổi > 18 
SELECT * FROM Employee 
WHERE Sex ='female' AND YEAR(GETDATE())-YEAR(Birthday)>18
-- thông tin nv Nam tuổi <60 

SELECT * FROM Employee 
WHERE Sex ='male' AND YEAR(GETDATE())-YEAR(Birthday) < 60

-- tính tổng, tbc tuổi nv Nữ tuổi 18 - 60
---- các nv nữ tuổi 18-60
SELECT SUM(t.Age) AS 'Age Total',AVG(t.Age) AS 'Age avg' FROM 
	(SELECT (YEAR(GETDATE())-YEAR(Birthday)) AS 'Age'  FROM Employee 
	WHERE Sex = 'female' AND (YEAR(GETDATE())-YEAR(Birthday) BETWEEN 18 AND 60)
	) t
