SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[GetUserAuthToken] (
	@UserId BIGINT
	,@AccessToken VARCHAR(8000)
	)
AS
BEGIN
	SELECT uat.[UserAuthTokenId]
		,uat.[UserId]
		,uat.[AuthClientId]
		,uat.[IssuedUtc]
		,uat.[ExpiresUtc]
		,uat.[AccessToken] AS DecodedAccessToken
		,uat.[IsLoggedIn]
		,uat.[CreatedDate]
		,uat.[UpdatedDate]
	FROM dbo.UserAuthToken uat
	WHERE uat.UserId = @UserId
		AND uat.AccessToken = @AccessToken
END;

GO
