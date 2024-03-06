USE [master]
GO
/****** Object:  Database [crimedb]    Script Date: 03/06/2024 13:41:16 ******/
CREATE DATABASE [crimedb] ON  PRIMARY 
( NAME = N'crimedb', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\crimedb.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'crimedb_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\crimedb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [crimedb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [crimedb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [crimedb] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [crimedb] SET ANSI_NULLS OFF
GO
ALTER DATABASE [crimedb] SET ANSI_PADDING OFF
GO
ALTER DATABASE [crimedb] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [crimedb] SET ARITHABORT OFF
GO
ALTER DATABASE [crimedb] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [crimedb] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [crimedb] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [crimedb] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [crimedb] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [crimedb] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [crimedb] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [crimedb] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [crimedb] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [crimedb] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [crimedb] SET  DISABLE_BROKER
GO
ALTER DATABASE [crimedb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [crimedb] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [crimedb] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [crimedb] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [crimedb] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [crimedb] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [crimedb] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [crimedb] SET  READ_WRITE
GO
ALTER DATABASE [crimedb] SET RECOVERY SIMPLE
GO
ALTER DATABASE [crimedb] SET  MULTI_USER
GO
ALTER DATABASE [crimedb] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [crimedb] SET DB_CHAINING OFF
GO
USE [crimedb]
GO
/****** Object:  Table [dbo].[User_table]    Script Date: 03/06/2024 13:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_table](
	[User_id] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [varchar](50) NOT NULL,
	[Last_name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone_no] [numeric](18, 0) NOT NULL,
	[Dob] [date] NOT NULL,
	[Aadhar_number] [numeric](18, 0) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[House_name] [varchar](50) NOT NULL,
	[City_id] [int] NOT NULL,
	[Dist_id] [int] NOT NULL,
	[Pincode] [int] NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Confirm_password] [varchar](50) NOT NULL,
	[State_id] [int] NOT NULL,
 CONSTRAINT [PK_User_table] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teamassign_table]    Script Date: 03/06/2024 13:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teamassign_table](
	[Assign_id] [int] IDENTITY(1,1) NOT NULL,
	[Complaint_id] [int] NOT NULL,
	[Circle_area] [varchar](50) NOT NULL,
	[Team_head] [int] NOT NULL,
	[City_id] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Contact_number] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Teamassign_table] PRIMARY KEY CLUSTERED 
(
	[Assign_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Station_table]    Script Date: 03/06/2024 13:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Station_table](
	[Station_id] [int] IDENTITY(1,1) NOT NULL,
	[Station_name] [varchar](50) NOT NULL,
	[Station_email] [varchar](50) NOT NULL,
	[Location_id] [int] NOT NULL,
	[City_id] [int] NOT NULL,
	[Phone_number] [numeric](18, 0) NOT NULL,
	[Station_in_charge] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Station_table] PRIMARY KEY CLUSTERED 
(
	[Station_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State_table]    Script Date: 03/06/2024 13:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State_table](
	[State_id] [int] IDENTITY(1,1) NOT NULL,
	[State_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_State_table] PRIMARY KEY CLUSTERED 
(
	[State_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Policereg_table]    Script Date: 03/06/2024 13:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Policereg_table](
	[Police_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Contact_number] [numeric](18, 0) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Confirm_password] [varchar](50) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Policereg_table] PRIMARY KEY CLUSTERED 
(
	[Police_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Officer_table]    Script Date: 03/06/2024 13:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Officer_table](
	[Officer_id] [int] IDENTITY(1,1) NOT NULL,
	[Rank] [varchar](50) NOT NULL,
	[Assign_id] [int] NOT NULL,
	[Circle_id] [int] NOT NULL,
	[Station_id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Mobile_number] [numeric](18, 0) NOT NULL,
	[Email_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Officer_table] PRIMARY KEY CLUSTERED 
(
	[Officer_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Location_table]    Script Date: 03/06/2024 13:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location_table](
	[Location_id] [int] IDENTITY(1,1) NOT NULL,
	[Location_name] [varchar](50) NOT NULL,
	[City_id] [int] NOT NULL,
	[Dist_id] [int] NOT NULL,
	[Pincode] [int] NOT NULL,
	[State_id] [int] NOT NULL,
 CONSTRAINT [PK_Location_table] PRIMARY KEY CLUSTERED 
(
	[Location_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Investigation_table]    Script Date: 03/06/2024 13:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Investigation_table](
	[Update_id] [int] IDENTITY(1,1) NOT NULL,
	[Complaint_id] [int] NOT NULL,
	[Officer_id] [int] NOT NULL,
	[Circle_area] [varchar](50) NOT NULL,
	[Station_name] [varchar](50) NOT NULL,
	[Officer_in_charge] [varchar](50) NOT NULL,
	[Victim_name] [varchar](50) NOT NULL,
	[Details] [varchar](50) NOT NULL,
	[Evidence] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Investigation_table] PRIMARY KEY CLUSTERED 
(
	[Update_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FIR_table]    Script Date: 03/06/2024 13:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FIR_table](
	[FIR_id] [int] IDENTITY(1,1) NOT NULL,
	[Complaint_id] [int] NOT NULL,
	[Officer_id] [int] NOT NULL,
	[Dist_id] [int] NOT NULL,
	[Station_id] [int] NOT NULL,
	[Fir_report] [varchar](50) NOT NULL,
	[Fir_date] [date] NOT NULL,
	[Place_of_occurrence] [varchar](50) NOT NULL,
	[Ipc_code_section] [varchar](50) NOT NULL,
	[Crime_subject] [varchar](50) NOT NULL,
	[Mode_of_operation] [varchar](50) NOT NULL,
	[Evidence] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FIR_table] PRIMARY KEY CLUSTERED 
(
	[FIR_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[District_table]    Script Date: 03/06/2024 13:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[District_table](
	[Dist_id] [int] IDENTITY(1,1) NOT NULL,
	[State_id] [int] NOT NULL,
	[Dist_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_District_table] PRIMARY KEY CLUSTERED 
(
	[Dist_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Court_table]    Script Date: 03/06/2024 13:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Court_table](
	[Court_id] [int] IDENTITY(1,1) NOT NULL,
	[Complaint_id] [int] NOT NULL,
	[Court_name] [varchar](50) NOT NULL,
	[Victim_name] [varchar](50) NOT NULL,
	[Ipc_code_section] [varchar](50) NOT NULL,
	[Mode_of_operation] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[Verdict] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Court_table] PRIMARY KEY CLUSTERED 
(
	[Court_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Complaint_table]    Script Date: 03/06/2024 13:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Complaint_table](
	[Complaint_id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NOT NULL,
	[Location_id] [int] NOT NULL,
	[Full_name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone_number] [numeric](18, 0) NOT NULL,
	[Subject] [varchar](50) NOT NULL,
	[Place_of_occurrence] [varchar](50) NOT NULL,
	[Date_of_occurrence] [date] NOT NULL,
	[Police_station] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Complaint_id] PRIMARY KEY CLUSTERED 
(
	[Complaint_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City_table]    Script Date: 03/06/2024 13:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City_table](
	[City_id] [int] IDENTITY(1,1) NOT NULL,
	[State_id] [int] NOT NULL,
	[Dist_id] [int] NOT NULL,
	[City_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_City_table] PRIMARY KEY CLUSTERED 
(
	[City_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Circle_table]    Script Date: 03/06/2024 13:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Circle_table](
	[Circle_id] [int] IDENTITY(1,1) NOT NULL,
	[Circle_area] [varchar](50) NOT NULL,
	[Circle_head] [varchar](50) NOT NULL,
	[City_id] [int] NOT NULL,
	[Dist_id] [int] NOT NULL,
	[Pincode] [int] NOT NULL,
	[Phone_no] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Department_table] PRIMARY KEY CLUSTERED 
(
	[Circle_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Arrest_table]    Script Date: 03/06/2024 13:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Arrest_table](
	[Arrest_id] [int] IDENTITY(1,1) NOT NULL,
	[Complaint_id] [int] NOT NULL,
	[Officer_id] [int] NOT NULL,
	[Victim_name] [varchar](50) NOT NULL,
	[Mode_of_operation] [varchar](50) NOT NULL,
	[Ipc_code_section] [varchar](50) NOT NULL,
	[Place_of_arrest] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Arrest_table] PRIMARY KEY CLUSTERED 
(
	[Arrest_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
