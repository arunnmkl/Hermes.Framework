SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[FindRefreshToken] @RefreshTokenId VARCHAR(128)
AS
BEGIN
	SELECT rt.[RefreshTokenId]
		,rt.[Username]
		,rt.[AuthClientId]
		,rt.[IssuedUtc]
		,rt.[ExpiresUtc]
		,rt.[ProtectedTicket]
	FROM [dbo].[RefreshToken] rt
	WHERE rt.RefreshTokenId = @RefreshTokenId
END;

GO
