USE NWindmalikjp28
Go
SET ROWCOUNT 6
SELECT ProductName, QuantityPerUnit, UnitPrice
FROM Products
WHERE CategoryID = 4
ORDER BY UnitPrice DESC
