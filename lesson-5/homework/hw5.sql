-- 1. Alias for ProductName as Name
SELECT ProductName AS Name FROM Products;

-- 2. Alias for Customers as Client
SELECT * FROM Customers AS Client;

-- 3. UNION ProductName from Products and Products_Discounted
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

-- 4. INTERSECT between Products and Products_Discounted
SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;

-- 5. DISTINCT customer names and Country
SELECT DISTINCT CustomerName, Country FROM Customers;

-- 6. CASE for Price levels
SELECT ProductName, Price,
    CASE
        WHEN Price > 1000 THEN 'High'
        ELSE 'Low'
    END AS PriceCategory
FROM Products;

-- 7. IIF on StockQuantity in Products_Discounted
SELECT ProductName, StockQuantity,
    IIF(StockQuantity > 100, 'Yes', 'No') AS InStock
FROM Products_Discounted;

-- 8. UNION ProductName from Products and OutOfStock
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM OutOfStock;

-- 9. EXCEPT to find products not in Products_Discounted
SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM Products_Discounted;

-- 10. IIF for Price category
SELECT ProductName, Price,
    IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceStatus
FROM Products;

-- 11. Employees age < 25 or salary > 60000
SELECT * FROM Employees WHERE Age < 25 OR Salary > 60000;

-- 12. Update salary conditionally
UPDATE Employees
SET Salary = Salary * 1.1
WHERE Department = 'HR' OR EmployeeID = 5;

-- 13. INTERSECT products again (same as 4 for reference)
SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;

-- 14. CASE for SaleAmount tiers in Sales
SELECT SaleID, SaleAmount,
    CASE
        WHEN SaleAmount > 500 THEN 'Top Tier'
        WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
        ELSE 'Low Tier'
    END AS Tier
FROM Sales;

-- 15. Customers with orders but no invoice
SELECT CustomerID FROM Orders
EXCEPT
SELECT CustomerID FROM Invoices;

-- 16. CASE for quantity discount in Orders
SELECT CustomerID, Quantity,
    CASE
        WHEN Quantity = 1 THEN '3%'
        WHEN Quantity BETWEEN 2 AND 3 THEN '5%'
        ELSE '7%'
    END AS Discount
FROM Orders;
