SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[AddUserToRoleByName]
(
	@Username varchar(50),
	@Rolename varchar(50)
)	
AS
	DECLARE @UserId int;
	DECLARE @RoleId int;

	SELECT @UserId = UserId FROM dbo.[User] WHERE Username = @Username;
	SELECT @RoleId = RoleId FROM dbo.[Role] WHERE Name = @Rolename;

	IF NOT EXISTS(SELECT 1 FROM dbo.[UserRole] WHERE UserId = @UserId AND RoleID = @RoleId)
	BEGIN
		INSERT dbo.[UserRole] (UserID, RoleID) VALUES (@UserID, @RoleID);
	END



GO
