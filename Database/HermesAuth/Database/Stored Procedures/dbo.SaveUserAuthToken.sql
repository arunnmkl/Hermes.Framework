
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[SaveUserAuthToken] (
     @UserAuthTokenId varchar(50)
	,@UserId BIGINT
	,@AuthClientId VARCHAR(128)
	,@IssuedUtc DATETIME
	,@ExpiresUtc DATETIME
	,@AccessToken VARCHAR(8000)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT TOP 1 1
			FROM dbo.UserAuthToken uat
			WHERE uat.UserAuthTokenId = @UserAuthTokenId
			)
	BEGIN
		INSERT INTO dbo.UserAuthToken (
			UserId
			,AuthClientId
			,IssuedUtc
			,ExpiresUtc
			,AccessToken
			,CreatedDate
			,UpdatedDate
			)
		VALUES (
			@UserId
			,@AuthClientId
			,@IssuedUtc
			,@ExpiresUtc
			,@AccessToken
			,GETDATE()
			,GETDATE()
			);
	END
	ELSE IF EXISTS (
			SELECT TOP 1 1
			FROM dbo.UserAuthToken uat
			WHERE uat.UserId = @UserId
				AND (uat.AccessToken IS NULL or uat.IsExpired = 1)
			)
	BEGIN
		UPDATE dbo.UserAuthToken
		SET AuthClientId = @AuthClientId
			,IssuedUtc = @IssuedUtc
			,ExpiresUtc = @ExpiresUtc
			,AccessToken = @AccessToken
			,UpdatedDate = GETDATE()
			,IsLoggedIn = 1
		WHERE UserAuthTokenId = @UserAuthTokenId
	END
	ELSE
	BEGIN
		DECLARE @error varchar(100);
		SET @error = CAST(@UserId AS VARCHAR(100));
		RAISERROR( N'The specified value %s already exists.', 16, 1, @error );
	END
END;

GO
