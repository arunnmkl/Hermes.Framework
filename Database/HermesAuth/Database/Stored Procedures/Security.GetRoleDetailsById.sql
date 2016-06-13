
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author: Parul
-- Create date: 09 June 2016
-- Description:	Get the Role details by id 
-- EXEC [Security].[GetRoleDetailsById] 1
-- =============================================
CREATE PROCEDURE [Security].[GetRoleDetailsById] (@roleId INT)
AS
BEGIN
	SELECT R.[RoleId]
		,R.[Name]
		,R.[Description]
		,R.IsActive
		,R.UpdatedBy
		,AP.PermissionId
		,AP.[Deny]
		,RP.ResourcePermissionId
	FROM [Security].[Role] R
	INNER JOIN [Security].[AccessControlList] ACL ON ACL.SecurityId = R.SecurityId
	INNER JOIN [Security].[AccessPermission] AP ON AP.AccessControlListId = ACL.AccessControlListId
	INNER JOIN [Security].[ResourcePermission] RP ON RP.PermissionId = AP.PermissionId
		AND RP.ResourceId = ACL.ResourceId
	WHERE R.RoleId = @roleId
	   AND R.IsActive = 1
END
GO
