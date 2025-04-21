-- 🟢 Easy-Level Tasks

-- 1
SELECT e.name, e.salary, d.department_name
FROM Employees e
JOIN Departments d ON e.department_id = d.id
WHERE e.salary > 50000;

-- 2
SELECT c.name, o.order_date
FROM Customers c
JOIN Orders o ON c.id = o.customer_id
WHERE YEAR(o.order_date) = 2023;

-- 3
SELECT e.name, d.department_name
FROM Employees e
LEFT JOIN Departments d ON e.department_id = d.id;

-- 4
SELECT s.name AS supplier_name, p.name AS product_name
FROM Suppliers s
LEFT JOIN Products p ON s.id = p.supplier_id;

-- 5
SELECT o.id AS order_id, p.id AS payment_id
FROM Orders o
FULL OUTER JOIN Payments p ON o.id = p.order_id;

-- 6
SELECT e.name AS employee_name, m.name AS manager_name
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.id;

-- 7
SELECT s.name
FROM Students s
JOIN Enrollments e ON s.id = e.student_id
JOIN Courses c ON e.course_id = c.id
WHERE c.name = 'Math 101';

-- 8
SELECT c.name, SUM(o.quantity) AS total_quantity
FROM Customers c
JOIN Orders o ON c.id = o.customer_id
GROUP BY c.name
HAVING SUM(o.quantity) > 3;

-- 9
SELECT e.name
FROM Employees e
JOIN Departments d ON e.department_id = d.id
WHERE d.department_name = 'Human Resources';

-- 🟠 Medium-Level Tasks

-- 10
SELECT d.department_name
FROM Departments d
JOIN Employees e ON d.id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.id) > 10;

-- 11
SELECT p.name
FROM Products p
LEFT JOIN Sales s ON p.id = s.product_id
WHERE s.id IS NULL;

-- 12
SELECT DISTINCT c.name
FROM Customers c
JOIN Orders o ON c.id = o.customer_id;

-- 13
SELECT e.name, d.department_name
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.id;

-- 14
SELECT e1.name AS employee1, e2.name AS employee2
FROM Employees e1
JOIN Employees e2 ON e1.manager_id = e2.manager_id
WHERE e1.id < e2.id;

-- 15
SELECT o.id, c.name, o.order_date
FROM Orders o
JOIN Customers c ON o.customer_id = c.id
WHERE YEAR(o.order_date) = 2022;

-- 16
SELECT e.name, e.salary
FROM Employees e
JOIN Departments d ON e.department_id = d.id
WHERE d.department_name = 'Sales' AND e.salary > 60000;

-- 17
SELECT o.*
FROM Orders o
JOIN Payments p ON o.id = p.order_id;

-- 18
SELECT p.name
FROM Products p
LEFT JOIN Orders o ON p.id = o.product_id
WHERE o.id IS NULL;

-- 🔴 Hard-Level Tasks

-- 19
SELECT name, salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);

-- 20
SELECT o.*
FROM Orders o
LEFT JOIN Payments p ON o.id = p.order_id
WHERE p.id IS NULL AND o.order_date < '2020-01-01';

-- 21
SELECT p.name
FROM Products p
LEFT JOIN Categories c ON p.category_id = c.id
WHERE c.id IS NULL;

-- 22
SELECT e1.name AS employee1, e2.name AS employee2
FROM Employees e1
JOIN Employees e2 ON e1.manager_id = e2.manager_id
WHERE e1.id < e2.id AND e1.salary > 60000 AND e2.salary > 60000;

-- 23
SELECT e.name
FROM Employees e
JOIN Departments d ON e.department_id = d.id
WHERE d.department_name LIKE 'M%';

-- 24
SELECT s.id, p.name AS product_name, s.amount
FROM Sales s
JOIN Products p ON s.product_id = p.id
WHERE s.amount > 500;

-- 25
SELECT s.name
FROM Students s
WHERE s.id NOT IN (
    SELECT e.student_id
    FROM Enrollments e
    JOIN Courses c ON e.course_id = c.id
    WHERE c.name = 'Math 101'
);

-- 26
SELECT o.*
FROM Orders o
LEFT JOIN Payments p ON o.id = p.order_id
WHERE p.id IS NULL;

-- 27
SELECT p.name
FROM Products p
JOIN Categories c ON p.category_id = c.id
WHERE c.name IN ('Electronics', 'Furniture');
