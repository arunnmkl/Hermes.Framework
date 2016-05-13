CREATE TABLE [dbo].[Permission]
(
[PermissionId] [int] NOT NULL,
[Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Permission] ADD CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED  ([PermissionId]) ON [PRIMARY]
GO
