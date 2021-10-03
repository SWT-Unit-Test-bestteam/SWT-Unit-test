USE [master]
GO
/****** Object:  Database [EventManagement]    Script Date: 10/3/2021 10:55:23 AM ******/
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
/****** Object:  Table [dbo].[tblComments]    Script Date: 10/3/2021 10:55:23 AM ******/
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
/****** Object:  Table [dbo].[tblDateTimeLocation]    Script Date: 10/3/2021 10:55:23 AM ******/
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
/****** Object:  Table [dbo].[tblDateTimeLocationStatus]    Script Date: 10/3/2021 10:55:23 AM ******/
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
/****** Object:  Table [dbo].[tblEvents]    Script Date: 10/3/2021 10:55:23 AM ******/
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
/****** Object:  Table [dbo].[tblEventStatus]    Script Date: 10/3/2021 10:55:23 AM ******/
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
/****** Object:  Table [dbo].[tblInvitationStatus]    Script Date: 10/3/2021 10:55:23 AM ******/
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
/****** Object:  Table [dbo].[tblLecturersInEvents]    Script Date: 10/3/2021 10:55:23 AM ******/
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
/****** Object:  Table [dbo].[tblLocations]    Script Date: 10/3/2021 10:55:23 AM ******/
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
/****** Object:  Table [dbo].[tblNotificationDetail]    Script Date: 10/3/2021 10:55:23 AM ******/
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
/****** Object:  Table [dbo].[tblNotifications]    Script Date: 10/3/2021 10:55:23 AM ******/
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
/****** Object:  Table [dbo].[tblRoles]    Script Date: 10/3/2021 10:55:23 AM ******/
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
/****** Object:  Table [dbo].[tblStudentsInEvents]    Script Date: 10/3/2021 10:55:23 AM ******/
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
/****** Object:  Table [dbo].[tblTimeRanges]    Script Date: 10/3/2021 10:55:23 AM ******/
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
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/3/2021 10:55:23 AM ******/
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
/****** Object:  Table [dbo].[tblUserStatus]    Script Date: 10/3/2021 10:55:23 AM ******/
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
