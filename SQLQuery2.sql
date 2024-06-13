USE [FoodShop]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/13/2024 8:10:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/13/2024 8:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/13/2024 8:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[detail_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/13/2024 8:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[total_money] [int] NOT NULL,
	[status_id] [int] NOT NULL,
	[date] [date] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[note] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/13/2024 8:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] NOT NULL,
	[product_name] [nvarchar](50) NOT NULL,
	[category_id] [int] NOT NULL,
	[price] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[image_url] [nvarchar](100) NOT NULL,
	[status] [nvarchar](max) NOT NULL,
	[isSale] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 6/13/2024 8:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[shipping_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](10) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[shipping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/13/2024 8:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[status_id] [int] NOT NULL,
	[isPay] [bit] NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/13/2024 8:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[full_name] [nvarchar](50) NULL,
	[phone_number] [nvarchar](10) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[Role] [int] NOT NULL,
	[gmail] [nvarchar](50) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cart] ([user_id], [product_id], [quantity]) VALUES (2, 3, 0)
GO
INSERT [dbo].[Cart] ([user_id], [product_id], [quantity]) VALUES (2, 2, 2)
GO
INSERT [dbo].[Cart] ([user_id], [product_id], [quantity]) VALUES (5, 6, 7)
GO
INSERT [dbo].[Cart] ([user_id], [product_id], [quantity]) VALUES (7, 6, 7)
GO
INSERT [dbo].[Cart] ([user_id], [product_id], [quantity]) VALUES (8, 5, 6)
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (1, N'Snack')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (2, N'Dessert-Drink')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (3, N'Spaghetti')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (4, N'Rice')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (5, N'Burger')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (6, N'Chicken')
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (1, N'Fried Chicken', 6, 36000, NULL, N'foodimg\French Fries.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (2, N'Roasted Fillet', 6, 39000, NULL, N'foodimf\Roasted Fillet.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (3, N'ROASTED CHICKEN LEG QUARTER', 6, 75000, NULL, N'foodimg\ROASTED CHICKEN LEG QUARTER.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (4, N'Burger Flava', 5, 55000, NULL, N'foodimg\Burger Flava.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (5, N'Burger Shrimp', 5, 45000, NULL, N'foodimg\Burger Shrimp.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (6, N'Burger Zinger', 5, 55000, NULL, N'foodimg\Burger Zinger.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (7, N'Fried Chicken Rice', 4, 46000, NULL, N'foodimg\Fried Chicken Rice.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (8, N'Flava Rice', 4, 46000, NULL, N'foodimg\Flava Rice.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (9, N'Steak Rice', 4, 46000, NULL, N'foodimg\Steak Rice.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (10, N'Tenderods Rice', 4, 46000, NULL, N'foodimg\Tenderods Rice.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (11, N'Skewer Rice', 4, 46000, NULL, N'foodimg\Skewer Rice.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (12, N'Spaghetti ', 3, 41000, NULL, N'foodimg\Spaghetti .jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (13, N'Seaweed Soup', 1, 17000, NULL, N'foodimg\Seaweed Soup.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (14, N'Coleslaw', 1, 12000, NULL, N'foodimg\Coleslaw.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (15, N'Mashed Potato', 1, 12000, NULL, N'foodimg\Mashed Potato.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (16, N'French Fries', 1, 22000, NULL, N'foodimg\French Fries.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (17, N'Salad Pop', 1, 33000, NULL, N'foodimg\Salad Pop.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (18, N'Salad Hat', 1, 29000, NULL, N'foodimg\Salad Hat.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (19, N'Peach Tea', 2, 22000, NULL, N'foodimg\Peach Tea.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (20, N'Lipton Lemon Tea', 2, 10000, NULL, N'foodimg\Lipton Lemon Tea.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (21, N'Pepsi Black Lime Can', 2, 17000, NULL, N'foodimg\Pepsi Black Lime Can.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (22, N'Aquafina 500ml', 2, 10000, NULL, N'foodimg\Aquafina 500ml.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (23, N'7Up Can', 2, 15000, NULL, N'foodimg\7Up Can.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (24, N'Pepsi Can', 2, 15000, NULL, N'foodimg\Pepsi Can,jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (25, N'Pumcheese', 2, 15000, NULL, N'foodimg\Pumcheese.jpg', N'True', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (30, N' Chicken Rice', 4, 33000, N'Null', N'foodimg\Flava Rice.jpg', N'True', 0)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [full_name], [phone_number], [address], [Role], [gmail], [status]) VALUES (1, N'admin', N'huy123', N'Huy Pham', N'0943581257', N'Hoa Lac', 0, N'huypmhs173344@fpt.edu.vn', 0)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [full_name], [phone_number], [address], [Role], [gmail], [status]) VALUES (2, N'huypham', N'huy123456', N'Huy', N'0942586318', N'Thach That', 1, N'hfiasu@gmail.com', 1)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [full_name], [phone_number], [address], [Role], [gmail], [status]) VALUES (3, N'isadmin', N'ad123456', N'Pham Huy', N'0942583617', N'Ha Noi', 0, N'huyhua01@gmail.com', 1)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [full_name], [phone_number], [address], [Role], [gmail], [status]) VALUES (4, N'tungtran', N'tung1234', N'Tran Tung', N'0813549247', N'Ninh Binh', 1, N'tungtran@gmail.com', 1)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [full_name], [phone_number], [address], [Role], [gmail], [status]) VALUES (5, N'vulong1', N'long123456', N'Vu Long', N'0813548154', N'Thach That Ha Noi', 1, N'longvu@gmail.com', 1)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [full_name], [phone_number], [address], [Role], [gmail], [status]) VALUES (6, N'hoangdanh93', N'danh154657', N'Hoang Danh', N'0513547895', N'Thanh Xuan - Ha Noi', 1, N'danh123@gmail.com', 1)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [full_name], [phone_number], [address], [Role], [gmail], [status]) VALUES (7, N'dungvuk15', N'anhdung1412', N'Vu Dung', N'0123548254', N'Nam Tu Liem', 1, N'dung22@gmail.com', 1)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [full_name], [phone_number], [address], [Role], [gmail], [status]) VALUES (8, N'phamminhhuy', N'huypham1', N'Pham Minh Huy', N'0843518468', N'Bac Tu Liem - Ha Noi', 2, N'hola2233@gmail.com', 1)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [full_name], [phone_number], [address], [Role], [gmail], [status]) VALUES (9, N'tranthanhtung', N'tungtran22', N'Tran Thanh Tung', N'0513258472', N'Kim Son - Ninh Binh', 2, N'tungtran@gmail.com', 1)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [full_name], [phone_number], [address], [Role], [gmail], [status]) VALUES (10, N'dungvuthe', N'dung22111', N'Vu The Dung', N'0251325849', N'Ha Noi', 2, N'vudung@gmail.com', 1)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [full_name], [phone_number], [address], [Role], [gmail], [status]) VALUES (11, N'longvu22', N'long vu1444', N'Vu Hoang Long', N'0521358478', N'Quoc Oai - Ha Noi', 2, N'longvukk@gmail.com', 1)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [full_name], [phone_number], [address], [Role], [gmail], [status]) VALUES (12, N'hoangdanh3388', N'danh141474', N'Dang Hoang Danh', N'0856142588', N'Thanh Xuan - Ha Noi', 2, N'danghoangdanh@gmail.com', 0)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [full_name], [phone_number], [address], [Role], [gmail], [status]) VALUES (13, N'tung13245', N'tung12345', NULL, N'34183481', N'sdfsafd', 2, NULL, 0)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [full_name], [phone_number], [address], [Role], [gmail], [status]) VALUES (14, N'tung13245', N'tung12345', NULL, N'34183481', N'sdfsafd', 2, NULL, 0)
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([status_id])
REFERENCES [dbo].[Status] ([status_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Shipping]  WITH CHECK ADD  CONSTRAINT [FK_Shipping_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Shipping] CHECK CONSTRAINT [FK_Shipping_Orders]
GO
