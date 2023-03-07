-- tiền xử lý 
SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='ShopeeShop')
		drop database ShopeeShop
go
create database ShopeeShop
go

Use ShopeeShop
Go


------------------------------------
-- tạo bảng 
CREATE TABLE Size(
	SizeId int PRIMARY KEY,
	SizeName nvarchar(100),
	[Status] bit
)
GO
CREATE TABLE Color(
	ColorId int PRIMARY KEY,
	ColorName nvarchar(100),
	[Status] bit

)
GO
CREATE TABLE Catelog(
	CatelogId int PRIMARY KEY,
	CatelogName nvarchar(100),
	[Status] bit
)
GO
CREATE TABLE Product(
	ProductId int PRIMARY KEY,
	CatelogId int FOREIGN KEY REFERENCES Catelog(CatelogId),
	ProductName nvarchar(100),
	[Content] nvarchar(250),
	ContentDetail ntext,
	PriceInput float,
	PriceOutput float,
	Created date,
	[Views] int,
	BuyItem int,
	[Status] bit
)
GO
CREATE TABLE Customer(
	CustomerId int PRIMARY KEY,
	CustomerName nvarchar(50),
	Phone char(15),
	[Address] nvarchar(200),
	Email varchar(100),
	UserName varchar(50),
	[Password] varchar(50),
	Created date,
	[Status] bit
)
GO
CREATE TABLE Bill(
	BillId int PRIMARY KEY,
	CustomerId int FOREIGN KEY REFERENCES Customer(CustomerId),
	Created date,
	Name nvarchar(100),
	[Address] nvarchar(200),
	Phone char(15),
	Email varchar(100),
	Amount float,
	[Status] tinyint

)
GO
CREATE TABLE ProductDetail(
	ProductId int NOT NULL FOREIGN KEY REFERENCES Product(ProductId),
	ColorId int NOT NULL FOREIGN KEY REFERENCES Color(ColorId),
	SizeId int NOT NULL FOREIGN KEY REFERENCES Size(SizeId),
	quantity int,
	[Status] bit,


	CONSTRAINT pkProductDetail PRIMARY KEY (ProductId,ColorId,SizeId)
	
)
GO
CREATE TABLE BillDetail(
	BillId int NOT NULL FOREIGN KEY REFERENCES Bill(BillId),
	ProductId int NOT NULL FOREIGN KEY REFERENCES Product(ProductId),
	ColorId int NOT NULL FOREIGN KEY REFERENCES Color(ColorId),
	SizeId int NOT NULL FOREIGN KEY REFERENCES Size(SizeId),
	PriceUnit float,
	Quantity int,


	CONSTRAINT pkBillDetail PRIMARY KEY (BillId,ProductId,ColorId,SizeId)
	
)
GO

--1. thêm dữ liệu 
INSERT INTO Catelog
VALUES(1,N'Giầy nam',1),
(2,N'Giầy nữ',1),
(3,N'Dép nữ',1),
(4,N'Dép nam',1),
(5,N'Áo nam',1),
(6,N'Áo nữ',1),
(7,N'Quần nam',1),
(8,N'Quần nữ',1)
GO
INSERT INTO Product
VALUES(1,1,N'Giày buộc dây công sở Sanvado',N'Giày buộc dây công sở Sanvado mũi bóng màu đen',N'Giày buộc dây công sở Sanvado mũi bóng màu đen',350000,400000,'2005-01-01',10,10,1),
(2,1,N'Giày PK',N'Giày PK gắn kim cương',N'Giày PK gắn kim cương',1000000,2000000,'2005-05-01',100,10,1),
(3,1,N'Giày adidas',N'Giày adidas đen thể thao',N'Giày adidas đen thể thao',200000,250000,'2005-04-01',30,6,1),
(4,2,N'Giày cao gót Alpha',N'Giày cao gót Alpha đỏ thời thượng',N'Giày cao gót Alpha đỏ thời thượng',500000,600000,'2005-02-01',10,12,1),
(5,2,N'Giày thể thao S',N'Giày thể thao nữ màu hồng',N'Giày thể thao nữ màu hồng',400000,500000,'2005-07-01',100,9,1),
(6,2,N'Giày da Ad',N'Giày da cao cấp thương hiệu Ad',N'Giày da cao cấp thương hiệu Ad',1000000,2000000,'2005-06-01',50,6,1),
(7,3,N'Dép sandand nữ',N'Dép sandand nữ màu hồng',N'Dép sandand nữ màu hồng',20000,30000,'2005-05-01',100,60,1),
(8,3,N'Dép tổ ong',N'Dép tổ ong chất lượng cao',N'Dép tổ ong chất lượng cao',10000,13000,'2005-02-01',1000,80,1),
(9,5,N'Áo vest nam',N'Áo vest nam cao cấp màu ghi',N'Áo vest nam cao cấp màu ghi',880000,1000000,'2005-09-01',100,15,1)
GO
INSERT INTO Color
VALUES(1,N'Màu đỏ',1),
(2,N'Màu xanh',1),
(3,N'Màu tím',1),
(4,N'Màu trắng',1),
(5,N'Màu đen',1),
(6,N'Màu hồng',1),
(7,N'Màu vàng',1)
GO
INSERT INTO Size
VALUES(1,N'Size 36',1),
(2,N'Size 28',1),
(3,N'Size 37',1),
(4,N'Size 38',1),
(5,N'Size 39',1),
(6,N'Size S',1),
(7,N'Size M',1),
(8,N'Size L',1),
(9,N'Size 26',1),
(10,N'Size 39',1)
GO

INSERT INTO Customer
VALUES(1,N'Trịnh Hoàng Hiệp','01234567890',N'Hải Dương','hiep.@gmail.com','Hoang Hiep','123456','2018-01-01',1),
(2,N'Lê Quốc Đạt','01234561230',N'Hải Phòng','datx.@gmail.com','Datx','123456','2018-02-01',1),
(3,N'Hoàng Trung Nhân','0876073737',N'Hà Nội','nhan.@gmail.com','Nhan','123456','2018-03-01',1),
(4,N'Thái Thần Thông','0735256214',N'Nam Dương','thong.@gmail.com','Thong','123456','2018-09-01',1),
(5,N'Lê Siêu Việt','0123411633',N'Trung Quốc','viet.@gmail.com','Viet','123456','2018-01-05',1),
(6,N'Phạm Đăng Quang','06513451133',N'Lào Cai','quang.@gmail.com','Quang','123456','2018-02-04',1),
(7,N'Gaming Nguyễn','07327527174',N'Cà Mau','gaming.@gmail.com','Gaming','123456','2018-11-18',1),
(8,N'Victor Hoàng','0722277777',N'Phú Thọ','victor.@gmail.com','Victor','123456','2018-10-9',1),
(9,N'Joe El','0772727644',N'Mỹ Tho','joe.@gmail.com','Joe','123456','2018-05-06',1)
GO
INSERT INTO ProductDetail 
VALUES(1,1,1,10,1),
(2,2,1,12,1),
(3,1,1,14,1),
(4,3,2,20,1),
(5,1,1,24,1),
(6,5,2,634,1),
(7,2,1,40,1),
(8,5,3,41,1),
(9,2,2,18,1)
GO

INSERT INTO Bill
VALUES(1,1,'2023-12-01',N'Hoàng Hợp',N'Q3 Hà nội','0154654663','hop@gmail.com', 1000000,1),
(2,1,'2023-11-01',N'Hoàng Hiệu',N'Q3 Lào cai','0570707070','hieu@gmail.com', 300000,1),
(3,3,'2023-10-01',N'Hoàng Hợp',N'Q3 Hà nội','0154654663','hop@gmail.com', 2500000,1),
(4,4,'2023-03-03',N'Hoàng Hiệu',N'Q3 Hà cai','0570707070','hieu@gmail.com', 200000,1)



-------------------------------------------
--2. Liệt kê thông tin các sản phẩm có giá từ 100k đến 850k. PriceOutput
SELECT * FROM Product p
WHERE p.PriceOutput BETWEEN 100000 AND 850000 
GO

--3. Liệt kê các sản phẩm thuộc danh mục “Giầy nam” và có cụm từ “thể thao" - Content
SELECT * FROM Product p 
WHERE p.Content LIKE N'%thể thao%' AND p.CatelogId = 1
GO

-- 4. Liệt kê các sản phẩm có ngày nhập (Created)
-- từ tháng 6/2022 đến hết tháng 12/2022
SELECT * FROM Product p 
WHERE p.Created BETWEEN '2000-01-01' AND '2022-01-01'
-- WHERE p.Created >= '2000-01-01' AND p.Created <='2022-12-30'

--5. Liệt kê top 3 sản phẩm được xem nhiều nhất, mua nhiều nhất
-- sản phẩm được xem nhiều nhất
SELECT TOP 3 * FROM Product p 
ORDER BY p.Views DESC
GO
-- sản phẩm được mua nhiều nhất 
SELECT TOP 3 * FROM Product p
ORDER BY p.BuyItem DESC


--6. Liệt kê thông tin: mã sản phẩm, tên sản phẩm, 
--tên danh mục, giá bán, trạng thái
SELECT p.ProductId AS 'Mã sản phẩm',p.ProductName AS 'Tên sản phẩm',
	c.CatelogName AS 'Tên danh mục',p.PriceOutput AS 'Giá bán',
	p.Status AS 'Trạng thái'
 FROM Product p
LEFT JOIN Catelog c ON p.CatelogId = c.CatelogId


-- 7. Liệt kê thông tin: mã sản phẩm, tên màu sắc, 
--tên kích cỡ, số lượng, trạng thái
SELECT p.ProductId AS 'mã sản phẩm', c.ColorName AS 'tên màu sắc',
	z.SizeName AS 'tên kích cỡ', p.quantity AS 'số lượng', p.Status AS 'trạng thái'
FROM ProductDetail p 
	LEFT JOIN Color c ON c.ColorId=p.ColorId 
	LEFT JOIN Size z ON z.SizeId =p.SizeId 

--8. Liệt kê thông tin: mã hóa đơn, tên khách hàng, ngày mua, người nhận,
--địa chỉ, sđt,số tiền, trạng thái
SELECT b.BillId AS 'mã hóa đơn', c.CustomerName AS 'tên khách hàng',
	b.Created AS 'ngày mua', b.Name AS 'người nhận', b.Address AS 'địa chỉ',
	b.Phone AS 'sđt', b.Status AS 'trạng thái'
FROM Bill b 
	LEFT JOIN Customer c ON b.CustomerId = c.CustomerId 

--9. Liệt kê tất cả đơn hàng được tạo cách đây 1 tuần (7 ngày)
SELECT * FROM Bill b 
WHERE DATEDIFF(day,GETDATE(),b.Created) <=7

--10. Thống kê số lượng các đơn hàng đã mua theo khách hàng
-- Bill - đơn hàng 
SELECT b.CustomerId AS 'mã khách hàng' ,c.CustomerName AS 'tên khách hàng' ,
	COUNT(*) AS 'số lượng đơn' FROM Bill b
LEFT JOIN Customer c ON b.CustomerId = c.CustomerId
GROUP BY b.CustomerId,c.CustomerName

