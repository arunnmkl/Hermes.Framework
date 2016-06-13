CREATE TABLE [Security].[UserAuthToken]
(
[UserAuthTokenId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_UserAuthToken_UserAuthTokenId] DEFAULT (replace(CONVERT([varchar](36),newid(),0),'-','')),
[UserId] [bigint] NOT NULL,
[AuthClientId] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IssuedUtc] [datetime] NOT NULL,
[ExpiresUtc] [datetime] NOT NULL,
[AccessToken] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLoggedIn] [bit] NOT NULL CONSTRAINT [DF_UserAuthToken_IsLoggedIn] DEFAULT ((0)),
[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_UserAuthToken_CreatedDate] DEFAULT (getdate()),
[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_UserAuthToken_UpdatedDate] DEFAULT (getdate()),
[IsExpired] AS (CONVERT([bit],case when [ExpiresUtc]<getutcdate() OR [IsLoggedIn]=(0) then (1) else (0) end,(0))),
[IPAddress] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UserAgent] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
ALTER TABLE [Security].[UserAuthToken] ADD 
CONSTRAINT [PK_UserAuthToken] PRIMARY KEY CLUSTERED  ([UserAuthTokenId]) ON [PRIMARY]
GO

ALTER TABLE [Security].[UserAuthToken] ADD CONSTRAINT [FK_UserAuthToken_User] FOREIGN KEY ([UserId]) REFERENCES [Security].[User] ([UserId])
GO
