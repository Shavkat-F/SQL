--Homework

--EASY
--select min(price) from Products

--select max(Salary) from Employees

--select count(*) from Customers

--select count(distinct(Category)) from Products

--select ProductID, sum(SaleAmount) from Sales
--group by ProductID

--select avg(Age) as AvgAge from Employees

--select DepartmentID, count(EmployeeID) from Employees
--group by DepartmentID

--select Category, min(Price) as MinPrice, max(Price) as MaxPrice from Products
--group by Category

--select Region, sum(SaleAmount) from Sales
--group by Region

--select DepartmentID, count(EmployeeID) as TotalEmployees from Employees
--group by DepartmentID
--having count(EmployeeID) > 5

--Hard
--SELECT category, AVG(sales) AS avg_sales
--FROM products
--GROUP BY category
--HAVING AVG(sales) > 200;

--SELECT employee, SUM(sales) AS avg_sales
--FROM sales
--GROUP BY employee
--HAVING SUM(sales) > 5000;

--SELECT DepartmentID, SUM(Salary) as SumSal, AVG(Salary) as AvgSal
--FROM Employees
--GROUP BY DepartmentID

--select CustomerID, max(SaleAmount) as 'Max', min(SaleAmount) as 'Min' from Sales
--group by CustomerID
--having min(SaleAmount) > 50

--SELECT region, SUM(sales) AS total_sales, COUNT(DISTINCT product_id) AS distinct_products_sold
--FROM sales_data
--GROUP BY region
--HAVING COUNT(DISTINCT product_id) > 10;

--SELECT ProductCategory, MIN(OrderQuantity) AS MinOrderQuantity, MAX(OrderQuantity) AS MaxOrderQuantity
--FROM orders
--GROUP BY ProductCategory;

--SELECT Region, [2021] AS Sales_2021, [2022] AS Sales_2022, [2023] AS Sales_2023
--FROM (SELECT Year, Region, SalesAmount FROM Sales) AS src
--PIVOT (SUM(SalesAmount) FOR Year IN ([2021], [2022], [2023])) AS pvt;

--SELECT Region, Quarter, Sales
--FROM Sales
--UNPIVOT (
--    Sales FOR Quarter IN (Q1, Q2, Q3, Q4)
--) AS Unpvt;

--SELECT ProductCategory, ProductID, COUNT(OrderID) AS OrderCount
--FROM Orders
--GROUP BY ProductCategory, ProductID
--HAVING COUNT(OrderID) > 50;

--SELECT EmployeeID, [Q1] AS Q1_Sales, [Q2] AS Q2_Sales, [Q3] AS Q3_Sales, [Q4] AS Q4_Sales
--FROM (SELECT EmployeeID, Quarter, SalesAmount FROM EmployeeSales) AS src
--PIVOT (SUM(SalesAmount) FOR Quarter IN ([Q1], [Q2], [Q3], [Q4])) AS pvt;

--Medium
--select  Category, sum(SaleAmount) as Total, avg(SaleAmount) as Avarage from Sales
--group by Category

--select JobTitle, count(employeeID) as Cnt from Employees
--group by JobTitle

--select Departments, min(Salary) as MinPrice, max(Salary) as MaxPrice from Employees
--group by Departments

--select DepartmentID, avg(Salary) as AVGSalary from Employees
--group by DepartmentID

--select DepartmentID, avg(Salary) as AVGSalary, count (*) as NoEmpl from Employees
--group by DepartmentID

--select Name, avg(Price) as avgprc from Products
--group by Name
--having avg(Price) > 100

--select ProductID, sum(SalesUnits) from SalesData
--group by ProductID
--having sum(SalesUnits) > 100

