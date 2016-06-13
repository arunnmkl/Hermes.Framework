
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [Security].[RoleUserCount]
AS
WITH CTE_UserRoleCount (
	RoleId
	,UserCount
	)
AS (
	SELECT RoleId
		,COUNT(RoleId) AS RoleCount
	FROM [Security].[UserRole]
	GROUP BY RoleId
	)
SELECT R.RoleId
	,R.SecurityId
	,R.[Name] AS RoleName
	,ISNULL(URC.UserCount, 0) AS UserCount
	,R.[Description]
	,R.IsActive AS [Status]
	,U.Username AS ModifiedBy
FROM [Security].[Role] AS R
INNER JOIN [Security].[User] AS U ON R.UpdatedBy = U.UserId
LEFT JOIN CTE_UserRoleCount AS URC ON R.RoleId = URC.RoleId


GO
