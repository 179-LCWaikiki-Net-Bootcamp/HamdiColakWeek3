USE [master]
GO
/****** Object:  Database [eCommerce]    Script Date: 5/5/2022 10:32:46 PM ******/
CREATE DATABASE [eCommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eCommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER1\MSSQL\DATA\eCommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 15%)
 LOG ON 
( NAME = N'eCommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER1\MSSQL\DATA\eCommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 15%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [eCommerce] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eCommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eCommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eCommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eCommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eCommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eCommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [eCommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eCommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eCommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eCommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eCommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eCommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eCommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eCommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eCommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eCommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eCommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eCommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eCommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eCommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eCommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eCommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eCommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eCommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [eCommerce] SET  MULTI_USER 
GO
ALTER DATABASE [eCommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eCommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eCommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eCommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eCommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [eCommerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'eCommerce', N'ON'
GO
ALTER DATABASE [eCommerce] SET QUERY_STORE = OFF
GO
USE [eCommerce]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[Detail] [nvarchar](max) NULL,
	[CityId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AddressTypes]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressTypes](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_AddressTypes] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CountryId] [int] NOT NULL,
	[PostalCode] [nchar](10) NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Surname] [nvarchar](30) NULL,
	[BirthDate] [datetime] NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](11) NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deliveries]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deliveries](
	[DeliveryId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[StatusCode] [int] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[TruckId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_Deliveries] PRIMARY KEY CLUSTERED 
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](40) NULL,
	[PhoneNumber] [nvarchar](11) NULL,
	[AddressId] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryItems]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryItems](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[ReorderLevel] [int] NULL,
	[ReordeerQuantity] [int] NULL,
 CONSTRAINT [PK_InvetoryItems] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[StatusCodeId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[SupplierId] [int] NOT NULL,
	[Origin] [nvarchar](50) NULL,
	[Price] [decimal](8, 2) NULL,
	[CategoryId] [int] NULL,
	[BrandId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusCodeId]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusCodeId](
	[StatusCodeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_StatusCodeId] PRIMARY KEY CLUSTERED 
(
	[StatusCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](100) NULL,
	[AddressId] [int] NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trucks]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trucks](
	[TruckId] [int] IDENTITY(1,1) NOT NULL,
	[PlateNo] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_Trucks] PRIMARY KEY CLUSTERED 
(
	[TruckId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UIX_Customer_Id_Email]    Script Date: 5/5/2022 10:32:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Customer_Id_Email] ON [dbo].[Customers]
(
	[CustomerId] ASC,
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UIX_Product_DeliveryId_DeliveryDate]    Script Date: 5/5/2022 10:32:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Product_DeliveryId_DeliveryDate] ON [dbo].[Deliveries]
(
	[DeliveryId] ASC,
	[DeliveryDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UIX_Employee_Name_Surname]    Script Date: 5/5/2022 10:32:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Employee_Name_Surname] ON [dbo].[Employees]
(
	[Name] ASC,
	[Surname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UIX_Order_CustomerId_CreatedDate]    Script Date: 5/5/2022 10:32:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Order_CustomerId_CreatedDate] ON [dbo].[Orders]
(
	[CustomerId] ASC,
	[CreatedDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UIX_Product_CategoryId_BrandId]    Script Date: 5/5/2022 10:32:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Product_CategoryId_BrandId] ON [dbo].[Products]
(
	[CategoryId] ASC,
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_AddressTypes] FOREIGN KEY([TypeId])
REFERENCES [dbo].[AddressTypes] ([TypeId])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_AddressTypes]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Cities]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Addresses]
GO
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD  CONSTRAINT [FK_Deliveries_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Deliveries] CHECK CONSTRAINT [FK_Deliveries_Employees]
GO
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD  CONSTRAINT [FK_Deliveries_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Deliveries] CHECK CONSTRAINT [FK_Deliveries_Orders]
GO
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD  CONSTRAINT [FK_Deliveries_StatusCodeId] FOREIGN KEY([StatusCode])
REFERENCES [dbo].[StatusCodeId] ([StatusCodeId])
GO
ALTER TABLE [dbo].[Deliveries] CHECK CONSTRAINT [FK_Deliveries_StatusCodeId]
GO
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD  CONSTRAINT [FK_Deliveries_Trucks] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Trucks] ([TruckId])
GO
ALTER TABLE [dbo].[Deliveries] CHECK CONSTRAINT [FK_Deliveries_Trucks]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Addresses]
GO
ALTER TABLE [dbo].[InventoryItems]  WITH CHECK ADD  CONSTRAINT [FK_InvetoryItems_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[InventoryItems] CHECK CONSTRAINT [FK_InvetoryItems_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_StatusCodeId] FOREIGN KEY([StatusCodeId])
REFERENCES [dbo].[StatusCodeId] ([StatusCodeId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_StatusCodeId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [FK_Suppliers_Addresses]
GO
/****** Object:  StoredProcedure [dbo].[AddCustomer]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[AddCustomer]
@Name nvarchar(30),
@Surname nvarchar(30),
@BirthDate datetime,
@Email nvarchar(50),
@PhoneNumber nvarchar(11),
@AddressId int
as begin
insert into dbo.Customers(Name,Surname,BirthDate,Email,PhoneNumber,AddressId)
values(@Name,@Surname,@Email,@BirthDate,@PhoneNumber,@AddressId)
end


GO
/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[AddEmployee]
@Name nvarchar(50),
@Surname nvarchar(50),
@Email nvarchar(100),
@Password nvarchar(40),
@PhoneNumber nvarchar(11),
@AddressId int
as begin
insert into dbo.Employees(Name,Surname,Email,Password,PhoneNumber,AddressId)
values(@Name,@Surname,@Email,@Password,@PhoneNumber,@AddressId)
end
GO
/****** Object:  StoredProcedure [dbo].[AddOrder]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[AddOrder]
@CustomerId int,
@StatusCodeId int,
@CreatedDate datetime
as begin
insert into dbo.Orders(CustomerId,StatusCodeId,CreatedDate)
values(@CustomerId,@StatusCodeId,@CreatedDate)
end


GO
/****** Object:  StoredProcedure [dbo].[DeleteCustomer]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[DeleteCustomer]
@CustomerId int
as begin
delete from dbo.Customers where CustomerId=@CustomerId
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[DeleteEmployee]
@EmployeeId int
as begin
delete from dbo.Employees where EmployeeId=@EmployeeId
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteOrder]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[DeleteOrder]
@OrderId int
as begin
delete from dbo.Orders where OrderId=@OrderId
end
GO
/****** Object:  StoredProcedure [dbo].[GetCustomers]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[GetCustomers]
as begin
Select * from dbo.Customers
end
GO
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[GetEmployees]
as begin
Select * from dbo.Employees
end
GO
/****** Object:  StoredProcedure [dbo].[GetOrders]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[GetOrders]
as begin
Select * from dbo.Orders
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[UpdateCustomer]
@CustomerId int,
@Name nvarchar(30),
@Surname nvarchar(30),
@BirthDate datetime,
@Email nvarchar(50),
@PhoneNumber nvarchar(11),
@AddressId int
as begin
update dbo.Customers set Name=@Name, Surname=@Surname, BirthDate=@BirthDate, Email=@Email, PhoneNumber=@PhoneNumber, AddressId=@AddressId
where CustomerId = @CustomerId
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[UpdateEmployee]
@EmployeeId int,
@Name nvarchar(50),
@Surname nvarchar(50),
@Email nvarchar(100),
@Password nvarchar(40),
@PhoneNumber nvarchar(11),
@AddressId int
as begin
update dbo.Employees set Name=@Name, Surname=@Surname, Email=@Email, Password=@Password, PhoneNumber=@PhoneNumber, AddressId=@AddressId
where EmployeeId = @EmployeeId
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 5/5/2022 10:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[UpdateOrder]
@OrderId int,
@CustomerId int,
@StatusCodeId int,
@CreatedDate datetime
as begin
update dbo.Orders set CustomerId=@CustomerId, StatusCodeId=@StatusCodeId, CreatedDate=@CreatedDate
where OrderId = @OrderId
end
GO
USE [master]
GO
ALTER DATABASE [eCommerce] SET  READ_WRITE 
GO
