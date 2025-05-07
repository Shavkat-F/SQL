-- 1. Find Employees with Minimum Salary
SELECT * FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

-- 2. Find Products Above Average Price
SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 3. Find Employees in Sales Department
SELECT e.*
FROM employees e
JOIN departments d ON e.department_id = d.id
WHERE d.department_name = 'Sales';

-- 4. Find Customers with No Orders
SELECT *
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);

-- 5. Find Products with Max Price in Each Category
SELECT *
FROM products p
WHERE price = (
    SELECT MAX(price)
    FROM products
    WHERE category_id = p.category_id
);

-- 6. Find Employees in Department with Highest Average Salary
SELECT *
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1
);

-- 7. Find Employees Earning Above Department Average
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- 8. Find Students with Highest Grade per Course
SELECT s.student_id, s.name, g.course_id, g.grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
WHERE (g.course_id, g.grade) IN (
    SELECT course_id, MAX(grade)
    FROM grades
    GROUP BY course_id
);

-- 9. Find Third-Highest Price per Category
SELECT *
FROM products p1
WHERE 2 = (
    SELECT COUNT(DISTINCT p2.price)
    FROM products p2
    WHERE p2.category_id = p1.category_id AND p2.price > p1.price
);

-- 10. Find Employees whose Salary Between Company Average and Department Max Salary
SELECT *
FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees)
AND salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = e.department_id
);
