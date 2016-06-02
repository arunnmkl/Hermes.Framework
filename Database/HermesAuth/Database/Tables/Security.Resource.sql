CREATE TABLE [Security].[Resource]
(
[ResourceId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Resource_ResourceId] DEFAULT (newid()),
[Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Resource_IsActive] DEFAULT ((1)),
[Created] [datetime] NOT NULL CONSTRAINT [DF_Resource_Created] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Security].[Resource] ADD CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED  ([ResourceId]) ON [PRIMARY]
GO
