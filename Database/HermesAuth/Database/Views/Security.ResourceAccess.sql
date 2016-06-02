SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Security].[ResourceAccess]
AS
     SELECT B.SecurityId,
            B.ResourceId,
            A.Name AS ResourceName,
            B.AccessControlListId,
            C.PermissionId,
            D.Name AS PermissionName,
            C.[Deny]
     FROM [Security].[Resource] AS A
          INNER JOIN [Security].AccessControlList AS B ON(A.ResourceId = B.ResourceId)
          INNER JOIN [Security].AccessPermission AS C ON B.AccessControlListId = C.AccessControlListId
          INNER JOIN [Security].Permission AS D ON C.PermissionId = D.PermissionId;

GO
