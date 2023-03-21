--Select all the rows from the "Customers" table. 
SELECT * FROM Customers;

--Get distinct countries from the Customers table.
SELECT DISTINCT Country FROM Customers;

--Get all the rows from the table Customers where the Customer’s ID starts with “BL”.
SELECT * FROM Customers WHERE CustomerID LIKE 'BL%'

--Get the first 100 records of the orders table. DISCUSS: Why would you do this? What else would you likely need to include in this query?
--This could be useful if a table has a very large number of rows and you want to narrow your search and reduce computer resources needed. I would imagine you might want to look at either a specific customer ID or product.
SELECT TOP (100) * FROM Orders;

--Get all customers that live in the postal codes 1010, 3012, 12209, and 05023.
SELECT * FROM Customers WHERE PostalCode='1010' OR PostalCode='3012' OR PostalCode='12209' OR PostalCode='05023';

--Get all orders where the ShipRegion is not equal to NULL.
SELECT * FROM Orders Where NOT ShipRegion IS NULL;

--Get all customers ordered by the country, then by the city.
SELECT * FROM Customers
ORDER BY Country, City;

--Add a new customer to the customers table. You can use whatever values.
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES ('FERND', 'Ferndale Labs', 'Andrew Pullen', 'Compounder', '123 Eight Mile', 'Ferndale', 'MI', '12345', 'USA', '(555) 555-5555', NULL);

--Update all ShipRegion to the value ‘EuroZone’ in the Orders table, where the ShipCountry is equal to France.
UPDATE Orders
SET ShipRegion = 'EuroZone'
WHERE ShipCountry = 'France';

--Delete all orders from OrderDetails that have quantity of 1.
DELETE FROM [Order Details] WHERE Quantity = 1;

--Find the CustomerID that placed order 10290 (orders table).
SELECT CustomerID FROM Orders WHERE OrderID = 10290;

--Join the orders table to the customers table.
SELECT Customers.CompanyName, Orders.OrderID, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--Get employees’ firstname for all employees who report to no one.
SELECT FirstName FROM Employees Where ReportsTo IS NULL;

--Get employees’ firstname for all employees who report to Andrew.
SELECT FirstName FROM Employees Where ReportsTo = 2;




--Optional additional query practice (extended challenge):

--Calculate the average, max, and min of the quantity at the orderdetails table, grouped by the orderid.
SELECT AVG(Quantity) AS AverageQuantity
FROM [Order Details]
GROUP BY OrderID;

SELECT MAX(Quantity) AS LargestQuantity
FROM [Order Details]
GROUP BY OrderID;

SELECT MIN(Quantity) AS SmallestQuantity
FROM [Order Details]
GROUP BY OrderID;

--Calculate the average, max, and min of the quantity at the orderdetails table.
SELECT AVG(Quantity) AS AverageQuantity
FROM [Order Details];

SELECT MAX(Quantity) AS LargestQuantity
FROM [Order Details];

SELECT MIN(Quantity) AS SmallestQuantity
FROM [Order Details];

--Find all customers living in London or Paris
SELECT * FROM Customers WHERE City IN ('London', 'Paris');

--Do an inner join, left join, right join on orders and customers tables.
SELECT Customers.CustomerID, Orders.OrderID, Orders.Freight
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT Orders.ShippedDate, Customers.CompanyName, Customers.Country
FROM Orders
LEFT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

SELECT Orders.RequiredDate, Customers.ContactName, Customers.ContactTitle
FROM Orders
LEFT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

--Make a list of cities where customers are coming from. The list should not have any duplicates or nulls.
SELECT DISTINCT City FROM Customers WHERE NOT City IS NULL;

--Show a sorted list of employees’ first names. 
SELECT FirstName From Employees
ORDER BY FirstName;

--Find total for each order
SELECT (UnitPrice - Discount) * Quantity AS OrderTotal FROM [Order Details];

--Get a list of all employees who got hired between 1/1/1994 and today
SELECT * FROM Employees WHERE HireDate BETWEEN '1994-01-01' AND GETDATE();

--Find how long employees have been working for Northwind (in years!)
SELECT FirstName, DATEDIFF(year, HireDate, GETDATE()) AS TotalYears FROM Employees;

--Get a list of all products sorted by quantity (ascending and descending order)
SELECT * FROM Products
ORDER BY UnitsInStock ASC;

SELECT * FROM Products
ORDER BY UnitsInStock DESC;

--Find all products that are low on stock (quantity less than 6)
SELECT * FROM Products WHERE UnitsInStock < 6;

--Find a list of all discontinued products.
SELECT * FROM Products WHERE Discontinued = 1;

--Find a list of all products that have Tofu in them.
SELECT * FROM Products WHERE ProductName LIKE '%Tofu%';

--Find the product that has the highest unit price.
SELECT * FROM Products WHERE (UnitPrice=(SELECT MAX(UnitPrice) FROM Products));

--Get a list of all employees who got hired after 1/1/1993
SELECT * FROM Employees WHERE HireDate > '1993-01-01';

--Get all employees who have title : “Ms.” And “Mrs.”
SELECT * FROM Employees WHERE TitleOfCourtesy = 'Ms.' OR TitleOfCourtesy = 'Mrs.';

--Get all employees who have a Home phone number that has area code 206
SELECT * FROM Employees WHERE HomePhone LIKE '(206)%';
