-- Создание новой базы данных
CREATE DATABASE ProductionManagementDB
GO

-- Использование созданной базы данных
USE ProductionManagementDB
GO

-- Создание таблицы AgentType
CREATE TABLE [dbo].[AgentType](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
    (
        [ID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Создание таблицы MaterialType
CREATE TABLE [dbo].[MaterialType](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](50) NOT NULL,
    [DefectedPercent] [float] NOT NULL,
    CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
    (
        [ID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Создание таблицы Supplier
CREATE TABLE [dbo].[Supplier](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](150) NOT NULL,
    [INN] [varchar](12) NOT NULL,
    [StartDate] [date] NOT NULL,
    CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
    (
        [ID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Создание таблицы SupplierDetails
CREATE TABLE [dbo].[SupplierDetails](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [SupplierID] [int] NOT NULL,
    [QualityRating] [int] NULL,
    [SupplierType] [nvarchar](20) NULL,
    CONSTRAINT [PK_SupplierDetails] PRIMARY KEY CLUSTERED 
    (
        [ID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Создание таблицы Agent
CREATE TABLE [dbo].[Agent](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](150) NOT NULL,
    [AgentTypeID] [int] NOT NULL,
    [Priority] [int] NOT NULL,
    CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
    (
        [ID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Создание таблицы AgentContact
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
    CONSTRAINT [PK_AgentContact] PRIMARY KEY CLUSTERED 
    (
        [ID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Создание таблицы AgentPriorityHistory
CREATE TABLE [dbo].[AgentPriorityHistory](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [AgentID] [int] NOT NULL,
    [ChangeDate] [datetime] NOT NULL,
    [PriorityValue] [int] NOT NULL,
    CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
    (
        [ID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Создание таблицы Shop
CREATE TABLE [dbo].[Shop](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](150) NOT NULL,
    [Address] [nvarchar](300) NULL,
    [AgentID] [int] NOT NULL,
    CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
    (
        [ID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Создание таблицы Product
CREATE TABLE [dbo].[Product](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](100) NOT NULL,
    [ArticleNumber] [nvarchar](10) NOT NULL,
    [Description] [nvarchar](max) NULL,
    [Image] [nvarchar](100) NULL,
    [MinCostForAgent] [decimal](10, 2) NOT NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
    (
        [ID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-- Создание таблицы ProductSale
CREATE TABLE [dbo].[ProductSale](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [ProductID] [int] NOT NULL,
    [AgentID] [int] NOT NULL,
    [SaleDate] [datetime] NOT NULL,
    [Quantity] [int] NOT NULL,
    [TotalCost] [decimal](10, 2) NOT NULL,
    CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
    (
        [ID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Создание таблицы Request
CREATE TABLE [dbo].[Request](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [AgentID] [int] NOT NULL,
    [RequestDate] [datetime] NOT NULL,
    [Status] [nvarchar](20) NOT NULL,
    [PrepaymentDate] [datetime] NULL,
    [CompletionDate] [datetime] NULL,
    CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
    (
        [ID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Создание таблицы RequestItem
CREATE TABLE [dbo].[RequestItem](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [RequestID] [int] NOT NULL,
    [ProductID] [int] NOT NULL,
    [Quantity] [int] NOT NULL,
    [Cost] [decimal](10, 2) NOT NULL,
    [ProductionTime] [int] NULL,
    CONSTRAINT [PK_RequestItem] PRIMARY KEY CLUSTERED 
    (
        [ID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Создание таблицы Material
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
    CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
    (
        [ID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-- Создание таблицы MaterialSupplier
CREATE TABLE [dbo].[MaterialSupplier](
    [MaterialID] [int] NOT NULL,
    [SupplierID] [int] NOT NULL,
    CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
    (
        [MaterialID] ASC,
        [SupplierID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Добавление внешних ключей
ALTER TABLE [dbo].[Agent] WITH CHECK ADD CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO

ALTER TABLE [dbo].[AgentContact] WITH CHECK ADD CONSTRAINT [FK_AgentContact_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentContact] CHECK CONSTRAINT [FK_AgentContact_Agent]
GO

ALTER TABLE [dbo].[AgentPriorityHistory] WITH CHECK ADD CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO

ALTER TABLE [dbo].[Shop] WITH CHECK ADD CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO

ALTER TABLE [dbo].[ProductSale] WITH CHECK ADD CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO

ALTER TABLE [dbo].[ProductSale] WITH CHECK ADD CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO

ALTER TABLE [dbo].[Request] WITH CHECK ADD CONSTRAINT [FK_Request_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Agent]
GO

ALTER TABLE [dbo].[RequestItem] WITH CHECK ADD CONSTRAINT [FK_RequestItem_Request] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Request] ([ID])
GO
ALTER TABLE [dbo].[RequestItem] CHECK CONSTRAINT [FK_RequestItem_Request]
GO

ALTER TABLE [dbo].[RequestItem] WITH CHECK ADD CONSTRAINT [FK_RequestItem_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[RequestItem] CHECK CONSTRAINT [FK_RequestItem_Product]
GO

ALTER TABLE [dbo].[Material] WITH CHECK ADD CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO

ALTER TABLE [dbo].[MaterialSupplier] WITH CHECK ADD CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO

ALTER TABLE [dbo].[MaterialSupplier] WITH CHECK ADD CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO

ALTER TABLE [dbo].[SupplierDetails] WITH CHECK ADD CONSTRAINT [FK_SupplierDetails_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[SupplierDetails] CHECK CONSTRAINT [FK_SupplierDetails_Supplier]
GO

-- Заполнение таблицы AgentType
INSERT INTO [dbo].[AgentType] ([Title])
VALUES 
    ('ООО'),
    ('ОАО'),
    ('ПАО'),
    ('ИП'),
    ('Самозанятый');

-- Заполнение таблицы MaterialType
INSERT INTO [dbo].[MaterialType] ([Title], [DefectedPercent])
VALUES 
    ('Гранулы', 5.0),
    ('Краски', 3.0),
    ('Нитки', 2.0);

-- Заполнение таблицы Supplier
INSERT INTO [dbo].[Supplier] ([Title], [INN], [StartDate])
VALUES 
    ('ГаражТелекомГор', '1718185951', '2011-12-20'),
    ('Компания Омск', '1878504395', '2012-09-13'),
    ('ГорМонтаж', '1564667734', '2016-12-23'),
    ('Микро', '2293562756', '2019-05-27'),
    ('Электро', '1755853973', '2015-06-16'),
    ('Компания Мотор', '1429908355', '2010-12-27'),
    ('Асбоцем', '1944834477', '2011-04-10'),
    ('ВостокМети', '1488487851', '2012-03-13'),
    ('МясКрепТеле', '2152486844', '2018-11-11'),
    ('Софт', '1036521658', '2011-11-23'),
    ('Компания СервисМикроО', '1178826599', '2012-07-07'),
    ('ИнфоГазМотор', '1954050214', '2011-07-23'),
    ('Монтаж', '1163880101', '2016-05-23'),
    ('ЭлектроЦвет', '1654184411', '2015-06-25'),
    ('Компания НефтьITИнф', '1685247455', '2017-03-09'),
    ('ТомскНефть', '1002996016', '2015-05-07'),
    ('ТомскТяжРеч', '1102143492', '2014-12-22'),
    ('УралХме', '2291253256', '2015-05-22'),
    ('ВодРыб', '1113468466', '2011-11-25'),
    ('УралСервисМон', '1892306757', '2016-12-20'),
    ('Казань', '1965011544', '2015-03-16'),
    ('Cиб', '1949139718', '2011-11-28'),
    ('ГаражГазМ', '1740623312', '2011-11-20'),
    ('МобайлДизайнОмск', '1014490629', '2019-10-28'),
    ('ЖелДорГаз', '1255275062', '2014-09-04'),
    ('ТверьБухГаз', '2167673760', '2013-11-13'),
    ('ТелекомТранс', '2200735978', '2015-01-11'),
    ('ГаражГлав', '1404774111', '2013-06-28'),
    ('Компания К', '1468114280', '2018-12-07'),
    ('ТяжЛифтВостокС', '1032089879', '2012-08-13'),
    ('Компания Во', '2027005945', '2016-06-22'),
    ('МоторКаз', '1076279398', '2015-08-23'),
    ('Сервис', '2031832854', '2011-11-25'),
    ('ЮпитерТомс', '1551173338', '2011-07-28'),
    ('Мор', '1906157177', '2011-03-06'),
    ('СеверТехВостокЛизинг', '1846812080', '2011-02-26'),
    ('ЦементОбл', '2021607106', '2015-10-03'),
    ('Компания КазаньАвтоCиб', '1371692583', '2015-10-19'),
    ('ГаражХозФлот', '2164720385', '2018-08-28'),
    ('Компания МорМетал', '1947163072', '2013-11-18'),
    ('ГлавРыб', '1426268088', '2018-11-09'),
    ('CибCибОрио', '1988313615', '2018-01-13'),
    ('ТелеРыбХм', '2299034130', '2012-02-10'),
    ('ГлавАвтоГазТрест', '2059691335', '2014-08-04'),
    ('ТяжКазаньБашкир', '1794419510', '2015-12-22'),
    ('Асбоцемент', '1650212184', '2018-12-09'),
    ('Мотор', '1019917089', '2017-04-24'),
    ('МорФинансФинансМаш', '1549496316', '2013-06-18'),
    ('РыбВектор', '2275526397', '2011-06-20'),
    ('Теле', '2170198203', '2010-05-01');

-- Заполнение таблицы SupplierDetails
INSERT INTO [dbo].[SupplierDetails] ([SupplierID], [QualityRating], [SupplierType])
VALUES 
    (1, 36, 'МКК'),
    (2, 2, 'ОАО'),
    (3, 79, 'ООО'),
    (4, 64, 'МКК'),
    (5, 14, 'ЗАО'),
    (6, 50, 'ООО'),
    (7, 20, 'МФО'),
    (8, 58, 'ООО'),
    (9, 59, 'ПАО'),
    (10, 67, 'МКК'),
    (11, 5, 'ООО'),
    (12, 42, 'ОАО'),
    (13, 10, 'ОАО'),
    (14, 3, 'ОАО'),
    (15, 85, 'ООО'),
    (16, 95, 'ООО'),
    (17, 36, 'МФО'),
    (18, 82, 'ООО'),
    (19, 21, 'ЗАО'),
    (20, 26, 'МКК'),
    (21, 51, 'ОАО'),
    (22, 95, 'ОАО'),
    (23, 86, 'ОАО'),
    (24, 73, 'ООО'),
    (25, 76, 'МФО'),
    (26, 9, 'ОАО'),
    (27, 8, 'ОАО'),
    (28, 89, 'МКК'),
    (29, 70, 'ПАО'),
    (30, 66, 'ОАО'),
    (31, 11, 'ПАО'),
    (32, 37, 'ОАО'),
    (33, 25, 'ОАО'),
    (34, 60, 'ПАО'),
    (35, 82, 'МКК'),
    (36, 30, 'ООО'),
    (37, 42, 'ООО'),
    (38, 23, 'МКК'),
    (39, 7, 'ОАО'),
    (40, 33, 'ООО'),
    (41, 46, 'МФО'),
    (42, 95, 'ООО'),
    (43, 3, 'ООО'),
    (44, 18, 'МФО'),
    (45, 85, 'ПАО'),
    (46, 80, 'МФО'),
    (47, 19, 'ПАО'),
    (48, 68, 'ООО'),
    (49, 92, 'ОАО'),
    (50, 11, 'ПАО');

-- Заполнение таблицы Agent
INSERT INTO [dbo].[Agent] ([Title], [AgentTypeID], [Priority])
VALUES 
    ('Агент 1', 1, 1),
    ('Агент 2', 2, 2);

-- Заполнение таблицы AgentContact
INSERT INTO [dbo].[AgentContact] ([AgentID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo])
VALUES 
    (1, 'ул. Пример 1', '123456789012', '123456789', 'Иванов И.И.', '+7 (123) 456-78-90', 'ivanov@example.com', NULL),
    (2, 'ул. Пример 2', '987654321098', '987654321', 'Петров П.П.', '+7 (987) 654-32-10', 'petrov@example.com', NULL);

-- Заполнение таблицы Material
INSERT INTO [dbo].[Material] ([Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID])
VALUES 
    ('Гранулы белый 2x2', 7, 'л', 76.0, 8.0, NULL, 47680.00, 'не указано', 1),
    ('Нить серый 1x0', 1, 'м', 978.0, 42.0, NULL, 27456.00, 'не указано', 3),
    ('Нить белый 1x3', 8, 'м', 406.0, 27.0, NULL, 2191.00, 'не указано', 3),
    ('Нить цветной 1x1', 3, 'г', 424.0, 10.0, NULL, 8619.00, '\materials\image_5.jpeg', 3),
    ('Нить цветной 2x0', 2, 'м', 395.0, 26.0, NULL, 16856.00, 'отсутствует', 3),
    ('Краска синий 2x2', 6, 'л', 334.0, 48.0, NULL, 403.00, 'не указано', 2),
    ('Нить синий 0x2', 9, 'м', 654.0, 10.0, NULL, 7490.00, 'отсутствует', 3),
    ('Гранулы серый 2x2', 7, 'л', 648.0, 17.0, NULL, 15478.00, 'не указано', 1);

-- Заполнение таблицы MaterialSupplier
INSERT INTO [dbo].[MaterialSupplier] ([MaterialID], [SupplierID])
SELECT m.ID, s.ID
FROM [dbo].[Material] m
LEFT JOIN [dbo].[Supplier] s ON s.[Title] = 'Электро'
WHERE m.[Title] = 'Нить серый 1x2' AND s.ID IS NOT NULL;

INSERT INTO [dbo].[MaterialSupplier] ([MaterialID], [SupplierID])
SELECT m.ID, s.ID
FROM [dbo].[Material] m
LEFT JOIN [dbo].[Supplier] s ON s.[Title] = 'ЮпитерТомс'
WHERE m.[Title] = 'Краска цветной 2x1' AND s.ID IS NOT NULL;

INSERT INTO [dbo].[MaterialSupplier] ([MaterialID], [SupplierID])
SELECT m.ID, s.ID
FROM [dbo].[Material] m
LEFT JOIN [dbo].[Supplier] s ON s.[Title] = 'МясКрепТеле'
WHERE m.[Title] = 'Нить серый 1x0' AND s.ID IS NOT NULL;

INSERT INTO [dbo].[MaterialSupplier] ([MaterialID], [SupplierID])
SELECT m.ID, s.ID
FROM [dbo].[Material] m
LEFT JOIN [dbo].[Supplier] s ON s.[Title] = 'МоторКаз'
WHERE m.[Title] = 'Краска цветной 2x1' AND s.ID IS NOT NULL;

INSERT INTO [dbo].[MaterialSupplier] ([MaterialID], [SupplierID])
SELECT m.ID, s.ID
FROM [dbo].[Material] m
LEFT JOIN [dbo].[Supplier] s ON s.[Title] = 'Софт'
WHERE m.[Title] = 'Краска белый 2x2' AND s.ID IS NOT NULL;

-- SELECT запросы для проверки
SELECT * FROM [dbo].[AgentType];
SELECT * FROM [dbo].[MaterialType];
SELECT * FROM [dbo].[Supplier];
SELECT * FROM [dbo].[SupplierDetails];
SELECT * FROM [dbo].[Agent];
SELECT * FROM [dbo].[AgentContact];
SELECT * FROM [dbo].[Material];
SELECT * FROM [dbo].[MaterialSupplier];

-- Завершение скрипта