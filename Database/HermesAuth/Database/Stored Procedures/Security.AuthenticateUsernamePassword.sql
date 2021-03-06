
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Security].[AuthenticateUsernamePassword] (
	@Username VARCHAR(50)
	,@Password VARCHAR(50)
	)
AS
BEGIN
	--DECLARE @GroupList TABLE (RoleId BIGINT, SecurityId UNIQUEIDENTIFIER, [Name] VARCHAR(50));
	DECLARE @userId BIGINT = 0;

	SET @userId = (
			SELECT U.UserId
			FROM [Security].[User] AS U
			INNER JOIN [Security].[UserPassword] AS UP ON U.UserId = UP.UserId
			WHERE U.Username = @Username
				AND UP.[Password] = @Password
				AND U.[Enabled] = 1
			);

	SELECT U.[UserId]
		,U.[SecurityId]
		,U.[Username]
		,CAST(UP.[UpdatedTimestamp] AS BIGINT) AS [PasswordTimestamp]
	FROM [Security].[User] AS U
	INNER JOIN [Security].[UserPassword] AS UP ON U.UserId = UP.UserId
	WHERE U.[UserId] = @userId;

	--INSERT INTO @GroupList (RoleId, SecurityId, [Name])
	SELECT DISTINCT r.RoleId
		,r.SecurityId
		,r.[Name]
	FROM [Security].[Role] AS r
	INNER JOIN [Security].UserRole AS ur ON ur.RoleId = r.RoleId
	INNER JOIN [Security].[User] AS u ON u.UserId = ur.UserId
	WHERE ur.[UserId] = @userId
		AND U.[Enabled] = 1
		AND R.IsActive = 1;

	-- Login Provider
	SELECT ulp.[LoginProvider]
		,ulp.[ProviderKey]
		,ulp.[UserId]
	FROM [Security].[UserLoginProvider] AS ulp
	INNER JOIN [Security].[User] AS u ON u.UserId = ulp.UserId
	WHERE ulp.[UserId] = @userId
		AND U.[Enabled] = 1;
END;
GO
