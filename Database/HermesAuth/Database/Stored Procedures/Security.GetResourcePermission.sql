SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author: Arunkumar K
-- Create date: 09 June 2016
-- Description:	Get the Resource and its permission
-- EXEC [Security].[GetResourcePermission]
-- =============================================
CREATE PROCEDURE [Security].[GetResourcePermission]
AS
BEGIN
	 WITH CTE_Permission(PermissionId , PermissionName , PermissionDisplayName)
	   AS (SELECT P.PermissionId , P.NAME , DisplayName = CASE
												    WHEN P.PermissionId = -1
												    THEN 'Add'
												    WHEN p.PermissionId = -2
												    THEN 'View'
												    WHEN p.PermissionId = -3
												    THEN 'Edit'
												    WHEN p.PermissionId = -4
												    THEN 'Delete'
												END
			 FROM [Security].[Permission] AS P)
	SELECT RP.ResourcePermissionId
		,R.NAME AS ResourceName
		,P.PermissionName
		,P.PermissionDisplayName
	FROM [Security].[Resource] AS R
	INNER JOIN [Security].[ResourcePermission] AS RP ON RP.ResourceId = R.ResourceId
	INNER JOIN CTE_Permission AS P ON P.PermissionId = Rp.PermissionId
	WHERE R.IsActive = 1
	ORDER BY 1;
END;
GO
