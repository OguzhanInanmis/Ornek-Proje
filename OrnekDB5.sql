USE [master]
GO
/****** Object:  Database [OrnekDB5]    Script Date: 16.06.2022 22:34:21 ******/
CREATE DATABASE [OrnekDB5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OrnekDB5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OrnekDB5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OrnekDB5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OrnekDB5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OrnekDB5] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OrnekDB5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OrnekDB5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OrnekDB5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OrnekDB5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OrnekDB5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OrnekDB5] SET ARITHABORT OFF 
GO
ALTER DATABASE [OrnekDB5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OrnekDB5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OrnekDB5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OrnekDB5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OrnekDB5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OrnekDB5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OrnekDB5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OrnekDB5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OrnekDB5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OrnekDB5] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OrnekDB5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OrnekDB5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OrnekDB5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OrnekDB5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OrnekDB5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OrnekDB5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OrnekDB5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OrnekDB5] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OrnekDB5] SET  MULTI_USER 
GO
ALTER DATABASE [OrnekDB5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OrnekDB5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OrnekDB5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OrnekDB5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OrnekDB5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OrnekDB5] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OrnekDB5] SET QUERY_STORE = OFF
GO
USE [OrnekDB5]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 16.06.2022 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[kategoriID] [int] IDENTITY(1,1) NOT NULL,
	[UstKategoriID] [int] NULL,
	[kategoriBaslik] [nvarchar](50) NULL,
	[kategoriAciklama] [nvarchar](500) NULL,
	[kategoriResimUrl] [nvarchar](250) NULL,
	[kategoriSil] [bit] NULL,
	[kategoriOlTarih] [datetime] NULL,
	[KategoriGunTarih] [datetime] NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[kategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Base_Kategoriler]    Script Date: 16.06.2022 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Base_Kategoriler]
AS
SELECT        kategoriID, UstKategoriID, kategoriBaslik, kategoriAciklama, kategoriResimUrl, kategoriOlTarih, KategoriGunTarih
FROM            dbo.Kategoriler
WHERE        (kategoriSil = 0)
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 16.06.2022 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[urunID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriID] [int] NULL,
	[urunKodu] [nvarchar](50) NULL,
	[urunBaslik] [nvarchar](250) NULL,
	[urunAciklama] [nvarchar](max) NULL,
	[urunResimUrl] [nvarchar](250) NULL,
	[UrunSil] [bit] NULL,
	[urunOlTarih] [datetime] NULL,
	[urunGunTarih] [datetime] NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[urunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Base_Urunler]    Script Date: 16.06.2022 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Base_Urunler]
AS
SELECT        urunID, KategoriID, urunKodu, urunBaslik, urunAciklama, urunResimUrl, urunOlTarih, urunGunTarih
FROM            dbo.Urunler
WHERE        (UrunSil = 0)
GO
/****** Object:  View [dbo].[View_Presentation_Urunler]    Script Date: 16.06.2022 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Presentation_Urunler]
AS
SELECT        dbo.View_Base_Urunler.urunID, dbo.View_Base_Urunler.urunKodu, dbo.View_Base_Urunler.urunBaslik, dbo.View_Base_Urunler.urunAciklama, dbo.View_Base_Urunler.urunResimUrl, dbo.View_Base_Urunler.urunOlTarih, 
                         dbo.View_Base_Urunler.urunGunTarih, dbo.View_Base_Kategoriler.kategoriID, dbo.View_Base_Kategoriler.UstKategoriID, dbo.View_Base_Kategoriler.kategoriBaslik, dbo.View_Base_Kategoriler.kategoriAciklama, 
                         dbo.View_Base_Kategoriler.kategoriResimUrl, dbo.View_Base_Kategoriler.kategoriOlTarih, dbo.View_Base_Kategoriler.KategoriGunTarih
FROM            dbo.View_Base_Urunler LEFT OUTER JOIN
                         dbo.View_Base_Kategoriler ON dbo.View_Base_Urunler.KategoriID = dbo.View_Base_Kategoriler.kategoriID
GO
/****** Object:  Table [dbo].[Markalar]    Script Date: 16.06.2022 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markalar](
	[markaID] [int] IDENTITY(1,1) NOT NULL,
	[markaBaslik] [nvarchar](50) NULL,
	[markaAciklama] [nvarchar](500) NULL,
	[markaResimUrl] [nvarchar](250) NULL,
	[markaSil] [bit] NULL,
	[markaOlTarih] [datetime] NULL,
	[markaGunTarih] [datetime] NULL,
 CONSTRAINT [PK_Markalar] PRIMARY KEY CLUSTERED 
(
	[markaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Base_Markalar]    Script Date: 16.06.2022 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Base_Markalar]
AS
SELECT markaID, markaBaslik, markaAciklama, markaResimUrl, markaOlTarih, markaGunTarih
FROM     dbo.Markalar
WHERE  (markaSil = 0)
GO
/****** Object:  StoredProcedure [dbo].[Proc_Kategoriler_Islem]    Script Date: 16.06.2022 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_Kategoriler_Islem]
	@Islem				nvarchar(50),
	@KategoriID			int,
	@UstKategoriID		int,
	@KategoriBaslik		nvarchar(50),
	@KategoriAciklama	nvarchar(500),
	@KategoriResimUrl	nvarchar(250)
AS
BEGIN
	if(@Islem='Yeni')
	begin
		INSERT INTO [dbo].[Kategoriler]
           ([UstKategoriID]
           ,[kategoriBaslik]
           ,[kategoriAciklama]
           ,[kategoriResimUrl]
           ,[kategoriSil]
           ,[kategoriOlTarih]
           ,[kategoriGunTarih])
		VALUES
           (@UstKategoriID
           ,@KategoriBaslik
           ,@KategoriAciklama
           ,@KategoriResimUrl
           ,0
           ,GetDate()
           ,GetDate()
		   )

		   Select top 1 * From View_Base_Kategoriler Order By kategoriID desc
	end
	else if(@Islem='Guncelle')
	begin
		Update [dbo].[Kategoriler] Set
			[UstKategoriID]		=ISNULL(@UstKategoriID,[UstKategoriID]),
			[kategoriBaslik]	=ISNULL(@KategoriBaslik,[kategoriBaslik]),
			[kategoriAciklama]	=ISNULL(@KategoriAciklama,[kategoriAciklama]),
			[kategoriResimUrl]	=ISNULL(@KategoriResimUrl,[kategoriResimUrl]),
			[kategoriGunTarih]	=GetDate()
		Where kategoriID=@KategoriID

		Select * From View_Base_Kategoriler Where kategoriID=@KategoriID
	end
	else if(@Islem='Sil')
	begin
		Select * From View_Base_Kategoriler Where kategoriID=@KategoriID

		Update [dbo].[Kategoriler] Set
			[kategoriSil]=1
		Where kategoriID=@KategoriID
	end
	else if(@Islem='Liste')
	begin
		Select * From View_Base_Kategoriler 
		Where (kategoriID=@KategoriID or @KategoriID=0)
	end
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_Markalar_Islem]    Script Date: 16.06.2022 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_Markalar_Islem]
	@Islem				nvarchar(50),
	@markaID			int,
	@markaBaslik		nvarchar(50),
	@markaAciklama		nvarchar(500),
	@markaResimUrl		nvarchar(250)
AS
BEGIN
	if(@Islem='Yeni')
	begin
		INSERT INTO Markalar
		(markaBaslik
		,markaAciklama
		,markaResimUrl
		,markaSil
		,markaOlTarih
		,markaGunTarih)
		VALUES
		(@markaBaslik
		,@markaAciklama
		,@markaResimUrl
		,0
		,GetDate()
        ,GetDate()
		)

		Select top 1 * From View_Base_Markalar Order By markaID desc
	end
	else if(@Islem='Guncelle')
	begin
		Update Markalar Set
			markaBaslik		=ISNULL(@markaBaslik, markaBaslik),
			markaAciklama	=ISNULL(@markaAciklama, markaAciklama),
			markaResimUrl	=ISNULL(@markaResimUrl, markaResimUrl),
			markaGunTarih	=GETDATE()
		Where markaID=@markaID

		Select * From View_Base_Markalar Where markaID=@markaID
	end
	else if(@Islem='Sil')
	begin
		Select * From View_Base_Markalar Where markaID=@markaID

		Update Markalar Set
			markaSil=1
		Where markaID=@markaID
	end
	else if(@Islem='Liste')
	begin
		Select * From View_Base_Markalar
		Where (markaID=@markaID or @markaID=0)
	end
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_Urunler_Islem]    Script Date: 16.06.2022 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_Urunler_Islem]
	@Islem			nvarchar(50),
	@UrunID			int,
	@KategoriID		int,
	@UrunKodu		nvarchar(50),
	@UrunBaslik		nvarchar(250),
	@UrunAciklama	nvarchar(max),
	@UrunResimUrl	nvarchar(250)
AS
BEGIN
	if(@Islem='Yeni')
	begin
		INSERT INTO [dbo].[Urunler]
           ([KategoriID]
           ,[urunKodu]
           ,[urunBaslik]
           ,[urunAciklama]
           ,[urunResimUrl]
           ,[urunSil]
           ,[urunOlTarih]
           ,[urunGunTarih])
		VALUES
           (@KategoriID
           ,@UrunKodu
           ,@UrunBaslik
           ,@UrunAciklama
           ,@UrunResimUrl
           ,0
           ,GETDATE()
           ,GETDATE()
		   )

		   Select top 1 * From View_Presentation_Urunler Order By urunID desc
	end
	else if(@Islem='Guncelle')
	begin
		Update [dbo].[Urunler] Set
			[KategoriID]	=ISNULL(@KategoriID,[KategoriID]),
			[urunKodu]		=ISNULL(@UrunKodu,[urunKodu]),
			[urunBaslik]	=ISNULL(@UrunBaslik,[urunBaslik]),
			[urunAciklama]	=ISNULL(@UrunAciklama,[urunAciklama]),
			[urunResimUrl]	=ISNULL(@UrunResimUrl,[urunResimUrl]),
			[urunGunTarih]	=GETDATE()
		Where urunID=@UrunID

		Select * From View_Presentation_Urunler Where urunID=@UrunID
	end
	else if(@Islem='Sil')
	begin
		Select * From View_Presentation_Urunler Where urunID=@UrunID

		Update [dbo].[Urunler] Set
			[urunSil]=1
		Where urunID=@UrunID
	end
	else if(@Islem='Liste')
	begin
		Select * From View_Presentation_Urunler 
		Where (urunID=@UrunID or @UrunID=0)
			and ([KategoriID]=@KategoriID or @KategoriID=0)
	end
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Kategoriler"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Base_Kategoriler'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Base_Kategoriler'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Markalar"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 261
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Base_Markalar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Base_Markalar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Urunler"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Base_Urunler'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Base_Urunler'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "View_Base_Urunler"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_Base_Kategoriler"
            Begin Extent = 
               Top = 6
               Left = 319
               Bottom = 136
               Right = 500
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Presentation_Urunler'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Presentation_Urunler'
GO
USE [master]
GO
ALTER DATABASE [OrnekDB5] SET  READ_WRITE 
GO
