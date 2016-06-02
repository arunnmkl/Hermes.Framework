DECLARE @SecurityId UNIQUEIDENTIFIER = NEWID()
	,@Username VARCHAR(50) = N'oauth'
	,@Password VARCHAR(50) = N'h7ctywWpXLW/oTqXNdYzrw==' -- Decrypted String --> password
	,@EmailAddress VARCHAR(50) = N'email@dreamorbit.com'
	,@Enabled BIT = 1
	,@Created DATETIME = GETDATE()
	,@userId BIGINT

IF NOT EXISTS (
		SELECT TOP 1 1
		FROM [Security].[User] u
		WHERE u.[Username] = @Username
		)
BEGIN
	INSERT INTO [Security].[User] (
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

    Set @userId = SCOPE_IDENTITY()
    Select @userId UserId
END
GO


