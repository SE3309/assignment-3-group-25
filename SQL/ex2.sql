CREATE TABLE Users (
    Email VARCHAR(255) PRIMARY KEY,
    Password VARCHAR(255) NOT NULL,
    First_Name VARCHAR(100) NOT NULL,
    Last_Name VARCHAR(100) NOT NULL
);
DESCRIBE Users;

CREATE TABLE Chef (
    Email VARCHAR(255) PRIMARY KEY,
    Bio TEXT,
    Specialty VARCHAR(100),
    FOREIGN KEY (Email) REFERENCES Users(Email)
);
DESCRIBE Chef;

CREATE TABLE Customer (
    Email VARCHAR(255) PRIMARY KEY,
    Order_Count INT,
    Favourite_Cuisine VARCHAR(100),
    Location VARCHAR(255),
    FOREIGN KEY (Email) REFERENCES Users(Email)
);
DESCRIBE Customer;

CREATE TABLE Storefront (
    Storefront_ID INT PRIMARY KEY,
    Email VARCHAR(255),
    Restaurant_Name VARCHAR(255),
    Status VARCHAR(50),
    OrderMilestones VARCHAR(50),
    Location VARCHAR(255),
    UNIQUE (Email),
    FOREIGN KEY (Email) REFERENCES Chef(Email)
);
DESCRIBE Storefront;

CREATE TABLE Available_Pickup_Time (
    Storefront_ID INT,
    PickupTime DATETIME,
    Status BOOLEAN,
    PRIMARY KEY (Storefront_ID, PickupTime),
    FOREIGN KEY (Storefront_ID) REFERENCES Storefront(Storefront_ID)
);
DESCRIBE Available_Pickup_Time;

CREATE TABLE Item (
    Item_ID INT PRIMARY KEY,
    ItemName VARCHAR(255),
    Price DECIMAL(10,2),
    Ingredients VARCHAR(50),
    Storefront_ID INT,
    UNIQUE (Storefront_ID, ItemName),
    FOREIGN KEY (Storefront_ID) REFERENCES Storefront(Storefront_ID)
);
DESCRIBE Item;

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    totalPrice DECIMAL(10,2),
    pickupTime DATETIME,
    Status VARCHAR(50),
    Email VARCHAR(255),
    Storefront_ID INT,
    FOREIGN KEY (Email) REFERENCES Customer(Email),
    FOREIGN KEY (Storefront_ID) REFERENCES Storefront(Storefront_ID),
    FOREIGN KEY (Storefront_ID, pickupTime)
        REFERENCES Available_Pickup_Time (Storefront_ID, PickupTime)
);
DESCRIBE Orders;

CREATE TABLE Order_Item (
    Order_ID INT,
    Item_ID INT,
    Quantity INT,
    PRIMARY KEY (Order_ID, Item_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID)
);
DESCRIBE Order_Item;

CREATE TABLE Review (
    Review_ID INT PRIMARY KEY,
    Score INT,
    Description TEXT,
    Email VARCHAR(255),
    Storefront_ID INT,
    FOREIGN KEY (Email) REFERENCES Customer(Email),
    FOREIGN KEY (Storefront_ID) REFERENCES Storefront(Storefront_ID)
);
DESCRIBE Review;

CREATE TABLE Customer_Allergy (
    Email VARCHAR(255),
    Allergy VARCHAR(255),
    PRIMARY KEY (Email, Allergy),
    FOREIGN KEY (Email) REFERENCES Customer(Email)
);
DESCRIBE Customer_Allergy;
