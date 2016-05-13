SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[AddNewUser] (
	@UserName VARCHAR(50)
	,@EmailAddress VARCHAR(50)
	,@Password VARCHAR(50)
	,@Enabled BIT = 1
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT TOP 1 1
			FROM dbo.[User] u
			WHERE u.[Username] = @UserName
				OR u.[EmailAddress] = @UserName
			)
	BEGIN
		DECLARE @SecurityId UNIQUEIDENTIFIER = NEWID();

		INSERT INTO [dbo].[User] (
			[SecurityId]
			,[Username]
			,[Password]
			,[EmailAddress]
			,[Enabled]
			,[Created]
			)
		VALUES (
			@SecurityId
			,@UserName
			,@Password
			,@EmailAddress
			,@Enabled
			,GETDATE()
			);

		SELECT CAST(SCOPE_IDENTITY() AS BigINT) AS UserId;
	END;
	ELSE
	BEGIN
		DECLARE @name VARCHAR(150) = @UserName;
		IF (ISNULL(@EmailAddress, '') <> '') 
           BEGIN 
		  Set @name = (@name + ' / ' + @EmailAddress);
           END

		RAISERROR (45120, 16, 1, @name)
	END
END;

GO
