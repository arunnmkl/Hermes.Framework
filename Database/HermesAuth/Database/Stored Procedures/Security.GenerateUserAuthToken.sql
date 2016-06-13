
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Security].[GenerateUserAuthToken] (
	@Username VARCHAR(50)
	,@CheckExistence BIT = 0
	,@KillOldSession BIT = 0
	)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @userId BIGINT
	DECLARE @authTokenReturn VARCHAR(36) = NULL

	SET @userId = (SELECT UserId FROM [Security].[User] u WHERE u.Username = @Username)

	IF ISNULL(@userId, 0) > 0
	BEGIN
		IF (@KillOldSession = 1)
		BEGIN
			UPDATE [Security].[UserAuthToken]
			SET ExpiresUtc = GETUTCDATE()
				,AccessToken = NULL
				,IsLoggedIn = 0
				,UpdatedDate = GETDATE()
			WHERE UserId = @userId And IsExpired = 0

			DELETE rt FROM [Security].[RefreshToken] rt 
			Inner Join [Security].[UserAuthToken] uat on uat.UserAuthTokenId = rt.UserAuthTokenId 
			WHERE UserId = @userId
		END

		IF (@CheckExistence = 1)
		BEGIN
			IF EXISTS (SELECT TOP 1 1 FROM [Security].[UserAuthToken] uat WHERE uat.UserId = @userId AND uat.IsExpired = 0)
			BEGIN
				SELECT @authTokenReturn UserAuthToken;
				RETURN;
			END
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
