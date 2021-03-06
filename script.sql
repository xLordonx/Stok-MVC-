USE [master]
GO
/****** Object:  Database [DbTestStok]    Script Date: 12.01.2022 20:41:57 ******/
CREATE DATABASE [DbTestStok]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbTestStok', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbTestStok.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbTestStok_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbTestStok_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DbTestStok] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbTestStok].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbTestStok] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbTestStok] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbTestStok] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbTestStok] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbTestStok] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbTestStok] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbTestStok] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbTestStok] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbTestStok] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbTestStok] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbTestStok] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbTestStok] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbTestStok] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbTestStok] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbTestStok] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbTestStok] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbTestStok] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbTestStok] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbTestStok] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbTestStok] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbTestStok] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbTestStok] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbTestStok] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DbTestStok] SET  MULTI_USER 
GO
ALTER DATABASE [DbTestStok] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbTestStok] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbTestStok] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbTestStok] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbTestStok] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbTestStok] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DbTestStok] SET QUERY_STORE = OFF
GO
USE [DbTestStok]
GO
/****** Object:  Table [dbo].[StokKategori]    Script Date: 12.01.2022 20:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StokKategori](
	[KategoriID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAd] [nchar](10) NULL,
 CONSTRAINT [PK_StokKategori] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StokMusteriBilgi]    Script Date: 12.01.2022 20:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StokMusteriBilgi](
	[MusteriID] [int] IDENTITY(1,1) NOT NULL,
	[MusteriAd] [nvarchar](50) NULL,
	[MusteriSoyad] [nvarchar](50) NULL,
	[MusteriAdres] [nvarchar](50) NULL,
 CONSTRAINT [PK_StokMusteriBilgi] PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StokSatis]    Script Date: 12.01.2022 20:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StokSatis](
	[SatisID] [int] IDENTITY(1,1) NOT NULL,
	[Urun] [int] NULL,
	[Musteri] [int] NULL,
	[Adet] [int] NULL,
	[Fiyat] [nchar](10) NULL,
 CONSTRAINT [PK_StokSatis] PRIMARY KEY CLUSTERED 
(
	[SatisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StokSatislar]    Script Date: 12.01.2022 20:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StokSatislar](
	[SatisID] [int] IDENTITY(1,1) NOT NULL,
	[Urun] [int] NULL,
	[Musteri] [int] NULL,
	[Adet] [int] NULL,
	[Fiyat] [decimal](18, 1) NULL,
 CONSTRAINT [PK_StokSatislar] PRIMARY KEY CLUSTERED 
(
	[SatisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StokUrunlerr]    Script Date: 12.01.2022 20:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StokUrunlerr](
	[UrunID] [int] IDENTITY(1,1) NOT NULL,
	[UrunAd] [nvarchar](50) NULL,
	[UrunKategori] [int] NOT NULL,
	[Fiyat] [decimal](18, 1) NULL,
	[Stok] [int] NULL,
	[Marka] [nvarchar](50) NULL,
 CONSTRAINT [PK_StokUrunlerr] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[StokKategori] ON 

INSERT [dbo].[StokKategori] ([KategoriID], [KategoriAd]) VALUES (1, N'TV        ')
INSERT [dbo].[StokKategori] ([KategoriID], [KategoriAd]) VALUES (2, N'Telefon   ')
INSERT [dbo].[StokKategori] ([KategoriID], [KategoriAd]) VALUES (3, N'Bilgisayar')
INSERT [dbo].[StokKategori] ([KategoriID], [KategoriAd]) VALUES (4, N'Ev Eşyası ')
INSERT [dbo].[StokKategori] ([KategoriID], [KategoriAd]) VALUES (5, N'Kasa      ')
INSERT [dbo].[StokKategori] ([KategoriID], [KategoriAd]) VALUES (8, N'İşlemci   ')
INSERT [dbo].[StokKategori] ([KategoriID], [KategoriAd]) VALUES (17, N'İçecek    ')
INSERT [dbo].[StokKategori] ([KategoriID], [KategoriAd]) VALUES (18, N'gözlüük   ')
SET IDENTITY_INSERT [dbo].[StokKategori] OFF
GO
SET IDENTITY_INSERT [dbo].[StokMusteriBilgi] ON 

INSERT [dbo].[StokMusteriBilgi] ([MusteriID], [MusteriAd], [MusteriSoyad], [MusteriAdres]) VALUES (1, N'Yusuf', N'Ergül', N'Eyüp')
INSERT [dbo].[StokMusteriBilgi] ([MusteriID], [MusteriAd], [MusteriSoyad], [MusteriAdres]) VALUES (3, N'Can', N'Akgül', N'Florya')
INSERT [dbo].[StokMusteriBilgi] ([MusteriID], [MusteriAd], [MusteriSoyad], [MusteriAdres]) VALUES (5, N'Ece', N'Ergül', N'Eyüp')
SET IDENTITY_INSERT [dbo].[StokMusteriBilgi] OFF
GO
SET IDENTITY_INSERT [dbo].[StokUrunlerr] ON 

INSERT [dbo].[StokUrunlerr] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Stok], [Marka]) VALUES (2, N'Televizyon', 1, CAST(2000.0 AS Decimal(18, 1)), 15, N'LG')
INSERT [dbo].[StokUrunlerr] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Stok], [Marka]) VALUES (3, N'Buz Dolabı', 4, CAST(1500.0 AS Decimal(18, 1)), 10, N'Bosh')
INSERT [dbo].[StokUrunlerr] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Stok], [Marka]) VALUES (4, N'Ütü', 4, CAST(1000.0 AS Decimal(18, 1)), 5, N'Arçelik')
INSERT [dbo].[StokUrunlerr] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Stok], [Marka]) VALUES (5, N'Çamaşır Makinesi', 4, CAST(2000.0 AS Decimal(18, 1)), 10, N'Bosh')
INSERT [dbo].[StokUrunlerr] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Stok], [Marka]) VALUES (6, N'Iphone 10', 2, CAST(8000.0 AS Decimal(18, 1)), 20, N'Iphone')
INSERT [dbo].[StokUrunlerr] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Stok], [Marka]) VALUES (7, N'Note20', 2, CAST(5000.0 AS Decimal(18, 1)), 10, N'Samsung')
INSERT [dbo].[StokUrunlerr] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Stok], [Marka]) VALUES (8, N'R8', 2, CAST(4000.0 AS Decimal(18, 1)), 8, N'Xiaomi')
INSERT [dbo].[StokUrunlerr] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Stok], [Marka]) VALUES (9, N'G6', 3, CAST(9000.0 AS Decimal(18, 1)), 6, N'Monster')
INSERT [dbo].[StokUrunlerr] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Stok], [Marka]) VALUES (10, N'Summit', 3, CAST(20000.0 AS Decimal(18, 1)), 8, N'MSI')
INSERT [dbo].[StokUrunlerr] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Stok], [Marka]) VALUES (11, N'Desk830', 5, CAST(6000.0 AS Decimal(18, 1)), 10, N'Samsung')
SET IDENTITY_INSERT [dbo].[StokUrunlerr] OFF
GO
ALTER TABLE [dbo].[StokSatislar]  WITH CHECK ADD  CONSTRAINT [FK_StokSatislar_StokMusteriBilgi] FOREIGN KEY([Musteri])
REFERENCES [dbo].[StokMusteriBilgi] ([MusteriID])
GO
ALTER TABLE [dbo].[StokSatislar] CHECK CONSTRAINT [FK_StokSatislar_StokMusteriBilgi]
GO
ALTER TABLE [dbo].[StokSatislar]  WITH CHECK ADD  CONSTRAINT [FK_StokSatislar_StokUrunlerr] FOREIGN KEY([Urun])
REFERENCES [dbo].[StokUrunlerr] ([UrunID])
GO
ALTER TABLE [dbo].[StokSatislar] CHECK CONSTRAINT [FK_StokSatislar_StokUrunlerr]
GO
ALTER TABLE [dbo].[StokUrunlerr]  WITH CHECK ADD  CONSTRAINT [FK_StokUrunlerr_StokKategori] FOREIGN KEY([UrunKategori])
REFERENCES [dbo].[StokKategori] ([KategoriID])
GO
ALTER TABLE [dbo].[StokUrunlerr] CHECK CONSTRAINT [FK_StokUrunlerr_StokKategori]
GO
USE [master]
GO
ALTER DATABASE [DbTestStok] SET  READ_WRITE 
GO
