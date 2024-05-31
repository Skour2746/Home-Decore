USE [master]
GO
/****** Object:  Database [Home_Decore]    Script Date: 07-05-2024 14:32:49 ******/
CREATE DATABASE [Home_Decore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Home_Decore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Home_Decore.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Home_Decore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Home_Decore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Home_Decore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Home_Decore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Home_Decore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Home_Decore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Home_Decore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Home_Decore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Home_Decore] SET ARITHABORT OFF 
GO
ALTER DATABASE [Home_Decore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Home_Decore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Home_Decore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Home_Decore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Home_Decore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Home_Decore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Home_Decore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Home_Decore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Home_Decore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Home_Decore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Home_Decore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Home_Decore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Home_Decore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Home_Decore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Home_Decore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Home_Decore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Home_Decore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Home_Decore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Home_Decore] SET  MULTI_USER 
GO
ALTER DATABASE [Home_Decore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Home_Decore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Home_Decore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Home_Decore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Home_Decore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Home_Decore]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 07-05-2024 14:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_id] [varchar](255) NOT NULL,
	[Product_id] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[status] [varchar](255) NOT NULL,
	[rts] [datetime] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 07-05-2024 14:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [varchar](255) NOT NULL,
	[image] [varchar](255) NULL,
	[status] [varchar](255) NULL,
	[rts] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[comment]    Script Date: 07-05-2024 14:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[P_id] [varchar](255) NULL,
	[rating] [int] NULL,
	[comment] [varchar](255) NULL,
	[image] [varchar](255) NULL,
	[c_name] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[status] [varchar](255) NULL,
	[rts] [varchar](255) NULL,
 CONSTRAINT [PK__comment__3213E83FCE2638C3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login]    Script Date: 07-05-2024 14:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mini_Category]    Script Date: 07-05-2024 14:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mini_Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cid] [varchar](255) NULL,
	[Subcategory_id] [varchar](255) NULL,
	[minicategory] [varchar](255) NULL,
	[image] [varchar](255) NULL,
	[status] [varchar](255) NULL,
	[rts] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mini_Category_detail]    Script Date: 07-05-2024 14:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mini_Category_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cid] [varchar](255) NOT NULL,
	[Subid] [varchar](255) NULL,
	[MiniCid] [varchar](255) NULL,
	[image] [varchar](255) NULL,
	[image1] [varchar](255) NULL,
	[image2] [varchar](255) NULL,
	[image4] [varchar](255) NULL,
	[Heading] [varchar](255) NULL,
	[Para] [nvarchar](max) NULL,
	[Rate] [varchar](255) NULL,
	[status] [varchar](255) NULL,
	[rts] [datetime] NULL,
 CONSTRAINT [PK__Mini_Cat__3213E83FA4603985] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order_tbl]    Script Date: 07-05-2024 14:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_id] [varchar](255) NOT NULL,
	[Product_id] [varchar](255) NOT NULL,
	[Quantity] [varchar](255) NOT NULL,
	[Order_date] [varchar](255) NOT NULL,
	[Shipping_id] [varchar](255) NOT NULL,
	[status] [varchar](255) NOT NULL,
	[rts] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shipping_tbl]    Script Date: 07-05-2024 14:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shipping_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_id] [varchar](255) NULL,
	[Order_id] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[Contact] [varchar](255) NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[State] [varchar](255) NOT NULL,
	[City] [varchar](255) NOT NULL,
	[PinCode] [varchar](255) NOT NULL,
	[Order_note] [varchar](255) NOT NULL,
	[status] [varchar](255) NOT NULL,
	[rts] [datetime] NOT NULL,
 CONSTRAINT [PK__Shipping__3213E83FCA89D0FC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sub_Category]    Script Date: 07-05-2024 14:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sub_Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cid] [varchar](255) NOT NULL,
	[SubCategory] [varchar](255) NULL,
	[image] [varchar](255) NULL,
	[status] [varchar](255) NULL,
	[rts] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrnOrderDetail]    Script Date: 07-05-2024 14:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrnOrderDetail](
	[AID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [numeric](18, 0) NOT NULL,
	[Amount] [numeric](18, 0) NOT NULL,
	[DeliveryFees] [numeric](18, 0) NOT NULL,
	[NetAmount] [numeric](18, 0) NOT NULL,
	[Cancelled] [bit] NOT NULL CONSTRAINT [DF_TrnOrderDCance_009508B4]  DEFAULT ((0)),
	[Delivered] [bit] NOT NULL CONSTRAINT [DF_TrnOrderDDeliv_01892CED]  DEFAULT ((0)),
	[Returned] [bit] NOT NULL CONSTRAINT [DF_TrnOrderDRetur_027D5126]  DEFAULT ((0)),
	[Dispatched] [bit] NOT NULL CONSTRAINT [DF_TrnOrderDetail_Dispatched]  DEFAULT ((0)),
	[RTS] [datetime] NOT NULL CONSTRAINT [DF_TrnOrderDetRTS_0371755F]  DEFAULT (getdate()),
	[DeliveryDate] [datetime] NOT NULL CONSTRAINT [DF_TrnOrderDDeliv_697C9932]  DEFAULT (getdate()),
	[DeliveryCharges] [numeric](18, 0) NOT NULL CONSTRAINT [DF_TrnOrderDDeliv_024846FC]  DEFAULT ((0)),
	[remark] [nvarchar](max) NULL,
 CONSTRAINT [PK_TrnOrderDetail] PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrnOrderMain]    Script Date: 07-05-2024 14:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnOrderMain](
	[AID] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[Usercode] [varchar](255) NOT NULL,
	[OrderAmount] [numeric](18, 0) NOT NULL,
	[PaidAmount] [numeric](18, 0) NOT NULL CONSTRAINT [DF_TrnOrderMain_PaidAmount]  DEFAULT ((0)),
	[TotalQuantity] [numeric](18, 0) NOT NULL,
	[DeliveryFees] [numeric](18, 0) NOT NULL,
	[Amount] [numeric](18, 0) NOT NULL,
	[Paymode] [varchar](50) NOT NULL,
	[TrnId] [nvarchar](max) NOT NULL CONSTRAINT [DF_TrnOrderMTrnId_78F3E6EC]  DEFAULT (''),
	[TrnStatus] [varchar](100) NOT NULL CONSTRAINT [DF_TrnOrderMTrnSt_79E80B25]  DEFAULT (''),
	[OrderThrough] [varchar](50) NOT NULL,
	[ShippingName] [varchar](100) NOT NULL,
	[ShippingAddress] [varchar](max) NOT NULL,
	[ShippingMobileNo] [varchar](12) NOT NULL,
	[ShippingEmailId] [varchar](max) NOT NULL,
	[ShippingCity] [varchar](100) NOT NULL,
	[ShippingZipcode] [varchar](10) NOT NULL,
	[ShippingState] [varchar](50) NOT NULL,
	[Delivered] [bit] NOT NULL CONSTRAINT [DF_TrnOrderMDeliv_7ADC2F5E]  DEFAULT ((0)),
	[Cancelled] [bit] NOT NULL CONSTRAINT [DF_TrnOrderMain_Cancelled]  DEFAULT ((0)),
	[Returned] [bit] NOT NULL CONSTRAINT [DF_TrnOrderMain_Returned]  DEFAULT ((0)),
	[Dispatched] [bit] NOT NULL CONSTRAINT [DF_TrnOrderMain_Dispatched]  DEFAULT ((0)),
	[Settlement] [bit] NOT NULL CONSTRAINT [DF_TrnOrderMain_Settlement]  DEFAULT ((0)),
	[RTS] [datetime] NOT NULL CONSTRAINT [DF_TrnOrderMaiRTS_7BD05397]  DEFAULT (getdate()),
	[remark] [nvarchar](max) NULL,
	[sid] [int] NULL,
 CONSTRAINT [PK_TrnOrder_C3905BCF53FA2DFA] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Registration]    Script Date: 07-05-2024 14:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Registration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](255) NULL,
	[user_email] [varchar](255) NULL,
	[user_contact] [varchar](255) NULL,
	[user_pass] [varchar](255) NULL,
	[status] [varchar](50) NULL,
	[rts] [datetime] NULL,
 CONSTRAINT [PK_User_Registration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([id], [Customer_id], [Product_id], [Quantity], [status], [rts]) VALUES (6, N'123@gmail.com', 2, 1, N'1', CAST(N'2024-01-19 11:45:37.647' AS DateTime))
INSERT [dbo].[Cart] ([id], [Customer_id], [Product_id], [Quantity], [status], [rts]) VALUES (7, N'123@gmail.com', 2, 12, N'1', CAST(N'2024-01-19 11:45:50.120' AS DateTime))
INSERT [dbo].[Cart] ([id], [Customer_id], [Product_id], [Quantity], [status], [rts]) VALUES (1006, N'123@gmail.com', 2, 1, N'1', CAST(N'2024-02-07 14:22:50.030' AS DateTime))
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [category], [image], [status], [rts]) VALUES (1, N'Home', N'home.jpg', N'0', N'Mar 18 2023  5:40PM')
INSERT [dbo].[Category] ([id], [category], [image], [status], [rts]) VALUES (2, N'Construction', N'construction-silhouette.jpg', N'1', N'Mar 18 2023  5:42PM')
INSERT [dbo].[Category] ([id], [category], [image], [status], [rts]) VALUES (3, N'Furniture', N'gray-sofa-white-living-room-with-copy-space.jpg', N'1', N'Mar 18 2023  5:44PM')
INSERT [dbo].[Category] ([id], [category], [image], [status], [rts]) VALUES (4, N'Electronics & Home Appliances', N'5355998c60f2645de919743c36195d2e.jpg', N'1', N'Mar 18 2023  5:44PM')
INSERT [dbo].[Category] ([id], [category], [image], [status], [rts]) VALUES (5, N'Decore', N'42d118f5bd6809929b9d0d2b482e2bef.jpg', N'1', N'Mar 18 2023  5:45PM')
INSERT [dbo].[Category] ([id], [category], [image], [status], [rts]) VALUES (6, N'Vastu Tips', N'vastu.jpg', N'0', N'Mar 18 2023  5:47PM')
INSERT [dbo].[Category] ([id], [category], [image], [status], [rts]) VALUES (7, N'Pepple', N'pepple.jpg', N'0', N'Mar 20 2023  3:39PM')
INSERT [dbo].[Category] ([id], [category], [image], [status], [rts]) VALUES (8, N'Gardening', N'still-life-various-plant-soil.jpg', N'1', N'May  9 2023 12:35PM')
INSERT [dbo].[Category] ([id], [category], [image], [status], [rts]) VALUES (9, N'Other', N'f7c305c4195a781ed47a37b80836c45e.jpg', N'1', N'May 24 2023  3:29PM')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([id], [P_id], [rating], [comment], [image], [c_name], [email], [status], [rts]) VALUES (1, N'1', 5, N'I had an amazing experience with this company! The customer service was top-notch, and the product exceeded my expectations. I highly recommend them to anyone looking for quality products and excellent service.', N'1_1.jpg', N'Jaspreet Singh', N'jassa@gmail.com', N'1', N'Jan 27 2024  2:06PM')
INSERT [dbo].[comment] ([id], [P_id], [rating], [comment], [image], [c_name], [email], [status], [rts]) VALUES (2, N'3', 5, N'I am a repeat customer of this business, and they never disappoint. The team is always friendly and helpful, and their products are outstanding. I’ve recommended them to all my friends and family, and I will continue to do so!', N'2_1.jpg', N'Harpreet Singh', N'harpreet@gmail.com', N'1', N'Jan 31 2024 12:47PM')
INSERT [dbo].[comment] ([id], [P_id], [rating], [comment], [image], [c_name], [email], [status], [rts]) VALUES (3, N'3', 5, N'I am a repeat customer of this business, and they never disappoint. The team is always friendly and helpful, and their products are outstanding. I’ve recommended them to all my friends and family, and I will continue to do so!', N'2_1.jpg', N'Harpreet Singh', N'harpreet@gmail.com', N'0', N'Jan 31 2024 12:47PM')
SET IDENTITY_INSERT [dbo].[comment] OFF
SET IDENTITY_INSERT [dbo].[login] ON 

INSERT [dbo].[login] ([id], [username], [password]) VALUES (1, N'Simran', N'Skour')
SET IDENTITY_INSERT [dbo].[login] OFF
SET IDENTITY_INSERT [dbo].[Mini_Category] ON 

INSERT [dbo].[Mini_Category] ([id], [cid], [Subcategory_id], [minicategory], [image], [status], [rts]) VALUES (1, N'2', N'1', N'Mild Steel (MS) Rods', N'1.jpg', N'1', CAST(N'2024-01-15 22:23:46.770' AS DateTime))
INSERT [dbo].[Mini_Category] ([id], [cid], [Subcategory_id], [minicategory], [image], [status], [rts]) VALUES (2, N'2', N'1', N'High Strength Deformed (HSD) Steel Bars', N'2.jpg', N'1', CAST(N'2024-01-15 22:24:08.510' AS DateTime))
INSERT [dbo].[Mini_Category] ([id], [cid], [Subcategory_id], [minicategory], [image], [status], [rts]) VALUES (3, N'2', N'2', N'Common Burnt Clay Bricks', N'3.jpg', N'1', CAST(N'2024-01-15 22:30:11.983' AS DateTime))
INSERT [dbo].[Mini_Category] ([id], [cid], [Subcategory_id], [minicategory], [image], [status], [rts]) VALUES (4, N'2', N'4', N'Ordinary Portland Cement (OPC)', N'4.jpg', N'1', CAST(N'2024-01-15 22:33:43.967' AS DateTime))
INSERT [dbo].[Mini_Category] ([id], [cid], [Subcategory_id], [minicategory], [image], [status], [rts]) VALUES (5, N'3', N'9', N'Sectional Sofa', N'5.jpg', N'1', CAST(N'2024-01-15 22:35:59.750' AS DateTime))
INSERT [dbo].[Mini_Category] ([id], [cid], [Subcategory_id], [minicategory], [image], [status], [rts]) VALUES (6, N'3', N'10', N'Bunk Beds', N'6.jpg', N'1', CAST(N'2024-01-15 22:37:09.197' AS DateTime))
INSERT [dbo].[Mini_Category] ([id], [cid], [Subcategory_id], [minicategory], [image], [status], [rts]) VALUES (7, N'3', N'11', N'Free-Standing Almirahs', N'7.jpg', N'1', CAST(N'2024-01-15 22:38:12.207' AS DateTime))
INSERT [dbo].[Mini_Category] ([id], [cid], [Subcategory_id], [minicategory], [image], [status], [rts]) VALUES (8, N'3', N'12', N'Folding Dining Tables', N'8.jpg', N'1', CAST(N'2024-01-15 22:40:49.280' AS DateTime))
INSERT [dbo].[Mini_Category] ([id], [cid], [Subcategory_id], [minicategory], [image], [status], [rts]) VALUES (9, N'3', N'13', N'Solid Pelmet', N'9.jpg', N'1', CAST(N'2024-01-15 22:42:40.610' AS DateTime))
INSERT [dbo].[Mini_Category] ([id], [cid], [Subcategory_id], [minicategory], [image], [status], [rts]) VALUES (10, N'3', N'14', N'Wood Panels', N'10.jpg', N'1', CAST(N'2024-01-15 22:44:19.970' AS DateTime))
INSERT [dbo].[Mini_Category] ([id], [cid], [Subcategory_id], [minicategory], [image], [status], [rts]) VALUES (11, N'3', N'15', N'Living Room Chairs', N'11.jpg', N'1', CAST(N'2024-01-15 22:51:00.980' AS DateTime))
INSERT [dbo].[Mini_Category] ([id], [cid], [Subcategory_id], [minicategory], [image], [status], [rts]) VALUES (12, N'2', N'1', N'TMT Bars ', N'12.jpg', N'1', CAST(N'2024-01-19 15:03:03.720' AS DateTime))
INSERT [dbo].[Mini_Category] ([id], [cid], [Subcategory_id], [minicategory], [image], [status], [rts]) VALUES (1012, N'2', N'1', N'Deformed Steel Bars', N'13.jpg', N'1', CAST(N'2024-01-30 15:34:39.990' AS DateTime))
INSERT [dbo].[Mini_Category] ([id], [cid], [Subcategory_id], [minicategory], [image], [status], [rts]) VALUES (1013, N'2', N'2', N'Engineered Bricks', N'1013.jpg', N'1', CAST(N'2024-01-31 11:33:44.623' AS DateTime))
SET IDENTITY_INSERT [dbo].[Mini_Category] OFF
SET IDENTITY_INSERT [dbo].[Mini_Category_detail] ON 

INSERT [dbo].[Mini_Category_detail] ([id], [cid], [Subid], [MiniCid], [image], [image1], [image2], [image4], [Heading], [Para], [Rate], [status], [rts]) VALUES (1, N'2', N'1', N'1', N'31KRI9Nn2AL.jpg', N'41g5ZIMzgoL.jpg', N'51GOUurGtUL.SL1000.jpg', N'31NansYq3PL.jpg', N'INVENTO 2pcs EN31 Rustproof Steel Smooth Rod 6mm OD 400mm (0.4 mtr) Long for CNC Robotics Machines DIY Projects', N'<p>Outside Diameter: 6mm Length: 400 mm (0.4 meter) Material: EN-31 (Hard Chromed) Application: 3D Printer, CNC, Robotics, DIY Projects etc</p>
', N' 399 ', N'1', CAST(N'2024-01-15 23:21:01.000' AS DateTime))
INSERT [dbo].[Mini_Category_detail] ([id], [cid], [Subid], [MiniCid], [image], [image1], [image2], [image4], [Heading], [Para], [Rate], [status], [rts]) VALUES (2, N'3', N'9', N'5', N'71bymls8pSL.SL1500.jpg', N'81AeJUkJszL.SL1500.jpg', N'81cR0B4MZZL.SL1500.jpg', N'71tO8kaoJoL.SL1500.jpg', N'Home Centre Emily 5 Seater Fabric Sectional Sofa Set (Brown)', N'<p>Brand Home Centre Assembly Required Yes Item Weight 46000 Grams Type Sectional Colour Brown Special Feature 3+2 Upholstery Fabric Type Polyester Room Type Living Room Arm Style Square Pattern Sofa Set</p>
', N'5000', N'1', CAST(N'2024-01-16 11:41:55.000' AS DateTime))
INSERT [dbo].[Mini_Category_detail] ([id], [cid], [Subid], [MiniCid], [image], [image1], [image2], [image4], [Heading], [Para], [Rate], [status], [rts]) VALUES (3, N'2', N'1', N'12', N'61qgXgxYilL.jpg', N'516XMJdMzAL (1).jpg', N'61rvkkcgx2L.SL1200.jpg', N'516XMJdMzAL.jpg', N'Concrete TMT Reinforcement Rebars Cut to Precise Length in Variable Sizes (12, 8mm x 12in.)', N'<p>Consistency of physical properties across the rebar length. Better ductility I Lower impurities.&nbsp;Easy to work with (during fabrication).&nbsp;Qty:12pcs I Rebar Thickness:8mm I Length:12inches (304.8MM).&nbsp;Theoritical Net Weight: 1.4457 Kilo</p>

<hr />', N'2000', N'1', CAST(N'2024-01-19 15:05:10.000' AS DateTime))
INSERT [dbo].[Mini_Category_detail] ([id], [cid], [Subid], [MiniCid], [image], [image1], [image2], [image4], [Heading], [Para], [Rate], [status], [rts]) VALUES (4, N'2', N'1', N'1012', N'31YfEqFvsmL.jpg', N'41onCTyJUrL.jpg', N'310iI5a6VL.jpg', N'41TllgNqNDL.jpg', N'U Ulitmate Steel Triceps V Bar with Heavy Duty Steel Rod Used (Multicolor)', N'<p>Fitness accessories and health equipments. Tricep Pressdown Bar.&nbsp;In-Box Contents: 1 Triceps Pressdown Bar. Fully Solid Triceps Pressdown Bar</p>
', N'849', N'1', CAST(N'2024-01-30 15:36:42.000' AS DateTime))
INSERT [dbo].[Mini_Category_detail] ([id], [cid], [Subid], [MiniCid], [image], [image1], [image2], [image4], [Heading], [Para], [Rate], [status], [rts]) VALUES (5, N'2', N'1', N'1', N'31axAV5dP7S.SL1500.jpg', N'31dtB3MDrpS.jpg', N'31G1QHNOffS.jpg', N'31axAV5dP7S.SL1500.jpg', N'Elapp Galvanized Iron (GI) Earthing Rod (Pack of 2)', N'<p>Length Of Rod------1m. Usage/Application-------Earthing. Material-----Galvanized Iron (GI). Country of Origin-------Made in India. Finishing-------Hot Dip Galvanized</p>
', N'514', N'1', CAST(N'2024-01-30 17:39:09.000' AS DateTime))
INSERT [dbo].[Mini_Category_detail] ([id], [cid], [Subid], [MiniCid], [image], [image1], [image2], [image4], [Heading], [Para], [Rate], [status], [rts]) VALUES (6, N'2', N'2', N'1013', N'61Tk2fz026LSL1500.jpg', N'71hTJ031gLSL1500.jpg', N'21XWOmCXN5L.jpg', N'31tozQTolSL.jpg', N' Click to open expanded view     Little Birdie Build A Home MDF Bricks W8 X H16 X D 5.5 mm 500Pc', N'<p>Build a realistic model home easily and quickly with miniature building materials from our &#39;Build a Home&#39; range MDF bricks are lightweight yet realistic. Use &#39;ready to use&#39; cement from our range to arrange and fix the bricks in your model house. This pack contains 500 pieces of bricks.Use with miniature bricks, doors, windows, tiles, gate, miniature tools and more from the &#39;Build a Home&#39; collection to give your model home a superior finish. Perfect for model home, architectural 3D floor plan, mini villa, doll house, etc.</p>
', N'189', N'1', CAST(N'2024-01-31 11:35:12.000' AS DateTime))
INSERT [dbo].[Mini_Category_detail] ([id], [cid], [Subid], [MiniCid], [image], [image1], [image2], [image4], [Heading], [Para], [Rate], [status], [rts]) VALUES (7, N'2', N'4', N'4', N'41k6E1hp5AL.jpg', N'61GDvmDVLBLSL1500.jpg', N'71GxsIgy4bLSL1500.jpg', N'71fKPTzmSLSL1500.jpg', N'UR LITTLE SHOP 3Kg Loose Grade A White Portland Cement For Home Filling The Cracks Tile Gaps Multi Purposes ULSCP8', N'<p>In the Pack : 3 Kg White Cement. Color : WHITE. Ideal for Indoor and Outdoor use. Useful multi purposes. Can be used for Home, wall, Minor Construction Repairs and Filling the Cracks, Tile Gaps</p>
', N'299', N'1', CAST(N'2024-01-31 12:02:36.000' AS DateTime))
INSERT [dbo].[Mini_Category_detail] ([id], [cid], [Subid], [MiniCid], [image], [image1], [image2], [image4], [Heading], [Para], [Rate], [status], [rts]) VALUES (8, N'3', N'9', N'5', N'1.jpg', N'2.jpg', N'3.jpg', N'4.jpg', N'INLENDISH Magnum L-Shape 6 Seater Fabric Sectional Sofa Set | Comfortable Living Room | Luxurious Sofa (LHS) - Blue', N'<p>This product comes in two pieces that is the two seater and the lounger, the dimension are as follow :- Overall length - 86 inches / lounger length - 62 inches, Width - 34 inches , height - 34 inches/ puffy lenght - 48 inches, height 17 inches. The product consist of a layer of memory foam which adds extra softness and also give the sofa cubical finish.</p>
', N'58750', N'1', CAST(N'2024-01-31 12:44:39.823' AS DateTime))
INSERT [dbo].[Mini_Category_detail] ([id], [cid], [Subid], [MiniCid], [image], [image1], [image2], [image4], [Heading], [Para], [Rate], [status], [rts]) VALUES (9, N'3', N'9', N'5', N'6.jpg', N'7.jpg', N'8.jpg', N'9.jpg', N' Solimo Venosa Fabric 6 Seater RHS L Shape Sofa (Blue)', N'<p>Meets Indian Standards IS 12674/ IS 5416 and European Safety Requirement Standard EN 12520 for performance and safety;Safe for family use; free from toxins and harmful chemicals like Azo dye and formaldehyde; Lightweight with good ground clearance for easy shifting and tidying up;3-year limited warranty against manufacturing defects</p>
', N'34909', N'1', CAST(N'2024-01-31 12:48:22.910' AS DateTime))
INSERT [dbo].[Mini_Category_detail] ([id], [cid], [Subid], [MiniCid], [image], [image1], [image2], [image4], [Heading], [Para], [Rate], [status], [rts]) VALUES (10, N'3', N'9', N'5', N'13.jpg', N'12.jpg', N'11.jpg', N'10.jpg', N'Solimo Alen Fabric 6 Seater LHS L Shape Sofa (Grey & Black)', N'<p>Meets Indian Standards IS 12674/ IS 5416 and European Safety Requirement Standard EN 12520 for performance and safety;Safe for family use; free from toxins and harmful chemicals like Azo dye and formaldehyde; Lightweight with good ground clearance for easy shifting and tidying up;3-year limited warranty against manufacturing defects</p>
', N'29999', N'1', CAST(N'2024-01-31 12:52:58.973' AS DateTime))
INSERT [dbo].[Mini_Category_detail] ([id], [cid], [Subid], [MiniCid], [image], [image1], [image2], [image4], [Heading], [Para], [Rate], [status], [rts]) VALUES (11, N'3', N'9', N'5', N'17.jpg', N'16.jpg', N'15.jpg', N'14.jpg', N'Trevi Sectional Sofa | Balinese Fabric Sofa | 5 Seater RHS (Right Hand Side) | Sofa in Mystic Black', N'<p>Balinese Sofa 5 Seater .Color - Mystic Black .Facing Reft Hand Side .1-Year Limited Brand Warranty for Manufacturing Defects only. Gold category foam for superior comfort</p>
', N'23,699', N'1', CAST(N'2024-01-31 13:00:44.417' AS DateTime))
INSERT [dbo].[Mini_Category_detail] ([id], [cid], [Subid], [MiniCid], [image], [image1], [image2], [image4], [Heading], [Para], [Rate], [status], [rts]) VALUES (12, N'3', N'9', N'5', N'21.jpg', N'20.jpg', N'19.jpg', N'18.jpg', N'Adorn India Aliana L Shape Leatherette Fabric Sectional 6 Seater Sofa (Light Grey and White)', N'<p>Product dimension in cm Package 1 = Length (175) Breadth (82.8)height (68.58) sitting height (40.64) Package 2 = Length (182.8) Breadth (82.8)height (68.58) sitting height (40.64)</p>
', N'31999', N'1', CAST(N'2024-01-31 13:04:27.873' AS DateTime))
INSERT [dbo].[Mini_Category_detail] ([id], [cid], [Subid], [MiniCid], [image], [image1], [image2], [image4], [Heading], [Para], [Rate], [status], [rts]) VALUES (13, N'3', N'9', N'5', N'25.jpg', N'24.jpg', N'23.jpg', N'22.jpg', N'Balinese Fabric Sofa | 5 Seater RHS (Right Hand Side) | Sofa in Mystic Black', N'<p>Product dimension in cm Package 1 = Length (175) Breadth (82.8)height (68.58) sitting height (40.64) Package 2 = Length (182.8) Breadth (82.8)height (68.58) sitting height (40.64)</p>
', N'23999', N'1', CAST(N'2024-01-31 13:13:07.413' AS DateTime))
SET IDENTITY_INSERT [dbo].[Mini_Category_detail] OFF
SET IDENTITY_INSERT [dbo].[Shipping_tbl] ON 

INSERT [dbo].[Shipping_tbl] ([id], [Customer_id], [Order_id], [Name], [Email], [Contact], [Address], [State], [City], [PinCode], [Order_note], [status], [rts]) VALUES (1, N'123@gmail.com', N'6', N'kudsfyiu', N'Skour@gmail.com', N'4567895678', N'jShbdus', N'Rajasthan', N'bhilwara', N'31100', N'ddfd', N'1', CAST(N'2024-01-23 12:21:14.660' AS DateTime))
INSERT [dbo].[Shipping_tbl] ([id], [Customer_id], [Order_id], [Name], [Email], [Contact], [Address], [State], [City], [PinCode], [Order_note], [status], [rts]) VALUES (2, N'123@gmail.com', N'7', N'', N'', N'', N'', N'', N'', N'', N'', N'1', CAST(N'2024-01-23 12:21:14.660' AS DateTime))
INSERT [dbo].[Shipping_tbl] ([id], [Customer_id], [Order_id], [Name], [Email], [Contact], [Address], [State], [City], [PinCode], [Order_note], [status], [rts]) VALUES (3, N'123@gmail.com', N'6', N'kudsfyiu', N'Skour@gmail.com', N'7687687687', N'hgdah', N'Rajasthan', N'bhilwara', N'31100', N'kjgfejshohjk', N'1', CAST(N'2024-01-23 14:21:30.880' AS DateTime))
INSERT [dbo].[Shipping_tbl] ([id], [Customer_id], [Order_id], [Name], [Email], [Contact], [Address], [State], [City], [PinCode], [Order_note], [status], [rts]) VALUES (4, N'123@gmail.com', N'7', N'', N'', N'', N'', N'', N'', N'', N'', N'1', CAST(N'2024-01-23 14:21:30.887' AS DateTime))
SET IDENTITY_INSERT [dbo].[Shipping_tbl] OFF
SET IDENTITY_INSERT [dbo].[Sub_Category] ON 

INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (1, N'2', N'Iron-Rod', N'1.jpg', N'1', N'Mar 21 2023  5:11PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (2, N'2', N'Bricks', N'brick.jpg', N'1', N'Mar 21 2023  5:12PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (3, N'2', N'Rait', N'rait.jpg', N'1', N'Mar 21 2023  5:14PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (4, N'2', N'Cement', N'cement.jpg', N'1', N'Mar 21 2023  5:15PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (5, N'2', N'Wires & Cables', N'Wire.jpg', N'1', N'Mar 21 2023  5:16PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (6, N'2', N'Plumbing Pipes', N'6.jpg', N'1', N'Mar 21 2023  5:25PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (7, N'2', N'Floors', N'floor.jpg', N'1', N'Mar 21 2023  5:29PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (8, N'2', N'Paint', N'paint.jpg', N'1', N'Mar 21 2023  5:30PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (9, N'3', N'Sofa', N'chair.jpg', N'1', N'Mar 21 2023  5:30PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (10, N'3', N'Bed', N'bed.jpg', N'1', N'Mar 21 2023  5:33PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (11, N'3', N'Almirah', N'almirah.jpg', N'1', N'Mar 21 2023  5:36PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (12, N'3', N'Dinning Table', N'dinning table.jpg', N'1', N'Mar 21 2023  5:37PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (13, N'3', N'Palmets', N'palmet.jpg', N'1', N'Mar 21 2023  5:38PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (14, N'3', N'Panels', N'panels.jpg', N'1', N'Mar 21 2023  5:40PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (15, N'3', N'Chair', N'chair.jpg', N'1', N'Mar 21 2023  5:41PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (16, N'3', N'Table', N'table.jpg', N'1', N'Mar 21 2023  5:42PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (17, N'4', N'Gyser', N'gyser.jpg', N'1', N'Mar 21 2023  5:44PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (18, N'4', N'Television', N'tv.jpg', N'1', N'Mar 21 2023  5:46PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (19, N'4', N'Fridge', N'fridge.jpg', N'1', N'Mar 21 2023  5:47PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (20, N'4', N'AC', N'ac.jpg', N'1', N'Mar 21 2023  5:49PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (21, N'4', N'Juice Mixer', N'mixer.jpg', N'1', N'Mar 21 2023  5:51PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (22, N'4', N'Chimmni', N'chimmni.jpg', N'1', N'Mar 21 2023  5:51PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (23, N'4', N'Fans', N'fan.jpg', N'1', N'Mar 21 2023  5:52PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (24, N'4', N'Lights', N'light.jpg', N'1', N'Mar 21 2023  5:53PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (25, N'5', N'Wallpaper', N'wallpaper.jpg', N'1', N'Mar 21 2023  5:54PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (26, N'5', N'Watches', N'watch.jpg', N'1', N'Mar 21 2023  5:56PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (27, N'5', N'Jhoomers', N'jhoomar.jpg', N'1', N'Mar 21 2023  5:56PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (28, N'5', N'Paintings', N'painting.jpg', N'1', N'Mar 21 2023  6:01PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (29, N'8', N'Architecture', N'32.jpg', N'1', N'Mar 21 2023  6:13PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (30, N'8', N'Interior', N'interior.jpg', N'1', N'Mar 22 2023  3:58PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (31, N'8', N'Plumbering', N'plumber.jpg', N'1', N'Mar 22 2023  3:59PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (32, N'8', N'Exterior', N'exterior.jpg', N'1', N'Mar 22 2023  4:00PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (33, N'8', N'Contractor', N'contrator.jpg', N'1', N'Mar 22 2023  4:01PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (34, N'5', N'Cushions and Pillows', N'pillows.jpg', N'1', N'Mar 22 2023  4:06PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (35, N'5', N'Curtains and Drapes', N'curtains.jpg', N'1', N'Mar 22 2023  4:10PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (36, N'5', N'Rugs and Carpets', N'carpets.jpg', N'1', N'Mar 22 2023  4:11PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (37, N'5', N'Wall Art', N'wall.jpg', N'1', N'Mar 22 2023  4:12PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (38, N'5', N'Mirrors', N'mirrors.jpg', N'1', N'Mar 22 2023  4:13PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (39, N'5', N'Vases and Bowls', N'Vases and Bowls.jpg', N'1', N'Mar 22 2023  4:13PM')
INSERT [dbo].[Sub_Category] ([id], [cid], [SubCategory], [image], [status], [rts]) VALUES (40, N'5', N'Candles and Candle Holders', N'Candles and Candle Holders.jpg', N'1', N'Mar 22 2023  4:14PM')
SET IDENTITY_INSERT [dbo].[Sub_Category] OFF
SET IDENTITY_INSERT [dbo].[TrnOrderDetail] ON 

INSERT [dbo].[TrnOrderDetail] ([AID], [InvoiceNo], [OrderId], [ProductId], [Quantity], [Amount], [DeliveryFees], [NetAmount], [Cancelled], [Delivered], [Returned], [Dispatched], [RTS], [DeliveryDate], [DeliveryCharges], [remark]) VALUES (3, 3, 3, 6, CAST(1 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), CAST(50 AS Numeric(18, 0)), CAST(5050 AS Numeric(18, 0)), 0, 0, 0, 0, CAST(N'2024-01-30 15:23:01.763' AS DateTime), CAST(N'2024-01-30 15:23:01.763' AS DateTime), CAST(50 AS Numeric(18, 0)), N'')
INSERT [dbo].[TrnOrderDetail] ([AID], [InvoiceNo], [OrderId], [ProductId], [Quantity], [Amount], [DeliveryFees], [NetAmount], [Cancelled], [Delivered], [Returned], [Dispatched], [RTS], [DeliveryDate], [DeliveryCharges], [remark]) VALUES (4, 3, 3, 7, CAST(12 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), CAST(50 AS Numeric(18, 0)), CAST(10100 AS Numeric(18, 0)), 0, 0, 0, 0, CAST(N'2024-01-30 15:23:06.660' AS DateTime), CAST(N'2024-01-30 15:23:06.660' AS DateTime), CAST(50 AS Numeric(18, 0)), N'')
INSERT [dbo].[TrnOrderDetail] ([AID], [InvoiceNo], [OrderId], [ProductId], [Quantity], [Amount], [DeliveryFees], [NetAmount], [Cancelled], [Delivered], [Returned], [Dispatched], [RTS], [DeliveryDate], [DeliveryCharges], [remark]) VALUES (5, 4, 4, 6, CAST(1 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), CAST(50 AS Numeric(18, 0)), CAST(5050 AS Numeric(18, 0)), 0, 0, 0, 0, CAST(N'2024-01-31 16:46:57.920' AS DateTime), CAST(N'2024-01-31 16:46:57.920' AS DateTime), CAST(50 AS Numeric(18, 0)), N'')
INSERT [dbo].[TrnOrderDetail] ([AID], [InvoiceNo], [OrderId], [ProductId], [Quantity], [Amount], [DeliveryFees], [NetAmount], [Cancelled], [Delivered], [Returned], [Dispatched], [RTS], [DeliveryDate], [DeliveryCharges], [remark]) VALUES (6, 4, 4, 7, CAST(12 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), CAST(50 AS Numeric(18, 0)), CAST(10100 AS Numeric(18, 0)), 0, 0, 0, 0, CAST(N'2024-01-31 16:46:57.937' AS DateTime), CAST(N'2024-01-31 16:46:57.937' AS DateTime), CAST(50 AS Numeric(18, 0)), N'')
SET IDENTITY_INSERT [dbo].[TrnOrderDetail] OFF
SET IDENTITY_INSERT [dbo].[TrnOrderMain] ON 

INSERT [dbo].[TrnOrderMain] ([AID], [OrderId], [Usercode], [OrderAmount], [PaidAmount], [TotalQuantity], [DeliveryFees], [Amount], [Paymode], [TrnId], [TrnStatus], [OrderThrough], [ShippingName], [ShippingAddress], [ShippingMobileNo], [ShippingEmailId], [ShippingCity], [ShippingZipcode], [ShippingState], [Delivered], [Cancelled], [Returned], [Dispatched], [Settlement], [RTS], [remark], [sid]) VALUES (1, 0, N'123@gmail.com', CAST(65000 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), CAST(10040 AS Numeric(18, 0)), N'True', N'', N'1', N'WEBSITE', N'kudsfyiu', N'
dsdtyuiydetui', N'4567895678', N'', N'bhilwara', N'31100', N'Rajasthan', 0, 0, 0, 0, 0, CAST(N'2024-01-24 12:29:12.667' AS DateTime), NULL, NULL)
INSERT [dbo].[TrnOrderMain] ([AID], [OrderId], [Usercode], [OrderAmount], [PaidAmount], [TotalQuantity], [DeliveryFees], [Amount], [Paymode], [TrnId], [TrnStatus], [OrderThrough], [ShippingName], [ShippingAddress], [ShippingMobileNo], [ShippingEmailId], [ShippingCity], [ShippingZipcode], [ShippingState], [Delivered], [Cancelled], [Returned], [Dispatched], [Settlement], [RTS], [remark], [sid]) VALUES (2, 1, N'', CAST(0 AS Numeric(18, 0)), CAST(50 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), N'True', N'', N'1', N'WEBSITE', N'kudsfyiu', N'dyu', N'4567895678', N'Skour@gmail.com', N'bhilwara', N'31100', N'Rajasthan', 0, 0, 0, 0, 0, CAST(N'2024-01-30 14:58:27.797' AS DateTime), NULL, NULL)
INSERT [dbo].[TrnOrderMain] ([AID], [OrderId], [Usercode], [OrderAmount], [PaidAmount], [TotalQuantity], [DeliveryFees], [Amount], [Paymode], [TrnId], [TrnStatus], [OrderThrough], [ShippingName], [ShippingAddress], [ShippingMobileNo], [ShippingEmailId], [ShippingCity], [ShippingZipcode], [ShippingState], [Delivered], [Cancelled], [Returned], [Dispatched], [Settlement], [RTS], [remark], [sid]) VALUES (3, 2, N'123@gmail.com', CAST(65000 AS Numeric(18, 0)), CAST(65050 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), CAST(65000 AS Numeric(18, 0)), N'True', N'', N'1', N'WEBSITE', N'kudsfyiu', N'fui', N'4567895678', N'Skour@gmail.com', N'bhilwara', N'31100', N'Rajasthan', 0, 0, 0, 0, 0, CAST(N'2024-01-30 14:59:27.373' AS DateTime), NULL, NULL)
INSERT [dbo].[TrnOrderMain] ([AID], [OrderId], [Usercode], [OrderAmount], [PaidAmount], [TotalQuantity], [DeliveryFees], [Amount], [Paymode], [TrnId], [TrnStatus], [OrderThrough], [ShippingName], [ShippingAddress], [ShippingMobileNo], [ShippingEmailId], [ShippingCity], [ShippingZipcode], [ShippingState], [Delivered], [Cancelled], [Returned], [Dispatched], [Settlement], [RTS], [remark], [sid]) VALUES (4, 3, N'123@gmail.com', CAST(65000 AS Numeric(18, 0)), CAST(65050 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), CAST(50 AS Numeric(18, 0)), CAST(65000 AS Numeric(18, 0)), N'True', N'', N'1', N'WEBSITE', N'kudsfyiu', N'sasdyui', N'4567895678', N'Skour@gmail.com', N'bhilwara', N'31100', N'Rajasthan', 0, 0, 0, 0, 0, CAST(N'2024-01-30 15:23:06.667' AS DateTime), NULL, NULL)
INSERT [dbo].[TrnOrderMain] ([AID], [OrderId], [Usercode], [OrderAmount], [PaidAmount], [TotalQuantity], [DeliveryFees], [Amount], [Paymode], [TrnId], [TrnStatus], [OrderThrough], [ShippingName], [ShippingAddress], [ShippingMobileNo], [ShippingEmailId], [ShippingCity], [ShippingZipcode], [ShippingState], [Delivered], [Cancelled], [Returned], [Dispatched], [Settlement], [RTS], [remark], [sid]) VALUES (5, 4, N'123@gmail.com', CAST(65000 AS Numeric(18, 0)), CAST(65050 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), CAST(50 AS Numeric(18, 0)), CAST(65000 AS Numeric(18, 0)), N'False', N'', N'1', N'WEBSITE', N'', N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, CAST(N'2024-01-31 16:46:57.953' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[TrnOrderMain] OFF
SET IDENTITY_INSERT [dbo].[User_Registration] ON 

INSERT [dbo].[User_Registration] ([id], [user_name], [user_email], [user_contact], [user_pass], [status], [rts]) VALUES (1, N'sadw', N'123@gmail.com', N'1234567891', N'111', N'1', CAST(N'2023-12-22 12:54:50.163' AS DateTime))
INSERT [dbo].[User_Registration] ([id], [user_name], [user_email], [user_contact], [user_pass], [status], [rts]) VALUES (2, N'hjgy', N'hgftf@gmail.com', N'1234545454', N'111', N'1', CAST(N'2023-12-22 12:56:34.100' AS DateTime))
INSERT [dbo].[User_Registration] ([id], [user_name], [user_email], [user_contact], [user_pass], [status], [rts]) VALUES (3, N'jaspreet Singh', N'jassa@gmail.com', N'8779965654', N'1212', N'1', CAST(N'2024-01-06 11:27:12.293' AS DateTime))
INSERT [dbo].[User_Registration] ([id], [user_name], [user_email], [user_contact], [user_pass], [status], [rts]) VALUES (1003, N'Simran', N'simran@gmail.com', N'8779965654', N'123456', N'1', CAST(N'2024-01-16 17:38:14.670' AS DateTime))
SET IDENTITY_INSERT [dbo].[User_Registration] OFF
USE [master]
GO
ALTER DATABASE [Home_Decore] SET  READ_WRITE 
GO
