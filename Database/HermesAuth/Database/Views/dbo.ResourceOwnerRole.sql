SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[ResourceOwnerRole]
WITH SCHEMABINDING
AS
SELECT
	ACL.ResourceId,
	R.RoleId,
	R.SecurityId,
	R.Name
FROM
	dbo.AccessControlList ACL
	INNER JOIN dbo.[Role] R ON ACL.SecurityId = R.SecurityId
WHERE
	ACL.IsOwner = 1


GO
CREATE UNIQUE CLUSTERED INDEX [PK_ResourceOwnerRole] ON [dbo].[ResourceOwnerRole] ([ResourceId]) ON [PRIMARY]
GO
