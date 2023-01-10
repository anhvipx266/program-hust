-- cơ sở dữ liệu quản lý Sinh viên

SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='QLSinhVien')
		drop database QLSinhVien
go

CREATE DATABASE QLSinhVien
GO

CREATE TABLE DMKHOA(
	MaKH char(2) PRIMARY KEY,
	TenKH nvarchar(100) NOT NULL
)
GO

CREATE TABLE DMMH(
	MaMH char(2) PRIMARY KEY,
	TenMH nvarchar(100) NOT NULL,
	HeSo int NOT NULL
)
GO

CREATE TABLE DMSV(
	MaSV char(3) PRIMARY KEY,
	TenSV nvarchar(100) NOT NULL,
	GioiTinh bit DEFAULT 1,
	MaKH char(2) FOREIGN KEY REFERENCES DMKHOA(MaKH),
	SoMonDK char(2) NOT NULL,
	DiemTB float DEFAULT 0
)
GO

CREATE TABLE KETQUA(
	MaSV char(3) FOREIGN KEY REFERENCES DMSV(MaSV),
	MaMH char(2) FOREIGN KEY REFERENCES DMMH(MaMH),
	Diem float DEFAULT 0
)
GO


---nhập dữ liệu
INSERT INTO DMKHOA(MaKH, TenKH)
VALUES ('AV','Anh Văn'),
('TH','Tin học'),
('TR','Triết học')
GO

INSERT INTO DMMH(MaMH, TenMH,HeSo)
VALUES ('01','BDWS',4),
('02','DW8',2),
('03','DDSQL',6)
GO

INSERT INTO DMSV
VALUES ('C01','Phạm Tuấn Anh',1,'TH',2,8),
('C02','Phạm Văn Thành',1,'TH',2,8),
('C03','Trịnh Thị Hiền',0,'TH',3,8),
('C04','Trần Đức Cường',1,'AV',2,8),
('C05','Nguyễn Bích Ngọc',0,'TR',3,8)
GO

INSERT INTO KETQUA
VALUES ('C01','01',6),
('C01','02',8),
('C02','03',8),
('C02','02',6),
('C03','02',5)
GO
