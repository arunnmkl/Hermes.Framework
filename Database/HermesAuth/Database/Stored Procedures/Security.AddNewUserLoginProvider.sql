SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Security].[AddNewUserLoginProvider] (
	@UserId BIGINT
	,@LoginProvider VARCHAR(50)
	,@ProviderKey VARCHAR(128)
	)
AS
BEGIN
	INSERT INTO [Security].[UserLoginProvider] (
		[LoginProvider]
		,[ProviderKey]
		,[UserId]
		)
	VALUES (
		@LoginProvider
		,@ProviderKey
		,@UserId
		)
END;


GO
