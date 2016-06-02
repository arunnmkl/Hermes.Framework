SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Security].[FindRefreshToken] @RefreshTokenId VARCHAR(128)
AS
BEGIN
	SELECT rt.[RefreshTokenId]
		,rt.[Username]
		,rt.[AuthClientId]
		,TODATETIMEOFFSET(rt.[IssuedUtc], '+00:00') AS [IssuedUtc] 
		,TODATETIMEOFFSET(rt.[ExpiresUtc], '+00:00') AS [ExpiresUtc]
		,rt.[ProtectedTicket]
		,rt.[UserAuthTokenId]
	FROM [Security].[RefreshToken] rt
	WHERE rt.RefreshTokenId = @RefreshTokenId
END;


GO
