SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[SetTokenExpires]
	-- Add the parameters for the stored procedure here
	@UserId BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	UPDATE dbo.UserAuthToken
	SET AccessToken = NULL
		,ExpiresUtc = GETUTCDATE()
		,IsLoggedIn = 0
		,UpdatedDate = GETDATE()
	WHERE [UserId] = @UserId

	SELECT @@ROWCOUNT
END

GO
