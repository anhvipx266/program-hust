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


-- 5. Viết lệnh để thêm dữ liệu vào cac bảng (môi bảng it nhât 5 dòng)
-- Rap - 5
Insert Into RAP(MA_RAP,TEN_RAP,DIA_CHI)
Values('SV', 'Hollow', N'Hà Nội')

Insert Into RAP(MA_RAP,TEN_RAP,DIA_CHI)
Values('CV', 'Chicken', N'Lào Cai')

Insert Into RAP(MA_RAP,TEN_RAP,DIA_CHI)
Values('SA', 'Shadow', N'TP.HCM')

Insert Into RAP(MA_RAP,TEN_RAP,DIA_CHI)
Values('LL', 'Lunch', N'Nam Định')

Insert Into RAP(MA_RAP,TEN_RAP,DIA_CHI)
Values('VS', 'Killer', N'Hải Phòng')


-- thẻ loại 6
Insert Into THE_LOAI(MA_THE_LOAI,TEN_THE_LOAI)
Values(1,N'Hành động')

Insert Into THE_LOAI(MA_THE_LOAI,TEN_THE_LOAI)
Values(2,N'Viễn tưởng')

Insert Into THE_LOAI(MA_THE_LOAI,TEN_THE_LOAI)
Values(3,N'Tình cảm')

Insert Into THE_LOAI(MA_THE_LOAI,TEN_THE_LOAI)
Values(4,N'Hài')

Insert Into THE_LOAI(MA_THE_LOAI,TEN_THE_LOAI)
Values(5,N'Kinh dị')

Insert Into THE_LOAI(MA_THE_LOAI,TEN_THE_LOAI)
Values(6,N'Tài liệu')

-- phim - 13

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('CTBD',N'Câu chuyện bên đường',3,'2023-12-01','Wonder')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('CSV',N'Vũ trụ lớn',6,'2010-01-13','Coca')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('SV20',N'Thảo nguyên',3,'2014-05-04','Hello')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('GALA',N'Cười lên nào',4,'2022-01-04','Launch')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('Hell',N'Quỷ địa ngục',2,'2013-05-16','Underworld')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('CN',N'Giờ phiêu lưu',1,'2004-11-05','Cartoon')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('VNC',N'Ẩm thực bốn phương',3,'2001-01-29','Meal')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('LOIN',N'Sử tử',6,'2015-07-21','Animal')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('CN2',N'Cake',3,'2001-05-24','Coca')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('VNC3',N'Ma trong rừng',4,'2007-06-07','Animal')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('Hell4',N'Quỷ quyệt',3,'2000-12-06','Cartoon')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('Die',N'Cái chết đen',4,'2025-10-01','Cake')

Insert Into PHIM(MA_PHIM,TEN_PHIM,MA_THE_LOAI,NGAY_PHAT_HANH,HANG_SAN_XUAT)
Values('Door',N'Căn phòng',5,'2009-11-11','Death')

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



-- bài tập
--2. Đổi NGAY_PHAT_HANH ở bảng PHIM thành kiểu Date
Alter Table PHIM
Alter Column NGAY_PHAT_HANH date
Go
--3. Thêm vào bảng PHIM cột thuộc tính GIOI_THIEU(nvarchar(500)), DIEN_VIEN
--(nvarchar(100)), GIA_VE(money), MO_TA(nvarchar(50))
ALTER TABLE PHIM
ADD GIOI_THIEU nvarchar(500)

ALTER TABLE PHIM
ADD DIEN_VIEN nvarchar(100)

ALTER TABLE PHIM
ADD GIA_VE money

ALTER TABLE PHIM
ADD MO_TA nvarchar(50)
GO

--4. Xóa cột MO_TA ở bảng PHIM

Alter Table PHIM
Drop Column MO_TA
Go
--6. Tìm thông tin về rạp có tên là “MegaStar” -> "Chicken"
Select * From RAP
Where TEN_RAP = 'Chicken'
--7. Tìm thông tin về những phim có số lương vé > 100
Select * From LICH_CHIEU lc
Where lc.SO_LUONG_VE>100

-- 8. Xóa thông tin về phim có tên là “Sex Is Zero” -> "Thảo nguyên"
DELETE FROM PHIM 
WHERE TEN_PHIM = 'Thảo nguyên'
-- 9. Sửa thông tin của phim có tên “Xác ướp Ai Cập”-> 'Vũ trụ lớn"
-- thành “Cướp biển Carribe”
UPDATE PHIM 
SET TEN_PHIM = 'Cướp biển Carribe'
WHERE TEN_PHIM = 'Vũ trụ lớn'

-- 10. Tìm những bộ phim nào mà có số lượng vé từ 200-400 vé
Select * From LICH_CHIEU
Where SO_LUONG_VE Between 200 and 400
Order by SO_LUONG_VE Desc

--11. Tìm kiếm những bộ phim nào có tên bắt đầu bằng chữ ‘N’ ->'C'
SELECT * FROM PHIM p 
WHERE p.TEN_PHIM LIKE 'C%'
--12. Cập nhật dữ liệu trong bảng lịch chiếu, tăng số lượng vé 
--của các phim có mã từ A-G lên
--50 vé mỗi phim.
-- GHI CHÚ: không tương thích do MA_PHIM là char 
SELECT * FROM LICH_CHIEU lc
WHERE lc.MA_PHIM BETWEEN 'A%' AND 'G%'

UPDATE LICH_CHIEU
SET SO_LUONG_VE += 50
WHERE MA_PHIM BETWEEN 'A%' AND 'G%'
GO
--13. Tìm thông tin của các lịch chiếu có số lượng vé 
--nằm trong khoảng từ 100-300, sắp xếp
--theo số lượng vé (theo thứ tự giảm dần).
SELECT * FROM LICH_CHIEU lc
WHERE lc.SO_LUONG_VE BETWEEN 100 AND 300
ORDER BY lc.SO_LUONG_VE DESC 
