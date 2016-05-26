
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
		,TODATETIMEOFFSET(uat.[IssuedUtc], '+00:00') AS [IssuedUtc] 
		,TODATETIMEOFFSET(uat.[ExpiresUtc], '+00:00') AS [ExpiresUtc]
		,uat.[AccessToken] AS DecodedAccessToken
		,uat.[IsLoggedIn]
		,uat.[CreatedDate]
		,uat.[UpdatedDate]
		,uat.[IsExpired]
	FROM dbo.UserAuthToken uat
	WHERE uat.UserId = @UserId
		AND uat.AccessToken = @AccessToken
END;

GO
