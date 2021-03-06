USE [master]
GO
/****** Object:  Database [EventManagement]    Script Date: 10/3/2021 10:58:45 AM ******/
CREATE DATABASE [EventManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EventManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DUONGMH\MSSQL\DATA\EventManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EventManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DUONGMH\MSSQL\DATA\EventManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EventManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EventManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EventManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EventManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EventManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EventManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EventManagement] SET  MULTI_USER 
GO
ALTER DATABASE [EventManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EventManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EventManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EventManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EventManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EventManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EventManagement] SET QUERY_STORE = OFF
GO
USE [EventManagement]
GO
/****** Object:  Table [dbo].[tblComments]    Script Date: 10/3/2021 10:58:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComments](
	[commentId] [int] IDENTITY(1,1) NOT NULL,
	[contents] [nvarchar](500) NOT NULL,
	[replyId] [int] NULL,
	[eventId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[isQuestion] [bit] NOT NULL,
 CONSTRAINT [PK_tblComments] PRIMARY KEY CLUSTERED 
(
	[commentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDateTimeLocation]    Script Date: 10/3/2021 10:58:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDateTimeLocation](
	[eventId] [int] NOT NULL,
	[rangeId] [int] NOT NULL,
	[locationId] [int] NOT NULL,
	[date] [date] NOT NULL,
	[statusId] [int] NOT NULL,
 CONSTRAINT [PK_tblDateTimeLocation] PRIMARY KEY CLUSTERED 
(
	[rangeId] ASC,
	[locationId] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDateTimeLocationStatus]    Script Date: 10/3/2021 10:58:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDateTimeLocationStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblDateTimeLocationStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEvents]    Script Date: 10/3/2021 10:58:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEvents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](4000) NOT NULL,
	[poster] [varchar](1000) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[statusId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[postAfterEvent] [nvarchar](4000) NULL,
	[ImageAfterEvent] [varchar](1000) NULL,
 CONSTRAINT [PK_tblEvents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEventStatus]    Script Date: 10/3/2021 10:58:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEventStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblEventStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInvitationStatus]    Script Date: 10/3/2021 10:58:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInvitationStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblInvitationStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLecturersInEvents]    Script Date: 10/3/2021 10:58:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLecturersInEvents](
	[eventId] [int] NOT NULL,
	[lecturerId] [int] NOT NULL,
	[statusId] [int] NOT NULL,
 CONSTRAINT [PK_tblLecturersInEvents_1] PRIMARY KEY CLUSTERED 
(
	[eventId] ASC,
	[lecturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLocations]    Script Date: 10/3/2021 10:58:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLocations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[image] [varchar](1000) NULL,
 CONSTRAINT [PK_tblLocations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNotificationDetail]    Script Date: 10/3/2021 10:58:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotificationDetail](
	[notificationId] [int] NOT NULL,
	[eventId] [int] NOT NULL,
	[studentId] [int] NOT NULL,
	[description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_tblNotificationDetail] PRIMARY KEY CLUSTERED 
(
	[notificationId] ASC,
	[eventId] ASC,
	[studentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNotifications]    Script Date: 10/3/2021 10:58:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](1000) NOT NULL,
	[eventId] [int] NOT NULL,
 CONSTRAINT [PK_tblNotifications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 10/3/2021 10:58:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStudentsInEvents]    Script Date: 10/3/2021 10:58:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudentsInEvents](
	[eventId] [int] NOT NULL,
	[studentId] [int] NOT NULL,
	[isFollowing] [bit] NOT NULL,
	[IsJoining] [bit] NOT NULL,
 CONSTRAINT [PK_tblStudentsInEvents_1] PRIMARY KEY CLUSTERED 
(
	[eventId] ASC,
	[studentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTimeRanges]    Script Date: 10/3/2021 10:58:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTimeRanges](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rangeName] [varchar](10) NOT NULL,
	[detail] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblTimeRanges] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/3/2021 10:58:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[avatar] [varchar](1000) NULL,
	[address] [nvarchar](200) NULL,
	[phoneNum] [char](10) NULL,
	[statusId] [varchar](3) NOT NULL,
	[roleId] [int] NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserStatus]    Script Date: 10/3/2021 10:58:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserStatus](
	[id] [varchar](3) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblUserStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblComments] ON 

INSERT [dbo].[tblComments] ([commentId], [contents], [replyId], [eventId], [userId], [isQuestion]) VALUES (1, N'Dạ evt có vẻ dui', NULL, 1, 1, 0)
INSERT [dbo].[tblComments] ([commentId], [contents], [replyId], [eventId], [userId], [isQuestion]) VALUES (2, N'Dạ bạn em bị đui nên cho em hỏi thời gian diễn ra là khi nào ạ?', NULL, 1, 1, 1)
INSERT [dbo].[tblComments] ([commentId], [contents], [replyId], [eventId], [userId], [isQuestion]) VALUES (3, N'Kết thúc rồi nha em', 2, 1, 2, 0)
SET IDENTITY_INSERT [dbo].[tblComments] OFF
GO
INSERT [dbo].[tblDateTimeLocation] ([eventId], [rangeId], [locationId], [date], [statusId]) VALUES (1, 1, 1, CAST(N'2021-09-24' AS Date), 1)
INSERT [dbo].[tblDateTimeLocation] ([eventId], [rangeId], [locationId], [date], [statusId]) VALUES (1, 1, 1, CAST(N'2021-09-27' AS Date), 1)
INSERT [dbo].[tblDateTimeLocation] ([eventId], [rangeId], [locationId], [date], [statusId]) VALUES (1, 1, 2, CAST(N'2021-09-24' AS Date), 1)
INSERT [dbo].[tblDateTimeLocation] ([eventId], [rangeId], [locationId], [date], [statusId]) VALUES (1, 1, 2, CAST(N'2021-09-28' AS Date), 1)
INSERT [dbo].[tblDateTimeLocation] ([eventId], [rangeId], [locationId], [date], [statusId]) VALUES (1, 2, 2, CAST(N'2021-09-24' AS Date), 1)
INSERT [dbo].[tblDateTimeLocation] ([eventId], [rangeId], [locationId], [date], [statusId]) VALUES (1, 2, 2, CAST(N'2021-09-28' AS Date), 1)
INSERT [dbo].[tblDateTimeLocation] ([eventId], [rangeId], [locationId], [date], [statusId]) VALUES (1, 2, 3, CAST(N'2021-09-24' AS Date), 1)
INSERT [dbo].[tblDateTimeLocation] ([eventId], [rangeId], [locationId], [date], [statusId]) VALUES (1, 4, 2, CAST(N'2021-09-28' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[tblDateTimeLocationStatus] ON 

INSERT [dbo].[tblDateTimeLocationStatus] ([id], [statusName]) VALUES (1, N'Bị chiếm')
INSERT [dbo].[tblDateTimeLocationStatus] ([id], [statusName]) VALUES (2, N'Bị hủy')
SET IDENTITY_INSERT [dbo].[tblDateTimeLocationStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEvents] ON 

INSERT [dbo].[tblEvents] ([id], [name], [description], [poster], [createDate], [statusId], [userId], [postAfterEvent], [ImageAfterEvent]) VALUES (1, N'FCAMP - Kỉ niệm 30 năm thành lập nhà hàng Hà Linh', N'Nhân dịp lễ kỷ niệm 30 năm thành lập nhà hàng Hà Linh, chúng tôi sẽ có một buổi offline nho nhỏ dành cho các khách hàng thân mật của quý nhà hàng trong suốt 30 năm vừa qua. Khi tham gia mọi người sẽ được phát 30 phiếu ăn sáng, 30 phiếu ăn chiều và 50 phiếu ăn khuya có thời hạn sử dụng trong vòng 1 năm. Thực đơn tùy chọn phù hợp với nhu cầu của từng người, bao gồm có hủ tiếu, mì nước, bánh canh và nhiều món nước khác (chỉ khác nhau phần cọng chứ thật ra vẫn là chung 1 loại nước dùng và 1 loại topping đó chính là cá viên)', N'https://d25tv1xepz39hi.cloudfront.net/2017-08-21/files/landscape-photography_1645.jpg', CAST(N'2021-09-24T01:53:27.377' AS DateTime), 1, 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblEvents] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEventStatus] ON 

INSERT [dbo].[tblEventStatus] ([id], [statusName]) VALUES (1, N'Sắp diễn ra')
INSERT [dbo].[tblEventStatus] ([id], [statusName]) VALUES (2, N'Đang diễn ra')
INSERT [dbo].[tblEventStatus] ([id], [statusName]) VALUES (3, N'Đã hủy')
INSERT [dbo].[tblEventStatus] ([id], [statusName]) VALUES (4, N'Kết thúc')
SET IDENTITY_INSERT [dbo].[tblEventStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[tblInvitationStatus] ON 

INSERT [dbo].[tblInvitationStatus] ([id], [statusName]) VALUES (1, N'Chấp nhận')
INSERT [dbo].[tblInvitationStatus] ([id], [statusName]) VALUES (2, N'Từ chối')
INSERT [dbo].[tblInvitationStatus] ([id], [statusName]) VALUES (3, N'Chưa trả lời')
SET IDENTITY_INSERT [dbo].[tblInvitationStatus] OFF
GO
INSERT [dbo].[tblLecturersInEvents] ([eventId], [lecturerId], [statusId]) VALUES (1, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[tblLocations] ON 

INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (1, N'Hội trường A', N'Hội trường A ĐH FPT HCM', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (2, N'Hội trường B', N'Hội trường B ĐH FPT HCM', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (3, N'Thư viện tầng 1', N'Tầng 1 của thư viện ĐH FPT HCM', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (4, N'Thư viện tầng 2', N'Tầng 2 của thư viện ĐH FPT HCM', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (5, N'Thư viện tầng 3', N'Tầng 3 của thư viện ĐH FPT HCM', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (6, N'Phòng 001', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (7, N'Phòng 002', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (8, N'Phòng 003', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (9, N'Phòng 004', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (10, N'Phòng 005', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (11, N'Phòng 006', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (12, N'Phòng 007', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (13, N'Phòng 008', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (14, N'Phòng 009', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (15, N'Phòng 010', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (16, N'Phòng 011', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (17, N'Phòng 012', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (18, N'Phòng 013', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (19, N'Phòng 014', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (20, N'Phòng 015', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (21, N'Phòng 016', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (22, N'Phòng 017', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (23, N'Phòng 018', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (24, N'Phòng 019', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (25, N'Phòng 020', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (26, N'Phòng 101', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (27, N'Phòng 102', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (28, N'Phòng 103', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (29, N'Phòng 104', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (30, N'Phòng 105', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (31, N'Phòng 106', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (32, N'Phòng 107', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (33, N'Phòng 108', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (34, N'Phòng 109', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (35, N'Phòng 110', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (36, N'Phòng 111', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (37, N'Phòng 112', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (38, N'Phòng 113', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (39, N'Phòng 114', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (40, N'Phòng 115', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (41, N'Phòng 116', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (42, N'Phòng 117', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (43, N'Phòng 118', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (44, N'Phòng 119', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (45, N'Phòng 120', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (46, N'Phòng 201', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (47, N'Phòng 202', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (48, N'Phòng 203', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (49, N'Phòng 204', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (50, N'Phòng 205', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (51, N'Phòng 206', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (52, N'Phòng 207', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (53, N'Phòng 208', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (54, N'Phòng 209', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (55, N'Phòng 210', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (56, N'Phòng 211', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (57, N'Phòng 212', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (58, N'Phòng 213', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (59, N'Phòng 214', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (60, N'Phòng 215', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (61, N'Phòng 216', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (62, N'Phòng 217', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (63, N'Phòng 218', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (64, N'Phòng 219', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (65, N'Phòng 220', N'Phòng học', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (67, N'Sảnh trống đồng', N'Sảnh chính', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (68, N'Sảnh tầng 1', N'Sảnh', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (69, N'Sảnh tầng 2', N'Sảnh', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (70, N'Sảnh tầng 3', N'Sảnh', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (71, N'Sân trường', N'Sân', NULL)
INSERT [dbo].[tblLocations] ([id], [name], [description], [image]) VALUES (72, N'Sảnh sân sau', N'Sảnh', NULL)
SET IDENTITY_INSERT [dbo].[tblLocations] OFF
GO
INSERT [dbo].[tblNotificationDetail] ([notificationId], [eventId], [studentId], [description]) VALUES (1, 1, 1, N'ủa cái này chi dị')
GO
SET IDENTITY_INSERT [dbo].[tblNotifications] ON 

INSERT [dbo].[tblNotifications] ([id], [description], [eventId]) VALUES (1, N'Diễn ra sáng hôm nay', 1)
SET IDENTITY_INSERT [dbo].[tblNotifications] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRoles] ON 

INSERT [dbo].[tblRoles] ([id], [roleName]) VALUES (1, N'Student')
INSERT [dbo].[tblRoles] ([id], [roleName]) VALUES (2, N'Lecturer')
INSERT [dbo].[tblRoles] ([id], [roleName]) VALUES (3, N'Club''s leader')
INSERT [dbo].[tblRoles] ([id], [roleName]) VALUES (4, N'Department''s manager')
SET IDENTITY_INSERT [dbo].[tblRoles] OFF
GO
INSERT [dbo].[tblStudentsInEvents] ([eventId], [studentId], [isFollowing], [IsJoining]) VALUES (1, 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tblTimeRanges] ON 

INSERT [dbo].[tblTimeRanges] ([id], [rangeName], [detail]) VALUES (1, N'Slot 1', N'7:00 - 8:30')
INSERT [dbo].[tblTimeRanges] ([id], [rangeName], [detail]) VALUES (2, N'Slot 2', N'8:45 - 10:15')
INSERT [dbo].[tblTimeRanges] ([id], [rangeName], [detail]) VALUES (3, N'Slot 3', N'10:30 - 12:00')
INSERT [dbo].[tblTimeRanges] ([id], [rangeName], [detail]) VALUES (4, N'Slot 4', N'12:30 - 14:00')
INSERT [dbo].[tblTimeRanges] ([id], [rangeName], [detail]) VALUES (5, N'Slot 5', N'14:15 - 15:45')
INSERT [dbo].[tblTimeRanges] ([id], [rangeName], [detail]) VALUES (6, N'Slot 6', N'16:00 - 17:30')
INSERT [dbo].[tblTimeRanges] ([id], [rangeName], [detail]) VALUES (7, N'Slot 7', N'17:45 - 19h10')
INSERT [dbo].[tblTimeRanges] ([id], [rangeName], [detail]) VALUES (8, N'Slot 8', N'19:30 - 21:00')
SET IDENTITY_INSERT [dbo].[tblTimeRanges] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([id], [email], [name], [avatar], [address], [phoneNum], [statusId], [roleId]) VALUES (1, N'abc@gmail.com', N'ABC', NULL, NULL, N'8888888888', N'AC', 1)
INSERT [dbo].[tblUsers] ([id], [email], [name], [avatar], [address], [phoneNum], [statusId], [roleId]) VALUES (2, N'cde@gmail.com', N'CDE', NULL, NULL, N'7777777777', N'AC', 2)
INSERT [dbo].[tblUsers] ([id], [email], [name], [avatar], [address], [phoneNum], [statusId], [roleId]) VALUES (3, N'club@gmail.com', N'CLB ABC', NULL, NULL, N'6666666666', N'AC', 3)
INSERT [dbo].[tblUsers] ([id], [email], [name], [avatar], [address], [phoneNum], [statusId], [roleId]) VALUES (4, N'haha@gmail.com', N'HAHAHA', NULL, N'', N'5555555555', N'AC', 1)
INSERT [dbo].[tblUsers] ([id], [email], [name], [avatar], [address], [phoneNum], [statusId], [roleId]) VALUES (5, N'aloha@gmail.com', N'ALOHA', NULL, NULL, N'9999999999', N'AC', 3)
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
GO
INSERT [dbo].[tblUserStatus] ([id], [statusName]) VALUES (N'AC', N'Activated')
INSERT [dbo].[tblUserStatus] ([id], [statusName]) VALUES (N'DE', N'Deactivated')
GO
ALTER TABLE [dbo].[tblComments]  WITH CHECK ADD  CONSTRAINT [FK_tblComments_tblComments] FOREIGN KEY([replyId])
REFERENCES [dbo].[tblComments] ([commentId])
GO
ALTER TABLE [dbo].[tblComments] CHECK CONSTRAINT [FK_tblComments_tblComments]
GO
ALTER TABLE [dbo].[tblComments]  WITH CHECK ADD  CONSTRAINT [FK_tblComments_tblEvents] FOREIGN KEY([eventId])
REFERENCES [dbo].[tblEvents] ([id])
GO
ALTER TABLE [dbo].[tblComments] CHECK CONSTRAINT [FK_tblComments_tblEvents]
GO
ALTER TABLE [dbo].[tblComments]  WITH CHECK ADD  CONSTRAINT [FK_tblComments_tblUsers] FOREIGN KEY([userId])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblComments] CHECK CONSTRAINT [FK_tblComments_tblUsers]
GO
ALTER TABLE [dbo].[tblDateTimeLocation]  WITH CHECK ADD  CONSTRAINT [FK_tblDateTimeLocation_tblDateTimeLocationStatus] FOREIGN KEY([statusId])
REFERENCES [dbo].[tblDateTimeLocationStatus] ([id])
GO
ALTER TABLE [dbo].[tblDateTimeLocation] CHECK CONSTRAINT [FK_tblDateTimeLocation_tblDateTimeLocationStatus]
GO
ALTER TABLE [dbo].[tblDateTimeLocation]  WITH CHECK ADD  CONSTRAINT [FK_tblDateTimeLocation_tblEvents] FOREIGN KEY([eventId])
REFERENCES [dbo].[tblEvents] ([id])
GO
ALTER TABLE [dbo].[tblDateTimeLocation] CHECK CONSTRAINT [FK_tblDateTimeLocation_tblEvents]
GO
ALTER TABLE [dbo].[tblDateTimeLocation]  WITH CHECK ADD  CONSTRAINT [FK_tblDateTimeLocation_tblLocations] FOREIGN KEY([locationId])
REFERENCES [dbo].[tblLocations] ([id])
GO
ALTER TABLE [dbo].[tblDateTimeLocation] CHECK CONSTRAINT [FK_tblDateTimeLocation_tblLocations]
GO
ALTER TABLE [dbo].[tblDateTimeLocation]  WITH CHECK ADD  CONSTRAINT [FK_tblDateTimeLocation_tblTimeRanges] FOREIGN KEY([rangeId])
REFERENCES [dbo].[tblTimeRanges] ([id])
GO
ALTER TABLE [dbo].[tblDateTimeLocation] CHECK CONSTRAINT [FK_tblDateTimeLocation_tblTimeRanges]
GO
ALTER TABLE [dbo].[tblEvents]  WITH CHECK ADD  CONSTRAINT [FK_tblEvents_tblEventStatus] FOREIGN KEY([statusId])
REFERENCES [dbo].[tblEventStatus] ([id])
GO
ALTER TABLE [dbo].[tblEvents] CHECK CONSTRAINT [FK_tblEvents_tblEventStatus]
GO
ALTER TABLE [dbo].[tblEvents]  WITH CHECK ADD  CONSTRAINT [FK_tblEvents_tblUsers] FOREIGN KEY([userId])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblEvents] CHECK CONSTRAINT [FK_tblEvents_tblUsers]
GO
ALTER TABLE [dbo].[tblLecturersInEvents]  WITH CHECK ADD  CONSTRAINT [FK_tblLecturersInEvents_tblEvents] FOREIGN KEY([eventId])
REFERENCES [dbo].[tblEvents] ([id])
GO
ALTER TABLE [dbo].[tblLecturersInEvents] CHECK CONSTRAINT [FK_tblLecturersInEvents_tblEvents]
GO
ALTER TABLE [dbo].[tblLecturersInEvents]  WITH CHECK ADD  CONSTRAINT [FK_tblLecturersInEvents_tblInvitationStatus] FOREIGN KEY([statusId])
REFERENCES [dbo].[tblInvitationStatus] ([id])
GO
ALTER TABLE [dbo].[tblLecturersInEvents] CHECK CONSTRAINT [FK_tblLecturersInEvents_tblInvitationStatus]
GO
ALTER TABLE [dbo].[tblLecturersInEvents]  WITH CHECK ADD  CONSTRAINT [FK_tblLecturersInEvents_tblUsers] FOREIGN KEY([lecturerId])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblLecturersInEvents] CHECK CONSTRAINT [FK_tblLecturersInEvents_tblUsers]
GO
ALTER TABLE [dbo].[tblNotificationDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblNotificationDetail_tblNotifications] FOREIGN KEY([notificationId])
REFERENCES [dbo].[tblNotifications] ([id])
GO
ALTER TABLE [dbo].[tblNotificationDetail] CHECK CONSTRAINT [FK_tblNotificationDetail_tblNotifications]
GO
ALTER TABLE [dbo].[tblNotificationDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblNotificationDetail_tblStudentsInEvents] FOREIGN KEY([eventId], [studentId])
REFERENCES [dbo].[tblStudentsInEvents] ([eventId], [studentId])
GO
ALTER TABLE [dbo].[tblNotificationDetail] CHECK CONSTRAINT [FK_tblNotificationDetail_tblStudentsInEvents]
GO
ALTER TABLE [dbo].[tblNotifications]  WITH CHECK ADD  CONSTRAINT [FK_tblNotifications_tblEvents] FOREIGN KEY([eventId])
REFERENCES [dbo].[tblEvents] ([id])
GO
ALTER TABLE [dbo].[tblNotifications] CHECK CONSTRAINT [FK_tblNotifications_tblEvents]
GO
ALTER TABLE [dbo].[tblStudentsInEvents]  WITH CHECK ADD  CONSTRAINT [FK_tblStudentsInEvents_tblEvents] FOREIGN KEY([eventId])
REFERENCES [dbo].[tblEvents] ([id])
GO
ALTER TABLE [dbo].[tblStudentsInEvents] CHECK CONSTRAINT [FK_tblStudentsInEvents_tblEvents]
GO
ALTER TABLE [dbo].[tblStudentsInEvents]  WITH CHECK ADD  CONSTRAINT [FK_tblStudentsInEvents_tblUsers] FOREIGN KEY([studentId])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblStudentsInEvents] CHECK CONSTRAINT [FK_tblStudentsInEvents_tblUsers]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleId])
REFERENCES [dbo].[tblRoles] ([id])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblUserStatus] FOREIGN KEY([statusId])
REFERENCES [dbo].[tblUserStatus] ([id])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblUserStatus]
GO
USE [master]
GO
ALTER DATABASE [EventManagement] SET  READ_WRITE 
GO
