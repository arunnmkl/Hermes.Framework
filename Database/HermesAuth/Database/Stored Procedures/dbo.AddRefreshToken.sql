SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[AddRefreshToken] (
     @RefreshTokenId VARCHAR(128)
	,@Username VARCHAR(50)
	,@AuthClientId VARCHAR(128)
	,@IssuedUtc DATETIME
	,@ExpiresUtc DATETIME
	,@ProtectedTicket VARCHAR(8000)
	)
AS
BEGIN	 
	INSERT INTO [dbo].[RefreshToken] (
		[RefreshTokenId]
		,[Username]
		,[AuthClientId]
		,[IssuedUtc]
		,[ExpiresUtc]
		,[ProtectedTicket]
		)
	VALUES (
		@RefreshTokenId
		,@Username
		,@AuthClientId
		,@IssuedUtc
		,@ExpiresUtc
		,@ProtectedTicket
		)

	SELECT @RefreshTokenId AS RefreshTokenId
END;

GO
