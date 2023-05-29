CREATE DATABASE thuvien_hust;

USE thuvien_hust;

CREATE TABLE danh_muc(
	id int AUTO_INCREMENT PRIMARY KEY,
	ten varchar(50) NOT NULL,
	mo_ta varchar(200),
	trang_thai boolean DEFAULT 1

);

CREATE TABLE sach(
	id int AUTO_INCREMENT PRIMARY KEY,
	iddm int,
	tieu_de varchar(50) NOT NULL UNIQUE,
	tac_gia varchar(100),
	mo_ta varchar(200),
	ngay_xb date,
	so_trang int CHECK(so_trang>0),
	gia_tien float CHECK(gia_tien>=1000),
	
	
	FOREIGN KEY(iddm) REFERENCES danh_muc(id)


);

INSERT INTO danh_muc(`ten`,`mo_ta`) VALUES
	('SGK','Sách giáo khoa'),
	('math','Sách toán học'),
	('tech','Sách công nghệ');
	
INSERT INTO sach(`iddm`,`tieu_de`,`tac_gia`,`mo_ta`,`ngay_xb`,`so_trang`,`gia_tien`) VALUES
	(1,'Toán 1','Ngô Bảo Châu','','2000-01-01',100,10000),
	(1,'Tiếng Việt 1','Ngô Bảo Châu','','2000-01-01',100,10000),
	(2,'Toán Không gian','Ngô Bảo Châu','','2000-01-01',1000,100000)
