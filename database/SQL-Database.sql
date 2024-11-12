CREATE TABLE [Customer] (
    [CustomerID] INT IDENTITY(1,1) PRIMARY KEY,
    [Email] VARCHAR(255) UNIQUE NOT NULL,
    [FirstName] VARCHAR(50),
    [LastName] VARCHAR(50),
    [Street] VARCHAR(100),
    [City] VARCHAR(50),
    [State] CHAR(2),
    [Zip] CHAR(5),
    [Phone] VARCHAR(15) UNIQUE
);

CREATE INDEX [Customer_Key] ON [Customer] ([Email], [FirstName], [LastName], [Street], [City], [State], [Zip], [Phone]);

CREATE TABLE [Order] (
    [OrderID] INT IDENTITY(1,1) PRIMARY KEY,
    [CustomerID] INT,
    [ShippingInfoID] INT,
    [OrderDate] DATE DEFAULT GETDATE(),
    [TotalCost] DECIMAL(10, 2),
    [PaymentInfoID] INT,
    [OrderStatus] VARCHAR(50),
    [CartID] INT,
    CONSTRAINT FK_Order_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE INDEX [Order_Key] ON [Order] ([OrderDate], [TotalCost], [OrderStatus]);

CREATE TABLE [ShippingInfo] (
    [ShippingInfoID] INT IDENTITY(1,1) PRIMARY KEY,
    [OrderID] INT,
    [Street] VARCHAR(100),
    [Field] VARCHAR(100),
    [State] CHAR(2),
    [Zip] CHAR(5),
    [ShippingMethod] VARCHAR(50),
    CONSTRAINT FK_ShippingInfo_Order FOREIGN KEY ([OrderID]) REFERENCES [Order]([OrderID])
);

CREATE INDEX [ShippingInfo_Key] ON [ShippingInfo] ([ShippingInfoID], [Street], [Field], [State], [Zip], [ShippingMethod]);

CREATE TABLE [Payment] (
    [PaymentInfoID] INT IDENTITY(1,1) PRIMARY KEY,
    [OrderID] INT,
    [PaymentMethod] VARCHAR(50),
    [CardNumber] CHAR(16),
    [CVV] CHAR(3),
    [ExpirationDate] DATE,
    [CardHolderName] VARCHAR(100),
    [BillingAddress] VARCHAR(100),
    [PaymentDate] DATE,
    CONSTRAINT FK_Payment_Order FOREIGN KEY ([OrderID]) REFERENCES [Order]([OrderID])
);

CREATE INDEX [Payment_Key] ON [Payment] ([PaymentMethod], [CardNumber], [CVV], [ExpirationDate], [CardHolderName], [BillingAddress], [PaymentDate]);

CREATE TABLE [Product] (
    [ProductID] INT IDENTITY(1,1) PRIMARY KEY,
    [ProductName] VARCHAR(100),
    [CategoryID] INT,
    [Description] VARCHAR(200),  
    [SKU] VARCHAR(50),
    [Price] DECIMAL(10, 2),
    [ProductImage] VARCHAR(255),
    [Weight] DECIMAL(5, 2),
    [Manufacturer] VARCHAR(50),
    [Dimensions] VARCHAR(50),
    CONSTRAINT FK_Product_Category FOREIGN KEY ([CategoryID]) REFERENCES [Category]([CategoryID])
);

CREATE INDEX [Product_Key] ON [Product] ([ProductName], [Description], [SKU], [Price], [ProductImage], [Weight], [Manufacturer], [Dimensions]);

CREATE TABLE [Category] (
    [CategoryID] INT IDENTITY(1,1) PRIMARY KEY,
    [CategoryName] VARCHAR(50)
);

CREATE INDEX [Category_Key] ON [Category] ([CategoryName]);

CREATE TABLE [Cart] (
    [CartID] INT IDENTITY(1,1) PRIMARY KEY,
    [CustomerID] INT,
    [CreatedDate] DATE DEFAULT GETDATE(),
    [UpdatedDate] DATE DEFAULT GETDATE(),
    CONSTRAINT FK_Cart_Customer FOREIGN KEY ([CustomerID]) REFERENCES [Customer]([CustomerID])
);

CREATE INDEX [Cart_Key] ON [Cart] ([CreatedDate], [UpdatedDate]);

CREATE TABLE [CartItems] (
    [CartItemID] INT IDENTITY(1,1) PRIMARY KEY,
    [CartID] INT,
    [ProductID] INT,
    [Quantity] INT,
    CONSTRAINT FK_CartItems_Cart FOREIGN KEY ([CartID]) REFERENCES [Cart]([CartID]),
    CONSTRAINT FK_CartItems_Product FOREIGN KEY ([ProductID]) REFERENCES [Product]([ProductID])
);

CREATE INDEX [CartItems_Key] ON [CartItems] ([Quantity]);

CREATE TABLE [UserLogin] (
    [LoginID] INT IDENTITY(1,1) PRIMARY KEY,
    [CustomerID] INT,
    [Username] VARCHAR(50) UNIQUE,
    [Password] VARCHAR(255),
    [Email] VARCHAR(255) UNIQUE,
    [Phone] VARCHAR(15),
    CONSTRAINT FK_UserLogin_Customer FOREIGN KEY ([CustomerID]) REFERENCES [Customer]([CustomerID])
);

CREATE INDEX [UserLogin_Key] ON [UserLogin] ([Username], [Password], [Email], [Phone]);

