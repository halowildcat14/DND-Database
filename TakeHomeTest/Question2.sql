USE Pubsmalikjp38
GO


if EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[INSTEADOF_INSERT_DISCOUNTS]'))
drop trigger INSTEADOF_INSERT_DISCOUNTS;
go

CREATE TRIGGER INSTEADOF_INSERT_DISCOUNTS ON discounts
INSTEAD OF INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @disType varchar(40), @highQty smallint, 
	@dis decimal(4,2), @lowQty smallint
	Select @disType = discounttype, @highQty = highqty,
	@dis = discount, @lowQty = lowqty FROM INSERTED
	IF(@highQty <= 1000 OR @dis <= 12)
	BEGIN
		IF EXISTS (SELECT * FROM DELETED)
		BEGIN
			UPDATE discounts
			SET highqty = @highQty, lowqty = @lowQty, discount = @dis
			Where discounttype = @disType
		END
		ELSE
		BEGIN
			INSERT discounts
			VALUES(@disType, null, @lowQty, @highQty, @dis)
		END
	END
	ELSE
	BEGIN
		RAISERROR (N'Discount and highqty are too big',16, 1)
	END
END
GO
