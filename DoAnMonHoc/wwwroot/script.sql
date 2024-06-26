USE [WebDoAN]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/25/2024 11:21:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[Root] [int] NOT NULL,
	[Enable] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/25/2024 11:21:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ussername] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[phone] [nvarchar](max) NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[adddress] [nvarchar](250) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/25/2024 11:21:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/25/2024 11:21:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[CustomerName] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Total] [float] NOT NULL,
	[State] [nvarchar](max) NULL,
	[Khachangid] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyens]    Script Date: 6/25/2024 11:21:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyens](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_PhanQuyens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 6/25/2024 11:21:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Sort] [nvarchar](max) NULL,
	[Detail] [nvarchar](max) NULL,
	[Datepost] [nvarchar](max) NULL,
	[Userpost] [nvarchar](max) NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/25/2024 11:21:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PassWord] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[MaPhanQuyen] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [Root], [Enable]) VALUES (1, N'Điện thoại', 1, 0, 0)
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [Root], [Enable]) VALUES (2, N'Máy tính bảng', 2, 0, 0)
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [Root], [Enable]) VALUES (3, N'Laptop', 3, 0, 0)
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [Root], [Enable]) VALUES (4, N'Đồng hồ', 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([Id], [Name], [Description], [Price], [CategoryId], [ImageUrl], [Sort], [Detail], [Datepost], [Userpost]) VALUES (1, N'Iphone 15', N'khong', 5000000, 1, N'/img/products/ad2bce1a-b9d6-45d3-a603-b536b7b6a0f7.jpg', N'1', N'khong', NULL, NULL)
INSERT [dbo].[products] ([Id], [Name], [Description], [Price], [CategoryId], [ImageUrl], [Sort], [Detail], [Datepost], [Userpost]) VALUES (2, N'Máy tính bảng', NULL, 350000, 2, N'img/products/08b00de4-433d-426a-992f-f232b25b0df7.jpg', N'1', NULL, NULL, NULL)
INSERT [dbo].[products] ([Id], [Name], [Description], [Price], [CategoryId], [ImageUrl], [Sort], [Detail], [Datepost], [Userpost]) VALUES (3, N'Laptop', N'mới', 4000000, 3, N'img/products/c81d5ce5-91f4-45d3-8c9d-2706f265e696.jpg', N'1', NULL, NULL, NULL)
INSERT [dbo].[products] ([Id], [Name], [Description], [Price], [CategoryId], [ImageUrl], [Sort], [Detail], [Datepost], [Userpost]) VALUES (4, N'Đồng hồ', N'mới', 420000, 4, N'img/products/850d35b3-7591-4062-a097-756c36a6e261.jpg', N'1', N'khong', N'khong', N'khong')
INSERT [dbo].[products] ([Id], [Name], [Description], [Price], [CategoryId], [ImageUrl], [Sort], [Detail], [Datepost], [Userpost]) VALUES (5, N'Iphone 12', NULL, 6300000, 1, N'img/products/2c22f359-f075-4f4d-91d8-9e852077e230.jpg', N'1', NULL, NULL, NULL)
INSERT [dbo].[products] ([Id], [Name], [Description], [Price], [CategoryId], [ImageUrl], [Sort], [Detail], [Datepost], [Userpost]) VALUES (6, N'Iphone 12 Pro', NULL, 7500000, 1, N'img/products/182d6b50-1656-4cac-bc5c-385133fbdc87.jpg', N'1', N'khong', N'khong', N'khong')
INSERT [dbo].[products] ([Id], [Name], [Description], [Price], [CategoryId], [ImageUrl], [Sort], [Detail], [Datepost], [Userpost]) VALUES (7, N'Iphone 14', NULL, 820000, 1, N'img/products/e652593d-9564-4acb-ae1c-6fc2f0c2a9ee.jpg', N'1', NULL, NULL, NULL)
INSERT [dbo].[products] ([Id], [Name], [Description], [Price], [CategoryId], [ImageUrl], [Sort], [Detail], [Datepost], [Userpost]) VALUES (8, N'Iphone 14 Pro', NULL, 9500000, 1, N'/img/product/ad2bce1a-b9d6-45d3-a603-b536b7b6a0f7.jpg', N'1', NULL, NULL, NULL)
INSERT [dbo].[products] ([Id], [Name], [Description], [Price], [CategoryId], [ImageUrl], [Sort], [Detail], [Datepost], [Userpost]) VALUES (9, N'Iphone 15', NULL, 1200000, 1, N'img/products/5b1ae2bb-b5f8-489d-937d-0b617ca121dd.jpg', N'1', NULL, NULL, NULL)
INSERT [dbo].[products] ([Id], [Name], [Description], [Price], [CategoryId], [ImageUrl], [Sort], [Detail], [Datepost], [Userpost]) VALUES (10, N'Iphone 15 Pro Max ', NULL, 1450, 1, N'img/products/f96958ab-e73d-4559-a160-1b15a9768723.jpg', N'1', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_products_ProductId]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_Categories_CategoryId]
GO
