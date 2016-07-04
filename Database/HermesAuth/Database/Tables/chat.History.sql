CREATE TABLE [chat].[History]
(
[HistoryId] [bigint] NOT NULL IDENTITY(1, 1),
[To] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[From] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateTimestamp] [datetimeoffset] (0) NOT NULL CONSTRAINT [DF_History_DateStamp] DEFAULT (getutcdate()),
[Message] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [chat].[History] ADD CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED  ([HistoryId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_History_DateTime] ON [chat].[History] ([DateTimestamp] DESC) ON [PRIMARY]
GO
