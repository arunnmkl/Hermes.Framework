
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [Security].[ListSecurityRolesByUserName](@UserName VARCHAR(50))
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
