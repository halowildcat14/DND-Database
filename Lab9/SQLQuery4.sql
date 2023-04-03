CREATE PROCEDURE [insert_Order Details_1]
(@OrderID_1 [int],
 @ProductID_2 [int],
 @UnitPrice_3 [money] = -1,
 @Quantity_4 [smallint],
 @Discount_5 [real] = 0)
AS
BEGIN TRY

--Check if enough product in stock

--if no price given, find original price
IF @UnitPrice_3 < 0
	SET @UnitPrice_3 = (SELECT UnitPrice From Products WHERE [ProductID] = @ProductID_2);

--add the order
BEGIN TRANSACTION
INSERT INTO [Order Details]
 ( [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount])
VALUES ( @OrderID_1, @ProductID_2, @UnitPrice_3, @Quantity_4, @Discount_5)

IF (SELECT UnitsInStock FRom [Products] WHERE [ProductID] = @ProductID_2) < @Quantity_4
	--ROLLBACK TRANSACTION
	THROW 1, 'Not Enough Product', 1
ELSE	
--update quantity
UPDATE [Products]
SET [UnitsInStock] = [UnitsInStock] - @Quantity_4
WHERE [ProductID] = @ProductID_2

--if need to reorder print message
IF (SELECT UnitsInStock FRom [Products] WHERE [ProductID] = @ProductID_2) < (SELECT ReorderLevel FRom [Products] WHERE [ProductID] = @ProductID_2)
	PRINT "Please reorder the product";

END TRY

BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO