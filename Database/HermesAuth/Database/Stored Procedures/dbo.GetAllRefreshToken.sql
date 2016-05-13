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
		,[IssuedUtc]
		,[ExpiresUtc]
		,[ProtectedTicket]
	FROM [dbo].[RefreshToken]
END;

GO
