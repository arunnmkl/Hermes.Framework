DECLARE @SecurityId UNIQUEIDENTIFIER = NEWID()
	,@Username VARCHAR(50) = N'username'
	,@Password VARCHAR(50) = N'h7ctywWpXLW/oTqXNdYzrw==' -- Decrypted String --> password
	,@EmailAddress VARCHAR(50) = N'email@dreamorbit.com'
	,@Enabled BIT = 1
	,@Created DATETIME = GETDATE()

IF NOT EXISTS (
		SELECT TOP 1 1
		FROM [dbo].[User] u
		WHERE u.[Username] = @Username
		)
BEGIN
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
		,@Username
		,@Password
		,@EmailAddress
		,@Enabled
		,@Created
		)
END
GO


