SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[AddNewUserLoginProvider] (
	@UserId BIGINT
	,@LoginProvider VARCHAR(50)
	,@ProviderKey VARCHAR(128)
	)
AS
BEGIN
	INSERT INTO [dbo].[UserLoginProvider] (
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
