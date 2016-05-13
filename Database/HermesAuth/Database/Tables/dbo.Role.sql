CREATE TABLE [dbo].[Role]
(
[RoleId] [bigint] NOT NULL IDENTITY(1, 1),
[SecurityId] [uniqueidentifier] NOT NULL,
[Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Role_IsActive] DEFAULT ((1)),
[UpdatedBy] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Role] ADD CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED  ([RoleId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Role] ADD CONSTRAINT [FK_Role_User] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[User] ([UserId])
GO
