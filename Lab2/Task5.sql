USE NWindmalikjp38
Go
SELECT Orders.OrderID, Quantity, OrderDate, CompanyName, ContactName
FROM Orders
FULL JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
ORDER BY OrderID ASC

--Full Join is to just connect the two tables
--I use the left Join to get rid of all ones that do not have an order ID