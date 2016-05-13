DECLARE @resourceIds TABLE (ResourceId uniqueidentifier);
DECLARE @aclOutput TABLE (ACLOutputId INT IDENTITY(1, 1), AccessControlListId bigint, ResourceId uniqueidentifier);
DECLARE @roleId BIGINT
	,@securityId UNIQUEIDENTIFIER
	,@name VARCHAR(50) = N'Admin'
	,@description VARCHAR(150) = N'Admin Group'
	,@isActive BIT = 1
	,@updatedBy BIGINT = 1;

INSERT INTO @resourceIds (ResourceId)
SELECT r.ResourceId FROM dbo.[Resource] r

BEGIN
	IF NOT EXISTS (
			SELECT TOP 1 1
			FROM dbo.[Role]
			WHERE NAME = @name
			)
		AND ISNULL(@name, '') <> ''
	BEGIN
		SET @securityId = NEWID();

		INSERT INTO dbo.[Role] (
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
			,@updatedBy
			)
	END
	ELSE
	BEGIN
		SET @securityId = (
				SELECT SecurityId
				FROM dbo.[Role]
				WHERE NAME = @name
				)
	END

	INSERT INTO dbo.AccessControlList
	(
	    ResourceId,
	    SecurityId,
	    IsOwner
	)
    OUTPUT INSERTED.AccessControlListId INTO @aclOutput (AccessControlListId)
    SELECT Distinct rp.ResourceId, @securityId, 0 FROM @resourceIds  rid
    INNER JOIN dbo.ResourcePermission rp ON rp.ResourceId = rid.ResourceId
    LEFT JOIN dbo.AccessControlList acl ON  acl.ResourceId = rp.ResourceId	 AND acl.SecurityId	 = @securityId
    WHERE acl.AccessControlListId IS NULL
    --ORDER BY rpid.ResourcePermissionId ASC;
    
    IF @@ROWCOUNT = 0
    BEGIN
	   INSERT	 @aclOutput
	   (	
		  AccessControlListId,
	       ResourceId
	   )
	   SELECT acl.AccessControlListId, rid.ResourceId FROM @resourceIds  rid
	   INNER JOIN dbo.ResourcePermission rp ON rp.ResourceId = rid.ResourceId
	   INNER JOIN dbo.AccessControlList acl ON  acl.ResourceId = rp.ResourceId	 AND acl.SecurityId	 = @securityId
	   ORDER BY rp.ResourcePermissionId ASC;
    END 

    ;WITH CTE AS ( SELECT ResourceId, ROW_NUMBER() OVER ( ORDER BY ResourceId ASC ) AS ROW FROM @resourceIds )
    UPDATE M SET M.ResourceId = S.ResourceId 
    FROM @aclOutput AS M
    INNER JOIN CTE AS S ON S.ROW = M.ACLOutputId 

    INSERT  dbo.AccessPermission
    (
        AccessControlListId,
        PermissionId,
        [Deny]
    ) 
    SELECT ao.AccessControlListId, rp.PermissionId, rp.[Deny] FROM @aclOutput ao
    INNER JOIN dbo.ResourcePermission rp ON rp.ResourceId = ao.ResourceId
    LEFT JOIN dbo.AccessPermission ap ON  ap.PermissionId = rp.PermissionId AND ap.AccessControlListId = ao.AccessControlListId
    WHERE ap.AccessControlListId IS NULL
END