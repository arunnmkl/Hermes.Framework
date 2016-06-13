
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Security].[SaveUserAuthToken] (
     @UserAuthTokenId varchar(50)
	,@UserId BIGINT
	,@AuthClientId VARCHAR(128)
	,@IssuedUtc DATETIME
	,@ExpiresUtc DATETIME
	,@AccessToken VARCHAR(8000)
	,@IpAddress VARCHAR(15) = N''
	,@UserAgent VARCHAR(500) = NULL
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT TOP 1 1
			FROM [Security].UserAuthToken uat
			WHERE uat.UserAuthTokenId = @UserAuthTokenId
			)
	BEGIN
		INSERT INTO [Security].UserAuthToken (
			UserId
			,AuthClientId
			,IssuedUtc
			,ExpiresUtc
			,AccessToken
			,CreatedDate
			,UpdatedDate
			,IPAddress
			,UserAgent
			)
		VALUES (
			@UserId
			,@AuthClientId
			,@IssuedUtc
			,@ExpiresUtc
			,@AccessToken
			,GETDATE()
			,GETDATE()
			,@IpAddress
			,@UserAgent
			);
	END
	ELSE IF EXISTS (
			SELECT TOP 1 1
			FROM [Security].UserAuthToken uat
			WHERE uat.UserId = @UserId
				AND (uat.AccessToken IS NULL or uat.IsExpired = 1)
			)
	BEGIN
		UPDATE [Security].UserAuthToken
		SET AuthClientId = @AuthClientId
			,IssuedUtc = @IssuedUtc
			,ExpiresUtc = @ExpiresUtc
			,AccessToken = @AccessToken
			,UpdatedDate = GETDATE()
			,IsLoggedIn = 1
			,IPAddress = @IpAddress
			,UserAgent = @UserAgent
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
