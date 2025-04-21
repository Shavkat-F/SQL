-- 1. All combinations of product and supplier names
SELECT p.ProductName, s.SupplierName FROM Products p CROSS JOIN Suppliers s;

-- 2. All combinations of departments and employees
SELECT d.DepartmentName, e.EmployeeName FROM Departments d CROSS JOIN Employees e;

-- 3. Actual product-supplier matches
SELECT s.SupplierName, p.ProductName FROM Products p JOIN Suppliers s ON p.SupplierID = s.SupplierID;

-- 4. Customer names and their order IDs
SELECT c.CustomerName, o.OrderID FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID;

-- 5. All combinations of students and courses
SELECT s.StudentName, c.CourseName FROM Students s CROSS JOIN Courses c;

-- 6. Product names and order IDs where product matches
SELECT p.ProductName, o.OrderID FROM Orders o JOIN Products p ON o.ProductID = p.ProductID;

-- 7. Employees whose department matches
SELECT e.EmployeeName, d.DepartmentName FROM Employees e JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- 8. Student names and enrolled course IDs
SELECT s.StudentName, e.CourseID FROM Students s JOIN Enrollments e ON s.StudentID = e.StudentID;

-- 9. Orders with matching payments
SELECT o.OrderID, p.PaymentID FROM Orders o JOIN Payments p ON o.OrderID = p.OrderID;

-- 10. Orders with product price > 100
SELECT o.OrderID, p.ProductName, p.Price FROM Orders o JOIN Products p ON o.ProductID = p.ProductID WHERE p.Price > 100;

-- 11. Employee and department combinations with mismatched IDs
SELECT e.EmployeeName, d.DepartmentName FROM Employees e, Departments d WHERE e.DepartmentID != d.DepartmentID;

-- 12. Orders with quantity greater than stock
SELECT o.OrderID, p.ProductName FROM Orders o JOIN Products p ON o.ProductID = p.ProductID WHERE o.Quantity > p.StockQuantity;

-- 13. Customer names and product IDs with sale amount >= 500
SELECT c.CustomerName, s.ProductID FROM Sales s JOIN Customers c ON s.CustomerID = c.CustomerID WHERE s.SaleAmount >= 500;

-- 14. Student names and course names they're enrolled in
SELECT s.StudentName, c.CourseName
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;

-- 15. Product and supplier names with supplier containing "Tech"
SELECT p.ProductName, s.SupplierName
FROM Products p JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName LIKE '%Tech%';

-- 16. Orders with payment amount less than total
SELECT o.OrderID, p.PaymentAmount, o.TotalAmount
FROM Orders o JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentAmount < o.TotalAmount;

-- 17. Employees with salary greater than their manager's
SELECT e.EmployeeName, e.Salary, m.EmployeeName AS ManagerName, m.Salary AS ManagerSalary
FROM Employees e
JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE e.Salary > m.Salary;

-- 18. Products in Electronics or Furniture category
SELECT p.ProductName, c.CategoryName FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture');

-- 19. Sales from customers in USA
SELECT s.* FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
WHERE c.Country = 'USA';

-- 20. Orders by German customers with total > 100
SELECT o.* FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany' AND o.TotalAmount > 100;

-- 21. All employee pairs from different departments
SELECT e1.EmployeeName AS Employee1, e2.EmployeeName AS Employee2
FROM Employees e1, Employees e2
WHERE e1.DepartmentID != e2.DepartmentID AND e1.EmployeeID < e2.EmployeeID;

-- 22. Payment details with mismatch in paid and expected amount
SELECT p.* FROM Payments p
JOIN Orders o ON p.OrderID = o.OrderID
JOIN Products pr ON o.ProductID = pr.ProductID
WHERE p.PaymentAmount != (o.Quantity * pr.Price);

-- 23. Students not enrolled in any course
SELECT s.StudentName FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.EnrollmentID IS NULL;

-- 24. Managers with lower or equal salary to their subordinates
SELECT m.EmployeeName AS Manager, e.EmployeeName AS Employee, m.Salary AS ManagerSalary, e.Salary AS EmployeeSalary
FROM Employees e
JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE m.Salary <= e.Salary;

-- 25. Customers who made an order but no payment
SELECT DISTINCT c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;
