USE [master]
GO
/****** Object:  Database [HostelManagement]    Script Date: 6/29/2022 4:54:42 PM ******/
CREATE DATABASE [HostelManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HostelManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HostelManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HostelManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HostelManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HostelManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HostelManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HostelManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HostelManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HostelManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HostelManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HostelManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [HostelManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HostelManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HostelManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HostelManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HostelManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HostelManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HostelManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HostelManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HostelManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HostelManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HostelManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HostelManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HostelManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HostelManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HostelManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HostelManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HostelManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HostelManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HostelManagement] SET  MULTI_USER 
GO
ALTER DATABASE [HostelManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HostelManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HostelManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HostelManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HostelManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HostelManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HostelManagement] SET QUERY_STORE = OFF
GO
USE [HostelManagement]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[password] [varchar](40) NULL,
	[email] [varchar](30) NOT NULL,
	[registeredDate] [date] NOT NULL,
	[role] [tinyint] NOT NULL,
	[activate] [bit] NOT NULL,
	[avatar] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingRequest]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingRequest](
	[bookingRequestID] [int] IDENTITY(1,1) NOT NULL,
	[tenantID] [int] NULL,
	[createdDate] [date] NULL,
	[status] [int] NULL,
	[roomTypeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bookingRequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[contractID] [int] NOT NULL,
	[roomID] [int] NULL,
	[tenantID] [int] NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[status] [tinyint] NULL,
	[rentalFeePerMonth] [int] NULL,
	[deposit] [int] NULL,
	[description] [nvarchar](max) NULL,
	[duration] [int] NULL,
	[createdDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[contractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[districtID] [int] IDENTITY(1,1) NOT NULL,
	[districtName] [nvarchar](50) NOT NULL,
	[provinceID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[districtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteHostel]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteHostel](
	[favoriteHostelID] [int] IDENTITY(1,1) NOT NULL,
	[hostelID] [int] NOT NULL,
	[tenantID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[favoriteHostelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedbackID] [int] IDENTITY(1,1) NOT NULL,
	[hostelID] [int] NOT NULL,
	[tenantID] [int] NULL,
	[content] [nvarchar](max) NULL,
	[rating] [tinyint] NOT NULL,
	[date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoogleAccount]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoogleAccount](
	[googleID] [int] NOT NULL,
	[googleToken] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[googleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hostel]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hostel](
	[hostelID] [int] IDENTITY(1,1) NOT NULL,
	[streetAddress] [nvarchar](255) NOT NULL,
	[hostelName] [nvarchar](50) NULL,
	[registeredDate] [date] NOT NULL,
	[activate] [bit] NOT NULL,
	[rating] [real] NULL,
	[landlordId] [int] NOT NULL,
	[minPrice] [int] NULL,
	[maxPrice] [int] NULL,
	[minArea] [int] NULL,
	[maxArea] [int] NULL,
	[districtID] [int] NULL,
	[availableRoom] [int] NULL,
	[description] [nvarchar](max) NULL,
	[totalRoom] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[hostelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageHostel]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageHostel](
	[imageHostelId] [int] IDENTITY(1,1) NOT NULL,
	[hostelId] [int] NULL,
	[imgLink] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[imageHostelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageRoomType]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageRoomType](
	[imageRoomTypeID] [int] IDENTITY(1,1) NOT NULL,
	[roomTypeID] [int] NULL,
	[imgLink] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[imageRoomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[invoiceID] [int] IDENTITY(1,1) NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[status] [tinyint] NOT NULL,
	[totalPrice] [bigint] NOT NULL,
	[contractID] [int] NULL,
	[dueDate] [date] NULL,
	[month] [varchar](10) NULL,
	[createdDate] [date] NULL,
	[electricPrice] [int] NULL,
	[waterPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[invoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Landlord]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Landlord](
	[landlordID] [int] NOT NULL,
	[fullname] [nvarchar](30) NOT NULL,
	[phone] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[landlordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[notificationID] [int] IDENTITY(1,1) NOT NULL,
	[toAccountID] [int] NULL,
	[createdDate] [date] NULL,
	[content] [nvarchar](max) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[notificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[provinceID] [int] IDENTITY(1,1) NOT NULL,
	[provinceName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[provinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roomID] [int] IDENTITY(1,1) NOT NULL,
	[roomNumber] [varchar](10) NULL,
	[currentNoResidents] [tinyint] NOT NULL,
	[status] [tinyint] NOT NULL,
	[roomTypeID] [int] NULL,
	[latestInvoiceMonth] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomResident]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomResident](
	[roomResidentID] [int] IDENTITY(1,1) NOT NULL,
	[roomID] [int] NOT NULL,
	[fullname] [nvarchar](30) NOT NULL,
	[phone] [char](10) NOT NULL,
	[dob] [date] NOT NULL,
	[isRoomLead] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roomResidentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[roomTypeID] [int] IDENTITY(1,1) NOT NULL,
	[roomTypeName] [nvarchar](255) NULL,
	[roomTypeArea] [int] NULL,
	[description] [nvarchar](255) NULL,
	[maxNumberOfResidents] [int] NULL,
	[advertisedPrice] [int] NULL,
	[hostelID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[roomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[serviceID] [int] IDENTITY(1,1) NOT NULL,
	[serviceName] [nvarchar](30) NOT NULL,
	[monthApplied] [date] NOT NULL,
	[hostelID] [int] NOT NULL,
	[serviceFee] [int] NOT NULL,
	[unit] [nvarchar](20) NOT NULL,
	[active] [bit] NULL,
	[type] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[serviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceDetail]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceDetail](
	[serviceDetailID] [int] IDENTITY(1,1) NOT NULL,
	[startValue] [real] NOT NULL,
	[endValue] [real] NOT NULL,
	[invoiceID] [int] NOT NULL,
	[serviceID] [int] NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[serviceDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenant]    Script Date: 6/29/2022 4:54:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenant](
	[tenantID] [int] NOT NULL,
	[fullname] [nvarchar](30) NOT NULL,
	[phone] [char](10) NOT NULL,
	[rentStatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tenantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (3, N'anvu1911', N'12345678', N'anvu1911@gmail.com', CAST(N'2022-05-30' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (4, N'vothisau', N'12345678', N'vothisau@gmail.com', CAST(N'2022-05-30' AS Date), 2, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (5, N'levantam', N'12345678', N'levantam@gmail.com', CAST(N'2022-05-29' AS Date), 2, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (6, N'thichquangduc', N'12345', N'thichquangduc@gmail.com', CAST(N'2022-06-03' AS Date), 2, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (8, N'hocamdao', N'12345', N'hocamdao@gmail.com', CAST(N'2022-06-03' AS Date), 2, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (9, N'hongnhung', N'12345', N'hongnhung@gmail.com', CAST(N'2022-06-03' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (10, N'a', N'356a192b7913b04c54574d18c28d46e6395428ab', N'a@gmail.com', CAST(N'2022-06-03' AS Date), 1, 1, N'/sakura/assets/images/user-avatars/10_ava.jpg')
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (17, N'abcxyz', N'12345', N'oigioioi@gmail.com', CAST(N'2022-06-03' AS Date), 2, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (18, N'hihihi', N'12345', N'troioilatroi@gmail.com', CAST(N'2022-06-03' AS Date), 2, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (19, N'ngoctrinh', N'1234', N'ngoctrinh@gmail.com', CAST(N'2022-06-03' AS Date), 2, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (20, N'vonguyengiap', N'1234', N'vonguyengiap@gmail.com', CAST(N'2022-06-03' AS Date), 2, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (21, N'levanluyen', N'12345678', N'levanluyen@gmail.com', CAST(N'2022-06-03' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (23, N'whoami', N'12345', N'whoamI@gmail.com', CAST(N'2022-06-03' AS Date), 2, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (24, N'tranthibuoi', N'12345678', N'tranthibuoi@gmail.com', CAST(N'2022-06-03' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (26, N'DuongTang', N'12345', N'duongtang@gmail.com', CAST(N'2022-06-03' AS Date), 2, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (27, N'hahahihi', N'12345', N'botat@gmail.com', CAST(N'2022-06-03' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (28, N'tranhungdao', N'12345678', N'tranhungdao@gmail.com', CAST(N'2022-06-05' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (29, N'diepphong1234', N'12345678', N'diepphong@gmail.com', CAST(N'2022-06-06' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (32, N'vothi123', N'12345', N'vothi123@gmail.com', CAST(N'2022-06-07' AS Date), 2, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (33, N'vantruong', N'12345', N'vantruong@gmail.com', CAST(N'2022-06-07' AS Date), 2, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (34, N'johndoe123', N'12345', N'johndoe123@gmail.com', CAST(N'2022-06-07' AS Date), 2, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (39, N'handoi', N'12345678', N'handoi@gmail.com', CAST(N'2022-06-13' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (40, N'locbucky', N'37bb82f2bc1bf1719facc077b2e00832aa96932c', N'locvhse160453@fpt.edu.vn', CAST(N'2022-06-21' AS Date), 1, 1, N'https://lh3.googleusercontent.com/a/AATXAJx_sY4_O5wcpN9xW2RZPrkmO_zzZ30LUqh-4eRg=s96-c')
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (41, N'locbucky2', N'37bb82f2bc1bf1719facc077b2e00832aa96932c', N'locvh666666@gmail.com', CAST(N'2022-06-21' AS Date), 1, 1, N'https://lh3.googleusercontent.com/a-/AOh14GgL5WHy4HhVzex31JInGdC-QJdmWkQ4VtJAdzN8=s96-c')
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (42, N'khangnguyen0201', N'37bb82f2bc1bf1719facc077b2e00832aa96932c', N'khng0201@gmail.com', CAST(N'2022-06-21' AS Date), 1, 1, N'https://lh3.googleusercontent.com/a/AATXAJxeZJy2-FX2L8CIac1Ho-RrPXNDJ9Xa_fSqIZ7C=s96-c')
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (43, N'abc123', N'356a192b7913b04c54574d18c28d46e6395428ab', N'khangnvse160221@fpt.edu.vn', CAST(N'2022-06-21' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [password], [email], [registeredDate], [role], [activate], [avatar]) VALUES (44, N'truonglv', N'7c222fb2927d828af22f592134e8932480637c0d', N'truonglv@gmail.com', CAST(N'2022-06-25' AS Date), 2, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[BookingRequest] ON 
GO
INSERT [dbo].[BookingRequest] ([bookingRequestID], [tenantID], [createdDate], [status], [roomTypeID]) VALUES (1, 3, CAST(N'2022-06-24' AS Date), 1, NULL)
GO
INSERT [dbo].[BookingRequest] ([bookingRequestID], [tenantID], [createdDate], [status], [roomTypeID]) VALUES (2, 10, CAST(N'2022-06-24' AS Date), 1, NULL)
GO
INSERT [dbo].[BookingRequest] ([bookingRequestID], [tenantID], [createdDate], [status], [roomTypeID]) VALUES (3, 9, CAST(N'2022-06-24' AS Date), 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[BookingRequest] OFF
GO
INSERT [dbo].[Contract] ([contractID], [roomID], [tenantID], [startDate], [endDate], [status], [rentalFeePerMonth], [deposit], [description], [duration], [createdDate]) VALUES (1, 2, 10, CAST(N'2022-01-01' AS Date), CAST(N'2022-12-31' AS Date), 1, 3000000, 1500000, NULL, 12, CAST(N'2021-12-25' AS Date))
GO
INSERT [dbo].[Contract] ([contractID], [roomID], [tenantID], [startDate], [endDate], [status], [rentalFeePerMonth], [deposit], [description], [duration], [createdDate]) VALUES (2, 3, 10, CAST(N'2022-01-01' AS Date), CAST(N'2022-06-30' AS Date), 1, 3000000, 2500000, NULL, 6, CAST(N'2021-12-15' AS Date))
GO
SET IDENTITY_INSERT [dbo].[District] ON 
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (1, N'Thủ Đức', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (2, N'Quận 9', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (3, N'Hai Bà Trưng', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (4, N'Đống Đa', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (5, N'Quận Ba Đình', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (6, N'Quận Hoàn Kiếm', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (7, N'Quận Tây Hồ', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (8, N'Quận Long Biên', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (9, N'Quận Cầu Giấy', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (10, N'Quận Đống Đa', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (11, N'Quận Hai Bà Trưng', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (12, N'Quận Hoàng Mai', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (13, N'Quận Thanh Xuân', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (14, N'Huyện Sóc Sơn', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (15, N'Huyện Đông Anh', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (16, N'Huyện Gia Lâm', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (17, N'Quận Nam Từ Liêm', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (18, N'Huyện Thanh Trì', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (19, N'Quận Bắc Từ Liêm', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (20, N'Huyện Mê Linh', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (21, N'Quận Hà Đông', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (22, N'Thị xã Sơn Tây', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (23, N'Huyện Ba Vì', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (24, N'Huyện Phúc Thọ', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (25, N'Huyện Đan Phượng', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (26, N'Huyện Hoài Đức', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (27, N'Huyện Quốc Oai', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (28, N'Huyện Thạch Thất', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (29, N'Huyện Chương Mỹ', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (30, N'Huyện Thanh Oai', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (31, N'Huyện Thường Tín', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (32, N'Huyện Phú Xuyên', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (33, N'Huyện Ứng Hòa', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (34, N'Huyện Mỹ Đức', 1)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (35, N'Quận 1', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (36, N'Quận 12', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (37, N'Quận Gò Vấp', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (38, N'Quận Bình Thạnh', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (39, N'Quận Tân Bình', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (40, N'Quận Tân Phú', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (41, N'Quận Phú Nhuận', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (42, N'Quận 2', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (43, N'Quận 3', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (44, N'Quận 10', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (45, N'Quận 11', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (46, N'Quận 4', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (47, N'Quận 5', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (48, N'Quận 6', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (49, N'Quận 8', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (50, N'Quận Bình Tân', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (51, N'Quận 7', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (52, N'Huyện Củ Chi', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (53, N'Huyện Hóc Môn', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (54, N'Huyện Bình Chánh', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (55, N'Huyện Nhà Bè', 2)
GO
INSERT [dbo].[District] ([districtID], [districtName], [provinceID]) VALUES (56, N'Huyện Cần Giờ', 2)
GO
SET IDENTITY_INSERT [dbo].[District] OFF
GO
SET IDENTITY_INSERT [dbo].[FavoriteHostel] ON 
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (6, 4, 3)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (7, 7, 3)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (8, 2, 3)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (9, 6, 3)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (10, 8, 3)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (11, 9, 3)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (17, 4, 24)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (18, 8, 24)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (19, 1, 24)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (20, 4, 27)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (21, 2, 27)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (22, 1, 27)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (23, 6, 27)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (30, 10, 10)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (33, 1, 3)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (50, 2, 10)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (79, 5, 10)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (81, 7, 10)
GO
INSERT [dbo].[FavoriteHostel] ([favoriteHostelID], [hostelID], [tenantID]) VALUES (82, 1, 10)
GO
SET IDENTITY_INSERT [dbo].[FavoriteHostel] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (1, 1, 3, N'Nhà trọ này rất tốt', 5, CAST(N'2022-06-11' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (2, 1, 9, N'Happy new year', 4, CAST(N'2022-06-11' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (3, 1, 9, N'Tạm được', 3, CAST(N'2022-06-11' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (4, 1, 10, N'Rất bình thường', 1, CAST(N'2022-06-23' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (5, 1, 21, N'nh shit', 3, CAST(N'2022-06-18' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (6, 2, 24, N'Phải chạy xe đi đổ rác. Quá tệ', 1, CAST(N'2022-06-11' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (7, 2, 27, N'Nhà trọ rất có điều điện 100k/kí', 4, CAST(N'2022-06-11' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (8, 2, 28, N'Chất lượng tệ.', 2, CAST(N'2022-06-11' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (9, 4, 29, N'Tốt lắm', 5, CAST(N'2022-06-12' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (10, 4, 9, N'Tốt lắm', 5, CAST(N'2022-06-12' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (11, 5, 39, N'Rất tệ, cho 1 sao', 1, CAST(N'2022-06-11' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (12, 6, 3, N'Rất tệ, cho 1 sao', 1, CAST(N'2022-06-11' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (13, 7, 9, N'goodbye', 1, CAST(N'2022-06-12' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (14, 8, 10, N'see you again', 1, CAST(N'2022-06-12' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (15, 9, 21, N'ahihi', 1, CAST(N'2022-06-18' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (16, 10, 24, N'Quá tệ', 1, CAST(N'2022-06-12' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (17, 14, 27, N'Không thể chấp nhận được', 1, CAST(N'2022-06-12' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (18, 15, 28, N'Mọi người đừng ở đây', 1, CAST(N'2022-06-12' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (19, 15, 29, N'Thất vọng', 1, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (20, 16, 39, N'dispoint', 2, CAST(N'2022-06-12' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (21, 16, 3, N'Tuyệt vời', 5, CAST(N'2022-06-12' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (22, 16, 9, N'Bình thường', 3, CAST(N'2022-06-12' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (23, 16, 39, N'ổn', 4, CAST(N'2022-06-13' AS Date))
GO
INSERT [dbo].[Feedback] ([feedbackID], [hostelID], [tenantID], [content], [rating], [date]) VALUES (24, 9, 10, N'Khá', 3, CAST(N'2022-06-23' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
INSERT [dbo].[GoogleAccount] ([googleID], [googleToken]) VALUES (3, N'hiohiahha')
GO
INSERT [dbo].[GoogleAccount] ([googleID], [googleToken]) VALUES (10, N'106206057356064521561')
GO
INSERT [dbo].[GoogleAccount] ([googleID], [googleToken]) VALUES (40, N'101277717094548534475')
GO
INSERT [dbo].[GoogleAccount] ([googleID], [googleToken]) VALUES (41, N'108063400228476230275')
GO
INSERT [dbo].[GoogleAccount] ([googleID], [googleToken]) VALUES (42, N'115843869389338504500')
GO
SET IDENTITY_INSERT [dbo].[Hostel] ON 
GO
INSERT [dbo].[Hostel] ([hostelID], [streetAddress], [hostelName], [registeredDate], [activate], [rating], [landlordId], [minPrice], [maxPrice], [minArea], [maxArea], [districtID], [availableRoom], [description], [totalRoom]) VALUES (1, N'666/46/1 Đường 3 Tháng 2, P. 14', N'Huyền Thiết', CAST(N'2022-05-30' AS Date), 1, 3.4, 44, 1800000, 2500000, 16, 30, 44, 100, N'Khang trang, tiện lợi, hiện đại', 100)
GO
INSERT [dbo].[Hostel] ([hostelID], [streetAddress], [hostelName], [registeredDate], [activate], [rating], [landlordId], [minPrice], [maxPrice], [minArea], [maxArea], [districtID], [availableRoom], [description], [totalRoom]) VALUES (2, N'200 Lê Thánh Tôn, P. Bến Thành', N'Trí Hưng', CAST(N'2022-04-30' AS Date), 1, 2.3, 4, 1000000, 2000000, 20, 30, 35, 25, N'Khang trang, tiện lợi, hiện đại', 36)
GO
INSERT [dbo].[Hostel] ([hostelID], [streetAddress], [hostelName], [registeredDate], [activate], [rating], [landlordId], [minPrice], [maxPrice], [minArea], [maxArea], [districtID], [availableRoom], [description], [totalRoom]) VALUES (4, N'246/55A Hòa Hưng, P. 13', N'Diên Khánh', CAST(N'2022-05-30' AS Date), 1, 5, 5, 1200000, 2500000, 25, 40, 44, 23, N'Khang trang, tiện lợi, hiện đại', 240)
GO
INSERT [dbo].[Hostel] ([hostelID], [streetAddress], [hostelName], [registeredDate], [activate], [rating], [landlordId], [minPrice], [maxPrice], [minArea], [maxArea], [districtID], [availableRoom], [description], [totalRoom]) VALUES (5, N'1 Nguyễn Cửu Vân, P. 17', N'Bombo', CAST(N'2022-02-21' AS Date), 1, 1, 5, 1700000, 2800000, 16, 32, 38, 27, N'Khang trang, tiện lợi, hiện đại', 54)
GO
INSERT [dbo].[Hostel] ([hostelID], [streetAddress], [hostelName], [registeredDate], [activate], [rating], [landlordId], [minPrice], [maxPrice], [minArea], [maxArea], [districtID], [availableRoom], [description], [totalRoom]) VALUES (6, N'230 Nguyễn Văn Hưởng, P. Thảo Điền', N'Uyển Thanh', CAST(N'2022-05-30' AS Date), 1, 1, 4, 1900000, 3400000, 20, 35, 42, 11, N'Khang trang, tiện lợi, hiện đại', 24)
GO
INSERT [dbo].[Hostel] ([hostelID], [streetAddress], [hostelName], [registeredDate], [activate], [rating], [landlordId], [minPrice], [maxPrice], [minArea], [maxArea], [districtID], [availableRoom], [description], [totalRoom]) VALUES (7, N'55 Đặng Văn Ngữ, P. 14', N'Doanh Doanh', CAST(N'2022-05-30' AS Date), 1, 1, 5, 1000000, 2500000, 25, 30, 41, 22, N'Khang trang, tiện lợi, hiện đại', 64)
GO
INSERT [dbo].[Hostel] ([hostelID], [streetAddress], [hostelName], [registeredDate], [activate], [rating], [landlordId], [minPrice], [maxPrice], [minArea], [maxArea], [districtID], [availableRoom], [description], [totalRoom]) VALUES (8, N'252A1 Cô Bắc, P. Cô Giang', N'Thanh An', CAST(N'2022-05-30' AS Date), 1, 1, 4, 1000000, 2500000, 22, 40, 35, 21, N'Khang trang, tiện lợi, hiện đại', 54)
GO
INSERT [dbo].[Hostel] ([hostelID], [streetAddress], [hostelName], [registeredDate], [activate], [rating], [landlordId], [minPrice], [maxPrice], [minArea], [maxArea], [districtID], [availableRoom], [description], [totalRoom]) VALUES (9, N'92 Nam Kỳ Khởi Nghĩa, P. Bến Nghé', N'Hồng Phước', CAST(N'2022-05-30' AS Date), 1, 2, 5, 1000000, 2500000, 20, 35, 35, 8, N'Khang trang, tiện lợi, hiện đại', 25)
GO
INSERT [dbo].[Hostel] ([hostelID], [streetAddress], [hostelName], [registeredDate], [activate], [rating], [landlordId], [minPrice], [maxPrice], [minArea], [maxArea], [districtID], [availableRoom], [description], [totalRoom]) VALUES (10, N'42 Hưng Gia 4, P. Tân Phong', N'Hoàng Phong', CAST(N'2022-05-30' AS Date), 1, 1, 4, 1200000, 2400000, 20, 35, 51, 10, N'Khang trang, tiện lợi, hiện đại', 50)
GO
INSERT [dbo].[Hostel] ([hostelID], [streetAddress], [hostelName], [registeredDate], [activate], [rating], [landlordId], [minPrice], [maxPrice], [minArea], [maxArea], [districtID], [availableRoom], [description], [totalRoom]) VALUES (11, N'199 Lê Văn Việt, P. Hiệp Phú', N'Hoàng Gia', CAST(N'2022-05-30' AS Date), 1, 0, 4, 1200000, 2300000, 20, 35, 2, 23, N'Khang trang, tiện lợi, hiện đại', 60)
GO
INSERT [dbo].[Hostel] ([hostelID], [streetAddress], [hostelName], [registeredDate], [activate], [rating], [landlordId], [minPrice], [maxPrice], [minArea], [maxArea], [districtID], [availableRoom], [description], [totalRoom]) VALUES (14, N'8A/2B2 Thái Văn Lung, P. Bến Nghé', N'Hồng Bàng', CAST(N'2022-06-19' AS Date), 1, 1, 44, 3000000, 1200000, 24, 54, 35, 20, N'Hiện đại, tiện lợi', 90)
GO
INSERT [dbo].[Hostel] ([hostelID], [streetAddress], [hostelName], [registeredDate], [activate], [rating], [landlordId], [minPrice], [maxPrice], [minArea], [maxArea], [districtID], [availableRoom], [description], [totalRoom]) VALUES (15, N'867A Nguyễn Văn Quá, P. Đông Hưng Thuận', N'Châu Tấn', CAST(N'2022-06-19' AS Date), 1, 1, 44, 2400000, 4800000, 20, 48, 36, 36, N'Hiện đại, tiện lợi', 80)
GO
INSERT [dbo].[Hostel] ([hostelID], [streetAddress], [hostelName], [registeredDate], [activate], [rating], [landlordId], [minPrice], [maxPrice], [minArea], [maxArea], [districtID], [availableRoom], [description], [totalRoom]) VALUES (16, N'299 Võ Văn Tần', N'Á Bằng', CAST(N'2022-06-19' AS Date), 1, 3.5, 5, 2400000, 4000000, 20, 40, 43, 33, N'Hiện đại, tiện lợi', 80)
GO
SET IDENTITY_INSERT [dbo].[Hostel] OFF
GO
SET IDENTITY_INSERT [dbo].[ImageHostel] ON 
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (1, 1, N'/sakura/assets/images/hostel-list-images/img1.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (2, 1, N'/sakura/assets/images/hostel-list-images/img2.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (3, 1, N'/sakura/assets/images/hostel-list-images/img3.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (4, 1, N'/sakura/assets/images/hostel-list-images/img4.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (5, 2, N'/sakura/assets/images/hostel-list-images/img5.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (6, 4, N'/sakura/assets/images/hostel-list-images/img6.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (7, 4, N'/sakura/assets/images/hostel-list-images/img7.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (8, 4, N'/sakura/assets/images/hostel-list-images/img8.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (9, 5, N'/sakura/assets/images/hostel-list-images/img9.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (10, 5, N'/sakura/assets/images/hostel-list-images/img10.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (24, 6, N'/sakura/assets/images/hostel-list-images/img11.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (25, 6, N'/sakura/assets/images/hostel-list-images/img12.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (26, 7, N'/sakura/assets/images/hostel-list-images/img13.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (27, 7, N'/sakura/assets/images/hostel-list-images/img14.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (28, 11, N'/sakura/assets/images/hostel-list-images/img15.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (29, 8, N'/sakura/assets/images/hostel-list-images/img16.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (30, 9, N'/sakura/assets/images/hostel-list-images/img17.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (31, 9, N'/sakura/assets/images/hostel-list-images/img18.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (32, 10, N'/sakura/assets/images/hostel-list-images/img19.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (33, 10, N'/sakura/assets/images/hostel-list-images/img20.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (34, 11, N'/sakura/assets/images/hostel-list-images/img21.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (35, 14, N'/sakura/assets/images/hostel-list-images/img22.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (36, 15, N'/sakura/assets/images/hostel-list-images/img23.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (37, 16, N'/sakura/assets/images/hostel-list-images/img24.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (38, 14, N'/sakura/assets/images/hostel-list-images/img25.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (39, 15, N'/sakura/assets/images/hostel-list-images/img26.jpg')
GO
INSERT [dbo].[ImageHostel] ([imageHostelId], [hostelId], [imgLink]) VALUES (40, 16, N'/sakura/assets/images/hostel-list-images/img26.jpg')
GO
SET IDENTITY_INSERT [dbo].[ImageHostel] OFF
GO
SET IDENTITY_INSERT [dbo].[ImageRoomType] ON 
GO
INSERT [dbo].[ImageRoomType] ([imageRoomTypeID], [roomTypeID], [imgLink]) VALUES (1, 1, N'https://media-cdn.tripadvisor.com/media/photo-s/16/af/28/82/dormitorio-de-12-camas.jpg')
GO
INSERT [dbo].[ImageRoomType] ([imageRoomTypeID], [roomTypeID], [imgLink]) VALUES (2, 2, N'https://media-cdn.tripadvisor.com/media/photo-s/16/af/28/82/dormitorio-de-12-camas.jpg')
GO
SET IDENTITY_INSERT [dbo].[ImageRoomType] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 
GO
INSERT [dbo].[Invoice] ([invoiceID], [startDate], [endDate], [status], [totalPrice], [contractID], [dueDate], [month], [createdDate], [electricPrice], [waterPrice]) VALUES (1, CAST(N'2022-06-01' AS Date), CAST(N'2022-07-01' AS Date), 1, 3420000, 1, CAST(N'2022-06-10' AS Date), N'06/2022', CAST(N'2022-06-01' AS Date), 27000, 400000)
GO
INSERT [dbo].[Invoice] ([invoiceID], [startDate], [endDate], [status], [totalPrice], [contractID], [dueDate], [month], [createdDate], [electricPrice], [waterPrice]) VALUES (2, CAST(N'2022-05-01' AS Date), CAST(N'2022-06-01' AS Date), 1, 3210000, 1, CAST(N'2202-05-10' AS Date), N'07/2022', CAST(N'2022-05-01' AS Date), 270000, 400000)
GO
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
INSERT [dbo].[Landlord] ([landlordID], [fullname], [phone]) VALUES (4, N'Võ Thị Sáu', N'0983121212')
GO
INSERT [dbo].[Landlord] ([landlordID], [fullname], [phone]) VALUES (5, N'Lê Văn Tám', N'0983232323')
GO
INSERT [dbo].[Landlord] ([landlordID], [fullname], [phone]) VALUES (6, N'ThÃ­ch Quáº£ng Äá»©c', N'1234567890')
GO
INSERT [dbo].[Landlord] ([landlordID], [fullname], [phone]) VALUES (8, N'Há» Cáº©m ÄÃ o', N'1234567890')
GO
INSERT [dbo].[Landlord] ([landlordID], [fullname], [phone]) VALUES (9, N'N''Võ Thị Sáu''', N'1234567890')
GO
INSERT [dbo].[Landlord] ([landlordID], [fullname], [phone]) VALUES (10, N'Võ Thị Sáu', N'1234567890')
GO
INSERT [dbo].[Landlord] ([landlordID], [fullname], [phone]) VALUES (19, N'Ngá»c Trinh', N'12345     ')
GO
INSERT [dbo].[Landlord] ([landlordID], [fullname], [phone]) VALUES (20, N'VÃµ NguyÃªn GiÃ¡p', N'123456    ')
GO
INSERT [dbo].[Landlord] ([landlordID], [fullname], [phone]) VALUES (23, N'Trần Hưng Đạo', N'1234567890')
GO
INSERT [dbo].[Landlord] ([landlordID], [fullname], [phone]) VALUES (26, N'Đường Tăng', N'1234567890')
GO
INSERT [dbo].[Landlord] ([landlordID], [fullname], [phone]) VALUES (32, N'Võ Thị', N'1234567890')
GO
INSERT [dbo].[Landlord] ([landlordID], [fullname], [phone]) VALUES (33, N'Văn Trường', N'1234567890')
GO
INSERT [dbo].[Landlord] ([landlordID], [fullname], [phone]) VALUES (34, N'John Doe', N'1234567890')
GO
INSERT [dbo].[Landlord] ([landlordID], [fullname], [phone]) VALUES (44, N'Nguyễn Văn Trường', N'0987654321')
GO
SET IDENTITY_INSERT [dbo].[Province] ON 
GO
INSERT [dbo].[Province] ([provinceID], [provinceName]) VALUES (1, N'Hà Nội')
GO
INSERT [dbo].[Province] ([provinceID], [provinceName]) VALUES (2, N'TP. Hồ Chí Minh')
GO
SET IDENTITY_INSERT [dbo].[Province] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 
GO
INSERT [dbo].[Room] ([roomID], [roomNumber], [currentNoResidents], [status], [roomTypeID], [latestInvoiceMonth]) VALUES (2, N'A100', 0, 1, 1, CAST(N'2022-05-01' AS Date))
GO
INSERT [dbo].[Room] ([roomID], [roomNumber], [currentNoResidents], [status], [roomTypeID], [latestInvoiceMonth]) VALUES (3, N'A101', 0, 1, 1, CAST(N'2022-06-01' AS Date))
GO
INSERT [dbo].[Room] ([roomID], [roomNumber], [currentNoResidents], [status], [roomTypeID], [latestInvoiceMonth]) VALUES (4, N'A102', 0, 1, 1, CAST(N'2022-06-01' AS Date))
GO
INSERT [dbo].[Room] ([roomID], [roomNumber], [currentNoResidents], [status], [roomTypeID], [latestInvoiceMonth]) VALUES (5, N'A103', 0, 1, 1, CAST(N'2022-06-01' AS Date))
GO
INSERT [dbo].[Room] ([roomID], [roomNumber], [currentNoResidents], [status], [roomTypeID], [latestInvoiceMonth]) VALUES (6, N'A200', 0, 1, 2, CAST(N'2022-05-01' AS Date))
GO
INSERT [dbo].[Room] ([roomID], [roomNumber], [currentNoResidents], [status], [roomTypeID], [latestInvoiceMonth]) VALUES (7, N'A201', 0, 1, 2, CAST(N'2022-06-01' AS Date))
GO
INSERT [dbo].[Room] ([roomID], [roomNumber], [currentNoResidents], [status], [roomTypeID], [latestInvoiceMonth]) VALUES (8, N'A202', 0, 1, 2, CAST(N'2022-06-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomResident] ON 
GO
INSERT [dbo].[RoomResident] ([roomResidentID], [roomID], [fullname], [phone], [dob], [isRoomLead]) VALUES (1, 2, N'Nguyễn Tuấn Nam', N'0987787765', CAST(N'2002-12-20' AS Date), 1)
GO
INSERT [dbo].[RoomResident] ([roomResidentID], [roomID], [fullname], [phone], [dob], [isRoomLead]) VALUES (2, 2, N'Trần Hải Công', N'0238132023', CAST(N'2000-11-22' AS Date), 0)
GO
INSERT [dbo].[RoomResident] ([roomResidentID], [roomID], [fullname], [phone], [dob], [isRoomLead]) VALUES (3, 2, N'Phạm Bá Kiên', N'0238510241', CAST(N'1998-02-03' AS Date), 0)
GO
SET IDENTITY_INSERT [dbo].[RoomResident] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomType] ON 
GO
INSERT [dbo].[RoomType] ([roomTypeID], [roomTypeName], [roomTypeArea], [description], [maxNumberOfResidents], [advertisedPrice], [hostelID]) VALUES (1, N'Bình dân', 30, N'Một phòng ngủ, một nhà vệ sinh', 4, 2000000, 1)
GO
INSERT [dbo].[RoomType] ([roomTypeID], [roomTypeName], [roomTypeArea], [description], [maxNumberOfResidents], [advertisedPrice], [hostelID]) VALUES (2, N'Cao cấp', 50, N'Hai phòng ngủ, một nhà bếp, một nhà vệ sinh', 4, 3000000, 14)
GO
SET IDENTITY_INSERT [dbo].[RoomType] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 
GO
INSERT [dbo].[Service] ([serviceID], [serviceName], [monthApplied], [hostelID], [serviceFee], [unit], [active], [type]) VALUES (1, N'Điện', CAST(N'2022-01-01' AS Date), 1, 3000, N'Kwh', 1, 1)
GO
INSERT [dbo].[Service] ([serviceID], [serviceName], [monthApplied], [hostelID], [serviceFee], [unit], [active], [type]) VALUES (2, N'Nước', CAST(N'2022-02-01' AS Date), 1, 20000, N'm3', 1, 1)
GO
INSERT [dbo].[Service] ([serviceID], [serviceName], [monthApplied], [hostelID], [serviceFee], [unit], [active], [type]) VALUES (5, N'Đỗ xe', CAST(N'2022-02-01' AS Date), 1, 50000, N'Chiếc', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceDetail] ON 
GO
INSERT [dbo].[ServiceDetail] ([serviceDetailID], [startValue], [endValue], [invoiceID], [serviceID], [quantity]) VALUES (1, 10, 100, 1, 1, 90)
GO
INSERT [dbo].[ServiceDetail] ([serviceDetailID], [startValue], [endValue], [invoiceID], [serviceID], [quantity]) VALUES (6, 120, 140, 1, 2, 20)
GO
INSERT [dbo].[ServiceDetail] ([serviceDetailID], [startValue], [endValue], [invoiceID], [serviceID], [quantity]) VALUES (9, 1, 10, 2, 1, 9)
GO
INSERT [dbo].[ServiceDetail] ([serviceDetailID], [startValue], [endValue], [invoiceID], [serviceID], [quantity]) VALUES (11, 100, 120, 2, 2, 20)
GO
SET IDENTITY_INSERT [dbo].[ServiceDetail] OFF
GO
INSERT [dbo].[Tenant] ([tenantID], [fullname], [phone], [rentStatus]) VALUES (3, N'Vũ Thiên Ân', N'0983242424', 0)
GO
INSERT [dbo].[Tenant] ([tenantID], [fullname], [phone], [rentStatus]) VALUES (9, N'Hồng Nhung', N'1234567890', 0)
GO
INSERT [dbo].[Tenant] ([tenantID], [fullname], [phone], [rentStatus]) VALUES (10, N'Nguyễn An', N'1234567890', 0)
GO
INSERT [dbo].[Tenant] ([tenantID], [fullname], [phone], [rentStatus]) VALUES (21, N'Trần Bình', N'1234567890', 0)
GO
INSERT [dbo].[Tenant] ([tenantID], [fullname], [phone], [rentStatus]) VALUES (24, N'Võ Cường', N'1234567890', 0)
GO
INSERT [dbo].[Tenant] ([tenantID], [fullname], [phone], [rentStatus]) VALUES (27, N'Lê Du', N'1234567890', 0)
GO
INSERT [dbo].[Tenant] ([tenantID], [fullname], [phone], [rentStatus]) VALUES (28, N'Hoàng Thanh Hòa', N'919123321 ', 0)
GO
INSERT [dbo].[Tenant] ([tenantID], [fullname], [phone], [rentStatus]) VALUES (29, N'Đỗ Việt Hoàng', N'919123322 ', 0)
GO
INSERT [dbo].[Tenant] ([tenantID], [fullname], [phone], [rentStatus]) VALUES (39, N'Phạm Em', N'0987654321', 0)
GO
INSERT [dbo].[Tenant] ([tenantID], [fullname], [phone], [rentStatus]) VALUES (40, N'Vu Hoang Loc (K16_HCM)', N'0123456789', 0)
GO
INSERT [dbo].[Tenant] ([tenantID], [fullname], [phone], [rentStatus]) VALUES (41, N'Lộc Vũ Hoàng', N'0123456782', 0)
GO
INSERT [dbo].[Tenant] ([tenantID], [fullname], [phone], [rentStatus]) VALUES (42, N'Khang Nguyen', N'0123456789', 0)
GO
INSERT [dbo].[Tenant] ([tenantID], [fullname], [phone], [rentStatus]) VALUES (43, N'abc', N'0123456789', 0)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__AB6E6164FC795C86]    Script Date: 6/29/2022 4:54:43 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__F3DBC572DE5157A4]    Script Date: 6/29/2022 4:54:43 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookingRequest] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Hostel] ADD  CONSTRAINT [DF_Hostel_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
GO
ALTER TABLE [dbo].[Hostel] ADD  CONSTRAINT [DF_Hostel_activate]  DEFAULT ((1)) FOR [activate]
GO
ALTER TABLE [dbo].[Hostel] ADD  CONSTRAINT [DF_Hostel_rating]  DEFAULT ((0)) FOR [rating]
GO
ALTER TABLE [dbo].[Invoice] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Invoice] ADD  DEFAULT ((0)) FOR [electricPrice]
GO
ALTER TABLE [dbo].[Invoice] ADD  DEFAULT ((0)) FOR [waterPrice]
GO
ALTER TABLE [dbo].[Notification] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Service] ADD  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF__Service__type__52E34C9D]  DEFAULT ((0)) FOR [type]
GO
ALTER TABLE [dbo].[ServiceDetail] ADD  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[BookingRequest]  WITH CHECK ADD FOREIGN KEY([roomTypeID])
REFERENCES [dbo].[RoomType] ([roomTypeID])
GO
ALTER TABLE [dbo].[BookingRequest]  WITH CHECK ADD FOREIGN KEY([tenantID])
REFERENCES [dbo].[Tenant] ([tenantID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([contractID])
REFERENCES [dbo].[BookingRequest] ([bookingRequestID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([roomID])
REFERENCES [dbo].[Room] ([roomID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([tenantID])
REFERENCES [dbo].[Tenant] ([tenantID])
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FKWard372469] FOREIGN KEY([provinceID])
REFERENCES [dbo].[Province] ([provinceID])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FKWard372469]
GO
ALTER TABLE [dbo].[FavoriteHostel]  WITH CHECK ADD FOREIGN KEY([tenantID])
REFERENCES [dbo].[Tenant] ([tenantID])
GO
ALTER TABLE [dbo].[FavoriteHostel]  WITH CHECK ADD  CONSTRAINT [FKFavoriteHo91007] FOREIGN KEY([hostelID])
REFERENCES [dbo].[Hostel] ([hostelID])
GO
ALTER TABLE [dbo].[FavoriteHostel] CHECK CONSTRAINT [FKFavoriteHo91007]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FKFeedback369992] FOREIGN KEY([hostelID])
REFERENCES [dbo].[Hostel] ([hostelID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FKFeedback369992]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FKFeedback747061] FOREIGN KEY([tenantID])
REFERENCES [dbo].[Tenant] ([tenantID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FKFeedback747061]
GO
ALTER TABLE [dbo].[GoogleAccount]  WITH CHECK ADD FOREIGN KEY([googleID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Hostel]  WITH CHECK ADD  CONSTRAINT [FKHostel445891] FOREIGN KEY([landlordId])
REFERENCES [dbo].[Landlord] ([landlordID])
GO
ALTER TABLE [dbo].[Hostel] CHECK CONSTRAINT [FKHostel445891]
GO
ALTER TABLE [dbo].[Hostel]  WITH CHECK ADD  CONSTRAINT [FKHostel995260] FOREIGN KEY([districtID])
REFERENCES [dbo].[District] ([districtID])
GO
ALTER TABLE [dbo].[Hostel] CHECK CONSTRAINT [FKHostel995260]
GO
ALTER TABLE [dbo].[ImageHostel]  WITH CHECK ADD FOREIGN KEY([hostelId])
REFERENCES [dbo].[Hostel] ([hostelID])
GO
ALTER TABLE [dbo].[ImageRoomType]  WITH CHECK ADD FOREIGN KEY([roomTypeID])
REFERENCES [dbo].[RoomType] ([roomTypeID])
GO
ALTER TABLE [dbo].[Landlord]  WITH CHECK ADD  CONSTRAINT [FKLandlord96320] FOREIGN KEY([landlordID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Landlord] CHECK CONSTRAINT [FKLandlord96320]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([toAccountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([roomTypeID])
REFERENCES [dbo].[RoomType] ([roomTypeID])
GO
ALTER TABLE [dbo].[RoomResident]  WITH CHECK ADD  CONSTRAINT [FKRoomReside27969] FOREIGN KEY([roomID])
REFERENCES [dbo].[Room] ([roomID])
GO
ALTER TABLE [dbo].[RoomResident] CHECK CONSTRAINT [FKRoomReside27969]
GO
ALTER TABLE [dbo].[RoomType]  WITH CHECK ADD FOREIGN KEY([hostelID])
REFERENCES [dbo].[Hostel] ([hostelID])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FKService66033] FOREIGN KEY([hostelID])
REFERENCES [dbo].[Hostel] ([hostelID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FKService66033]
GO
ALTER TABLE [dbo].[ServiceDetail]  WITH CHECK ADD  CONSTRAINT [FKServiceDet37321] FOREIGN KEY([serviceID])
REFERENCES [dbo].[Service] ([serviceID])
GO
ALTER TABLE [dbo].[ServiceDetail] CHECK CONSTRAINT [FKServiceDet37321]
GO
ALTER TABLE [dbo].[ServiceDetail]  WITH CHECK ADD  CONSTRAINT [FKServiceDet434809] FOREIGN KEY([invoiceID])
REFERENCES [dbo].[Invoice] ([invoiceID])
GO
ALTER TABLE [dbo].[ServiceDetail] CHECK CONSTRAINT [FKServiceDet434809]
GO
ALTER TABLE [dbo].[Tenant]  WITH CHECK ADD  CONSTRAINT [FKTenant891436] FOREIGN KEY([tenantID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Tenant] CHECK CONSTRAINT [FKTenant891436]
GO
USE [master]
GO
ALTER DATABASE [HostelManagement] SET  READ_WRITE 
GO
