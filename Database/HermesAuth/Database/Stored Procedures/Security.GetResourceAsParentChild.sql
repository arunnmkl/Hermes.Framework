SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author: Arunkumar K
-- Create date: 09 June 2016
-- Description:	Get the Resource and its permission
-- EXEC [Security].[GetResourceAsParentChild]
-- =============================================
Create PROCEDURE [Security].[GetResourceAsParentChild]
AS
BEGIN	
	 WITH CTE_Resource(Id,
                  Name,
                  ParentId,
                  ResourceId)
     AS (SELECT ROW_NUMBER() OVER(ORDER BY ResourceId DESC) * -1 AS Row,
                Name,
                0,
                ResourceId
         FROM [Security].[Resource] AS R
         WHERE R.IsActive = 1),
     CTE_Permission(PermissionId,
                    PermissionName,
                    PermissionDisplayName)
     AS (SELECT P.PermissionId,
                P.NAME,
                DisplayName = CASE
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

     --Merge the parent and child data
     SELECT Id,
            Name,
            ParentId
     FROM CTE_Resource
     UNION ALL
     SELECT RP.ResourcePermissionId,
            P.PermissionDisplayName,
            R.Id
     FROM CTE_Resource AS R
          INNER JOIN [Security].[ResourcePermission] AS RP ON RP.ResourceId = R.ResourceId
          INNER JOIN CTE_Permission AS P ON P.PermissionId = Rp.PermissionId
     ORDER BY 1,
              2;
END;


GO
