USE [master]
GO
/****** Object:  Database [InstagramKiller]    Script Date: 10.10.2016 16:15:27 ******/
CREATE DATABASE [InstagramKiller]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InstagramKiller', FILENAME = N'D:\Microsoft SQL Server\MSSQL12.SQLSERVER14\MSSQL\DATA\InstagramKiller.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'InstagramKiller_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL12.SQLSERVER14\MSSQL\DATA\InstagramKiller_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [InstagramKiller] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InstagramKiller].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InstagramKiller] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InstagramKiller] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InstagramKiller] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InstagramKiller] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InstagramKiller] SET ARITHABORT OFF 
GO
ALTER DATABASE [InstagramKiller] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InstagramKiller] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InstagramKiller] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InstagramKiller] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InstagramKiller] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InstagramKiller] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InstagramKiller] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InstagramKiller] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InstagramKiller] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InstagramKiller] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InstagramKiller] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InstagramKiller] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InstagramKiller] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InstagramKiller] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InstagramKiller] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InstagramKiller] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InstagramKiller] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InstagramKiller] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InstagramKiller] SET  MULTI_USER 
GO
ALTER DATABASE [InstagramKiller] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InstagramKiller] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InstagramKiller] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InstagramKiller] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [InstagramKiller] SET DELAYED_DURABILITY = DISABLED 
GO
USE [InstagramKiller]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 10.10.2016 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] NOT NULL,
	[user id] [int] NOT NULL,
	[img id] [int] NOT NULL,
 CONSTRAINT [PK_comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hashtags]    Script Date: 10.10.2016 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hashtags](
	[id] [int] NOT NULL,
	[text] [varchar](100) NOT NULL,
 CONSTRAINT [PK_hashtags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hashtgs_images]    Script Date: 10.10.2016 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hashtgs_images](
	[hastag id] [int] NOT NULL,
	[img id] [int] NOT NULL,
 CONSTRAINT [PK_hashtgs_images] PRIMARY KEY CLUSTERED 
(
	[hastag id] ASC,
	[img id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[images]    Script Date: 10.10.2016 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[id] [int] NOT NULL,
	[user id] [int] NOT NULL,
	[url] [varchar](100) NOT NULL,
	[time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mentions]    Script Date: 10.10.2016 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mentions](
	[id] [int] NOT NULL,
	[user id] [int] NOT NULL,
	[comment id] [int] NOT NULL,
 CONSTRAINT [PK_mentions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 10.10.2016 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] NOT NULL,
	[nickname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_images] FOREIGN KEY([img id])
REFERENCES [dbo].[images] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_images]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_users] FOREIGN KEY([user id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_users]
GO
ALTER TABLE [dbo].[hashtgs_images]  WITH CHECK ADD  CONSTRAINT [FK_hashtgs_images_hashtags] FOREIGN KEY([hastag id])
REFERENCES [dbo].[hashtags] ([id])
GO
ALTER TABLE [dbo].[hashtgs_images] CHECK CONSTRAINT [FK_hashtgs_images_hashtags]
GO
ALTER TABLE [dbo].[hashtgs_images]  WITH CHECK ADD  CONSTRAINT [FK_hashtgs_images_images] FOREIGN KEY([img id])
REFERENCES [dbo].[images] ([id])
GO
ALTER TABLE [dbo].[hashtgs_images] CHECK CONSTRAINT [FK_hashtgs_images_images]
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD  CONSTRAINT [FK_images_users] FOREIGN KEY([user id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[images] CHECK CONSTRAINT [FK_images_users]
GO
ALTER TABLE [dbo].[mentions]  WITH CHECK ADD  CONSTRAINT [FK_mentions_comments] FOREIGN KEY([comment id])
REFERENCES [dbo].[comments] ([id])
GO
ALTER TABLE [dbo].[mentions] CHECK CONSTRAINT [FK_mentions_comments]
GO
ALTER TABLE [dbo].[mentions]  WITH CHECK ADD  CONSTRAINT [FK_mentions_users] FOREIGN KEY([user id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[mentions] CHECK CONSTRAINT [FK_mentions_users]
GO
USE [master]
GO
ALTER DATABASE [InstagramKiller] SET  READ_WRITE 
GO
