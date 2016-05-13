SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ListSecurityRolesByUserName](@UserName VARCHAR(50))
AS
     SELECT R.RoleID,
            R.SecurityId,
            R.Name
     FROM dbo.[Role] R
          INNER JOIN dbo.[UserRole] UR ON R.RoleId = UR.RoleId
          INNER JOIN dbo.[User] U ON UR.UserId = U.UserId
     WHERE U.Username = @UserName;


GO
