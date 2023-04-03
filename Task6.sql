USE NWindmalikjp28
Go

SELECT CustomerID, ContactName
FROM Customers
WHERE NOT EXISTS (SELECT * FROM Orders where Customers.CustomerID = Orders.CustomerID)

SELECT Customers.CustomerID, ContactName
FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE OrderID = NULL