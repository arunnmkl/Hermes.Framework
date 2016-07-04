SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Security].[spGetUserPermissions] (@userID INT)
AS
BEGIN
	WITH AllSecurityId
	AS (
		SELECT [User].[SecurityId]
		FROM [Security].[User]
		WHERE [User].UserID = @userID
		
		UNION
		
		SELECT r.[SecurityId]
		FROM [Security].[UserRole] ur
		INNER JOIN [Security].[Role] r ON ur.RoleId = r.RoleId
		WHERE ur.UserID = @userID
		  AND r.IsActive = 1
		)
		,AllRResourceId
	AS (
		SELECT r.Name
			,ap.PermissionId
			,ap.[Deny]
			,acl.IsOwner
		FROM AllSecurityId asi	 
		INNER JOIN [Security].AccessControlList acl ON asi.SecurityId = acl.SecurityId
		INNER JOIN [Security].AccessPermission ap ON acl.AccessControlListId  = ap.AccessControlListId
		INNER JOIN [Security].[Resource] r ON acl.ResourceId = r.ResourceId
		)
	SELECT DISTINCT [Name] AS ResourceName
		,PermissionId AS PermissionId
	FROM AllRResourceId
	WHERE [Deny] = 0;
END;



GO
