USE [master]
GO
/****** Object:  Database [StudentDB]    Script Date: 4/6/2021 6:06:14 PM ******/
CREATE DATABASE [StudentDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudentDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudentDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StudentDB] SET QUERY_STORE = OFF
GO
USE [StudentDB]
GO
/****** Object:  Table [dbo].[CourseResults]    Script Date: 4/6/2021 6:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseResults](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentCourseId] [int] NULL,
	[ObtainedMarks] [decimal](18, 0) NULL,
	[TotalMarks] [decimal](18, 0) NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK_CourseResults] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 4/6/2021 6:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseNo] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourses]    Script Date: 4/6/2021 6:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[CourseId] [int] NULL,
 CONSTRAINT [PK_StudentCourses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 4/6/2021 6:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[RollNo] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[CreationDate] [datetime] NULL,
	[UpdationDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CourseResults] ON 

INSERT [dbo].[CourseResults] ([Id], [StudentCourseId], [ObtainedMarks], [TotalMarks], [CreationDate]) VALUES (1, 1, CAST(80 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), CAST(N'2021-04-06T11:07:08.480' AS DateTime))
INSERT [dbo].[CourseResults] ([Id], [StudentCourseId], [ObtainedMarks], [TotalMarks], [CreationDate]) VALUES (2, 2, CAST(70 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), CAST(N'2021-04-06T11:07:08.480' AS DateTime))
INSERT [dbo].[CourseResults] ([Id], [StudentCourseId], [ObtainedMarks], [TotalMarks], [CreationDate]) VALUES (3, 3, CAST(100 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), CAST(N'2021-04-06T11:07:08.480' AS DateTime))
SET IDENTITY_INSERT [dbo].[CourseResults] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseNo], [CourseName], [CreationDate], [IsActive]) VALUES (1, N'Computer', CAST(N'2021-04-06T11:07:08.480' AS DateTime), 1)
INSERT [dbo].[Courses] ([CourseNo], [CourseName], [CreationDate], [IsActive]) VALUES (2, N'Math', CAST(N'2021-04-06T11:07:08.480' AS DateTime), 1)
INSERT [dbo].[Courses] ([CourseNo], [CourseName], [CreationDate], [IsActive]) VALUES (3, N'Programming', CAST(N'2021-04-06T11:07:08.480' AS DateTime), 1)
INSERT [dbo].[Courses] ([CourseNo], [CourseName], [CreationDate], [IsActive]) VALUES (4, N'Data Structure', CAST(N'2021-04-06T11:07:08.480' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentCourses] ON 

INSERT [dbo].[StudentCourses] ([Id], [StudentId], [CourseId]) VALUES (1, 1, 1)
INSERT [dbo].[StudentCourses] ([Id], [StudentId], [CourseId]) VALUES (2, 1, 2)
INSERT [dbo].[StudentCourses] ([Id], [StudentId], [CourseId]) VALUES (3, 1, 3)
SET IDENTITY_INSERT [dbo].[StudentCourses] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [Name], [RollNo], [Email], [Phone], [Address], [CreationDate], [UpdationDate], [IsActive]) VALUES (1, N'Faisal', 1, N'faisalike@gmail.com', N'03009767970', N'p-126 kashmir road faisalabad', CAST(N'2021-04-06T11:07:08.480' AS DateTime), CAST(N'2021-04-06T11:07:08.480' AS DateTime), 1)
INSERT [dbo].[Students] ([Id], [Name], [RollNo], [Email], [Phone], [Address], [CreationDate], [UpdationDate], [IsActive]) VALUES (3, N'Zubair', 2, N'zubair@gmail.com', N'03317592203', N'akbar chowk faisalabad', CAST(N'2021-04-06T11:07:08.480' AS DateTime), CAST(N'2021-04-06T11:07:08.480' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
/****** Object:  Index [IX_Student]    Script Date: 4/6/2021 6:06:15 PM ******/
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [IX_Student] UNIQUE NONCLUSTERED 
(
	[RollNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [StudentDB] SET  READ_WRITE 
GO
