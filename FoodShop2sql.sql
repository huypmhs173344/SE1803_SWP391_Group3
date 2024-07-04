USE [master]
GO
/****** Object:  Database [FoodShop2]    Script Date: 7/4/2024 4:28:58 PM ******/
CREATE DATABASE [FoodShop2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FoodShop2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER\MSSQL\DATA\FoodShop2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FoodShop2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER\MSSQL\DATA\FoodShop2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FoodShop2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FoodShop2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FoodShop2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FoodShop2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FoodShop2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FoodShop2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FoodShop2] SET ARITHABORT OFF 
GO
ALTER DATABASE [FoodShop2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FoodShop2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FoodShop2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FoodShop2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FoodShop2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FoodShop2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FoodShop2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FoodShop2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FoodShop2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FoodShop2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FoodShop2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FoodShop2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FoodShop2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FoodShop2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FoodShop2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FoodShop2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FoodShop2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FoodShop2] SET RECOVERY FULL 
GO
ALTER DATABASE [FoodShop2] SET  MULTI_USER 
GO
ALTER DATABASE [FoodShop2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FoodShop2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FoodShop2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FoodShop2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FoodShop2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FoodShop2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FoodShop2', N'ON'
GO
ALTER DATABASE [FoodShop2] SET QUERY_STORE = ON
GO
ALTER DATABASE [FoodShop2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FoodShop2]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 7/4/2024 4:28:58 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 7/4/2024 4:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/4/2024 4:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedback_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[description] [nvarchar](max) NULL,
	[feedback_date] [datetime] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/4/2024 4:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[detail_id] [int] NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/4/2024 4:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[total_money] [int] NULL,
	[status] [int] NULL,
	[date] [datetime] NULL,
	[note] [nvarchar](max) NULL,
	[isPay] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/4/2024 4:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[category_id] [int] NULL,
	[price] [int] NULL,
	[description] [nvarchar](max) NULL,
	[image_url] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[isSale] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 7/4/2024 4:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[shipping_id] [int] NOT NULL,
	[order_id] [int] NULL,
	[name] [nvarchar](50) NULL,
	[phone] [nvarchar](10) NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[shipping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/4/2024 4:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[full_name] [nvarchar](50) NULL,
	[phone_number] [nvarchar](10) NULL,
	[address] [nvarchar](50) NULL,
	[Role] [int] NULL,
	[gmail] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cart] ([user_id], [product_id], [quantity]) VALUES (8, 6, 1)
GO
INSERT [dbo].[Cart] ([user_id], [product_id], [quantity]) VALUES (8, 10, 1)
GO
INSERT [dbo].[Cart] ([user_id], [product_id], [quantity]) VALUES (8, 9, 1)
GO
INSERT [dbo].[Cart] ([user_id], [product_id], [quantity]) VALUES (8, 7, 1)
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (1, N'Burger')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (2, N'Sandwiches')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (3, N'Drinks')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (4, N'Fried Chicken')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (5, N'Pizza')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (6, N'Salads')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (7, N'Hot Dog')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (8, N'French Fries')
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (1, 8, 1, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (2, 8, 2, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (3, 8, 3, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (4, 8, 4, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (5, 8, 5, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (6, 8, 6, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (7, 8, 7, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (8, 8, 8, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (9, 8, 9, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (10, 8, 10, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (11, 8, 11, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (12, 8, 12, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (13, 8, 13, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (14, 8, 14, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (15, 8, 15, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (16, 8, 16, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (17, 8, 17, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (18, 8, 18, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (19, 8, 19, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (20, 8, 20, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (21, 8, 21, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (22, 8, 22, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (23, 8, 23, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (24, 8, 24, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (25, 8, 25, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (26, 8, 26, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (27, 8, 27, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (28, 8, 28, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (29, 8, 29, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (30, 8, 30, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (31, 8, 31, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (32, 8, 32, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (33, 8, 33, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (34, 8, 34, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (35, 8, 35, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (36, 8, 36, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (37, 8, 37, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (38, 8, 38, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (39, 8, 39, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (40, 8, 40, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (41, 8, 41, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (42, 8, 42, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (43, 8, 43, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (44, 8, 44, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (45, 8, 45, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (46, 8, 46, N'the food is delicious', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (47, 8, 1, N'Super quality products', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([feedback_id], [user_id], [product_id], [description], [feedback_date]) VALUES (48, 8, 1, N'Super quality products', CAST(N'2024-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [total_money], [status], [date], [note], [isPay]) VALUES (1, 8, 1000, 0, NULL, N'okkk', 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (1, N'NULLBeef Burger', 1, 40000, N'Classic Beef Burger: The classic beef burger usually includes a grilled or sauteed beef patty with cheese, lettuce, tomatoes and a traditional sauce like ketchup or mayo.', N'foodimg2\Beef Burger.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (2, N'Chicken Burger', 1, 40000, N'Grilled Chicken Burger: Grilled chicken burger usually comes with grilled chicken, lettuce, tomatoes and may have mayonnaise or ketchup.', N'foodimg2\Chicken Burger.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (3, N'Fish Burger', 1, 40000, N'Filet-O-Fish: Popular fish burger with deep-fried fish filet, toast, lettuce and ketchup.', N'foodimg2\Fish Burger.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (4, N'Vegetarian Burger', 1, 35000, N'Veggie Burger: Vegetarian burgers are often made from ingredients such as soybeans, vegetables and barley, and can be supplemented with vegetarian cheese and green vegetables.', N'foodimg2\Vegetarian Burger.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (5, N'Special Burger', 1, 60000, N'Special burger with grilled beef with BBQ sauce, popcorn and fried onions.', N'foodimg2\Special Burger.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (6, N'Steak Burger', 1, 50000, N'Burger with grilled beef, onions, bell peppers and melted cheese, as well as ketchup or ketchup.', N'foodimg2\Steak Burger.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (7, N'Cold Meat Sandwich', 2, 55000, N'Classic Ham and Cheese Sandwich: Classic ham sandwich with ham, cheese, lettuce and tomato on bread.', N'foodimg2\Cold Meat Sandwich.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (8, N'Chicken Sandwich', 2, 50000, N'Grilled Chicken Sandwich: Grilled chicken sandwich with grilled chicken, lettuce, tomato and may have mayonnaise or BBQ sauce.', N'foodimg2\Chicken Sandwich.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (9, N'Fish Sandwich', 2, 55000, N'Tuna Salad Sandwich: Tuna sandwich (tuna) with fish salad (tuna, mayonnaise, onion, cucumber) on bread.', N'foodimg2\Fish Sandwich.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (10, N'Beef Sandwich', 2, 55000, N'Roast Beef Sandwich: Roast beef sandwich with thin roast beef, lettuce, tomato and may have sauce or cheese.', N'foodimg2\Beef Sandwich.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (11, N'Pork Sandwich', 2, 50000, N'Pulled Pork Sandwich: Grilled pork sandwich with shredded pork, BBQ sauce and cucumber.', N'foodimg2\Pork Sandwich.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (12, N'Vegetarian Sandwiches', 2, 40000, N'Veggie Sandwich: Vegetarian sandwich with green vegetables such as lettuce, tomatoes, cucumbers and can be supplemented with cheese and sauce.', N'foodimg2\Vegetarian Sandwiches.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (13, N'Special Sandwiches', 2, 60000, N'Club Sandwich: Three-layer sandwich with chicken, bacon, lettuce, tomato and may have eggs and bacon.', N'foodimg2\Special Sandwiches.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (14, N'Coca-Cola', 3, 20000, N'', N'foodimg2\Coca-Cola.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (15, N'Pepsi', 3, 20000, N'', N'foodimg2\Pepsi.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (16, N'Fanta', 3, 20000, N'', N'foodimg2\Fanta.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (17, N'Monster', 3, 20000, N'', N'foodimg2\Monster.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (18, N'Rockstar', 3, 20000, N'', N'foodimg2\Rockstar.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (19, N'Sprite', 3, 20000, N'', N'foodimg2\Sprite.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (20, N'Red Bull', 3, 20000, N'', N'foodimg2\Red Bull.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (21, N'Fried Chicken Drumsticks', 4, 35000, N'Fried chicken thighs are a popular dish made from chicken thighs marinated with spices and then deep-fried in hot oil. Usually served whole or cut in half, fried chicken thighs are crispy on the outside and tender and delicious on the inside.', N'foodimg2\Fried Chicken Drumsticks.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (22, N'Fried Chicken Wings', 4, 35000, N'Fried chicken wings are a dish made from marinated and deep-fried chicken wings. Usually served with crispy bones and skin, fried chicken wings have a rich flavor and are often served with sauce.', N'foodimg2\Fried Chicken Wings.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (23, N'Whole Fried Chicken', 4, 150000, N'Whole fried chicken is fried whole chicken, including breasts, wings and thighs. The chicken is marinated before frying for even flavor and a crispy exterior. Usually cut into pieces when serving.', N'foodimg2\Whole Fried Chicken.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (24, N'Fried Chicken Pieces', 4, 30000, N'Fried chicken pieces include marinated and deep fried chicken pieces. The pieces can be from the wings, thighs, breasts or body of the chicken. Each piece usually has a crispy exterior and soft and flavorful meat inside.', N'foodimg2\Fried Chicken Pieces.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (25, N'Classic pizza', 5, 150000, N'Classic pizza is usually made from flour, tomato sauce, mozzarella cheese and toppings such as pepperoni, mushrooms, onions and bell peppers. It has a sweet taste from tomato sauce and a rich taste from cheese, and is a popular and popular dish around the world.', N'foodimg2\Classic pizza.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (26, N'Meat pizza', 5, 180000, N'Meat pizzas often contain a variety of meats such as pepperoni, sausage, ground beef, meatballs, and sometimes bacon or grilled pork. This is a popular choice for those who like rich flavors and delicious meat.', N'foodimg2\Meat pizza.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (27, N'Seafood pizza', 5, 200000, N'Seafood pizza is often made from seafood such as shrimp, squid, crab, fish or fish eggs. It can be combined with tomato sauce or seafood sauce, and topped with cheese and green vegetables such as cilantro, onions or spinach.', N'foodimg2\Seafood pizza.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (28, N'Vegetable pizza', 5, 250000, N'Vegetable pizza is usually made from vegetables such as tomatoes, eggplant, carrots, onions, bell peppers and mushrooms, covered with a layer of tomato sauce and cheese. This is a popular choice for vegetarians and often has fresh and varied flavors', N'foodimg2\Vegetable pizza.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (29, N'Special pizza', 5, 180000, N'Specialty pizzas can have a variety of ingredients and unique flavors, often created from the chef is creativity. For example, it could be pizza with special cheeses like gorgonzola and ricotta cheese, or with added ingredients like olives, pesto, or even special meats like venison or goose.', N'foodimg2\Special pizza.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (30, N'Fresh fruit salad', 6, 70000, N'Fresh fruit salads often include fresh fruits such as watermelon, cantaloupe, strawberries, grapes, oranges, apples, kiwi and other fruits. The fruits are often cut into small pieces and decorated on a bed of green vegetables such as lettuce, lettuce, or cilantro. Often marinated in vinaigrette sauce or watermelon sauce to add a fresh flavor.', N'foodimg2\Fresh fruit salad.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (31, N'Mushroom Salad', 6, 70000, N'Mushroom salad is often made from fresh mushrooms such as button mushrooms, Agaricus mushrooms (white button mushrooms), or Portobello mushrooms. Mushrooms are often sliced ​​thinly or chopped and mixed with green vegetables such as lettuce, lettuce, tomatoes, onions and pistachios. This salad can be dressed with vinaigrette or cream sauce if desired.', N'foodimg2\Mushroom Salad.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (32, N'Vegetable Salad', 6, 70000, N'Vegetable salads often include both vegetables and fruits, such as cucumbers, tomatoes, melons, onions, watermelon, oranges and grapes. These ingredients are chopped and mixed together on a bed of greens such as lettuce, lettuce or cilantro. This salad can be dressed with vinaigrette or sweet and sour dressing.', N'foodimg2\Vegetable Salad.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (33, N'Vegetarian Salad', 6, 50000, N'Vegetarian salads are often made from green vegetables such as lettuce, lettuce, tomatoes, cucumbers, onions and added ingredients such as cashews, chia seeds, or vegetables such as carrots and beets. This salad can be marinated with sauces such as sesame oil dressing, olive dressing or balsamic dressing.', N'foodimg2\Vegetarian Salad.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (34, N'Salad with Peanut Sauce', 6, 80000, N'Peanut sauce salad is usually made from green vegetables such as lettuce, lettuce, cilantro, tomatoes and cucumbers, and marinated with peanut sauce. Peanut sauce is usually made from roasted and ground peanuts, combined with sesame oil, soy sauce and sometimes spices like garlic and chili.', N'foodimg2\Salad with Peanut Sauce.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (35, N'Classic Hot Dog', 7, 40000, N'The classic Hot Dog usually consists of a smoked sausage grilled over a charcoal grill or grill, placed in a soft bun. Usually comes with tomato sauce, mustard sauce and minced onions. Some people like to add bell pepper or pickle on top.', N'foodimg2\Classic Hot Dog.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (36, N'Chili Dog', 7, 40000, N'Chili Dog is a type of Hot Dog with chili sauce added on grilled sausage and bread. Chili sauce is usually made from ground beef, tofu, tomatoes and spices. Often topped with melted cheese or minced onion.', N'foodimg2\Chili Dog.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (37, N'Cheese Dog', 7, 50000, N'Cheese Dog is a Hot Dog with melted cheese placed on top of grilled sausage in a bun. Cheese can be cheddar, mozzarella, or another type of cheese depending on preference.', N'foodimg2\Cheese Dog.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (38, N'Bacon Wrapped Dog', 7, 50000, N'Bacon Wrapped Dog is a type of Hot Dog whose sausage is wrapped in bacon before being grilled. When grilled, the pork belly often becomes crispy and delicious, adding flavor to the Hot Dog.', N'foodimg2\Bacon Wrapped Dog.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (39, N'Chicago Dog', 7, 50000, N'Chicago Dog is a typical type of Hot Dog from the city of Chicago, USA. It consists of grilled sausage in a bun, served with mustard sauce, sweet pickle sauce, bell peppers, tomatoes, onions and sesame seeds.', N'foodimg2\Chicago Dog.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (40, N'French Fries', 8, 50000, N'Classic french fries are potatoes cut into long strips and deep-fried in hot oil. Usually served with salt and may be accompanied by ketchup, mayo or mustard sauce.', N'foodimg2\French Fries.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (41, N'Classic French Fries', 8, 50000, N'Cheese fries are classic potatoes garnished with melted cheese. Cheese is often spread on top of the potatoes after they are fried and placed back in the oven or microwave to melt the cheese.', N'foodimg2\Classic French Fries.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (42, N'Cheese fries', 8, 50000, N'BBQ Sauce Fries are classic potatoes prepared with BBQ sauce. After frying, the potatoes are often mixed with BBQ sauce to absorb the flavor.', N'foodimg2\Cheese fries.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (43, N'Fries with BBQ', 8, 50000, N'Spicy fries are classic potatoes seasoned with salt and hot peppers before frying. Usually have a sharper color and flavor than regular potato chips.', N'foodimg2\Fries with BBQ.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (44, N'Spicy fries', 8, 50000, N'Spicy fries are classic potatoes seasoned with salt and hot peppers before frying. Usually have a sharper color and flavor than regular potato chips.', N'foodimg2\Spicy fries.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (45, N'Garlic fries', 8, 50000, N'Garlic fries are classic potatoes garnished with minced garlic or garlic butter for added delicious garlic flavor.', N'foodimg2\Garlic fries.jpg', N'True', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [price], [description], [image_url], [status], [isSale]) VALUES (46, N'Onion fries', 8, 50000, N'Onion fries are classic potatoes prepared with onions. Usually made from potatoes cut into long strips and fried crispy with onions to create a unique flavor.', N'foodimg2\Onion fries.jpg', N'True', NULL)
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
INSERT [dbo].[Users] ([user_id], [username], [password], [full_name], [phone_number], [address], [Role], [gmail], [status]) VALUES (12, N'hoangdanh3388', N'danh141474', N'Dang Hoang Danh', N'0856142588', N'Thanh Xuan - Ha Noi', 2, N'danghoangdanh@gmail.com', 1)
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
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Products]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Users]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
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
USE [master]
GO
ALTER DATABASE [FoodShop2] SET  READ_WRITE 
GO
