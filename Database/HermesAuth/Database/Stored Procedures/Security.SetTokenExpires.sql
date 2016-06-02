SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Security].[SetTokenExpires]
	-- Add the parameters for the stored procedure here
	@UserId BIGINT
	,@UserAuthTokenId VARCHAR(36)
AS
BEGIN
	DECLARE @rowCount INT = 0;

	-- SET NOCOUNT ON added to prevent extra result sets from
	UPDATE [Security].UserAuthToken
	SET AccessToken = NULL
		,ExpiresUtc = GETUTCDATE()
		,IsLoggedIn = 0
		,UpdatedDate = GETDATE()
	WHERE [UserId] = @UserId AND UserAuthTokenId = @UserAuthTokenId

	SET @rowCount = (
			SELECT @@ROWCOUNT
			)

	DELETE
	FROM [Security].RefreshToken
	WHERE UserAuthTokenId = @UserAuthTokenId

	SELECT @rowCount
END

GO
