SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AuthenticateUsernamePassword](@Username VARCHAR(50),
                                                     @Password VARCHAR(50))
AS
     BEGIN
         --DECLARE @GroupList TABLE (RoleId BIGINT, SecurityId UNIQUEIDENTIFIER, [Name] VARCHAR(50));

         SELECT U.[UserId],
                U.[SecurityId],
                U.[Username]
         FROM dbo.[User] AS U
         WHERE U.Username = @Username
               AND U.[Password] = @Password
               AND U.[Enabled] = 1;

         --INSERT INTO @GroupList (RoleId, SecurityId, [Name])
         SELECT DISTINCT
                r.RoleId,
                r.SecurityId,
                r.[Name]
         FROM dbo.[Role] AS r
              INNER JOIN dbo.UserRole AS ur ON ur.RoleId = r.RoleId
              INNER JOIN dbo.[User] AS u ON u.UserId = ur.UserId
         WHERE u.Username = @Username
               AND U.[Enabled] = 1;

         -- Login Provider
         SELECT ulp.[LoginProvider],
                ulp.[ProviderKey],
                ulp.[UserId]
         FROM dbo.[User] AS U
              INNER JOIN dbo.[UserLoginProvider] AS ulp ON ulp.UserId = U.UserId
         WHERE U.Username = @Username
               AND U.[Enabled] = 1;
     END;
GO
