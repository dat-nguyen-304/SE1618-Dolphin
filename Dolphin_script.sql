USE [master]
GO
/****** Object:  Database [HostelManagement]    Script Date: 7/15/2022 4:06:48 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 7/15/2022 4:06:48 PM ******/
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
	[verificationCode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingRequest]    Script Date: 7/15/2022 4:06:48 PM ******/
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
/****** Object:  Table [dbo].[Contract]    Script Date: 7/15/2022 4:06:48 PM ******/
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
	[actualEndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[contractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 7/15/2022 4:06:48 PM ******/
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
/****** Object:  Table [dbo].[FavoriteHostel]    Script Date: 7/15/2022 4:06:48 PM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/15/2022 4:06:48 PM ******/
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
/****** Object:  Table [dbo].[GoogleAccount]    Script Date: 7/15/2022 4:06:48 PM ******/
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
/****** Object:  Table [dbo].[Hostel]    Script Date: 7/15/2022 4:06:48 PM ******/
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
/****** Object:  Table [dbo].[ImageHostel]    Script Date: 7/15/2022 4:06:48 PM ******/
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
/****** Object:  Table [dbo].[ImageRoomType]    Script Date: 7/15/2022 4:06:48 PM ******/
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
/****** Object:  Table [dbo].[Invoice]    Script Date: 7/15/2022 4:06:48 PM ******/
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
	[month] [varchar](10) NULL,
	[createdDate] [date] NULL,
	[electricPrice] [int] NULL,
	[waterPrice] [int] NULL,
	[contractID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[invoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Landlord]    Script Date: 7/15/2022 4:06:48 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 7/15/2022 4:06:48 PM ******/
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
/****** Object:  Table [dbo].[Province]    Script Date: 7/15/2022 4:06:48 PM ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 7/15/2022 4:06:48 PM ******/
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
	[activate] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomResident]    Script Date: 7/15/2022 4:06:48 PM ******/
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
	[activate] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[roomResidentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 7/15/2022 4:06:48 PM ******/
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
	[activate] [bit] NULL,
	[availableRoom] [int] NULL,
	[totalRoom] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[roomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 7/15/2022 4:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[serviceID] [int] IDENTITY(1,1) NOT NULL,
	[serviceName] [nvarchar](30) NOT NULL,
	[monthApplied] [date] NOT NULL,
	[hostelID] [int] NOT NULL,
	[unit] [nvarchar](20) NOT NULL,
	[active] [bit] NULL,
	[serviceFee] [int] NULL,
	[type] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[serviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceDetail]    Script Date: 7/15/2022 4:06:48 PM ******/
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
/****** Object:  Table [dbo].[Tenant]    Script Date: 7/15/2022 4:06:48 PM ******/
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
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_activate]  DEFAULT ((1)) FOR [activate]
GO
ALTER TABLE [dbo].[BookingRequest] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Contract] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Hostel] ADD  CONSTRAINT [DF_Hostel_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
GO
ALTER TABLE [dbo].[Hostel] ADD  CONSTRAINT [DF_Hostel_activate]  DEFAULT ((1)) FOR [activate]
GO
ALTER TABLE [dbo].[Hostel] ADD  CONSTRAINT [DF_Hostel_rating]  DEFAULT ((0)) FOR [rating]
GO
ALTER TABLE [dbo].[Hostel] ADD  CONSTRAINT [DF_Hostel_minPrice]  DEFAULT ((0)) FOR [minPrice]
GO
ALTER TABLE [dbo].[Hostel] ADD  CONSTRAINT [DF_Hostel_maxPrice]  DEFAULT ((0)) FOR [maxPrice]
GO
ALTER TABLE [dbo].[Hostel] ADD  CONSTRAINT [DF_Hostel_minArea]  DEFAULT ((0)) FOR [minArea]
GO
ALTER TABLE [dbo].[Hostel] ADD  CONSTRAINT [DF_Hostel_maxArea]  DEFAULT ((0)) FOR [maxArea]
GO
ALTER TABLE [dbo].[Hostel] ADD  CONSTRAINT [DF_Hostel_availableRoom]  DEFAULT ((0)) FOR [availableRoom]
GO
ALTER TABLE [dbo].[Hostel] ADD  CONSTRAINT [DF_Hostel_totalRoom]  DEFAULT ((0)) FOR [totalRoom]
GO
ALTER TABLE [dbo].[Invoice] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Invoice] ADD  DEFAULT ((0)) FOR [electricPrice]
GO
ALTER TABLE [dbo].[Invoice] ADD  DEFAULT ((0)) FOR [waterPrice]
GO
ALTER TABLE [dbo].[Notification] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [DF_Room_currentNoResidents]  DEFAULT ((0)) FOR [currentNoResidents]
GO
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [DF_Room_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Room] ADD  DEFAULT ((1)) FOR [activate]
GO
ALTER TABLE [dbo].[RoomResident] ADD  DEFAULT ((1)) FOR [activate]
GO
ALTER TABLE [dbo].[RoomType] ADD  DEFAULT ((1)) FOR [activate]
GO
ALTER TABLE [dbo].[RoomType] ADD  DEFAULT ((0)) FOR [availableRoom]
GO
ALTER TABLE [dbo].[RoomType] ADD  DEFAULT ((0)) FOR [totalRoom]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_monthApplied]  DEFAULT (getdate()) FOR [monthApplied]
GO
ALTER TABLE [dbo].[Service] ADD  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[Service] ADD  DEFAULT ((0)) FOR [type]
GO
ALTER TABLE [dbo].[ServiceDetail] ADD  CONSTRAINT [DF_ServiceDetail_startValue]  DEFAULT ((0)) FOR [startValue]
GO
ALTER TABLE [dbo].[ServiceDetail] ADD  CONSTRAINT [DF_ServiceDetail_endValue]  DEFAULT ((0)) FOR [endValue]
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
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([contractID])
REFERENCES [dbo].[Contract] ([contractID])
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
