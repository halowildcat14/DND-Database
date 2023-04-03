USE NWindmalikjp38
Go


SELECT CustomerID, ContactName
FROM Customers
WHERE NOT EXISTS (SELECT * FROM Orders where Customers.CustomerID = Orders.CustomerID)


SELECT Customers.CustomerID, ContactName
FROM Customers
LEFT JOIN Orders ON Orders.CustomerID = Customers.CustomerID
WHERE OrderID IS NULL


--I believe the first one is more appropriet as this is the situation that this Command was really designed for
--It figures out which rows dont match what is being asked, while
--The left join gets the whole table then checks if OrderID is NULL