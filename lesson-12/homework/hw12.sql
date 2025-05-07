-- Solutions to the provided SQL problems

-- 1. Combine Two Tables
-- Report first name, last name, city, and state of each person in the Person table
SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;

-- 2. Employees Earning More Than Their Managers
-- Find employees who earn more than their managers
SELECT e1.name AS Employee
FROM Employee e1
JOIN Employee e2 ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;

-- 3. Duplicate Emails
-- Report all duplicate emails
SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

-- 4. Delete Duplicate Emails
-- Delete all duplicate emails, keeping the one with the smallest id
DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email AND p1.id > p2.id;

-- 5. Find Those Parents Who Have Only Girls
-- Return parent names who have only girls and no boys
SELECT g.ParentName
FROM girls g
LEFT JOIN boys b ON g.ParentName = b.ParentName
GROUP BY g.ParentName
HAVING COUNT(b.Id) = 0;

-- 6. Total Over 50 and Least
-- Find total sales amount for orders with weight > 50 and least weight per customer
SELECT 
    o.custid,
    SUM(od.qty * od.unitprice) AS total_sales,
    MIN(o.freight) AS least_weight
FROM Sales.Orders o
JOIN Sales.OrderDetails od ON o.orderid = od.orderid
WHERE o.freight > 50
GROUP BY o.custid;

-- 7. Carts
-- Get items in Cart1 and Cart2, showing common and unique items
SELECT c1.Item AS 'Item Cart 1', c2.Item AS 'Item Cart 2'
FROM Cart1 c1
FULL OUTER JOIN Cart2 c2 ON c1.Item = c2.Item;

-- 8. Customers Who Never Order
-- Find customers who never ordered anything
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.customerId IS NULL;

-- 9. Students and Examinations
-- Find the number of times each student attended each exam
SELECT 
    s.student_id, 
    s.student_name, 
    sub.subject_name, 
    COUNT(e.student_id) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;
