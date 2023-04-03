USE NWindmalikjp38
Go
SELECT Products.ProductID, ProductName, Quantity, Products.UnitPrice,
	Discount, Products.UnitPrice - Products.UnitPrice * Discount AS ActualPrice
	FROM Products, [Order Details]
	WHERE UnitsInStock >0 AND UnitsInStock < 20 
	ORDER BY Quantity ASC, Products.ProductID
	