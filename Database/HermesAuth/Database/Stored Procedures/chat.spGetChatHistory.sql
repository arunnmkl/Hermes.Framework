SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================      
-- Author:  Arunkumar K  
-- Create date: 02-07-2016      
-- Description: To get chat history with search text
-- =============================================      
CREATE PROCEDURE [chat].[spGetChatHistory] (
	@User1 VARCHAR(100)
	,@User2 VARCHAR(100)
	,@FromDate AS DATE
	,@ToDate AS DATE
	,@SearchString VARCHAR(20)
	)
AS
BEGIN
	IF @SearchString IS NULL
	BEGIN
		SELECT [From]
			,[To]
			,[DateTimestamp]
			,[Message]
			,uf.Username
		FROM [chat].[History] h WITH (NOLOCK)
		INNER JOIN [Security].[User] uf ON uf.SecurityId = h.[From]
		WHERE (
				(
					[From] = @User1
					AND [To] = @User2
					)
				OR (
					[From] = @User2
					AND [To] = @User1
					)
				)
			AND CAST([DateTimestamp] AS DATE) BETWEEN @FromDate
				AND @ToDate
		ORDER BY [HistoryId];
	END;
	ELSE
	BEGIN
		SELECT [From]
			,[To]
			,[DateTimestamp]
			,[Message]
			,uf.Username
		FROM [chat].[History] h WITH (NOLOCK)
		INNER JOIN [Security].[User] uf ON uf.SecurityId = h.[From]
		WHERE (
				(
					[From] = @User1
					AND [To] = @User2
					)
				OR (
					[From] = @User2
					AND [To] = @User1
					)
				)
			AND CAST([DateTimestamp] AS DATE) BETWEEN @FromDate
				AND @ToDate
			AND [Message] LIKE @SearchString
		ORDER BY [HistoryId];
	END;
END;
GO
