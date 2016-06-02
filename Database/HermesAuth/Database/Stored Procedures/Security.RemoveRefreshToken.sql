SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Security].[RemoveRefreshToken] @RefreshTokenId VARCHAR(128)
AS
BEGIN
	DELETE
	FROM [Security].[RefreshToken]
	WHERE RefreshTokenId = @RefreshTokenId
END;


GO
