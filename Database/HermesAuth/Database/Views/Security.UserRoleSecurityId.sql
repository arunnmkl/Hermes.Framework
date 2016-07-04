SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



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






GO
CREATE UNIQUE CLUSTERED INDEX [IX_UserRoleSecurityId] ON [Security].[UserRoleSecurityId] ([UserId], [UserSecurityId], [RoleSecurityId]) ON [PRIMARY]
GO
