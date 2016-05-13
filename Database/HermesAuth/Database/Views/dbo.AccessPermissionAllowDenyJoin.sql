SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[AccessPermissionAllowDenyJoin]	  
WITH SCHEMABINDING
AS SELECT A.[ResourceId], A.[SecurityId] AS [AllowedSecurityId], A.PermissionId, D.[SecurityId] AS [DeniedSecurityId]
   FROM
   (
	   SELECT AP.ResourceId, AP.SecurityId, AP.PermissionId
	   FROM dbo.AccessPermissionJoin AS AP WITH (NOEXPAND)
	   WHERE AP.[Deny] = 0
   ) AS A
   LEFT OUTER JOIN
   (
	   SELECT AP.[ResourceId], AP.[SecurityId], AP.PermissionId
	   FROM [dbo].AccessPermissionJoin AS AP WITH (NOEXPAND)
	   WHERE AP.[Deny] = 1
   ) AS D
   ON A.[ResourceId] = D.[ResourceId] AND 
	  A.PermissionId = D.PermissionId;


GO
