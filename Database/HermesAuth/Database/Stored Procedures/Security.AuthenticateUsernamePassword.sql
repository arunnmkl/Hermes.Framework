SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [Security].[AuthenticateUsernamePassword](@Username VARCHAR(50),
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
