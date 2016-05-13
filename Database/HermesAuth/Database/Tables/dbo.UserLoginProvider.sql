CREATE TABLE [dbo].[UserLoginProvider]
(
[LoginProvider] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ProviderKey] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UserId] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserLoginProvider] ADD CONSTRAINT [PK_UserLoginProvider] PRIMARY KEY CLUSTERED  ([LoginProvider], [ProviderKey], [UserId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserLoginProvider] ADD CONSTRAINT [FK_UserLoginProvider_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId])
GO
