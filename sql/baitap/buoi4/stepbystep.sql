SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='ProjectShoes')
		drop database ProjectShoes
go

CREATE DATABASE ProjectShoes
GO

USE ProjectShoes

CREATE TABLE [CATELOG](
	catelogId int IDENTITY(1,1) PRIMARY KEY,
	catelogName nvarchar(100),
	[Status] bit  
)
GO

CREATE TABLE [PRODUCT](
	productId int IDENTITY(1,1) PRIMARY KEY,
	productName nvarchar(100),
	content nvarchar(250),
	contentDetail ntext,
	priceInput float,
	priceOutput float,
	created date,
	[views] int,
	buyItem int,
	[status] bit
)

GO

CREATE TABLE COLOR(
	colorId int IDENTITY(1,1) PRIMARY KEY,
	colorName nvarchar(100),
	[status] bit,

)
GO

CREATE TABLE SIZE(
	sizeId int IDENTITY(1,1) PRIMARY KEY,
	sizeName nvarchar(100),
	[status] bit
)

-- thêm dữ liệu vào CATELOG
ALTER TABLE CATELOG
ADD parentId int, [description] nvarchar(32)
GO 
-- sửa dữ liệu
ALTER TABLE CATELOG
ALTER COLUMN [description] nvarchar(64)
GO
--xóa
ALTER TABLE CATELOG
DROP COLUMN parentId
GO

---------------thêm dữ liệu vào bảng---------
INSERT INTO CATELOG(catelogName,status)
VALUES(N'Giày cao gót',1),
(N'Giày vải',1),
(N'Giày convert',1)
GO

INSERT INTO PRODUCT(productName,content,contentDetail,
priceInput,priceOutput,views,buyItem,created,status)
VALUES(N'Giày cao gót hở mũi',N'Đây là giày cao gót hở mũi mới',
N'Giày cao gót hở mũi đính đá hoa văn sang trọng',
450000,470000,4,2,'2017-08-21',1),
(N'Giày cao gót hở mũi',N'Đây là giày cao gót hở mũi mới',
N'Giày cao gót hở mũi đính đá hoa văn sang trọng',
450000,470000,4,2,'2017-08-21',1),
(N'Giày cao gót đế bằng',N'Đây là giày cao gót đế bằng mới',
N'Giày cao gót đế bằng trẻ trung',
350000,380000,4,2,'2017-08-22',1),
(N'Giày convert cao cổ',N'Giày convert cao cổ',
N'Giày convert cao cổ cho nữ',
180000,230000,6,2,'2017-08-22',1)
GO

INSERT INTO COLOR(colorName,status)
VALUES(N'Màu xanh',1),
(N'Màu vàng',1),
(N'Màu trắng',1)
GO

INSERT INTO SIZE(sizeName,status)
VALUES(N'Size 36',1),
(N'Size 37',1),
(N'Size 38',1)
GO

--------------CẬP NHẬT DỮ LIỆU------------
UPDATE CATELOG
SET catelogName = N'Giày lười'
WHERE catelogId = 2
GO

DELETE FROM PRODUCT 
WHERE productId = 2
GO
