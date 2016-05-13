CREATE TABLE [dbo].[AccessPermission]
(
[AccessControlListId] [bigint] NOT NULL,
[PermissionId] [int] NOT NULL,
[Deny] [bit] NOT NULL CONSTRAINT [DF_AccessPermission_Deny] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccessPermission] ADD CONSTRAINT [PK_AccessPermission] PRIMARY KEY CLUSTERED  ([AccessControlListId], [PermissionId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccessPermission] ADD CONSTRAINT [FK_AccessPermission_AccessControlList] FOREIGN KEY ([AccessControlListId]) REFERENCES [dbo].[AccessControlList] ([AccessControlListId])
GO
ALTER TABLE [dbo].[AccessPermission] ADD CONSTRAINT [FK_AccessPermission_Permission] FOREIGN KEY ([PermissionId]) REFERENCES [dbo].[Permission] ([PermissionId])
GO
