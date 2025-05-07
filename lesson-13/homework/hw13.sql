-- Solutions to the provided SQL tasks

-- EASY TASKS

-- 1. Output "emp_id + first_name + last_name" in format "100-Steven King" (Employees table)
SELECT CONCAT(EMPLOYEE_ID, '-', FIRST_NAME, ' ', LAST_NAME) AS employee_info
FROM Employees;

-- 2. Update phone_number in Employees table, replace '124' with '999'
UPDATE Employees
SET PHONE_NUMBER = REPLACE(PHONE_NUMBER, '124', '999');

-- 3. Display first name and length of first name for employees starting with 'A', 'J', or 'M', sorted by first name
SELECT FIRST_NAME AS FirstName, LENGTH(FIRST_NAME) AS NameLength
FROM Employees
WHERE FIRST_NAME LIKE 'A%' OR FIRST_NAME LIKE 'J%' OR FIRST_NAME LIKE 'M%'
ORDER BY FIRST_NAME;

-- 4. Find total salary for each manager ID (Employees table)
SELECT MANAGER_ID, SUM(SALARY) AS total_salary
FROM Employees
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID;

-- 5. Retrieve year and highest value from Max1, Max2, Max3 for each row (TestMax table)
SELECT Year1, GREATEST(Max1, Max2, Max3) AS highest_value
FROM TestMax;

-- 6. Find odd-numbered movies where description is not 'boring' (cinema table)
SELECT id, movie, description, rating
FROM cinema
WHERE id % 2 = 1 AND description != 'boring';

-- 7. Sort data by Id, with Id = 0 as the last row, using a single ORDER BY (SingleOrder table)
SELECT Id, Vals
FROM SingleOrder
ORDER BY CASE WHEN Id = 0 THEN 1 ELSE 0 END, Id;

-- 8. Select the first non-null value from ssn, passportid, itin (person table)
SELECT id, COALESCE(ssn, passportid, itin) AS first_non_null
FROM person;

-- MEDIUM TASKS

-- 9. Split FullName into FirstName, MiddleName, LastName (Students table)
SELECT 
    StudentID,
    SUBSTRING_INDEX(FullName, ' ', 1) AS FirstName,
    CASE 
        WHEN LENGTH(FullName) - LENGTH(REPLACE(FullName, ' ', '')) = 2 
        THEN SUBSTRING_INDEX(SUBSTRING_INDEX(FullName, ' ', 2), ' ', -1)
        ELSE NULL 
    END AS MiddleName,
    SUBSTRING_INDEX(FullName, ' ', -1) AS LastName
FROM Students;

-- 10. For customers with deliveries to California, show their orders delivered to Texas (Orders table)
SELECT DISTINCT o1.CustomerID, o1.OrderID, o1.DeliveryState, o1.Amount
FROM Orders o1
JOIN Orders o2 ON o1.CustomerID = o2.CustomerID
WHERE o2.DeliveryState = 'CA' AND o1.DeliveryState = 'TX';

-- 11. Group concatenate values in DMLTable
SELECT GROUP_CONCAT(String ORDER BY SequenceNumber SEPARATOR ' ') AS concatenated_string
FROM DMLTable;

-- 12. Find employees whose concatenated first and last names contain the letter 'a' at least 3 times
SELECT FIRST_NAME, LAST_NAME
FROM Employees
WHERE LENGTH(CONCAT(FIRST_NAME, LAST_NAME)) - LENGTH(REPLACE(LOWER(CONCAT(FIRST_NAME, LAST_NAME)), 'a', '')) >= 3;

-- 13. Total employees per department and percentage with over 3 years of service (Employees table)
SELECT 
    DEPARTMENT_ID,
    COUNT(*) AS total_employees,
    ROUND(SUM(CASE WHEN DATEDIFF(CURDATE(), HIRE_DATE) > 3*365 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS percentage_over_3_years
FROM Employees
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;

-- 14. Determine most and least experienced Spaceman ID by job description (Personal table)
SELECT 
    JobDescription,
    MAX(MissionCount) AS max_experience,
    MIN(MissionCount) AS min_experience,
    (SELECT SpacemanID FROM Personal p2 WHERE p2.JobDescription = p1.JobDescription AND p2.MissionCount = MAX(p1.MissionCount) LIMIT 1) AS most_experienced_id,
    (SELECT SpacemanID FROM Personal p3 WHERE p3.JobDescription = p1.JobDescription AND p3.MissionCount = MIN(p1.MissionCount) LIMIT 1) AS least_experienced_id
FROM Personal p1
GROUP BY JobDescription;

-- DIFFICULT TASKS

-- 15. Separate uppercase, lowercase, numbers, and other characters from 'tf56sd#%OqH'
SELECT 
    REGEXP_REPLACE('tf56sd#%OqH', '[^A-Z]', '') AS uppercase,
    REGEXP_REPLACE('tf56sd#%OqH', '[^a-z]', '') AS lowercase,
    REGEXP_REPLACE('tf56sd#%OqH', '[^0-9]', '') AS numbers,
    REGEXP_REPLACE('tf56sd#%OqH', '[A-Za-z0-9]', '') AS other
FROM dual;

-- 16. Replace each row with the sum of its value and previous rows' value (Students table)
SELECT 
    StudentID,
    FullName,
    Grade,
    SUM(Grade) OVER (ORDER BY StudentID ROWS UNBOUNDED PRECEDING) AS cumulative_sum
FROM Students;

-- 17. Sum the mathematical equations in Equations table
SELECT 
    Equation,
    CASE 
        WHEN Equation REGEXP '^[0-9]+$' THEN CAST(Equation AS SIGNED)
        ELSE (
            SELECT SUM(CAST(num AS SIGNED) * IF(sign = '-', -1, 1))
            FROM (
                SELECT 
                    SUBSTRING_INDEX(SUBSTRING_INDEX(Equation, '+', numbers.n), '+', -1) AS num,
                    IF(LOCATE('-', SUBSTRING_INDEX(SUBSTRING_INDEX(Equation, '+', numbers.n), '+', -1)) > 0, '-', '+') AS sign
                FROM (
                    SELECT a.N + b.N * 10 + 1 AS n
                    FROM (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) a,
                         (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) b
                ) numbers
                WHERE numbers.n <= LENGTH(Equation) - LENGTH(REPLACE(Equation, '+', '')) + 1
                UNION
                SELECT 
                    SUBSTRING_INDEX(SUBSTRING_INDEX(Equation, '-', numbers.n), '-', -1) AS num,
                    '-' AS sign
                FROM (
                    SELECT a.N + b.N * 10 + 1 AS n
                    FROM (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) a,
                         (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) b
                ) numbers
                WHERE numbers.n <= LENGTH(Equation) - LENGTH(REPLACE(Equation, '-', '')) + 1
            ) parsed
            WHERE num REGEXP '^[0-9]+$'
        )
    END AS TotalSum
FROM Equations;

-- 18. Find students that share the same birthday (Student table)
SELECT Birthday, GROUP_CONCAT(StudentName) AS students
FROM Student
GROUP BY Birthday
HAVING COUNT(*) > 1;

-- 19. Aggregate scores for each unique pair of players (PlayerScores table)
SELECT 
    LEAST(PlayerA, PlayerB) AS Player1,
    GREATEST(PlayerA, PlayerB) AS Player2,
    SUM(Score) AS total_score
FROM PlayerScores
GROUP BY LEAST(PlayerA, PlayerB), GREATEST(PlayerA, PlayerB);
