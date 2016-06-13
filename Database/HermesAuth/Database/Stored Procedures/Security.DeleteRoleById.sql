SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author: Parul
-- Create date: 7 June 2016
-- Description:	Procedure to delete a role by id
-- EXEC [Security].DeleteRoleById 2
-- =============================================
CREATE PROCEDURE [Security].[DeleteRoleById] (@roleId BIGINT)
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
