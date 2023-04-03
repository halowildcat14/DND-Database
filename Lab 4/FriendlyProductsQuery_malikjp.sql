use NWindmalikjp38
go

IF object_id(N'FriendlyProducts', 'V') IS NOT NULL
	DROP VIEW FriendlyProducts
GO

CREATE VIEW FriendlyProducts AS
SELECT        Products.ProductID, Products.ProductName, Products.QuantityPerUnit, Products.UnitPrice, Suppliers.CompanyName, Categories.CategoryName
FROM            Products INNER JOIN
                         Categories ON Products.CategoryID = Categories.CategoryID INNER JOIN
                         Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Products.Discontinued = 0 