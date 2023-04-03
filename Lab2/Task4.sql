USE NWindmalikjp38
Go
SET ROWCOUNT 5
SELECT ProductName, QuantityPerUnit, UnitPrice
FROM Products
WHERE CategoryID = 4
ORDER BY UnitPrice DESC
