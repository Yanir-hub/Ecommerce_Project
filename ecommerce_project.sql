-- SQL Project: E-Commerce Sales Analysis
-- Description: This project models an e-commerce platform's database,
-- allowing analysis of customer purchases, product sales, and revenue trends.
-- Features include relational tables, stored procedures, views, and indexing for performance.
-- Create Database
CREATE DATABASE EcommerceDB;

USE EcommerceDB;

-- Customers Table: Stores customer details
CREATE TABLE
  Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    -- Unique identifier for customers
    Name VARCHAR(100),
    -- Customer's full name
    Email VARCHAR(100) UNIQUE,
    -- Customer's email (ensures uniqueness)
    SignupDate DATE -- Date the customer signed up
  );

-- Products Table: Stores product details
CREATE TABLE
  Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    -- Unique identifier for products
    ProductName VARCHAR(100),
    -- Name of the product
    Category VARCHAR(50),
    -- Category of the product (e.g., Electronics, Clothing)
    Price DECIMAL(10, 2) -- Price of the product
  );

-- Orders Table: Stores customer purchase orders
CREATE TABLE
  Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    -- Unique identifier for each order
    CustomerID INT,
    -- Links to Customers table
    OrderDate DATE,
    -- Date of the order
    TotalAmount DECIMAL(10, 2),
    -- Total amount paid for the order
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) -- Ensures referential integrity
  );

-- Order Details Table: Stores items in each order
CREATE TABLE
  OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    -- Unique identifier for each order detail entry
    OrderID INT,
    -- Links to Orders table
    ProductID INT,
    -- Links to Products table
    Quantity INT,
    -- Number of units purchased
    Subtotal DECIMAL(10, 2),
    -- Total price for the quantity of this product
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    -- Ensures referential integrity
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) -- Ensures referential integrity
  );

-- Stored Procedure: Get Total Sales per Customer
-- Description: Retrieves the total amount spent by each customer
DELIMITER / / CREATE PROCEDURE GetCustomerSales() BEGIN
SELECT
  c.Name,
  SUM(o.TotalAmount) AS TotalSpent
FROM
  Customers c
  JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY
  c.CustomerID;

END / / DELIMITER;

-- View: Top Selling Products
-- Description: Displays products ranked by total units sold
CREATE VIEW TopSellingProducts AS
SELECT
  p.ProductName,
  SUM(od.Quantity) AS TotalSold
FROM
  OrderDetails od
  JOIN Products p ON od.ProductID = p.ProductID
GROUP BY
  p.ProductID
ORDER BY
  TotalSold DESC;

-- Index for Faster Searches
-- Description: Improves lookup speed for customer emails
CREATE INDEX idx_customer_email ON Customers(Email);

-- Sample Query: Get Monthly Sales
-- Description: Calculates total revenue generated per month
SELECT
  MONTH(OrderDate) AS Month,
  SUM(TotalAmount) AS Revenue
FROM
  Orders
GROUP BY
  MONTH(OrderDate)
ORDER BY
  Month;