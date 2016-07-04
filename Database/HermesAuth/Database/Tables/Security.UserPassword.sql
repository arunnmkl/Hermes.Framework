CREATE TABLE [Security].[UserPassword]
(
[UserId] [bigint] NOT NULL,
[Password] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UpdatedBy] [bigint] NULL,
[UpdatedDatetime] [datetime] NOT NULL CONSTRAINT [DF_UserPassword_UpdatedDatetime] DEFAULT (getdate()),
[UpdatedTimestamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Security].[UserPassword] ADD CONSTRAINT [IX_UserPassword] UNIQUE NONCLUSTERED  ([UserId]) ON [PRIMARY]
GO
ALTER TABLE [Security].[UserPassword] ADD CONSTRAINT [FK_UserPassword_User] FOREIGN KEY ([UserId]) REFERENCES [Security].[User] ([UserId])
GO
