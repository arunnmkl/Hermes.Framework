CREATE TABLE [dbo].[UserRole]
(
[UserId] [bigint] NOT NULL,
[RoleId] [bigint] NOT NULL,
[Created] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserRole] ADD CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED  ([UserId], [RoleId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserRole] ADD CONSTRAINT [FK_UserRole_Role] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[UserRole] ADD CONSTRAINT [FK_UserRole_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId])
GO
