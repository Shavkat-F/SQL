
-- Easy Task 1: Split Name column by comma into Name and Surname
SELECT 
  TRIM(SPLIT_PART(Name, ',', 1)) AS Name,
  TRIM(SPLIT_PART(Name, ',', 2)) AS Surname
FROM TestMultipleColumns;

-- Easy Task 2: Find strings with % character
SELECT *
FROM TestPercent
WHERE str LIKE '%\%%' ESCAPE '\';

-- Easy Task 3: Split string by dot (.)
SELECT SPLIT_PART(column_name, '.', 1) AS Part1,
       SPLIT_PART(column_name, '.', 2) AS Part2,
       SPLIT_PART(column_name, '.', 3) AS Part3
FROM Splitter;

-- Easy Task 4: Replace all integers with 'X'
SELECT REGEXP_REPLACE('1234ABC123456XYZ1234567890ADS', '[0-9]', 'X', 'g') AS ReplacedString;

-- Easy Task 5: Rows with more than two dots
SELECT *
FROM testDots
WHERE LENGTH(Vals) - LENGTH(REPLACE(Vals, '.', '')) > 2;

-- Easy Task 6: Count spaces in a string
SELECT LENGTH(s) - LENGTH(REPLACE(s, ' ', '')) AS SpaceCount
FROM CountSpaces;

-- Easy Task 7: Employees earning more than their managers
SELECT e.*
FROM Employee e
JOIN Employee m ON e.ManagerID = m.EmployeeID
WHERE e.Salary > m.Salary;

-- Easy Task 8: Employees with 10-15 years of service
SELECT EmployeeID, FirstName, LastName, HireDate,
       FLOOR(DATEDIFF(CURRENT_DATE, HireDate) / 365) AS YearsOfService
FROM Employees
WHERE DATEDIFF(CURRENT_DATE, HireDate) BETWEEN 3650 AND 5475;

-- Medium Task 1: Separate integers and characters
SELECT 
  REGEXP_REPLACE(str, '[^0-9]', '', 'g') AS Integers,
  REGEXP_REPLACE(str, '[0-9]', '', 'g') AS Characters
FROM rtcfvty34redt;

-- Medium Task 2: Dates with higher temperature than previous day
SELECT w1.Id
FROM weather w1
JOIN weather w2 ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.Temperature > w2.Temperature;

-- Medium Task 3: First login date for each player
SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;

-- Medium Task 4: Return third item from list
SELECT SPLIT_PART(list, ',', 3) AS ThirdItem
FROM fruits;

-- Medium Task 5: Convert each character into a row
SELECT SUBSTRING(s FROM i FOR 1) AS character
FROM generate_series(1, LENGTH('sdgfhsdgfhs@121313131')) AS i(i),
     (SELECT 'sdgfhsdgfhs@121313131' AS s) AS str;

-- Medium Task 6: Join p1 and p2, replace 0 code with p2.code
SELECT p1.id, 
       CASE WHEN p1.code = 0 THEN p2.code ELSE p1.code END AS code
FROM p1
JOIN p2 ON p1.id = p2.id;

-- Medium Task 7: Determine employment stage
SELECT EmployeeID, HIRE_DATE,
  CASE
    WHEN DATEDIFF(CURRENT_DATE, HIRE_DATE) < 365 THEN 'New Hire'
    WHEN DATEDIFF(CURRENT_DATE, HIRE_DATE) < 365 * 5 THEN 'Junior'
    WHEN DATEDIFF(CURRENT_DATE, HIRE_DATE) < 365 * 10 THEN 'Mid-Level'
    WHEN DATEDIFF(CURRENT_DATE, HIRE_DATE) < 365 * 20 THEN 'Senior'
    ELSE 'Veteran'
  END AS EmploymentStage
FROM Employees;

-- Medium Task 8: Extract integer at the start of string
SELECT CAST(REGEXP_MATCHES(Vals, '^[0-9]+')[1] AS INT) AS StartInteger
FROM GetIntegers;

-- Difficult Task 1: Swap first two letters in comma-separated string
SELECT 
  CASE 
    WHEN POSITION(',' IN val) > 0 THEN 
      SUBSTRING(val FROM POSITION(',' IN val) + 1 FOR 1) || ',' || SUBSTRING(val FROM 1 FOR 1) || 
      SUBSTRING(val FROM POSITION(',' IN val) + 2)
    ELSE val
  END AS Swapped
FROM MultipleVals;

-- Difficult Task 2: First logged-in device per player
SELECT player_id, device_id
FROM Activity a
WHERE event_date = (
  SELECT MIN(event_date)
  FROM Activity
  WHERE player_id = a.player_id
)
ORDER BY player_id;

-- Difficult Task 3: Weekly percentage sales per area
WITH WeeklySales AS (
  SELECT area, 
         WEEK(sale_date) AS week, 
         SUM(sales) AS total_sales
  FROM sales
  GROUP BY area, WEEK(sale_date)
),
WeekTotal AS (
  SELECT week, SUM(total_sales) AS week_total
  FROM WeeklySales
  GROUP BY week
)
SELECT w.area, w.week,
       ROUND(100.0 * w.total_sales / wt.week_total, 2) AS percentage_of_week
FROM WeeklySales w
JOIN WeekTotal wt ON w.week = wt.week;
