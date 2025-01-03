USE [master]
GO
/****** Object:  Database [CINEMA]    Script Date: 12/25/2024 7:49:40 PM ******/
CREATE DATABASE [CINEMA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CINEMA', FILENAME = N'D:\Microsoft SQL SEVER\MSSQL12.MSSQLSERVER\MSSQL\DATA\CINEMA.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CINEMA_log', FILENAME = N'D:\Microsoft SQL SEVER\MSSQL12.MSSQLSERVER\MSSQL\DATA\CINEMA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CINEMA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CINEMA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CINEMA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CINEMA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CINEMA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CINEMA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CINEMA] SET ARITHABORT OFF 
GO
ALTER DATABASE [CINEMA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CINEMA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CINEMA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CINEMA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CINEMA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CINEMA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CINEMA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CINEMA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CINEMA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CINEMA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CINEMA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CINEMA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CINEMA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CINEMA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CINEMA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CINEMA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CINEMA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CINEMA] SET RECOVERY FULL 
GO
ALTER DATABASE [CINEMA] SET  MULTI_USER 
GO
ALTER DATABASE [CINEMA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CINEMA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CINEMA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CINEMA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CINEMA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CINEMA', N'ON'
GO
USE [CINEMA]
GO
/****** Object:  Table [dbo].[CHINHANH]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHINHANH](
	[MaChiNhanh] [int] IDENTITY(1,1) NOT NULL,
	[TenChiNhanh] [nvarchar](51) NULL,
	[DiaChi] [nvarchar](100) NULL,
 CONSTRAINT [PK_CHINHANH] PRIMARY KEY CLUSTERED 
(
	[MaChiNhanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIET_GHE_PHONG]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIET_GHE_PHONG](
	[IdGheDat] [int] IDENTITY(1,1) NOT NULL,
	[IdGhe] [int] NOT NULL,
	[MaPhong] [varchar](10) NOT NULL,
	[IdLoaiGhe] [int] NULL,
 CONSTRAINT [PK_CHITIET_GHE_PHONG] PRIMARY KEY CLUSTERED 
(
	[IdGheDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHITIET_THAYDOIGIA]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIET_THAYDOIGIA](
	[MaSuatChieu] [int] NOT NULL,
	[IdThayDoi] [int] NOT NULL,
	[PhanTramThayDoi] [float] NULL,
 CONSTRAINT [PK_CHITIET_THAYDOIGIA] PRIMARY KEY CLUSTERED 
(
	[MaSuatChieu] ASC,
	[IdThayDoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DANHGIAPHIM]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHGIAPHIM](
	[MaPhim] [int] NOT NULL,
	[MaKH] [int] NOT NULL,
	[Diem] [float] NULL,
	[NgayDanhGia] [date] NULL,
 CONSTRAINT [PK_DANHGIAPHIM] PRIMARY KEY CLUSTERED 
(
	[MaPhim] ASC,
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DAODIEN]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DAODIEN](
	[IdDaoDien] [int] IDENTITY(1,1) NOT NULL,
	[TenDaoDien] [nvarchar](51) NULL,
	[AnhDaoDien] [varchar](1000) NULL,
 CONSTRAINT [PK_DAODIEN] PRIMARY KEY CLUSTERED 
(
	[IdDaoDien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DIENVIEN]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIENVIEN](
	[IdDienVien] [int] IDENTITY(1,1) NOT NULL,
	[TenDienVien] [nvarchar](51) NULL,
	[AnhDienVien] [varchar](1000) NULL,
 CONSTRAINT [PK_DIENVIEN] PRIMARY KEY CLUSTERED 
(
	[IdDienVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GHE]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GHE](
	[IdGhe] [int] IDENTITY(1,1) NOT NULL,
	[TenGhe] [varchar](3) NULL,
 CONSTRAINT [PK_Ghe] PRIMARY KEY CLUSTERED 
(
	[IdGhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHACH_HANG]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACH_HANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SDT] [varchar](10) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Avatar] [varchar](8000) NULL,
 CONSTRAINT [PK_KHACH_HANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LICH_CHIEU]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LICH_CHIEU](
	[MaSuatChieu] [int] IDENTITY(1,1) NOT NULL,
	[NgayChieu] [date] NOT NULL,
	[GioChieu] [time](0) NULL,
	[BatDauBanVe] [datetime] NULL,
	[MaPhong] [varchar](10) NOT NULL,
	[MaPhim] [int] NOT NULL,
 CONSTRAINT [PK__LICH_CHI__CF5984D2BEF146DD] PRIMARY KEY CLUSTERED 
(
	[MaSuatChieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOAIGHE]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIGHE](
	[IdLoaiGhe] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](20) NULL,
	[Gia] [money] NULL,
 CONSTRAINT [PK_LOAIGHE] PRIMARY KEY CLUSTERED 
(
	[IdLoaiGhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHAN_VIEN]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHAN_VIEN](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[CMND] [varchar](12) NOT NULL,
	[SDT] [varchar](10) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[MaChiNhanh] [int] NULL,
 CONSTRAINT [PK__NHAN_VIE__2725D70A42C52C2C] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHIM]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHIM](
	[MaPhim] [int] IDENTITY(1,1) NOT NULL,
	[TenPhim] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](2000) NULL,
	[NuocSX] [nvarchar](10) NULL,
	[NgayKhoiChieu] [date] NOT NULL,
	[NamSX] [int] NOT NULL,
	[ThoiLuong] [int] NULL,
	[LinkAnh] [varchar](8000) NULL,
	[LinkTrailer] [varchar](8000) NULL,
	[Diem] [float] NULL CONSTRAINT [DF_PHIM_Diem]  DEFAULT ((2)),
	[MaTT] [int] NULL,
	[IdDaoDien] [int] NULL,
 CONSTRAINT [PK__PHIM__4AC03DE3734F300D] PRIMARY KEY CLUSTERED 
(
	[MaPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHONG]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHONG](
	[MaPhong] [varchar](10) NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[MaChiNhanh] [int] NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QUYEN]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QUYEN](
	[MaQuyen] [varchar](10) NOT NULL,
	[TenQuyen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CHUC_VU] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SUKIEN]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SUKIEN](
	[MaSK] [int] IDENTITY(1,1) NOT NULL,
	[TenSK] [nvarchar](100) NULL,
	[MoTaSK] [ntext] NULL,
	[ChiTietSK] [ntext] NULL,
	[PosterSK] [varchar](8000) NULL,
 CONSTRAINT [PK_SUKIEN] PRIMARY KEY CLUSTERED 
(
	[MaSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[Email] [varchar](50) NOT NULL,
	[MaQuyen] [varchar](10) NOT NULL,
	[Password] [char](50) NOT NULL,
 CONSTRAINT [PK__TAIKHOAN__A9D1053551FB21C0] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[THAYDOIGIA]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THAYDOIGIA](
	[IdThayDoiGia] [int] IDENTITY(1,1) NOT NULL,
	[LyDoThayDoi] [nvarchar](100) NULL,
	[NgayThayDoi] [date] NULL,
 CONSTRAINT [PK_THAYDOIGIA] PRIMARY KEY CLUSTERED 
(
	[IdThayDoiGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THE_LOAI]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THE_LOAI](
	[MaTL] [int] NOT NULL,
	[TenTL] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CHI_TIET_THE_LOAI] PRIMARY KEY CLUSTERED 
(
	[MaTL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THE_LOAI_PHIM]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THE_LOAI_PHIM](
	[MaTL] [int] NOT NULL,
	[MaPhim] [int] NOT NULL,
 CONSTRAINT [PK__THE_LOAI__038903AFE6135119] PRIMARY KEY CLUSTERED 
(
	[MaTL] ASC,
	[MaPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VAIDIEN]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VAIDIEN](
	[MaPhim] [int] NOT NULL,
	[IdDienVien] [int] NOT NULL,
	[TenVaiDien] [nvarchar](51) NULL,
 CONSTRAINT [PK_VAIDIEN] PRIMARY KEY CLUSTERED 
(
	[MaPhim] ASC,
	[IdDienVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VE]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE](
	[MaVe] [int] IDENTITY(1,1) NOT NULL,
	[MaSuatChieu] [int] NOT NULL,
	[MaKH] [int] NULL,
	[NgayBan] [date] NOT NULL,
	[ThoiDiemThanhToan] [datetime] NULL,
	[TrangThaiDat] [bit] NULL CONSTRAINT [DF_VE_TrangThaiDat]  DEFAULT ((0)),
	[IdGheDat] [int] NULL,
	[MaNV] [int] NULL,
 CONSTRAINT [PK__VE__2725100F3E048F2F] PRIMARY KEY CLUSTERED 
(
	[MaVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CHINHANH] ON 

INSERT [dbo].[CHINHANH] ([MaChiNhanh], [TenChiNhanh], [DiaChi]) VALUES (1, N'Tứ Trụ Cinema Lê Văn Việt', N'Lê Văn Việt')
INSERT [dbo].[CHINHANH] ([MaChiNhanh], [TenChiNhanh], [DiaChi]) VALUES (2, N'Tứ Trụ Cinema Tiền Giang', N'Tiền Giang')
INSERT [dbo].[CHINHANH] ([MaChiNhanh], [TenChiNhanh], [DiaChi]) VALUES (3, N'Tứ Trụ Cinema Quãng Ngãi', N'Quãng Ngãi')
INSERT [dbo].[CHINHANH] ([MaChiNhanh], [TenChiNhanh], [DiaChi]) VALUES (4, N'Tứ Trụ Cinema Cà Mau', N'Cà Mau')
SET IDENTITY_INSERT [dbo].[CHINHANH] OFF
SET IDENTITY_INSERT [dbo].[CHITIET_GHE_PHONG] ON 

INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (3, 1, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (5, 2, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (6, 3, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (7, 4, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (8, 5, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (10, 6, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (12, 7, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (13, 8, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (14, 9, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (15, 10, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (16, 11, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (17, 12, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (18, 13, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (19, 14, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (20, 15, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (21, 16, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (22, 17, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (23, 18, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (24, 19, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (25, 20, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (26, 21, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (27, 22, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (28, 23, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (29, 24, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (30, 25, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (31, 26, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (32, 27, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (33, 28, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (34, 29, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (35, 30, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (36, 31, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (37, 32, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (38, 33, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (39, 34, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (40, 35, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (41, 36, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (42, 37, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (43, 38, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (44, 39, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (45, 40, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (46, 41, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (47, 42, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (48, 43, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (49, 44, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (50, 45, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (51, 46, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (52, 47, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (53, 48, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (54, 49, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (56, 50, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (57, 51, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (58, 52, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (59, 53, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (60, 54, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (61, 55, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (62, 56, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (63, 57, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (65, 58, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (66, 59, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (67, 60, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (68, 61, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (69, 62, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (70, 63, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (71, 64, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (72, 65, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (73, 66, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (74, 67, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (75, 68, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (76, 69, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (77, 70, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (78, 71, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (79, 72, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (80, 73, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (81, 74, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (82, 75, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (83, 76, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (84, 77, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (85, 78, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (86, 79, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (87, 80, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (88, 81, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (89, 82, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (91, 83, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (92, 84, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (93, 85, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (94, 86, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (95, 87, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (96, 88, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (97, 89, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (98, 90, N'P01', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (99, 91, N'P01', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (100, 92, N'P01', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (101, 93, N'P01', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (102, 94, N'P01', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1115, 1, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1116, 2, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1117, 3, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1118, 4, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1119, 5, N'P02', 1)
GO
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1120, 6, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1121, 7, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1122, 8, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1123, 9, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1124, 10, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1125, 741, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1126, 742, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1127, 11, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1128, 12, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1129, 13, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1130, 14, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1131, 15, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1132, 16, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1133, 17, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1134, 18, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1135, 19, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1136, 20, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1137, 743, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1138, 744, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1139, 21, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1140, 22, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1141, 23, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1142, 24, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1143, 25, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1144, 26, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1145, 27, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1146, 28, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1147, 29, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1148, 30, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1149, 31, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1150, 32, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1151, 33, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1152, 34, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1153, 35, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1154, 36, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1155, 37, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1156, 38, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1157, 39, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1158, 40, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1159, 745, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1160, 746, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1161, 41, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1162, 42, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1163, 43, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1164, 44, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1165, 45, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1166, 46, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1167, 47, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1168, 48, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1169, 49, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1170, 50, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1171, 747, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1172, 748, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1173, 51, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1174, 52, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1175, 53, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1176, 54, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1177, 55, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1178, 56, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1179, 57, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1180, 58, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1181, 59, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1182, 60, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1183, 749, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1184, 750, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1185, 61, N'P02', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1186, 62, N'P02', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1187, 63, N'P02', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1188, 1, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1189, 2, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1190, 3, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1191, 4, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1192, 5, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1193, 6, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1194, 7, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1195, 8, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1196, 9, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1197, 10, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1198, 11, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1199, 12, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1200, 13, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1201, 14, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1202, 15, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1203, 16, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1204, 17, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1205, 18, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1206, 19, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1207, 20, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1208, 21, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1209, 22, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1210, 23, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1211, 24, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1212, 25, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1213, 26, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1214, 27, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1215, 28, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1216, 29, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1217, 30, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1218, 31, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1219, 32, N'P03', 1)
GO
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1220, 33, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1221, 34, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1222, 35, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1223, 36, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1224, 37, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1225, 38, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1226, 39, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1227, 40, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1228, 745, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1229, 746, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1230, 41, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1231, 42, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1232, 43, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1233, 44, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1234, 45, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1235, 46, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1236, 47, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1237, 48, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1238, 49, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1239, 50, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1240, 747, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1241, 748, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1242, 51, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1243, 52, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1244, 53, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1245, 54, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1246, 55, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1247, 56, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1248, 57, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1249, 58, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1250, 59, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1251, 60, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1252, 749, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1253, 750, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1254, 61, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1255, 62, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1256, 63, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1257, 64, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1258, 65, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1259, 66, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1260, 67, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1261, 68, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1262, 69, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1263, 70, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1264, 751, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1265, 752, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1266, 71, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1267, 72, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1268, 73, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1269, 74, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1270, 75, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1271, 76, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1272, 77, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1273, 78, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1274, 79, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1275, 80, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1276, 753, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1277, 754, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1278, 755, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1279, 756, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1280, 757, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1281, 758, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1282, 759, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1283, 760, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1284, 761, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1285, 762, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1286, 763, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1287, 764, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1288, 765, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1289, 766, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1290, 81, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1291, 82, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1292, 83, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1293, 84, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1294, 85, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1295, 86, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1296, 87, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1297, 88, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1298, 89, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1299, 90, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1300, 91, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1301, 92, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1302, 93, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1303, 94, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1304, 95, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1305, 767, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1306, 768, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1307, 769, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1308, 770, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1309, 771, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1310, 772, N'P03', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1311, 773, N'P03', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1312, 774, N'P03', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1313, 775, N'P03', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1314, 776, N'P03', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1315, 1, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1316, 2, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1317, 3, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1318, 4, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1319, 5, N'P04', 1)
GO
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1320, 6, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1321, 7, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1322, 8, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1323, 9, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1324, 10, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1325, 11, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1326, 12, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1327, 13, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1328, 14, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1329, 15, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1330, 16, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1331, 17, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1332, 18, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1333, 19, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1334, 20, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1335, 743, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1336, 744, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1337, 21, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1338, 22, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1339, 23, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1340, 24, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1341, 25, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1342, 26, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1343, 27, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1344, 28, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1345, 29, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1346, 30, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1347, 31, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1348, 32, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1349, 33, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1350, 34, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1351, 35, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1352, 36, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1353, 37, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1354, 38, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1355, 39, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1356, 40, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1357, 745, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1358, 746, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1359, 41, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1360, 42, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1361, 43, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1362, 44, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1363, 45, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1364, 46, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1365, 47, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1366, 48, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1367, 49, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1368, 50, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1369, 747, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1370, 748, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1371, 51, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1372, 52, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1373, 53, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1374, 54, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1375, 55, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1376, 56, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1377, 57, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1378, 58, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1379, 59, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1380, 60, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1381, 749, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1382, 750, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1383, 61, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1384, 62, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1385, 63, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1386, 64, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1387, 65, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1388, 66, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1389, 67, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1390, 68, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1391, 69, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1392, 70, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1393, 751, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1394, 752, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1395, 71, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1396, 72, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1397, 73, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1398, 74, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1399, 75, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1400, 76, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1401, 77, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1402, 78, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1403, 79, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1404, 80, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1405, 753, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1406, 754, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1407, 755, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1408, 756, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1409, 757, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1410, 758, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1411, 759, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1412, 760, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1413, 761, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1414, 762, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1415, 763, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1416, 764, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1417, 765, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1418, 766, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1419, 81, N'P04', 1)
GO
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1420, 82, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1421, 83, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1422, 84, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1423, 85, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1424, 86, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1425, 87, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1426, 88, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1427, 89, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1428, 90, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1429, 777, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1430, 778, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1431, 91, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1432, 92, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1433, 93, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1434, 94, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1435, 95, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1436, 767, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1437, 768, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1438, 769, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1439, 770, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1440, 771, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1441, 779, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1442, 780, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1443, 772, N'P04', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1444, 773, N'P04', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1445, 774, N'P04', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1446, 775, N'P04', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1447, 776, N'P04', 3)
SET IDENTITY_INSERT [dbo].[CHITIET_GHE_PHONG] OFF
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (88, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (89, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (91, 2, 0.9)
SET IDENTITY_INSERT [dbo].[DAODIEN] ON 

INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (1033, N'Huỳnh Đông', N'huynhdong.webp')
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (1034, N'Trấn Thành', N'tranthanh.jpeg')
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (1035, N'Lý Hải', N'lyhai.png')
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (1036, N'Damien Leone', N'DamienLeone.jfif')
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (1037, N'James Cameron', N'JamesCameron.jpg')
SET IDENTITY_INSERT [dbo].[DAODIEN] OFF
SET IDENTITY_INSERT [dbo].[DIENVIEN] ON 

INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (25, N'Tiến Luật', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (26, N'Vân Trang', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (27, N'Song Luân', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (28, N'Uyển Ân', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (29, N'Trung Dũng', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (30, N'Huy Khánh', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (31, N'
Jenna Kanell', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (32, N'Samantha Scaffidi', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (33, N'	
Leonardo DiCaprio', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (34, N'Kate Winslet', NULL)
SET IDENTITY_INSERT [dbo].[DIENVIEN] OFF
SET IDENTITY_INSERT [dbo].[GHE] ON 

INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (1, N'A01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (2, N'A02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (3, N'A03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (4, N'A04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (5, N'A05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (6, N'A06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (7, N'A07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (8, N'A08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (9, N'A09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (10, N'A10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (741, N'A11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (742, N'A12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (11, N'B01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (12, N'B02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (13, N'B03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (14, N'B04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (15, N'B05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (16, N'B06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (17, N'B07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (18, N'B08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (19, N'B09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (20, N'B10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (743, N'B11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (744, N'B12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (21, N'C01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (22, N'C02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (23, N'C03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (24, N'C04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (25, N'C05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (26, N'C06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (27, N'C07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (28, N'C08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (29, N'C09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (30, N'C10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (31, N'D01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (32, N'D02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (33, N'D03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (34, N'D04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (35, N'D05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (36, N'D06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (37, N'D07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (38, N'D08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (39, N'D09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (40, N'D10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (745, N'D11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (746, N'D12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (41, N'E01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (42, N'E02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (43, N'E03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (44, N'E04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (45, N'E05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (46, N'E06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (47, N'E07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (48, N'E08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (49, N'E09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (50, N'E10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (747, N'E11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (748, N'E12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (51, N'F01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (52, N'F02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (53, N'F03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (54, N'F04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (55, N'F05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (56, N'F06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (57, N'F07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (58, N'F08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (59, N'F09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (60, N'F10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (749, N'F11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (750, N'F12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (61, N'G01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (62, N'G02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (63, N'G03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (64, N'G04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (65, N'G05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (66, N'G06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (67, N'G07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (68, N'G08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (69, N'G09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (70, N'G10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (751, N'G11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (752, N'G12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (71, N'H01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (72, N'H02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (73, N'H03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (74, N'H04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (75, N'H05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (76, N'H06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (77, N'H07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (78, N'H08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (79, N'H09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (80, N'H10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (753, N'H11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (754, N'H12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (755, N'I01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (756, N'I02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (757, N'I03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (758, N'I04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (759, N'I05')
GO
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (760, N'I06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (761, N'I07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (762, N'I08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (763, N'I09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (764, N'I10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (765, N'I11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (766, N'I12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (81, N'J01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (82, N'J02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (83, N'J03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (84, N'J04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (85, N'J05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (86, N'J06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (87, N'J07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (88, N'J08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (89, N'J09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (90, N'J10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (777, N'J11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (778, N'J12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (91, N'K01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (92, N'K02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (93, N'K03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (94, N'K04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (95, N'K05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (767, N'K06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (768, N'K07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (769, N'K08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (770, N'K09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (771, N'K10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (779, N'K11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (780, N'K12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (772, N'L01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (773, N'L02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (774, N'L03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (775, N'L04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (776, N'L05')
SET IDENTITY_INSERT [dbo].[GHE] OFF
SET IDENTITY_INSERT [dbo].[KHACH_HANG] ON 

INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (32, N'Võ Mạnh Duy', CAST(N'2002-10-17' AS Date), N'0344668675', N'Hồ Chí Minh', 0, N'khach@gmail.com', NULL)
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (35, N'Lê Trần Thanh Nguyên', CAST(N'2024-06-29' AS Date), N'0229292929', N'Hồ Chí Minh', 1, N'khach2@gmail.com', NULL)
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (51, N'Nguyễn Thành Nhân', CAST(N'2002-08-16' AS Date), N'0344448674', N'Hồ Chí Minh', 1, N'thanhtrung8674@gmail.com', NULL)
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (52, N'Nguyễn Thành Đạt', CAST(N'1996-09-16' AS Date), N'0346648674', N'Vùng Tàu', 1, N'khach3@gmail.com', NULL)
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (53, N'Nguyễn Quốc Khoa', CAST(N'1997-06-06' AS Date), N'0969895549', N'Hồ Chí Minh', 1, N'tranhatdong1808@gmail.com', NULL)
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (54, N'Nguyễn Quốc Khoa', CAST(N'2003-05-03' AS Date), N'0969895549', N'Hồ Chí Minh', 0, N'nguyenquockhoa5549@gmail.com', N'transparent_image.png')
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (55, N'Phan Thị Diệu', CAST(N'2003-03-05' AS Date), N'0229292929', N'Hà Nội', 0, N'phanthidieu@gmail.com', NULL)
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (56, N'Ken Nguyen', CAST(N'2003-03-05' AS Date), N'0928222211', N'Vùng Tàu', 1, N'abcxyz@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[KHACH_HANG] OFF
SET IDENTITY_INSERT [dbo].[LICH_CHIEU] ON 

INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (88, CAST(N'2024-12-22' AS Date), CAST(N'08:00:00' AS Time), NULL, N'P01', 37)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (89, CAST(N'2024-12-22' AS Date), CAST(N'08:30:00' AS Time), NULL, N'P02', 41)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (90, CAST(N'2024-12-22' AS Date), CAST(N'10:30:00' AS Time), NULL, N'P01', 37)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (91, CAST(N'2024-12-22' AS Date), CAST(N'11:30:00' AS Time), NULL, N'P03', 38)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (92, CAST(N'2024-12-22' AS Date), CAST(N'12:30:00' AS Time), NULL, N'P02', 41)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (93, CAST(N'2024-12-22' AS Date), CAST(N'16:30:00' AS Time), NULL, N'P02', 41)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (94, CAST(N'2024-12-22' AS Date), CAST(N'20:30:00' AS Time), NULL, N'P02', 41)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (95, CAST(N'2024-12-22' AS Date), CAST(N'12:30:00' AS Time), NULL, N'P01', 37)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (96, CAST(N'2024-12-22' AS Date), CAST(N'14:00:00' AS Time), NULL, N'P03', 38)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (97, CAST(N'2024-12-22' AS Date), CAST(N'16:30:00' AS Time), NULL, N'P03', 38)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (98, CAST(N'2024-12-22' AS Date), CAST(N'19:00:00' AS Time), NULL, N'P03', 38)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (99, CAST(N'2024-12-22' AS Date), CAST(N'21:30:00' AS Time), NULL, N'P03', 38)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (100, CAST(N'2024-12-22' AS Date), CAST(N'15:00:00' AS Time), NULL, N'P01', 40)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (101, CAST(N'2024-12-22' AS Date), CAST(N'17:45:00' AS Time), NULL, N'P01', 40)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (102, CAST(N'2024-12-22' AS Date), CAST(N'20:45:00' AS Time), NULL, N'P01', 40)
SET IDENTITY_INSERT [dbo].[LICH_CHIEU] OFF
SET IDENTITY_INSERT [dbo].[LOAIGHE] ON 

INSERT [dbo].[LOAIGHE] ([IdLoaiGhe], [TenLoai], [Gia]) VALUES (1, N'Thường', 45000.0000)
INSERT [dbo].[LOAIGHE] ([IdLoaiGhe], [TenLoai], [Gia]) VALUES (2, N'Vip', 50000.0000)
INSERT [dbo].[LOAIGHE] ([IdLoaiGhe], [TenLoai], [Gia]) VALUES (3, N'Sweetbox', 100000.0000)
SET IDENTITY_INSERT [dbo].[LOAIGHE] OFF
SET IDENTITY_INSERT [dbo].[NHAN_VIEN] ON 

INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai], [MaChiNhanh]) VALUES (5, N'Nguyễn Vũ Hải', CAST(N'2001-07-09' AS Date), N'21160037', N'0814201801', N'Cà Mau', 1, N'quanly@gmail.com', 1, 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai], [MaChiNhanh]) VALUES (25, N'Trà Nhật Đông', CAST(N'2005-06-16' AS Date), N'301721680', N'0344448674', N'Quãng Ngãi', 1, N'nhanvien1@gmail.com', 1, 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai], [MaChiNhanh]) VALUES (33, N'Nguyễn Quốc Khoa', CAST(N'2005-06-09' AS Date), N'301721689', N'0344448679', N'Tiền Giang', 1, N'quanlyTuTruTienGiang@gmail.com', 1, 2)
SET IDENTITY_INSERT [dbo].[NHAN_VIEN] OFF
SET IDENTITY_INSERT [dbo].[PHIM] ON 

INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (37, N'Dân Chơi Không Sợ Con Rơi', N'Quân là cao thủ tán gái thượng thừa. Anh chàng có thói quen thay bồ như thay áo và thường không có thói quen đối xử thật lòng với cô nàng nào cả. Đang trên con đường rong chơi tuổi trẻ, bỗng nhiên Linh - người yêu cũ của Quân xuất hiện và giao con của 2 người cho anh nuôi. Từ trai độc thân phải trở thành gà trống nuôi con, Quân đành phải tu chí làm ăn, cố gắng kiếm tiền để nuôi con gái.  Thời gian trôi qua, Quân và bé Thỏ đang chung sống vui vẻ thì Linh quay về muốn nhận lại con. Số phận của hai cha con sẽ thế nào?', N'Việt Nam', CAST(N'2024-12-22' AS Date), 2023, 88, N'posterdanchoikhongsoconroi.jpg', N'https://www.youtube.com/watch?v=2BOCZ5ax5qk', NULL, 1, 1033)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (38, N'Nhà Bà Nữ', N'Bộ phim xoay quanh gia đình ba thế hệ của bà Ngọc Nữ, một gia đình làm nghề bán bánh canh cua trong một khu chung cư cũ do ông Liêm quản lý. Bà Ngọc Nữ có người mẹ tên Ngọc Ngà hai đứa con gái là Ngọc Như và Ngọc Nhi. Do có mâu thuẫn với chồng, cả hai ly hôn và chồng bà rời bỏ gia đình, bà Ngọc Nữ đã một mình nuôi lớn hai đứa con nên bà có mối thù cực kỳ lớn đối với những người đàn ông.', N'Việt Nam', CAST(N'2024-12-22' AS Date), 2023, 103, N'nhabanu.webp', N'https://www.youtube.com/watch?v=IkaP0KJWTsQ', NULL, 1, 1034)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (39, N'Lật Mặt 6: Tấm Vé Định Mệnh', N'Phim kể về tấm vé số có mệnh giá 10 ngàn đồng và sở hữu những con số "định mệnh" gồm 10, 16, 18, 20, 27, 28 - đây là tập hợp những con số ngày sinh của hội bạn thân gồm 6 người: Phương, Khanh, Phát, An, Toàn và Lộc. Câu chuyện bắt đầu khi Phương mua một tấm vé số có dãy số là tập hợp ngày sinh của cả 6 người. Và nếu như tấm vé này may mắn trúng giải, họ sẽ chia đều tiền thưởng cho cả 6 người.', N'Việt Nam', CAST(N'2024-12-22' AS Date), 2023, 132, N'tamvedinhmenh.jpg', N'https://www.youtube.com/watch?v=L-XhraxUsAs', NULL, 0, 1035)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (40, N'Gã Hề Điên Loạn', N'Một người phụ nữ bị biến dạng khuôn mặt, người đã sống sót sau vụ thảm sát năm trước, được phỏng vấn cho một chương trình trò chuyện trên TV . Khi chương trình kết thúc, người dẫn chương trình, Monica Brown, đã đưa ra những bình luận tàn nhẫn với bạn trai của cô về ngoại hình của người phụ nữ, chỉ để người phụ nữ đó thoát ra khỏi chỗ ẩn nấp và cắt xẻo cô.', N'Hoa Kỳ', CAST(N'2024-12-22' AS Date), 2023, 130, N'postergahedienloan.jpg', N'https://www.youtube.com/watch?v=zaPcin5knJk', NULL, 1, 1036)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (41, N'Titanic - Chuyến Tàu Định Mệnh', N'Năm 1996, nhà săn tìm kho báu Brock Lovett và đội của anh lên chiếc tàu nghiên cứu Akademik Mstislav Keldysh đến vị trí xác tàu RMS Titanic huyền thoại ở biển Đại Tây Dương nhằm tìm kiếm một chiếc vòng cổ có đính một viên kim cương rất hiếm, Trái tim của Đại dương. Họ vớt được một chiếc két, bên trong có bức tranh một người phụ nữ trẻ khỏa thân trên người chỉ đeo duy nhất chiếc vòng cổ đó thôi.', N'Hoa Kỳ', CAST(N'2024-12-22' AS Date), 2023, 195, N'postertitanic.jfif', N'https://www.youtube.com/watch?v=gs5GwXOgumc', NULL, 1, 1037)
SET IDENTITY_INSERT [dbo].[PHIM] OFF
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [MaChiNhanh]) VALUES (N'P01', 0, 1)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [MaChiNhanh]) VALUES (N'P02', 0, 1)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [MaChiNhanh]) VALUES (N'P03', 0, 1)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [MaChiNhanh]) VALUES (N'P04', 0, 2)
INSERT [dbo].[QUYEN] ([MaQuyen], [TenQuyen]) VALUES (N'KH', N'Khách Hàng')
INSERT [dbo].[QUYEN] ([MaQuyen], [TenQuyen]) VALUES (N'NV', N'Nhân Viên')
INSERT [dbo].[QUYEN] ([MaQuyen], [TenQuyen]) VALUES (N'QL', N'Quản Lý')
SET IDENTITY_INSERT [dbo].[SUKIEN] ON 

INSERT [dbo].[SUKIEN] ([MaSK], [TenSK], [MoTaSK], [ChiTietSK], [PosterSK]) VALUES (1, N'Thứ 4 vui vẻ - Thứ 4 siêu rẻ', N'Thứ 4 hàng tuần Tứ Trụ Cinema khuyến mãi 20% cho toàn bộ hóa đơn', N'<div class="row">
	<div class="col-md-6 mx-auto">
  		<img src="images/posterngangthutu.png" class="w-100" alt="">
	</div>
</div>
<hr>
<br>
<p>Bạn có biết gì không? Mỗi thứ 4 hàng tuần, Tứ Trụ Cinema mang đến cho bạn một trải nghiệm điện ảnh không thể bỏ lỡ với chương trình khuyến mãi <strong>Thứ 4 Vui Vẻ - Thứ 4 Siêu Rẻ!</strong></p>
<div class="text-center">
<img src="images/icon-bap.gif" class="icon-bap">
<p class="col_red"><b>Chi Tiết Khuyến Mãi</b></p>
<ul>
   <li><strong>Giảm ngay 20%</strong> cho toàn bộ hóa đơn</li>
   <li>Áp dụng cho tất cả các bộ phim và mọi suất chiếu</li>
   <li>Không giới hạn số lượng vé mua</li>
</ul>
<div class="row">
	<div class="col-md-6 mx-auto">
  		<img src="images/eventsale20%25.png" class="w-75" alt="">
	</div>
</div>
<br>
<img src="images/icon-traitim.gif" class="icon-traitim">
<p class="col_red"><b>Tại Sao Bạn Nên Đến Tứ Trụ Cinema vào Thứ 4?</b></p>
<ul>
    <li><strong>Phòng chiếu hiện đại</strong>: Chất lượng âm thanh và hình ảnh đỉnh cao</li>
    <li><strong>Không gian thoải mái</strong>: Ghế ngồi êm ái, thoáng đãng</li>
    <li><strong>Dịch vụ chu đáo</strong>: Nhân viên nhiệt tình, thân thiện</li>
    <li><strong>Ưu đãi hấp dẫn</strong>: Tiết kiệm chi phí, tận hưởng trọn vẹn</li>
</ul>
<div class="row">
	<div class="col-md-6 mx-auto">
  		<img src="images/phongchieuphim.png" class="w-75" alt="">
	</div>
</div>
<br>
<img src="images/icon-moigoi.gif" class="icon-moigoi">
<p class="col_red"><b>Hãy Đến Ngay và Trải Nghiệm</b></p>
</div>
<p>Còn chần chừ gì nữa? Hãy lên lịch ngay từ bây giờ để tận hưởng một ngày thứ 4 thật vui vẻ và tiết kiệm tại Tứ Trụ Cinema. Cùng gia đình, bạn bè thưởng thức những bộ phim bom tấn và nhận ngay ưu đãi tuyệt vời này!</p>
<p class="text-center"><strong>Tứ Trụ Cinema - Điểm đến lý tưởng cho những tín đồ điện ảnh!</strong></p>
<p class="text-center"><strong>Tứ Trụ Cinema - Nơi hội tụ cảm xúc!</strong></p>
<hr>
<br>', N'http://localhost:9999/DoAnWebCinema/images/eventsale20%25.png')
INSERT [dbo].[SUKIEN] ([MaSK], [TenSK], [MoTaSK], [ChiTietSK], [PosterSK]) VALUES (2, N'Tứ Trụ lên vùng cao', N'Mang phim lên vùng cao là một hoạt động ý nghĩa và đầy nhân văn, nhằm mang đến niềm vui cho các trẻ em ở những khu vực khó khăn', N'<div class="row">
	<div class="col-md-6 mx-auto">
  		<img src="images/posterngangtutrulenvungcao.jpg" class="w-100" alt="">
	</div>
</div>
<hr>
<br>
<div class="text-center">
<p class="col_red"><b>Tứ Trụ Lên Vùng Cao: Sứ Mệnh Văn Hóa Và Nhân Văn</b></p>
</div>
<p>Bạn đã từng tưởng tượng rằng mỗi bước chân của bạn trong thế giới điện ảnh có thể mang lại niềm vui và tri thức cho những đứa trẻ ở những vùng cao khó khăn chưa? Hãy cùng Tứ Trụ Cinema biến ước mơ đó thành hiện thực với sự kiện đặc biệt <span class="highlight">"Tứ Trụ Lên Vùng Cao"!</span></p>
<div class="text-center">
<p class="col_red"><b>Sứ Mệnh Văn Hóa</b></p>
</div>
<p>Tứ Trụ Cinema không chỉ là nơi giải trí mà còn là trái tim văn hóa, nơi tôn vinh giá trị nhân văn và truyền cảm hứng cho tương lai. Chúng tôi tin rằng mỗi đứa trẻ, bất kể ở đâu, đều có quyền được tiếp cận với niềm vui và tri thức qua nghệ thuật điện ảnh.</p>
<div class="text-center">
<p class="col_red"><b>Mục Tiêu</b></p>
</div>
<p>Chúng tôi đặt mục tiêu là mang những bộ phim chất lượng và ý nghĩa lên những vùng cao, nơi mà việc tiếp cận với văn hóa và giáo dục thường xuyên bị hạn chế. Chúng tôi muốn tạo ra một trải nghiệm điện ảnh đáng nhớ và ý nghĩa cho những em nhỏ, giúp họ mơ ước và khám phá thế giới xung quanh mình.</p>
<div class="text-center">
<p class="col_red"><b>Lịch Trình Sự Kiện</b></p>
</div>
<ul>
    <li><strong>Thời gian:</strong> Ngày 20 tháng 7</li>
    <li><strong>Địa điểm:</strong> Các vùng cao tại miền Bắc, miền Trung và miền Nam</li>
    <li><strong>Chương Trình:</strong> Chiếu miễn phí các bộ phim phù hợp với độ tuổi và nhu cầu giáo dục của trẻ em, cùng với các hoạt động văn hóa, trò chơi và quà tặng bất ngờ.</li>
</ul>

<p>Hãy Tham Gia Và Đóng Góp để cùng Tứ Trụ Cinema lan tỏa tình yêu và sự quan tâm đến cộng đồng bằng cách tham gia và đóng góp cho sự kiện <span class="highlight">"Tứ Trụ Lên Vùng Cao"</span>. Bạn có thể ủng hộ bằng cách đóng góp quà tặng, thời gian hoặc tài chính để chúng tôi có thể đưa niềm vui và tri thức đến với những trẻ em ở những vùng xa xôi nhất.</p>
<div class="text-center">
	<div class="row">
	<div class="col-md-6 mx-auto">
  		<img src="images/eventmangphimlenvungcao.png" class="w-75" alt="">
	</div>
	</div>
	<br>
	<p class="highlight"><b>Hãy Cùng Nhau Tạo Nên Một Tương Lai Tươi Sáng Cho Các Thế Hệ Trẻ!</b></p>
	<p><strong>Tứ Trụ Cinema - Nơi Kết Nối Yêu Thương Và Tri Thức!</strong></p>
	<p class="highlight"><b>Tứ Trụ Cinema - Nơi hội tụ cảm xúc!</b></p>
</div>', N'http://localhost:9999/DoAnWebCinema/images/eventmangphimlenvungcao.png')
INSERT [dbo].[SUKIEN] ([MaSK], [TenSK], [MoTaSK], [ChiTietSK], [PosterSK]) VALUES (3, N'Tứ Trụ chiêu dụ', N'Ở Rạp Phim Tứ Trụ Có Gì Mà Bạn Bị Chiêu Dụ?', N'<div class="row">
	<div class="col-md-6 mx-auto">
  		<img src="images/posterngangchieudu.png" class="w-100" alt="">
	</div>
</div>
<hr>
<br>
<div class="text-center">
<p class="col_red"><b> Không Gian Sang Trọng, Hiện Đại</b></p>
</div>
<p>Ngay từ khi bước vào Rạp Phim Tứ Trụ, bạn sẽ cảm nhận được không gian sang trọng và hiện đại. Thiết kế nội thất tinh tế, ánh sáng dịu nhẹ cùng với các tiện nghi cao cấp sẽ khiến bạn cảm thấy như đang bước vào một thế giới hoàn toàn khác, nơi mà mọi thứ đều được chăm chút tỉ mỉ để mang đến trải nghiệm tốt nhất cho khán giả.</p>
<div class="text-center">
<p class="col_red"><b>Âm Thanh và Hình Ảnh Đỉnh Cao</b></p>
</div>
<p>Tứ Trụ Cinema không chỉ là nơi giải trí mà còn là trái tim văn hóa, nơi tôn vinh giá trị nhân văn và truyền cảm hứng cho tương lai. Chúng tôi tin rằng mỗi đứa trẻ, bất kể ở đâu, đều có quyền được tiếp cận với niềm vui và tri thức qua nghệ thuật điện ảnh.</p>
<div class="text-center">
<p class="col_red"><b>Mục Tiêu</b></p>
</div>
<p>Rạp Phim Tứ Trụ tự hào sở hữu hệ thống âm thanh vòm và màn hình 4K chất lượng cao, đem lại những trải nghiệm hình ảnh sống động và âm thanh chân thực nhất. Bạn sẽ được đắm chìm trong từng khung hình, cảm nhận rõ ràng từng âm thanh, từ tiếng gió thổi nhẹ nhàng đến những pha hành động kịch tính.</p>
<div class="text-center">
<p class="col_red"><b>Đa Dạng Phim Ảnh</b></p>
</div>
<p>Rạp Phim Tứ Trụ luôn cập nhật các bộ phim mới nhất, từ phim bom tấn Hollywood đến các bộ phim nghệ thuật đặc sắc, từ phim hành động gay cấn đến phim tình cảm lãng mạn. Bạn sẽ luôn có nhiều lựa chọn phong phú để thỏa mãn đam mê điện ảnh của mình.</p>
<div class="text-center">
<p class="col_red"><b>Ghế Ngồi Thoải Mái</b></p>
</div>
<p>Một trong những điểm nhấn của Rạp Phim Tứ Trụ chính là hệ thống ghế ngồi cực kỳ thoải mái. Ghế được thiết kế với chất liệu cao cấp, có thể điều chỉnh để phù hợp với mọi tư thế ngồi, giúp bạn có thể thư giãn hoàn toàn trong suốt thời gian xem phim.</p>
<div class="text-center">
<p class="col_red"><b>Dịch Vụ Khách Hàng Tận Tâm</b></p>
</div>
<p>Đội ngũ nhân viên tại Rạp Phim Tứ Trụ luôn sẵn sàng hỗ trợ và phục vụ bạn một cách tận tình nhất. Từ việc hướng dẫn chỗ ngồi, hỗ trợ đặt vé, đến việc giải đáp mọi thắc mắc, tất cả đều được thực hiện với thái độ chuyên nghiệp và thân thiện, mang đến cho bạn cảm giác thoải mái và hài lòng.</p>
<div class="text-center">
<p class="col_red"><b>Ưu Đãi Hấp Dẫn</b></p>
</div>
<p>Ngoài chất lượng dịch vụ và cơ sở vật chất, Rạp Phim Tứ Trụ còn thường xuyên có các chương trình ưu đãi hấp dẫn dành cho khán giả như giảm giá vé, tặng kèm bắp rang bơ và nước ngọt, hay các sự kiện giao lưu với diễn viên, đạo diễn nổi tiếng. Đây là cơ hội tuyệt vời để bạn vừa tiết kiệm chi phí, vừa có những trải nghiệm thú vị. Không chỉ dừng lại ở việc xem phim, Rạp Phim Tứ Trụ còn tích hợp các khu vực ăn uống và giải trí hiện đại. Bạn có thể thưởng thức những món ăn ngon, uống những ly cà phê thơm lừng, hay tham gia các trò chơi giải trí thú vị cùng bạn bè và gia đình.</p>
<div class="text-center">
	<br>
	<p class="highlight"><b>Tứ Trụ Cinema - Nơi hội tụ cảm xúc!</b></p>
</div>', N'http://localhost:9999/DoAnWebCinema/images/posterdocchieudu.png')
SET IDENTITY_INSERT [dbo].[SUKIEN] OFF
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'abcxyz@gmail.com', N'KH', N'ed1b95b0728d4e8e4496598550e2fb9d                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'khach@gmail.com', N'KH', N'827ccb0eea8a706c4c34a16891f84e7b                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'khach2@gmail.com', N'KH', N'827ccb0eea8a706c4c34a16891f84e7b                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'khach3@gmail.com', N'KH', N'2e9ec317e197819358fbc43afca7d837                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nguyenquockhoa5549@gmail.com', N'KH', N'880c58e1e87a98b208f71b5ddab3ae57                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nhanvien1@gmail.com', N'NV', N'81dc9bdb52d04dc20036dbd8313ed055                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nhanvien2@gmail.com', N'NV', N'81dc9bdb52d04dc20036dbd8313ed055                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nhanvien3@gmail.com', N'NV', N'81dc9bdb52d04dc20036dbd8313ed055                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'phanthidieu@gmail.com', N'KH', N'4facb2794b7b95a9997b09727d3ea8ce                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'quanly@gmail.com', N'QL', N'202cb962ac59075b964b07152d234b70                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'quanlyTuTruTienGiang@gmail.com', N'QL', N'81dc9bdb52d04dc20036dbd8313ed055                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'thanhtrung8674@gmail.com', N'KH', N'827ccb0eea8a706c4c34a16891f84e7b                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'tranhatdong1808@gmail.com', N'KH', N'185317219bbdc2991a9e6f518affd353                  ')
SET IDENTITY_INSERT [dbo].[THAYDOIGIA] ON 

INSERT [dbo].[THAYDOIGIA] ([IdThayDoiGia], [LyDoThayDoi], [NgayThayDoi]) VALUES (1, N'Giảm giá đêm khuya', NULL)
INSERT [dbo].[THAYDOIGIA] ([IdThayDoiGia], [LyDoThayDoi], [NgayThayDoi]) VALUES (2, N'Buổi sáng nhẹ nhàng', NULL)
SET IDENTITY_INSERT [dbo].[THAYDOIGIA] OFF
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (1, N'Hài ')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (2, N'Hành động ')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (3, N'Học Đường')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (4, N'Hoạt Hình')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (5, N'Kinh Dị')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (6, N'Khoa học viễn tưởng')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (7, N'Lãng Mạn')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (8, N'Phiêu Lưu')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (9, N'Phim Tài Liệu')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (10, N'Tình Cảm')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (11, N'Tâm Lý')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (12, N'Tâm lý tình cảm')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (13, N'Thần Thoại')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (14, N'Tâm linh')
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (1, 37)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (1, 38)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (1, 39)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (2, 39)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (2, 40)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (5, 40)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (7, 38)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (7, 41)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (8, 41)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (10, 41)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (12, 37)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (12, 38)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (12, 39)
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (37, 25, N'Quân')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (37, 26, N'Linh, người yêu cũ của Quân')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (38, 27, N'John')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (38, 28, N'Ngọc Nhi')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (39, 29, N'Khanh')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (39, 30, N'Phát')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (40, 31, N'Tara Heyes')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (40, 32, N'Victoria Heyes')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (41, 31, N'Rose')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (41, 33, N'Jack')
SET IDENTITY_INSERT [dbo].[VE] ON 

INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1420, 98, 54, CAST(N'2024-12-21' AS Date), NULL, 1, 1311, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1421, 91, 54, CAST(N'2024-12-21' AS Date), NULL, 1, 1271, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1422, 91, 54, CAST(N'2024-12-21' AS Date), NULL, 1, 1272, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1423, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1119, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1424, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1120, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1425, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1121, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1426, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1122, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1427, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1163, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1428, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1164, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1429, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1165, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1430, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1166, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1431, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1167, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1432, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1168, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1433, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1169, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1434, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1170, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1435, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1171, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1436, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1185, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1437, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1186, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (1438, 94, 56, CAST(N'2024-12-22' AS Date), NULL, 1, 1187, NULL)
SET IDENTITY_INSERT [dbo].[VE] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_CHITIET_GHE_PHONG]    Script Date: 12/25/2024 7:49:41 PM ******/
ALTER TABLE [dbo].[CHITIET_GHE_PHONG] ADD  CONSTRAINT [UK_CHITIET_GHE_PHONG] UNIQUE NONCLUSTERED 
(
	[IdGhe] ASC,
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_TENGHE]    Script Date: 12/25/2024 7:49:41 PM ******/
ALTER TABLE [dbo].[GHE] ADD  CONSTRAINT [UK_TENGHE] UNIQUE NONCLUSTERED 
(
	[TenGhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GHE]    Script Date: 12/25/2024 7:49:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_GHE] ON [dbo].[GHE]
(
	[TenGhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Khach_Hang]    Script Date: 12/25/2024 7:49:41 PM ******/
ALTER TABLE [dbo].[KHACH_HANG] ADD  CONSTRAINT [IX_Khach_Hang] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_MaPhim_GioChieu]    Script Date: 12/25/2024 7:49:41 PM ******/
ALTER TABLE [dbo].[LICH_CHIEU] ADD  CONSTRAINT [UK_MaPhim_GioChieu] UNIQUE NONCLUSTERED 
(
	[MaPhim] ASC,
	[GioChieu] ASC,
	[NgayChieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_NHAN_VIEN]    Script Date: 12/25/2024 7:49:41 PM ******/
ALTER TABLE [dbo].[NHAN_VIEN] ADD  CONSTRAINT [IX_NHAN_VIEN] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_NHAN_VIEN_cmnd]    Script Date: 12/25/2024 7:49:41 PM ******/
ALTER TABLE [dbo].[NHAN_VIEN] ADD  CONSTRAINT [IX_NHAN_VIEN_cmnd] UNIQUE NONCLUSTERED 
(
	[CMND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_GHEDAT_KHACHHANG]    Script Date: 12/25/2024 7:49:41 PM ******/
ALTER TABLE [dbo].[VE] ADD  CONSTRAINT [UK_GHEDAT_KHACHHANG] UNIQUE NONCLUSTERED 
(
	[MaSuatChieu] ASC,
	[MaKH] ASC,
	[IdGheDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CHITIET_GHE_PHONG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIET_GHE_PHONG_GHE] FOREIGN KEY([IdGhe])
REFERENCES [dbo].[GHE] ([IdGhe])
GO
ALTER TABLE [dbo].[CHITIET_GHE_PHONG] CHECK CONSTRAINT [FK_CHITIET_GHE_PHONG_GHE]
GO
ALTER TABLE [dbo].[CHITIET_GHE_PHONG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIET_GHE_PHONG_LOAIGHE] FOREIGN KEY([IdLoaiGhe])
REFERENCES [dbo].[LOAIGHE] ([IdLoaiGhe])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CHITIET_GHE_PHONG] CHECK CONSTRAINT [FK_CHITIET_GHE_PHONG_LOAIGHE]
GO
ALTER TABLE [dbo].[CHITIET_GHE_PHONG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIET_GHE_PHONG_PHONG] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[PHONG] ([MaPhong])
GO
ALTER TABLE [dbo].[CHITIET_GHE_PHONG] CHECK CONSTRAINT [FK_CHITIET_GHE_PHONG_PHONG]
GO
ALTER TABLE [dbo].[CHITIET_THAYDOIGIA]  WITH CHECK ADD  CONSTRAINT [FK_CHITIET_THAYDOIGIA_LICH_CHIEU] FOREIGN KEY([MaSuatChieu])
REFERENCES [dbo].[LICH_CHIEU] ([MaSuatChieu])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CHITIET_THAYDOIGIA] CHECK CONSTRAINT [FK_CHITIET_THAYDOIGIA_LICH_CHIEU]
GO
ALTER TABLE [dbo].[CHITIET_THAYDOIGIA]  WITH CHECK ADD  CONSTRAINT [FK_CHITIET_THAYDOIGIA_THAYDOIGIA] FOREIGN KEY([IdThayDoi])
REFERENCES [dbo].[THAYDOIGIA] ([IdThayDoiGia])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CHITIET_THAYDOIGIA] CHECK CONSTRAINT [FK_CHITIET_THAYDOIGIA_THAYDOIGIA]
GO
ALTER TABLE [dbo].[DANHGIAPHIM]  WITH CHECK ADD  CONSTRAINT [FK_DANHGIAPHIM_KHACH_HANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACH_HANG] ([MaKH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DANHGIAPHIM] CHECK CONSTRAINT [FK_DANHGIAPHIM_KHACH_HANG]
GO
ALTER TABLE [dbo].[DANHGIAPHIM]  WITH CHECK ADD  CONSTRAINT [FK_DANHGIAPHIM_PHIM] FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DANHGIAPHIM] CHECK CONSTRAINT [FK_DANHGIAPHIM_PHIM]
GO
ALTER TABLE [dbo].[KHACH_HANG]  WITH CHECK ADD  CONSTRAINT [FK_KHACH_HANG_TAIKHOAN] FOREIGN KEY([Email])
REFERENCES [dbo].[TAIKHOAN] ([Email])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KHACH_HANG] CHECK CONSTRAINT [FK_KHACH_HANG_TAIKHOAN]
GO
ALTER TABLE [dbo].[LICH_CHIEU]  WITH CHECK ADD  CONSTRAINT [FK_LICH_CHIEU_PHIM] FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LICH_CHIEU] CHECK CONSTRAINT [FK_LICH_CHIEU_PHIM]
GO
ALTER TABLE [dbo].[LICH_CHIEU]  WITH CHECK ADD  CONSTRAINT [FK_LICH_CHIEU_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[PHONG] ([MaPhong])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LICH_CHIEU] CHECK CONSTRAINT [FK_LICH_CHIEU_Phong]
GO
ALTER TABLE [dbo].[NHAN_VIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHAN_VIEN_CHINHANH] FOREIGN KEY([MaChiNhanh])
REFERENCES [dbo].[CHINHANH] ([MaChiNhanh])
GO
ALTER TABLE [dbo].[NHAN_VIEN] CHECK CONSTRAINT [FK_NHAN_VIEN_CHINHANH]
GO
ALTER TABLE [dbo].[NHAN_VIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHAN_VIEN_TAIKHOAN] FOREIGN KEY([Email])
REFERENCES [dbo].[TAIKHOAN] ([Email])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[NHAN_VIEN] CHECK CONSTRAINT [FK_NHAN_VIEN_TAIKHOAN]
GO
ALTER TABLE [dbo].[PHIM]  WITH CHECK ADD  CONSTRAINT [FK_PHIM_DAODIEN] FOREIGN KEY([IdDaoDien])
REFERENCES [dbo].[DAODIEN] ([IdDaoDien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PHIM] CHECK CONSTRAINT [FK_PHIM_DAODIEN]
GO
ALTER TABLE [dbo].[PHONG]  WITH CHECK ADD  CONSTRAINT [FK_PHONG_CHINHANH] FOREIGN KEY([MaChiNhanh])
REFERENCES [dbo].[CHINHANH] ([MaChiNhanh])
GO
ALTER TABLE [dbo].[PHONG] CHECK CONSTRAINT [FK_PHONG_CHINHANH]
GO
ALTER TABLE [dbo].[TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK_TAIKHOAN_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[QUYEN] ([MaQuyen])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TAIKHOAN] CHECK CONSTRAINT [FK_TAIKHOAN_Quyen]
GO
ALTER TABLE [dbo].[THE_LOAI_PHIM]  WITH CHECK ADD  CONSTRAINT [FK__THE_LOAI_P__MaTL__1AD3FDA4] FOREIGN KEY([MaTL])
REFERENCES [dbo].[THE_LOAI] ([MaTL])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[THE_LOAI_PHIM] CHECK CONSTRAINT [FK__THE_LOAI_P__MaTL__1AD3FDA4]
GO
ALTER TABLE [dbo].[THE_LOAI_PHIM]  WITH CHECK ADD  CONSTRAINT [FK_THE_LOAI_PHIM_PHIM] FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[THE_LOAI_PHIM] CHECK CONSTRAINT [FK_THE_LOAI_PHIM_PHIM]
GO
ALTER TABLE [dbo].[VAIDIEN]  WITH CHECK ADD  CONSTRAINT [FK_VAIDIEN_DIENVIEN] FOREIGN KEY([IdDienVien])
REFERENCES [dbo].[DIENVIEN] ([IdDienVien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[VAIDIEN] CHECK CONSTRAINT [FK_VAIDIEN_DIENVIEN]
GO
ALTER TABLE [dbo].[VAIDIEN]  WITH CHECK ADD  CONSTRAINT [FK_VAIDIEN_PHIM] FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[VAIDIEN] CHECK CONSTRAINT [FK_VAIDIEN_PHIM]
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD  CONSTRAINT [FK__VE__MaKH__2E1BDC42] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACH_HANG] ([MaKH])
GO
ALTER TABLE [dbo].[VE] CHECK CONSTRAINT [FK__VE__MaKH__2E1BDC42]
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD  CONSTRAINT [FK__VE__MaSuatChieu__0F624AF8] FOREIGN KEY([MaSuatChieu])
REFERENCES [dbo].[LICH_CHIEU] ([MaSuatChieu])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[VE] CHECK CONSTRAINT [FK__VE__MaSuatChieu__0F624AF8]
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD  CONSTRAINT [FK_VE_CHITIET_GHE_PHONG] FOREIGN KEY([IdGheDat])
REFERENCES [dbo].[CHITIET_GHE_PHONG] ([IdGheDat])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[VE] CHECK CONSTRAINT [FK_VE_CHITIET_GHE_PHONG]
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD  CONSTRAINT [FK_VE_NHAN_VIEN] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHAN_VIEN] ([MaNV])
GO
ALTER TABLE [dbo].[VE] CHECK CONSTRAINT [FK_VE_NHAN_VIEN]
GO
ALTER TABLE [dbo].[PHIM]  WITH CHECK ADD  CONSTRAINT [CK_PHIM_Diem] CHECK  (([Diem]<=(5)))
GO
ALTER TABLE [dbo].[PHIM] CHECK CONSTRAINT [CK_PHIM_Diem]
GO
/****** Object:  StoredProcedure [dbo].[CapNhatTrangThaiPhim]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhatTrangThaiPhim]
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE Phim
        SET MaTT = 1
        WHERE NgayKhoiChieu <= GETDATE();
        COMMIT TRANSACTION;
        PRINT 'Cập nhật trạng thái phim thành công.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Có lỗi xảy ra trong quá trình cập nhật trạng thái phim.';
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Check_TrangThaiPhong]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Check_TrangThaiPhong]
    @MaPhim INT,
    @GioChieu TIME,
    @NgayChieu DATE,
    @MaPhong VARCHAR(10)
AS
BEGIN
    DECLARE @ThoiLuongPhim INT;
    DECLARE @BatDau DATETIME, @KetThuc DATETIME;
    DECLARE @BatDauCu DATETIME, @KetThucCu DATETIME;
    DECLARE @MaPhimCu INT;
    DECLARE @Result INT;

    SELECT @ThoiLuongPhim = ThoiLuong
    FROM Phim
    WHERE MaPhim = @MaPhim;

    SET @BatDau = CAST(@NgayChieu AS DATETIME) + CAST(@GioChieu AS DATETIME);
    SET @KetThuc = DATEADD(MINUTE, @ThoiLuongPhim + 10, @BatDau);

    PRINT 'ThoiLuongPhim: ' + CAST(@ThoiLuongPhim AS VARCHAR);
    PRINT 'BatDau: ' + CAST(@BatDau AS VARCHAR);
    PRINT 'KetThuc: ' + CAST(@KetThuc AS VARCHAR);

    DECLARE cur CURSOR FOR
    SELECT MaPhim, GioChieu
    FROM LICH_CHIEU
    WHERE MaPhong = @MaPhong
    AND NgayChieu = @NgayChieu;

    OPEN cur;
    FETCH NEXT FROM cur INTO @MaPhimCu, @GioChieu;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT @ThoiLuongPhim = ThoiLuong
        FROM Phim
        WHERE MaPhim = @MaPhimCu;

        SET @BatDauCu = CAST(@NgayChieu AS DATETIME) + CAST(@GioChieu AS DATETIME);
        SET @KetThucCu = DATEADD(MINUTE, @ThoiLuongPhim + 10, @BatDauCu);

        PRINT 'ThoiLuongPhim Cu: ' + CAST(@ThoiLuongPhim AS VARCHAR);
        PRINT 'BatDauCu: ' + CAST(@BatDauCu AS VARCHAR);
        PRINT 'KetThucCu: ' + CAST(@KetThucCu AS VARCHAR);

        IF (@BatDau < @KetThucCu AND @KetThuc > @BatDauCu)
        BEGIN
            PRINT N'Phòng đã có suất chiếu trong khoảng thời gian này.';
            SET @Result = 0;
            CLOSE cur;
            DEALLOCATE cur;
            SELECT @Result AS Result;  -- Trả về giá trị thông qua SELECT
            RETURN;
        END

        FETCH NEXT FROM cur INTO @MaPhimCu, @GioChieu;
    END

    CLOSE cur;
    DEALLOCATE cur;

    PRINT N'Phòng có thể được sử dụng cho suất chiếu mới.';
    SET @Result = 1;
    SELECT @Result AS Result;  -- Trả về giá trị thông qua SELECT
END;

GO
/****** Object:  StoredProcedure [dbo].[GetMovieRecommendations]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMovieRecommendations]
    @favorite_genre NVARCHAR(50), -- Thể loại yêu thích
    @favorite_time NVARCHAR(20)   -- Khung giờ yêu thích
AS
BEGIN
    SELECT TOP 3 p.TenPhim, lc.GioChieu
    FROM PHIM p
    JOIN LICH_CHIEU lc ON p.MaPhim = lc.MaPhim
    JOIN THE_LOAI_PHIM tlp ON p.MaPhim = tlp.MaPhim
    JOIN THE_LOAI tl ON tlp.MaTL = tl.MaTL
    WHERE tl.TenTL = @favorite_genre -- Thể loại yêu thích
    AND (
        (@favorite_time = N'Buổi tối' AND DATEPART(HOUR, lc.GioChieu) BETWEEN 18 AND 23) OR
        (@favorite_time = N'Buổi chiều' AND DATEPART(HOUR, lc.GioChieu) BETWEEN 12 AND 17) OR
        (@favorite_time = N'Buổi sáng' AND DATEPART(HOUR, lc.GioChieu) BETWEEN 6 AND 11)
    )
    ORDER BY NEWID() -- Gợi ý ngẫu nhiên
END

GO
/****** Object:  StoredProcedure [dbo].[SP_CapNhatTrangThaiPhim]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CapNhatTrangThaiPhim]
AS
BEGIN
    UPDATE Phim
    SET MaTT = 1
    WHERE NgayKhoiChieu <= GETDATE() 
          AND MaTT <> 0;

    UPDATE Phim
    SET MaTT = 2
    WHERE NgayKhoiChieu > GETDATE()
          AND MaTT <> 0;
END

GO
/****** Object:  StoredProcedure [dbo].[SP_TimKiemChiNhanhHayDatVe]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TimKiemChiNhanhHayDatVe]
    @MaKH INT
AS
BEGIN
    SELECT CN.MaChiNhanh, CN.TenChiNhanh, CN.DiaChi, COUNT(*) AS SoLuongDatVe
    FROM VE V
    JOIN LICH_CHIEU LC ON V.MaSuatChieu = LC.MaSuatChieu
    JOIN PHONG P ON LC.MaPhong = P.MaPhong
    JOIN CHINHANH CN ON P.MaChiNhanh = CN.MaChiNhanh
    WHERE V.MaKH = @MaKH
    GROUP BY CN.MaChiNhanh, CN.TenChiNhanh, CN.DiaChi
    ORDER BY SoLuongDatVe DESC
END
GO
/****** Object:  StoredProcedure [dbo].[ThongKeDanhGiaTheoPhim]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThongKeDanhGiaTheoPhim]
    @maPhim INT
AS
BEGIN
    SELECT 
        SUM(CASE WHEN Diem = 1 THEN 1 ELSE 0 END) AS SoLuong1Sao,
        SUM(CASE WHEN Diem = 2 THEN 1 ELSE 0 END) AS SoLuong2Sao,
        SUM(CASE WHEN Diem = 3 THEN 1 ELSE 0 END) AS SoLuong3Sao,
        SUM(CASE WHEN Diem = 4 THEN 1 ELSE 0 END) AS SoLuong4Sao,
        SUM(CASE WHEN Diem = 5 THEN 1 ELSE 0 END) AS SoLuong5Sao
    FROM DanhGiaPhim
    WHERE MaPhim = @maPhim
END

GO
/****** Object:  StoredProcedure [dbo].[ThongKePhim]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThongKePhim]
AS
BEGIN
    SELECT 
        p.TenPhim,
        COUNT(v.MaVe) AS SoVeBanRa,
        ISNULL(p.Diem, 0) AS Diem,
        (COUNT(v.MaVe) * 0.7 + ISNULL(p.Diem, 0) * 0.3) AS DiemTongHop
    FROM 
        PHIM p
    INNER JOIN 
        LICH_CHIEU lc ON p.MaPhim = lc.MaPhim
    LEFT JOIN 
        VE v ON lc.MaSuatChieu = v.MaSuatChieu
    WHERE p.MaTT = 1
    GROUP BY 
        p.MaPhim, p.TenPhim, p.Diem
    ORDER BY 
        DiemTongHop DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[ThongKePhimBanChayNhat]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThongKePhimBanChayNhat]
AS
BEGIN
    WITH DiemTongHopCTE AS (
        SELECT 
            p.MaPhim,
            p.TenPhim,
            COUNT(v.MaVe) AS SoLuongVe, 
			ISNULL(p.Diem, 0) AS Diem,
			(COUNT(v.MaVe) * 0.7 + ISNULL(p.Diem, 0) * 0.3) AS DiemTongHop
        FROM PHIM p
        INNER JOIN LICH_CHIEU lc ON p.MaPhim = lc.MaPhim
        LEFT JOIN VE v ON lc.MaSuatChieu = v.MaSuatChieu
        WHERE p.MaTT = 1
        GROUP BY p.MaPhim, p.TenPhim, p.Diem
    )
    SELECT TOP 1
        MaPhim,
        TenPhim,
        SoLuongVe,
        Diem,
        DiemTongHop
    FROM DiemTongHopCTE
    ORDER BY DiemTongHop DESC;
END;

GO
/****** Object:  StoredProcedure [dbo].[UpdateTrangThaiPhong]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTrangThaiPhong]
AS
BEGIN
    DECLARE @MaPhim INT, @GioChieu TIME, @ThoiLuong INT, @NgayChieu DATE, @MaPhong VARCHAR(10);
    DECLARE @ThoiLuongPhim INT;
    DECLARE @BatDau DATETIME, @KetThuc DATETIME;
    
    DECLARE cur CURSOR FOR
    SELECT MaPhim, GioChieu, NgayChieu, MaPhong
    FROM LICH_CHIEU
    WHERE NgayChieu = CAST(GETDATE() AS DATE);

    OPEN cur;

    FETCH NEXT FROM cur INTO @MaPhim, @GioChieu, @NgayChieu, @MaPhong;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT @ThoiLuongPhim = ThoiLuong
        FROM Phim
        WHERE MaPhim = @MaPhim;

        SET @BatDau = CAST(@NgayChieu AS DATETIME) + CAST(@GioChieu AS DATETIME);
        SET @KetThuc = DATEADD(MINUTE, @ThoiLuongPhim + 10, @BatDau);

        IF @BatDau <= GETDATE() AND @KetThuc >= GETDATE()
        BEGIN
            UPDATE Phong
            SET TrangThai = 1
            WHERE MaPhong = @MaPhong AND TrangThai != 1;
        END
        ELSE IF @KetThuc <= GETDATE()
        BEGIN
            UPDATE Phong
            SET TrangThai = 0 
            WHERE MaPhong = @MaPhong AND TrangThai != 0;
        END
        FETCH NEXT FROM cur INTO @MaPhim, @GioChieu, @NgayChieu, @MaPhong;
    END

    CLOSE cur;
    DEALLOCATE cur;
END;

GO
/****** Object:  Trigger [dbo].[Trg_Update_DiemDanhGiaPhim]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Trg_Update_DiemDanhGiaPhim]
ON [dbo].[DANHGIAPHIM]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE Phim
    SET Diem = (
        SELECT ROUND(AVG(CAST(Diem AS FLOAT)), 2)
        FROM DANHGIAPHIM
        WHERE DANHGIAPHIM.MaPhim = Phim.MaPhim
    )
    WHERE MaPhim IN (SELECT DISTINCT MaPhim FROM inserted) 
               OR MaPhim IN (SELECT DISTINCT MaPhim FROM deleted);
END
GO
/****** Object:  Trigger [dbo].[trg_AfterInsert_LichChieu]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_AfterInsert_LichChieu]
ON [dbo].[LICH_CHIEU]
AFTER INSERT
AS
BEGIN
    -- Khai báo các biến để lưu thông tin
    DECLARE @MaSuatChieu INT;
    DECLARE @GioChieu TIME(0);
    DECLARE @IdThayDoi_Sang INT;
    DECLARE @IdThayDoi_Dem INT;

    -- Lấy IdThayDoi từ bảng THAYDOIGIA theo điều kiện
    SELECT @IdThayDoi_Sang = IdThayDoiGia
    FROM THAYDOIGIA
    WHERE LyDoThayDoi = N'Buổi sáng nhẹ nhàng';

    SELECT @IdThayDoi_Dem = IdThayDoiGia
    FROM THAYDOIGIA
    WHERE LyDoThayDoi = N'Giảm giá đêm khuya';

    -- Duyệt qua các bản ghi được thêm
    DECLARE cur CURSOR FOR 
    SELECT MaSuatChieu, GioChieu 
    FROM INSERTED;

    OPEN cur;
    FETCH NEXT FROM cur INTO @MaSuatChieu, @GioChieu;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Nếu giờ chiếu < 10 giờ
        IF @GioChieu < N'10:00:00'
        BEGIN
            INSERT INTO CHITIET_THAYDOIGIA (MaSuatChieu, IdThayDoi, PhanTramThayDoi)
            VALUES (@MaSuatChieu, @IdThayDoi_Sang, 0.9);
        END

        -- Nếu giờ chiếu > 23 giờ
        IF @GioChieu > N'23:00:00'
        BEGIN
            INSERT INTO CHITIET_THAYDOIGIA (MaSuatChieu, IdThayDoi, PhanTramThayDoi)
            VALUES (@MaSuatChieu, @IdThayDoi_Dem, 0.95);
        END

        FETCH NEXT FROM cur INTO @MaSuatChieu, @GioChieu;
    END;

    CLOSE cur;
    DEALLOCATE cur;
END;

GO
/****** Object:  Trigger [dbo].[trg_CheckGhePhongTruocKhiThemLichChieu]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_CheckGhePhongTruocKhiThemLichChieu]
ON [dbo].[LICH_CHIEU]
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        LEFT JOIN CHITIET_GHE_PHONG AS cgp ON i.MaPhong = cgp.MaPhong
        WHERE cgp.IdGhe IS NULL
    )
    BEGIN
        RAISERROR ('Phòng chưa có ghế, không thể thêm hoặc cập nhật lịch chiếu.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
/****** Object:  Trigger [dbo].[Trg_KiemTraPhongChieu]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Trg_KiemTraPhongChieu]
ON [dbo].[LICH_CHIEU]
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @MaPhim INT, @MaPhong VARCHAR(10), @NgayChieu DATE, @GioChieu TIME(0), @ThoiLuong INT;
    DECLARE @BatDau DATETIME, @KetThuc DATETIME;

    SELECT 
        @MaPhim = i.MaPhim, 
			@MaPhong = i.MaPhong,
        @NgayChieu = i.NgayChieu, 
        @GioChieu = i.GioChieu
    FROM INSERTED i;

    SELECT @ThoiLuong = ThoiLuong
    FROM PHIM
    WHERE MaPhim = @MaPhim;

    SET @BatDau = CAST(@NgayChieu AS DATETIME) + CAST(@GioChieu AS DATETIME);
    SET @KetThuc = DATEADD(MINUTE, @ThoiLuong + 10, @BatDau);

    IF EXISTS (
        SELECT 1
        FROM LICH_CHIEU lc
        WHERE lc.MaPhong = @MaPhong
        AND lc.NgayChieu = @NgayChieu
        AND lc.MaSuatChieu <> (SELECT MaSuatChieu FROM INSERTED)
        AND (
            ( @BatDau BETWEEN CAST(lc.NgayChieu AS DATETIME) + CAST(lc.GioChieu AS DATETIME) 
              AND DATEADD(MINUTE, (SELECT ThoiLuong + 10 FROM PHIM WHERE MaPhim = lc.MaPhim), CAST(lc.NgayChieu AS DATETIME) + CAST(lc.GioChieu AS DATETIME)) )
            OR
            ( @KetThuc BETWEEN CAST(lc.NgayChieu AS DATETIME) + CAST(lc.GioChieu AS DATETIME) 
              AND DATEADD(MINUTE, (SELECT ThoiLuong + 10 FROM PHIM WHERE MaPhim = lc.MaPhim), CAST(lc.NgayChieu AS DATETIME) + CAST(lc.GioChieu AS DATETIME)) )
        )
    )
    BEGIN
        RAISERROR('Phòng đang chiếu, không thể thêm hay chỉnh sửa lịch chiếu', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
/****** Object:  Trigger [dbo].[Update_TrangThaiPhim]    Script Date: 12/25/2024 7:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Update_TrangThaiPhim]
ON [dbo].[PHIM]
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM Inserted WHERE NgayKhoiChieu > GETDATE())
    BEGIN
        UPDATE Phim
        SET MaTT = 2
        WHERE MaPhim IN (SELECT MaPhim FROM Inserted WHERE NgayKhoiChieu > GETDATE());
    END
END;
GO
USE [master]
GO
ALTER DATABASE [CINEMA] SET  READ_WRITE 
GO
