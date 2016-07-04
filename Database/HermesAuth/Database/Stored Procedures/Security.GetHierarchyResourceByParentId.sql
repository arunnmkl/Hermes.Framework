
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
-- Author: Arunkumar K
-- Create date: 23 June 2016
-- Description:	Get the Resource and its permissions by ParentId
-- EXEC [Security].[GetHierarchyResourceByParentId] 0, 10023
-- =============================================
CREATE PROCEDURE [Security].[GetHierarchyResourceByParentId] (@parentId INT, @roleId BIGINT)
AS
BEGIN	

		DECLARE @ResourcePermission TABLE (
		Id BIGINT
		,Name VARCHAR(50)
		,ParentId INT
		,HasChild BIT
		,Checked BIT
		);

		 WITH CTE_Resource (
		Id
		,[Name]
		,ParentId
		,ResourceId
		,SkipHierarchy
		)
	AS (
		SELECT R.ResourceIdentifier * - 1 AS Row
			,[Name]
			,IIF(RH.ResourceHierarchyId IS NULL, 0, RH.ParentResourceIdentifier * - 1)
			,ResourceId
			,IIF(RH.ResourceHierarchyId IS NULL, 0, SkipHierarchy)
		FROM [Security].[Resource] AS R
		LEFT JOIN [Security].[ResourceHierarchy] RH ON RH.ResourceIdentifier = R.ResourceIdentifier
		WHERE R.IsActive = 1
		)
		,CTE_Permission (
		PermissionId
		,PermissionName
		,PermissionDisplayName
		)
	AS (
		SELECT P.PermissionId
			,P.[Name]
			,DisplayName = CASE 
				WHEN P.PermissionId = - 1
					THEN 'Add'
				WHEN p.PermissionId = - 2
					THEN 'View'
				WHEN p.PermissionId = - 3
					THEN 'Edit'
				WHEN p.PermissionId = - 4
					THEN 'Delete'
				END
		FROM [Security].[Permission] AS P
		)
	--Merge the parent and child data
	
		INSERT INTO @ResourcePermission (
			Id
			,Name
			,ParentId
			,HasChild
			,Checked
		)
		SELECT Id
			,[Name]
			,ParentId
			,HasChild
			,0
		FROM (
			SELECT Id
				,[Name]
				,ParentId
				,CAST(1 AS BIT) HasChild
			FROM CTE_Resource
			WHERE SkipHierarchy = 0
	
			UNION ALL
	
			SELECT RP.ResourcePermissionId
				,IIF(ISNULL(RP.DisplayName, '') = '', P.PermissionDisplayName, RP.DisplayName)
				,IIF(SkipHierarchy = 0, R.Id, R.ParentId)
				,CAST(0 AS BIT) HasChild
			FROM CTE_Resource AS R
			INNER JOIN [Security].[ResourcePermission] AS RP ON RP.ResourceId = R.ResourceId
			INNER JOIN CTE_Permission AS P ON P.PermissionId = Rp.PermissionId
			WHERE RP.[Deny] = 0
			) AS A
		WHERE a.ParentId = @parentId
		ORDER BY 1
			,3;

	IF @roleId > 0
	BEGIN
		UPDATE trp SET Checked = IIF(AP.[Deny] = 0, 1, 0)
		FROM @ResourcePermission trp
		INNER JOIN [Security].[ResourcePermission] RP ON trp.Id = RP.ResourcePermissionId
		INNER JOIN [Security].[AccessControlList] ACL ON RP.ResourceId = ACL.ResourceId
		Inner Join [Security].[Role] R ON ACL.SecurityId = R.SecurityId
		INNER JOIN [Security].[AccessPermission] AP ON AP.AccessControlListId = ACL.AccessControlListId AND  RP.PermissionId = AP.PermissionId
		WHERE R.RoleId = @roleId
	END

	SELECT Id
		,Name
		,ParentId
		,HasChild
		,Checked
	 FROM @ResourcePermission

END 
GO
