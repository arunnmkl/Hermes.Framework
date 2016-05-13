SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE    VIEW [dbo].[UserRoleSecurityId] 
WITH SCHEMABINDING
AS
     SELECT U.SecurityId AS UserSecurityId,
            R.SecurityId AS RoleSecurityId,
            U.UserId
     FROM dbo.[User] U
          INNER JOIN dbo.UserRole UR ON U.UserId = UR.UserId
          INNER JOIN dbo.[Role] R ON UR.RoleId = R.RoleId;





GO
CREATE UNIQUE CLUSTERED INDEX [IX_UserRoleSecurityId] ON [dbo].[UserRoleSecurityId] ([UserId], [UserSecurityId], [RoleSecurityId]) ON [PRIMARY]
GO
