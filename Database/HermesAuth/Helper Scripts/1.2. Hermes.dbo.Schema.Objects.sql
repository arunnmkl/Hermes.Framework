USE [Auth]
GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Security', N'TABLE',N'AccessControlList', N'COLUMN',N'SecurityId'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'Security', @level1type=N'TABLE',@level1name=N'AccessControlList', @level2type=N'COLUMN',@level2name=N'SecurityId'

GO
/****** Object:  StoredProcedure [dbo].[spRevokePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRevokePermission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spRevokePermission]
GO
/****** Object:  StoredProcedure [dbo].[spGrantPermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGrantPermission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spGrantPermission]
GO
/****** Object:  StoredProcedure [dbo].[spGetUserResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetUserResourcePermission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spGetUserResourcePermission]
GO
/****** Object:  StoredProcedure [dbo].[spGetUserPermissions]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetUserPermissions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spGetUserPermissions]
GO
/****** Object:  StoredProcedure [dbo].[SetTokenExpires]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetTokenExpires]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetTokenExpires]
GO
/****** Object:  StoredProcedure [dbo].[SaveUserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveUserAuthToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SaveUserAuthToken]
GO
/****** Object:  StoredProcedure [dbo].[RoleExists]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleExists]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RoleExists]
GO
/****** Object:  StoredProcedure [dbo].[RemoveRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveRefreshToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RemoveRefreshToken]
GO
/****** Object:  StoredProcedure [dbo].[ListSecurityRolesByUserName]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListSecurityRolesByUserName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ListSecurityRolesByUserName]
GO
/****** Object:  StoredProcedure [dbo].[GetUserAuthTokenId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserAuthTokenId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserAuthTokenId]
GO
/****** Object:  StoredProcedure [dbo].[GetUserAuthTokenById]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserAuthTokenById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserAuthTokenById]
GO
/****** Object:  StoredProcedure [dbo].[GetUserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserAuthToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserAuthToken]
GO
/****** Object:  StoredProcedure [dbo].[GetAuthenticatedUser]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAuthenticatedUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAuthenticatedUser]
GO
/****** Object:  StoredProcedure [dbo].[GetAllRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAllRefreshToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAllRefreshToken]
GO
/****** Object:  StoredProcedure [dbo].[GenerateUserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GenerateUserAuthToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GenerateUserAuthToken]
GO
/****** Object:  StoredProcedure [dbo].[FindRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindRefreshToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FindRefreshToken]
GO
/****** Object:  StoredProcedure [dbo].[FindLoginProvider]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindLoginProvider]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FindLoginProvider]
GO
/****** Object:  StoredProcedure [dbo].[FindAuthClientById]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindAuthClientById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FindAuthClientById]
GO
/****** Object:  StoredProcedure [dbo].[CheckAuthorization]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckAuthorization]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckAuthorization]
GO
/****** Object:  StoredProcedure [dbo].[AuthenticateUsernamePassword]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuthenticateUsernamePassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AuthenticateUsernamePassword]
GO
/****** Object:  StoredProcedure [dbo].[AddUserToRoleByName]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddUserToRoleByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddUserToRoleByName]
GO
/****** Object:  StoredProcedure [dbo].[AddRefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddRefreshToken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddRefreshToken]
GO
/****** Object:  StoredProcedure [dbo].[AddNewUserLoginProvider]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddNewUserLoginProvider]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddNewUserLoginProvider]
GO
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddNewUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddNewUser]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_Role]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserLoginProvider_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserLoginProvider]'))
ALTER TABLE [dbo].[UserLoginProvider] DROP CONSTRAINT [FK_UserLoginProvider_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserAuthToken_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserAuthToken]'))
ALTER TABLE [dbo].[UserAuthToken] DROP CONSTRAINT [FK_UserAuthToken_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Role_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Role]'))
ALTER TABLE [dbo].[Role] DROP CONSTRAINT [FK_Role_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ResourcePermission_Resource]') AND parent_object_id = OBJECT_ID(N'[dbo].[ResourcePermission]'))
ALTER TABLE [dbo].[ResourcePermission] DROP CONSTRAINT [FK_ResourcePermission_Resource]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ResourcePermission_Permission]') AND parent_object_id = OBJECT_ID(N'[dbo].[ResourcePermission]'))
ALTER TABLE [dbo].[ResourcePermission] DROP CONSTRAINT [FK_ResourcePermission_Permission]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RefreshToken_AuthClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[RefreshToken]'))
ALTER TABLE [dbo].[RefreshToken] DROP CONSTRAINT [FK_RefreshToken_AuthClient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccessPermission_Permission]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccessPermission]'))
ALTER TABLE [dbo].[AccessPermission] DROP CONSTRAINT [FK_AccessPermission_Permission]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccessPermission_AccessControlList]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccessPermission]'))
ALTER TABLE [dbo].[AccessPermission] DROP CONSTRAINT [FK_AccessPermission_AccessControlList]
GO
/****** Object:  Index [IX_AccessPermissionJoin_SecurityIdPermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionJoin]') AND name = N'IX_AccessPermissionJoin_SecurityIdPermission')
DROP INDEX [IX_AccessPermissionJoin_SecurityIdPermission] ON [dbo].[AccessPermissionJoin]
GO
/****** Object:  Index [IX_AccessPermissionJoin_PermissionResourceId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionJoin]') AND name = N'IX_AccessPermissionJoin_PermissionResourceId')
DROP INDEX [IX_AccessPermissionJoin_PermissionResourceId] ON [dbo].[AccessPermissionJoin]
GO
/****** Object:  Index [IX_AccessPermission_ResourceIdDeny]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionJoin]') AND name = N'IX_AccessPermission_ResourceIdDeny')
DROP INDEX [IX_AccessPermission_ResourceIdDeny] ON [dbo].[AccessPermissionJoin]
GO
/****** Object:  Index [IX_User]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND name = N'IX_User')
DROP INDEX [IX_User] ON [dbo].[User]
GO
/****** Object:  Index [IX_ResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ResourcePermission]') AND name = N'IX_ResourcePermission')
DROP INDEX [IX_ResourcePermission] ON [dbo].[ResourcePermission]
GO
/****** Object:  Index [IX_AccessControlList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessControlList]') AND name = N'IX_AccessControlList')
DROP INDEX [IX_AccessControlList] ON [dbo].[AccessControlList]
GO
/****** Object:  View [dbo].[ResourceAccess]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ResourceAccess]'))
DROP VIEW [dbo].[ResourceAccess]
GO
/****** Object:  UserDefinedFunction [dbo].[GetResourceOwner]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetResourceOwner]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetResourceOwner]
GO
/****** Object:  Index [PK_ResourceOwnerUser]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ResourceOwnerUser]') AND name = N'PK_ResourceOwnerUser')
DROP INDEX [PK_ResourceOwnerUser] ON [dbo].[ResourceOwnerUser] WITH ( ONLINE = OFF )
GO
/****** Object:  View [dbo].[ResourceOwnerUser]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ResourceOwnerUser]'))
DROP VIEW [dbo].[ResourceOwnerUser]
GO
/****** Object:  Index [PK_ResourceOwnerRole]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ResourceOwnerRole]') AND name = N'PK_ResourceOwnerRole')
DROP INDEX [PK_ResourceOwnerRole] ON [dbo].[ResourceOwnerRole] WITH ( ONLINE = OFF )
GO
/****** Object:  View [dbo].[ResourceOwnerRole]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ResourceOwnerRole]'))
DROP VIEW [dbo].[ResourceOwnerRole]
GO
/****** Object:  UserDefinedFunction [dbo].[GetUserSecurityIdRelatedSecurityIds]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserSecurityIdRelatedSecurityIds]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetUserSecurityIdRelatedSecurityIds]
GO
/****** Object:  Index [IX_UserRoleSecurityId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSecurityId]') AND name = N'IX_UserRoleSecurityId')
DROP INDEX [IX_UserRoleSecurityId] ON [dbo].[UserRoleSecurityId] WITH ( ONLINE = OFF )
GO
/****** Object:  View [dbo].[UserRoleSecurityId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSecurityId]'))
DROP VIEW [dbo].[UserRoleSecurityId]
GO
/****** Object:  UserDefinedFunction [dbo].[GetResourceAccess]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetResourceAccess]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetResourceAccess]
GO
/****** Object:  View [dbo].[AccessPermissionAllowDenyJoin]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionAllowDenyJoin]'))
DROP VIEW [dbo].[AccessPermissionAllowDenyJoin]
GO
/****** Object:  Index [PK_AccessPermissionJoin]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionJoin]') AND name = N'PK_AccessPermissionJoin')
DROP INDEX [PK_AccessPermissionJoin] ON [dbo].[AccessPermissionJoin] WITH ( ONLINE = OFF )
GO
/****** Object:  View [dbo].[AccessPermissionJoin]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermissionJoin]'))
DROP VIEW [dbo].[AccessPermissionJoin]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
DROP TABLE [dbo].[UserRole]
GO
/****** Object:  Table [dbo].[UserLoginProvider]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserLoginProvider]') AND type in (N'U'))
DROP TABLE [dbo].[UserLoginProvider]
GO
/****** Object:  Table [dbo].[UserAuthToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthToken]') AND type in (N'U'))
DROP TABLE [dbo].[UserAuthToken]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[ResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ResourcePermission]') AND type in (N'U'))
DROP TABLE [dbo].[ResourcePermission]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resource]') AND type in (N'U'))
DROP TABLE [dbo].[Resource]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RefreshToken]') AND type in (N'U'))
DROP TABLE [dbo].[RefreshToken]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permission]') AND type in (N'U'))
DROP TABLE [dbo].[Permission]
GO
/****** Object:  Table [dbo].[AuthClient]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuthClient]') AND type in (N'U'))
DROP TABLE [dbo].[AuthClient]
GO
/****** Object:  Table [dbo].[AccessPermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccessPermission]') AND type in (N'U'))
DROP TABLE [dbo].[AccessPermission]
GO
/****** Object:  Table [dbo].[AccessControlList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccessControlList]') AND type in (N'U'))
DROP TABLE [dbo].[AccessControlList]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCheckAuthorization]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnCheckAuthorization]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnCheckAuthorization]
GO
/****** Object:  UserDefinedTableType [dbo].[SecurityIdList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'SecurityIdList' AND ss.name = N'dbo')
DROP TYPE [dbo].[SecurityIdList]
GO