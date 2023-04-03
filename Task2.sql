USE NWindmalikjp38
Go
SELECT TOP 8 ProductID, ProductName, UnitsInStock, UnitPrice
	FROM Products
	WHERE UnitsInStock >0 AND UnitsInStock < 20 
	ORDER BY UnitPrice DESC
	