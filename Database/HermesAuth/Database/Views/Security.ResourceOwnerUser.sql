SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Security].[ResourceOwnerUser] 
WITH SCHEMABINDING
 
AS
SELECT
	ACL.ResourceId,
	U.UserID,
	U.SecurityId,
	U.Username
FROM
	[Security].AccessControlList ACL
	INNER JOIN [Security].[User] U ON ACL.SecurityId = U.SecurityId
WHERE
	ACL.IsOwner = 1





GO
CREATE UNIQUE CLUSTERED INDEX [PK_ResourceOwnerUser] ON [Security].[ResourceOwnerUser] ([ResourceId]) ON [PRIMARY]
GO
