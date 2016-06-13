
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Security].[GetUserAuthTokenId] (
	@Username VARCHAR(50)
	,@KillOldSession BIT = 0
	)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @userId BIGINT
	DECLARE @authTokenReturn VARCHAR(36)

	SET @userId = (
			SELECT UserId
			FROM [Security].[User] u
			WHERE u.Username = @Username
			)

	IF ISNULL(@userId, 0) > 0
	BEGIN
		IF (@KillOldSession = 1)
		BEGIN
			UPDATE [Security].[UserAuthToken]
			SET ExpiresUtc = GETUTCDATE()
				,AccessToken = NULL
				,IsLoggedIn = 0
				,UpdatedDate = GETDATE()
			WHERE UserId = @userId
		END

		SET @authTokenReturn = (SELECT REPLACE(CAST(NEWID() AS VARCHAR(36)), '-', ''));

		INSERT INTO [Security].[UserAuthToken] (
			UserAuthTokenId
			,UserId
			,IssuedUtc
			,ExpiresUtc
			,IsLoggedIn
			,CreatedDate
			,UpdatedDate
			,IPAddress
			)
		VALUES (
			@authTokenReturn
			,@UserId
			,GETUTCDATE()
			,GETUTCDATE()
			,0
			,GETDATE()
			,GETDATE()
			,N''
			);
	END

	SELECT @authTokenReturn UserAuthTokenId;
END;


GO
