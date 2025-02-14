USE [master]
GO
/****** Object:  Database [mvc_ecommerce]    Script Date: 16-09-2024 12:23:10 ******/
CREATE DATABASE [mvc_ecommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mvc_ecommerce', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\mvc_ecommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mvc_ecommerce_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\mvc_ecommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mvc_ecommerce] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mvc_ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mvc_ecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mvc_ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mvc_ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mvc_ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mvc_ecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET RECOVERY FULL 
GO
ALTER DATABASE [mvc_ecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [mvc_ecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mvc_ecommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mvc_ecommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mvc_ecommerce] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [mvc_ecommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mvc_ecommerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [mvc_ecommerce] SET QUERY_STORE = OFF
GO
USE [mvc_ecommerce]
GO
/****** Object:  Table [dbo].[admin_Employee]    Script Date: 16-09-2024 12:23:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_Employee](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NULL,
	[Age] [int] NULL,
	[DateofBirth] [date] NULL,
	[Gender] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Mobile] [varchar](15) NOT NULL,
	[PhotoPath] [varchar](500) NULL,
 CONSTRAINT [PK_admin_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[admin_Login]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_Login](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleType] [int] NULL,
	[Notes] [varchar](255) NULL,
 CONSTRAINT [PK_admin_Login] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Description] [varchar](50) NULL,
	[Picture1] [varchar](255) NULL,
	[Picture2] [varchar](250) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[First Name] [varchar](50) NOT NULL,
	[Last Name] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Age] [int] NULL,
	[Gender] [varchar](50) NULL,
	[DateofBirth] [date] NULL,
	[Organization] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[AltEmail] [varchar](50) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](20) NULL,
	[Mobile1] [varchar](50) NULL,
	[Mobile2] [varchar](50) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[Picture] [varchar](250) NULL,
	[status] [varchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[Created] [date] NULL,
	[Notes] [varchar](250) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genMainSlider]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genMainSlider](
	[MainSliderID] [int] IDENTITY(1,1) NOT NULL,
	[ImageURL] [varchar](500) NULL,
	[AltText] [varchar](255) NULL,
	[OfferTag] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[BtnText] [varchar](50) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_genMainSlider] PRIMARY KEY CLUSTERED 
(
	[MainSliderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genPromoRight]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genPromoRight](
	[PromoRightID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ImageURL] [varchar](500) NULL,
	[AltText] [varchar](500) NULL,
	[OfferTag] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_genPromoRight] PRIMARY KEY CLUSTERED 
(
	[PromoRightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PaymentID] [int] NULL,
	[ShippingID] [int] NULL,
	[Discount] [int] NULL,
	[Taxes] [int] NULL,
	[TotalAmount] [int] NULL,
	[isCompleted] [bit] NULL,
	[OrderDate] [datetime] NULL,
	[DIspatched] [bit] NULL,
	[DispatchedDate] [datetime] NULL,
	[Shipped] [bit] NULL,
	[ShippingDate] [datetime] NULL,
	[Deliver] [bit] NULL,
	[DeliveryDate] [datetime] NULL,
	[Notes] [varchar](500) NULL,
	[CancelOrder] [bit] NULL,
 CONSTRAINT [PK_Oder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[Discount] [decimal](18, 0) NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[CreditAmount] [money] NULL,
	[DebitAmount] [money] NULL,
	[Balance] [money] NULL,
	[PaymentDateTime] [datetime] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[PayTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[PayTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryID] [int] NULL,
	[QuantityPerUnit] [varchar](50) NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[OldPrice] [decimal](18, 0) NULL,
	[UnitWeight] [varchar](50) NULL,
	[Size] [varchar](50) NULL,
	[Discount] [decimal](18, 0) NULL,
	[UnitInStock] [int] NULL,
	[UnitOnOrder] [int] NULL,
	[ProductAvailable] [bit] NULL,
	[ImageURL] [varchar](500) NULL,
	[AltText] [varchar](50) NULL,
	[AddBadge] [bit] NULL,
	[OfferTitle] [varchar](50) NULL,
	[OfferBadgeClass] [varchar](50) NULL,
	[ShortDescription] [varchar](300) NULL,
	[LongDescription] [varchar](2000) NULL,
	[Picture1] [varchar](500) NULL,
	[Picture2] [varchar](500) NULL,
	[Picture3] [varchar](500) NULL,
	[Picture4] [varchar](500) NULL,
	[Note] [varchar](250) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecentlyViews]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecentlyViews](
	[RViewID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ViewDate] [datetime] NOT NULL,
	[Note] [varchar](255) NULL,
 CONSTRAINT [PK_RecentlyViews] PRIMARY KEY CLUSTERED 
(
	[RViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Review] [varchar](500) NULL,
	[Rate] [int] NULL,
	[DateTime] [datetime] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingDetails]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingDetails](
	[ShippingID] [int] NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Mobile] [varchar](20) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Province] [varchar](20) NULL,
	[City] [varchar](20) NULL,
	[PostCode] [varchar](10) NULL,
 CONSTRAINT [PK_ShippingDetails] PRIMARY KEY CLUSTERED 
(
	[ShippingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[Description] [varchar](250) NULL,
	[Picture1] [varchar](500) NULL,
	[Picture2] [varchar](500) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[ContactName] [varchar](50) NULL,
	[ContactTitle] [varchar](50) NULL,
	[Address] [varchar](128) NULL,
	[Mobile] [varchar](15) NULL,
	[Phone] [varchar](15) NOT NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](50) NOT NULL,
	[City] [varchar](20) NULL,
	[Country] [varchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 16-09-2024 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[WishlistID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Wishlist] PRIMARY KEY CLUSTERED 
(
	[WishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Taxes]  DEFAULT ((0)) FOR [Taxes]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_isCompleted]  DEFAULT ((0)) FOR [isCompleted]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_DIspatched]  DEFAULT ((0)) FOR [DIspatched]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Shipped]  DEFAULT ((0)) FOR [Shipped]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Deliver]  DEFAULT ((0)) FOR [Deliver]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CancelOrder]  DEFAULT ((0)) FOR [CancelOrder]
GO
ALTER TABLE [dbo].[Wishlist] ADD  CONSTRAINT [DF_Wishlist_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[admin_Login]  WITH CHECK ADD  CONSTRAINT [FK_admin_Login_admin_Employee] FOREIGN KEY([EmpID])
REFERENCES [dbo].[admin_Employee] ([EmpID])
GO
ALTER TABLE [dbo].[admin_Login] CHECK CONSTRAINT [FK_admin_Login_admin_Employee]
GO
ALTER TABLE [dbo].[admin_Login]  WITH CHECK ADD  CONSTRAINT [FK_admin_Login_Roles] FOREIGN KEY([RoleType])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[admin_Login] CHECK CONSTRAINT [FK_admin_Login_Roles]
GO
ALTER TABLE [dbo].[genPromoRight]  WITH CHECK ADD  CONSTRAINT [FK_genPromoRight_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[genPromoRight] CHECK CONSTRAINT [FK_genPromoRight_Categories]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customers]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payment] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payment] ([PaymentID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Payment]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_ShippingDetails] FOREIGN KEY([ShippingID])
REFERENCES [dbo].[ShippingDetails] ([ShippingID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_ShippingDetails]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_PaymentType] FOREIGN KEY([Type])
REFERENCES [dbo].[PaymentType] ([PayTypeID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_PaymentType]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_SubCategory]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[RecentlyViews]  WITH CHECK ADD  CONSTRAINT [FK_RecentlyViews_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[RecentlyViews] CHECK CONSTRAINT [FK_RecentlyViews_Customers]
GO
ALTER TABLE [dbo].[RecentlyViews]  WITH CHECK ADD  CONSTRAINT [FK_RecentlyViews_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[RecentlyViews] CHECK CONSTRAINT [FK_RecentlyViews_Products]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Customers]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Products]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Categories]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Customers]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Products]
GO
ALTER DATABASE [mvc_ecommerce] SET  READ_WRITE 


GO
SET IDENTITY_INSERT [dbo].[admin_Employee] ON 

INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [Email],[Mobile]) 
VALUES (1, 'Admin','Admin@admin.com','0000000000')
SET IDENTITY_INSERT [dbo].[admin_Employee] OFF

SET IDENTITY_INSERT [dbo].[Roles] ON 
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1, N'Admin', N'All rights')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (2, N'Employee', N'Some rights')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (3, N'User', N'Some rights')
SET IDENTITY_INSERT [dbo].[Roles] OFF

SET IDENTITY_INSERT [dbo].[admin_Login] ON 
INSERT [dbo].[admin_Login] ([LoginID], [EmpID], [UserName], [Password], [RoleType]) VALUES (1,1,'Admin',123456,1)
SET IDENTITY_INSERT [dbo].[admin_Login] OFF

SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (1, N'Men', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (2, N'Women', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (3, N'Kids', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (4, N'Sports', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (5, N'Phones', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (6, N'Computing', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (7, N'Appliances', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (8, N'Beauty & Perfumes', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (9, N'TVs,Audio & Video', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (10, N'Accessories', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF

SET IDENTITY_INSERT [dbo].[genMainSlider] ON
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (1, N'/Content/img/slider/1.jpg', N'Men slide img', N'Save Up to 75% Off', N'Men Collection', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (2, N'/Content/img/slider/2.jpg', N'Wristwatch slide img', N'Save Up to 40% Off', N'Wristwatch Collection', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (3, N'/Content/img/slider/3.jpg', N'Women Jeans slide img', N'Save Up to 75% Off', N'Jeans Collection', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (4, N'/Content/img/slider/4.jpg', N'Shoes slide img', N'Save Up to 75% Off', N'Exclusive Collection', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (5, N'/Content/img/slider/5.jpg', N'Male Female slide img', N'Save Up to 50% Off', N'Best Collection', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
SET IDENTITY_INSERT [dbo].[genMainSlider] OFF

SET IDENTITY_INSERT [dbo].[genPromoRight] ON
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (0, 1, N'/Content/img/promo-banner-mens.jpg', N'img', N'Exclusive Item', N'For Men', 0)
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (1, 5, N'/Content/img/promo-banner-phones.jpg', N'img', N'Sales off', N'On Phones', 0)
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (2, 3, N'/Content/img/promo-banner-kids.jpg', N'img', N'New Arrivals', N'For Kids', 0)
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (3, 4, N'/Content/img/promo-banner-sports.jpg', N'img', N'25% off', N'On Sports', 0)
SET IDENTITY_INSERT [dbo].[genPromoRight] OFF

SET IDENTITY_INSERT [dbo].[PaymentType] ON
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (1, N'Cash on Delivery', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (2, N'Paypal', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (3, N'Master Card', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (4, N'Easypaisa', NULL)
SET IDENTITY_INSERT [dbo].[PaymentType] OFF

--SET IDENTITY_INSERT [dbo].[Products] ON
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (1, N'Polo T-Shirt', 2, 1, 1, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 6, NULL, NULL, N'/Content/img/man/polo-shirt-2.png', N'polo shirt img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (2, N'T-Shirt', 2, 1, 6, NULL, CAST(700 AS Decimal(18, 0)), CAST(850 AS Decimal(18, 0)), NULL, NULL, NULL, 8, NULL, NULL, N'/Content/img/man/t-shirt-1.png', N'polo shirt img', 1, N'SOLD OUT', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (3, N'Polo T-Shirt', 2, 1, 6, NULL, CAST(450 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 9, NULL, NULL, N'/Content/img/man/polo-shirt-1.png', N'polo shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (4, N'New Polo T-Shirt', 2, 1, 6, NULL, CAST(800 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), NULL, NULL, NULL, 48, NULL, NULL, N'/Content/img/man/polo-shirt-4.png', N'polo shirt img', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (5, N'New T-Shirt', 2, 1, 6, NULL, CAST(700 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 51, NULL, NULL, N'/Content/img/man/polo-shirt-5.png', N'polo shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (6, N'Star T-Shirt', 2, 1, 6, NULL, CAST(700 AS Decimal(18, 0)), CAST(950 AS Decimal(18, 0)), NULL, NULL, NULL, 99, NULL, NULL, N'/Content/img/man/polo-shirt-6.png', N'polo shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (7, N'Polo T-Shirt', 2, 1, 6, NULL, CAST(700 AS Decimal(18, 0)), CAST(950 AS Decimal(18, 0)), NULL, NULL, NULL, 20, NULL, NULL, N'/Content/img/man/polo-shirt-2.png', N'polo shirt img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (8, N'T-Shirt', 2, 1, 6, NULL, CAST(700 AS Decimal(18, 0)), CAST(850 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/man/t-shirt-1.png', N'polo shirt img', 1, N'SOLD OUT', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (9, N'Girl-1', 2, 2, 1, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/women/girl-1.png', N'girl shirt img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (10, N'Girl-2', 2, 2, 1, NULL, CAST(850 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 8, NULL, NULL, N'/Content/img/women/girl-2.png', N'girl shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (11, N'Girl-3', 2, 2, 1, NULL, CAST(750 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 25, NULL, NULL, N'/Content/img/women/girl-3.png', N'girl shirt img', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (12, N'Girl-4', 2, 2, 1, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 2, NULL, NULL, N'/Content/img/women/girl-4.png', N'girl shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (13, N'Girl-5', 2, 2, 1, NULL, CAST(900 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 8, NULL, NULL, N'/Content/img/women/girl-5.png', N'girl shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (14, N'Girl-6', 2, 2, 1, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/women/girl-6.png', N'girl shirt img', 1, N'SOLD OUT!', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (15, N'Girl-7', 2, 2, 1, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 16, NULL, NULL, N'/Content/img/women/girl-7.png', N'girl shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (16, N'Girl-8', 2, 2, 1, NULL, CAST(1500 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 18, NULL, NULL, N'/Content/img/women/girl-1.png', N'girl shirt img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (25, N'sport-1', 2, 4, 2, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 45, NULL, NULL, N'/Content/img/sports/sport-1.png', N'sport shirt img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (26, N'sport-2', 2, 4, 2, NULL, CAST(850 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 50, NULL, NULL, N'/Content/img/sports/sport-2.png', N'sport shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (27, N'sport-3', 2, 4, 2, NULL, CAST(750 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 33, NULL, NULL, N'/Content/img/sports/sport-3.png', N'sport shirt img', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (28, N'sport-4', 2, 4, 2, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/sports/sport-4.png', N'sport shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (29, N'sport-5', 2, 4, 2, NULL, CAST(900 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/sports/sport-5.png', N'sport shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (30, N'sport-6', 2, 4, 2, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/sports/sport-6.png', N'sport shirt img', 1, N'SOLD OUT!', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (31, N'sport-7', 2, 4, 2, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 8, NULL, NULL, N'/Content/img/sports/sport-7.png', N'sport shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (32, N'sport-8', 2, 4, 2, NULL, CAST(1500 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 3, NULL, NULL, N'/Content/img/sports/sport-1.png', N'sport shirt img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (33, N'electronic-1', 2, 5, NULL, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 30, NULL, NULL, N'/Content/img/electronics/electronic-1.png', N'electronic item img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (34, N'electronic-2', 2, 5, NULL, NULL, CAST(850 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 29, NULL, NULL, N'/Content/img/electronics/electronic-2.png', N'electronic item img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (35, N'electronic-3', 2, 5, NULL, NULL, CAST(750 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 21, NULL, NULL, N'/Content/img/electronics/electronic-3.png', N'electronic item img', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (36, N'electronic-4', 2, 5, NULL, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 19, NULL, NULL, N'/Content/img/electronics/electronic-4.png', N'electronic item img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (37, N'electronic-5', 2, 5, NULL, NULL, CAST(900 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 9, NULL, NULL, N'/Content/img/electronics/electronic-5.png', N'electronic item img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (38, N'electronic-6', 2, 5, NULL, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 4, NULL, NULL, N'/Content/img/electronics/electronic-6.png', N'electronic item img', 1, N'SOLD OUT!', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (39, N'electronic-7', 2, 5, NULL, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 2, NULL, NULL, N'/Content/img/electronics/electronic-7.png', N'electronic item img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (40, N'electronic-8', 2, 5, NULL, NULL, CAST(1500 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 11, NULL, NULL, N'/Content/img/electronics/electronic-1.png', N'electronic item img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
--SET IDENTITY_INSERT [dbo].[Products] OFF

SET IDENTITY_INSERT [dbo].[SubCategory] ON
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (1, 1, N'T-Shirts            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (2, 1, N'Shirts              ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (3, 1, N'Polo Shirts         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (4, 1, N'Jeans               ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (5, 1, N'Kurtas              ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (6, 1, N'Shalwar Kameez      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (7, 1, N'Casual Shoes        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (8, 1, N'Formal Shoes        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (11, 1, N'Boots               ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (12, 1, N'Hoodies             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (13, 1, N'Sweaters            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (14, 1, N'Watches             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (15, 1, N'Wallets             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (16, 1, N'Ties                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (17, 1, N'Cufflinks           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (18, 1, N'Sunglasses          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (19, 2, N'Kurtas              ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (20, 2, N'Shalwar Kameez      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (21, 2, N'Fabric              ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (22, 2, N'Tops                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (23, 2, N'Pants               ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (24, 2, N'Innerwear           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (25, 2, N'Flats & Sandals     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (26, 2, N'Heels               ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (27, 2, N'Jewellery           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (28, 2, N'Watches             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (29, 2, N'Bags                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (30, 2, N'Sunglasses          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (32, 3, N'Baby Care           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (33, 3, N'Baby Feeding        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (34, 3, N'Baby Bottles        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (35, 3, N'Educational Toys    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (36, 3, N'Remote Control Cars ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (37, 3, N'All Toys            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (38, 4, N'Men Wear            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (39, 4, N'Women Wear          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (40, 4, N'Kids Wear           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (41, 4, N'Fitness equipments  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (42, 4, N'Fitness Nutrition   ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (43, 5, N'All Brands          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (44, 5, N'IPhone              ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (45, 5, N'Samsung             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (46, 5, N'Nokia               ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (47, 5, N'QMobile             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (48, 5, N'Infinix             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (49, 6, N'Desktop Computer    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (51, 6, N'Laptop              ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (52, 6, N'Printers            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (53, 6, N'Hard Drives         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (54, 6, N'USB Drives          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (55, 6, N'Scanners            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (57, 6, N'Accessories         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (58, 7, N'Cooling & Heating   ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (59, 7, N'Refrigerators       ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (60, 7, N'Washers             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (61, 7, N'Cooking Appliances  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (62, 7, N'Blenders            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (63, 7, N'Ironing             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (64, 7, N'Beverage Preparation', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (65, 8, N'Face                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (66, 8, N'Eyes                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (67, 8, N'Lips                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (68, 8, N'Men Perfumes        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (69, 8, N'Women Perfumes      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (70, 8, N'Hair Care           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (71, 9, N'LED & LCD           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (72, 9, N'DVD Player          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (73, 9, N'Speakers            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (74, 9, N'Headphones          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (75, 9, N'MP3 Players         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (76, 10, N'Wifi                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (77, 10, N'Furniture           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (78, 10, N'Lighting            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (79, 10, N'Cameras             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (80, 10, N'Videos Games        ', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF

