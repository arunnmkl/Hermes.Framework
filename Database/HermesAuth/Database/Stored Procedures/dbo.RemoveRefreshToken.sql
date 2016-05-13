SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[RemoveRefreshToken] @RefreshTokenId VARCHAR(128)
AS
BEGIN
	DELETE
	FROM [dbo].[RefreshToken]
	WHERE RefreshTokenId = @RefreshTokenId
END;

GO
