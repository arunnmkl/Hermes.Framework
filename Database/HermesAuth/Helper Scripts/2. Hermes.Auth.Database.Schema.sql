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
/****** Object:  StoredProcedure [Security].[GetRoleDetailsById]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetRoleDetailsById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[GetRoleDetailsById]
GO
/****** Object:  StoredProcedure [Security].[GetResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetResourcePermission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[GetResourcePermission]
GO
/****** Object:  StoredProcedure [Security].[GetResourceAsParentChild]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetResourceAsParentChild]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[GetResourceAsParentChild]
GO
/****** Object:  StoredProcedure [Security].[GetHierarchyResourceByParentId]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetHierarchyResourceByParentId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[GetHierarchyResourceByParentId]
GO
/****** Object:  StoredProcedure [Security].[GetAuthenticatedUser]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetAuthenticatedUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[GetAuthenticatedUser]
GO
/****** Object:  StoredProcedure [Security].[GetAllRolePaged]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetAllRolePaged]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[GetAllRolePaged]
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
/****** Object:  StoredProcedure [Security].[DeleteRoleById]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[DeleteRoleById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[DeleteRoleById]
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
/****** Object:  StoredProcedure [Security].[AddUpdateRole]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AddUpdateRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Security].[AddUpdateRole]
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
/****** Object:  StoredProcedure [chat].[spInsertChatHistory]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[chat].[spInsertChatHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [chat].[spInsertChatHistory]
GO
/****** Object:  StoredProcedure [chat].[spGetChatHistory]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[chat].[spGetChatHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [chat].[spGetChatHistory]
GO
/****** Object:  StoredProcedure [chat].[spGetAssociatedUsers]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[chat].[spGetAssociatedUsers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [chat].[spGetAssociatedUsers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserRole_User]') AND parent_object_id = OBJECT_ID(N'[Security].[UserRole]'))
ALTER TABLE [Security].[UserRole] DROP CONSTRAINT [FK_UserRole_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserRole_Role]') AND parent_object_id = OBJECT_ID(N'[Security].[UserRole]'))
ALTER TABLE [Security].[UserRole] DROP CONSTRAINT [FK_UserRole_Role]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserPassword_User]') AND parent_object_id = OBJECT_ID(N'[Security].[UserPassword]'))
ALTER TABLE [Security].[UserPassword] DROP CONSTRAINT [FK_UserPassword_User]
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
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ResourceHierarchy_Resource_RId]') AND parent_object_id = OBJECT_ID(N'[Security].[ResourceHierarchy]'))
ALTER TABLE [Security].[ResourceHierarchy] DROP CONSTRAINT [FK_ResourceHierarchy_Resource_RId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ResourceHierarchy_Resource_ParentRId]') AND parent_object_id = OBJECT_ID(N'[Security].[ResourceHierarchy]'))
ALTER TABLE [Security].[ResourceHierarchy] DROP CONSTRAINT [FK_ResourceHierarchy_Resource_ParentRId]
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
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Security].[DF_UserAuthToken_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [Security].[UserAuthToken] DROP CONSTRAINT [DF_UserAuthToken_UpdatedDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Security].[DF_UserAuthToken_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [Security].[UserAuthToken] DROP CONSTRAINT [DF_UserAuthToken_CreatedDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Security].[DF_UserAuthToken_IsLoggedIn]') AND type = 'D')
BEGIN
ALTER TABLE [Security].[UserAuthToken] DROP CONSTRAINT [DF_UserAuthToken_IsLoggedIn]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Security].[DF_UserAuthToken_UserAuthTokenId]') AND type = 'D')
BEGIN
ALTER TABLE [Security].[UserAuthToken] DROP CONSTRAINT [DF_UserAuthToken_UserAuthTokenId]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Security].[DF_ResourceHierarchy_SkipHierarchy]') AND type = 'D')
BEGIN
ALTER TABLE [Security].[ResourceHierarchy] DROP CONSTRAINT [DF_ResourceHierarchy_SkipHierarchy]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[chat].[DF_History_DateStamp]') AND type = 'D')
BEGIN
ALTER TABLE [chat].[History] DROP CONSTRAINT [DF_History_DateStamp]
END

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
/****** Object:  Index [IX_Role]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[Role]') AND name = N'IX_Role')
DROP INDEX [IX_Role] ON [Security].[Role]
GO
/****** Object:  Index [IX_ResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[ResourcePermission]') AND name = N'IX_ResourcePermission')
DROP INDEX [IX_ResourcePermission] ON [Security].[ResourcePermission]
GO
/****** Object:  Index [IX_ResourceHierarchy]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[ResourceHierarchy]') AND name = N'IX_ResourceHierarchy')
DROP INDEX [IX_ResourceHierarchy] ON [Security].[ResourceHierarchy]
GO
/****** Object:  Index [IX_AccessControlList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[AccessControlList]') AND name = N'IX_AccessControlList')
DROP INDEX [IX_AccessControlList] ON [Security].[AccessControlList]
GO
/****** Object:  Index [IX_History_DateTime]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[chat].[History]') AND name = N'IX_History_DateTime')
DROP INDEX [IX_History_DateTime] ON [chat].[History]
GO
/****** Object:  View [Security].[RoleUserCount]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Security].[RoleUserCount]'))
DROP VIEW [Security].[RoleUserCount]
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
/****** Object:  Table [Security].[UserPassword]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[UserPassword]') AND type in (N'U'))
DROP TABLE [Security].[UserPassword]
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
/****** Object:  Table [Security].[ResourceHierarchy]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[ResourceHierarchy]') AND type in (N'U'))
DROP TABLE [Security].[ResourceHierarchy]
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
/****** Object:  Table [chat].[History]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[chat].[History]') AND type in (N'U'))
DROP TABLE [chat].[History]
GO
/****** Object:  UserDefinedFunction [Security].[fnCheckAuthorization]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[fnCheckAuthorization]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Security].[fnCheckAuthorization]
GO
/****** Object:  UserDefinedTableType [Security].[SecurityIdList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'SecurityIdList' AND ss.name = N'Security')
DROP TYPE [Security].[SecurityIdList]
GO
/****** Object:  UserDefinedTableType [Security].[Ids]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'Ids' AND ss.name = N'Security')
DROP TYPE [Security].[Ids]
GO
/****** Object:  Schema [Security]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Security')
DROP SCHEMA [Security]
GO
/****** Object:  Schema [chat]    Script Date: 5/6/2016 12:51:44 PM ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'chat')
DROP SCHEMA [chat]
GO
/****** Object:  Schema [chat]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'chat')
EXEC sys.sp_executesql N'CREATE SCHEMA [chat]'

GO
/****** Object:  Schema [Security]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Security')
EXEC sys.sp_executesql N'CREATE SCHEMA [Security]'

GO
/****** Object:  UserDefinedTableType [Security].[Ids]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'Ids' AND ss.name = N'Security')
CREATE TYPE [Security].[Ids] AS TABLE(
	[Id] [bigint] NOT NULL
)
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
/****** Object:  Table [chat].[History]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[chat].[History]') AND type in (N'U'))
BEGIN
CREATE TABLE [chat].[History](
	[HistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[To] [varchar](100) NOT NULL,
	[From] [varchar](100) NOT NULL,
	[DateTimestamp] [datetimeoffset](0) NOT NULL,
	[Message] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
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
	[ResourceIdentifier] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Resource] UNIQUE NONCLUSTERED 
(
	[ResourceIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[ResourceHierarchy]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[ResourceHierarchy]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[ResourceHierarchy](
	[ResourceHierarchyId] [bigint] IDENTITY(1,1) NOT NULL,
	[ResourceIdentifier] [bigint] NOT NULL,
	[ParentResourceIdentifier] [bigint] NOT NULL,
	[SkipHierarchy] [bit] NOT NULL,
 CONSTRAINT [PK_ResourceHierarchy] PRIMARY KEY CLUSTERED 
(
	[ResourceHierarchyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Security].[ResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[ResourcePermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[ResourcePermission](
	[ResourcePermissionId] [bigint] IDENTITY(1,1) NOT NULL,
	[ResourceId] [uniqueidentifier] NOT NULL,
	[PermissionId] [int] NOT NULL,
	[Deny] [bit] NOT NULL CONSTRAINT [DF_ResourcePermission_Deny]  DEFAULT ((0)),
	[Created] [datetime] NOT NULL,
	[DisplayName] [varchar](50) NULL,
 CONSTRAINT [PK_ResourcePermission] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
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
	[UserAuthTokenId] [varchar](36) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[AuthClientId] [varchar](128) NULL,
	[IssuedUtc] [datetime] NOT NULL,
	[ExpiresUtc] [datetime] NOT NULL,
	[AccessToken] [varchar](8000) NULL,
	[IsLoggedIn] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[IsExpired]  AS (CONVERT([bit],case when [ExpiresUtc]<getutcdate() OR [IsLoggedIn]=(0) then (1) else (0) end,(0))),
	[IPAddress] [varchar](15) NOT NULL,
	[UserAgent] [varchar](500) NULL,
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
/****** Object:  Table [Security].[UserPassword]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[UserPassword]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[UserPassword](
	[UserId] [bigint] NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedDatetime] [datetime] NOT NULL CONSTRAINT [DF_UserPassword_UpdatedDatetime]  DEFAULT (getdate()),
	[UpdatedTimestamp] [timestamp] NOT NULL,
 CONSTRAINT [IX_UserPassword] UNIQUE NONCLUSTERED 
(
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
          INNER JOIN [Security].[Role] R ON UR.RoleId = R.RoleId
	Where R.IsActive = 1;






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
           ''User Role'' AS SecurityIdType
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
SELECT ACL.ResourceId
	,R.RoleId
	,R.SecurityId
	,R.NAME
FROM [Security].AccessControlList ACL
INNER JOIN [Security].[Role] R ON ACL.SecurityId = R.SecurityId
WHERE ACL.IsOwner = 1
	AND R.IsActive = 1
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
/****** Object:  View [Security].[RoleUserCount]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Security].[RoleUserCount]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [Security].[RoleUserCount]
AS
WITH CTE_UserRoleCount (
	RoleId
	,UserCount
	)
AS (
	SELECT RoleId
		,COUNT(RoleId) AS RoleCount
	FROM [Security].[UserRole]
	GROUP BY RoleId
	)
SELECT R.RoleId
	,R.SecurityId
	,R.[Name] AS RoleName
	,ISNULL(URC.UserCount, 0) AS UserCount
	,R.[Description]
	,R.IsActive AS [Status]
	,U.Username AS ModifiedBy
FROM [Security].[Role] AS R
INNER JOIN [Security].[User] AS U ON R.UpdatedBy = U.UserId
LEFT JOIN CTE_UserRoleCount AS URC ON R.RoleId = URC.RoleId


' 
GO
/****** Object:  Index [IX_History_DateTime]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[chat].[History]') AND name = N'IX_History_DateTime')
CREATE NONCLUSTERED INDEX [IX_History_DateTime] ON [chat].[History]
(
	[DateTimestamp] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccessControlList]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[AccessControlList]') AND name = N'IX_AccessControlList')
CREATE UNIQUE NONCLUSTERED INDEX [IX_AccessControlList] ON [Security].[AccessControlList]
(
	[ResourceId] ASC,
	[SecurityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ResourceHierarchy]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[ResourceHierarchy]') AND name = N'IX_ResourceHierarchy')
CREATE UNIQUE NONCLUSTERED INDEX [IX_ResourceHierarchy] ON [Security].[ResourceHierarchy]
(
	[ResourceHierarchyId] ASC,
	[ParentResourceIdentifier] ASC
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
/****** Object:  Index [IX_Role]    Script Date: 5/6/2016 12:51:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Security].[Role]') AND name = N'IX_Role')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Role] ON [Security].[Role]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[chat].[DF_History_DateStamp]') AND type = 'D')
BEGIN
ALTER TABLE [chat].[History] ADD  CONSTRAINT [DF_History_DateStamp]  DEFAULT (getutcdate()) FOR [DateTimestamp]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Security].[DF_ResourceHierarchy_SkipHierarchy]') AND type = 'D')
BEGIN
ALTER TABLE [Security].[ResourceHierarchy] ADD  CONSTRAINT [DF_ResourceHierarchy_SkipHierarchy]  DEFAULT ((0)) FOR [SkipHierarchy]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Security].[DF_UserAuthToken_UserAuthTokenId]') AND type = 'D')
BEGIN
ALTER TABLE [Security].[UserAuthToken] ADD  CONSTRAINT [DF_UserAuthToken_UserAuthTokenId]  DEFAULT (replace(CONVERT([varchar](36),newid(),(0)),'-','')) FOR [UserAuthTokenId]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Security].[DF_UserAuthToken_IsLoggedIn]') AND type = 'D')
BEGIN
ALTER TABLE [Security].[UserAuthToken] ADD  CONSTRAINT [DF_UserAuthToken_IsLoggedIn]  DEFAULT ((0)) FOR [IsLoggedIn]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Security].[DF_UserAuthToken_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [Security].[UserAuthToken] ADD  CONSTRAINT [DF_UserAuthToken_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Security].[DF_UserAuthToken_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [Security].[UserAuthToken] ADD  CONSTRAINT [DF_UserAuthToken_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
END

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
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ResourceHierarchy_Resource_ParentRId]') AND parent_object_id = OBJECT_ID(N'[Security].[ResourceHierarchy]'))
ALTER TABLE [Security].[ResourceHierarchy]  WITH CHECK ADD  CONSTRAINT [FK_ResourceHierarchy_Resource_ParentRId] FOREIGN KEY([ParentResourceIdentifier])
REFERENCES [Security].[Resource] ([ResourceIdentifier])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ResourceHierarchy_Resource_ParentRId]') AND parent_object_id = OBJECT_ID(N'[Security].[ResourceHierarchy]'))
ALTER TABLE [Security].[ResourceHierarchy] CHECK CONSTRAINT [FK_ResourceHierarchy_Resource_ParentRId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ResourceHierarchy_Resource_RId]') AND parent_object_id = OBJECT_ID(N'[Security].[ResourceHierarchy]'))
ALTER TABLE [Security].[ResourceHierarchy]  WITH CHECK ADD  CONSTRAINT [FK_ResourceHierarchy_Resource_RId] FOREIGN KEY([ResourceIdentifier])
REFERENCES [Security].[Resource] ([ResourceIdentifier])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ResourceHierarchy_Resource_RId]') AND parent_object_id = OBJECT_ID(N'[Security].[ResourceHierarchy]'))
ALTER TABLE [Security].[ResourceHierarchy] CHECK CONSTRAINT [FK_ResourceHierarchy_Resource_RId]
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
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserPassword_User]') AND parent_object_id = OBJECT_ID(N'[Security].[UserPassword]'))
ALTER TABLE [Security].[UserPassword]  WITH CHECK ADD  CONSTRAINT [FK_UserPassword_User] FOREIGN KEY([UserId])
REFERENCES [Security].[User] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserPassword_User]') AND parent_object_id = OBJECT_ID(N'[Security].[UserPassword]'))
ALTER TABLE [Security].[UserPassword] CHECK CONSTRAINT [FK_UserPassword_User]
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
/****** Object:  StoredProcedure [chat].[spGetAssociatedUsers]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[chat].[spGetAssociatedUsers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [chat].[spGetAssociatedUsers] AS' 
END
GO

-- =============================================
-- Author:		Arunkumar K
-- Create date: 03 July 2016
-- Description:	To get the chat accosiated user info.
-- =============================================
ALTER PROCEDURE [chat].[spGetAssociatedUsers]
	-- Add the parameters for the stored procedure here
	@userSecurityId UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	SELECT u.SecurityId
		,u.Username
		,r.[Name] AS GroupName
	FROM [Security].GetUserSecurityIdRelatedSecurityIds(@userSecurityId) usid
	INNER JOIN [Security].[Role] r ON r.SecurityId = usid.SecurityId
	INNER JOIN [Security].[UserRole] ur ON ur.RoleId = r.RoleId
	INNER JOIN [Security].[User] u ON u.UserId = ur.UserId
	WHERE usid.SecurityIdType = 'User Role'
	And u.SecurityId <> @userSecurityId
END

GO
/****** Object:  StoredProcedure [chat].[spGetChatHistory]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[chat].[spGetChatHistory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [chat].[spGetChatHistory] AS' 
END
GO

-- =============================================      
-- Author:  Arunkumar K  
-- Create date: 02-07-2016      
-- Description: To get chat history with search text
-- =============================================      
ALTER PROCEDURE [chat].[spGetChatHistory] (
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
/****** Object:  StoredProcedure [chat].[spInsertChatHistory]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[chat].[spInsertChatHistory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [chat].[spInsertChatHistory] AS' 
END
GO

-- =============================================  
-- Author:  Arunkumar K
-- Create date: 02 July, 2016  
-- Description: Inserts chat history details in respective table.  
-- =============================================  
ALTER PROCEDURE [chat].[spInsertChatHistory] @From [varchar] (100)
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
		DECLARE @SecurityId UNIQUEIDENTIFIER = NEWID()
			,@UserId BIGINT;

		INSERT INTO [Security].[User] (
			[SecurityId]
			,[Username]
			,[EmailAddress]
			,[Enabled]
			,[Created]
			)
		VALUES (
			@SecurityId
			,@UserName
			,@EmailAddress
			,@Enabled
			,GETDATE()
			);

		SET @UserId = (
				SELECT CAST(SCOPE_IDENTITY() AS BIGINT) AS UserId
				)

		INSERT INTO [Security].[UserPassword] (
			UserId
			,[Password]
			,UpdatedBy
			)
		VALUES (
			@UserId
			,@Password
			,@UserId
			)

		SELECT @UserId UserId;
	END;
	ELSE
	BEGIN
		DECLARE @name VARCHAR(150) = @UserName;

		IF (ISNULL(@EmailAddress, '') <> '')
		BEGIN
			SET @name = (@name + ' / ' + @EmailAddress);
		END

		RAISERROR (
				45120
				,16
				,1
				,@name
				)
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
/****** Object:  StoredProcedure [Security].[AddUpdateRole]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[AddUpdateRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[AddUpdateRole] AS' 
END
GO

-- =============================================
-- Author: Parul
-- Create date: 7 June 2016
-- Description:	Procedure to add/update a role
-- DECLARE @rpIDList [Security].[Ids]
-- INSERT INTO @rpIDList values (1),(2),(3)
-- EXEC [Security].AddUpdateRole 'Service Super User', 'Service Super User Group', 1, 1, @rpIDList
-- =============================================
ALTER PROCEDURE [Security].[AddUpdateRole] (
	@name VARCHAR(50)
	,@description VARCHAR(150)
	,@isActive BIT
	,@logInUserId BIGINT
	,@rpIDList [Security].[Ids] READONLY
	)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @securityId UNIQUEIDENTIFIER;
	DECLARE @resourceIds TABLE (ResourceId UNIQUEIDENTIFIER);
	DECLARE @aclIds TABLE (AccessControlListId BIGINT);
	DECLARE @accessControlListId BIGINT;
	DECLARE @aclOutput TABLE (
		ACLOutputId INT IDENTITY(1, 1)
		,AccessControlListId BIGINT
		,ResourceId UNIQUEIDENTIFIER
		);

	INSERT INTO @resourceIds (ResourceId)
	SELECT rp.ResourceId
	FROM @rpIDList rpId
	INNER JOIN [Security].[ResourcePermission] rp ON rpId.Id = rp.ResourcePermissionId
	GROUP BY rp.ResourceId

	IF NOT EXISTS (
			SELECT TOP 1 1
			FROM [Security].[Role]
			WHERE NAME = @name
			)
		AND ISNULL(@name, '') <> ''
	BEGIN
		SET @securityId = NEWID();

		INSERT INTO [Security].[Role] (
			SecurityId
			,NAME
			,Description
			,IsActive
			,UpdatedBy
			)
		VALUES (
			@securityId
			,@name
			,@description
			,@isActive
			,@logInUserId
			)
	END
	ELSE
	BEGIN
		SET @securityId = (
				SELECT SecurityId
				FROM [Security].[Role]
				WHERE NAME = @name
				)

		UPDATE [Security].[Role]
		SET NAME = @name
			,Description = @description
			,IsActive = @isActive
			,UpdatedBy = @logInUserId
		WHERE SecurityId = @securityId
	END

	IF NOT EXISTS (
			SELECT TOP 1 1
			FROM [Security].[AccessControlList]
			WHERE SecurityId = @securityId
			)
	BEGIN
		INSERT INTO [Security].[AccessControlList] (
			ResourceId
			,SecurityId
			,IsOwner
			)
		OUTPUT INSERTED.AccessControlListId
		INTO @aclOutput(AccessControlListId)
		SELECT DISTINCT rp.ResourceId
			,@securityId
			,0
		FROM @resourceIds rid
		INNER JOIN [Security].ResourcePermission rp ON rp.ResourceId = rid.ResourceId
		LEFT JOIN [Security].AccessControlList acl ON acl.ResourceId = rp.ResourceId
			AND acl.SecurityId = @securityId

		SET @accessControlListId = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		SET @accessControlListId = (
				SELECT AccessControlListId
				FROM [Security].[AccessControlList]
				WHERE SecurityId = @securityId
				)
	END

	IF @@ROWCOUNT = 0
	BEGIN
		INSERT @aclOutput (
			AccessControlListId
			,ResourceId
			)
		SELECT acl.AccessControlListId
			,rid.ResourceId
		FROM @resourceIds rid
		INNER JOIN [Security].ResourcePermission rp ON rp.ResourceId = rid.ResourceId
		INNER JOIN [Security].AccessControlList acl ON acl.ResourceId = rp.ResourceId
			AND acl.SecurityId = @securityId
		ORDER BY rp.ResourcePermissionId ASC;
	END;

	WITH CTE
	AS (
		SELECT ResourceId
			,ROW_NUMBER() OVER (
				ORDER BY ResourceId ASC
				) AS ROW
		FROM @resourceIds
		)
	UPDATE M
	SET M.ResourceId = S.ResourceId
	FROM @aclOutput AS M
	INNER JOIN CTE AS S ON S.ROW = M.ACLOutputId

	DELETE
	FROM [Security].[AccessPermission]
	WHERE AccessControlListId = @accessControlListId

	INSERT INTO [Security].[AccessPermission] (
		AccessControlListId
		,PermissionId
		,[Deny]
		)
	SELECT ao.AccessControlListId
		,rp.PermissionId
		,rp.[Deny]
	FROM @aclOutput ao
	INNER JOIN [Security].ResourcePermission rp ON rp.ResourceId = ao.ResourceId
	INNER JOIN @rpIDList rpid ON rpid.Id = rp.ResourcePermissionId
	LEFT JOIN [Security].AccessPermission ap ON ap.PermissionId = rp.PermissionId
		AND ap.AccessControlListId = ao.AccessControlListId
	WHERE ap.AccessControlListId IS NULL

	SELECT @@ROWCOUNT
END



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

ALTER PROCEDURE [Security].[AuthenticateUsernamePassword] (
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
/****** Object:  StoredProcedure [Security].[DeleteRoleById]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[DeleteRoleById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[DeleteRoleById] AS' 
END
GO
-- =============================================
-- Author: Parul
-- Create date: 7 June 2016
-- Description:	Procedure to delete a role by id
-- EXEC [Security].DeleteRoleById 2
-- =============================================
ALTER PROCEDURE [Security].[DeleteRoleById] (@roleId BIGINT)
AS
BEGIN
	IF EXISTS (
			SELECT Top 1 1
			FROM [Security].[Role]
			WHERE RoleId = @roleID
			)
	BEGIN
		UPDATE [Security].[Role]
		SET IsActive = 0
		WHERE RoleId = @roleID
	END
END



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
			,IPAddress
			)
		VALUES (
			@authTokenReturn
			,@UserId
			,GETUTCDATE()
			,GETUTCDATE()
			,0
			,GETDATE()
			,GETDATE()
			,N''
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
/****** Object:  StoredProcedure [Security].[GetAllRolePaged]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetAllRolePaged]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[GetAllRolePaged] AS' 
END
GO

-- =============================================
-- Author: Parul
-- Create date: 07 June 2016
-- Description:	Get all the Roles records 
-- EXEC [Security].[GetAllRolePaged] 1,10,'','',''
-- =============================================
ALTER PROCEDURE [Security].[GetAllRolePaged] (
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

ALTER PROCEDURE [Security].[GetAuthenticatedUser] (@UserId BIGINT)
AS
BEGIN
	--DECLARE @GroupList TABLE (RoleId BIGINT, SecurityId UNIQUEIDENTIFIER, [Name] VARCHAR(50)); 
	DECLARE @username VARCHAR(50);

	SET @username = (
			SELECT [Username]
			FROM [Security].[User] u
			WHERE u.UserId = @userId
			);

	SELECT U.[UserId]
		,U.[SecurityId]
		,U.[Username]
		,CAST(UP.[UpdatedTimestamp] AS BIGINT) AS [PasswordTimestamp]
	FROM [Security].[User] AS U
	INNER JOIN [Security].[UserPassword] AS UP ON U.UserId = UP.UserId
	WHERE U.[UserId] = @UserId
		AND U.[Enabled] = 1;

	--INSERT INTO @GroupList (RoleId, SecurityId, [Name])
	SELECT DISTINCT r.RoleId
		,r.SecurityId
		,r.[Name]
	FROM [Security].[Role] AS r
	INNER JOIN [Security].UserRole AS ur ON ur.RoleId = r.RoleId
	INNER JOIN [Security].[User] AS u ON u.UserId = ur.UserId
	WHERE u.[UserId] = @UserId
		AND U.[Enabled] = 1;

	-- Login Provider
	SELECT ulp.[LoginProvider]
		,ulp.[ProviderKey]
		,ulp.[UserId]
	FROM [Security].[User] AS U
	INNER JOIN [Security].[UserLoginProvider] AS ulp ON ulp.UserId = U.UserId
	WHERE U.[UserId] = @UserId
		AND U.[Enabled] = 1;

	EXECUTE [Security].[GetUserAuthTokenId] @Username;
END;

GO
/****** Object:  StoredProcedure [Security].[GetHierarchyResourceByParentId]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetHierarchyResourceByParentId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[GetHierarchyResourceByParentId] AS' 
END
GO



-- =============================================
-- Author: Arunkumar K
-- Create date: 23 June 2016
-- Description:	Get the Resource and its permissions by ParentId
-- EXEC [Security].[GetHierarchyResourceByParentId] 0, 10023
-- =============================================
ALTER PROCEDURE [Security].[GetHierarchyResourceByParentId] (@parentId INT, @roleId BIGINT)
AS
BEGIN	

		DECLARE @ResourcePermission TABLE (
		Id BIGINT
		,Name VARCHAR(50)
		,ParentId INT
		,HasChild BIT
		,Checked BIT
		);

		 WITH CTE_Resource (
		Id
		,[Name]
		,ParentId
		,ResourceId
		,SkipHierarchy
		)
	AS (
		SELECT R.ResourceIdentifier * - 1 AS Row
			,[Name]
			,IIF(RH.ResourceHierarchyId IS NULL, 0, RH.ParentResourceIdentifier * - 1)
			,ResourceId
			,IIF(RH.ResourceHierarchyId IS NULL, 0, SkipHierarchy)
		FROM [Security].[Resource] AS R
		LEFT JOIN [Security].[ResourceHierarchy] RH ON RH.ResourceIdentifier = R.ResourceIdentifier
		WHERE R.IsActive = 1
		)
		,CTE_Permission (
		PermissionId
		,PermissionName
		,PermissionDisplayName
		)
	AS (
		SELECT P.PermissionId
			,P.[Name]
			,DisplayName = CASE 
				WHEN P.PermissionId = - 1
					THEN 'Add'
				WHEN p.PermissionId = - 2
					THEN 'View'
				WHEN p.PermissionId = - 3
					THEN 'Edit'
				WHEN p.PermissionId = - 4
					THEN 'Delete'
				END
		FROM [Security].[Permission] AS P
		)
	--Merge the parent and child data
	
		INSERT INTO @ResourcePermission (
			Id
			,Name
			,ParentId
			,HasChild
			,Checked
		)
		SELECT Id
			,[Name]
			,ParentId
			,HasChild
			,0
		FROM (
			SELECT Id
				,[Name]
				,ParentId
				,CAST(1 AS BIT) HasChild
			FROM CTE_Resource
			WHERE SkipHierarchy = 0
	
			UNION ALL
	
			SELECT RP.ResourcePermissionId
				,IIF(ISNULL(RP.DisplayName, '') = '', P.PermissionDisplayName, RP.DisplayName)
				,IIF(SkipHierarchy = 0, R.Id, R.ParentId)
				,CAST(0 AS BIT) HasChild
			FROM CTE_Resource AS R
			INNER JOIN [Security].[ResourcePermission] AS RP ON RP.ResourceId = R.ResourceId
			INNER JOIN CTE_Permission AS P ON P.PermissionId = Rp.PermissionId
			WHERE RP.[Deny] = 0
			) AS A
		WHERE a.ParentId = @parentId
		ORDER BY 1
			,3;

	IF @roleId > 0
	BEGIN
		UPDATE trp SET Checked = IIF(AP.[Deny] = 0, 1, 0)
		FROM @ResourcePermission trp
		INNER JOIN [Security].[ResourcePermission] RP ON trp.Id = RP.ResourcePermissionId
		INNER JOIN [Security].[AccessControlList] ACL ON RP.ResourceId = ACL.ResourceId
		Inner Join [Security].[Role] R ON ACL.SecurityId = R.SecurityId
		INNER JOIN [Security].[AccessPermission] AP ON AP.AccessControlListId = ACL.AccessControlListId AND  RP.PermissionId = AP.PermissionId
		WHERE R.RoleId = @roleId
	END

	SELECT Id
		,Name
		,ParentId
		,HasChild
		,Checked
	 FROM @ResourcePermission

END 

GO
/****** Object:  StoredProcedure [Security].[GetResourceAsParentChild]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetResourceAsParentChild]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[GetResourceAsParentChild] AS' 
END
GO

-- =============================================
-- Author: Arunkumar K
-- Create date: 09 June 2016
-- Description:	Get the Resource and its permission
-- EXEC [Security].[GetResourceAsParentChild]
-- =============================================
ALTER PROCEDURE [Security].[GetResourceAsParentChild]
AS
BEGIN	
	 WITH CTE_Resource(Id,
                  Name,
                  ParentId,
                  ResourceId)
     AS (SELECT ROW_NUMBER() OVER(ORDER BY ResourceId DESC) * -1 AS Row,
                Name,
                0,
                ResourceId
         FROM [Security].[Resource] AS R
         WHERE R.IsActive = 1),
     CTE_Permission(PermissionId,
                    PermissionName,
                    PermissionDisplayName)
     AS (SELECT P.PermissionId,
                P.NAME,
                DisplayName = CASE
                                  WHEN P.PermissionId = -1
                                  THEN 'Add'
                                  WHEN p.PermissionId = -2
                                  THEN 'View'
                                  WHEN p.PermissionId = -3
                                  THEN 'Edit'
                                  WHEN p.PermissionId = -4
                                  THEN 'Delete'
                              END
         FROM [Security].[Permission] AS P)

     --Merge the parent and child data
     SELECT Id,
            Name,
            ParentId
     FROM CTE_Resource
     UNION ALL
     SELECT RP.ResourcePermissionId,
            P.PermissionDisplayName,
            R.Id
     FROM CTE_Resource AS R
          INNER JOIN [Security].[ResourcePermission] AS RP ON RP.ResourceId = R.ResourceId
          INNER JOIN CTE_Permission AS P ON P.PermissionId = Rp.PermissionId
     ORDER BY 1,
              2;
END;



GO
/****** Object:  StoredProcedure [Security].[GetResourcePermission]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetResourcePermission]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[GetResourcePermission] AS' 
END
GO

-- =============================================
-- Author: Arunkumar K
-- Create date: 09 June 2016
-- Description:	Get the Resource and its permission
-- EXEC [Security].[GetResourcePermission]
-- =============================================
ALTER PROCEDURE [Security].[GetResourcePermission]
AS
BEGIN
	 WITH CTE_Permission(PermissionId , PermissionName , PermissionDisplayName)
	   AS (SELECT P.PermissionId , P.NAME , DisplayName = CASE
												    WHEN P.PermissionId = -1
												    THEN 'Add'
												    WHEN p.PermissionId = -2
												    THEN 'View'
												    WHEN p.PermissionId = -3
												    THEN 'Edit'
												    WHEN p.PermissionId = -4
												    THEN 'Delete'
												END
			 FROM [Security].[Permission] AS P)
	SELECT RP.ResourcePermissionId
		,R.NAME AS ResourceName
		,P.PermissionName
		,P.PermissionDisplayName
	FROM [Security].[Resource] AS R
	INNER JOIN [Security].[ResourcePermission] AS RP ON RP.ResourceId = R.ResourceId
	INNER JOIN CTE_Permission AS P ON P.PermissionId = Rp.PermissionId
	WHERE R.IsActive = 1
	ORDER BY 1;
END;



GO
/****** Object:  StoredProcedure [Security].[GetRoleDetailsById]    Script Date: 5/6/2016 12:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[GetRoleDetailsById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Security].[GetRoleDetailsById] AS' 
END
GO

-- =============================================
-- Author: Parul
-- Create date: 09 June 2016
-- Description:	Get the Role details by id 
-- EXEC [Security].[GetRoleDetailsById] 1
-- =============================================
ALTER PROCEDURE [Security].[GetRoleDetailsById] (@roleId INT)
AS
BEGIN
	SELECT R.[RoleId]
		,R.[Name]
		,R.[Description]
		,R.IsActive
		,R.UpdatedBy
		,AP.PermissionId
		,AP.[Deny]
		,RP.ResourcePermissionId
	FROM [Security].[Role] R
	INNER JOIN [Security].[AccessControlList] ACL ON ACL.SecurityId = R.SecurityId
	INNER JOIN [Security].[AccessPermission] AP ON AP.AccessControlListId = ACL.AccessControlListId
	INNER JOIN [Security].[ResourcePermission] RP ON RP.PermissionId = AP.PermissionId
		AND RP.ResourceId = ACL.ResourceId
	WHERE R.RoleId = @roleId
	   AND R.IsActive = 1
END



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
			,IPAddress
			)
		VALUES (
			@authTokenReturn
			,@UserId
			,GETUTCDATE()
			,GETUTCDATE()
			,0
			,GETDATE()
			,GETDATE()
			,N''
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
     WHERE U.Username = @UserName
	   AND R.IsActive = 1;




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
	,@IpAddress VARCHAR(15) = N''
	,@UserAgent VARCHAR(500) = NULL
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
			,IPAddress
			,UserAgent
			)
		VALUES (
			@UserId
			,@AuthClientId
			,@IssuedUtc
			,@ExpiresUtc
			,@AccessToken
			,GETDATE()
			,GETDATE()
			,@IpAddress
			,@UserAgent
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
			,IPAddress = @IpAddress
			,UserAgent = @UserAgent
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
		
		SELECT r.[SecurityId]
		FROM [Security].[UserRole] ur
		INNER JOIN [Security].[Role] r ON ur.RoleId = r.RoleId
		WHERE ur.UserID = @userID
		  AND r.IsActive = 1
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
* Example Usage: EXEC [Security].[spGrantPermission] '<RID GUID>', '<SID GUID>', -3
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
	IF [Security].fnCheckAuthorization(@resourceId, @SIDList, @permissionId) = 0
	BEGIN
		INSERT INTO [Security].AccessControlList (ResourceId, SecurityId, IsOwner) VALUES (@resourceId, @securityId, @isOwner)
		SET @rowsAffected = @@ROWCOUNT
		INSERT INTO [Security].AccessPermission (AccessControlListId, PermissionId, [Deny]) VALUES (SCOPE_IDENTITY(), @permissionId, 0)
		SET @rowsAffected = @rowsAffected + @@ROWCOUNT
	END

	-- Check for logical business errors here
	IF @rowsAffected <> 2
		RAISERROR (50017, 11, 1, '[Security].[spGrantPermission]')
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
	IF [Security].fnCheckAuthorization(@resourceId, @securityIdList, @permissionId) = 1
	BEGIN
		SET @AccessControlListId = (SELECT A.AccessControlListId FROM [Security].AccessControlList A INNER JOIN [Security].AccessPermission B ON B.AccessControlListId = A.AccessControlListId WHERE A.ResourceId = @resourceId AND A.SecurityId = @securityId AND B.PermissionId = @permissionId)

		DELETE [Security].AccessPermission WHERE AccessControlListId = @accessControlListId AND PermissionId = @permissionId
		SET @rowsAffected = @@ROWCOUNT
		DELETE [Security].AccessControlList WHERE AccessControlListId = @accessControlListId
		SET @rowsAffected = @rowsAffected + @@ROWCOUNT
	END

	-- Check for logical business errors here
	IF @rowsAffected <> 2
		RAISERROR (50017, 11, 1, '[Security].[spRevokePermission]')
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
