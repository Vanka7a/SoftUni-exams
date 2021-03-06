-- Link for downloading the SoftUni, Geography and Diablo databases used for the exercises:
-- https://softuni.bg/downloads/svn/csharp-databases/2021-January/01.%20MSSQL-Server/02.%20CRUD/02.%20CRUD-Databases.zip


-- Part I � Queries for SoftUni Database

-- 02. Write a SQL query to find all available information about the Departments
SELECT * FROM Departments

-- 03. Write SQL query to find all Department names
SELECT Name FROM Departments

-- 04. Write SQL query to find the first name, last name and salary of each employee
SELECT FirstName, LastName, Salary FROM Employees

-- 05. Write SQL query to find the first, middle and last name of each employee
SELECT FirstName, MiddleName, LastName FROM Employees

-- 06. Write a SQL query to find the email address of each employee. (By his first and last name). 
--     Consider that the email domain is softuni.bg. Emails should look like �John.Doe@softuni.bg".
--     The produced column should be named "Full Email Address". 
SELECT FirstName + '.' + LastName + '@softuni.bg' AS [Full Email Address] FROM Employees

-- 07. Write a SQL query to find all different employee�s salaries. Show only the salaries
SELECT DISTINCT Salary FROM Employees

-- 08. Write a SQL query to find all information about the employees whose job title is �Sales Representative�.
SELECT * FROM Employees
WHERE JobTitle = 'Sales Representative'

-- 09. Write a SQL query to find the first name, last name and job title of all employees whose salary is in the range [20000, 30000].
SELECT FirstName, LastName, JobTitle FROM Employees
WHERE Salary >= 20000 AND Salary <= 30000

-- 10. Write a SQL query to find the full name of all employees whose salary is 25000, 14000, 12500 or 23600. 
--     Full Name is combination of first, middle and last name (separated with single space) and they should be in one column called �Full Name�.
SELECT FirstName + ' ' + MiddleName + ' ' + LastName AS [Full Name] FROM Employees
WHERE Salary IN (25000, 14000, 12500, 23600)

-- 11. Write a SQL query to find first and last names about those employees that does not have a manager. 
SELECT FirstName, LastName FROM Employees
WHERE ManagerID IS NULL

-- 12. Write a SQL query to find first name, last name and salary of those employees who has salary more than 50000.
--     Order them in decreasing order by salary.
SELECT FirstName, LastName, Salary FROM Employees
WHERE Salary > 50000
ORDER BY Salary DESC

-- 13. Write SQL query to find first and last names about 5 best paid Employees ordered descending by their salary.
SELECT TOP(5) FirstName, LastName FROM Employees
ORDER BY Salary DESC

-- 14. Write a SQL query to find the first and last names of all employees whose department ID is different from 4.
SELECT FirstName, LastName FROM Employees
WHERE DepartmentID != 4

-- 15. Write a SQL query to sort all records in the Employees table by the following criteria:
--     First by salary in decreasing order, then by first name alphabetically, then by last name descending, then by middle name alphabetically
SELECT * FROM Employees
ORDER BY Salary DESC, FirstName, LastName DESC, MiddleName

-- 16. Write a SQL query to create a view V_EmployeesSalaries with first name, last name and salary for each employee.
CREATE VIEW V_EmployeesSalaries AS
SELECT FirstName, LastName, Salary FROM Employees

-- 17. Write a SQL query to create view V_EmployeeNameJobTitle with full employee name and job title. 
--     When middle name is NULL replace it with empty string (��).
CREATE VIEW V_EmployeeNameJobTitle AS
SELECT FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS [Full Name], JobTitle AS [Job Title] FROM Employees

-- 18. Write a SQL query to find all distinct job titles.
SELECT DISTINCT JobTitle FROM Employees

-- 19. Write a SQL query to find first 10 started projects. Select all information about them and sort them by start date, then by name.
SELECT TOP(10) * FROM Projects
ORDER BY StartDate, Name

-- 20. Write a SQL query to find last 7 hired employees. Select their first, last name and their hire date.
SELECT TOP(7) FirstName, LastName, HireDate FROM Employees
ORDER BY HireDate DESC

-- 21. Write a SQL query to increase salaries of all employees that are in the Engineering, Tool Design, Marketing or Information Services department by 12%. 
--     Then select Salaries column from the Employees table. After that exercise restore your database to revert those changes.
UPDATE Employees
SET Salary *= 1.12
WHERE DepartmentID IN (1, 2, 4, 11)

SELECT Salary FROM Employees


-- Part II � Queries for Geography Database

-- 22. Display all mountain peaks in alphabetical order.
SELECT PeakName FROM Peaks
ORDER BY PeakName

-- 23. Find the 30 biggest countries by population from Europe. Display the country name and population. 
--     Sort the results by population (from biggest to smallest), then by country alphabetically.
SELECT TOP(30) CountryName, Population FROM Countries
WHERE ContinentCode = 'EU'
ORDER BY Population DESC, CountryName

-- 24. Find all countries along with information about their currency. 
--     Display the country name, country code and information about its currency: either "Euro" or "Not Euro". Sort the results by country name alphabetically.
SELECT CountryName, CountryCode,
CASE 
	WHEN CurrencyCode = 'EUR' THEN 'Euro'
	ELSE 'Not Euro'
END AS Currency 
FROM Countries
ORDER BY CountryName


-- Part III � Queries for Diablo Database

-- 25. Display all characters in alphabetical order.
SELECT Name FROM Characters
ORDER BY Name