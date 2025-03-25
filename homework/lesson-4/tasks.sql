select top 5* from Employees

select distinct(ProductName) from Products3

select * from Products where Price > 100

select * from Customers8 where CustomerName like 'A%'

select * from Products order by Price asc

select * from Employees where Salary >= 5000 and Department = 'HR'

select isnull (Email,'noemail@example.com')  from Table

select Price from Products where Price between 50 and 100

select distinct Category, ProductName from Products3

select ProductName from Products3 order by ProductName desc

select top 10* from Products order by Price desc

select coalesce (FirstName, LastName) from Employees

select distinct Category, Price from Products

select * from Employees where Age between 30 and 40 or Department = 'Marketing'

select * from Employees order by Salary desc offset 10 rows fetch next 10 rows only

select * from Products where Price <= 1000 and StockQuantity > 50 order by StockQuantity asc

select * from Products3 where ProductName like '%e%'

select * from EmployeeDepartments where DepartmentName in ('HR', 'IT', 'Finance')

select * from Employees where Salary > ANY (select avg(Salary) from Employees)

select * from Customers3 order by City asc, PostalCode desc

select top(10)* from Sales order by SaleAmount desc

select coalesce (FirstName,' ') + ' ' + COALESCE(LastName, ' ') as FullName from Employees

select distinct Category, ProductName, Price from Products3 where Price > 50

select * from Products where Price < (select avg(Price) from Products)*0.1

select * from Employees where Age < 30 and (Department = 'HR' or Department = 'IT')

select * from Customers where Email like '@gmail.com'

select * from Employees where Salary > All (select Salary from Employees where DepartmentID = 1)

select * from Employees order by Salary desc offset 0 rows fetch next 10 rows only

select * from Orders3 where OrderDate between DATEADD (DAY, -30, '2025.03.25') and '2025.03.25'

select * from Employees e where Salary > any (select avg(Salary) from Employees r where e.DepartmentID = r.DepartmentID group by DepartmentID)

