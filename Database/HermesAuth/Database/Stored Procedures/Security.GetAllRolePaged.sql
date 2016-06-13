SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author: Parul
-- Create date: 07 June 2016
-- Description:	Get all the Roles records 
-- EXEC [Security].[GetAllRolePaged] 1,10,'','',''
-- =============================================
CREATE PROCEDURE [Security].[GetAllRolePaged] (
	@PageNumber INT
	,@PageSize INT
	,@SortField VARCHAR(50)
	,@SortDirection VARCHAR(50)
	,@FilterString VARCHAR(1000)
	)
AS
BEGIN
	DECLARE @RecordsFrom INT
	DECLARE @RecordsTo INT
	DECLARE @SortString VARCHAR(100)
	DECLARE @Query NVARCHAR(MAX)
	DECLARE @Params NVARCHAR(MAX)

	SELECT @RecordsFrom = ((@PageNumber - 1) * @PageSize) + 1

	SELECT @RecordsTo = @PageNumber * @PageSize

	IF @SortField <> ''
	BEGIN
		SELECT @SortString = ' ORDER BY ' + @SortField + ' ' + @SortDirection
	END
	ELSE
	BEGIN
		SELECT @SortString = ' ORDER BY [RoleName]'
	END

	SELECT @Query = N';WITH GetAllRolesCte AS
		(
			SELECT 
				A.[RoleId]
				, A.[SecurityId]
				, A.[RoleName]
				, A.[UserCount]
				, A.[Description]
				, A.[Status]
				, A.[ModifiedBy]
				, TotalRecords = COUNT(A.[RoleId]) OVER ()
				, RowNumber = ROW_NUMBER() OVER (' + @SortString + ')
			FROM
				[Security].[RoleUserCount] A' + @FilterString + ')

		SELECT 
				A.[RoleId]
				, A.[SecurityId]
				, A.[RoleName]
				, A.[UserCount]
				, A.[Description]
				, A.[Status]
				, A.[ModifiedBy]
				--, A.[TotalRecords]
				--, A.[RowNumber]  
		FROM  
			[GetAllRolesCte] A
		WHERE 
			A.[RowNumber] BETWEEN @RecordsFrom AND @RecordsTo'

	SELECT @Params = N'@RecordsFrom INT, @RecordsTo INT'

	PRINT @Query

	EXEC SP_EXECUTESQL @Query
		,@Params
		,@RecordsFrom
		,@RecordsTo
END
GO
