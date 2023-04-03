CREATE PROCEDURE [update_Order Details_1]
(@OrderID_1 [int],
 @ProductID_2 [int],
 @NewUnitPrice_3 [money] = -1,
 @NewQuantity_4 [smallint]= -1,
 @NewDiscount_5 [real] = -1)
AS
-- Update Order Detail values
BEGIN TRY
--Check if there is a change to quantity
IF @NewQuantity_4 >= 0
	--Check if there is enough product to order
	IF (SELECT UnitsInStock from Products WHERE ProductID = @ProductID_2) < (@NewQuantity_4 - (SELECT Quantity from [Order Details]
	 WHERE ProductID = @ProductID_2 AND OrderID = @OrderID_1))
		THROW 50000, 'Not Enough Product', 0;
	ELSE
		UPDATE [Order Details]
		SET [Quantity] = @NewQuantity_4
		WHERE ( [OrderID] = @OrderID_1 AND [ProductID] = @ProductID_2);

--Check if price is being changed
IF @NewUnitPrice_3 >= 0
	UPDATE [Order Details]
	SET [UnitPrice] = @NewUnitPrice_3
	WHERE ( [OrderID] = @OrderID_1 AND [ProductID] = @ProductID_2);

--Check if discount is being changed
IF @NewDiscount_5 >= 0
	UPDATE [Order Details]
	SET [Discount] = @NewDiscount_5
	WHERE ( [OrderID] = @OrderID_1 AND [ProductID] = @ProductID_2);


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


