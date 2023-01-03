SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='RapChieuVN')
		drop database RapChieuVN
go
create database RapChieuVN
go

Use RapChieuVN
Go

Create Table RAP(
	MA_RAP char(2) Primary Key,
	TEN_RAP nvarchar(60),
	DIA_CHI nvarchar(100)
)

Create Table THE_LOAI(
	MA_THE_LOAI int Primary Key,
	TEN_THE_LOAI nvarchar(40)
)

Create Table PHIM(
	MA_PHIM char(5) Primary Key,
	TEN_PHIM nvarchar(100),
	MA_THE_LOAI int Foreign Key References THE_LOAI(MA_THE_LOAI),
	NGAY_PHAT_HANH datetime,
	HANG_SAN_XUAT nvarchar(100)

)

Create Table LICH_CHIEU(
	MA_LICH int Primary Key,
	MA_RAP char(2) Foreign Key References RAP(MA_RAP),
	MA_PHIM char(5) Foreign Key References PHIM(MA_PHIM),
	THOI_GIAN datetime,
	SO_LUONG_VE smallint
)

-- Rap - 5
Insert Into RAP(MA_RAP,TEN_RAP,DIA_CHI)
Values('SV', 'Hollow', 'Hà Nội')

Insert Into RAP(MA_RAP,TEN_RAP,DIA_CHI)
Values('CV', 'Chicken', 'Lào Cai')

Insert Into RAP(MA_RAP,TEN_RAP,DIA_CHI)
Values('SA', 'Shadow', 'TP.HCM')

Insert Into RAP(MA_RAP,TEN_RAP,DIA_CHI)
Values('LL', 'Lunch', 'Nam Định')

Insert Into RAP(MA_RAP,TEN_RAP,DIA_CHI)
Values('VS', 'Killer', 'Hải Phòng')


-- thẻ loại 6
Insert Into THE_LOAI(MA_THE_LOAI,TEN_THE_LOAI)
Values(1,'Hành động')

Insert Into THE_LOAI(MA_THE_LOAI,TEN_THE_LOAI)
Values(2,'Viễn tưởng')

Insert Into THE_LOAI(MA_THE_LOAI,TEN_THE_LOAI)
Values(3,'Tình cảm')

Insert Into THE_LOAI(MA_THE_LOAI,TEN_THE_LOAI)
Values(4,'Hài')

Insert Into THE_LOAI(MA_THE_LOAI,TEN_THE_LOAI)
Values(5,'Kinh dị')

Insert Into THE_LOAI(MA_THE_LOAI,TEN_THE_LOAI)
Values(6,'Tài liệu')

-- phim - 13

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('CTBD','Câu chuyện bên đường',3,'2023-12-01','Wonder')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('CSV','Vũ trụ lớn',6,'2010-01-13','Coca')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('SV20','Thảo nguyên',3,'2014-05-04','Hello')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('GALA','Cười lên nào',4,'2022-01-04','Launch')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('Hell','Quỷ địa ngục',2,'2013-05-16','Underworld')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('CN','Giờ phiêu lưu',1,'2004-11-05','Cartoon')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('VNC','Ẩm thực bốn phương',3,'2001-01-29','Meal')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('LOIN','Sử tử',6,'2015-07-21','Animal')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('CN2','Cake',3,'2001-05-24','Coca')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('VNC3','Ma trong rừng',4,'2007-06-07','Animal')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('Hell4','Quỷ quyệt',3,'2000-12-06','Cartoon')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('Die','Cái chết đen',4,'2025-10-01','Cake')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('Door','Căn phòng',5,'2009-11-11','Death')

-- lịch chiếu 6
Insert Into LICH_CHIEU(MA_LICH,MA_RAP,MA_PHIM,THOI_GIAN,SO_LUONG_VE)
Values(1,'SV','Door','2023-01-12',30)

Insert Into LICH_CHIEU(MA_LICH,MA_RAP,MA_PHIM,THOI_GIAN,SO_LUONG_VE)
Values(2,'CV','Door','2023-01-13',25)

Insert Into LICH_CHIEU(MA_LICH,MA_RAP,MA_PHIM,THOI_GIAN,SO_LUONG_VE)
Values(3,'SA','Hell','2023-01-13',100)

Insert Into LICH_CHIEU(MA_LICH,MA_RAP,MA_PHIM,THOI_GIAN,SO_LUONG_VE)
Values(4,'CV','Die','2023-01-12',9)

Insert Into LICH_CHIEU(MA_LICH,MA_RAP,MA_PHIM,THOI_GIAN,SO_LUONG_VE)
Values(5,'SV','LOIN','2023-04-12',123)

Insert Into LICH_CHIEU(MA_LICH,MA_RAP,MA_PHIM,THOI_GIAN,SO_LUONG_VE)
Values(6,'CV','CN','2023-05-12',14)

--Drop database RapChieuVN

-- bài tập
Alter Table PHIM
Alter Column NGAY_PHAT_HANH date
Go

Alter Table MA_PHIM
Drop Column MO_TA
Go

Select * From RAP
Where TEN_RAP = 'Chicken'

Select * From LICH_CHIEU lc
Where lc.SO_LUONG_VE>100

-- Alter Table MA_PHIM
-- Drop

Select * From LICH_CHIEU
Where SO_LUONG_VE Between 100 and 300
Order by Desc
