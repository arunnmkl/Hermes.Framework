SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetResourceOwner] 
(	
	@ResourceId UNIQUEIDENTIFIER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT
		'U' AS [Type],
		UserId AS [Id],
		SecurityId AS [SecurityId],
		Username AS [Name]
	FROM	dbo.ResourceOwnerUser WITH (NOEXPAND) WHERE ResourceId = @ResourceId
	UNION ALL
	SELECT
		'R',
		RoleId,
		SecurityId,
		Name
	FROM dbo.ResourceOwnerRole WITH (NOEXPAND) WHERE ResourceId = @ResourceId
)

GO
