SET SHOWPLAN_ALL OFF
GO 

SET STATISTICS IO ON
SET STATISTICS TIME ON
GO 

SELECT o.OrderID, c.CustomerID, c.ContactName, p.ProductName,
 (od.UnitPrice * od.Quantity * (1 - od.Discount)) AS Subtotal
FROM [Order Details] AS od, Orders AS o, Customers AS c, Products AS p
WHERE od.OrderID = o.OrderID AND c.CustomerID = o.CustomerID AND
p.ProductID = od.ProductID
ORDER BY Subtotal DESC 