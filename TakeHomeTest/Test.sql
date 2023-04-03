USE Pubsmalikjp38
GO

DELETE FROM discounts
WHERE discounttype = 'discount'
PRINT('deleteD')
GO

DELETE FROM discounts
WHERE discounttype = 'both'
PRINT('deleteD')
GO

DELETE FROM discounts
WHERE discounttype = 'highqty'
PRINT('deleteD')
GO


PRINT('insertB')
INSERT INTO discounts VALUES ('both', '2040', '0', 1000, 12.00)

GO

PRINT('insertD')
INSERT INTO discounts VALUES ('discount', '2040', '0', 1001, 12.00)

GO

PRINT('insertH')
INSERT INTO discounts VALUES ('highqty', '2040', '0', 5, 13.00)

GO

PRINT('insertERROR')
INSERT INTO discounts VALUES ('Error', '2040', '0', 1001, 13.00)

GO

PRINT('Update1')
UPDATE discounts
Set highqty = 1001, discount = 12
WHERE discounttype = 'both'
GO

PRINT('Update2')
UPDATE discounts
Set discount = 13
WHERE discounttype = 'both'
GO

PRINT('Update3')
UPDATE discounts
Set highqty = 1000, discount = 13
WHERE discounttype = 'both'
GO
