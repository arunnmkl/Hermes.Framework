SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[ResourceAccess]
AS
     SELECT B.SecurityId,
            B.ResourceId,
            A.Name AS ResourceName,
            B.AccessControlListId,
            C.PermissionId,
            D.Name AS PermissionName,
            C.[Deny]
     FROM dbo.[Resource] AS A
          INNER JOIN [dbo].AccessControlList AS B ON(A.ResourceId = B.ResourceId)
          INNER JOIN [dbo].AccessPermission AS C ON B.AccessControlListId = C.AccessControlListId
          INNER JOIN [dbo].Permission AS D ON C.PermissionId = D.PermissionId;

GO
