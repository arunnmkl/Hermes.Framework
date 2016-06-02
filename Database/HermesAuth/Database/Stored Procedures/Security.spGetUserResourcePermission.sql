SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
CREATE PROCEDURE [Security].[spGetUserResourcePermission] (@SIDList [Security].SecurityIdList READONLY)
AS
BEGIN
	SET NOCOUNT ON;

	WITH PERM (RID, PermissionId, DenyId, AllowId)
	AS (
		SELECT apadj.ResourceId
			,apadj.PermissionId
			,ISNULL(COUNT(SD.SecurityId), 0) DenyID
			,ISNULL(COUNT(AllowedSecurityId), 0) AllowId
		FROM [Security].AccessPermissionAllowDenyJoin apadj
		INNER JOIN @SIDList SA ON apadj.AllowedSecurityId = SA.SecurityId
		LEFT OUTER JOIN @SIDList SD ON apadj.DeniedSecurityId = SD.SecurityId
		GROUP BY apadj.ResourceId
			,apadj.PermissionId
		)

	SELECT r.[Name] AS ResourceName
		,PM.PermissionId
	FROM PERM PM
	INNER JOIN [Security].[Resource] r WITH (NOLOCK) ON PM.RID = r.ResourceId
	WHERE PM.DenyID = 0
		AND PM.AllowId > 0
END


GO
