SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='KhoHang')
		drop database KhoHang
go



CREATE DATABASE KhoHang
GO
USE KhoHang
GO
-- create table
CREATE TABLE VATTU(
	MAVTu char(4) PRIMARY KEY,
	TenVTu varchar(100),
	DvTinh varchar(10),
	PhanTram real
)
GO
CREATE TABLE NHACC(
	MaNhaCc char(3) PRIMARY KEY,
	TenNHaCc varchar(100),
	DiaChi varchar(200),
	DienThoai varchar(20)
)
GO
CREATE TABLE DONDH(
	SoDh char(4) PRIMARY KEY,
	NgayDh datetime,
	MaNhaCc char(3) FOREIGN KEY REFERENCES NHACC(MaNhaCc)
)
GO
CREATE TABLE CTDONDH(
	SoDh char(4) FOREIGN KEY REFERENCES DONDH(SoDh),
	MaVTu char(4) FOREIGN KEY REFERENCES VATTU(MaVTu),
	SlDat int,

	PRIMARY KEY (SoDh,MaVTu)
)
GO

CREATE TABLE PNHAP(
	SoPn char(4) PRIMARY KEY,
	NgayNhap datetime,
	SoDh char(4) FOREIGN KEY REFERENCES DONDH(SoDh)
)
GO

CREATE TABLE CTPNHAP(
	SoPn char(4) FOREIGN KEY REFERENCES PNHAP(SoPn),
	MaVTu char(4) FOREIGN KEY REFERENCES VATTU(MaVTu),
	SlNhap int ,
	DGNhap money,

	PRIMARY KEY(SoPn,MaVTu)
)
GO
CREATE TABLE PXUAT(
	SoPx char(4) PRIMARY KEY,
	NgayXuat datetime,
	TenKh varchar(100)
)
GO
CREATE TABLE CTPXUAT(
	SoPx char(4) FOREIGN KEY REFERENCES PXUAT(SoPx),
	MaVTu char(4) FOREIGN KEY REFERENCES VATTU(MaVTu),
	SlXuat int,
	DgXuat money
)
GO
CREATE TABLE TONKHO(
	NamThang char(6),
	MaVTu char(4) FOREIGN KEY REFERENCES VATTU(MaVTu),
	SLDau int,
	TongSLN int,
	TongSLX int,
	SLCuoi int,

	CONSTRAINT khoa PRIMARY KEY (NamThang,MaVTu)
)
GO

-- thực hiện các thao tác biến đổi

ALTER TABLE VATTU
ALTER COLUMN TenVTu nvarchar(100)
ALTER TABLE VATTU
ALTER COLUMN DvTinh nvarchar(10)
GO

ALTER TABLE NHACC
ALTER COLUMN TenNhaCc nvarchar(100)
ALTER TABLE NHACC
ALTER COLUMN DiaChi nvarchar(200)
GO

ALTER TABLE DONDH
ALTER COLUMN NgayDh date
GO

ALTER TABLE PNHAP
ALTER COLUMN NgayNhap date
GO

ALTER TABLE PXUAT
ALTER COLUMN NgayXuat date
ALTER TABLE PXUAT
ADD DiaChiKh nvarchar(50)
ALTER TABLE PXUAT
ADD SdtKh varchar(11) NOT NULL
ALTER TABLE PXUAT
ALTER COLUMN TenKh nvarchar(100)
GO

ALTER TABLE TONKHO
DROP CONSTRAINT khoa

ALTER TABLE TONKHO 
ALTER COLUMN NamThang date NOT NULL
GO
ALTER TABLE TONKHO
ADD CONSTRAINT khoa PRIMARY KEY(NamThang,MaVTu)
GO
--nhập dữ liệu gốc
INSERT INTO NHACC
VALUES ('C01',N'Thái Quốc Bảo',N'33 Hậu Giang HCM','3465263'),
('C02',N'Trần Quang',N'154 Hưng Đạo HN','5796186'),
('C03',N'Hồng Phương',N'38 Lê Lai HCM', '8858585'),
('C04',N'Nguyễn Huy',N'35 Quận Hai Bà Trưng HN','3456763'),
('C05',N'Lê Bống',N'123 Mỹ Tho Quoảng Nam','3798808'),
('C07',N'Lưu Luyến',N'Hà Châu Mỹ Đình','3033123')
GO

INSERT INTO VATTU
VALUES('DD01',N'Đầu DVD Hitachi 1 đĩa',N'Bộ',40),
('DD02',N'Đầu DVD Hitachi 3 đĩa',N'',40),
('TL15',N'Tủ lạnh Sun house',N'Cái',25),
('TL90',N'Tủ lạnh Sanyo 150 lit',N'Cái',20),
('TV14',N'TV Sony 14 in',N'Cái',15),
('TV21',N'TV Sony 21 in',N'Cái',10),
('TV29',N'TV Sony 29 in',N'Cái',10),
('VD01',N'Đầu VCD Sony 1 đĩa',N'Bộ',30),
('VD02',N'Đầu VCD Sony 3 đĩa',N'Bộ',30)
GO

INSERT INTO DONDH
VALUES('D001','01/15/2005','C03'),
('D002','01/30/2005','C01'),
('D003','02/10/2005','C02'),
('D004','02/17/2005','C05'),
('D005','03/01/2005','C02'),
('D006','03/12/2005','C05')
GO

INSERT INTO PNHAP
VALUES ('N001','01/17/2005','D001'),
('N002','01/20/2005','D001'),
('N003','01/31/2005','D002'),
('N004','02/15/2005','D003')
GO
INSERT INTO CTPNHAP 
VALUES('N001','DD01',8,2500000),
('N001','DD02',10,3500000),
('N002','DD01',2,2500000),
('N002','DD02',5,3500000),
('N003','VD02',30,2500000),
('N004','TV14',5,2500000),
('N004','TV29',12,3500000)
GO



INSERT INTO PXUAT
VALUES('X001','01/17/2005',N'Nguyễn Ngọc Phương Nhi',N'Phố 12 Lào Cai','5555555'),
('X002','01/25/2005',N'Nguyễn Hồng Phương',N'Phố 16 Tây Nguyên','5486186'),
('X003','01/31/2005',N'Nguyễn Tuấn Tú',N'Sơn La Lai Châu','87486254')
GO

INSERT INTO CTPXUAT
VALUES('X001','DD01',2,3500000),
('X002','DD01',1,3500000),
('X002','DD02',5,4900000),
('X003','DD01',3,3500000),
('X003','DD02',2,4900000),
('X003','VD02',10,3250000)
GO
INSERT INTO CTDONDH
VALUES('D001','DD01',10),
('D001','DD02',15),
('D002','VD02',30),
('D003','TV14',10),
('D003','TV29',20),
('D004','TL90',10),
('D005','TV14',10),
('D005','TV29',20),
('D006','TV14',10),
('D006','TV29',20),
('D006','VD01',20)
GO




INSERT INTO TONKHO
VALUES('05/20/2001','DD01',0,10,6,4),
('05/20/2001','DD02',0,15,7,8),
('05/20/2001','VD02',0,60,4,5),
('05/20/2002','DD01',0,10,6,4),
('05/20/2002','DD02',10,0,8,2),
('05/20/2002','VD02',50,0,11,3),
('05/20/2002','TV14',13,0,6,9),
('05/20/2002','TV29',25,0,8,6)
GO
-- thêm dữ liệu vào 

INSERT INTO VATTU
VALUES ('MT01',N'Máy tính Casio','Cái',99),
('MT02',N'Case full bộ HP','Bộ',80),
('MT03',N'Case Dell','Bộ',90)
GO

UPDATE VATTU
SET PhanTram = 99
WHERE MaVTu = 'TV21'
GO

UPDATE CTDONDH
SET SlDat = 30
WHERE SoDh = 'D003'
GO

DELETE FROM VATTU
WHERE TenVTu LIKE 'Case%'
GO


RETURN 
GO

-- lệnh truy vấn theo yêu cầu 3
SELECT * FROM DONDH d
WHERE d.NgayDh<'10/01/2005'
GO

-- lấy tất cả CTPNHAP mà dgnhap lớn hơn 2 tr và nhỏ hơn 3 tr
SELECT * FROM CTPNHAP c 
WHERE c.DGNhap BETWEEN 2000000 AND 3000000
GO
-- lấy tất cả nhà cc mà địa chỉ ở HCM
SELECT * FROM NHACC n 
WHERE n.DiaChi LIKE '%HCM%'
GO
-- lấy tất cả vật tư mà tên có Tivi ở đầu
SELECT * FROM VATTU v
WHERE v.TenVTu LIKE 'TV%'
GO
-- lấy thông tin sô lượng hàng tồn kho nam thang, ma vat tu, tong so l nhập, ton sl xuất
SELECT t.NamThang AS [Năm tháng],t.MaVTu AS [Mã Vật Tư],t.TongSLN AS [Tổng SLN],t.TongSLX AS [Tổng SLX] 
FROM TONKHO t
