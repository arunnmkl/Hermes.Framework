SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [Security].[FindLoginProvider] @loginProvider VARCHAR(50),
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
