
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Security].[AddNewUser] (
	@UserName VARCHAR(50)
	,@EmailAddress VARCHAR(50)
	,@Password VARCHAR(50)
	,@Enabled BIT = 1
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT TOP 1 1
			FROM [Security].[User] u
			WHERE u.[Username] = @UserName
				OR u.[EmailAddress] = @UserName
			)
	BEGIN
		DECLARE @SecurityId UNIQUEIDENTIFIER = NEWID()
			,@UserId BIGINT;

		INSERT INTO [Security].[User] (
			[SecurityId]
			,[Username]
			,[EmailAddress]
			,[Enabled]
			,[Created]
			)
		VALUES (
			@SecurityId
			,@UserName
			,@EmailAddress
			,@Enabled
			,GETDATE()
			);

		SET @UserId = (
				SELECT CAST(SCOPE_IDENTITY() AS BIGINT) AS UserId
				)

		INSERT INTO [Security].[UserPassword] (
			UserId
			,[Password]
			,UpdatedBy
			)
		VALUES (
			@UserId
			,@Password
			,@UserId
			)

		SELECT @UserId UserId;
	END;
	ELSE
	BEGIN
		DECLARE @name VARCHAR(150) = @UserName;

		IF (ISNULL(@EmailAddress, '') <> '')
		BEGIN
			SET @name = (@name + ' / ' + @EmailAddress);
		END

		RAISERROR (
				45120
				,16
				,1
				,@name
				)
	END
END;
GO
