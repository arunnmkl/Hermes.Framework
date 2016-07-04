SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================  
-- Author:  Arunkumar K
-- Create date: 02 July, 2016  
-- Description: Inserts chat history details in respective table.  
-- =============================================  
CREATE PROCEDURE [chat].[spInsertChatHistory] @From [varchar] (100)
	,@To [nvarchar] (100)
	,@Message [nvarchar] (4000)
AS
BEGIN
	-- interfering with SELECT statements.  
	-- SET NOCOUNT ON;
	INSERT INTO [chat].[History] (
		[From]
		,[To]
		,[DateTimestamp]
		,[Message]
		)
	VALUES (
		@From
		,@To
		,SYSUTCDATETIME()
		,@Message
		)
END
GO
