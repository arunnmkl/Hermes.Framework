SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Security].[ResourceOwnerRole]
	WITH SCHEMABINDING
AS
SELECT ACL.ResourceId
	,R.RoleId
	,R.SecurityId
	,R.NAME
FROM [Security].AccessControlList ACL
INNER JOIN [Security].[Role] R ON ACL.SecurityId = R.SecurityId
WHERE ACL.IsOwner = 1
	AND R.IsActive = 1
GO
CREATE UNIQUE CLUSTERED INDEX [PK_ResourceOwnerRole] ON [Security].[ResourceOwnerRole] ([ResourceId]) ON [PRIMARY]
GO
