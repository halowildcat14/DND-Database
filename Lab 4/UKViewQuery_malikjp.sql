-- =============================================
-- Create View template
-- =============================================
USE NWindmalikjp38
GO

IF object_id(N'UKViewQuary', 'V') IS NOT NULL
	DROP VIEW UKViewQuary
GO

CREATE VIEW UKViewQuary AS
SELECT        Orders.OrderID, Orders.CustomerID, Shippers.CompanyName, Orders.ShipName, Orders.ShipCity, Orders.ShipCountry
FROM            Orders INNER JOIN
                         Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE        (Orders.OrderID > 10399) AND (Orders.OrderID < 10601) AND (Orders.ShipCountry = 'UK')