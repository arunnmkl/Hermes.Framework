DECLARE @AuthClientId VARCHAR(128) = N'ngAuthApp'
	,@Secret VARCHAR(1000) = NEWID()
	,@Name VARCHAR(100) = N'OAuth Client 1'
	,@ApplicationType INT = 0 -- 0 Javascript, 1 - NativeConfidential
	,@IsActive BIT = 1
	,@RefreshTokenLifeTime INT = 60 -- Minutes
	,@AllowedOrigin VARCHAR(100) = N'http://localhost:56379'

IF NOT EXISTS (
		SELECT TOP 1 1
		FROM [dbo].[AuthClient] ac
		WHERE ac.[AuthClientId] = @AuthClientId
		)
BEGIN
	INSERT INTO [dbo].[AuthClient] (
		[AuthClientId]
		,[Secret]
		,[Name]
		,[ApplicationType]
		,[IsActive]
		,[RefreshTokenLifeTime]
		,[AllowedOrigin]
		)
	VALUES (
		@AuthClientId
		,@Secret
		,@Name
		,@ApplicationType
		,@IsActive
		,@RefreshTokenLifeTime
		,@AllowedOrigin
		)
END
GO


