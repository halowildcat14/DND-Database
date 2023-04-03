USE [SpellBookDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createTool]
	@eName varchar(50), 
	@description varchar(1024)
AS
-- Supress row count messages
SET NOCOUNT ON
BEGIN
	if @eName is null OR @eName = ''
	BEGIN
		PRINT 'ERROR: Tool name cannot be null or empty';
		RETURN (1)
	END
	IF (SELECT COUNT(*) FROM Weapon
          WHERE EName = @eName) = 1
	BEGIN
      PRINT 'ERROR: Tool name already exists.';
	  RETURN(2)
	END

	if @description is null OR @description = ''
	BEGIN
      PRINT 'ERROR: Description required.';
	  RETURN(3)
	END


	INSERT INTO Tool(EName, Description) 
	VALUES(@eName, @description);


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