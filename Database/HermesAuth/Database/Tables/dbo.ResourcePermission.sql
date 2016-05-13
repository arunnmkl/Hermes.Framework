CREATE TABLE [dbo].[ResourcePermission]
(
[ResourcePermissionId] [bigint] NOT NULL IDENTITY(1, 1),
[ResourceId] [uniqueidentifier] NOT NULL,
[PermissionId] [int] NOT NULL,
[Deny] [bit] NOT NULL CONSTRAINT [DF_ResourcePermission_Deny] DEFAULT ((0)),
[Created] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ResourcePermission] ADD CONSTRAINT [PK_ResourcePermission] PRIMARY KEY CLUSTERED  ([ResourceId], [PermissionId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ResourcePermission] ON [dbo].[ResourcePermission] ([ResourcePermissionId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ResourcePermission] ADD CONSTRAINT [FK_ResourcePermission_Permission] FOREIGN KEY ([PermissionId]) REFERENCES [dbo].[Permission] ([PermissionId])
GO
ALTER TABLE [dbo].[ResourcePermission] ADD CONSTRAINT [FK_ResourcePermission_Resource] FOREIGN KEY ([ResourceId]) REFERENCES [dbo].[Resource] ([ResourceId])
GO
