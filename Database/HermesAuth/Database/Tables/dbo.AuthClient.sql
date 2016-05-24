CREATE TABLE [dbo].[AuthClient]
(
[AuthClientId] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Secret] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ApplicationType] [int] NOT NULL,
[IsActive] [bit] NOT NULL,
[RefreshTokenLifeTime] [int] NOT NULL,
[AllowedOrigin] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccessTokenExpireTimeSpan] [int] NOT NULL CONSTRAINT [DF_AuthClient_TokenLifeTime] DEFAULT ((30))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuthClient] ADD CONSTRAINT [PK_dbo.AuthClients] PRIMARY KEY CLUSTERED  ([AuthClientId]) ON [PRIMARY]
GO
