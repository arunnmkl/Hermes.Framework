CREATE TABLE [Security].[RefreshToken]
(
[RefreshTokenId] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Username] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AuthClientId] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IssuedUtc] [datetime] NOT NULL,
[ExpiresUtc] [datetime] NOT NULL,
[ProtectedTicket] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UserAuthTokenId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Security].[RefreshToken] ADD CONSTRAINT [PK_Security.RefreshTokens] PRIMARY KEY CLUSTERED  ([RefreshTokenId]) ON [PRIMARY]
GO
ALTER TABLE [Security].[RefreshToken] ADD CONSTRAINT [FK_RefreshToken_AuthClient] FOREIGN KEY ([AuthClientId]) REFERENCES [Security].[AuthClient] ([AuthClientId])
GO
