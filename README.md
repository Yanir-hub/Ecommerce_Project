E-Commerce Sales Analysis (SQL Project)

Project Overview
This project models an e-commerce platform's database, enabling analysis of customer purchases, product sales, and revenue trends. It includes relational tables, stored procedures, views, and indexing to optimize performance.

Features
- Database Design: Customers, Orders, Products, and OrderDetails tables.
- SQL Queries: Analyze sales trends and revenue.
- Stored Procedures: Automate total sales per customer calculation.
- Views: Retrieve top-selling products easily.
- Indexing: Optimized email lookups for faster queries.

Database Structure
1. Customers Table - Stores customer details.
2. Products Table - Contains product information.
3. Orders Table - Records purchase transactions.
4. OrderDetails Table - Breaks down each order by product and quantity.

Key SQL Components
- Stored Procedure: GetCustomerSales() - Retrieves total amount spent by each customer.
- View: TopSellingProducts - Shows best-selling products.
- Indexing: idx_customer_email - Improves email search performance.

How to Use
1. Run the provided SQL script to create the database and tables.
2. Insert sample data (optional) to test queries.
3. Use the stored procedure and views to analyze sales data.

Future Enhancements
- Add user authentication for customer access.
- Implement triggers for automated stock updates.
- Integrate with BI tools for advanced reporting.
