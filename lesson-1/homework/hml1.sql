1. Data is graphs, numbers, quantities, information, facts, observations and measurment

2. Five key features of SQL Server:
	Store data.
	Retrieve data.
	Manage data.
	Joining Tables for Comprehensive Insights.
	Aggregation and Grouping.
	Sorting Data for Analysis

3.	Windows Authentification, SQL Server Authentification

4.	create database SchoolDB

5.	create table Students (StudentID INT PRIMARY KEY, Name VARCHAR(50), Age INT)

6.	SQL Server is a relational database management system (RDBMS) developed by Microsoft. 
	SSMS (SQL Server Management Studio) is a graphical user interface (GUI) tool to manage SQL Server.
	SQL is a programming language used to interact with databases.

7.	SQL commands are grouped into five main categories:
	DQL (Data Query Language), key commands - SELECT
	DML (Data Manipulation Language), key commands - INSERT, UPDATE, DELETE
	DDL (Data Definition Language), key commands - CREATE, ALTER, DROP, TRUNCATE
	DCL (Data Control Language), key commands - GRANT, REVOKE
	TCL (Transaction Control Language), key commands - COMMIT, ROLLBACK, SAVEPOINT

8.	insert into Students values 
	(1, 'Ali', 21),
	(2, 'Vali', 24),
	(3, 'Toni', 22);

9.	BACKUP DATABASE SchoolDB  
	TO DISK = 'C:\Backup\SchoolDB_Backup.bak'  
	WITH FORMAT, MEDIANAME = 'SQLServerBackup', NAME = 'Full Backup of SchoolDB';

	RESTORE DATABASE SchoolDB  
	FROM DISK = 'C:\Backup\SchoolDB_Backup.bak'  
	WITH REPLACE, RECOVERY;
