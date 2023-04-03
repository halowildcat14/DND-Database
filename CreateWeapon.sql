USE [SpellBookDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createWeapon]
	@eName varchar(50), 
	@Damage varchar(20),
	@type varchar(50),
	@properties varchar(1024)
AS
-- Supress row count messages
SET NOCOUNT ON
BEGIN
	if @eName is null OR @eName = ''
	BEGIN
		PRINT 'ERROR: Weapon name cannot be null or empty';
		RETURN (1)
	END
	IF (SELECT COUNT(*) FROM Weapon
          WHERE EName = @eName) = 1
	BEGIN
      PRINT 'ERROR: Weapon name already exists.';
	  RETURN(2)
	END

	if @Damage is null OR @Damage = ''
	BEGIN
      PRINT 'ERROR: Damage required.';
	  RETURN(3)
	END

	if @type is null OR @type = ''
	BEGIN
      PRINT 'ERROR: type required.';
	  RETURN(4)
	END

	if @properties is null OR @properties = ''
	BEGIN
      PRINT 'ERROR: Properties required.';
	  RETURN(5)
	END

	INSERT INTO Weapon(EName, Damage, Type, Properties) 
	VALUES(@eName, @Damage, @type, @properties);


	-- Check for errors
	DECLARE @Status SMALLINT
	SET @Status = @@ERROR
	IF @Status <> 0 
	BEGIN
		-- Return error code to the calling program to indicate failure.
		PRINT 'An error occurred creating the weapon ' + CONVERT(varchar(30), @eName) + '.'
		RETURN(@Status)
	END
	ELSE
	BEGIN
		-- Return 0 to the calling program to indicate success.
		PRINT 'The details for the weapon ' + CONVERT(varchar(30), @eName) + ' were created successfully.'
		RETURN(0)
	END

END
GO