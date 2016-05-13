SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[AccessPermissionJoin]	
WITH SCHEMABINDING
AS
     SELECT A.AccessControlListId,
            A.[ResourceId],
            A.[SecurityId],
            AP.PermissionId,
            AP.[Deny],
            P.Name
     FROM [dbo].AccessControlList A
          INNER JOIN [dbo].AccessPermission AP ON A.AccessControlListId = AP.AccessControlListId
          INNER JOIN [dbo].Permission P ON AP.PermissionId = P.PermissionId;


GO
CREATE UNIQUE CLUSTERED INDEX [PK_AccessPermissionJoin] ON [dbo].[AccessPermissionJoin] ([AccessControlListId], [PermissionId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccessPermissionJoin_SecurityIdPermission] ON [dbo].[AccessPermissionJoin] ([Deny], [SecurityId], [PermissionId]) INCLUDE ([ResourceId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccessPermissionJoin_PermissionResourceId] ON [dbo].[AccessPermissionJoin] ([PermissionId], [ResourceId]) INCLUDE ([SecurityId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccessPermission_ResourceIdDeny] ON [dbo].[AccessPermissionJoin] ([ResourceId], [Deny]) INCLUDE ([Name], [PermissionId], [SecurityId]) ON [PRIMARY]
GO
