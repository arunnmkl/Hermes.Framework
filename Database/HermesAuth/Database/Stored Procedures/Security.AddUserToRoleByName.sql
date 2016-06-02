SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Security].[AddUserToRoleByName]
(
	@Username varchar(50),
	@Rolename varchar(50)
)	
AS
	DECLARE @UserId int;
	DECLARE @RoleId int;

	SELECT @UserId = UserId FROM [Security].[User] WHERE Username = @Username;
	SELECT @RoleId = RoleId FROM [Security].[Role] WHERE Name = @Rolename;

	IF NOT EXISTS(SELECT 1 FROM [Security].[UserRole] WHERE UserId = @UserId AND RoleID = @RoleId)
	BEGIN
		INSERT [Security].[UserRole] (UserID, RoleID) VALUES (@UserID, @RoleID);
	END




GO
