USE NWindmalikjp38
GO

SELECT        ProductID, ProductName, QuantityPerUnit, UnitPrice, CompanyName, CategoryName
FROM            FriendlyProducts
WHERE        (UnitPrice > 100)
GO