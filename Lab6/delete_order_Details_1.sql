CREATE PROCEDURE [delete_Order Details_1]
(@OrderID_1 [int],
 @ProductID_2 [int],
 @Return_Value [int])
AS
--Delete the row with the given OrderID and ProductID in OrderDetails
BEGIN TRY

--Update products in stock
UPDATE [Products]
SET [UnitsInStock] = ([UnitsInStock] - [Quantity])
FROM [Order Details] AS OD
WHERE ( [OrderID] = @OrderID_1 AND OD.[ProductID]= @ProductID_2)

--Delete order
DELETE [Order Details]
WHERE ( [OrderID] = @OrderID_1 AND [ProductID]= @ProductID_2)

--If succedee return value
SELECT @Return_Value = 0

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
