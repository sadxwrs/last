
CREATE DATABASE ProductionManagementEnhancedDB
GO
USE ProductionManagementEnhancedDB
GO
CREATE TABLE [dbo].[AgentType](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED ([ID] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MaterialType](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](50) NOT NULL,
    [DefectedPercent] [float] NOT NULL,
    CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED ([ID] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Supplier](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](150) NOT NULL,
    [INN] [varchar](12) NOT NULL,
    [StartDate] [date] NOT NULL,
    CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED ([ID] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SupplierDetails](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [SupplierID] [int] NOT NULL,
    [QualityRating] [int] NULL,
    [SupplierType] [nvarchar](20) NULL,
    CONSTRAINT [PK_SupplierDetails] PRIMARY KEY CLUSTERED ([ID] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Agent](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](150) NOT NULL,
    [AgentTypeID] [int] NOT NULL,
    [Priority] [int] NOT NULL,
    CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED ([ID] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AgentContact](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [AgentID] [int] NOT NULL,
    [Address] [nvarchar](300) NULL,
    [INN] [varchar](12) NOT NULL,
    [KPP] [varchar](9) NULL,
    [DirectorName] [nvarchar](100) NULL,
    [Phone] [nvarchar](20) NOT NULL,
    [Email] [nvarchar](255) NULL,
    [Logo] [nvarchar](100) NULL,
    CONSTRAINT [PK_AgentContact] PRIMARY KEY CLUSTERED ([ID] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AgentPriorityHistory](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [AgentID] [int] NOT NULL,
    [ChangeDate] [nvarchar](max),
    [PriorityValue] [int] NOT NULL,
    CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED ([ID] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Shop](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](150) NOT NULL,
    [Address] [nvarchar](300) NULL,
    [AgentID] [int] NOT NULL,
    CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED ([ID] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Product](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](100) NOT NULL,
    [ArticleNumber] [nvarchar](10) NOT NULL,
    [Description] [nvarchar](max) NULL,
    [Image] [nvarchar](100) NULL,
    [MinCostForAgent] [decimal](10, 2) NOT NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([ID] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[ProductSale](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [ProductID] [int] NOT NULL,
    [AgentID] [int] NOT NULL,
    [SaleDate] [nvarchar](max),
    [Quantity] [int] NOT NULL,
    [TotalCost] [decimal](10, 2) NOT NULL,
    CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED ([ID] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Request](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [AgentID] [int] NOT NULL,
    [RequestDate] [nvarchar](max),
    [Status] [nvarchar](20) NOT NULL,
    [PrepaymentDate] [datetime] NULL,
    [CompletionDate] [datetime] NULL,
    CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED ([ID] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RequestItem](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [RequestID] [int] NOT NULL,
    [ProductID] [int] NOT NULL,
    [Quantity] [int] NOT NULL,
    [Cost] [decimal](10, 2) NOT NULL,
    [ProductionTime] [int] NULL,
    CONSTRAINT [PK_RequestItem] PRIMARY KEY CLUSTERED ([ID] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Material](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](100) NOT NULL,
    [CountInPack] [int] NOT NULL,
    [Unit] [nvarchar](10) NOT NULL,
    [CountInStock] [float] NULL,
    [MinCount] [float] NOT NULL,
    [Description] [nvarchar](max) NULL,
    [Cost] [decimal](10, 2) NOT NULL,
    [Image] [nvarchar](100) NULL,
    [MaterialTypeID] [int] NOT NULL,
    CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED ([ID] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[MaterialSupplier](
    [MaterialID] [int] NOT NULL,
    [SupplierID] [int] NOT NULL,
    CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED ([MaterialID] ASC, [SupplierID] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Region](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](100) NOT NULL,
    [Code] [varchar](10) NOT NULL,
    [DeliveryMultiplier] [decimal](3,2) DEFAULT 1.0,
    [IsActive] [bit] DEFAULT 1,
    CONSTRAINT [PK_Region] PRIMARY KEY ([ID])
);
GO

CREATE TABLE [dbo].[City](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](100) NOT NULL,
    [RegionID] [int] NOT NULL,
    [PostalCode] [varchar](6),
    [Latitude] [decimal](9,6),
    [Longitude] [decimal](9,6),
    CONSTRAINT [PK_City] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_City_Region] FOREIGN KEY([RegionID]) REFERENCES [dbo].[Region]([ID])
);
GO

CREATE TABLE [dbo].[UserRole](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [RoleName] [nvarchar](50) NOT NULL,
    [Description] [nvarchar](255),
    [Permissions] [nvarchar](max),
    CONSTRAINT [PK_UserRole] PRIMARY KEY ([ID])
);
GO

CREATE TABLE [dbo].[User](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Login] [nvarchar](50) NOT NULL,
    [PasswordHash] [varchar](255) NOT NULL CONSTRAINT DF_User_PasswordHash DEFAULT 'default_hash',
    [Email] [nvarchar](255),
    [FirstName] [nvarchar](50),
    [LastName] [nvarchar](50),
    [MiddleName] [nvarchar](50),
    [Phone] [nvarchar](20),
    [IsActive] [bit] DEFAULT 1,
    [CreatedAt] [nvarchar](max),
    [LastLoginAt] [nvarchar](max),
    [FailedLoginCount] [int] DEFAULT 0,
    [UserRoleID] [int],
    CONSTRAINT [PK_User] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_User_UserRole] FOREIGN KEY([UserRoleID]) REFERENCES [dbo].[UserRole]([ID])
);
GO

CREATE TABLE [dbo].[Department](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](100) NOT NULL,
    [Description] [nvarchar](255),
    [HeadEmployeeID] [int],
    [IsActive] [bit] DEFAULT 1,
    CONSTRAINT [PK_Department] PRIMARY KEY ([ID])
);
GO

CREATE TABLE [dbo].[Position](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](100) NOT NULL,
    [Description] [nvarchar](255),
    [BaseSalary] [decimal](10,2),
    [RequiredExperience] [int],
    [IsActive] [bit] DEFAULT 1,
    CONSTRAINT [PK_Position] PRIMARY KEY ([ID])
);
GO

CREATE TABLE [dbo].[Employee](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [PersonalNumber] [varchar](20) NOT NULL,
    [FirstName] [nvarchar](50) NOT NULL,
    [LastName] [nvarchar](50) NOT NULL,
    [MiddleName] [nvarchar](50),
    [DepartmentID] [int] NOT NULL,
    [PositionID] [int] NOT NULL,
    [HireDate] [nvarchar](max),
    [IsActive] [bit] DEFAULT 1,
    [NFCCardID] [varchar](20),
    [Phone] [nvarchar](20),
    [Email] [nvarchar](255),
    CONSTRAINT [PK_Employee] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentID]) REFERENCES [dbo].[Department]([ID]),
    CONSTRAINT [FK_Employee_Position] FOREIGN KEY([PositionID]) REFERENCES [dbo].[Position]([ID])
);
GO

CREATE TABLE [dbo].[Shift](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](50) NOT NULL,
    [StartTime] [time] NOT NULL,
    [EndTime] [time] NOT NULL,
    [IsActive] [bit] DEFAULT 1,
    CONSTRAINT [PK_Shift] PRIMARY KEY ([ID])
);
GO

CREATE TABLE [dbo].[WorkSchedule](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [EmployeeID] [int] NOT NULL,
    [ShiftID] [int] NOT NULL,
    [WorkDate] [nvarchar](max),
    [IsPresent] [bit] DEFAULT NULL,
    CONSTRAINT [PK_WorkSchedule] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_WorkSchedule_Employee] FOREIGN KEY([EmployeeID]) REFERENCES [dbo].[Employee]([ID]),
    CONSTRAINT [FK_WorkSchedule_Shift] FOREIGN KEY([ShiftID]) REFERENCES [dbo].[Shift]([ID])
);
GO

CREATE TABLE [dbo].[NFCCard](
    [ID] [varchar](20) NOT NULL,
    [EmployeeID] [int] NOT NULL,
    [IssueDate] [nvarchar](max),
    [ExpiryDate] [nvarchar](max),
    [IsActive] [bit] DEFAULT 1,
    CONSTRAINT [PK_NFCCard] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_NFCCard_Employee] FOREIGN KEY([EmployeeID]) REFERENCES [dbo].[Employee]([ID])
);
GO

CREATE TABLE [dbo].[AccessPoint](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](100) NOT NULL,
    [Location] [nvarchar](255) NOT NULL,
    [Type] [nvarchar](50) NOT NULL,
    [IsActive] [bit] DEFAULT 1,
    CONSTRAINT [PK_AccessPoint] PRIMARY KEY ([ID])
);
GO

CREATE TABLE [dbo].[AccessLog](
    [ID] [bigint] IDENTITY(1,1) NOT NULL,
    [NFCCardID] [varchar](20) NOT NULL,
    [AccessPointID] [int] NOT NULL,
    [AccessTime] [nvarchar](max),
    [AccessType] [nvarchar](10) NOT NULL,
    [IsSuccessful] [bit] NOT NULL,
    CONSTRAINT [PK_AccessLog] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_AccessLog_NFCCard] FOREIGN KEY([NFCCardID]) REFERENCES [dbo].[NFCCard]([ID]),
    CONSTRAINT [FK_AccessLog_AccessPoint] FOREIGN KEY([AccessPointID]) REFERENCES [dbo].[AccessPoint]([ID])
);
GO

CREATE TABLE [dbo].[Workshop](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](100) NOT NULL,
    [Description] [nvarchar](255),
    [MaxCapacity] [int] NOT NULL,
    [IsActive] [bit] DEFAULT 1,
    CONSTRAINT [PK_Workshop] PRIMARY KEY ([ID])
);
GO

CREATE TABLE [dbo].[Equipment](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](100) NOT NULL,
    [SerialNumber] [varchar](20) NOT NULL,
    [WorkshopID] [int] NOT NULL,
    [Status] [nvarchar](20) NOT NULL,
    [RequiredSpecialization] [nvarchar](max),
    CONSTRAINT [PK_Equipment] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_Equipment_Workshop] FOREIGN KEY([WorkshopID]) REFERENCES [dbo].[Workshop]([ID])
);
GO

CREATE TABLE [dbo].[Order](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [OrderNumber] [nvarchar](20) NOT NULL,
    [AgentID] [int] NOT NULL,
    [CreateDate] [nvarchar](max),
    [OrderStatusID] [int] NOT NULL,
    [TotalAmount] [decimal](15,2) NOT NULL,
    [PaidAmount] [decimal](15,2) DEFAULT 0,
    [PaymentTypeID] [int] NOT NULL,
    [DeliveryAddress] [nvarchar](255),
    CONSTRAINT [PK_Order] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_Order_Agent] FOREIGN KEY([AgentID]) REFERENCES [dbo].[Agent]([ID])
);
GO

CREATE TABLE [dbo].[OrderStatus](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [StatusName] [nvarchar](50) NOT NULL,
    [Description] [nvarchar](255),
    CONSTRAINT [PK_OrderStatus] PRIMARY KEY ([ID])
);
GO

CREATE TABLE [dbo].[PaymentType](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [TypeName] [nvarchar](50) NOT NULL,
    [Description] [nvarchar](255),
    CONSTRAINT [PK_PaymentType] PRIMARY KEY ([ID])
);
GO

CREATE TABLE [dbo].[OrderItem](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [OrderID] [int] NOT NULL,
    [ProductID] [int] NOT NULL,
    [Quantity] [int] NOT NULL,
    [Cost] [decimal](10,2) NOT NULL,
    CONSTRAINT [PK_OrderItem] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([OrderID]) REFERENCES [dbo].[Order]([ID]),
    CONSTRAINT [FK_OrderItem_Product] FOREIGN KEY([ProductID]) REFERENCES [dbo].[Product]([ID])
);
GO

CREATE TABLE [dbo].[ProductionTask](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [OrderItemID] [int] NOT NULL,
    [WorkshopID] [int] NOT NULL,
    [ResponsibleEmployeeID] [int] NOT NULL,
    [PlannedStartDate] [nvarchar](max) NOT NULL,
    [PlannedEndDate] [nvarchar](max) NOT NULL,
    [Status] [nvarchar](20) NOT NULL,
    [Priority] [int] NOT NULL,
    [ActualEndDate] [datetime] NULL,
    CONSTRAINT [PK_ProductionTask] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_ProductionTask_OrderItem] FOREIGN KEY([OrderItemID]) REFERENCES [dbo].[OrderItem]([ID]),
    CONSTRAINT [FK_ProductionTask_Workshop] FOREIGN KEY([WorkshopID]) REFERENCES [dbo].[Workshop]([ID]),
    CONSTRAINT [FK_ProductionTask_Employee] FOREIGN KEY([ResponsibleEmployeeID]) REFERENCES [dbo].[Employee]([ID])
);
GO

CREATE TABLE [dbo].[Warehouse](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](100) NOT NULL,
    [Address] [nvarchar](255) NOT NULL,
    [ResponsibleEmployeeID] [int] NOT NULL,
    [IsActive] [bit] DEFAULT 1,
    CONSTRAINT [PK_Warehouse] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_Warehouse_Employee] FOREIGN KEY([ResponsibleEmployeeID]) REFERENCES [dbo].[Employee]([ID])
);
GO

CREATE TABLE [dbo].[WarehouseZone](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [WarehouseID] [int] NOT NULL,
    [ZoneName] [nvarchar](50) NOT NULL,
    [Temperature] [decimal](5,2) NOT NULL,
    [Humidity] [decimal](5,2) NOT NULL,
    [IsClimateControlled] [bit] NOT NULL,
    CONSTRAINT [PK_WarehouseZone] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_WarehouseZone_Warehouse] FOREIGN KEY([WarehouseID]) REFERENCES [dbo].[Warehouse]([ID])
);
GO

CREATE TABLE [dbo].[MaterialLocation](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [MaterialID] [int] NOT NULL,
    [WarehouseZoneID] [int] NOT NULL,
    [Quantity] [float] NOT NULL,
    [LastUpdate] [datetime] DEFAULT GETDATE(),
    CONSTRAINT [PK_MaterialLocation] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_MaterialLocation_Material] FOREIGN KEY([MaterialID]) REFERENCES [dbo].[Material]([ID]),
    CONSTRAINT [FK_MaterialLocation_WarehouseZone] FOREIGN KEY([WarehouseZoneID]) REFERENCES [dbo].[WarehouseZone]([ID])
);
GO

CREATE TABLE [dbo].[SystemLog](
    [ID] [bigint] IDENTITY(1,1) NOT NULL,
    [LogDate] [datetime] DEFAULT GETDATE(),
    [LogLevel] [varchar](10),
    [UserID] [int],
    [Action] [nvarchar](100),
    [TableName] [nvarchar](50),
    [RecordID] [int],
    [OldValues] [nvarchar](max),
    [NewValues] [nvarchar](max),
    [IPAddress] [varchar](45),
    [UserAgent] [nvarchar](255),
    CONSTRAINT [PK_SystemLog] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_SystemLog_User] FOREIGN KEY([UserID]) REFERENCES [dbo].[User]([ID])
);
GO

CREATE TABLE [dbo].[NotificationTemplate](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](100) NOT NULL,
    [Subject] [nvarchar](255),
    [Body] [nvarchar](max),
    [Type] [varchar](20),
    [IsActive] [bit] DEFAULT 1,
    CONSTRAINT [PK_NotificationTemplate] PRIMARY KEY ([ID])
);
GO

CREATE TABLE [dbo].[Notification](
    [ID] [bigint] IDENTITY(1,1) NOT NULL,
    [TemplateID] [int] NOT NULL,
    [RecipientID] [int] NOT NULL,
    [Subject] [nvarchar](255),
    [Body] [nvarchar](max),
    [Type] [varchar](20),
    [Status] [varchar](20),
    [CreateDate] [nvarchar](max),
    [SendDate] [nvarchar](max),
    [ReadDate] [nvarchar](max),
    [ErrorMessage] [nvarchar](255),
    CONSTRAINT [PK_Notification] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_Notification_Template] FOREIGN KEY([TemplateID]) REFERENCES [dbo].[NotificationTemplate]([ID])
);
GO

CREATE TABLE [dbo].[ReportTemplate](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](100) NOT NULL,
    [Description] [nvarchar](255),
    [SQLQuery] [nvarchar](max),
    [Parameters] [nvarchar](max),
    [CreatedBy] [int],
    [CreatedDate] [nvarchar](max),
    [IsActive] [bit] DEFAULT 1,
    CONSTRAINT [PK_ReportTemplate] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_ReportTemplate_User] FOREIGN KEY([CreatedBy]) REFERENCES [dbo].[User]([ID])
);
GO

CREATE TABLE [dbo].[AgentSalesPlan](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [AgentID] [int] NOT NULL,
    [Year] [int] NOT NULL,
    [Month] [int] NOT NULL,
    [PlannedAmount] [decimal](15,2),
    [ActualAmount] [decimal](15,2) DEFAULT 0,
    [BonusPercent] [decimal](5,2),
    [CreatedDate] [nvarchar](max),
    CONSTRAINT [PK_AgentSalesPlan] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_AgentSalesPlan_Agent] FOREIGN KEY([AgentID]) REFERENCES [dbo].[Agent]([ID])
);
GO

CREATE VIEW [dbo].[vw_SalesByAgent] AS
SELECT a.Title AS AgentTitle, SUM(ps.TotalCost) AS TotalSales
FROM [dbo].[Agent] a
LEFT JOIN [dbo].[ProductSale] ps ON a.ID = ps.AgentID
GROUP BY a.Title;
GO

CREATE VIEW [dbo].[vw_StockLevels] AS
SELECT m.Title AS MaterialTitle, ml.Quantity, w.Name AS WarehouseName, wz.ZoneName
FROM [dbo].[Material] m
JOIN [dbo].[MaterialLocation] ml ON m.ID = ml.MaterialID
JOIN [dbo].[WarehouseZone] wz ON ml.WarehouseZoneID = wz.ID
JOIN [dbo].[Warehouse] w ON wz.WarehouseID = w.ID
WHERE ml.Quantity < m.MinCount;
GO
ALTER TABLE [dbo].[Agent] WITH CHECK ADD CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID]) REFERENCES [dbo].[AgentType]([ID]);
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType];
GO

ALTER TABLE [dbo].[AgentContact] WITH CHECK ADD CONSTRAINT [FK_AgentContact_Agent] FOREIGN KEY([AgentID]) REFERENCES [dbo].[Agent]([ID]);
GO
ALTER TABLE [dbo].[AgentContact] CHECK CONSTRAINT [FK_AgentContact_Agent];
GO

ALTER TABLE [dbo].[AgentPriorityHistory] WITH CHECK ADD CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID]) REFERENCES [dbo].[Agent]([ID]);
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent];
GO

ALTER TABLE [dbo].[Shop] WITH CHECK ADD CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID]) REFERENCES [dbo].[Agent]([ID]);
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent];
GO

ALTER TABLE [dbo].[ProductSale] WITH CHECK ADD CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID]) REFERENCES [dbo].[Agent]([ID]);
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent];
GO

ALTER TABLE [dbo].[ProductSale] WITH CHECK ADD CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID]) REFERENCES [dbo].[Product]([ID]);
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product];
GO

ALTER TABLE [dbo].[Request] WITH CHECK ADD CONSTRAINT [FK_Request_Agent] FOREIGN KEY([AgentID]) REFERENCES [dbo].[Agent]([ID]);
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Agent];
GO

ALTER TABLE [dbo].[RequestItem] WITH CHECK ADD CONSTRAINT [FK_RequestItem_Request] FOREIGN KEY([RequestID]) REFERENCES [dbo].[Request]([ID]);
GO
ALTER TABLE [dbo].[RequestItem] CHECK CONSTRAINT [FK_RequestItem_Request];
GO

ALTER TABLE [dbo].[RequestItem] WITH CHECK ADD CONSTRAINT [FK_RequestItem_Product] FOREIGN KEY([ProductID]) REFERENCES [dbo].[Product]([ID]);
GO
ALTER TABLE [dbo].[RequestItem] CHECK CONSTRAINT [FK_RequestItem_Product];
GO

ALTER TABLE [dbo].[Material] WITH CHECK ADD CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID]) REFERENCES [dbo].[MaterialType]([ID]);
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType];
GO

ALTER TABLE [dbo].[MaterialSupplier] WITH CHECK ADD CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID]) REFERENCES [dbo].[Material]([ID]);
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material];
GO

ALTER TABLE [dbo].[MaterialSupplier] WITH CHECK ADD CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID]) REFERENCES [dbo].[Supplier]([ID]);
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier];
GO

ALTER TABLE [dbo].[SupplierDetails] WITH CHECK ADD CONSTRAINT [FK_SupplierDetails_Supplier] FOREIGN KEY([SupplierID]) REFERENCES [dbo].[Supplier]([ID]);
GO
ALTER TABLE [dbo].[SupplierDetails] CHECK CONSTRAINT [FK_SupplierDetails_Supplier];
GO
INSERT INTO [dbo].[AgentType] ([Title]) VALUES ('ООО'), ('ОАО'), ('ПАО'), ('ИП'), ('Самозанятый');
INSERT INTO [dbo].[MaterialType] ([Title], [DefectedPercent]) VALUES ('Гранулы', 5.0), ('Краски', 3.0), ('Нитки', 2.0);
INSERT INTO [dbo].[Supplier] ([Title], [INN], [StartDate]) VALUES 
    ('ГаражТелекомГор', '1718185951', '2011-12-20'), ('Компания Омск', '1878504395', '2012-09-13'), ('ГорМонтаж', '1564667734', '2016-12-23'),
    ('Микро', '2293562756', '2019-05-27'), ('Электро', '1755853973', '2015-06-16'), ('Компания Мотор', '1429908355', '2010-12-27'),
    ('Асбоцем', '1944834477', '2011-04-10'), ('ВостокМети', '1488487851', '2012-03-13'), ('МясКрепТеле', '2152486844', '2018-11-11'),
    ('Софт', '1036521658', '2011-11-23'), ('Компания СервисМикроО', '1178826599', '2012-07-07'), ('ИнфоГазМотор', '1954050214', '2011-07-23'),
    ('Монтаж', '1163880101', '2016-05-23'), ('ЭлектроЦвет', '1654184411', '2015-06-25'), ('Компания НефтьITИнф', '1685247455', '2017-03-09'),
    ('ТомскНефть', '1002996016', '2015-05-07'), ('ТомскТяжРеч', '1102143492', '2014-12-22'), ('УралХме', '2291253256', '2015-05-22'),
    ('ВодРыб', '1113468466', '2011-11-25'), ('УралСервисМон', '1892306757', '2016-12-20'), ('Казань', '1965011544', '2015-03-16'),
    ('Cиб', '1949139718', '2011-11-28'), ('ГаражГазМ', '1740623312', '2011-11-20'), ('МобайлДизайнОмск', '1014490629', '2019-10-28'),
    ('ЖелДорГаз', '1255275062', '2014-09-04'), ('ТверьБухГаз', '2167673760', '2013-11-13'), ('ТелекомТранс', '2200735978', '2015-01-11'),
    ('ГаражГлав', '1404774111', '2013-06-28'), ('Компания К', '1468114280', '2018-12-07'), ('ТяжЛифтВостокС', '1032089879', '2012-08-13'),
    ('Компания Во', '2027005945', '2016-06-22'), ('МоторКаз', '1076279398', '2015-08-23'), ('Сервис', '2031832854', '2011-11-25'),
    ('ЮпитерТомс', '1551173338', '2011-07-28'), ('Мор', '1906157177', '2011-03-06'), ('СеверТехВостокЛизинг', '1846812080', '2011-02-26'),
    ('ЦементОбл', '2021607106', '2015-10-03'), ('Компания КазаньАвтоCиб', '1371692583', '2015-10-19'), ('ГаражХозФлот', '2164720385', '2018-08-28'),
    ('Компания МорМетал', '1947163072', '2013-11-18'), ('ГлавРыб', '1426268088', '2018-11-09'), ('CибCибОрио', '1988313615', '2018-01-13'),
    ('ТелеРыбХм', '2299034130', '2012-02-10'), ('ГлавАвтоГазТрест', '2059691335', '2014-08-04'), ('ТяжКазаньБашкир', '1794419510', '2015-12-22'),
    ('Асбоцемент', '1650212184', '2018-12-09'), ('Мотор', '1019917089', '2017-04-24'), ('МорФинансФинансМаш', '1549496316', '2013-06-18'),
    ('РыбВектор', '2275526397', '2011-06-20'), ('Теле', '2170198203', '2010-05-01');
INSERT INTO [dbo].[SupplierDetails] ([SupplierID], [QualityRating], [SupplierType]) VALUES 
    (1, 36, 'МКК'), (2, 2, 'ОАО'), (3, 79, 'ООО'), (4, 64, 'МКК'), (5, 14, 'ЗАО'), (6, 50, 'ООО'), (7, 20, 'МФО'), (8, 58, 'ООО'),
    (9, 59, 'ПАО'), (10, 67, 'МКК'), (11, 5, 'ООО'), (12, 42, 'ОАО'), (13, 10, 'ОАО'), (14, 3, 'ОАО'), (15, 85, 'ООО'), (16, 95, 'ООО'),
    (17, 36, 'МФО'), (18, 82, 'ООО'), (19, 21, 'ЗАО'), (20, 26, 'МКК'), (21, 51, 'ОАО'), (22, 95, 'ОАО'), (23, 86, 'ОАО'), (24, 73, 'ООО'),
    (25, 76, 'МФО'), (26, 9, 'ОАО'), (27, 8, 'ОАО'), (28, 89, 'МКК'), (29, 70, 'ПАО'), (30, 66, 'ОАО'), (31, 11, 'ПАО'), (32, 37, 'ОАО'),
    (33, 25, 'ОАО'), (34, 60, 'ПАО'), (35, 82, 'МКК'), (36, 30, 'ООО'), (37, 42, 'ООО'), (38, 23, 'МКК'), (39, 7, 'ОАО'), (40, 33, 'ООО'),
    (41, 46, 'МФО'), (42, 95, 'ООО'), (43, 3, 'ООО'), (44, 18, 'МФО'), (45, 85, 'ПАО'), (46, 80, 'МФО'), (47, 19, 'ПАО'), (48, 68, 'ООО'),
    (49, 92, 'ОАО'), (50, 11, 'ПАО');
INSERT INTO [dbo].[Agent] ([Title], [AgentTypeID], [Priority]) VALUES 
    ('Агент 1', 1, 1), ('Агент 2', 2, 2), ('Агент 3', 3, 3), ('Агент 4', 4, 4), ('Агент 5', 5, 5);
INSERT INTO [dbo].[AgentContact] ([AgentID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo]) VALUES 
    (1, 'ул. Пример 1', '123456789012', '123456789', 'Иванов И.И.', '+7 (123) 456-78-90', 'ivanov@example.com', NULL),
    (2, 'ул. Пример 2', '987654321098', '987654321', 'Петров П.П.', '+7 (987) 654-32-10', 'petrov@example.com', NULL),
    (3, 'ул. Пример 3', '456789123012', '456789123', 'Сидоров С.С.', '+7 (456) 789-12-34', 'sidorov@example.com', NULL),
    (4, 'ул. Пример 4', '321098765432', '321098765', 'Козлов К.К.', '+7 (321) 098-76-54', 'kozlov@example.com', NULL),
    (5, 'ул. Пример 5', '789123456012', '789123456', 'Морозов М.М.', '+7 (789) 123-45-67', 'morozov@example.com', NULL);
INSERT INTO [dbo].[Material] ([Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES 
    ('Гранулы белый 2x2', 7, 'л', 76.0, 8.0, NULL, 47680.00, 'не указано', 1), ('Нить серый 1x0', 1, 'м', 978.0, 42.0, NULL, 27456.00, 'не указано', 3),
    ('Нить белый 1x3', 8, 'м', 406.0, 27.0, NULL, 2191.00, 'не указано', 3), ('Нить цветной 1x1', 3, 'г', 424.0, 10.0, NULL, 8619.00, '\materials\image_5.jpeg', 3),
    ('Нить цветной 2x0', 2, 'м', 395.0, 26.0, NULL, 16856.00, 'отсутствует', 3), ('Краска синий 2x2', 6, 'л', 334.0, 48.0, NULL, 403.00, 'не указано', 2),
    ('Нить синий 0x2', 9, 'м', 654.0, 10.0, NULL, 7490.00, 'отсутствует', 3), ('Гранулы серый 2x2', 7, 'л', 648.0, 17.0, NULL, 15478.00, 'не указано', 1),
    ('Краска синий 1x2', 2, 'л', 640.0, 50.0, NULL, 44490.00, 'отсутствует', 2), ('Нить зеленый 2x0', 5, 'м', 535.0, 45.0, NULL, 28301.00, '\materials\image_10.jpeg', 3),
    ('Гранулы синий 1x2', 3, 'кг', 680.0, 6.0, NULL, 9242.00, 'не указано', 1), ('Нить синий 3x2', 1, 'м', 529.0, 13.0, NULL, 10878.00, 'отсутствует', 3),
    ('Краска белый 2x2', 1, 'л', 659.0, 35.0, NULL, 29906.00, '\materials\image_3.jpeg', 2), ('Краска зеленый 0x3', 2, 'л', 50.0, 48.0, NULL, 24073.00, 'не указано', 2),
    ('Нить зеленый 2x3', 7, 'г', 649.0, 25.0, NULL, 20057.00, 'отсутствует', 3), ('Краска белый 2x1', 2, 'л', 790.0, 8.0, NULL, 3353.00, 'не указано', 2),
    ('Нить серый 2x3', 1, 'г', 431.0, 40.0, NULL, 22452.00, 'не указано', 3), ('Гранулы серый 3x2', 5, 'л', 96.0, 9.0, NULL, 29943.00, 'нет', 1),
    ('Краска серый 3x2', 3, 'л', 806.0, 50.0, NULL, 55064.00, 'отсутствует', 2), ('Гранулы белый 0x3', 3, 'кг', 538.0, 11.0, NULL, 7183.00, 'не указано', 1),
    ('Краска цветной 1x1', 3, 'л', 784.0, 22.0, NULL, 43466.00, 'отсутствует', 2), ('Гранулы белый 1x0', 3, 'кг', 980.0, 41.0, NULL, 27718.00, 'нет', 1),
    ('Краска серый 0x2', 3, 'кг', 679.0, 36.0, NULL, 33227.00, 'отсутствует', 2), ('Гранулы серый 3x3', 5, 'л', 2.0, 38.0, NULL, 15170.00, 'нет', 1),
    ('Краска серый 3x0', 7, 'кг', 341.0, 38.0, NULL, 19352.00, 'не указано', 2), ('Гранулы синий 2x1', 9, 'л', 273.0, 17.0, NULL, 231.00, '\materials\image_2.jpeg', 1),
    ('Гранулы синий 0x2', 9, 'л', 576.0, 36.0, NULL, 41646.00, 'не указано', 1), ('Нить цветной 1x0', 5, 'г', 91.0, 38.0, NULL, 24948.00, 'не указано', 3),
    ('Краска зеленый 2x2', 2, 'кг', 752.0, 36.0, NULL, 19014.00, 'не указано', 2), ('Краска цветной 1x3', 9, 'кг', 730.0, 5.0, NULL, 268.00, 'отсутствует', 2),
    ('Краска серый 2x0', 2, 'л', 131.0, 22.0, NULL, 35256.00, 'не указано', 2), ('Нить зеленый 2x1', 6, 'м', 802.0, 16.0, NULL, 34556.00, 'не указано', 3),
    ('Краска цветной 0x3', 10, 'л', 324.0, 9.0, NULL, 3322.00, 'нет', 2), ('Нить белый 2x3', 3, 'г', 283.0, 41.0, NULL, 10823.00, 'не указано', 3),
    ('Гранулы синий 3x0', 1, 'кг', 411.0, 8.0, NULL, 16665.00, 'не указано', 1), ('Гранулы синий 1x3', 8, 'л', 41.0, 30.0, NULL, 5668.00, 'нет', 1),
    ('Нить цветной 2x1', 3, 'м', 150.0, 22.0, NULL, 7615.00, 'нет', 3), ('Гранулы серый 3x0', 4, 'л', 0.0, 5.0, NULL, 702.00, '\materials\image_7.jpeg', 1),
    ('Краска синий 3x0', 7, 'л', 523.0, 42.0, NULL, 38644.00, 'нет', 2), ('Нить зеленый 0x0', 8, 'м', 288.0, 43.0, NULL, 41827.00, 'не указано', 3),
    ('Гранулы белый 1x2', 4, 'л', 77.0, 46.0, NULL, 8129.00, 'нет', 1), ('Kраска белый 3x0', 5, 'кг', 609.0, 48.0, NULL, 51471.00, 'нет', 2),
    ('Краска цветной 0x1', 6, 'л', 43.0, 8.0, NULL, 54401.00, 'отсутствует', 2), ('Нить серый 1x1', 5, 'м', 372.0, 22.0, NULL, 14474.00, 'отсутствует', 3),
    ('Kраска синий 2x1', 9, 'л', 642.0, 29.0, NULL, 46848.00, 'нет', 2), ('Нить серый 3x0', 1, 'м', 409.0, 19.0, NULL, 29503.00, 'отсутствует', 3),
    ('Краска зеленый 3x3', 6, 'л', 601.0, 32.0, NULL, 27710.00, 'отсутствует', 2), ('Краска синий 2x0', 7, 'л', 135.0, 50.0, NULL, 40074.00, 'отсутствует', 2),
    ('Гранулы синий 2x3', 2, 'л', 749.0, 45.0, NULL, 53482.00, 'не указано', 1), ('Нить синий 0x3', 8, 'м', 615.0, 22.0, NULL, 32087.00, 'не указано', 3),
    ('Нить синий 3x3', 7, 'г', 140.0, 12.0, NULL, 45774.00, 'отсутствует', 3), ('Краска зеленый 2x3', 2, 'л', 485.0, 8.0, NULL, 44978.00, 'нет', 2),
    ('Нить синий 3x0', 10, 'м', 67.0, 23.0, NULL, 44407.00, 'отсутствует', 3), ('Гранулы серый 2x1', 7, 'кг', 779.0, 44.0, NULL, 50339.00, 'нет', 1),
    ('Краска зеленый 0x1', 2, 'л', 869.0, 7.0, NULL, 30581.00, 'нет', 2), ('Краска синий 0x0', 8, 'кг', 796.0, 29.0, NULL, 18656.00, 'не указано', 2),
    ('Kраска серый 2x1', 5, 'л', 706.0, 45.0, NULL, 46579.00, 'отсутствует', 2), ('Нить белый 0x1', 10, 'м', 101.0, 43.0, NULL, 36883.00, 'не указано', 3),
    ('Гранулы зеленый 1x2', 9, 'л', 575.0, 15.0, NULL, 45083.00, 'нет', 1), ('Kраска серый 0x1', 2, 'л', 768.0, 27.0, NULL, 35063.00, 'не указано', 2),
    ('Гранулы цветной 0x1', 3, 'л', 746.0, 50.0, NULL, 24488.00, 'нет', 1), ('Гранулы белый 3x1', 8, 'л', 995.0, 27.0, NULL, 43711.00, 'отсутствует', 1),
    ('Нить зеленый 0x2', 2, 'м', 578.0, 20.0, NULL, 17429.00, 'отсутствует', 3), ('Гранулы зеленый 0x2', 4, 'л', 206.0, 34.0, NULL, 38217.00, 'нет', 1),
    ('Kраска цветной 1x2', 10, 'л', 299.0, 50.0, NULL, 47701.00, 'не указано', 2), ('Kраска зеленый 1x0', 8, 'кг', 626.0, 17.0, NULL, 52189.00, 'нет', 2),
    ('Гранулы серый 0x0', 5, 'л', 608.0, 12.0, NULL, 16715.00, 'не указано', 1), ('Гранулы синий 0x3', 5, 'кг', 953.0, 48.0, NULL, 45134.00, 'отсутствует', 1),
    ('Kраска цветной 2x1', 1, 'л', 325.0, 45.0, NULL, 1846.00, 'не указано', 2), ('Нить синий 2x3', 5, 'м', 10.0, 21.0, NULL, 43659.00, 'отсутствует', 3),
    ('Нить синий 2x1', 9, 'г', 948.0, 13.0, NULL, 12283.00, 'не указано', 3), ('Гранулы белый 1x1', 4, 'л', 93.0, 11.0, NULL, 6557.00, 'отсутствует', 1),
    ('Kраска синий 1x3', 6, 'кг', 265.0, 17.0, NULL, 38230.00, 'отсутствует', 2), ('Kраска зеленый 3x0', 2, 'л', 261.0, 7.0, NULL, 20226.00, '\materials\image_1.jpeg', 2),
    ('Нить зеленый 1x0', 9, 'г', 304.0, 43.0, NULL, 8105.00, 'не указано', 3), ('Kраска цветной 0x2', 7, 'л', 595.0, 38.0, NULL, 2600.00, 'нет', 2),
    ('Нить синий 3x1', 7, 'м', 579.0, 48.0, NULL, 4920.00, 'нет', 3), ('Kраска зеленый 0x2', 9, 'л', 139.0, 23.0, NULL, 39809.00, 'отсутствует', 2),
    ('Kраска синий 3x3', 6, 'кг', 740.0, 24.0, NULL, 46545.00, 'нет', 2), ('Kраска зеленый 1x1', 2, 'кг', 103.0, 34.0, NULL, 40583.00, '\materials\image_6.jpeg', 2),
    ('Kраска цветной 2x3', 9, 'л', 443.0, 46.0, NULL, 46502.00, 'не указано', 2), ('Нить цветной 3x0', 1, 'м', 989.0, 14.0, NULL, 53651.00, 'отсутствует', 3),
    ('Гранулы серый 2x3', 6, 'л', 467.0, 28.0, NULL, 47757.00, 'не указано', 1), ('Kраска белый 1x0', 6, 'л', 95.0, 6.0, NULL, 3543.00, 'нет', 2),
    ('Гранулы серый 3x1', 10, 'кг', 762.0, 6.0, NULL, 10899.00, 'не указано', 1), ('Гранулы серый 2x0', 3, 'кг', 312.0, 21.0, NULL, 8939.00, '\materials\image_8.jpeg', 1),
    ('Нить белый 0x2', 4, 'г', 43.0, 19.0, NULL, 29271.00, 'отсутствует', 3), ('Гранулы зеленый 1x1', 4, 'л', 10.0, 19.0, NULL, 46455.00, '\materials\image_4.jpeg', 1),
    ('Нить серый 0x2', 3, 'м', 504.0, 10.0, NULL, 45744.00, '\materials\image_9.jpeg', 3), ('Гранулы белый 0x2', 2, 'л', 581.0, 40.0, NULL, 9330.00, 'нет', 1),
    ('Нить цветной 3x2', 3, 'м', 831.0, 46.0, NULL, 2939.00, 'отсутствует', 3), ('Гранулы белый 3x0', 6, 'л', 208.0, 7.0, NULL, 50217.00, 'не указано', 1),
    ('Нить серый 1x2', 1, 'м', 292.0, 30.0, NULL, 30198.00, 'нет', 3), ('Kраска белый 0x1', 7, 'л', 423.0, 47.0, NULL, 19777.00, 'отсутствует', 2),
    ('Гранулы цветной 0x3', 7, 'кг', 723.0, 44.0, NULL, 1209.00, 'нет', 1), ('Нить серый 1x3', 1, 'г', 489.0, 25.0, NULL, 32002.00, 'отсутствует', 3),
    ('Гранулы белый 2x3', 4, 'л', 274.0, 8.0, NULL, 32446.00, 'нет', 1), ('Kраска зеленый 3x1', 10, 'л', 657.0, 19.0, NULL, 32487.00, 'отсутствует', 2),
    ('Гранулы цветной 3x2', 1, 'л', 32.0, 45.0, NULL, 28596.00, 'нет', 1), ('Нить белый 2x0', 2, 'м', 623.0, 23.0, NULL, 46684.00, 'отсутствует', 3);

INSERT INTO [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES 
    ((SELECT ID FROM [dbo].[Material] WHERE [Title] = 'Нить серый 1x2' AND [MaterialTypeID] = 3), (SELECT ID FROM [dbo].[Supplier] WHERE [Title] = 'Электро')),
    ((SELECT ID FROM [dbo].[Material] WHERE [Title] = 'Kраска цветной 2x1' AND [MaterialTypeID] = 2), (SELECT ID FROM [dbo].[Supplier] WHERE [Title] = 'ЮпитерТомс')),
    ((SELECT ID FROM [dbo].[Material] WHERE [Title] = 'Нить белый 2x0' AND [MaterialTypeID] = 3), (SELECT ID FROM [dbo].[Supplier] WHERE [Title] = 'Мор'));
INSERT INTO [dbo].[Region] ([Name], [Code], [DeliveryMultiplier], [IsActive]) VALUES 
('Центральный федеральный округ', 'ЦФО', 1.0, 1),
('Северо-Западный федеральный округ', 'СЗФО', 1.2, 1),
('Южный федеральный округ', 'ЮФО', 1.1, 1),
('Северо-Кавказский федеральный округ', 'СКФО', 1.3, 1),
('Приволжский федеральный округ', 'ПФО', 1.1, 1),
('Уральский федеральный округ', 'УФО', 1.2, 1),
('Сибирский федеральный округ', 'СФО', 1.4, 1),
('Дальневосточный федеральный округ', 'ДВФО', 1.6, 1);
INSERT INTO [dbo].[City] ([Name], [RegionID], [PostalCode], [Latitude], [Longitude]) VALUES 
('Москва', 1, '101000', 55.7558, 37.6176),
('Санкт-Петербург', 2, '190000', 59.9311, 30.3609),
('Новосибирск', 7, '630000', 55.0084, 82.9357),
('Екатеринбург', 6, '620000', 56.8431, 60.6454),
('Нижний Новгород', 5, '603000', 56.2965, 43.9361),
('Казань', 5, '420000', 55.8304, 49.0661),
('Челябинск', 6, '454000', 55.1644, 61.4368),
('Омск', 7, '644000', 54.9885, 73.3242),
('Самара', 5, '443000', 53.2001, 50.15),
('Ростов-на-Дону', 3, '344000', 47.2357, 39.7015),
('Уфа', 5, '450000', 54.7388, 55.9721),
('Красноярск', 7, '660000', 56.0184, 92.8672),
('Воронеж', 1, '394000', 51.6720, 39.1843),
('Пермь', 5, '614000', 58.0105, 56.2502),
('Волгоград', 3, '400000', 48.7080, 44.5133);
INSERT INTO [dbo].[UserRole] ([RoleName], [Description], [Permissions]) VALUES 
('Администратор', 'Полный доступ к системе', '{"users": "full", "orders": "full", "reports": "full", "settings": "full"}'),
('Менеджер', 'Управление агентами и заказами', '{"agents": "full", "orders": "full", "reports": "read"}'),
('Мастер производства', 'Управление производством', '{"production": "full", "warehouse": "full", "inventory": "full"}'),
('Аналитик', 'Анализ данных', '{"reports": "full", "data": "read", "analytics": "full"}'),
('Кладовщик', 'Складские операции', '{"warehouse": "full", "inventory": "full"}'),
('Агент', 'Просмотр своих данных', '{"profile": "read", "orders": "own"}'),
('Бухгалтер', 'Финансовые операции', '{"payments": "full", "reports": "financial", "agents": "read"}'),
('Оператор', 'Базовый доступ', '{"orders": "read", "materials": "read", "reports": "basic"}');
INSERT INTO [dbo].[Department] ([Name], [Description], [IsActive]) VALUES 
('Управление', 'Административные функции', 1),
('Производство', 'Изготовление продукции', 1),
('Склад', 'Складские операции', 1),
('Отдел продаж', 'Работа с агентами', 1),
('Аналитический отдел', 'Анализ и планирование', 1),
('Бухгалтерия', 'Финансовый учет', 1),
('IT-отдел', 'Техническая поддержка', 1),
('Отдел кадров', 'Управление персоналом', 1),
('Служба безопасности', 'Контроль доступа', 1),
('Логистика', 'Доставка и транспорт', 1);
INSERT INTO [dbo].[Position] ([Title], [Description], [BaseSalary], [RequiredExperience], [IsActive]) VALUES 
('Генеральный директор', 'Руководство компанией', 150000, 60, 1),
('Менеджер по продажам', 'Работа с агентами', 65000, 12, 1),
('Мастер производства', 'Контроль производства', 75000, 24, 1),
('Аналитик', 'Анализ данных', 55000, 6, 1),
('Кладовщик', 'Складские операции', 40000, 0, 1),
('Бухгалтер', 'Ведение учета', 50000, 12, 1),
('Системный администратор', 'IT поддержка', 70000, 24, 1),
('HR-менеджер', 'Управление персоналом', 60000, 12, 1),
('Охранник', 'Обеспечение безопасности', 35000, 0, 1),
('Водитель', 'Доставка продукции', 45000, 12, 1),
('Оператор производства', 'Работа на оборудовании', 42000, 3, 1),
('Контролер качества', 'Проверка продукции', 48000, 6, 1);
INSERT INTO [dbo].[User] ([Login], [Email], [FirstName], [LastName], [MiddleName], [UserRoleID], [IsActive]) VALUES 
('смирнов.к1', 'смирнов.к1@company.ru', 'Кирилл', 'Смирнов', 'Дмитриевич', 3, 1),
('соколов.т2', 'соколов.т2@company.ru', 'Татьяна', 'Соколов', 'Алексеевна', 4, 1),
('михайлова.д3', 'михайлова.д3@company.ru', 'Дмитрий', 'Михайлова', 'Максимович', 7, 1),
('смирнов.а4', 'смирнов.а4@company.ru', 'Алексей', 'Смирнов', 'Максимович', 7, 1),
('попова.а5', 'попова.а5@company.ru', 'Александр', 'Попова', 'Дмитриевич', 8, 1),
('михайлов.к6', 'михайлов.к6@company.ru', 'Кирилл', 'Михайлов', 'Сергеевна', 5, 1),
('соколова.т7', 'соколова.т7@company.ru', 'Татьяна', 'Соколова', 'Сергеевич', 8, 1),
('новикова.е8', 'новикова.е8@company.ru', 'Елена', 'Новикова', 'Александрович', 4, 1),
('михайлова.м9', 'михайлова.м9@company.ru', 'Мария', 'Михайлова', 'Александрович', 7, 1),
('иванова.с10', 'иванова.с10@company.ru', 'Светлана', 'Иванова', 'Андреевна', 5, 1),
('васильев.а11', 'васильев.а11@company.ru', 'Анна', 'Васильев', 'Андреевич', 2, 1),
('петров.м12', 'петров.м12@company.ru', 'Мария', 'Петров', 'Дмитриевич', 8, 1),
('новиков.и13', 'новиков.и13@company.ru', 'Илья', 'Новиков', 'Александрович', 8, 1),
('попова.а14', 'попова.а14@company.ru', 'Алексей', 'Попова', 'Александровна', 6, 1),
('попова.а15', 'попова.а15@company.ru', 'Анна', 'Попова', 'Дмитриевич', 3, 1),
('михайлов.м16', 'михайлов.м16@company.ru', 'Максим', 'Михайлов', 'Сергеевич', 4, 1);
INSERT INTO [dbo].[Employee] ([PersonalNumber], [FirstName], [LastName], [MiddleName], [DepartmentID], [PositionID], [HireDate], [IsActive], [NFCCardID]) VALUES 
('EMP001', 'Кирилл', 'Смирнов', 'Дмитриевич', 2, 3, '2022-06-15', 1, 'NFC001'),
('EMP002', 'Татьяна', 'Соколов', 'Алексеевна', 5, 4, '2023-01-10', 1, 'NFC002'),
('EMP003', 'Дмитрий', 'Михайлова', 'Максимович', 6, 6, '2021-09-20', 1, 'NFC003'),
('EMP004', 'Алексей', 'Смирнов', 'Максимович', 6, 6, '2020-11-05', 1, 'NFC004'),
('EMP005', 'Александр', 'Попова', 'Дмитриевич', 8, 8, '2023-03-12', 1, 'NFC005'),
('EMP006', 'Елена', 'Новикова', 'Александрович', 4, 2, '2022-08-01', 1, 'NFC006'),
('EMP007', 'Мария', 'Михайлова', 'Александрович', 6, 6, '2021-12-10', 1, 'NFC007'),
('EMP008', 'Светлана', 'Иванова', 'Андреевна', 5, 4, '2023-02-15', 1, 'NFC008'),
('EMP009', 'Анна', 'Васильев', 'Андреевич', 4, 2, '2022-07-20', 1, 'NFC009'),
('EMP010', 'Илья', 'Новиков', 'Александрович', 8, 8, '2023-04-05', 1, 'NFC010'),
('EMP011', 'Максим', 'Михайлов', 'Сергеевич', 7, 7, '2022-10-01', 1, 'NFC011'),
('EMP012', 'Татьяна', 'Соколова', 'Сергеевич', 8, 8, '2023-01-25', 1, 'NFC012'),
('EMP013', 'Кирилл', 'Михайлов', 'Сергеевна', 5, 4, '2022-09-15', 1, 'NFC013'),
('EMP014', 'Алексей', 'Попова', 'Александровна', 6, 6, '2021-10-20', 1, 'NFC014'),
('EMP015', 'Анна', 'Попова', 'Дмитриевич', 2, 3, '2022-05-10', 1, 'NFC015'),
('EMP016', 'Мария', 'Петров', 'Дмитриевич', 8, 8, '2023-03-01', 1, 'NFC016'),
('EMP017', 'Сергей', 'Иванов', 'Петрович', 2, 11, '2022-06-01', 1, 'NFC017'),
('EMP018', 'Ольга', 'Кузнецова', 'Викторовна', 3, 5, '2023-02-10', 1, 'NFC018'),
('EMP019', 'Денис', 'Сидоров', 'Александрович', 9, 9, '2022-08-15', 1, 'NFC019'),
('EMP020', 'Екатерина', 'Морозова', 'Сергеевна', 10, 10, '2023-01-05', 1, 'NFC020'),
('EMP021', 'Андрей', 'Петров', 'Иванович', 2, 12, '2022-07-01', 1, 'NFC021'),
('EMP022', 'Наталья', 'Смирнова', 'Алексеевна', 6, 6, '2021-11-10', 1, 'NFC022'),
('EMP023', 'Виктор', 'Козлов', 'Дмитриевич', 7, 7, '2022-12-01', 1, 'NFC023'),
('EMP024', 'Юлия', 'Новикова', 'Михайловна', 4, 2, '2023-03-20', 1, 'NFC024'),
('EMP025', 'Игорь', 'Васильев', 'Сергеевич', 3, 5, '2022-06-20', 1, 'NFC025'),
('EMP026', 'Оксана', 'Попова', 'Александровна', 2, 11, '2023-02-15', 1, 'NFC026'),
('EMP027', 'Геннадий', 'Иванов', 'Петрович', 9, 9, '2022-09-01', 1, 'NFC027'),
('EMP028', 'Тамара', 'Соколова', 'Викторовна', 10, 10, '2023-01-10', 1, 'NFC028'),
('EMP029', 'Роман', 'Михайлов', 'Андреевич', 5, 4, '2022-08-05', 1, 'NFC029'),
('EMP030', 'Елена', 'Кузнецова', 'Игоревна', 6, 6, '2021-12-15', 1, 'NFC030'),
('EMP031', 'Александр', 'Сидоров', 'Викторович', 2, 3, '2022-07-10', 1, 'NFC031'),
('EMP032', 'Ольга', 'Морозова', 'Алексеевна', 8, 8, '2023-03-25', 1, 'NFC032'),
('EMP033', 'Дмитрий', 'Петров', 'Сергеевич', 7, 7, '2022-11-01', 1, 'NFC033'),
('EMP034', 'Нина', 'Васильева', 'Ивановна', 4, 2, '2023-02-20', 1, 'NFC034'),
('EMP035', 'Владимир', 'Новиков', 'Александрович', 3, 5, '2022-06-25', 1, 'NFC035'),
('EMP036', 'Ирина', 'Попова', 'Дмитриевна', 2, 11, '2023-02-10', 1, 'NFC036'),
('EMP037', 'Павел', 'Иванов', 'Михайлович', 9, 9, '2022-09-10', 1, 'NFC037'),
('EMP038', 'Светлана', 'Соколова', 'Сергеевна', 10, 10, '2023-01-15', 1, 'NFC038'),
('EMP039', 'Константин', 'Михайлов', 'Андреевич', 5, 4, '2022-08-10', 1, 'NFC039'),
('EMP040', 'Анна', 'Кузнецова', 'Викторовна', 6, 6, '2021-12-20', 1, 'NFC040'),
('EMP041', 'Сергей', 'Сидоров', 'Петрович', 2, 12, '2022-07-15', 1, 'NFC041'),
('EMP042', 'Ольга', 'Морозова', 'Игоревна', 8, 8, '2023-03-30', 1, 'NFC042'),
('EMP043', 'Денис', 'Петров', 'Александрович', 7, 7, '2022-11-05', 1, 'NFC043'),
('EMP044', 'Екатерина', 'Васильева', 'Сергеевна', 4, 2, '2023-02-25', 1, 'NFC044'),
('EMP045', 'Виктор', 'Новиков', 'Михайлович', 3, 5, '2022-07-01', 1, 'NFC045'),
('EMP046', 'Юлия', 'Попова', 'Алексеевна', 2, 11, '2023-02-15', 1, 'NFC046'),
('EMP047', 'Игорь', 'Иванов', 'Петрович', 9, 9, '2022-09-15', 1, 'NFC047'),
('EMP048', 'Тамара', 'Соколова', 'Викторовна', 10, 10, '2023-01-20', 1, 'NFC048'),
('EMP049', 'Роман', 'Михайлов', 'Сергеевич', 5, 4, '2022-08-15', 1, 'NFC049'),
('EMP050', 'Елена', 'Кузнецова', 'Андреевна', 6, 6, '2021-12-25', 1, 'NFC050');
INSERT INTO [dbo].[Shift] ([Name], [StartTime], [EndTime], [IsActive]) VALUES 
('Утренняя смена', '08:00:00', '16:00:00', 1),
('Вечерняя смена', '16:00:00', '00:00:00', 1),
('Ночная смена', '00:00:00', '08:00:00', 1);
INSERT INTO [dbo].[WorkSchedule] ([EmployeeID], [ShiftID], [WorkDate], [IsPresent]) VALUES 
(1, 1, '2025-09-07', 1), (1, 2, '2025-09-08', 1), (1, 3, '2025-09-09', 0),
(2, 1, '2025-09-07', 1), (2, 2, '2025-09-08', 0), (2, 3, '2025-09-09', 1),
(3, 1, '2025-09-07', 1), (3, 2, '2025-09-08', 1), (3, 3, '2025-09-09', 1),
(4, 1, '2025-09-07', 0), (4, 2, '2025-09-08', 1), (4, 3, '2025-09-09', 1),
(5, 1, '2025-09-07', 1), (5, 2, '2025-09-08', 1), (5, 3, '2025-09-09', 0),
(6, 1, '2025-09-07', 1), (6, 2, '2025-09-08', 0), (6, 3, '2025-09-09', 1),
(7, 1, '2025-09-07', 1), (7, 2, '2025-09-08', 1), (7, 3, '2025-09-09', 1),
(8, 1, '2025-09-07', 0), (8, 2, '2025-09-08', 1), (8, 3, '2025-09-09', 1),
(9, 1, '2025-09-07', 1), (9, 2, '2025-09-08', 1), (9, 3, '2025-09-09', 0),
(10, 1, '2025-09-07', 1), (10, 2, '2025-09-08', 0), (10, 3, '2025-09-09', 1),
(11, 1, '2025-09-07', 1), (11, 2, '2025-09-08', 1), (11, 3, '2025-09-09', 1),
(12, 1, '2025-09-07', 0), (12, 2, '2025-09-08', 1), (12, 3, '2025-09-09', 1),
(13, 1, '2025-09-07', 1), (13, 2, '2025-09-08', 1), (13, 3, '2025-09-09', 0),
(14, 1, '2025-09-07', 1), (14, 2, '2025-09-08', 0), (14, 3, '2025-09-09', 1),
(15, 1, '2025-09-07', 1), (15, 2, '2025-09-08', 1), (15, 3, '2025-09-09', 1),
(16, 1, '2025-09-07', 0), (16, 2, '2025-09-08', 1), (16, 3, '2025-09-09', 1),
(17, 1, '2025-09-07', 1), (17, 2, '2025-09-08', 1), (17, 3, '2025-09-09', 0),
(18, 1, '2025-09-07', 1), (18, 2, '2025-09-08', 0), (18, 3, '2025-09-09', 1),
(19, 1, '2025-09-07', 1), (19, 2, '2025-09-08', 1), (19, 3, '2025-09-09', 1),
(20, 1, '2025-09-07', 0), (20, 2, '2025-09-08', 1), (20, 3, '2025-09-09', 1),
(21, 1, '2025-09-07', 1), (21, 2, '2025-09-08', 1), (21, 3, '2025-09-09', 0),
(22, 1, '2025-09-07', 1), (22, 2, '2025-09-08', 0), (22, 3, '2025-09-09', 1),
(23, 1, '2025-09-07', 1), (23, 2, '2025-09-08', 1), (23, 3, '2025-09-09', 1),
(24, 1, '2025-09-07', 0), (24, 2, '2025-09-08', 1), (24, 3, '2025-09-09', 1),
(25, 1, '2025-09-07', 1), (25, 2, '2025-09-08', 1), (25, 3, '2025-09-09', 0),
(26, 1, '2025-09-07', 1), (26, 2, '2025-09-08', 0), (26, 3, '2025-09-09', 1),
(27, 1, '2025-09-07', 1), (27, 2, '2025-09-08', 1), (27, 3, '2025-09-09', 1),
(28, 1, '2025-09-07', 0), (28, 2, '2025-09-08', 1), (28, 3, '2025-09-09', 1),
(29, 1, '2025-09-07', 1), (29, 2, '2025-09-08', 1), (29, 3, '2025-09-09', 0),
(30, 1, '2025-09-07', 1), (30, 2, '2025-09-08', 0), (30, 3, '2025-09-09', 1),
(31, 1, '2025-09-07', 1), (31, 2, '2025-09-08', 1), (31, 3, '2025-09-09', 1),
(32, 1, '2025-09-07', 0), (32, 2, '2025-09-08', 1), (32, 3, '2025-09-09', 1),
(33, 1, '2025-09-07', 1), (33, 2, '2025-09-08', 1), (33, 3, '2025-09-09', 0),
(34, 1, '2025-09-07', 1), (34, 2, '2025-09-08', 0), (34, 3, '2025-09-09', 1),
(35, 1, '2025-09-07', 1), (35, 2, '2025-09-08', 1), (35, 3, '2025-09-09', 1),
(36, 1, '2025-09-07', 0), (36, 2, '2025-09-08', 1), (36, 3, '2025-09-09', 1),
(37, 1, '2025-09-07', 1), (37, 2, '2025-09-08', 1), (37, 3, '2025-09-09', 0),
(38, 1, '2025-09-07', 1), (38, 2, '2025-09-08', 0), (38, 3, '2025-09-09', 1),
(39, 1, '2025-09-07', 1), (39, 2, '2025-09-08', 1), (39, 3, '2025-09-09', 1),
(40, 1, '2025-09-07', 0), (40, 2, '2025-09-08', 1), (40, 3, '2025-09-09', 1),
(41, 1, '2025-09-07', 1), (41, 2, '2025-09-08', 1), (41, 3, '2025-09-09', 0),
(42, 1, '2025-09-07', 1), (42, 2, '2025-09-08', 0), (42, 3, '2025-09-09', 1),
(43, 1, '2025-09-07', 1), (43, 2, '2025-09-08', 1), (43, 3, '2025-09-09', 1),
(44, 1, '2025-09-07', 0), (44, 2, '2025-09-08', 1), (44, 3, '2025-09-09', 1),
(45, 1, '2025-09-07', 1), (45, 2, '2025-09-08', 1), (45, 3, '2025-09-09', 0),
(46, 1, '2025-09-07', 1), (46, 2, '2025-09-08', 0), (46, 3, '2025-09-09', 1),
(47, 1, '2025-09-07', 1), (47, 2, '2025-09-08', 1), (47, 3, '2025-09-09', 1),
(48, 1, '2025-09-07', 0), (48, 2, '2025-09-08', 1), (48, 3, '2025-09-09', 1),
(49, 1, '2025-09-07', 1), (49, 2, '2025-09-08', 1), (49, 3, '2025-09-09', 0),
(50, 1, '2025-09-07', 1), (50, 2, '2025-09-08', 0), (50, 3, '2025-09-09', 1);
INSERT INTO [dbo].[NFCCard] ([ID], [EmployeeID], [IssueDate], [ExpiryDate], [IsActive]) VALUES 
('NFC001', 1, '2023-01-01', '2025-12-31', 1),
('NFC002', 2, '2023-02-01', '2025-12-31', 1),
('NFC003', 3, '2023-03-01', '2025-12-31', 1),
('NFC004', 4, '2023-04-01', '2025-12-31', 1),
('NFC005', 5, '2023-05-01', '2025-12-31', 1),
('NFC006', 6, '2023-06-01', '2025-12-31', 1),
('NFC007', 7, '2023-07-01', '2025-12-31', 1),
('NFC008', 8, '2023-08-01', '2025-12-31', 1),
('NFC009', 9, '2023-09-01', '2025-12-31', 1),
('NFC010', 10, '2023-10-01', '2025-12-31', 1),
('NFC011', 11, '2023-11-01', '2025-12-31', 1),
('NFC012', 12, '2023-12-01', '2025-12-31', 1),
('NFC013', 13, '2024-01-01', '2026-12-31', 1),
('NFC014', 14, '2024-02-01', '2026-12-31', 1),
('NFC015', 15, '2024-03-01', '2026-12-31', 1),
('NFC016', 16, '2024-04-01', '2026-12-31', 1),
('NFC017', 17, '2024-05-01', '2026-12-31', 1),
('NFC018', 18, '2024-06-01', '2026-12-31', 1),
('NFC019', 19, '2024-07-01', '2026-12-31', 1),
('NFC020', 20, '2024-08-01', '2026-12-31', 1),
('NFC021', 21, '2024-09-01', '2026-12-31', 1),
('NFC022', 22, '2024-10-01', '2026-12-31', 1),
('NFC023', 23, '2024-11-01', '2026-12-31', 1),
('NFC024', 24, '2024-12-01', '2026-12-31', 1),
('NFC025', 25, '2025-01-01', '2027-12-31', 1),
('NFC026', 26, '2025-02-01', '2027-12-31', 1),
('NFC027', 27, '2025-03-01', '2027-12-31', 1),
('NFC028', 28, '2025-04-01', '2027-12-31', 1),
('NFC029', 29, '2025-05-01', '2027-12-31', 1),
('NFC030', 30, '2025-06-01', '2027-12-31', 1),
('NFC031', 31, '2025-07-01', '2027-12-31', 1),
('NFC032', 32, '2025-08-01', '2027-12-31', 1),
('NFC033', 33, '2025-09-01', '2027-12-31', 1),
('NFC034', 34, '2025-10-01', '2027-12-31', 1),
('NFC035', 35, '2025-11-01', '2027-12-31', 1),
('NFC036', 36, '2025-12-01', '2027-12-31', 1),
('NFC037', 37, '2026-01-01', '2028-12-31', 1),
('NFC038', 38, '2026-02-01', '2028-12-31', 1),
('NFC039', 39, '2026-03-01', '2028-12-31', 1),
('NFC040', 40, '2026-04-01', '2028-12-31', 1),
('NFC041', 41, '2026-05-01', '2028-12-31', 1),
('NFC042', 42, '2026-06-01', '2028-12-31', 1),
('NFC043', 43, '2026-07-01', '2028-12-31', 1),
('NFC044', 44, '2026-08-01', '2028-12-31', 1),
('NFC045', 45, '2026-09-01', '2028-12-31', 1),
('NFC046', 46, '2026-10-01', '2028-12-31', 1),
('NFC047', 47, '2026-11-01', '2028-12-31', 1),
('NFC048', 48, '2026-12-01', '2028-12-31', 1),
('NFC049', 49, '2027-01-01', '2029-12-31', 1),
('NFC050', 50, '2027-02-01', '2029-12-31', 1);
INSERT INTO [dbo].[AccessPoint] ([Name], [Location], [Type], [IsActive]) VALUES 
('Вход в офис', 'Корпус А, этаж 1', 'Door', 1),
('Выход из офиса', 'Корпус А, этаж 1', 'Door', 1),
('Вход в цех', 'Корпус Б, цех 1', 'Gate', 1),
('Выход из цеха', 'Корпус Б, цех 1', 'Gate', 1),
('Складской вход', 'Корпус С, склад', 'Gate', 1),
('Вход в склад', 'Корпус С, склад', 'Door', 1),
('Выход из склада', 'Корпус С, склад', 'Door', 1),
('Вход в цех 2', 'Корпус Б, цех 2', 'Gate', 1),
('Выход из цех 2', 'Корпус Б, цех 2', 'Gate', 1),
('Административный вход', 'Корпус А, этаж 2', 'Door', 1);
INSERT INTO [dbo].[AccessLog] ([NFCCardID], [AccessPointID], [AccessTime], [AccessType], [IsSuccessful]) VALUES 
('NFC001', 1, '2024-01-01 08:02:41', 'IN', 1),
('NFC001', 6, '2024-01-01 10:04:41', 'OUT', 1),
('NFC001', 7, '2024-01-01 09:43:41', 'IN', 0),
('NFC001', 8, '2024-01-01 13:38:41', 'IN', 0),
('NFC001', 1, '2024-01-01 18:37:29', 'OUT', 1),
('NFC002', 1, '2024-01-01 09:43:41', 'IN', 1),
('NFC002', 3, '2024-01-01 13:03:41', 'OUT', 1),
('NFC002', 5, '2024-01-01 12:14:41', 'OUT', 1),
('NFC002', 7, '2024-01-01 11:34:41', 'OUT', 1),
('NFC002', 8, '2024-01-01 15:24:41', 'IN', 1),
('NFC002', 1, '2024-01-01 17:38:03', 'OUT', 1),
('NFC003', 1, '2024-01-01 09:23:46', 'IN', 1),
('NFC003', 7, '2024-01-01 15:17:46', 'IN', 1),
('NFC003', 3, '2024-01-01 10:57:46', 'IN', 1),
('NFC003', 3, '2024-01-01 12:04:46', 'IN', 1),
('NFC003', 4, '2024-01-01 15:44:46', 'IN', 1),
('NFC003', 1, '2024-01-01 16:20:59', 'OUT', 1),
('NFC004', 1, '2024-01-01 09:02:22', 'IN', 1),
('NFC004', 2, '2024-01-01 14:34:22', 'OUT', 1),
('NFC004', 10, '2024-01-01 15:35:22', 'OUT', 1),
('NFC004', 1, '2024-01-01 19:03:14', 'OUT', 1),
('NFC005', 1, '2024-01-01 07:10:35', 'IN', 1),
('NFC005', 4, '2024-01-01 14:50:35', 'OUT', 1),
('NFC006', 1, '2024-01-02 08:15:00', 'IN', 1),
('NFC006', 3, '2024-01-02 16:30:00', 'OUT', 1),
('NFC007', 5, '2024-01-03 09:00:00', 'IN', 1),
('NFC008', 2, '2024-01-03 17:00:00', 'OUT', 0),
('NFC009', 7, '2024-01-04 08:30:00', 'IN', 1),
('NFC010', 10, '2024-01-04 16:45:00', 'OUT', 1),
('NFC050', 1, '2025-10-06 23:59:59', 'OUT', 1);

INSERT INTO [dbo].[Workshop] ([Name], [Description], [MaxCapacity], [IsActive]) VALUES 
('Цех 1', 'Основной производственный цех', 100, 1),
('Цех 2', 'Сборка и упаковка', 80, 1),
('Цех 3', 'Хранение и контроль', 50, 1),
('Цех 4', 'Контроль качества', 30, 1),
('Цех 5', '3D печать и гравировка', 20, 1);

INSERT INTO [dbo].[Equipment] ([Name], [SerialNumber], [WorkshopID], [Status], [RequiredSpecialization]) VALUES 
('Станок токарный ТВ-320', 'SN001234', 1, 'Working', '["токарные работы"]'),
('Фрезерный станок ФС-250', 'SN001235', 1, 'Working', '["фрезерные работы"]'),
('Линия сборки ЛС-100', 'SN002001', 2, 'Working', '["сборка"]'),
('Пресс гидравлический ПГ-500', 'SN002002', 2, 'Working', '["прессование"]'),
('Упаковочная машина УМ-50', 'SN003001', 3, 'Working', '["упаковка"]'),
('Конвейер упаковки КУ-200', 'SN003002', 3, 'Working', '["упаковка"]'),
('Спектрометр анализа СА-М1', 'SN004001', 4, 'Working', '["контроль качества"]'),
('Микроскоп цифровой МЦ-100', 'SN004002', 4, 'Working', '["контроль качества"]'),
('3D принтер Прототип-1', 'SN005001', 5, 'Maintenance', '["3D печать"]'),
('Лазерный гравер ЛГ-20', 'SN005002', 5, 'Working', '["гравировка"]');

INSERT INTO [dbo].[Warehouse] ([Name], [Address], [ResponsibleEmployeeID], [IsActive]) VALUES 
('Основной склад', 'Складской комплекс корпус А', 25, 1),
('Склад готовой продукции', 'Складской комплекс корпус Б', 26, 1),
('Временный склад', 'Производственная площадка участок 3', 27, 1);

INSERT INTO [dbo].[WarehouseZone] ([WarehouseID], [ZoneName], [Temperature], [Humidity], [IsClimateControlled]) VALUES 
(1, 'Зона А1', 20.0, 45.0, 1),
(1, 'Зона А2', 18.0, 40.0, 1),
(1, 'Зона А3', 22.0, 50.0, 0),
(2, 'Зона Б1', 20.0, 45.0, 1),
(2, 'Зона Б2', 20.0, 45.0, 1),
(3, 'Зона В1', 15.0, 60.0, 0);


--------------------------------------------------
-- REWORK FIX: ensure referenced FK rows exist BEFORE inserting ProductionTask
-- Auto-generated fix: creates minimal rows for Product, Order, Department/Position, Workshop, Employee, OrderItem
--------------------------------------------------
GO
-- ensure a product exists and capture its ID
DECLARE @ProductID INT, @OrderID INT;
IF NOT EXISTS (SELECT 1 FROM [dbo].[Product])
BEGIN
    INSERT INTO [dbo].[Product] ([Title], [ArticleNumber], [Description], [Image], [MinCostForAgent])
    VALUES (N'Тестовый продукт (auto-created)', N'PR_AUTO', N'Auto-created product to satisfy FK', NULL, 1000.00);
END
SELECT TOP 1 @ProductID = [ID] FROM [dbo].[Product] ORDER BY [ID];

-- ensure OrderStatus and PaymentType exist (minimal)
IF NOT EXISTS (SELECT 1 FROM [dbo].[OrderStatus])
BEGIN
    INSERT INTO [dbo].[OrderStatus] ([StatusName]) VALUES (N'Создан'), (N'В работе'), (N'Завершен');
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[PaymentType])
BEGIN
    INSERT INTO [dbo].[PaymentType] ([TypeName]) VALUES (N'Наличные'), (N'Безналичный расчет');
END

-- ensure at least one Order exists and capture its ID
IF NOT EXISTS (SELECT 1 FROM [dbo].[Order])
BEGIN
    INSERT INTO [dbo].[Order] ([OrderNumber], [AgentID], [CreateDate], [OrderStatusID], [TotalAmount], [PaymentTypeID])
    VALUES (N'ORD_AUTO', 1, GETDATE(), (SELECT TOP 1 [ID] FROM [dbo].[OrderStatus] ORDER BY [ID]), 100.00, (SELECT TOP 1 [ID] FROM [dbo].[PaymentType] ORDER BY [ID]));
END
SELECT TOP 1 @OrderID = [ID] FROM [dbo].[Order] ORDER BY [ID];

-- ensure minimal Department (ID=1) and Position (ID=1) exist to satisfy Employee FKs
IF NOT EXISTS (SELECT 1 FROM [dbo].[Department] WHERE [ID] = 1)
BEGIN
    INSERT INTO [dbo].[Department] ([Name], [Description], [IsActive]) VALUES (N'AutoDept', N'Auto-created department for FK', 1);
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[Position] WHERE [ID] = 1)
BEGIN
    INSERT INTO [dbo].[Position] ([Title], [Description], [BaseSalary], [RequiredExperience], [IsActive]) VALUES (N'AutoPos', N'Auto-created position for FK', 1000.00, 0, 1);
END

-- Prepare table variables with referenced IDs from ProductionTask
DECLARE @NeededWorkshops TABLE (ID INT);
DECLARE @NeededEmployees TABLE (ID INT);
DECLARE @NeededOrderItems TABLE (ID INT);

-- Insert needed IDs (auto-generated from the ProductionTask insert tuples)
INSERT INTO @NeededWorkshops (ID) VALUES (1),(2),(3),(4),(5);
INSERT INTO @NeededEmployees (ID) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50);
INSERT INTO @NeededOrderItems (ID) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(188),(189),(190),(191),(192),(193),(194),(195),(196),(197),(198),(199),(200),(201),(202),(203),(204),(205),(206),(207),(208),(209),(210),(211),(212),(213),(214),(215),(216),(217),(218),(219),(220),(221),(222),(223),(224),(225),(226),(227),(228),(229),(230),(231),(232),(233),(234),(235),(236),(237),(238),(239),(240),(241),(242),(243),(244),(245),(246),(247),(248),(249),(250),(251),(252),(253),(254),(255),(256),(257),(258),(259),(260),(261),(262),(263),(264),(265),(266),(267),(268),(269),(270),(271),(272),(273),(274),(275),(276),(277),(278),(279),(280),(281),(282),(283),(284),(285),(286),(287),(288),(289),(290),(291),(292),(293),(294),(295),(296),(297),(298),(299),(300),(301),(302),(303),(304),(305),(306),(307),(308),(309),(310),(311),(312),(313),(314),(315),(316),(317),(318),(319),(320),(321),(322),(323),(324),(325),(326),(327),(328),(329),(330),(331),(332),(333),(334),(335),(336),(337),(338),(339),(340),(341),(342),(343),(344),(345),(346),(347),(348),(349),(350),(351),(352),(353),(354),(355),(356),(357),(358),(359),(360),(361),(362),(363),(364),(365),(366),(367),(368),(369),(370),(371),(372),(373),(374),(375),(376),(377),(378),(379),(380),(381),(382),(383),(384),(385),(386),(387),(388),(389),(390),(391),(392),(393),(394),(395),(396),(397),(398),(399),(400),(401),(402),(403),(404),(405),(406),(407),(408),(409),(410),(411),(412),(413),(414),(415),(416),(417),(418),(419),(420),(421),(422),(423),(424),(425),(426),(427),(428),(429),(430),(431),(432),(433),(434),(435),(436),(437),(438),(439),(440),(441),(442),(443),(444),(445),(446),(447),(448),(449),(450),(451),(452),(453),(454),(455),(456),(457),(458),(459),(460),(461),(462),(463),(464),(465),(466),(467),(468),(469),(470),(471),(472),(473),(474),(475),(476),(477),(478),(479),(480),(481),(482),(483),(484),(485),(486),(487),(488),(489),(490),(491),(492),(493),(494),(495),(496),(497),(498),(499),(500);

-- Create missing workshops with explicit IDs
DECLARE @wid INT;
WHILE EXISTS (SELECT 1 FROM @NeededWorkshops)
BEGIN
    SELECT TOP 1 @wid = ID FROM @NeededWorkshops;
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Workshop] WHERE [ID] = @wid)
    BEGIN
        SET IDENTITY_INSERT [dbo].[Workshop] ON;
        INSERT INTO [dbo].[Workshop] ([ID], [Name], [Description], [MaxCapacity], [IsActive])
        VALUES (@wid, N'Workshop_auto_' + CONVERT(nvarchar(20), @wid), N'Auto-created workshop to satisfy FK', 100, 1);
        SET IDENTITY_INSERT [dbo].[Workshop] OFF;
    END
    DELETE FROM @NeededWorkshops WHERE ID = @wid;
END

-- Create missing employees with explicit IDs (minimal required columns)
DECLARE @eid INT;
WHILE EXISTS (SELECT 1 FROM @NeededEmployees)
BEGIN
    SELECT TOP 1 @eid = ID FROM @NeededEmployees;
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Employee] WHERE [ID] = @eid)
    BEGIN
        SET IDENTITY_INSERT [dbo].[Employee] ON;
        INSERT INTO [dbo].[Employee] ([ID], [PersonalNumber], [FirstName], [LastName], [MiddleName], [DepartmentID], [PositionID], [HireDate], [IsActive])
        VALUES (@eid, 'EMP_AUTO_' + CONVERT(varchar(20), @eid), N'Auto', N'User' + CONVERT(nvarchar(20), @eid), NULL, 1, 1, CONVERT(nvarchar(max), GETDATE()), 1);
        SET IDENTITY_INSERT [dbo].[Employee] OFF;
    END
    DELETE FROM @NeededEmployees WHERE ID = @eid;
END

-- Create missing OrderItem rows with explicit IDs
DECLARE @oi INT;
WHILE EXISTS (SELECT 1 FROM @NeededOrderItems)
BEGIN
    SELECT TOP 1 @oi = ID FROM @NeededOrderItems;
    IF NOT EXISTS (SELECT 1 FROM [dbo].[OrderItem] WHERE [ID] = @oi)
    BEGIN
        -- Insert explicit ID into OrderItem, referencing @OrderID and @ProductID
        SET IDENTITY_INSERT [dbo].[OrderItem] ON;
        INSERT INTO [dbo].[OrderItem] ([ID], [OrderID], [ProductID], [Quantity], [Cost])
        VALUES (@oi, @OrderID, @ProductID, 1, 100.00);
        SET IDENTITY_INSERT [dbo].[OrderItem] OFF;
    END
    DELETE FROM @NeededOrderItems WHERE ID = @oi;
END

-- Reseed identities to avoid future duplicate identity values
DECLARE @maxID INT;
SELECT @maxID = MAX([ID]) FROM [dbo].[OrderItem];
IF @maxID IS NOT NULL
    DBCC CHECKIDENT ('[dbo].[OrderItem]', RESEED, @maxID);

SELECT @maxID = MAX([ID]) FROM [dbo].[Employee];
IF @maxID IS NOT NULL
    DBCC CHECKIDENT ('[dbo].[Employee]', RESEED, @maxID);

SELECT @maxID = MAX([ID]) FROM [dbo].[Workshop];
IF @maxID IS NOT NULL
    DBCC CHECKIDENT ('[dbo].[Workshop]', RESEED, @maxID);

GO
-- End of REWORK FIX
INSERT INTO [dbo].[ProductionTask] ([OrderItemID], [WorkshopID], [ResponsibleEmployeeID], [PlannedStartDate], [PlannedEndDate], [Status], [Priority]) VALUES 
(1, 1, 1, '2024-01-01', '2024-01-10', 'Completed', 5),
(2, 2, 2, '2024-01-02', '2024-01-12', 'InProgress', 3),
(3, 3, 3, '2024-01-03', '2024-01-13', 'Planned', 4),
(4, 4, 4, '2024-01-04', '2024-01-14', 'Completed', 2),
(5, 5, 5, '2024-01-05', '2024-01-15', 'InProgress', 1),
(6, 1, 1, '2024-01-06', '2024-01-16', 'Planned', 6),
(7, 2, 2, '2024-01-07', '2024-01-17', 'Completed', 7),
(8, 3, 3, '2024-01-08', '2024-01-18', 'InProgress', 8),
(9, 4, 4, '2024-01-09', '2024-01-19', 'Planned', 9),
(10, 5, 5, '2024-01-10', '2024-01-20', 'Completed', 10),
(11, 1, 6, '2024-01-11', '2024-01-21', 'InProgress', 2),
(12, 2, 7, '2024-01-12', '2024-01-22', 'Planned', 3),
(13, 3, 8, '2024-01-13', '2024-01-23', 'Completed', 4),
(14, 4, 9, '2024-01-14', '2024-01-24', 'InProgress', 5),
(15, 5, 10, '2024-01-15', '2024-01-25', 'Planned', 6),
(16, 1, 11, '2024-01-16', '2024-01-26', 'Completed', 7),
(17, 2, 12, '2024-01-17', '2024-01-27', 'InProgress', 8),
(18, 3, 13, '2024-01-18', '2024-01-28', 'Planned', 9),
(19, 4, 14, '2024-01-19', '2024-01-29', 'Completed', 10),
(20, 5, 15, '2024-01-20', '2024-01-30', 'InProgress', 1),
(21, 1, 16, '2024-02-01', '2024-02-11', 'Planned', 2),
(22, 2, 17, '2024-02-02', '2024-02-12', 'Completed', 3),
(23, 3, 18, '2024-02-03', '2024-02-13', 'InProgress', 4),
(24, 4, 19, '2024-02-04', '2024-02-14', 'Planned', 5),
(25, 5, 20, '2024-02-05', '2024-02-15', 'Completed', 6),
(26, 1, 21, '2024-02-06', '2024-02-16', 'InProgress', 7),
(27, 2, 22, '2024-02-07', '2024-02-17', 'Planned', 8),
(28, 3, 23, '2024-02-08', '2024-02-18', 'Completed', 9),
(29, 4, 24, '2024-02-09', '2024-02-19', 'InProgress', 10),
(30, 5, 25, '2024-02-10', '2024-02-20', 'Planned', 1),
(188, 1, 26, '2025-09-01', '2025-09-10', 'Planned', 5),
(189, 2, 27, '2025-09-02', '2025-09-11', 'InProgress', 6),
(190, 3, 28, '2025-09-03', '2025-09-12', 'Completed', 7),
(191, 4, 29, '2025-09-04', '2025-09-13', 'Planned', 8),
(192, 5, 30, '2025-09-05', '2025-09-14', 'InProgress', 9),
(193, 1, 31, '2025-09-06', '2025-09-15', 'Completed', 10),
(194, 2, 32, '2025-09-07', '2025-09-16', 'Planned', 1),
(195, 3, 33, '2025-09-08', '2025-09-17', 'InProgress', 2),
(196, 4, 34, '2025-09-09', '2025-09-18', 'Completed', 3),
(197, 5, 35, '2025-09-10', '2025-09-19', 'Planned', 4),
(198, 1, 36, '2025-09-11', '2025-09-20', 'InProgress', 5),
(199, 2, 37, '2025-09-12', '2025-09-21', 'Completed', 6),
(200, 3, 38, '2025-09-13', '2025-09-22', 'Planned', 7),
(201, 4, 39, '2025-09-14', '2025-09-23', 'InProgress', 8),
(202, 5, 40, '2025-09-15', '2025-09-24', 'Completed', 9),
(203, 1, 41, '2025-09-16', '2025-09-25', 'Planned', 10),
(204, 2, 42, '2025-09-17', '2025-09-26', 'InProgress', 1),
(205, 3, 43, '2025-09-18', '2025-09-27', 'Completed', 2),
(206, 4, 44, '2025-09-19', '2025-09-28', 'Planned', 3),
(207, 5, 45, '2025-09-20', '2025-09-29', 'InProgress', 4),
(208, 1, 46, '2025-09-21', '2025-09-30', 'Completed', 5),
(209, 2, 47, '2025-09-22', '2025-10-01', 'Planned', 6),
(210, 3, 48, '2025-09-23', '2025-10-02', 'InProgress', 7),
(211, 4, 49, '2025-09-24', '2025-10-03', 'Completed', 8),
(212, 5, 50, '2025-09-25', '2025-10-04', 'Planned', 9),
(213, 1, 1, '2025-09-26', '2025-10-05', 'InProgress', 10),
(214, 2, 2, '2025-09-27', '2025-10-06', 'Completed', 1),
(215, 3, 3, '2025-09-28', '2025-10-07', 'Planned', 2),
(216, 4, 4, '2025-09-29', '2025-10-08', 'InProgress', 3),
(217, 5, 5, '2025-09-30', '2025-10-09', 'Completed', 4),
(218, 1, 6, '2025-10-01', '2025-10-10', 'Planned', 5),
(219, 2, 7, '2025-10-02', '2025-10-11', 'InProgress', 6),
(220, 3, 8, '2025-10-03', '2025-10-12', 'Completed', 7),
(221, 4, 9, '2025-10-04', '2025-10-13', 'Planned', 8),
(222, 5, 10, '2025-10-05', '2025-10-14', 'InProgress', 9),
(223, 1, 11, '2025-10-06', '2025-10-15', 'Completed', 10),
(224, 2, 12, '2025-10-07', '2025-10-16', 'Planned', 1),
(225, 3, 13, '2025-10-08', '2025-10-17', 'InProgress', 2),
(226, 4, 14, '2025-10-09', '2025-10-18', 'Completed', 3),
(227, 5, 15, '2025-10-10', '2025-10-19', 'Planned', 4),
(228, 1, 16, '2025-10-11', '2025-10-20', 'InProgress', 5),
(229, 2, 17, '2025-10-12', '2025-10-21', 'Completed', 6),
(230, 3, 18, '2025-10-13', '2025-10-22', 'Planned', 7),
(231, 4, 19, '2025-10-14', '2025-10-23', 'InProgress', 8),
(232, 5, 20, '2025-10-15', '2025-10-24', 'Completed', 9),
(233, 1, 21, '2025-10-16', '2025-10-25', 'Planned', 10),
(234, 2, 22, '2025-10-17', '2025-10-26', 'InProgress', 1),
(235, 3, 23, '2025-10-18', '2025-10-27', 'Completed', 2),
(236, 4, 24, '2025-10-19', '2025-10-28', 'Planned', 3),
(237, 5, 25, '2025-10-20', '2025-10-29', 'InProgress', 4),
(238, 1, 26, '2025-10-21', '2025-10-30', 'Completed', 5),
(239, 2, 27, '2025-10-22', '2025-10-31', 'Planned', 6),
(240, 3, 28, '2025-10-23', '2025-11-01', 'InProgress', 7),
(241, 4, 29, '2025-10-24', '2025-11-02', 'Completed', 8),
(242, 5, 30, '2025-10-25', '2025-11-03', 'Planned', 9),
(243, 1, 31, '2025-10-26', '2025-11-04', 'InProgress', 10),
(244, 2, 32, '2025-10-27', '2025-11-05', 'Completed', 1),
(245, 3, 33, '2025-10-28', '2025-11-06', 'Planned', 2),
(246, 4, 34, '2025-10-29', '2025-11-07', 'InProgress', 3),
(247, 5, 35, '2025-10-30', '2025-11-08', 'Completed', 4),
(248, 1, 36, '2025-10-31', '2025-11-09', 'Planned', 5),
(249, 2, 37, '2025-11-01', '2025-11-10', 'InProgress', 6),
(250, 3, 38, '2025-11-02', '2025-11-11', 'Completed', 7),
(251, 4, 39, '2025-11-03', '2025-11-12', 'Planned', 8),
(252, 5, 40, '2025-11-04', '2025-11-13', 'InProgress', 9),
(253, 1, 41, '2025-11-05', '2025-11-14', 'Completed', 10),
(254, 2, 42, '2025-11-06', '2025-11-15', 'Planned', 1),
(255, 3, 43, '2025-11-07', '2025-11-16', 'InProgress', 2),
(256, 4, 44, '2025-11-08', '2025-11-17', 'Completed', 3),
(257, 5, 45, '2025-11-09', '2025-11-18', 'Planned', 4),
(258, 1, 46, '2025-11-10', '2025-11-19', 'InProgress', 5),
(259, 2, 47, '2025-11-11', '2025-11-20', 'Completed', 6),
(260, 3, 48, '2025-11-12', '2025-11-21', 'Planned', 7),
(261, 4, 49, '2025-11-13', '2025-11-22', 'InProgress', 8),
(262, 5, 50, '2025-11-14', '2025-11-23', 'Completed', 9),
(263, 1, 1, '2025-11-15', '2025-11-24', 'Planned', 10),
(264, 2, 2, '2025-11-16', '2025-11-25', 'InProgress', 1),
(265, 3, 3, '2025-11-17', '2025-11-26', 'Completed', 2),
(266, 4, 50, '2025-11-18', '2025-11-27', 'InProgress', 3),
(267, 5, 1, '2025-11-19', '2025-11-28', 'Completed', 4),
(268, 1, 2, '2025-11-20', '2025-11-29', 'Planned', 5),
(269, 2, 3, '2025-11-21', '2025-11-30', 'InProgress', 6),
(270, 3, 4, '2025-11-22', '2025-12-01', 'Completed', 7),
(271, 4, 5, '2025-11-23', '2025-12-02', 'Planned', 8),
(272, 5, 6, '2025-11-24', '2025-12-03', 'InProgress', 9),
(273, 1, 7, '2025-11-25', '2025-12-04', 'Completed', 10),
(274, 2, 8, '2025-11-26', '2025-12-05', 'Planned', 1),
(275, 3, 9, '2025-11-27', '2025-12-06', 'InProgress', 2),
(276, 4, 10, '2025-11-28', '2025-12-07', 'Completed', 3),
(277, 5, 11, '2025-11-29', '2025-12-08', 'Planned', 4),
(278, 1, 12, '2025-11-30', '2025-12-09', 'InProgress', 5),
(279, 2, 13, '2025-12-01', '2025-12-10', 'Completed', 6),
(280, 3, 14, '2025-12-02', '2025-12-11', 'Planned', 7),
(281, 4, 15, '2025-12-03', '2025-12-12', 'InProgress', 8),
(282, 5, 16, '2025-12-04', '2025-12-13', 'Completed', 9),
(283, 1, 17, '2025-12-05', '2025-12-14', 'Planned', 10),
(284, 2, 18, '2025-12-06', '2025-12-15', 'InProgress', 1),
(285, 3, 19, '2025-12-07', '2025-12-16', 'Completed', 2),
(286, 4, 20, '2025-12-08', '2025-12-17', 'Planned', 3),
(287, 5, 21, '2025-12-09', '2025-12-18', 'InProgress', 4),
(288, 1, 22, '2025-12-10', '2025-12-19', 'Completed', 5),
(289, 2, 23, '2025-12-11', '2025-12-20', 'Planned', 6),
(290, 3, 24, '2025-12-12', '2025-12-21', 'InProgress', 7),
(291, 4, 25, '2025-12-13', '2025-12-22', 'Completed', 8),
(292, 5, 26, '2025-12-14', '2025-12-23', 'Planned', 9),
(293, 1, 27, '2025-12-15', '2025-12-24', 'InProgress', 10),
(294, 2, 28, '2025-12-16', '2025-12-25', 'Completed', 1),
(295, 3, 29, '2025-12-17', '2025-12-26', 'Planned', 2),
(296, 4, 30, '2025-12-18', '2025-12-27', 'InProgress', 3),
(297, 5, 31, '2025-12-19', '2025-12-28', 'Completed', 4),
(298, 1, 32, '2025-12-20', '2025-12-29', 'Planned', 5),
(299, 2, 33, '2025-12-21', '2025-12-30', 'InProgress', 6),
(300, 3, 34, '2025-12-22', '2025-12-31', 'Completed', 7),
(301, 4, 35, '2025-12-23', '2026-01-01', 'Planned', 8),
(302, 5, 36, '2025-12-24', '2026-01-02', 'InProgress', 9),
(303, 1, 37, '2025-12-25', '2026-01-03', 'Completed', 10),
(304, 2, 38, '2025-12-26', '2026-01-04', 'Planned', 1),
(305, 3, 39, '2025-12-27', '2026-01-05', 'InProgress', 2),
(306, 4, 40, '2025-12-28', '2026-01-06', 'Completed', 3),
(307, 5, 41, '2025-12-29', '2026-01-07', 'Planned', 4),
(308, 1, 42, '2025-12-30', '2026-01-08', 'InProgress', 5),
(309, 2, 43, '2025-12-31', '2026-01-09', 'Completed', 6),
(310, 3, 44, '2026-01-01', '2026-01-10', 'Planned', 7),
(311, 4, 45, '2026-01-02', '2026-01-11', 'InProgress', 8),
(312, 5, 46, '2026-01-03', '2026-01-12', 'Completed', 9),
(313, 1, 47, '2026-01-04', '2026-01-13', 'Planned', 10),
(314, 2, 48, '2026-01-05', '2026-01-14', 'InProgress', 1),
(315, 3, 49, '2026-01-06', '2026-01-15', 'Completed', 2),
(316, 4, 50, '2026-01-07', '2026-01-16', 'Planned', 3),
(317, 5, 1, '2026-01-08', '2026-01-17', 'InProgress', 4),
(318, 1, 2, '2026-01-09', '2026-01-18', 'Completed', 5),
(319, 2, 3, '2026-01-10', '2026-01-19', 'Planned', 6),
(320, 3, 4, '2026-01-11', '2026-01-20', 'InProgress', 7),
(321, 4, 5, '2026-01-12', '2026-01-21', 'Completed', 8),
(322, 5, 6, '2026-01-13', '2026-01-22', 'Planned', 9),
(323, 1, 7, '2026-01-14', '2026-01-23', 'InProgress', 10),
(324, 2, 8, '2026-01-15', '2026-01-24', 'Completed', 1),
(325, 3, 9, '2026-01-16', '2026-01-25', 'Planned', 2),
(326, 4, 10, '2026-01-17', '2026-01-26', 'InProgress', 3),
(327, 5, 11, '2026-01-18', '2026-01-27', 'Completed', 4),
(328, 1, 12, '2026-01-19', '2026-01-28', 'Planned', 5),
(329, 2, 13, '2026-01-20', '2026-01-29', 'InProgress', 6),
(330, 3, 14, '2026-01-21', '2026-01-30', 'Completed', 7),
(331, 4, 15, '2026-01-22', '2026-01-31', 'Planned', 8),
(332, 5, 16, '2026-01-23', '2026-02-01', 'InProgress', 9),
(333, 1, 17, '2026-01-24', '2026-02-02', 'Completed', 10),
(334, 2, 18, '2026-01-25', '2026-02-03', 'Planned', 1),
(335, 3, 19, '2026-01-26', '2026-02-04', 'InProgress', 2),
(336, 4, 20, '2026-01-27', '2026-02-05', 'Completed', 3),
(337, 5, 21, '2026-01-28', '2026-02-06', 'Planned', 4),
(338, 1, 22, '2026-01-29', '2026-02-07', 'InProgress', 5),
(339, 2, 23, '2026-01-30', '2026-02-08', 'Completed', 6),
(340, 3, 24, '2026-01-31', '2026-02-09', 'Planned', 7),
(341, 4, 25, '2026-02-01', '2026-02-10', 'InProgress', 8),
(342, 5, 26, '2026-02-02', '2026-02-11', 'Completed', 9),
(343, 1, 27, '2026-02-03', '2026-02-12', 'Planned', 10),
(344, 2, 28, '2026-02-04', '2026-02-13', 'InProgress', 1),
(345, 3, 29, '2026-02-05', '2026-02-14', 'Completed', 2),
(346, 4, 30, '2026-02-06', '2026-02-15', 'Planned', 3),
(347, 5, 31, '2026-02-07', '2026-02-16', 'InProgress', 4),
(348, 1, 32, '2026-02-08', '2026-02-17', 'Completed', 5),
(349, 2, 33, '2026-02-09', '2026-02-18', 'Planned', 6),
(350, 3, 34, '2026-02-10', '2026-02-19', 'InProgress', 7),
(351, 4, 35, '2026-02-11', '2026-02-20', 'Completed', 8),
(352, 5, 36, '2026-02-12', '2026-02-21', 'Planned', 9),
(353, 1, 37, '2026-02-13', '2026-02-22', 'InProgress', 10),
(354, 2, 38, '2026-02-14', '2026-02-23', 'Completed', 1),
(355, 3, 39, '2026-02-15', '2026-02-24', 'Planned', 2),
(356, 4, 40, '2026-02-16', '2026-02-25', 'InProgress', 3),
(357, 5, 41, '2026-02-17', '2026-02-26', 'Completed', 4),
(358, 1, 42, '2026-02-18', '2026-02-27', 'Planned', 5),
(359, 2, 43, '2026-02-19', '2026-02-28', 'InProgress', 6),
(360, 3, 44, '2026-02-20', '2026-03-01', 'Completed', 7),
(361, 4, 45, '2026-02-21', '2026-03-02', 'Planned', 8),
(362, 5, 46, '2026-02-22', '2026-03-03', 'InProgress', 9),
(363, 1, 47, '2026-02-23', '2026-03-04', 'Completed', 10),
(364, 2, 48, '2026-02-24', '2026-03-05', 'Planned', 1),
(365, 3, 49, '2026-02-25', '2026-03-06', 'InProgress', 2),
(366, 4, 50, '2026-02-26', '2026-03-07', 'Completed', 3),
(367, 5, 1, '2026-02-27', '2026-03-08', 'Planned', 4),
(368, 1, 2, '2026-02-28', '2026-03-09', 'InProgress', 5),
(369, 2, 3, '2026-03-01', '2026-03-10', 'Completed', 6),
(370, 3, 4, '2026-03-02', '2026-03-11', 'Planned', 7),
(371, 4, 5, '2026-03-03', '2026-03-12', 'InProgress', 8),
(372, 5, 6, '2026-03-04', '2026-03-13', 'Completed', 9),
(373, 1, 7, '2026-03-05', '2026-03-14', 'Planned', 10),
(374, 2, 8, '2026-03-06', '2026-03-15', 'InProgress', 1),
(375, 3, 9, '2026-03-07', '2026-03-16', 'Completed', 2),
(376, 4, 10, '2026-03-08', '2026-03-17', 'Planned', 3),
(377, 5, 11, '2026-03-09', '2026-03-18', 'InProgress', 4),
(378, 1, 12, '2026-03-10', '2026-03-19', 'Completed', 5),
(379, 2, 13, '2026-03-11', '2026-03-20', 'Planned', 6),
(380, 3, 14, '2026-03-12', '2026-03-21', 'InProgress', 7),
(381, 4, 15, '2026-03-13', '2026-03-22', 'Completed', 8),
(382, 5, 16, '2026-03-14', '2026-03-23', 'Planned', 9),
(383, 1, 17, '2026-03-15', '2026-03-24', 'InProgress', 10),
(384, 2, 18, '2026-03-16', '2026-03-25', 'Completed', 1),
(385, 3, 19, '2026-03-17', '2026-03-26', 'Planned', 2),
(386, 4, 20, '2026-03-18', '2026-03-27', 'InProgress', 3),
(387, 5, 21, '2026-03-19', '2026-03-28', 'Completed', 4),
(388, 1, 22, '2026-03-20', '2026-03-29', 'Planned', 5),
(389, 2, 23, '2026-03-21', '2026-03-30', 'InProgress', 6),
(390, 3, 24, '2026-03-22', '2026-03-31', 'Completed', 7),
(391, 4, 25, '2026-03-23', '2026-04-01', 'Planned', 8),
(392, 5, 26, '2026-03-24', '2026-04-02', 'InProgress', 9),
(393, 1, 27, '2026-03-25', '2026-04-03', 'Completed', 10),
(394, 2, 28, '2026-03-26', '2026-04-04', 'Planned', 1),
(395, 3, 29, '2026-03-27', '2026-04-05', 'InProgress', 2),
(396, 4, 30, '2026-03-28', '2026-04-06', 'Completed', 3),
(397, 5, 31, '2026-03-29', '2026-04-07', 'Planned', 4),
(398, 1, 32, '2026-03-30', '2026-04-08', 'InProgress', 5),
(399, 2, 33, '2026-03-31', '2026-04-09', 'Completed', 6),
(400, 3, 34, '2026-04-01', '2026-04-10', 'Planned', 7),
(401, 4, 35, '2026-04-02', '2026-04-11', 'InProgress', 8),
(402, 5, 36, '2026-04-03', '2026-04-12', 'Completed', 9),
(403, 1, 37, '2026-04-04', '2026-04-13', 'Planned', 10),
(404, 2, 38, '2026-04-05', '2026-04-14', 'InProgress', 1),
(405, 3, 39, '2026-04-06', '2026-04-15', 'Completed', 2),
(406, 4, 40, '2026-04-07', '2026-04-16', 'Planned', 3),
(407, 5, 41, '2026-04-08', '2026-04-17', 'InProgress', 4),
(408, 1, 42, '2026-04-09', '2026-04-18', 'Completed', 5),
(409, 2, 43, '2026-04-10', '2026-04-19', 'Planned', 6),
(410, 3, 44, '2026-04-11', '2026-04-20', 'InProgress', 7),
(411, 4, 45, '2026-04-12', '2026-04-21', 'Completed', 8),
(412, 5, 46, '2026-04-13', '2026-04-22', 'Planned', 9),
(413, 1, 47, '2026-04-14', '2026-04-23', 'InProgress', 10),
(414, 2, 48, '2026-04-15', '2026-04-24', 'Completed', 1),
(415, 3, 49, '2026-04-16', '2026-04-25', 'Planned', 2),
(416, 4, 50, '2026-04-17', '2026-04-26', 'InProgress', 3),
(417, 5, 1, '2026-04-18', '2026-04-27', 'Completed', 4),
(418, 1, 2, '2026-04-19', '2026-04-28', 'Planned', 5),
(419, 2, 3, '2026-04-20', '2026-04-29', 'InProgress', 6),
(420, 3, 4, '2026-04-21', '2026-04-30', 'Completed', 7),
(421, 4, 5, '2026-04-22', '2026-05-01', 'Planned', 8),
(422, 5, 6, '2026-04-23', '2026-05-02', 'InProgress', 9),
(423, 1, 7, '2026-04-24', '2026-05-03', 'Completed', 10),
(424, 2, 8, '2026-04-25', '2026-05-04', 'Planned', 1),
(425, 3, 9, '2026-04-26', '2026-05-05', 'InProgress', 2),
(426, 4, 10, '2026-04-27', '2026-05-06', 'Completed', 3),
(427, 5, 11, '2026-04-28', '2026-05-07', 'Planned', 4),
(428, 1, 12, '2026-04-29', '2026-05-08', 'InProgress', 5),
(429, 2, 13, '2026-04-30', '2026-05-09', 'Completed', 6),
(430, 3, 14, '2026-05-01', '2026-05-10', 'Planned', 7),
(431, 4, 15, '2026-05-02', '2026-05-11', 'InProgress', 8),
(432, 5, 16, '2026-05-03', '2026-05-12', 'Completed', 9),
(433, 1, 17, '2026-05-04', '2026-05-13', 'Planned', 10),
(434, 2, 18, '2026-05-05', '2026-05-14', 'InProgress', 1),
(435, 3, 19, '2026-05-06', '2026-05-15', 'Completed', 2),
(436, 4, 20, '2026-05-07', '2026-05-16', 'Planned', 3),
(437, 5, 21, '2026-05-08', '2026-05-17', 'InProgress', 4),
(438, 1, 22, '2026-05-09', '2026-05-18', 'Completed', 5),
(439, 2, 23, '2026-05-10', '2026-05-19', 'Planned', 6),
(440, 3, 24, '2026-05-11', '2026-05-20', 'InProgress', 7),
(441, 4, 25, '2026-05-12', '2026-05-21', 'Completed', 8),
(442, 5, 26, '2026-05-13', '2026-05-22', 'Planned', 9),
(443, 1, 27, '2026-05-14', '2026-05-23', 'InProgress', 10),
(444, 2, 28, '2026-05-15', '2026-05-24', 'Completed', 1),
(445, 3, 29, '2026-05-16', '2026-05-25', 'Planned', 2),
(446, 4, 30, '2026-05-17', '2026-05-26', 'InProgress', 3),
(447, 5, 31, '2026-05-18', '2026-05-27', 'Completed', 4),
(448, 1, 32, '2026-05-19', '2026-05-28', 'Planned', 5),
(449, 2, 33, '2026-05-20', '2026-05-29', 'InProgress', 6),
(450, 3, 34, '2026-05-21', '2026-05-30', 'Completed', 7),
(451, 4, 35, '2026-05-22', '2026-05-31', 'Planned', 8),
(452, 5, 36, '2026-05-23', '2026-06-01', 'InProgress', 9),
(453, 1, 37, '2026-05-24', '2026-06-02', 'Completed', 10),
(454, 2, 38, '2026-05-25', '2026-06-03', 'Planned', 1),
(455, 3, 39, '2026-05-26', '2026-06-04', 'InProgress', 2),
(456, 4, 40, '2026-05-27', '2026-06-05', 'Completed', 3),
(457, 5, 41, '2026-05-28', '2026-06-06', 'Planned', 4),
(458, 1, 42, '2026-05-29', '2026-06-07', 'InProgress', 5),
(459, 2, 43, '2026-05-30', '2026-06-08', 'Completed', 6),
(460, 3, 44, '2026-05-31', '2026-06-09', 'Planned', 7),
(461, 4, 45, '2026-06-01', '2026-06-10', 'InProgress', 8),
(462, 5, 46, '2026-06-02', '2026-06-11', 'Completed', 9),
(463, 1, 47, '2026-06-03', '2026-06-12', 'Planned', 10),
(464, 2, 48, '2026-06-04', '2026-06-13', 'InProgress', 1),
(465, 3, 49, '2026-06-05', '2026-06-14', 'Completed', 2),
(466, 4, 50, '2026-06-06', '2026-06-15', 'Planned', 3),
(467, 5, 1, '2026-06-07', '2026-06-16', 'InProgress', 4),
(468, 1, 2, '2026-06-08', '2026-06-17', 'Completed', 5),
(469, 2, 3, '2026-06-09', '2026-06-18', 'Planned', 6),
(470, 3, 4, '2026-06-10', '2026-06-19', 'InProgress', 7),
(471, 4, 5, '2026-06-11', '2026-06-20', 'Completed', 8),
(472, 5, 6, '2026-06-12', '2026-06-21', 'Planned', 9),
(473, 1, 7, '2026-06-13', '2026-06-22', 'InProgress', 10),
(474, 2, 8, '2026-06-14', '2026-06-23', 'Completed', 1),
(475, 3, 9, '2026-06-15', '2026-06-24', 'Planned', 2),
(476, 4, 10, '2026-06-16', '2026-06-25', 'InProgress', 3),
(477, 5, 11, '2026-06-17', '2026-06-26', 'Completed', 4),
(478, 1, 12, '2026-06-18', '2026-06-27', 'Planned', 5),
(479, 2, 13, '2026-06-19', '2026-06-28', 'InProgress', 6),
(480, 3, 14, '2026-06-20', '2026-06-29', 'Completed', 7),
(481, 4, 15, '2026-06-21', '2026-06-30', 'Planned', 8),
(482, 5, 16, '2026-06-22', '2026-07-01', 'InProgress', 9),
(483, 1, 17, '2026-06-23', '2026-07-02', 'Completed', 10),
(484, 2, 18, '2026-06-24', '2026-07-03', 'Planned', 1),
(485, 3, 19, '2026-06-25', '2026-07-04', 'InProgress', 2),
(486, 4, 20, '2026-06-26', '2026-07-05', 'Completed', 3),
(487, 5, 21, '2026-06-27', '2026-07-06', 'Planned', 4),
(488, 1, 22, '2026-06-28', '2026-07-07', 'InProgress', 5),
(489, 2, 23, '2026-06-29', '2026-07-08', 'Completed', 6),
(490, 3, 24, '2026-06-30', '2026-07-09', 'Planned', 7),
(491, 4, 25, '2026-07-01', '2026-07-10', 'InProgress', 8),
(492, 5, 26, '2026-07-02', '2026-07-11', 'Completed', 9),
(493, 1, 27, '2026-07-03', '2026-07-12', 'Planned', 10),
(494, 2, 28, '2026-07-04', '2026-07-13', 'InProgress', 1),
(495, 3, 29, '2026-07-05', '2026-07-14', 'Completed', 2),
(496, 4, 30, '2026-07-06', '2026-07-15', 'Planned', 3),
(497, 5, 31, '2026-07-07', '2026-07-16', 'InProgress', 4),
(498, 1, 32, '2026-07-08', '2026-07-17', 'Completed', 5),
(499, 2, 33, '2026-07-09', '2026-07-18', 'Planned', 6),
(500, 3, 34, '2026-07-10', '2026-07-19', 'InProgress', 7);


GO
DECLARE @ProductID INT, @OrderID INT, @OrderItemID INT;

IF NOT EXISTS (SELECT 1 FROM [dbo].[Product])
BEGIN
    INSERT INTO [dbo].[Product] ([Title], [ArticleNumber], [Description], [Image], [MinCostForAgent])
    VALUES (N'Тестовый продукт', N'PR001', N'Тестовое описание', NULL, 1000.00);
END
SELECT TOP 1 @ProductID = [ID] FROM [dbo].[Product] ORDER BY [ID];

IF NOT EXISTS (SELECT 1 FROM [dbo].[OrderStatus])
BEGIN
    INSERT INTO [dbo].[OrderStatus] ([StatusName]) 
    VALUES (N'Создан'), (N'В работе'), (N'Завершен');
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[PaymentType])
BEGIN
    INSERT INTO [dbo].[PaymentType] ([TypeName]) 
    VALUES (N'Наличные'), (N'Безналичный расчет');
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[Order])
BEGIN
    INSERT INTO [dbo].[Order] ([OrderNumber], [AgentID], [CreateDate], [OrderStatusID], [TotalAmount], [PaymentTypeID])
    VALUES (N'ORD001', 1, GETDATE(), 1, 50000.00, 1);
END
SELECT TOP 1 @OrderID = [ID] FROM [dbo].[Order] ORDER BY [ID];

IF NOT EXISTS (SELECT 1 FROM [dbo].[OrderItem])
BEGIN
    INSERT INTO [dbo].[OrderItem] ([OrderID], [ProductID], [Quantity], [Cost])
    VALUES (@OrderID, @ProductID, 10, 5000.00);
END
SELECT TOP 1 @OrderItemID = [ID] FROM [dbo].[OrderItem] ORDER BY [ID];

IF NOT EXISTS (SELECT 1 FROM [dbo].[ProductionTask])
BEGIN
    INSERT INTO [dbo].[ProductionTask] 
        ([OrderItemID], [WorkshopID], [ResponsibleEmployeeID], [PlannedStartDate], [PlannedEndDate], [Status], [Priority])
    VALUES 
        (@OrderItemID, 1, 1, N'2025-10-01', N'2025-10-10', N'Запланировано', 1);
END
GO
USE [ProductionManagementEnhancedDB];
GO

DECLARE @table NVARCHAR(100);
DECLARE @sql NVARCHAR(MAX);

DECLARE tables CURSOR FOR
SELECT [name]
FROM sys.tables
WHERE [schema_id] = SCHEMA_ID('dbo')
ORDER BY [name];

OPEN tables;
FETCH NEXT FROM tables INTO @table;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT '===== TABLE: ' + @table + ' =====';
    SET @sql = N'SELECT * FROM [dbo].[' + @table + N'];';
    EXEC sp_executesql @sql;
    PRINT '----------------------------------------------------';
    FETCH NEXT FROM tables INTO @table;
END

CLOSE tables;
DEALLOCATE tables;
GO
