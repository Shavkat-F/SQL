create table Employees (EmpID INT, Name VARCHAR(50), Salary DECIMAL(10,2))

insert into Employees values
 (1, 'Abc', 123.45)

insert into Employees values
 (2, 'Asd', 1234.56),
 (3, 'Qwe', 123245.67);

update Employees Set Salary = 543.21 where EmpID = 1

delete from Employees where EmpID = 2 

create table TestTable (EmpID INT, Name VARCHAR(50), Salary DECIMAL(10,2))
insert into TestTable values
 (1, 'Abc', 123.45),
 (2, 'Asd', 1234.56),
 (3, 'Qwe', 123245.67);

 delete from TestTable where EmpID = 2
 truncate table TestTable
 drop Table TestTable

alter table Employees alter column Name VARCHAR(100)
alter table Employees add Department varchar (50)
alter table Employees alter column Salary float
create table Departments (DepartmentID INT PRIMARY KEY, DepartmentName VARCHAR(50))
truncate table Employees

insert into Lesson2.dbo.Departments (DepartmentID, DepartmentName, Salary)
select DepartmentID, DepartmentName, (select top 5 max(Salary) from [Tables1_10].[dbo].[Employees] as e where e.DepartmentID = d.DepartmentID group by e.DepartmentID) as Salary from [Tables1_10].[dbo].[Departments] as d
select * from  Lesson2.dbo.Departments

update Lesson2.dbo.Departments set DepartmentName = 'Management' where Salary > 52000

truncate table Lesson2.dbo.Employees

alter table  Lesson2.dbo.Employees drop column Department

exec sp_rename 'Employees', 'StaffMembers'

drop table Departments

create table Products (ProductID int Primary Key, ProductName varchar (50), Category varchar (50), Price DECIMAL check (Price > 0))

alter table Products add StockQuantity int default 50

exec sp_rename 'Products.Category', 'ProductCategory' , 'column'

insert into Products (ProductID, ProductName, ProductCategory, Price, StockQuantity)
values
(1, 'Laptop', 'Electronics', 1200.00, 30),
(2, 'Phone', 'Electronics', 800.00, 50),
(3, 'Desk', 'Furniture', 200.00, 20),
(4, 'Chair', 'Furniture', 100.00, 40),
(5, 'Notebook', 'Stationery', 5.00, 100);

SELECT * INTO Products_Backup FROM Products

exec sp_rename 'Products', 'Inventory'

alter table Inventory alter column Price float;

CREATE TABLE Inventory_New (
    ProductCode INT IDENTITY(1000, 5) PRIMARY KEY,
    ProductID INT,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(100),
    Price FLOAT,
    StockQuantity INT
);

INSERT INTO Inventory_New (ProductID, ProductName, ProductCategory, Price, StockQuantity)
SELECT ProductID, ProductName, ProductCategory, Price, StockQuantity
FROM Inventory;

