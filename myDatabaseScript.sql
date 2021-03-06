USE [master]
GO
/****** Object:  Database [EbookWeb]    Script Date: 6/15/2021 3:58:05 PM ******/
CREATE DATABASE [EbookWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EbookWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EbookWeb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EbookWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EbookWeb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EbookWeb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EbookWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EbookWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EbookWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EbookWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EbookWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EbookWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [EbookWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EbookWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EbookWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EbookWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EbookWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EbookWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EbookWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EbookWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EbookWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EbookWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EbookWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EbookWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EbookWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EbookWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EbookWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EbookWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EbookWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EbookWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EbookWeb] SET  MULTI_USER 
GO
ALTER DATABASE [EbookWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EbookWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EbookWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EbookWeb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EbookWeb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EbookWeb]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 6/15/2021 3:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Writer] [nvarchar](50) NOT NULL,
	[BookDetail] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/15/2021 3:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [nvarchar](50) NOT NULL,
	[Format] [nchar](10) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [int] NULL,
	[Address] [nvarchar](max) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/15/2021 3:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/15/2021 3:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Name], [Writer], [BookDetail], [Price]) VALUES (1005, N'The King of Drugs', N'Nora Barret', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters', 201)
INSERT [dbo].[Books] ([Id], [Name], [Writer], [BookDetail], [Price]) VALUES (1006, N'Then Imperfections of Memory', N'Angelina', N'as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model', 203)
INSERT [dbo].[Books] ([Id], [Name], [Writer], [BookDetail], [Price]) VALUES (1007, N'The Girl On The Train', N'Paula Hawkins', N'text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved and revolutionarized over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 2999)
INSERT [dbo].[Books] ([Id], [Name], [Writer], [BookDetail], [Price]) VALUES (1008, N'A Million to One', N'Tony Faggioli', N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable.', 5999)
INSERT [dbo].[Books] ([Id], [Name], [Writer], [BookDetail], [Price]) VALUES (1009, N'The Girl of Ink And Stars', N'Kiran Millwood', N'If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks', 389)
INSERT [dbo].[Books] ([Id], [Name], [Writer], [BookDetail], [Price]) VALUES (1010, N'The Book of M', N'Peng Shepherd', N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College', 5101)
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [BookName], [Format], [CustomerName], [Email], [Phone], [Address], [City], [Country]) VALUES (3, N'Book', N'Hard Copy ', N'Ali', N'ali@gmail.com', 90078601, N'Ali''s Address', N'Ali''s City', N'Ali''s Country')
INSERT [dbo].[Orders] ([Id], [BookName], [Format], [CustomerName], [Email], [Phone], [Address], [City], [Country]) VALUES (4, N'The King Of Drugs', N'CD        ', N'Jack', N'jack@gmail.com', NULL, N'street 92', N'Gujrat', N'India')
INSERT [dbo].[Orders] ([Id], [BookName], [Format], [CustomerName], [Email], [Phone], [Address], [City], [Country]) VALUES (5, N'The King Of Drugs', N'CD        ', N'Jack', N'jack@gmail.com', NULL, N'street 92', N'Gujrat', N'India')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [UserID], [Role]) VALUES (4, 1, N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Email], [Password]) VALUES (1, N'admin', N'admin@gmail.com', N'admin')
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password]) VALUES (1004, N'user', N'user@gmail.com', N'user')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_Users]
GO
USE [master]
GO
ALTER DATABASE [EbookWeb] SET  READ_WRITE 
GO
