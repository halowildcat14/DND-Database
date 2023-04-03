SET SHOWPLAN_ALL OFF
GO 

SET STATISTICS IO ON
SET STATISTICS TIME ON
GO

DECLARE @InvoiceTotal money
SELECT @InvoiceTotal = sum(UnitPrice*Quantity)
FROM [order details]
WHERE orderid = 10248
SELECT @InvoiceTotal InvoiceTotal
DECLARE @LineTotal money
--DECLARE @InvoiceTotal money
SET @LineTotal = 0
SET @InvoiceTotal = 0
DECLARE Line_Item_Cursor CURSOR FOR
SELECT UnitPrice*Quantity
FROM [order details]
WHERE orderid = 10248
OPEN Line_Item_Cursor
FETCH NEXT FROM Line_Item_Cursor INTO @LineTotal
WHILE @@FETCH_STATUS = 0
BEGIN
SET @InvoiceTotal = @InvoiceTotal + @LineTotal
FETCH NEXT FROM Line_Item_Cursor INTO @LineTotal
END
CLOSE Line_Item_Cursor DEALLOCATE Line_Item_Cursor
SELECT @InvoiceTotal InvoiceTotal