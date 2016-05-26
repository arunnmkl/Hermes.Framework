
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[GetAllRefreshToken]
AS
BEGIN
	SELECT [RefreshTokenId]
		,[Username]
		,[AuthClientId] 
		,TODATETIMEOFFSET([IssuedUtc], '+00:00') AS [IssuedUtc] 
		,TODATETIMEOFFSET([ExpiresUtc], '+00:00') AS [ExpiresUtc]
		,[ProtectedTicket]
		,[UserAuthTokenId]
	FROM [dbo].[RefreshToken]
END;

GO
