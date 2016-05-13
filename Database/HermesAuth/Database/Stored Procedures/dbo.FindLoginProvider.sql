SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FindLoginProvider] @loginProvider VARCHAR(50),
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
             FROM [dbo].[UserLoginProvider] ulp
             WHERE ulp.LoginProvider = @loginProvider
                   AND ulp.ProviderKey = @providerKey
         ); 
	    SET @username =
         (
             SELECT [Username]
             FROM [dbo].[User] u
             WHERE u.UserId = @userId
         );
         SELECT U.[UserId],
                U.[SecurityId],
                U.[Username]
         FROM dbo.[User] AS U
         WHERE U.UserId = @userId
               AND U.[Enabled] = 1;

         SELECT DISTINCT
                r.RoleId,
                r.SecurityId,
                r.[Name]
         FROM dbo.[Role] AS r
              INNER JOIN dbo.UserRole AS ur ON ur.RoleId = r.RoleId
              INNER JOIN dbo.[User] AS u ON u.UserId = ur.UserId
         WHERE U.UserId = @userId
               AND U.[Enabled] = 1;

         -- Login Provider
         SELECT ulp.[LoginProvider],
                ulp.[ProviderKey],
                ulp.[UserId]
         FROM dbo.[User] AS U
              INNER JOIN dbo.[UserLoginProvider] AS ulp ON ulp.UserId = U.UserId
         WHERE U.UserId = @userId
               AND U.[Enabled] = 1;
     END;
GO
