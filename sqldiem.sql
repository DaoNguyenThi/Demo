USE [QuanLyDiem]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 2/14/2019 1:56:56 PM ******/
DROP TABLE [dbo].[SinhVien]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 2/14/2019 1:56:56 PM ******/
DROP TABLE [dbo].[MonHoc]
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 2/14/2019 1:56:56 PM ******/
DROP TABLE [dbo].[Lop]
GO
/****** Object:  Table [dbo].[HocKy]    Script Date: 2/14/2019 1:56:56 PM ******/
DROP TABLE [dbo].[HocKy]
GO
/****** Object:  Table [dbo].[Diem]    Script Date: 2/14/2019 1:56:56 PM ******/
DROP TABLE [dbo].[Diem]
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 2/14/2019 1:56:56 PM ******/
DROP TABLE [dbo].[DangNhap]
GO
/****** Object:  StoredProcedure [dbo].[GetAllStudentInfo]    Script Date: 2/14/2019 1:56:56 PM ******/
DROP PROCEDURE [dbo].[GetAllStudentInfo]
GO
/****** Object:  StoredProcedure [dbo].[GetAllStudentInfo]    Script Date: 2/14/2019 1:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllStudentInfo]
AS
BEGIN
	select MaSV , TenSV as N'Họ và tên', NgaySinh as N'Ngày sinh',
	GioiTinh as N'Giới tính', DanToc as N'Dân tộc', Diachi as N'Địa chỉ', TenLop as N'Lớp'
	 from SinhVien
	 left join Lop
	 on Lop.MaLop = SinhVien.MaLop
END

GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 2/14/2019 1:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Diem]    Script Date: 2/14/2019 1:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diem](
	[MaSV] [int] IDENTITY(1,1) NOT NULL,
	[MaMon] [nvarchar](50) NULL,
	[DiemHS1] [float] NULL,
	[DiemHS2] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocKy]    Script Date: 2/14/2019 1:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocKy](
	[MaHK] [int] IDENTITY(1,1) NOT NULL,
	[TenHK] [nvarchar](50) NULL,
 CONSTRAINT [PK_HocKy] PRIMARY KEY CLUSTERED 
(
	[MaHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lop]    Script Date: 2/14/2019 1:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[MaLop] [int] IDENTITY(1,1) NOT NULL,
	[TenLop] [nvarchar](100) NULL,
 CONSTRAINT [PK_Lop] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 2/14/2019 1:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMon] [nvarchar](50) NOT NULL,
	[TenMon] [nvarchar](50) NULL,
	[SoTC] [int] NULL,
	[MaHK] [nvarchar](50) NULL,
 CONSTRAINT [PK_MonHoc] PRIMARY KEY CLUSTERED 
(
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 2/14/2019 1:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [int] IDENTITY(1,1) NOT NULL,
	[TenSV] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [int] NULL,
	[DanToc] [nvarchar](50) NULL,
	[Diachi] [nvarchar](100) NULL,
	[MaLop] [nvarchar](50) NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[DangNhap] ([username], [password]) VALUES (N'daohong', N'dao123')
INSERT [dbo].[DangNhap] ([username], [password]) VALUES (N'camtu', N'letucam')
INSERT [dbo].[DangNhap] ([username], [password]) VALUES (N'trinhhuong', N'huonghuong')
INSERT [dbo].[DangNhap] ([username], [password]) VALUES (N'duanpham', N'duan98')
SET IDENTITY_INSERT [dbo].[Diem] ON 

INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (1, N'77CO', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (17, N'77CO', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (2, N'56AC', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (11, N'77CP', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (9, N'03EH', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (3, N'02DD', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (15, N'77CY', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (24, N'01AK', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (20, N'03BO', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (14, N'47AK', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (10, N'77CO', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (22, N'72AA', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (5, N'77CN', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (6, N'77CP', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (18, N'03BJ', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (22, N'02AD', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (1, N'01AK', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (5, N'03EH', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (17, N'47AK', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (1, N'77CN', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (15, N'03BJ', NULL, NULL)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemHS1], [DiemHS2]) VALUES (22, N'02DD', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Diem] OFF
SET IDENTITY_INSERT [dbo].[HocKy] ON 

INSERT [dbo].[HocKy] ([MaHK], [TenHK]) VALUES (1, N'Học Kỳ 1')
INSERT [dbo].[HocKy] ([MaHK], [TenHK]) VALUES (2, N'Học Kỳ 2')
SET IDENTITY_INSERT [dbo].[HocKy] OFF
SET IDENTITY_INSERT [dbo].[Lop] ON 

INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (1, N'Tin Học 18')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (2, N'KTĐK & TĐH')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (3, N'ĐTVT18')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (4, N'KHMT 17')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (5, N'CNTT 15')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (6, N'KTCK 14')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (7, N'Tin học 17')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (8, N'KTCĐT 16')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (9, N'HTTT 15')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (10, N'KTPM 17')
SET IDENTITY_INSERT [dbo].[Lop] OFF
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'01AK', N'Giải tích', 4, N'1')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'02AD', N'Nhậ môn kỹ thuật đồ họa', 2, N'2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'02CN', N'Cơ sở toán trong tin học ', 3, N'2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'02DD', N'Nhập môn HTML và thiết kế web', 2, N'1')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'02DE', N'Nhập môn lập trình Windows Form + BTL', 3, N'1')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'03BJ', N'Đảm bảo an toàn thông tin', 2, N'2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'03BO', N'Công Nghệ Web', 3, N'2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'03DJ', N'Phân tích thiết kế hệ thống', 3, N'2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'03EG', N'Cơ sở dữ liệu ', 4, N'2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'03EH', N'Thực tập cơ sở dữ liệu', 2, N'1')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'04CK', N'Cấu trúc máy tính', 2, N'2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'31AD', N'Điện tử số +BTL', 2, N'1')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'47AK', N'Pháp luật đại cương', 2, N'1')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'56AC', N'Phát triển ứng dụng web', 3, N'2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'57BL', N'Đường lối quân sự của Đảng', 3, N'2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'72AA', N'Tiếng anh 1', 3, N'1')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'77BD', N'Lập trình hướng đối tượng Java', 3, N'1')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'77CN', N'Lập trình Android', 3, N'2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'77CO', N'Lập trình ứng dụng Windows Form với C#', 3, N'1')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'77CP', N'Đạo đức nghề nghiệp', 2, N'1')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC], [MaHK]) VALUES (N'77CY', N'Ngôn ngữ lập trình 1', 2, N'2')
SET IDENTITY_INSERT [dbo].[SinhVien] ON 

INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (1, N'Nguyễn Thị Đào', CAST(0x00008D0400000000 AS DateTime), 1, N'Kinh', N'Đội 7 - Cát Quế - Hoài Đức - Hà Nội', N'1')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (2, N'Thái Trình Kha', CAST(0x0000892700000000 AS DateTime), 0, N'Kinh', N'Số 23 - Ngõ 151B Thái Hà - hà Nôi', N'7')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (3, N'Phạm Thị Mỹ Duân', CAST(0x00008C7D00000000 AS DateTime), 1, N'Kinh', N'7B Tổ 20 - Chương Dương - Hoàn Kiếm - Hà Nội', N'1')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (4, N'Lê Thị Cẩm Tú', CAST(0x00008B1000000000 AS DateTime), 1, N'Kinh', N'Số 7 - Ngõ 6 - Tôn Thất Tùng - Hà Nội', N'3')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (5, N'Khuất Văn Thắng', CAST(0x00008CC000000000 AS DateTime), 0, N'Kinh', N'Trương Yên - Hoa Lư - Ninh Bình', N'2')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (6, N'Nguyễn Tá Thái', CAST(0x00008A6600000000 AS DateTime), 0, N'Kinh', N'Tổ 29 - Láng Hạ - Đống Đa- Hà Nội', N'2')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (7, N'Nguyễn Thị Xuyên', CAST(0x0000870B00000000 AS DateTime), 1, N'Kinh', N'P511A , Tầng 5 , Thái Hà , Đống Đa, Hà Nội', N'4')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (8, N'Bùi Nhật Hưng', CAST(0x00008C9000000000 AS DateTime), 0, N'Kinh', N'5K1 IF TT Thành Công , Láng Hạ , Hà Nội', N'3')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (9, N'Nguyễn Trường Sơn', CAST(0x0000889500000000 AS DateTime), 0, N'Kinh', N'Tổ 12A - Trương Định - Hà Nội', N'6')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (10, N'Phạm Thừa Đăng', CAST(0x00008BFE00000000 AS DateTime), 0, N'Kinh', N'P1806 - Nhà A4 - KDT Mỹ Đình I - Từ Liêm - Hà Nội', N'1')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (11, N'Nguyễn Duy Khánh ', CAST(0x000089A000000000 AS DateTime), 0, N'Kinh', N'22B- Ngõ 10 -Tổ 33 - Nghĩa Đô - Hà Nội', N'1')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (12, N'Nguyễn Thị Trâm', CAST(0x00008CA300000000 AS DateTime), 1, N'Kinh', N'An Thái - Đại Mỗ - Từ Liêm - Hà Nội', N'1')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (13, N'Lê Thế Đông', CAST(0x0000886700000000 AS DateTime), 0, N'Kinh', N'117 Chinh Kinh - Hà Nội', N'6')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (14, N'Phạm Nguyễn Ngọc Anh', CAST(0x00008AB000000000 AS DateTime), 1, N'Kinh', N'Số 17 - Ngõ 165 - Thái Hà - Đống Đa- Hà Nội', N'3')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (15, N'Nguyễn Thị Thanh Thư', CAST(0x00008C5800000000 AS DateTime), 1, N'Kinh', N'Mỹ Đức - Hà Đông - Hà Nội', N'5')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (16, N'Vũ Minh Hiếu', CAST(0x00008BC800000000 AS DateTime), 0, N'Kinh', N'P603 C3 Mỹ Đình 1, Từ Liêm , Hà Nội', N'5')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (17, N'Nguyễn Phương Đào', CAST(0x00008C8000000000 AS DateTime), 1, N'Kinh', N'F16-C15 Kim Liên - Hà Nội', N'1')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (18, N'Nguyễn Chính Sơn', CAST(0x00008C2100000000 AS DateTime), 0, N'Kinh', N'Số 23 - Đức Giang - Hoài Đức - Hà Nội', N'4')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (19, N'Nguyễn Năng Vũ', CAST(0x00008B6100000000 AS DateTime), 0, N'Kinh', N'P10-Nhà B Số 3-25 Cát Linh - Hà Nội', N'6')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (20, N'Phạm Bích Diệp', CAST(0x00008CC700000000 AS DateTime), 1, N'Kinh', N'29 Ngõ 86 Hào Nam - Hà Nội', N'2')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (21, N'Nguyễn Tài Tú', CAST(0x00008AD500000000 AS DateTime), 0, N'Kinh', N'18 Ngõ 188 Thái Thịnh - Hà Nội', N'1')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (22, N'Phan Thị Huyền', CAST(0x00008CC700000000 AS DateTime), 1, N'Kinh', N'68D Tổ 13C Thịnh Quang , Đống Đa, Hà Nội', N'3')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (23, N'Nguyễn Danh Duy', CAST(0x00008D2B00000000 AS DateTime), 0, N'Kinh', N'Số 19 - Giảng Võ - Hà Nội', N'1')
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DanToc], [Diachi], [MaLop]) VALUES (24, N'Nguyễn Minh Trang', CAST(0x00008D3500000000 AS DateTime), 1, N'Kinh', N'61B Thành Công - Ba Đình - Hà Nội', N'2')
SET IDENTITY_INSERT [dbo].[SinhVien] OFF
