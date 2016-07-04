
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [Security].[GetUserSecurityIdRelatedSecurityIds]
(@userSecurityId UNIQUEIDENTIFIER
)
RETURNS TABLE
AS
     RETURN
(
    -- User
    SELECT @userSecurityId AS SecurityId,
           'User' AS SecurityIdType
    UNION ALL
    -- Users's Roles
    SELECT RoleSecurityId,
           'User Role' AS SecurityIdType
    FROM [Security].UserRoleSecurityId
    WHERE UserSecurityId = @userSecurityId
);

GO
