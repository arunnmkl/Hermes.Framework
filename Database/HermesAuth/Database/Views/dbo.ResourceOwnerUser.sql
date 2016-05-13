SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[ResourceOwnerUser] 
WITH SCHEMABINDING
 
AS
SELECT
	ACL.ResourceId,
	U.UserID,
	U.SecurityId,
	U.Username
FROM
	dbo.AccessControlList ACL
	INNER JOIN dbo.[User] U ON ACL.SecurityId = U.SecurityId
WHERE
	ACL.IsOwner = 1





GO
CREATE UNIQUE CLUSTERED INDEX [PK_ResourceOwnerUser] ON [dbo].[ResourceOwnerUser] ([ResourceId]) ON [PRIMARY]
GO
