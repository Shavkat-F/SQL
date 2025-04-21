-- 1. Total number of products in each category
SELECT Category, COUNT(*) AS ProductCount FROM Products GROUP BY Category;

-- 2. Average price in Electronics category
SELECT AVG(Price) AS AvgPrice FROM Products WHERE Category = 'Electronics';

-- 3. Customers from cities starting with 'L'
SELECT * FROM Customers WHERE City LIKE 'L%';

-- 4. Product names ending with 'er'
SELECT ProductName FROM Products WHERE ProductName LIKE '%er';

-- 5. Customers from countries ending with 'A'
SELECT * FROM Customers WHERE Country LIKE '%A';

-- 6. Highest price among products
SELECT MAX(Price) AS HighestPrice FROM Products;

-- 7. IIF for stock label
SELECT ProductName, StockQuantity,
    IIF(StockQuantity < 30, 'Low Stock', 'Sufficient') AS StockStatus
FROM Products;

-- 8. Total customers per country
SELECT Country, COUNT(*) AS CustomerCount FROM Customers GROUP BY Country;

-- 9. Min and max quantity ordered
SELECT MIN(Quantity) AS MinQty, MAX(Quantity) AS MaxQty FROM Orders;

-- 10. Customers who ordered in 2023 but have no invoice
SELECT CustomerID FROM Orders
WHERE YEAR(OrderDate) = 2023
EXCEPT
SELECT CustomerID FROM Invoices;

-- 11. Combine all product names with duplicates
SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;

-- 12. Combine product names without duplicates
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

-- 13. Average order amount by year
SELECT YEAR(OrderDate) AS OrderYear, AVG(OrderAmount) AS AvgAmount
FROM Orders
GROUP BY YEAR(OrderDate);

-- 14. Group products by price using CASE
SELECT ProductName,
    CASE
        WHEN Price < 100 THEN 'Low'
        WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
        ELSE 'High'
    END AS PriceGroup
FROM Products;

-- 15. Unique cities sorted alphabetically
SELECT DISTINCT City FROM Customers ORDER BY City ASC;

-- 16. Total sales per product ID
SELECT ProductID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;

-- 17. Products with 'oo' in name
SELECT ProductName FROM Products WHERE ProductName LIKE '%oo%';

-- 18. Compare ProductIDs using INTERSECT
SELECT ProductID FROM Products
INTERSECT
SELECT ProductID FROM Products_Discounted;

-- 19. Top 3 customers by total invoice amount
SELECT TOP 3 CustomerID, SUM(InvoiceAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

-- 20. Products in Products but not in Products_Discounted
SELECT ProductID, ProductName FROM Products
WHERE ProductID NOT IN (SELECT ProductID FROM Products_Discounted);

-- 21. Product names and times sold using JOIN
SELECT p.ProductName, COUNT(s.SaleID) AS TimesSold
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName;

-- 22. Top 5 products by total order quantity
SELECT TOP 5 ProductID, SUM(Quantity) AS TotalQuantity
FROM Orders
GROUP BY ProductID
ORDER BY TotalQuantity DESC;
