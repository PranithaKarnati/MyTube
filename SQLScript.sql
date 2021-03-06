USE [master]
GO
/****** Object:  Database [MyTube]    Script Date: 4/11/2016 7:36:22 AM ******/
CREATE DATABASE [MyTube]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyTube', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MyTube.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyTube_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MyTube_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MyTube] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyTube].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyTube] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyTube] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyTube] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyTube] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyTube] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyTube] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyTube] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyTube] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyTube] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyTube] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyTube] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyTube] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyTube] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyTube] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyTube] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyTube] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyTube] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyTube] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyTube] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyTube] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyTube] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyTube] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyTube] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyTube] SET  MULTI_USER 
GO
ALTER DATABASE [MyTube] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyTube] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyTube] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyTube] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MyTube] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MyTube]
GO
/****** Object:  Table [dbo].[Channel]    Script Date: 4/11/2016 7:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Channel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_WatchLater] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 4/11/2016 7:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[VideoId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favourite]    Script Date: 4/11/2016 7:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favourite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[VedioId] [int] NOT NULL,
 CONSTRAINT [PK_Favourite] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[History]    Script Date: 4/11/2016 7:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[VideoId] [int] NOT NULL,
	[WatchedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LookUp]    Script Date: 4/11/2016 7:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LookUp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EntityName] [nvarchar](150) NOT NULL,
	[Code] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_LookUp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 4/11/2016 7:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ChannelId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 4/11/2016 7:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_User_CreatedOn]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Video]    Script Date: 4/11/2016 7:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[UserId] [int] NOT NULL,
	[ChannelId] [int] NOT NULL,
	[Url] [nvarchar](500) NOT NULL,
	[Likes] [int] NULL,
	[Dislikes] [int] NULL,
	[CategoryId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WatchLater]    Script Date: 4/11/2016 7:36:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchLater](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[VideoId] [int] NOT NULL,
	[IsWatched] [bit] NOT NULL,
 CONSTRAINT [PK_WatchLater_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Video] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Video] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Video]
GO
ALTER TABLE [dbo].[Favourite]  WITH CHECK ADD  CONSTRAINT [FK_Favourite_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Favourite] CHECK CONSTRAINT [FK_Favourite_User]
GO
ALTER TABLE [dbo].[Favourite]  WITH CHECK ADD  CONSTRAINT [FK_Favourite_Video] FOREIGN KEY([VedioId])
REFERENCES [dbo].[Video] ([Id])
GO
ALTER TABLE [dbo].[Favourite] CHECK CONSTRAINT [FK_Favourite_Video]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_User]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Video] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Video] ([Id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Video]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_Channel] FOREIGN KEY([ChannelId])
REFERENCES [dbo].[Channel] ([Id])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_Channel]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_LookUp] FOREIGN KEY([RoleId])
REFERENCES [dbo].[LookUp] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_LookUp]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_Channel] FOREIGN KEY([ChannelId])
REFERENCES [dbo].[Channel] ([Id])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_Channel]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_LookUp] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[LookUp] ([Id])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_LookUp]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_User]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_Video] FOREIGN KEY([Id])
REFERENCES [dbo].[Video] ([Id])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_Video]
GO
ALTER TABLE [dbo].[WatchLater]  WITH CHECK ADD  CONSTRAINT [FK_WatchLater_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[WatchLater] CHECK CONSTRAINT [FK_WatchLater_User]
GO
ALTER TABLE [dbo].[WatchLater]  WITH CHECK ADD  CONSTRAINT [FK_WatchLater_Video] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Video] ([Id])
GO
ALTER TABLE [dbo].[WatchLater] CHECK CONSTRAINT [FK_WatchLater_Video]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
USE [master]
GO
ALTER DATABASE [MyTube] SET  READ_WRITE 
GO
