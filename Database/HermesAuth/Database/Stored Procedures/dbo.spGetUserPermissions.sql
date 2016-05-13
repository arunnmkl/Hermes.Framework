SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spGetUserPermissions] (@userID INT)
AS
BEGIN
	WITH AllSecurityId
	AS (
		SELECT [User].[SecurityId]
		FROM dbo.[User]
		WHERE [User].UserID = @userID
		
		UNION
		
		SELECT [Role].[SecurityId]
		FROM dbo.[UserRole]
		INNER JOIN dbo.[Role] ON UserRole.RoleID = [Role].RoleID
		WHERE UserRole.UserID = @userID
		)
		,AllRResourceId
	AS (
		SELECT r.Name
			,ap.PermissionId
			,ap.[Deny]
			,acl.IsOwner
		FROM AllSecurityId asi	 
		INNER JOIN dbo.AccessControlList acl ON asi.SecurityId = acl.SecurityId
		INNER JOIN dbo.AccessPermission ap ON acl.AccessControlListId  = ap.AccessControlListId
		INNER JOIN dbo.[Resource] r ON acl.ResourceId = r.ResourceId
		)
	SELECT DISTINCT [Name] AS ResourceName
		,PermissionId AS PermissionId
	FROM AllRResourceId
	WHERE [Deny] = 0;
END;


GO
