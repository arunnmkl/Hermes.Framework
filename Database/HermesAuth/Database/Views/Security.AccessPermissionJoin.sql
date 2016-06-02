SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Security].[AccessPermissionJoin]	
WITH SCHEMABINDING
AS
     SELECT A.AccessControlListId,
            A.[ResourceId],
            A.[SecurityId],
            AP.PermissionId,
            AP.[Deny],
            P.Name
     FROM [Security].AccessControlList A
          INNER JOIN [Security].AccessPermission AP ON A.AccessControlListId = AP.AccessControlListId
          INNER JOIN [Security].Permission P ON AP.PermissionId = P.PermissionId;


GO
CREATE UNIQUE CLUSTERED INDEX [PK_AccessPermissionJoin] ON [Security].[AccessPermissionJoin] ([AccessControlListId], [PermissionId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccessPermissionJoin_SecurityIdPermission] ON [Security].[AccessPermissionJoin] ([Deny], [SecurityId], [PermissionId]) INCLUDE ([ResourceId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccessPermissionJoin_PermissionResourceId] ON [Security].[AccessPermissionJoin] ([PermissionId], [ResourceId]) INCLUDE ([SecurityId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccessPermission_ResourceIdDeny] ON [Security].[AccessPermissionJoin] ([ResourceId], [Deny]) INCLUDE ([Name], [PermissionId], [SecurityId]) ON [PRIMARY]
GO
