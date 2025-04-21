 1. BULK INSERT: Used to efficiently load large data files into a table

 2. File Formats: CSV, TXT, XML, JSON

 3. Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

 4. Insert records into Products
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1, 'Laptop', 999.99),
(2, 'Mouse', 19.99),
(3, 'Keyboard', 49.99);

 5. NULL vs NOT NULL
 NULL: Value can be unknown
 NOT NULL: Value must be present

 6. Add UNIQUE constraint
ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

 7. SQL Comment Example
 This query selects all products with price above 50
SELECT * FROM Products WHERE Price > 50;

 8. Create Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

 9. IDENTITY column: Used to auto-increment numeric values


 10. BULK INSERT
 BULK INSERT Products
 FROM 'C:\Data\products.txt'
 WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', FIRSTROW = 2);

 11. Add FOREIGN KEY to Products
ALTER TABLE Products ADD CategoryID INT;
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

 12. PRIMARY KEY vs UNIQUE KEY
 PRIMARY KEY: Only one, not nullable
 UNIQUE: Allows nulls, multiple allowed

 13. Add CHECK constraint
ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);

 14. Add Stock column
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

 15. ISNULL example
SELECT ProductName, ISNULL(Stock, 0) AS AvailableStock FROM Products;

 16. FOREIGN KEY ensures referential integrity

 17. Customers table with CHECK
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT CHECK (Age >= 18)
);

 18. Table with IDENTITY starting at 100
CREATE TABLE Sample (
    ID INT IDENTITY(100, 10) PRIMARY KEY,
    Name VARCHAR(50)
);

 19. Composite PRIMARY KEY
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);

 20. COALESCE vs ISNULL
SELECT ISNULL(NULL, 'Default'); -- 'Default'
SELECT COALESCE(NULL, NULL, 'Fallback'); -- 'Fallback'

 21. Employees table with PRIMARY and UNIQUE
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);

 22. FOREIGN KEY with CASCADE
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
