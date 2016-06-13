SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author: Parul
-- Create date: 7 June 2016
-- Description:	Procedure to add/update a role
-- DECLARE @rpIDList [Security].[Ids]
-- INSERT INTO @rpIDList values (1),(2),(3)
-- EXEC [Security].AddUpdateRole 'Service Super User', 'Service Super User Group', 1, 1, @rpIDList
-- =============================================
CREATE PROCEDURE [Security].[AddUpdateRole] (
	@name VARCHAR(50)
	,@description VARCHAR(150)
	,@isActive BIT
	,@logInUserId BIGINT
	,@rpIDList [Security].[Ids] READONLY
	)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @securityId UNIQUEIDENTIFIER;
	DECLARE @resourceIds TABLE (ResourceId UNIQUEIDENTIFIER);
	DECLARE @aclIds TABLE (AccessControlListId BIGINT);
	DECLARE @accessControlListId BIGINT;
	DECLARE @aclOutput TABLE (
		ACLOutputId INT IDENTITY(1, 1)
		,AccessControlListId BIGINT
		,ResourceId UNIQUEIDENTIFIER
		);

	INSERT INTO @resourceIds (ResourceId)
	SELECT rp.ResourceId
	FROM @rpIDList rpId
	INNER JOIN [Security].[ResourcePermission] rp ON rpId.Id = rp.ResourcePermissionId
	GROUP BY rp.ResourceId

	IF NOT EXISTS (
			SELECT TOP 1 1
			FROM [Security].[Role]
			WHERE NAME = @name
			)
		AND ISNULL(@name, '') <> ''
	BEGIN
		SET @securityId = NEWID();

		INSERT INTO [Security].[Role] (
			SecurityId
			,NAME
			,Description
			,IsActive
			,UpdatedBy
			)
		VALUES (
			@securityId
			,@name
			,@description
			,@isActive
			,@logInUserId
			)
	END
	ELSE
	BEGIN
		SET @securityId = (
				SELECT SecurityId
				FROM [Security].[Role]
				WHERE NAME = @name
				)

		UPDATE [Security].[Role]
		SET NAME = @name
			,Description = @description
			,IsActive = @isActive
			,UpdatedBy = @logInUserId
		WHERE SecurityId = @securityId
	END

	IF NOT EXISTS (
			SELECT TOP 1 1
			FROM [Security].[AccessControlList]
			WHERE SecurityId = @securityId
			)
	BEGIN
		INSERT INTO [Security].[AccessControlList] (
			ResourceId
			,SecurityId
			,IsOwner
			)
		OUTPUT INSERTED.AccessControlListId
		INTO @aclOutput(AccessControlListId)
		SELECT DISTINCT rp.ResourceId
			,@securityId
			,0
		FROM @resourceIds rid
		INNER JOIN [Security].ResourcePermission rp ON rp.ResourceId = rid.ResourceId
		LEFT JOIN [Security].AccessControlList acl ON acl.ResourceId = rp.ResourceId
			AND acl.SecurityId = @securityId

		SET @accessControlListId = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		SET @accessControlListId = (
				SELECT AccessControlListId
				FROM [Security].[AccessControlList]
				WHERE SecurityId = @securityId
				)
	END

	IF @@ROWCOUNT = 0
	BEGIN
		INSERT @aclOutput (
			AccessControlListId
			,ResourceId
			)
		SELECT acl.AccessControlListId
			,rid.ResourceId
		FROM @resourceIds rid
		INNER JOIN [Security].ResourcePermission rp ON rp.ResourceId = rid.ResourceId
		INNER JOIN [Security].AccessControlList acl ON acl.ResourceId = rp.ResourceId
			AND acl.SecurityId = @securityId
		ORDER BY rp.ResourcePermissionId ASC;
	END;

	WITH CTE
	AS (
		SELECT ResourceId
			,ROW_NUMBER() OVER (
				ORDER BY ResourceId ASC
				) AS ROW
		FROM @resourceIds
		)
	UPDATE M
	SET M.ResourceId = S.ResourceId
	FROM @aclOutput AS M
	INNER JOIN CTE AS S ON S.ROW = M.ACLOutputId

	DELETE
	FROM [Security].[AccessPermission]
	WHERE AccessControlListId = @accessControlListId

	INSERT INTO [Security].[AccessPermission] (
		AccessControlListId
		,PermissionId
		,[Deny]
		)
	SELECT ao.AccessControlListId
		,rp.PermissionId
		,rp.[Deny]
	FROM @aclOutput ao
	INNER JOIN [Security].ResourcePermission rp ON rp.ResourceId = ao.ResourceId
	INNER JOIN @rpIDList rpid ON rpid.Id = rp.ResourcePermissionId
	LEFT JOIN [Security].AccessPermission ap ON ap.PermissionId = rp.PermissionId
		AND ap.AccessControlListId = ao.AccessControlListId
	WHERE ap.AccessControlListId IS NULL

	SELECT @@ROWCOUNT
END
GO
