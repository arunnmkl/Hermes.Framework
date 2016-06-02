SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Security].[RoleExists]
(
	@RoleName varchar(50)
)
AS
	SELECT CAST(1 as bit) FROM [Security].[Role] WHERE Name = @RoleName




GO
