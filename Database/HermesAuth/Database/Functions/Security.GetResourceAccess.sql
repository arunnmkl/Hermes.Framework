SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [Security].[GetResourceAccess] (
	@SIDs [Security].SecurityIdList READONLY
	,@PermissionId INT
	)
RETURNS TABLE
AS
RETURN (
	   SELECT ResourceId
	   FROM [Security].AccessPermissionAllowDenyJoin AS AP
		   INNER JOIN @SIDs AS A ON AP.AllowedSecurityId = A.SecurityId
		   LEFT OUTER JOIN @SIDs AS D ON AP.DeniedSecurityId = D.SecurityId
	   WHERE AP.PermissionId = @PermissionId
		    AND D.SecurityId IS NULL
	   GROUP BY ResourceId
	   );

GO
