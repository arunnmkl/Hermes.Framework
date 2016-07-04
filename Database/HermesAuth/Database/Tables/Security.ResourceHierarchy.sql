CREATE TABLE [Security].[ResourceHierarchy]
(
[ResourceHierarchyId] [bigint] NOT NULL IDENTITY(1, 1),
[ResourceIdentifier] [bigint] NOT NULL,
[ParentResourceIdentifier] [bigint] NOT NULL,
[SkipHierarchy] [bit] NOT NULL CONSTRAINT [DF_ResourceHierarchy_SkipHierarchy] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [Security].[ResourceHierarchy] ADD CONSTRAINT [PK_ResourceHierarchy] PRIMARY KEY CLUSTERED  ([ResourceHierarchyId]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ResourceHierarchy] ON [Security].[ResourceHierarchy] ([ResourceHierarchyId], [ParentResourceIdentifier]) ON [PRIMARY]
GO
ALTER TABLE [Security].[ResourceHierarchy] ADD CONSTRAINT [FK_ResourceHierarchy_Resource_ParentRId] FOREIGN KEY ([ParentResourceIdentifier]) REFERENCES [Security].[Resource] ([ResourceIdentifier])
GO
ALTER TABLE [Security].[ResourceHierarchy] ADD CONSTRAINT [FK_ResourceHierarchy_Resource_RId] FOREIGN KEY ([ResourceIdentifier]) REFERENCES [Security].[Resource] ([ResourceIdentifier])
GO
