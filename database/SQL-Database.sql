CREATE TABLE [Customer] (
  [Customer_ID] INT,
  [Email] VARCHAR(255),
  [FirstName] VARCHAR(50),
  [LastName] VARCHAR(50),
  [Street] VARCHAR(100),
  [City] VARCHAR(50),
  [State] CHAR(2),
  [Zip] CHAR(5),
  [Phone] VARCHAR(15),
  PRIMARY KEY ([Customer_ID])
);

CREATE INDEX [Customer_Key] ON [Customer] ([Email], [FirstName], [LastName], [Street], [City], [State], [Zip], [Phone]);

CREATE TABLE [Order] (
  [OrderID] INT,
  [Customer_ID] INT,
  [ShippingInfoID] INT,
  [OrderDate] DATE,
  [TotalCost] DECIMAL(10, 2),
  [PaymentInfoID] INT,
  [OrderStatus] VARCHAR(50),
  [CartID] INT,
  PRIMARY KEY ([OrderID])
);

CREATE INDEX [Order_Key] ON [Order] ([OrderDate], [TotalCost], [OrderStatus]);

CREATE TABLE [ShippingInfo] (
  [ShippingInfoID] INT,
  [OrderID] INT,
  [Street] VARCHAR(100),
  [Field] VARCHAR(100),
  [State] CHAR(2),
  [Zip] CHAR(5),
  [ShippingMethod] VARCHAR(50)
);

CREATE INDEX [ShippingInfo_Key] ON [ShippingInfo] ([ShippingInfoID], [Street], [Field], [State], [Zip], [ShippingMethod]);

CREATE TABLE [Payment] (
  [PaymentInfoID] INT,
  [OrderID] INT,
  [PaymentMethod] VARCHAR(50),
  [CardNumber] CHAR(16),
  [CVV] CHAR(3),
  [ExpirationDate] DATE,
  [CardHolderName] VARCHAR(100),
  [BillingAddress] VARCHAR(100),
  [PaymentDate] DATE,
  PRIMARY KEY ([PaymentInfoID])
);

CREATE INDEX [Payment_Key] ON [Payment] ([PaymentMethod], [CardNumber], [CVV], [ExpirationDate], [CardHolderName], [BillingAddress], [PaymentDate]);

CREATE TABLE [Product] (
  [ProductID] INT,
  [ProductName] VARCHAR(100),
  [CategoryID] INT,
  [Description] VARCHAR(200),  
  [SKU] VARCHAR(50),
  [Price] DECIMAL(10, 2),
  [ProductImage] VARCHAR(255),
  [Weight] DECIMAL(5, 2),
  [Manufacturer] VARCHAR(50),
  [Dimensions] VARCHAR(50),
  PRIMARY KEY ([ProductID])
);

CREATE INDEX [Product_Key] ON [Product] ([ProductName], [Description], [SKU], [Price], [ProductImage], [Weight], [Manufacturer], [Dimensions]);

CREATE TABLE [Category] (
  [CategoryID] INT,
  [CategoryName] VARCHAR(50),
  PRIMARY KEY ([CategoryID])
);

CREATE INDEX [Category_Key] ON [Category] ([CategoryName]);

CREATE TABLE [Sale] (
  [Sale_ID] INT,
  [StartDate] DATE,
  [EndDate] DATE,
  [Discount] DECIMAL(5, 2),
  [ProductID] INT,
  [CategoryID] INT,
  PRIMARY KEY ([Sale_ID])
);

CREATE INDEX [Sale_Key] ON [Sale] ([StartDate], [EndDate], [Discount]);

CREATE TABLE [Cart] (
  [CartID] INT,
  [CustomerID] INT,
  [CreatedDate] DATE,
  [UpdatedDate] DATE,
  [CartItemsID] INT,
  PRIMARY KEY ([CartID])
);

CREATE INDEX [Cart_Key] ON [Cart] ([CreatedDate], [UpdatedDate]);

CREATE TABLE [CartItems] (
  [CartItemID] INT,
  [CartID] INT,
  [ProductID] INT,
  [Quantity] INT,
  PRIMARY KEY ([CartItemID])
);

CREATE INDEX [CartItems_Key] ON [CartItems] ([Quantity]);

CREATE TABLE [UserLogin] (
  [LoginID] INT,
  [Customer_ID] INT,
  [Username] VARCHAR(50),
  [Password] VARCHAR(255),
  [Email] VARCHAR(255),
  [Phone] VARCHAR(15),
  PRIMARY KEY ([LoginID])
);

CREATE INDEX [UserLogin_Key] ON [UserLogin] ([Username], [Password], [Email], [Phone]);
