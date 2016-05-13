SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fnCheckAuthorization] (
	@ResourceId UNIQUEIDENTIFIER
	,@SecurityIdList dbo.SecurityIdList READONLY
	,@PermissionId INT
	)
RETURNS BIT
AS
BEGIN
	DECLARE @IsOwner BIT = 0
	DECLARE @DenyCount INT = 0;
	DECLARE @AllowCount INT = 0;
	DECLARE @ExpandedSecurityIdList dbo.SecurityIdList;

	INSERT INTO @ExpandedSecurityIdList
	SELECT [SecurityId]
	FROM @SecurityIdLIST
	
	UNION
	
	SELECT [SecurityId]
	FROM dbo.[Role]
	WHERE NAME = 'Anonymous';

	--Owner->Deny->Allow->Nothing
	IF EXISTS (SELECT TOP 1 1 FROM dbo.GetResourceOwner(@ResourceId) o INNER JOIN @ExpandedSecurityIdList s ON o.[SecurityId] = s.[SecurityId])	
	BEGIN
		SELECT @IsOwner = 1
	END
	ELSE
	BEGIN
		SELECT @DenyCount = COUNT(*)
		FROM @ExpandedSecurityIdList AS [SecurityIds]
		INNER JOIN dbo.AccessPermissionJoin AS AP WITH (NOEXPAND) ON [SecurityIds].[SecurityId] = AP.[SecurityId]
			AND AP.ResourceId = @ResourceId
			AND AP.PermissionId = @PermissionId
			AND [Deny] = 1;

		IF @DenyCount = 0
		BEGIN
			SELECT @AllowCount = COUNT(*)
			FROM @ExpandedSecurityIdList AS [SecurityIds]
			INNER JOIN dbo.AccessPermissionJoin AS AP WITH (NOEXPAND) ON [SecurityIds].[SecurityId] = AP.[SecurityId]
				AND AP.ResourceId = @ResourceId
				AND AP.PermissionId = @PermissionId
				AND [Deny] = 0;
		END;
	END;

	--RETURN VALUE IS A BIT FIELD
	--None = 0x0, 
	--Access = 0x1
	DECLARE @RetVal INT = 0;

	IF @IsOwner = 1 OR (@DenyCount = 0 AND @AllowCount > 0)
	BEGIN
		SET @RetVal = 1;
	END;

	RETURN @RetVal;
END;

GO
