USE NWindmalikjp38
Go

ALTER trigger updateProduct
ON [Order Details]
INSTEAD OF INSERT AS
DECLARE @units_remaining AS INTEGER
DECLARE @q AS INTEGER, @id AS INTEGER
SELECT @q=Quantity, @id=ProductID FROM inserted
SELECT @units_remaining=UnitsInStock-@q FROM Products WHERE ProductID=@id 
IF @units_remaining < 0
BEGIN
	PRINT 'Cannot be added'
END
ELSE
BEGIN
	UPDATE Products
	Set UnitsInStock=@units_remaining
	WHERE ProductID=@id
	INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
	SELECT OrderID, ProductID, UnitPrice, Quantity, Discount
	FROM inserted
END