CREATE TABLE [dbo].[AccessControlList]
(
[AccessControlListId] [bigint] NOT NULL IDENTITY(1, 1),
[ResourceId] [uniqueidentifier] NOT NULL,
[SecurityId] [uniqueidentifier] NOT NULL,
[IsOwner] [bit] NOT NULL CONSTRAINT [DF_AccessControlList_IsOwner] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccessControlList] ADD CONSTRAINT [PK_AccessControlList] PRIMARY KEY CLUSTERED  ([AccessControlListId]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AccessControlList] ON [dbo].[AccessControlList] ([ResourceId], [SecurityId]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Either User.SecurityId or Role.SecurityId.', 'SCHEMA', N'dbo', 'TABLE', N'AccessControlList', 'COLUMN', N'SecurityId'
GO
