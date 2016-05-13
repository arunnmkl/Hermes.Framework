CREATE TABLE [dbo].[User]
(
[UserId] [bigint] NOT NULL IDENTITY(1, 1),
[SecurityId] [uniqueidentifier] NOT NULL,
[Username] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Password] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Enabled] [bit] NOT NULL CONSTRAINT [DF_User_Enabled] DEFAULT ((1)),
[Created] [datetime] NOT NULL CONSTRAINT [DF_User_Created] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED  ([UserId]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_User] ON [dbo].[User] ([Username]) ON [PRIMARY]
GO
