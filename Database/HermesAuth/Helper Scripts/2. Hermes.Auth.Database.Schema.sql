USE [Auth]
GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Security', N'TABLE',N'AccessControlList', N'COLUMN',N'SecurityId'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'Security', @level1type=N'TABLE',@level1name=N'AccessControlList', @level2type=N'COLUMN',@level2name=N'SecurityId'

GO
/****** Object:  StoredProcedure [Security].[spRevokePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[spRevokePermission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[spRevokePermission]
GO
/****** Object:  StoredProcedure [Security].[spGrantPermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[spGrantPermission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[spGrantPermission]
GO
/****** Object:  StoredProcedure [Security].[spGetUserResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[spGetUserResourcePermission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[spGetUserResourcePermission]
GO
/****** Object:  StoredProcedure [Security].[spGetUserPermissions]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[spGetUserPermissions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[spGetUserPermissions]
GO
/****** Object:  StoredProcedure [Security].[SetTokenExpires]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[SetTokenExpires]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[SetTokenExpires]
GO
/****** Object:  StoredProcedure [Security].[SaveUserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[SaveUserAuthToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[SaveUserAuthToken]
GO
/****** Object:  StoredProcedure [Security].[RoleExists]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[RoleExists]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[RoleExists]
GO
/****** Object:  StoredProcedure [Security].[RemoveRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[RemoveRefreshToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[RemoveRefreshToken]
GO
/****** Object:  StoredProcedure [Security].[ListSecurityRolesByUserName]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[ListSecurityRolesByUserName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[ListSecurityRolesByUserName]
GO
/****** Object:  StoredProcedure [Security].[GetUserAuthTokenId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetUserAuthTokenId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[GetUserAuthTokenId]
GO
/****** Object:  StoredProcedure [Security].[GetUserAuthTokenById]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetUserAuthTokenById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[GetUserAuthTokenById]
GO
/****** Object:  StoredProcedure [Security].[GetUserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetUserAuthToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[GetUserAuthToken]
GO
/****** Object:  StoredProcedure [Security].[GetAuthenticatedUser]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetAuthenticatedUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[GetAuthenticatedUser]
GO
/****** Object:  StoredProcedure [Security].[GetAllRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetAllRefreshToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[GetAllRefreshToken]
GO
/****** Object:  StoredProcedure [Security].[GenerateUserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GenerateUserAuthToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[GenerateUserAuthToken]
GO
/****** Object:  StoredProcedure [Security].[FindRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[FindRefreshToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[FindRefreshToken]
GO
/****** Object:  StoredProcedure [Security].[FindLoginProvider]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[FindLoginProvider]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[FindLoginProvider]
GO
/****** Object:  StoredProcedure [Security].[FindAuthClientById]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[FindAuthClientById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[FindAuthClientById]
GO
/****** Object:  StoredProcedure [Security].[CheckAuthorization]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[CheckAuthorization]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[CheckAuthorization]
GO
/****** Object:  StoredProcedure [Security].[AuthenticateUsernamePassword]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AuthenticateUsernamePassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[AuthenticateUsernamePassword]
GO
/****** Object:  StoredProcedure [Security].[AddUserToRoleByName]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AddUserToRoleByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[AddUserToRoleByName]
GO
/****** Object:  StoredProcedure [Security].[AddRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AddRefreshToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[AddRefreshToken]
GO
/****** Object:  StoredProcedure [Security].[AddNewUserLoginProvider]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AddNewUserLoginProvider]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[AddNewUserLoginProvider]
GO
/****** Object:  StoredProcedure [Security].[AddNewUser]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AddNewUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[AddNewUser]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserRole_User]') AND parent_object_id = OBJECT_ID(N'[Security].[UserRole]'))
ALTER TABLE [Security].[UserRole] DROP CONSTRAINT [FK_UserRole_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserRole_Role]') AND parent_object_id = OBJECT_ID(N'[Security].[UserRole]'))
ALTER TABLE [Security].[UserRole] DROP CONSTRAINT [FK_UserRole_Role]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserLoginProvider_User]') AND parent_object_id = OBJECT_ID(N'[Security].[UserLoginProvider]'))
ALTER TABLE [Security].[UserLoginProvider] DROP CONSTRAINT [FK_UserLoginProvider_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserAuthToken_User]') AND parent_object_id = OBJECT_ID(N'[Security].[UserAuthToken]'))
ALTER TABLE [Security].[UserAuthToken] DROP CONSTRAINT [FK_UserAuthToken_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_Role_User]') AND parent_object_id = OBJECT_ID(N'[Security].[Role]'))
ALTER TABLE [Security].[Role] DROP CONSTRAINT [FK_Role_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ResourcePermission_Resource]') AND parent_object_id = OBJECT_ID(N'[Security].[ResourcePermission]'))
ALTER TABLE [Security].[ResourcePermission] DROP CONSTRAINT [FK_ResourcePermission_Resource]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ResourcePermission_Permission]') AND parent_object_id = OBJECT_ID(N'[Security].[ResourcePermission]'))
ALTER TABLE [Security].[ResourcePermission] DROP CONSTRAINT [FK_ResourcePermission_Permission]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_RefreshToken_AuthClient]') AND parent_object_id = OBJECT_ID(N'[Security].[RefreshToken]'))
ALTER TABLE [Security].[RefreshToken] DROP CONSTRAINT [FK_RefreshToken_AuthClient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_AccessPermission_Permission]') AND parent_object_id = OBJECT_ID(N'[Security].[AccessPermission]'))
ALTER TABLE [Security].[AccessPermission] DROP CONSTRAINT [FK_AccessPermission_Permission]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_AccessPermission_AccessControlList]') AND parent_object_id = OBJECT_ID(N'[Security].[AccessPermission]'))
ALTER TABLE [Security].[AccessPermission] DROP CONSTRAINT [FK_AccessPermission_AccessControlList]
GO
/****** Object:  Index [IX_AccessPermissionJoin_SecurityIdPermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[AccessPermissionJoin]') AND name = N'IX_AccessPermissionJoin_SecurityIdPermission')
DROP INDEX [IX_AccessPermissionJoin_SecurityIdPermission] ON [Security].[AccessPermissionJoin]
GO
/****** Object:  Index [IX_AccessPermissionJoin_PermissionResourceId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[AccessPermissionJoin]') AND name = N'IX_AccessPermissionJoin_PermissionResourceId')
DROP INDEX [IX_AccessPermissionJoin_PermissionResourceId] ON [Security].[AccessPermissionJoin]
GO
/****** Object:  Index [IX_AccessPermission_ResourceIdDeny]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[AccessPermissionJoin]') AND name = N'IX_AccessPermission_ResourceIdDeny')
DROP INDEX [IX_AccessPermission_ResourceIdDeny] ON [Security].[AccessPermissionJoin]
GO
/****** Object:  Index [IX_User]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[User]') AND name = N'IX_User')
DROP INDEX [IX_User] ON [Security].[User]
GO
/****** Object:  Index [IX_ResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[ResourcePermission]') AND name = N'IX_ResourcePermission')
DROP INDEX [IX_ResourcePermission] ON [Security].[ResourcePermission]
GO
/****** Object:  Index [IX_AccessControlList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[AccessControlList]') AND name = N'IX_AccessControlList')
DROP INDEX [IX_AccessControlList] ON [Security].[AccessControlList]
GO
/****** Object:  View [Security].[ResourceAccess]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Security].[ResourceAccess]'))
DROP VIEW [Security].[ResourceAccess]
GO
/****** Object:  UserDefinedFunction [Security].[GetResourceOwner]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetResourceOwner]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Security].[GetResourceOwner]
GO
/****** Object:  Index [PK_ResourceOwnerUser]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[ResourceOwnerUser]') AND name = N'PK_ResourceOwnerUser')
DROP INDEX [PK_ResourceOwnerUser] ON [Security].[ResourceOwnerUser] WITH ( ONLINE = OFF )
GO
/****** Object:  View [Security].[ResourceOwnerUser]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Security].[ResourceOwnerUser]'))
DROP VIEW [Security].[ResourceOwnerUser]
GO
/****** Object:  Index [PK_ResourceOwnerRole]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[ResourceOwnerRole]') AND name = N'PK_ResourceOwnerRole')
DROP INDEX [PK_ResourceOwnerRole] ON [Security].[ResourceOwnerRole] WITH ( ONLINE = OFF )
GO
/****** Object:  View [Security].[ResourceOwnerRole]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Security].[ResourceOwnerRole]'))
DROP VIEW [Security].[ResourceOwnerRole]
GO
/****** Object:  UserDefinedFunction [Security].[GetUserSecurityIdRelatedSecurityIds]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetUserSecurityIdRelatedSecurityIds]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Security].[GetUserSecurityIdRelatedSecurityIds]
GO
/****** Object:  Index [IX_UserRoleSecurityId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[UserRoleSecurityId]') AND name = N'IX_UserRoleSecurityId')
DROP INDEX [IX_UserRoleSecurityId] ON [Security].[UserRoleSecurityId] WITH ( ONLINE = OFF )
GO
/****** Object:  View [Security].[UserRoleSecurityId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Security].[UserRoleSecurityId]'))
DROP VIEW [Security].[UserRoleSecurityId]
GO
/****** Object:  UserDefinedFunction [Security].[GetResourceAccess]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetResourceAccess]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Security].[GetResourceAccess]
GO
/****** Object:  View [Security].[AccessPermissionAllowDenyJoin]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Security].[AccessPermissionAllowDenyJoin]'))
DROP VIEW [Security].[AccessPermissionAllowDenyJoin]
GO
/****** Object:  Index [PK_AccessPermissionJoin]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[AccessPermissionJoin]') AND name = N'PK_AccessPermissionJoin')
DROP INDEX [PK_AccessPermissionJoin] ON [Security].[AccessPermissionJoin] WITH ( ONLINE = OFF )
GO
/****** Object:  View [Security].[AccessPermissionJoin]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Security].[AccessPermissionJoin]'))
DROP VIEW [Security].[AccessPermissionJoin]
GO
/****** Object:  Table [Security].[UserRole]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[UserRole]') AND type in (N'U'))
DROP TABLE [Security].[UserRole]
GO
/****** Object:  Table [Security].[UserLoginProvider]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[UserLoginProvider]') AND type in (N'U'))
DROP TABLE [Security].[UserLoginProvider]
GO
/****** Object:  Table [Security].[UserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[UserAuthToken]') AND type in (N'U'))
DROP TABLE [Security].[UserAuthToken]
GO
/****** Object:  Table [Security].[User]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[User]') AND type in (N'U'))
DROP TABLE [Security].[User]
GO
/****** Object:  Table [Security].[Role]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[Role]') AND type in (N'U'))
DROP TABLE [Security].[Role]
GO
/****** Object:  Table [Security].[ResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[ResourcePermission]') AND type in (N'U'))
DROP TABLE [Security].[ResourcePermission]
GO
/****** Object:  Table [Security].[Resource]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[Resource]') AND type in (N'U'))
DROP TABLE [Security].[Resource]
GO
/****** Object:  Table [Security].[RefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[RefreshToken]') AND type in (N'U'))
DROP TABLE [Security].[RefreshToken]
GO
/****** Object:  Table [Security].[Permission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[Permission]') AND type in (N'U'))
DROP TABLE [Security].[Permission]
GO
/****** Object:  Table [Security].[AuthClient]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AuthClient]') AND type in (N'U'))
DROP TABLE [Security].[AuthClient]
GO
/****** Object:  Table [Security].[AccessPermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AccessPermission]') AND type in (N'U'))
DROP TABLE [Security].[AccessPermission]
GO
/****** Object:  Table [Security].[AccessControlList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AccessControlList]') AND type in (N'U'))
DROP TABLE [Security].[AccessControlList]
GO
/****** Object:  UserDefinedFunction [Security].[fnCheckAuthorization]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[fnCheckAuthorization]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Security].[fnCheckAuthorization]
GO
/****** Object:  UserDefinedTableType [Security].[SecurityIdList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'SecurityIdList' AND ss.name = N'Security')
DROP TYPE [Security].[SecurityIdList]
GO
/****** Object:  UserDefinedTableType [Security].[SecurityIdList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'SecurityIdList' AND ss.name = N'Security')
CREATE TYPE [Security].[SecurityIdList] AS TABLE(
	[SecurityId] [uniqueidentifier] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[SecurityId] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedFunction [Security].[fnCheckAuthorization]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[fnCheckAuthorization]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [Security].[fnCheckAuthorization] (
	@ResourceId UNIQUEIDENTIFIER
	,@SecurityIdList [Security].SecurityIdList READONLY
	,@PermissionId INT
	)
RETURNS BIT
AS
BEGIN
	DECLARE @IsOwner BIT = 0
	DECLARE @DenyCount INT = 0;
	DECLARE @AllowCount INT = 0;
	DECLARE @ExpandedSecurityIdList [Security].SecurityIdList;

	INSERT INTO @ExpandedSecurityIdList
	SELECT [SecurityId]
	FROM @SecurityIdLIST
	
	UNION
	
	SELECT [SecurityId]
	FROM [Security].[Role]
	WHERE NAME = ''Anonymous'';

	--Owner->Deny->Allow->Nothing
	IF EXISTS (SELECT TOP 1 1 FROM [Security].GetResourceOwner(@ResourceId) o INNER JOIN @ExpandedSecurityIdList s ON o.[SecurityId] = s.[SecurityId])	
	BEGIN
		SELECT @IsOwner = 1
	END
	ELSE
	BEGIN
		SELECT @DenyCount = COUNT(*)
		FROM @ExpandedSecurityIdList AS [SecurityIds]
		INNER JOIN [Security].AccessPermissionJoin AS AP WITH (NOEXPAND) ON [SecurityIds].[SecurityId] = AP.[SecurityId]
			AND AP.ResourceId = @ResourceId
			AND AP.PermissionId = @PermissionId
			AND [Deny] = 1;

		IF @DenyCount = 0
		BEGIN
			SELECT @AllowCount = COUNT(*)
			FROM @ExpandedSecurityIdList AS [SecurityIds]
			INNER JOIN [Security].AccessPermissionJoin AS AP WITH (NOEXPAND) ON [SecurityIds].[SecurityId] = AP.[SecurityId]
				AND AP.ResourceId = @ResourceId
				AND AP.PermissionId = @PermissionId
				AND [Deny] = 0;
		END;
	END;

	--RETURN VALUE IS A BIT FIELD
	--None = 0x0, 
	--Access = 0x1
	DECLARE @RetVal INT = 0;

	IF @IsOwner = 1 OR (@DenyCount = 0 AND @AllowCount > 0)
	BEGIN
		SET @RetVal = 1;
	END;

	RETURN @RetVal;
END;

' 
END

GO
/****** Object:  Table [Security].[AccessControlList]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AccessControlList]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[AccessControlList](
	[AccessControlListId] [bigint] IDENTITY(1,1) NOT NULL,
	[ResourceId] [uniqueidentifier] NOT NULL,
	[SecurityId] [uniqueidentifier] NOT NULL,
	[IsOwner] [bit] NOT NULL CONSTRAINT [DF_AccessControlList_IsOwner]  DEFAULT ((0)),
 CONSTRAINT [PK_AccessControlList] PRIMARY KEY CLUSTERED 
(
	[AccessControlListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Security].[AccessPermission]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AccessPermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[AccessPermission](
	[AccessControlListId] [bigint] NOT NULL,
	[PermissionId] [int] NOT NULL,
	[Deny] [bit] NOT NULL CONSTRAINT [DF_AccessPermission_Deny]  DEFAULT ((0)),
 CONSTRAINT [PK_AccessPermission] PRIMARY KEY CLUSTERED 
(
	[AccessControlListId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Security].[AuthClient]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AuthClient]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[AuthClient](
	[AuthClientId] [varchar](128) NOT NULL,
	[Secret] [varchar](1000) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[ApplicationType] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[RefreshTokenLifeTime] [int] NOT NULL,
	[AllowedOrigin] [varchar](100) NULL,
	[AccessTokenExpireTimeSpan] [int] NOT NULL CONSTRAINT [DF_AuthClient_TokenLifeTime]  DEFAULT ((30)),
 CONSTRAINT [PK_Security.AuthClients] PRIMARY KEY CLUSTERED 
(
	[AuthClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[Permission]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[Permission]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[Permission](
	[PermissionId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[RefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[RefreshToken]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[RefreshToken](
	[RefreshTokenId] [varchar](128) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[AuthClientId] [varchar](128) NOT NULL,
	[IssuedUtc] [datetime] NOT NULL,
	[ExpiresUtc] [datetime] NOT NULL,
	[ProtectedTicket] [varchar](8000) NOT NULL,
	[UserAuthTokenId] [varchar](36) NULL,
 CONSTRAINT [PK_Security.RefreshTokens] PRIMARY KEY CLUSTERED 
(
	[RefreshTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[Resource]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[Resource]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[Resource](
	[ResourceId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Resource_ResourceId]  DEFAULT (newid()),
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](150) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Resource_IsActive]  DEFAULT ((1)),
	[Created] [datetime] NOT NULL CONSTRAINT [DF_Resource_Created]  DEFAULT (getdate()),
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[ResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[ResourcePermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[ResourcePermission](
	[ResourcePermissionId] [bigint] IDENTITY(1,1) NOT NULL,
	[ResourceId] [uniqueidentifier] NOT NULL,
	[PermissionId] [int] NOT NULL,
	[Deny] [bit] NOT NULL CONSTRAINT [DF_ResourcePermission_Deny]  DEFAULT ((0)),
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_ResourcePermission] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Security].[Role]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[Role]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[Role](
	[RoleId] [bigint] IDENTITY(1,1) NOT NULL,
	[SecurityId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](150) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Role_IsActive]  DEFAULT ((1)),
	[UpdatedBy] [bigint] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[User]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[User](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[SecurityId] [uniqueidentifier] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
	[Enabled] [bit] NOT NULL CONSTRAINT [DF_User_Enabled]  DEFAULT ((1)),
	[Created] [datetime] NOT NULL CONSTRAINT [DF_User_Created]  DEFAULT (getdate()),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[UserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[UserAuthToken]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[UserAuthToken](
	[UserAuthTokenId] [varchar](36) NOT NULL CONSTRAINT [DF_UserAuthToken_UserAuthTokenId]  DEFAULT (replace(CONVERT([varchar](36),newid()),'-','')),
	[UserId] [bigint] NOT NULL,
	[AuthClientId] [varchar](128) NULL,
	[IssuedUtc] [datetime] NOT NULL,
	[ExpiresUtc] [datetime] NOT NULL,
	[AccessToken] [varchar](8000) NULL,
	[IsLoggedIn] [bit] NOT NULL CONSTRAINT [DF_UserAuthToken_IsLoggedIn]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_UserAuthToken_CreatedDate]  DEFAULT (getdate()),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_UserAuthToken_UpdatedDate]  DEFAULT (getdate()),
	[IsExpired]  AS (CONVERT([bit],case when [ExpiresUtc]<getutcdate() OR [IsLoggedIn]=(0) then (1) else (0) end,(0))),
 CONSTRAINT [PK_UserAuthToken] PRIMARY KEY CLUSTERED 
(
	[UserAuthTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[UserLoginProvider]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[UserLoginProvider]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[UserLoginProvider](
	[LoginProvider] [varchar](50) NOT NULL,
	[ProviderKey] [varchar](128) NOT NULL,
	[UserId] [bigint] NOT NULL,
 CONSTRAINT [PK_UserLoginProvider] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[UserRole]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[UserRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[UserRole](
	[UserId] [bigint] NOT NULL,
	[RoleId] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [Security].[AccessPermissionJoin]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Security].[AccessPermissionJoin]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [Security].[AccessPermissionJoin]	
WITH SCHEMABINDING
AS
     SELECT A.AccessControlListId,
            A.[ResourceId],
            A.[SecurityId],
            AP.PermissionId,
            AP.[Deny],
            P.Name
     FROM [Security].AccessControlList A
          INNER JOIN [Security].AccessPermission AP ON A.AccessControlListId = AP.AccessControlListId
          INNER JOIN [Security].Permission P ON AP.PermissionId = P.PermissionId;


' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [PK_AccessPermissionJoin]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[AccessPermissionJoin]') AND name = N'PK_AccessPermissionJoin')
CREATE UNIQUE CLUSTERED INDEX [PK_AccessPermissionJoin] ON [Security].[AccessPermissionJoin]
(
	[AccessControlListId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  View [Security].[AccessPermissionAllowDenyJoin]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Security].[AccessPermissionAllowDenyJoin]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [Security].[AccessPermissionAllowDenyJoin]	  
WITH SCHEMABINDING
AS SELECT A.[ResourceId], A.[SecurityId] AS [AllowedSecurityId], A.PermissionId, D.[SecurityId] AS [DeniedSecurityId]
   FROM
   (
	   SELECT AP.ResourceId, AP.SecurityId, AP.PermissionId
	   FROM [Security].AccessPermissionJoin AS AP WITH (NOEXPAND)
	   WHERE AP.[Deny] = 0
   ) AS A
   LEFT OUTER JOIN
   (
	   SELECT AP.[ResourceId], AP.[SecurityId], AP.PermissionId
	   FROM [Security].AccessPermissionJoin AS AP WITH (NOEXPAND)
	   WHERE AP.[Deny] = 1
   ) AS D
   ON A.[ResourceId] = D.[ResourceId] AND 
	  A.PermissionId = D.PermissionId;


' 
GO
/****** Object:  UserDefinedFunction [Security].[GetResourceAccess]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetResourceAccess]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [Security].[GetResourceAccess] (
	@SIDs [Security].SecurityIdList READONLY
	,@PermissionId INT
	)
RETURNS TABLE
AS
RETURN (
	   SELECT ResourceId
	   FROM [Security].AccessPermissionAllowDenyJoin AS AP
		   INNER JOIN @SIDs AS A ON AP.AllowedSecurityId = A.SecurityId
		   LEFT OUTER JOIN @SIDs AS D ON AP.DeniedSecurityId = D.SecurityId
	   WHERE AP.PermissionId = @PermissionId
		    AND D.SecurityId IS NULL
	   GROUP BY ResourceId
	   );

' 
END

GO
/****** Object:  View [Security].[UserRoleSecurityId]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Security].[UserRoleSecurityId]'))
EXEC dbo.sp_executesql @statement = N'

CREATE    VIEW [Security].[UserRoleSecurityId] 
WITH SCHEMABINDING
AS
     SELECT U.SecurityId AS UserSecurityId,
            R.SecurityId AS RoleSecurityId,
            U.UserId
     FROM [Security].[User] U
          INNER JOIN [Security].UserRole UR ON U.UserId = UR.UserId
          INNER JOIN [Security].[Role] R ON UR.RoleId = R.RoleId;





' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [IX_UserRoleSecurityId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[UserRoleSecurityId]') AND name = N'IX_UserRoleSecurityId')
CREATE UNIQUE CLUSTERED INDEX [IX_UserRoleSecurityId] ON [Security].[UserRoleSecurityId]
(
	[UserId] ASC,
	[UserSecurityId] ASC,
	[RoleSecurityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [Security].[GetUserSecurityIdRelatedSecurityIds]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetUserSecurityIdRelatedSecurityIds]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [Security].[GetUserSecurityIdRelatedSecurityIds]
(@userSecurityId UNIQUEIDENTIFIER
)
RETURNS TABLE
AS
     RETURN
(
    -- User
    SELECT @userSecurityId AS SecurityId,
           ''User'' AS SecurityIdType
    UNION ALL
    -- Users''s Roles
    SELECT RoleSecurityId,
           ''User Role''
    FROM [Security].UserRoleSecurityId
    WHERE UserSecurityId = @userSecurityId
);

' 
END

GO
/****** Object:  View [Security].[ResourceOwnerRole]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Security].[ResourceOwnerRole]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [Security].[ResourceOwnerRole]
WITH SCHEMABINDING
AS
SELECT
	ACL.ResourceId,
	R.RoleId,
	R.SecurityId,
	R.Name
FROM
	[Security].AccessControlList ACL
	INNER JOIN [Security].[Role] R ON ACL.SecurityId = R.SecurityId
WHERE
	ACL.IsOwner = 1


' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [PK_ResourceOwnerRole]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[ResourceOwnerRole]') AND name = N'PK_ResourceOwnerRole')
CREATE UNIQUE CLUSTERED INDEX [PK_ResourceOwnerRole] ON [Security].[ResourceOwnerRole]
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  View [Security].[ResourceOwnerUser]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Security].[ResourceOwnerUser]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [Security].[ResourceOwnerUser] 
WITH SCHEMABINDING
 
AS
SELECT
	ACL.ResourceId,
	U.UserID,
	U.SecurityId,
	U.Username
FROM
	[Security].AccessControlList ACL
	INNER JOIN [Security].[User] U ON ACL.SecurityId = U.SecurityId
WHERE
	ACL.IsOwner = 1





' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [PK_ResourceOwnerUser]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[ResourceOwnerUser]') AND name = N'PK_ResourceOwnerUser')
CREATE UNIQUE CLUSTERED INDEX [PK_ResourceOwnerUser] ON [Security].[ResourceOwnerUser]
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [Security].[GetResourceOwner]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetResourceOwner]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [Security].[GetResourceOwner] 
(	
	@ResourceId UNIQUEIDENTIFIER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT
		''U'' AS [Type],
		UserId AS [Id],
		SecurityId AS [SecurityId],
		Username AS [Name]
	FROM	[Security].ResourceOwnerUser WITH (NOEXPAND) WHERE ResourceId = @ResourceId
	UNION ALL
	SELECT
		''R'',
		RoleId,
		SecurityId,
		Name
	FROM [Security].ResourceOwnerRole WITH (NOEXPAND) WHERE ResourceId = @ResourceId
)

' 
END

GO
/****** Object:  View [Security].[ResourceAccess]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Security].[ResourceAccess]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [Security].[ResourceAccess]
AS
     SELECT B.SecurityId,
            B.ResourceId,
            A.Name AS ResourceName,
            B.AccessControlListId,
            C.PermissionId,
            D.Name AS PermissionName,
            C.[Deny]
     FROM [Security].[Resource] AS A
          INNER JOIN [Security].AccessControlList AS B ON(A.ResourceId = B.ResourceId)
          INNER JOIN [Security].AccessPermission AS C ON B.AccessControlListId = C.AccessControlListId
          INNER JOIN [Security].Permission AS D ON C.PermissionId = D.PermissionId;

' 
GO
/****** Object:  Index [IX_AccessControlList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[AccessControlList]') AND name = N'IX_AccessControlList')
CREATE UNIQUE NONCLUSTERED INDEX [IX_AccessControlList] ON [Security].[AccessControlList]
(
	[ResourceId] ASC,
	[SecurityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[ResourcePermission]') AND name = N'IX_ResourcePermission')
CREATE NONCLUSTERED INDEX [IX_ResourcePermission] ON [Security].[ResourcePermission]
(
	[ResourcePermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[User]') AND name = N'IX_User')
CREATE UNIQUE NONCLUSTERED INDEX [IX_User] ON [Security].[User]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [IX_AccessPermission_ResourceIdDeny]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[AccessPermissionJoin]') AND name = N'IX_AccessPermission_ResourceIdDeny')
CREATE NONCLUSTERED INDEX [IX_AccessPermission_ResourceIdDeny] ON [Security].[AccessPermissionJoin]
(
	[ResourceId] ASC,
	[Deny] ASC
)
INCLUDE ( 	[Name],
	[PermissionId],
	[SecurityId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [IX_AccessPermissionJoin_PermissionResourceId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[AccessPermissionJoin]') AND name = N'IX_AccessPermissionJoin_PermissionResourceId')
CREATE NONCLUSTERED INDEX [IX_AccessPermissionJoin_PermissionResourceId] ON [Security].[AccessPermissionJoin]
(
	[PermissionId] ASC,
	[ResourceId] ASC
)
INCLUDE ( 	[SecurityId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [IX_AccessPermissionJoin_SecurityIdPermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[AccessPermissionJoin]') AND name = N'IX_AccessPermissionJoin_SecurityIdPermission')
CREATE NONCLUSTERED INDEX [IX_AccessPermissionJoin_SecurityIdPermission] ON [Security].[AccessPermissionJoin]
(
	[Deny] ASC,
	[SecurityId] ASC,
	[PermissionId] ASC
)
INCLUDE ( 	[ResourceId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_AccessPermission_AccessControlList]') AND parent_object_id = OBJECT_ID(N'[Security].[AccessPermission]'))
ALTER TABLE [Security].[AccessPermission]  WITH CHECK ADD  CONSTRAINT [FK_AccessPermission_AccessControlList] FOREIGN KEY([AccessControlListId])
REFERENCES [Security].[AccessControlList] ([AccessControlListId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_AccessPermission_AccessControlList]') AND parent_object_id = OBJECT_ID(N'[Security].[AccessPermission]'))
ALTER TABLE [Security].[AccessPermission] CHECK CONSTRAINT [FK_AccessPermission_AccessControlList]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_AccessPermission_Permission]') AND parent_object_id = OBJECT_ID(N'[Security].[AccessPermission]'))
ALTER TABLE [Security].[AccessPermission]  WITH CHECK ADD  CONSTRAINT [FK_AccessPermission_Permission] FOREIGN KEY([PermissionId])
REFERENCES [Security].[Permission] ([PermissionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_AccessPermission_Permission]') AND parent_object_id = OBJECT_ID(N'[Security].[AccessPermission]'))
ALTER TABLE [Security].[AccessPermission] CHECK CONSTRAINT [FK_AccessPermission_Permission]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_RefreshToken_AuthClient]') AND parent_object_id = OBJECT_ID(N'[Security].[RefreshToken]'))
ALTER TABLE [Security].[RefreshToken]  WITH CHECK ADD  CONSTRAINT [FK_RefreshToken_AuthClient] FOREIGN KEY([AuthClientId])
REFERENCES [Security].[AuthClient] ([AuthClientId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_RefreshToken_AuthClient]') AND parent_object_id = OBJECT_ID(N'[Security].[RefreshToken]'))
ALTER TABLE [Security].[RefreshToken] CHECK CONSTRAINT [FK_RefreshToken_AuthClient]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ResourcePermission_Permission]') AND parent_object_id = OBJECT_ID(N'[Security].[ResourcePermission]'))
ALTER TABLE [Security].[ResourcePermission]  WITH CHECK ADD  CONSTRAINT [FK_ResourcePermission_Permission] FOREIGN KEY([PermissionId])
REFERENCES [Security].[Permission] ([PermissionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ResourcePermission_Permission]') AND parent_object_id = OBJECT_ID(N'[Security].[ResourcePermission]'))
ALTER TABLE [Security].[ResourcePermission] CHECK CONSTRAINT [FK_ResourcePermission_Permission]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ResourcePermission_Resource]') AND parent_object_id = OBJECT_ID(N'[Security].[ResourcePermission]'))
ALTER TABLE [Security].[ResourcePermission]  WITH CHECK ADD  CONSTRAINT [FK_ResourcePermission_Resource] FOREIGN KEY([ResourceId])
REFERENCES [Security].[Resource] ([ResourceId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ResourcePermission_Resource]') AND parent_object_id = OBJECT_ID(N'[Security].[ResourcePermission]'))
ALTER TABLE [Security].[ResourcePermission] CHECK CONSTRAINT [FK_ResourcePermission_Resource]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_Role_User]') AND parent_object_id = OBJECT_ID(N'[Security].[Role]'))
ALTER TABLE [Security].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_User] FOREIGN KEY([UpdatedBy])
REFERENCES [Security].[User] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_Role_User]') AND parent_object_id = OBJECT_ID(N'[Security].[Role]'))
ALTER TABLE [Security].[Role] CHECK CONSTRAINT [FK_Role_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserAuthToken_User]') AND parent_object_id = OBJECT_ID(N'[Security].[UserAuthToken]'))
ALTER TABLE [Security].[UserAuthToken]  WITH CHECK ADD  CONSTRAINT [FK_UserAuthToken_User] FOREIGN KEY([UserId])
REFERENCES [Security].[User] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserAuthToken_User]') AND parent_object_id = OBJECT_ID(N'[Security].[UserAuthToken]'))
ALTER TABLE [Security].[UserAuthToken] CHECK CONSTRAINT [FK_UserAuthToken_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserLoginProvider_User]') AND parent_object_id = OBJECT_ID(N'[Security].[UserLoginProvider]'))
ALTER TABLE [Security].[UserLoginProvider]  WITH CHECK ADD  CONSTRAINT [FK_UserLoginProvider_User] FOREIGN KEY([UserId])
REFERENCES [Security].[User] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserLoginProvider_User]') AND parent_object_id = OBJECT_ID(N'[Security].[UserLoginProvider]'))
ALTER TABLE [Security].[UserLoginProvider] CHECK CONSTRAINT [FK_UserLoginProvider_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserRole_Role]') AND parent_object_id = OBJECT_ID(N'[Security].[UserRole]'))
ALTER TABLE [Security].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [Security].[Role] ([RoleId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserRole_Role]') AND parent_object_id = OBJECT_ID(N'[Security].[UserRole]'))
ALTER TABLE [Security].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserRole_User]') AND parent_object_id = OBJECT_ID(N'[Security].[UserRole]'))
ALTER TABLE [Security].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserId])
REFERENCES [Security].[User] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserRole_User]') AND parent_object_id = OBJECT_ID(N'[Security].[UserRole]'))
ALTER TABLE [Security].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
/****** Object:  StoredProcedure [Security].[AddNewUser]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AddNewUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[AddNewUser] AS' 
END
GO

ALTER PROCEDURE [Security].[AddNewUser] (
	@UserName VARCHAR(50)
	,@EmailAddress VARCHAR(50)
	,@Password VARCHAR(50)
	,@Enabled BIT = 1
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT TOP 1 1
			FROM [Security].[User] u
			WHERE u.[Username] = @UserName
				OR u.[EmailAddress] = @UserName
			)
	BEGIN
		DECLARE @SecurityId UNIQUEIDENTIFIER = NEWID();

		INSERT INTO [Security].[User] (
			[SecurityId]
			,[Username]
			,[Password]
			,[EmailAddress]
			,[Enabled]
			,[Created]
			)
		VALUES (
			@SecurityId
			,@UserName
			,@Password
			,@EmailAddress
			,@Enabled
			,GETDATE()
			);

		SELECT CAST(SCOPE_IDENTITY() AS BigINT) AS UserId;
	END;
	ELSE
	BEGIN
		DECLARE @name VARCHAR(150) = @UserName;
		IF (ISNULL(@EmailAddress, '') <> '') 
           BEGIN 
		  Set @name = (@name + ' / ' + @EmailAddress);
           END

		RAISERROR (45120, 16, 1, @name)
	END
END;


GO
/****** Object:  StoredProcedure [Security].[AddNewUserLoginProvider]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AddNewUserLoginProvider]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[AddNewUserLoginProvider] AS' 
END
GO

ALTER PROCEDURE [Security].[AddNewUserLoginProvider] (
	@UserId BIGINT
	,@LoginProvider VARCHAR(50)
	,@ProviderKey VARCHAR(128)
	)
AS
BEGIN
	INSERT INTO [Security].[UserLoginProvider] (
		[LoginProvider]
		,[ProviderKey]
		,[UserId]
		)
	VALUES (
		@LoginProvider
		,@ProviderKey
		,@UserId
		)
END;


GO
/****** Object:  StoredProcedure [Security].[AddRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AddRefreshToken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[AddRefreshToken] AS' 
END
GO

ALTER PROCEDURE [Security].[AddRefreshToken] (
     @RefreshTokenId VARCHAR(128)
	,@Username VARCHAR(50)
	,@AuthClientId VARCHAR(128)
	,@IssuedUtc DATETIME
	,@ExpiresUtc DATETIME
	,@ProtectedTicket VARCHAR(8000)
	,@UserAuthTokenId VARCHAR(36)
	)
AS
BEGIN	 
	INSERT INTO [Security].[RefreshToken] (
		[RefreshTokenId]
		,[Username]
		,[AuthClientId]
		,[IssuedUtc]
		,[ExpiresUtc]
		,[ProtectedTicket]
		,[UserAuthTokenId]
		)
	VALUES (
		@RefreshTokenId
		,@Username
		,@AuthClientId
		,@IssuedUtc
		,@ExpiresUtc
		,@ProtectedTicket
		,@UserAuthTokenId
		)

	SELECT @RefreshTokenId AS RefreshTokenId
END;


GO
/****** Object:  StoredProcedure [Security].[AddUserToRoleByName]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AddUserToRoleByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[AddUserToRoleByName] AS' 
END
GO

ALTER PROCEDURE [Security].[AddUserToRoleByName]
(
	@Username varchar(50),
	@Rolename varchar(50)
)	
AS
	DECLARE @UserId int;
	DECLARE @RoleId int;

	SELECT @UserId = UserId FROM [Security].[User] WHERE Username = @Username;
	SELECT @RoleId = RoleId FROM [Security].[Role] WHERE Name = @Rolename;

	IF NOT EXISTS(SELECT 1 FROM [Security].[UserRole] WHERE UserId = @UserId AND RoleID = @RoleId)
	BEGIN
		INSERT [Security].[UserRole] (UserID, RoleID) VALUES (@UserID, @RoleID);
	END




GO
/****** Object:  StoredProcedure [Security].[AuthenticateUsernamePassword]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AuthenticateUsernamePassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[AuthenticateUsernamePassword] AS' 
END
GO
ALTER PROCEDURE [Security].[AuthenticateUsernamePassword](@Username VARCHAR(50),
                                                     @Password VARCHAR(50))
AS
     BEGIN
         --DECLARE @GroupList TABLE (RoleId BIGINT, SecurityId UNIQUEIDENTIFIER, [Name] VARCHAR(50));

         SELECT U.[UserId],
                U.[SecurityId],
                U.[Username]
         FROM [Security].[User] AS U
         WHERE U.Username = @Username
               AND U.[Password] = @Password
               AND U.[Enabled] = 1;

         --INSERT INTO @GroupList (RoleId, SecurityId, [Name])
         SELECT DISTINCT
                r.RoleId,
                r.SecurityId,
                r.[Name]
         FROM [Security].[Role] AS r
              INNER JOIN [Security].UserRole AS ur ON ur.RoleId = r.RoleId
              INNER JOIN [Security].[User] AS u ON u.UserId = ur.UserId
         WHERE u.Username = @Username
               AND U.[Enabled] = 1;

         -- Login Provider
         SELECT ulp.[LoginProvider],
                ulp.[ProviderKey],
                ulp.[UserId]
         FROM [Security].[User] AS U
              INNER JOIN [Security].[UserLoginProvider] AS ulp ON ulp.UserId = U.UserId
         WHERE U.Username = @Username
               AND U.[Enabled] = 1;
     END;

GO
/****** Object:  StoredProcedure [Security].[CheckAuthorization]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[CheckAuthorization]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[CheckAuthorization] AS' 
END
GO

ALTER PROCEDURE [Security].[CheckAuthorization] (
	@ResourceId UNIQUEIDENTIFIER
	,@SecurityIdList [Security].SecurityIdList READONLY
	,@PermissionId INT
	)
AS
BEGIN
	DECLARE @IsOwner BIT = 0
	DECLARE @DenyCount INT = 0;
	DECLARE @AllowCount INT = 0;
	DECLARE @ExpandedSecurityIdList [Security].SecurityIdList;

	INSERT INTO @ExpandedSecurityIdList
	SELECT [SecurityId]
	FROM @SecurityIdLIST
	
	UNION
	
	SELECT [SecurityId]
	FROM [Security].[Role]
	WHERE NAME = 'Anonymous';

	--Owner->Deny->Allow->Nothing
	IF EXISTS (SELECT TOP 1 1 FROM [Security].GetResourceOwner(@ResourceId) o INNER JOIN @ExpandedSecurityIdList s ON o.[SecurityId] = s.[SecurityId])	
	BEGIN
		SELECT @IsOwner = 1
	END
	ELSE
	BEGIN
		SELECT @DenyCount = COUNT(*)
		FROM @ExpandedSecurityIdList AS [SecurityIds]
		INNER JOIN [Security].AccessPermissionJoin AS AP WITH (NOEXPAND) ON [SecurityIds].[SecurityId] = AP.[SecurityId]
			AND AP.ResourceId = @ResourceId
			AND AP.PermissionId = @PermissionId
			AND [Deny] = 1;

		IF @DenyCount = 0
		BEGIN
			SELECT @AllowCount = COUNT(*)
			FROM @ExpandedSecurityIdList AS [SecurityIds]
			INNER JOIN [Security].AccessPermissionJoin AS AP WITH (NOEXPAND) ON [SecurityIds].[SecurityId] = AP.[SecurityId]
				AND AP.ResourceId = @ResourceId
				AND AP.PermissionId = @PermissionId
				AND [Deny] = 0;
		END;
	END;

	--RETURN VALUE IS A BIT FIELD
	--None = 0x0, 
	--Access = 0x1
	DECLARE @RetVal INT = 0;

	IF @IsOwner = 1 OR (@DenyCount = 0 AND @AllowCount > 0)
	BEGIN
		SET @RetVal = 1;
	END;

	SELECT @RetVal;
END;



GO
/****** Object:  StoredProcedure [Security].[FindAuthClientById]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[FindAuthClientById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[FindAuthClientById] AS' 
END
GO

ALTER PROCEDURE [Security].[FindAuthClientById] @authClientId VARCHAR(128)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	SELECT [AuthClientId]
		,[Secret]
		,[Name]
		,[ApplicationType]
		,[IsActive]
		,[RefreshTokenLifeTime]
		,[AllowedOrigin]
		,[AccessTokenExpireTimeSpan]
	FROM [Security].[AuthClient] ac
	WHERE ac.[AuthClientId] = @authClientId;
END;

GO
/****** Object:  StoredProcedure [Security].[FindLoginProvider]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[FindLoginProvider]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[FindLoginProvider] AS' 
END
GO
ALTER PROCEDURE [Security].[FindLoginProvider] @loginProvider VARCHAR(50),
                                           @providerKey   VARCHAR(128)
AS
     BEGIN
         -- SET NOCOUNT ON added to prevent extra result sets from
         -- interfering with SELECT statements.
         SET NOCOUNT ON;
         DECLARE @userId BIGINT;
         DECLARE @username varchar(50);
         SET @userId =
         (
             SELECT [UserId]
             FROM [Security].[UserLoginProvider] ulp
             WHERE ulp.LoginProvider = @loginProvider
                   AND ulp.ProviderKey = @providerKey
         ); 
	    SET @username =
         (
             SELECT [Username]
             FROM [Security].[User] u
             WHERE u.UserId = @userId
         );
         SELECT U.[UserId],
                U.[SecurityId],
                U.[Username]
         FROM [Security].[User] AS U
         WHERE U.UserId = @userId
               AND U.[Enabled] = 1;

         SELECT DISTINCT
                r.RoleId,
                r.SecurityId,
                r.[Name]
         FROM [Security].[Role] AS r
              INNER JOIN [Security].UserRole AS ur ON ur.RoleId = r.RoleId
              INNER JOIN [Security].[User] AS u ON u.UserId = ur.UserId
         WHERE U.UserId = @userId
               AND U.[Enabled] = 1;

         -- Login Provider
         SELECT ulp.[LoginProvider],
                ulp.[ProviderKey],
                ulp.[UserId]
         FROM [Security].[User] AS U
              INNER JOIN [Security].[UserLoginProvider] AS ulp ON ulp.UserId = U.UserId
         WHERE U.UserId = @userId
               AND U.[Enabled] = 1;
     END;

GO
/****** Object:  StoredProcedure [Security].[FindRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[FindRefreshToken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[FindRefreshToken] AS' 
END
GO

ALTER PROCEDURE [Security].[FindRefreshToken] @RefreshTokenId VARCHAR(128)
AS
BEGIN
	SELECT rt.[RefreshTokenId]
		,rt.[Username]
		,rt.[AuthClientId]
		,TODATETIMEOFFSET(rt.[IssuedUtc], '+00:00') AS [IssuedUtc] 
		,TODATETIMEOFFSET(rt.[ExpiresUtc], '+00:00') AS [ExpiresUtc]
		,rt.[ProtectedTicket]
		,rt.[UserAuthTokenId]
	FROM [Security].[RefreshToken] rt
	WHERE rt.RefreshTokenId = @RefreshTokenId
END;


GO
/****** Object:  StoredProcedure [Security].[GenerateUserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GenerateUserAuthToken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[GenerateUserAuthToken] AS' 
END
GO

ALTER PROCEDURE [Security].[GenerateUserAuthToken] (
	@Username VARCHAR(50)
	,@CheckExistence BIT = 0
	,@KillOldSession BIT = 0
	)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @userId BIGINT
	DECLARE @authTokenReturn VARCHAR(36) = NULL

	SET @userId = (SELECT UserId FROM [Security].[User] u WHERE u.Username = @Username)

	IF ISNULL(@userId, 0) > 0
	BEGIN
		IF (@KillOldSession = 1)
		BEGIN
			UPDATE [Security].[UserAuthToken]
			SET ExpiresUtc = GETUTCDATE()
				,AccessToken = NULL
				,IsLoggedIn = 0
				,UpdatedDate = GETDATE()
			WHERE UserId = @userId And IsExpired = 0

			DELETE rt FROM [Security].[RefreshToken] rt 
			Inner Join [Security].[UserAuthToken] uat on uat.UserAuthTokenId = rt.UserAuthTokenId 
			WHERE UserId = @userId
		END

		IF (@CheckExistence = 1)
		BEGIN
			IF EXISTS (SELECT TOP 1 1 FROM [Security].[UserAuthToken] uat WHERE uat.UserId = @userId AND uat.IsExpired = 0)
			BEGIN
				SELECT @authTokenReturn UserAuthToken;
				RETURN;
			END
		END

		SET @authTokenReturn = (SELECT REPLACE(CAST(NEWID() AS VARCHAR(36)), '-', ''));	

		INSERT INTO [Security].[UserAuthToken] (
			UserAuthTokenId
			,UserId
			,IssuedUtc
			,ExpiresUtc
			,IsLoggedIn
			,CreatedDate
			,UpdatedDate
			)
		VALUES (
			@authTokenReturn
			,@UserId
			,GETUTCDATE()
			,GETUTCDATE()
			,0
			,GETDATE()
			,GETDATE()
			);
	END

	SELECT @authTokenReturn UserAuthTokenId;
END;


GO
/****** Object:  StoredProcedure [Security].[GetAllRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetAllRefreshToken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[GetAllRefreshToken] AS' 
END
GO
ALTER PROCEDURE [Security].[GetAllRefreshToken]
AS
BEGIN
	SELECT [RefreshTokenId]
		,[Username]
		,[AuthClientId] 
		,TODATETIMEOFFSET([IssuedUtc], '+00:00') AS [IssuedUtc] 
		,TODATETIMEOFFSET([ExpiresUtc], '+00:00') AS [ExpiresUtc]
		,[ProtectedTicket]
		,[UserAuthTokenId]
	FROM [Security].[RefreshToken]
END;

GO
/****** Object:  StoredProcedure [Security].[GetAuthenticatedUser]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetAuthenticatedUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[GetAuthenticatedUser] AS' 
END
GO
ALTER   PROCEDURE [Security].[GetAuthenticatedUser](@UserId BIGINT)
AS
     BEGIN
         --DECLARE @GroupList TABLE (RoleId BIGINT, SecurityId UNIQUEIDENTIFIER, [Name] VARCHAR(50)); 
         DECLARE @username varchar(50);
	    SET @username =
         (
             SELECT [Username]
             FROM [Security].[User] u
             WHERE u.UserId = @userId
         );

         SELECT U.[UserId],
                U.[SecurityId],
                U.[Username]
         FROM [Security].[User] AS U
         WHERE U.[UserId] = @UserId
               AND U.[Enabled] = 1;

         --INSERT INTO @GroupList (RoleId, SecurityId, [Name])
         SELECT DISTINCT
                r.RoleId,
                r.SecurityId,
                r.[Name]
         FROM [Security].[Role] AS r
              INNER JOIN [Security].UserRole AS ur ON ur.RoleId = r.RoleId
              INNER JOIN [Security].[User] AS u ON u.UserId = ur.UserId
         WHERE u.[UserId] = @UserId
               AND U.[Enabled] = 1;

         -- Login Provider
         SELECT ulp.[LoginProvider],
                ulp.[ProviderKey],
                ulp.[UserId]
         FROM [Security].[User] AS U
              INNER JOIN [Security].[UserLoginProvider] AS ulp ON ulp.UserId = U.UserId
         WHERE U.[UserId] = @UserId
               AND U.[Enabled] = 1;

	   EXECUTE [Security].[GetUserAuthTokenId] @Username
     END;

GO
/****** Object:  StoredProcedure [Security].[GetUserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetUserAuthToken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[GetUserAuthToken] AS' 
END
GO

ALTER PROCEDURE [Security].[GetUserAuthToken] (
	@UserId BIGINT
	,@AccessToken VARCHAR(8000)
	)
AS
BEGIN
	SELECT uat.[UserAuthTokenId]
		,uat.[UserId]
		,uat.[AuthClientId]
		,TODATETIMEOFFSET(uat.[IssuedUtc], '+00:00') AS [IssuedUtc] 
		,TODATETIMEOFFSET(uat.[ExpiresUtc], '+00:00') AS [ExpiresUtc]
		,uat.[AccessToken] AS DecodedAccessToken
		,uat.[IsLoggedIn]
		,uat.[CreatedDate]
		,uat.[UpdatedDate]
		,uat.[IsExpired]
	FROM [Security].UserAuthToken uat
	WHERE uat.UserId = @UserId
		AND uat.AccessToken = @AccessToken
END;


GO
/****** Object:  StoredProcedure [Security].[GetUserAuthTokenById]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetUserAuthTokenById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[GetUserAuthTokenById] AS' 
END
GO

ALTER PROCEDURE [Security].[GetUserAuthTokenById] (@UserAuthTokenId VARCHAR(36))
AS
BEGIN
	SELECT uat.[UserAuthTokenId]
		,uat.[UserId]
		,uat.[AuthClientId]	
		,TODATETIMEOFFSET(uat.[IssuedUtc], '+00:00') AS [IssuedUtc] 
		,TODATETIMEOFFSET(uat.[ExpiresUtc], '+00:00') AS [ExpiresUtc]
		,uat.[AccessToken] AS DecodedAccessToken
		,uat.[IsLoggedIn]
		,uat.[CreatedDate]
		,uat.[UpdatedDate]
		,uat.[IsExpired]
	FROM [Security].UserAuthToken uat
	WHERE uat.[UserAuthTokenId] = @UserAuthTokenId
END;

GO
/****** Object:  StoredProcedure [Security].[GetUserAuthTokenId]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetUserAuthTokenId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[GetUserAuthTokenId] AS' 
END
GO

ALTER PROCEDURE [Security].[GetUserAuthTokenId] (
	@Username VARCHAR(50)
	,@KillOldSession BIT = 0
	)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @userId BIGINT
	DECLARE @authTokenReturn VARCHAR(36)

	SET @userId = (
			SELECT UserId
			FROM [Security].[User] u
			WHERE u.Username = @Username
			)

	IF ISNULL(@userId, 0) > 0
	BEGIN
		IF (@KillOldSession = 1)
		BEGIN
			UPDATE [Security].[UserAuthToken]
			SET ExpiresUtc = GETUTCDATE()
				,AccessToken = NULL
				,IsLoggedIn = 0
				,UpdatedDate = GETDATE()
			WHERE UserId = @userId
		END

		SET @authTokenReturn = (SELECT REPLACE(CAST(NEWID() AS VARCHAR(36)), '-', ''));

		INSERT INTO [Security].[UserAuthToken] (
			UserAuthTokenId
			,UserId
			,IssuedUtc
			,ExpiresUtc
			,IsLoggedIn
			,CreatedDate
			,UpdatedDate
			)
		VALUES (
			@authTokenReturn
			,@UserId
			,GETUTCDATE()
			,GETUTCDATE()
			,0
			,GETDATE()
			,GETDATE()
			);
	END

	SELECT @authTokenReturn UserAuthTokenId;
END;


GO
/****** Object:  StoredProcedure [Security].[ListSecurityRolesByUserName]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[ListSecurityRolesByUserName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[ListSecurityRolesByUserName] AS' 
END
GO
ALTER PROCEDURE [Security].[ListSecurityRolesByUserName](@UserName VARCHAR(50))
AS
     SELECT R.RoleID,
            R.SecurityId,
            R.Name
     FROM [Security].[Role] R
          INNER JOIN [Security].[UserRole] UR ON R.RoleId = UR.RoleId
          INNER JOIN [Security].[User] U ON UR.UserId = U.UserId
     WHERE U.Username = @UserName;



GO
/****** Object:  StoredProcedure [Security].[RemoveRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[RemoveRefreshToken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[RemoveRefreshToken] AS' 
END
GO

ALTER PROCEDURE [Security].[RemoveRefreshToken] @RefreshTokenId VARCHAR(128)
AS
BEGIN
	DELETE
	FROM [Security].[RefreshToken]
	WHERE RefreshTokenId = @RefreshTokenId
END;


GO
/****** Object:  StoredProcedure [Security].[RoleExists]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[RoleExists]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[RoleExists] AS' 
END
GO

ALTER PROCEDURE [Security].[RoleExists]
(
	@RoleName varchar(50)
)
AS
	SELECT CAST(1 as bit) FROM [Security].[Role] WHERE Name = @RoleName




GO
/****** Object:  StoredProcedure [Security].[SaveUserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[SaveUserAuthToken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[SaveUserAuthToken] AS' 
END
GO

ALTER PROCEDURE [Security].[SaveUserAuthToken] (
     @UserAuthTokenId varchar(50)
	,@UserId BIGINT
	,@AuthClientId VARCHAR(128)
	,@IssuedUtc DATETIME
	,@ExpiresUtc DATETIME
	,@AccessToken VARCHAR(8000)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT TOP 1 1
			FROM [Security].UserAuthToken uat
			WHERE uat.UserAuthTokenId = @UserAuthTokenId
			)
	BEGIN
		INSERT INTO [Security].UserAuthToken (
			UserId
			,AuthClientId
			,IssuedUtc
			,ExpiresUtc
			,AccessToken
			,CreatedDate
			,UpdatedDate
			)
		VALUES (
			@UserId
			,@AuthClientId
			,@IssuedUtc
			,@ExpiresUtc
			,@AccessToken
			,GETDATE()
			,GETDATE()
			);
	END
	ELSE IF EXISTS (
			SELECT TOP 1 1
			FROM [Security].UserAuthToken uat
			WHERE uat.UserId = @UserId
				AND (uat.AccessToken IS NULL or uat.IsExpired = 1)
			)
	BEGIN
		UPDATE [Security].UserAuthToken
		SET AuthClientId = @AuthClientId
			,IssuedUtc = @IssuedUtc
			,ExpiresUtc = @ExpiresUtc
			,AccessToken = @AccessToken
			,UpdatedDate = GETDATE()
			,IsLoggedIn = 1
		WHERE UserAuthTokenId = @UserAuthTokenId
	END
	ELSE
	BEGIN
		DECLARE @error varchar(100);
		SET @error = CAST(@UserId AS VARCHAR(100));
		RAISERROR( N'The specified value %s already exists.', 16, 1, @error );
	END
END;


GO
/****** Object:  StoredProcedure [Security].[SetTokenExpires]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[SetTokenExpires]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[SetTokenExpires] AS' 
END
GO

ALTER PROCEDURE [Security].[SetTokenExpires]
	-- Add the parameters for the stored procedure here
	@UserId BIGINT
	,@UserAuthTokenId VARCHAR(36)
AS
BEGIN
	DECLARE @rowCount INT = 0;

	-- SET NOCOUNT ON added to prevent extra result sets from
	UPDATE [Security].UserAuthToken
	SET AccessToken = NULL
		,ExpiresUtc = GETUTCDATE()
		,IsLoggedIn = 0
		,UpdatedDate = GETDATE()
	WHERE [UserId] = @UserId AND UserAuthTokenId = @UserAuthTokenId

	SET @rowCount = (
			SELECT @@ROWCOUNT
			)

	DELETE
	FROM [Security].RefreshToken
	WHERE UserAuthTokenId = @UserAuthTokenId

	SELECT @rowCount
END

GO
/****** Object:  StoredProcedure [Security].[spGetUserPermissions]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[spGetUserPermissions]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[spGetUserPermissions] AS' 
END
GO

ALTER PROCEDURE [Security].[spGetUserPermissions] (@userID INT)
AS
BEGIN
	WITH AllSecurityId
	AS (
		SELECT [User].[SecurityId]
		FROM [Security].[User]
		WHERE [User].UserID = @userID
		
		UNION
		
		SELECT [Role].[SecurityId]
		FROM [Security].[UserRole]
		INNER JOIN [Security].[Role] ON UserRole.RoleID = [Role].RoleID
		WHERE UserRole.UserID = @userID
		)
		,AllRResourceId
	AS (
		SELECT r.Name
			,ap.PermissionId
			,ap.[Deny]
			,acl.IsOwner
		FROM AllSecurityId asi	 
		INNER JOIN [Security].AccessControlList acl ON asi.SecurityId = acl.SecurityId
		INNER JOIN [Security].AccessPermission ap ON acl.AccessControlListId  = ap.AccessControlListId
		INNER JOIN [Security].[Resource] r ON acl.ResourceId = r.ResourceId
		)
	SELECT DISTINCT [Name] AS ResourceName
		,PermissionId AS PermissionId
	FROM AllRResourceId
	WHERE [Deny] = 0;
END;



GO
/****** Object:  StoredProcedure [Security].[spGetUserResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[spGetUserResourcePermission]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[spGetUserResourcePermission] AS' 
END
GO

-- =============================================
ALTER PROCEDURE [Security].[spGetUserResourcePermission] (@SIDList [Security].SecurityIdList READONLY)
AS
BEGIN
	SET NOCOUNT ON;

	WITH PERM (RID, PermissionId, DenyId, AllowId)
	AS (
		SELECT apadj.ResourceId
			,apadj.PermissionId
			,ISNULL(COUNT(SD.SecurityId), 0) DenyID
			,ISNULL(COUNT(AllowedSecurityId), 0) AllowId
		FROM [Security].AccessPermissionAllowDenyJoin apadj
		INNER JOIN @SIDList SA ON apadj.AllowedSecurityId = SA.SecurityId
		LEFT OUTER JOIN @SIDList SD ON apadj.DeniedSecurityId = SD.SecurityId
		GROUP BY apadj.ResourceId
			,apadj.PermissionId
		)

	SELECT r.[Name] AS ResourceName
		,PM.PermissionId
	FROM PERM PM
	INNER JOIN [Security].[Resource] r WITH (NOLOCK) ON PM.RID = r.ResourceId
	WHERE PM.DenyID = 0
		AND PM.AllowId > 0
END


GO
/****** Object:  StoredProcedure [Security].[spGrantPermission]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[spGrantPermission]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[spGrantPermission] AS' 
END
GO
/***************************************************************************************************
*
* Created By: Arunkumar K
* Created Date: 04/27/2016
* Notes/Description: This will grant permission to the specified resource
*
* Example Usage: EXEC Config.spGrantPermission '<RID GUID>', '<SID GUID>', -3
*
* Updated By:
* Updated Date:
* Notes: <Repeat this section for every update>
* 
***************************************************************************************************/
ALTER PROCEDURE [Security].[spGrantPermission]
	@resourceId UNIQUEIDENTIFIER,
	@securityId UNIQUEIDENTIFIER,
	@permissionId INT,
	@isOwner BIT = 0
AS

SET NOCOUNT ON

BEGIN TRANSACTION 

BEGIN TRY

	DECLARE			
		@rowsAffected INT = 2,
		@SIDList [Security].SecurityIdList

    INSERT INTO @SIDList VALUES (@securityId)

	-- Check to see if the user already has the permission before trying to add it again
	IF Config.fnCheckAuthorization(@resourceId, @SIDList, @permissionId) = 0
	BEGIN
		INSERT INTO [Security].AccessControlList (ResourceId, SecurityId, IsOwner) VALUES (@resourceId, @securityId, @isOwner)
		SET @rowsAffected = @@ROWCOUNT
		INSERT INTO [Security].AccessPermission (AccessControlListId, PermissionId, [Deny]) VALUES (SCOPE_IDENTITY(), @permissionId, 0)
		SET @rowsAffected = @rowsAffected + @@ROWCOUNT
	END

	-- Check for logical business errors here
	IF @rowsAffected <> 2
		RAISERROR (50017, 11, 1, 'Config.spGrantPermission')
END TRY

BEGIN CATCH
	-- Error handling here
	DECLARE @errNumber int, @errSeverity int, @errState int, @errProcedure varchar(500), @errLine int, @errMmessage varchar(500)
	SELECT @errNumber = ERROR_NUMBER(), @errSeverity = ERROR_SEVERITY(), @errState = ERROR_STATE(), @errProcedure = ERROR_PROCEDURE(), @errLine = ERROR_LINE(), @errMmessage = ERROR_MESSAGE()

	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION 
	THROW
END CATCH

IF @@TRANCOUNT > 0 COMMIT TRANSACTION 



GO
/****** Object:  StoredProcedure [Security].[spRevokePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[spRevokePermission]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[spRevokePermission] AS' 
END
GO
/***************************************************************************************************
*
* Created By: Arunkumar K
* Created Date: 04/27/2016
* Notes/Description: This will revoke the permission for a resource (ResourceId) from the user or group
* represented by the specified securityId
*
* Example Usage: EXEC [Security].[spRevokePermission] '<resourceId GUId>', '<securityId GUId>', -3
* 
* Updated By:
* Updated Date:
* Notes: <Repeat this section for every update>
* 
***************************************************************************************************/
ALTER PROCEDURE [Security].[spRevokePermission]
	@resourceId UNIQUEIdENTIFIER,
	@securityId UNIQUEIdENTIFIER,
	@permissionId INT
AS

SET NOCOUNT ON

BEGIN TRANSACTION 

BEGIN TRY

	DECLARE	
		@rowsAffected INT = 2,
		@accessControlListId INT,
		@securityIdList [Security].SecurityIdList

    INSERT INTO @securityIdList VALUES (@securityId)

	-- Check to see if the user already has the permission before trying to revoke it
	IF Config.fnCheckAuthorization(@resourceId, @securityIdList, @permissionId) = 1
	BEGIN
		SET @AccessControlListId = (SELECT A.AccessControlListId FROM [Security].AccessControlList A INNER JOIN [Security].AccessPermission B ON B.AccessControlListId = A.AccessControlListId WHERE A.ResourceId = @resourceId AND A.SecurityId = @securityId AND B.PermissionId = @permissionId)

		DELETE [Security].AccessPermission WHERE AccessControlListId = @accessControlListId AND PermissionId = @permissionId
		SET @rowsAffected = @@ROWCOUNT
		DELETE [Security].AccessControlList WHERE AccessControlListId = @accessControlListId
		SET @rowsAffected = @rowsAffected + @@ROWCOUNT
	END

	-- Check for logical business errors here
	IF @rowsAffected <> 2
		RAISERROR (50017, 11, 1, 'Config.spRevokePermission')
END TRY

BEGIN CATCH
	-- Error handling here
	DECLARE @errNumber int, @errSeverity int, @errState int, @errProcedure varchar(500), @errLine int, @errMmessage varchar(500)
	SELECT @errNumber = ERROR_NUMBER(), @errSeverity = ERROR_SEVERITY(), @errState = ERROR_STATE(), @errProcedure = ERROR_PROCEDURE(), @errLine = ERROR_LINE(), @errMmessage = ERROR_MESSAGE()

	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION 

	THROW
END CATCH

IF @@TRANCOUNT > 0 COMMIT TRANSACTION 




GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Security', N'TABLE',N'AccessControlList', N'COLUMN',N'SecurityId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Either User.SecurityId or Role.SecurityId.' , @level0type=N'SCHEMA',@level0name=N'Security', @level1type=N'TABLE',@level1name=N'AccessControlList', @level2type=N'COLUMN',@level2name=N'SecurityId'
GO
