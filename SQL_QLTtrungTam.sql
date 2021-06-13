﻿CREATE DATABASE QL_TTGiaSu
USE QL_TTGiaSu

CREATE TABLE TAIKHOAN
(
   Users nvarchar(50)NOT NULL,
   Pass nvarchar(50),
   HoTen nvarchar(50),
   Quyen nvarchar(20),
   ChucVu nvarchar(50),
   Primary Key(Users)
)
INSERT INTO TAIKHOAN
VALUES('HONGTHAM1402','123',N'NGUYỄN THỊ HỒNG THẮM','USER',N'GIÁO VIÊN'),
('TUYETNGHI','123',N'CHÂU TUYẾT NGHI','USER',N'GIÁO VIÊN'),
('QUANG','123',N'NGUYỄN THANH QUANG','ADMIN',N'QUẢN LÍ'),
('HAU','123',N'TRƯƠNG CÔNG HẬU','ADMIN',N'QUẢN LÍ')
CREATE TABLE GIASU
(
	MAGS INT IDENTITY(1,1) PRIMARY KEY,
	TENGS NVARCHAR(50),
	GIOITINH CHAR(10),
	NGAYSINH DATE,
	CCCD CHAR(12),
	NGUYENQUAN NVARCHAR(100),
	DIACHI NVARCHAR(100),
	EMAIL NVARCHAR(100),
	DIENTHOAI CHAR(10),
	TRUONG NVARCHAR(100),
	NGANHHOC NVARCHAR(100),
	NAMTOTNGHIEP INT,
	NGHENGHIEP NVARCHAR(100),--GIÁO VIÊN, SINH VIÊN, ĐÃ TỐT NGHIỆP
	MONDANGDAY CHAR(10),
	UUDIEM NVARCHAR(1000),
	SOBUOIDAY INT,
	TRANGTHAI BIT,--0:CHỜ DUYỆT,1:GIA SƯ TRUNG TÂM
	
)
SET DATEFORMAT DMY
INSERT INTO GIASU
VALUES 
(N'NGUYỄN THỊ HỒNG THẮM',N'NỮ','14/02/1992','058181113332',N'NINH BINH',N'83/2 PASTEUR P7 Q3','GS1@GAMIL.COM','0912823788',N'ĐẠI HỌC SƯ PHẠM',N'SƯ PHẠM','2015',N'GIÁO VIÊN',N'TOÁN',N'GIỎI',2,1),
(N'TRƯƠNG MINH NGUYÊN',N'NAM','25/07/1990','072200005531',N'TP HCM',N'45 LÊ VĂN SỸ P7 Q3','GS2@GAMIL.COM','0922823988',N'ĐẠI HỌC SƯ PHẠM',N'SƯ PHẠM','2014',N'GIÁO VIÊN',N'VĂN',N'GIỎI',2,1),
(N'CHÂU TUYẾT NGHI',N'NỮ','14/04/1994','058183333333',N'HUẾ',N'5/2 NGUYỄN OANH P1 Q GÒ VẤP','GS3@GAMIL.COM','0902833788',N'ĐẠI HỌC SƯ PHẠM',N'SƯ PHẠM','2016',N'GIÁO VIÊN',N'ANH',N'GIỎI',2,1),
(N'LÊ BẢO GIANG',N'NỮ','30/04/1993','058189993336',N'HÀ NAM',N'NGUYỄN CHU TRINH P3 Q5','GS4@GAMIL.COM','0917823788',N'ĐẠI HỌC SƯ PHẠM',N'SƯ PHẠM','2017',N'GIÁO VIÊN',N'VĂN',N'GIỎI',2,1),
(N'TRƯƠNG TẤN SANG',N'NAM','09/02/1993','058181113339',N'GIA LAI',N'HỒ BÁ KIỆN P4 Q10','GS5@GAMIL.COM','0912123785',N'ĐẠI HỌC SƯ PHẠM',N'SƯ PHẠM','2015',N'GIÁO VIÊN',N'TOÁN',N'GIỎI',2,1)


CREATE TABLE MON
(
	MAMON INT IDENTITY(1,1) PRIMARY KEY,
	TENMON NVARCHAR(100), --TOÁN, VĂN, ANH

)
INSERT INTO MON 
VALUES 
(N'TOÁN'),
(N'VĂN'),
(N'ANH'),
(N'LÝ')
CREATE TABLE LOP
(
	MALOP INT IDENTITY(1,1) PRIMARY KEY,
	TENLOP NVARCHAR(100)--1,2,3,4,5,..
)

CREATE TABLE KHUVUC
(
	MAKV INT IDENTITY(1,1) PRIMARY KEY,
	TENKV NVARCHAR(100)--QUẬN 1,2,3,4,5,..
)
CREATE TABLE THOIGIAN
(
	MATG INT IDENTITY(1,1) PRIMARY KEY,
	TENTG NVARCHAR(100) --THỨ 2 SÁNG,THỨ 2 CHIỀU,THỨ 2 TỐI,...
)

CREATE TABLE CHITIETGS
(
	MAGS INT NOT NULL,
	MAMON INT NOT NULL,
	MALOP INT NOT NULL,
	MAKV INT NOT NULL,
	MATG INT NOT NULL,
	YEUCAUKHAC NVARCHAR(1000),
	CONSTRAINT PK_CTGS PRIMARY KEY(MAGS,MAMON,MALOP,MAKV,MATG),
	CONSTRAINT FK_CTGS_GS FOREIGN KEY(MAGS) REFERENCES GIASU(MAGS),
	CONSTRAINT FK_CTGS_MON FOREIGN KEY(MAMON) REFERENCES MON(MAMON),
	CONSTRAINT FK_CTGS_LOP FOREIGN KEY(MALOP) REFERENCES LOP(MALOP),
	CONSTRAINT FK_CTGS_KV FOREIGN KEY (MAKV) REFERENCES KHUVUC(MAKV),
	CONSTRAINT FK_CTGS_TG FOREIGN KEY (MATG) REFERENCES THOIGIAN(MATG)

)

CREATE TABLE PHUHUYNH
(
	MAPH INT IDENTITY(1,1) PRIMARY KEY,
	TENPH NVARCHAR(100),
	DIACHI NVARCHAR(100),
	DIENTHOAI CHAR(10)
)

CREATE TABLE HOCVIEN
(
	MAHV INT IDENTITY(1,1) PRIMARY KEY,
	TENHV NVARCHAR(100),
	NGAYSINH DATE,
	TRUONG NVARCHAR(100),
	LOP NVARCHAR(50),
	DIACHI NVARCHAR(100),
	DIENTHOAI CHAR(10),
	HOCLUC NVARCHAR(100),
	CMND char(20),
	MONDANGKY CHAR(10),
	GHICHU NVARCHAR(1000),
	MAPH INT,
	CONSTRAINT FK_HOCVIEN_PH FOREIGN KEY (MAPH) REFERENCES PHUHUYNH(MAPH)
)
CREATE TABLE LOPTRUNGTAM
(
	MALOPTT INT IDENTITY(1,1) PRIMARY KEY,
	MAHV INT NOT NULL,
	MAPH INT NOT NULL,
	MALOP INT NOT NULL,
	MAMON INT NOT NULL,
	MATG INT NOT NULL,
	SOLUONGHV INT NOT NULL,
	SOBUOI INT NOT NULL,--TRONG 1 TUAN
	
	YEUCAUKHAC NVARCHAR(1000),
	TRANGTHAI BIT,--0:CHỜ DUYỆT,1:LỚP TRUNG TÂM
	CONSTRAINT FK_LOPTRUNGTAM_MAHV FOREIGN KEY(MAHV) REFERENCES HOCVIEN(MAHV),
	CONSTRAINT FK_LOPTRUNGTAM_MAPH FOREIGN KEY (MAPH) REFERENCES PHUHUYNH(MAPH),
	CONSTRAINT FK_LOPTRUNGTAM_MALOP FOREIGN KEY(MALOP) REFERENCES LOP(MALOP),
	CONSTRAINT FK_LOPTRUNGTAM_MAMON FOREIGN KEY (MAMON) REFERENCES  MON(MAMON),
	CONSTRAINT FK_LOPTRUNGTAM_TG FOREIGN KEY(MATG) REFERENCES THOIGIAN(MATG),

)
CREATE TABLE NHANVIEN
(
	MANV INT IDENTITY(1,1) PRIMARY KEY,
	TENNV NVARCHAR(100),
	DIACHI NVARCHAR(100),
	SDT CHAR(10),
	CHUCVU CHAR(20),
	MATKHAU CHAR(10)
)
CREATE TABLE CHITIETLOPTRUNGTAM
(
	MALOPTT INT NOT NULL,
	MAGS INT NOT NULL,
	MUCLUONG FLOAT,-- = SOBUOI*4*200*SOLUONGHV
	PHINHANLOP FLOAT, -- MUCLUONG*30%
	NGAYNHANLOP DATE,
	MANV INT,
	CONSTRAINT PK_CTLTT PRIMARY KEY(MALOPTT,MAGS),
	CONSTRAINT FK_CTLTT_LOPTT FOREIGN KEY (MALOPTT) REFERENCES LOPTRUNGTAM(MALOPTT),
	CONSTRAINT FK_CTLTT_GS FOREIGN KEY (MAGS) REFERENCES GIASU(MAGS),
	CONSTRAINT FK_CTLTT_NV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
)


CREATE TABLE DANHSACHHEN
(
	MAHEN INT IDENTITY(1,1) PRIMARY KEY,
	MAHV INT ,
	MAGS INT ,
	THOIGIANHEN DATE,
	KETQUA NVARCHAR(10),
	CONSTRAINT FK_DANHSACHHEN_HV FOREIGN KEY (MAHV) REFERENCES HOCVIEN(MAHV),
	CONSTRAINT FK_DANHSACHHEN_GS FOREIGN KEY (MAGS) REFERENCES GIASU(MAGS)
)


--INSERT INTO TRUNGTAM 
--VALUES 
--(N'TRUNG TÂM HOÀNG HÔN',N'12 NGUYỄN BÍNH P15 Q10','0938218822')


--SET DATEFORMAT DMY
--INSERT INTO GIASU
--VALUES 
--(N'NGUYỄN THỊ HỒNG THẮM',N'NỮ','14/02/1992','058181113332',N'NINH BINH',N'83/2 PASTEUR P7 Q3','GS1@GAMIL.COM','0912823788','1.png','2.png','3.png','4.png',N'ĐẠI HỌC SƯ PHẠM',N'SƯ PHẠM','2015',N'GIÁO VIÊN',N'THÔNG THẠO CÁC KỸ NĂNG MỀM',2,'1'),
--(N'TRƯƠNG MINH NGUYÊN',N'NAM','25/07/1990','058182223332',N'TP HCM',N'45 LÊ VĂN SỸ P7 Q3','GS2@GAMIL.COM','0922823988','1.png','2.png','3.png','4.png',N'ĐẠI HỌC SƯ PHẠM',N'SƯ PHẠM','2014',N'GIÁO VIÊN',N'THÔNG THẠO CÁC KỸ NĂNG MỀM',2,'1'),
--(N'CHÂU TUYẾT NGHI',N'NỮ','14/04/1994','058183333332',N'HUẾ',N'5/2 NGUYỄN OANH P1 Q GÒ VẤP','GS3@GAMIL.COM','0902833788','1.png','2.png','3.png','4.png',N'ĐẠI HỌC SƯ PHẠM',N'SƯ PHẠM','2016',N'GIÁO VIÊN',N'THÔNG THẠO CÁC KỸ NĂNG MỀM',2,'1'),
--(N'LÊ BẢO GIANG',N'NỮ','30/04/1993','058189993331',N'HÀ NAM',N'NGUYỄN CHU TRINH P3 Q5','GS4@GAMIL.COM','0917823788','1.png','2.png','3.png','4.png',N'ĐẠI HỌC SƯ PHẠM',N'SƯ PHẠM','2017',N'GIÁO VIÊN',N'THÔNG THẠO CÁC KỸ NĂNG MỀM',2,'0'),
--(N'TRƯƠNG TẤN SANG',N'NAM','09/02/1993','058181113339',N'GIA LAI',N'HỒ BÁ KIỆN P4 Q10','GS5@GAMIL.COM','0912123785','1.png','2.png','3.png','4.png',N'ĐẠI HỌC SƯ PHẠM',N'SƯ PHẠM','2015',N'GIÁO VIÊN',N'THÔNG THẠO CÁC KỸ NĂNG MỀM',2,'0')


--INSERT INTO MON 
--VALUES 
--(N'TOÁN'),
--(N'VĂN'),
--(N'ANH')


--INSERT INTO LOP
--VALUES
--(N'LỚP 1'),
--(N'LỚP 2'),
--(N'LỚP 3'),
--(N'LỚP 4'),
--(N'LỚP 5')


--INSERT INTO KHUVUC
--VALUES 
--(N'QUẬN 1'),
--(N'QUẬN 2'),
--(N'QUẬN 3'),
--(N'QUẬN 4'),
--(N'QUẬN 5')


--INSERT INTO THOIGIAN
--VALUES 
--(N'THỨ 2 SÁNG'),
--(N'THỨ 2 CHIỀU'),
--(N'THỨ 3 SÁNG'),
--(N'THỨ 3 CHIỀU'),
--(N'THỨ 4 SÁNG'),
--(N'THỨ 4 CHIỀU'),
--(N'THỨ 5 SÁNG'),
--(N'THỨ 5 CHIỀU'),
--(N'THỨ 6 SÁNG'),
--(N'THỨ 6 CHIỀU'),
--(N'THỨ 7 SÁNG'),
--(N'THỨ 7 CHIỀU')




--INSERT INTO CHITIETGS
--	VALUES
--	(1,1,1,1,1,N'YÊU CẦU :1'),
--	(2,2,2,2,2,N'YÊU CẦU :2'),
--	(3,2,2,2,2,N'YÊU CẦU :3'),
--	(4,3,1,3,2,N'YÊU CẦU :4'),
--	(5,3,2,1,3,N'YÊU CẦU :5')


--INSERT INTO PHUHUYNH
--VALUES 
--(N'NGUYỄN NGÔ BẢO LIÊM',N'42 SƠN HÀ P15 Q10','0932114443'),
--(N'GIANG TUẤN KIỆT',N'12 MẠC ĐĨNH CHI P15 Q3','0932110023'),
--(N'LÊ THỊ THANH HUYỀN',N'45/4 HAI BÀ TRƯNG P15 Q3','0932110013'),
--(N'PHẠM NGUYỄN QUỲNH HƯƠNG',N'45/10 HỒ BÁ KIỆN P3 Q10','0932115553'),
--(N'CHÂU THÁI TRÂN',N'121 NGHĨA HƯNG P15 Q10','0932111233')



--INSERT INTO HOCVIEN
--VALUES 
--(N'NGUYỄN SỸ VỊNH',N'NGUYỄN THỊ ĐỊNH',1),
--(N'GIANG TUẤN KIỆT',N'TRẦN VĂN ĐANG',2),
--(N'LÊ GIANG',N'TÂN BÌNH',3),
--(N'PHẠM NGUYỄN CHÂU MY',N'NGÔ SỸ LIÊN',4),
--(N'CHÂU QUỐC BẢO',N'NGUYỄN THỊ ĐỊNH',5)



--INSERT INTO LOPTRUNGTAM 
--VALUES
--(1,2,1,2,25,3,'7000000','',1,'1'),
--(2,1,3,2,30,3,'6000000','',1,'0'),
--(3,1,2,3,20,3,'6000000','',1,'1')



--INSERT INTO THONGBAO
--VALUES 
--(N'THÔNG BÁO NGHỈ',N'CHO PHÉP HỌC SINH TẠM VẮNG BUỔI HỌC VÀ ĐƯỢC XẾP HỌC BÙ NGÀY KHÁC',1),
--(N'THÔNG BÁO BÁO CHUYỂN BUỔI',N'HỌC SINH TẠM BUỔI HỌC THEO THỜI KHÓA BIỂU',1)



--INSERT INTO NOIQUY
--VALUES
--(N'ĐI HỌC ĐÚNG GIỜ','',1),
--(N'TÁC PHONG NGHIÊM CHỈNH','',1),
--(N'KHÔNG XẢ RÁC','',1),
--(N'KINH TRỌNG LỄ PHÉP VỚI THẦY CÔ','',1),
--(N'ĐI NHẸ NÓI KHẼ','',1)


--INSERT INTO CHUCVU
--VALUES
--(N'ADMIN'),
--(N'TU VAN VIEN')



--INSERT INTO NHANVIEN
--VALUES
--(N'TRỊNH HOÀNG ĐỨC',N'41 TÂN HƯƠNG P5 Q TÂN PHÚ','0911137581','ADMIN','123',1),
--(N'TRỊNH HOÀNG ĐỨC',N'24 NGÔ QUYỀN P5 Q3','0911137581','TU VAN VIEN','123',1),
--(N'TRỊNH HOÀNG ĐỨC',N'11/1 SƯ VẠN HẠNH P5 Q10','0911137581','TU VAN VIEN','123',1),
--(N'TRỊNH HOÀNG ĐỨC',N'2/23 CHÂU THỚI P5 Q TÂN PHÚ','0911137581','TU VAN VIEN','123',1),
--(N'TRỊNH HOÀNG ĐỨC',N'4/11 THÀNH THÁI P5 Q10','0911137581','TU VAN VIEN','123',1)


