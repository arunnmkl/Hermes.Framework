SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Security].[GetUserAuthTokenById] (@UserAuthTokenId VARCHAR(36))
AS
BEGIN
	SELECT uat.[UserAuthTokenId]
		,uat.[UserId]
		,uat.[AuthClientId]	
		,TODATETIMEOFFSET(uat.[IssuedUtc], '+00:00') AS [IssuedUtc] 
		,TODATETIMEOFFSET(uat.[ExpiresUtc], '+00:00') AS [ExpiresUtc]
		,uat.[AccessToken] AS DecodedAccessToken
		,uat.[IsLoggedIn]
		,uat.[CreatedDate]
		,uat.[UpdatedDate]
		,uat.[IsExpired]
	FROM [Security].UserAuthToken uat
	WHERE uat.[UserAuthTokenId] = @UserAuthTokenId
END;

GO
