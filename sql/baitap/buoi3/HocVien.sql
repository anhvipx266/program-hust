
SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='HocVien')
		drop database HocVien
go
create database HocVien
go

Use HocVien
Go

CREATE TABLE TTHocVien(
MaHV char(10) Primary Key,
TenHV nvarchar(25),
Gioitinh bit,
Ngaysinh datetime,
Quenquan nvarchar(100)
)
Go
Create Table LopHoc(
MaLop char(7) Primary Key,
TenLop nvarchar(100)
)
Go
Create Table HocKy(
	MaHK char(2) Primary Key,
	TenHK nvarchar(50)
)
GO
Create Table MonHoc(
	MaMon char(5) Primary Key,
	TenMon nvarchar(100),
	MaHK char(2) Foreign Key References HocKy(MaHK)
)
Go

Create Table TTDiemThi(
	MaHV char(10) Foreign Key References TTHocVien(MaHV),
	MaLop char(7) Foreign Key References LopHoc(MaLop),
	MaMon char(5) Foreign Key References MonHoc(MaMon),
	Diem float,
	Constraint MaDiemThi Primary Key (MaHV,MaLop,MaMon),

)



